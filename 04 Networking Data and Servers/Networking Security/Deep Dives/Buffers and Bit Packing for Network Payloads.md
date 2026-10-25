---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
title: "Buffers and Bit Packing for Network Payloads"
tags: [deep-dive, roblox, networking, buffer, bit-packing, bandwidth]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Buffers and Bit Packing for Network Payloads

**Why this matters:** when you replicate 60 NPCs ten times a second, or send aim data through an `UnreliableRemoteEvent` with its 1,000-byte cap, the shape of the payload decides whether the game fits the network budget.
Luau's `buffer` type lets you pack exactly the bits you need, with the same layout on server and client, and this note gives a tested writer/reader, quantisation helpers, and the validation rules for buffers that come from clients.

Do not start here. Measure first ([[Performance and Profiling]]), and see [[RemoteEvent vs UnreliableRemoteEvent vs Attributes vs ValueObjects]] for whether a remote is even the right channel.

---

## 1. What the `buffer` type is

From the Luau `buffer` library reference:

- A **fixed-size, mutable block of bytes**, created with `buffer.create(size)` (zero-filled) or `buffer.fromstring(s)`. Maximum size is **1 GiB**.
- Read/write functions for `i8/u8`, `i16/u16`, `i32/u32`, `f32`, `f64`, strings (`readstring`/`writestring`), plus `copy`, `fill`, `len`, `tostring`.
- **Little-endian** for all multi-byte reads and writes.
- **Bit-level access**: `buffer.writebits(b, bitOffset, bitCount, value)` and `buffer.readbits(b, bitOffset, bitCount)`, with `bitCount` from 0 to 32. Value is treated as an unsigned 32-bit number and only the low `bitCount` bits are written.
- Any read or write outside the buffer's bounds **throws an error**. This is your friend when parsing untrusted data.
- Buffers can be passed through RemoteEvents (Roblox encodes and compresses certain types including buffers, so the on-wire size is not exactly `buffer.len`) and can be **stored in DataStores** (listed in the DataStore serialization docs).
- Buffer-heavy math is a good candidate for **native code generation** on the server ([[Script Profiler, Native Code Gen and Luau Hot Paths]]).

---

## 2. When packing is worth it

| Situation | Worth packing? |
| --- | --- |
| A purchase request once per click | No. Send a small table; clarity wins. |
| Chat, UI events, inventory changes | No. |
| Per-frame aim direction or input over `UnreliableRemoteEvent` | Often yes (stay well under 1,000 bytes and reduce bandwidth). |
| Server-driven NPC/projectile snapshots for many entities | Yes. This is the classic case. |
| Large saved blobs (building layouts, voxel edits) | Yes, storage and throughput limits are per byte ([[DataStore Session Locking, Retries, Versioning and Erasure]]). |

Rule: only pack data that is **high-frequency or high-volume**, after measuring with the Developer Console network stats or `Stats.DataSendKbps` / `Stats.DataReceiveKbps`.

---

## 3. Byte-level packing (start here)

Most of the win comes from fixed-width fields, before you ever touch bits.

```luau
--!strict
-- A projectile spawn message: id, origin, direction, speed, weapon type.
-- Table version: many keys + type tags. Buffer version: 2+12+6+2+1 = 23 bytes.

local function packProjectile(id: number, origin: Vector3, dir: Vector3, speed: number, weapon: number): buffer
	local b = buffer.create(23)
	buffer.writeu16(b, 0, id)              -- 0..65535, wraps
	buffer.writef32(b, 2, origin.X)
	buffer.writef32(b, 6, origin.Y)
	buffer.writef32(b, 10, origin.Z)
	-- Unit direction: each component in [-1, 1] -> i16 with 1/32767 precision.
	buffer.writei16(b, 14, math.round(dir.X * 32767))
	buffer.writei16(b, 16, math.round(dir.Y * 32767))
	buffer.writei16(b, 18, math.round(dir.Z * 32767))
	buffer.writeu16(b, 20, math.clamp(math.round(speed), 0, 65535))
	buffer.writeu8(b, 22, weapon)
	return b
end

local function unpackProjectile(b: buffer)
	local origin = Vector3.new(buffer.readf32(b, 2), buffer.readf32(b, 6), buffer.readf32(b, 10))
	local dir = Vector3.new(
		buffer.readi16(b, 14) / 32767,
		buffer.readi16(b, 16) / 32767,
		buffer.readi16(b, 18) / 32767
	)
	return buffer.readu16(b, 0), origin, dir.Unit, buffer.readu16(b, 20), buffer.readu8(b, 22)
end
```

Precision choices are **design decisions**: `f32` keeps full world positions; `i16` direction keeps about 0.003% error, invisible for a projectile. Writing them down in a comment is the protocol spec.

---

## 4. Bit-level writer and reader

When fields are small (booleans, states with 5 values, 10-bit angles), bits beat bytes.

```luau
--!strict
-- ReplicatedStorage/Shared/Net/Bits.luau
local Bits = {}

local Writer = {}
Writer.__index = Writer
export type Writer = typeof(setmetatable({} :: { buf: buffer, bit: number }, Writer))

function Bits.writer(initialBytes: number?): Writer
	return setmetatable({ buf = buffer.create(initialBytes or 64), bit = 0 }, Writer)
end

function Writer.write(self: Writer, value: number, bitCount: number)
	assert(bitCount >= 1 and bitCount <= 32, "bitCount 1..32")
	local neededBytes = (self.bit + bitCount + 7) // 8
	local cap = buffer.len(self.buf)
	if neededBytes > cap then
		local bigger = buffer.create(math.max(neededBytes, cap * 2))
		buffer.copy(bigger, 0, self.buf, 0, cap)
		self.buf = bigger
	end
	buffer.writebits(self.buf, self.bit, bitCount, value)
	self.bit += bitCount
end

function Writer.writeBool(self: Writer, v: boolean)
	self:write(if v then 1 else 0, 1)
end

-- Returns a buffer trimmed to the bytes actually used.
function Writer.finish(self: Writer): buffer
	local used = (self.bit + 7) // 8
	local out = buffer.create(used)
	buffer.copy(out, 0, self.buf, 0, used)
	return out
end

local Reader = {}
Reader.__index = Reader
export type Reader = typeof(setmetatable({} :: { buf: buffer, bit: number, limit: number }, Reader))

function Bits.reader(b: buffer): Reader
	return setmetatable({ buf = b, bit = 0, limit = buffer.len(b) * 8 }, Reader)
end

function Reader.read(self: Reader, bitCount: number): number
	if self.bit + bitCount > self.limit then
		error("read past end of payload")
	end
	local v = buffer.readbits(self.buf, self.bit, bitCount)
	self.bit += bitCount
	return v
end

function Reader.readBool(self: Reader): boolean
	return self:read(1) == 1
end

-- Quantise a number in [min, max] to an unsigned integer of `bits` bits.
function Bits.quantize(value: number, min: number, max: number, bits: number): number
	local steps = 2 ^ bits - 1
	local t = math.clamp((value - min) / (max - min), 0, 1)
	return math.round(t * steps)
end

function Bits.dequantize(q: number, min: number, max: number, bits: number): number
	return min + (q / (2 ^ bits - 1)) * (max - min)
end

return Bits
```

`//` is Luau floor division. `writebits` handles fields that straddle byte boundaries for you, which is what makes this so much simpler than hand-rolled shifting with `bit32`.

---

## 5. Worked example: NPC snapshot that fits one unreliable packet

Per NPC we send: id (10 bits, up to 1,024 NPCs), X and Z position relative to an arena origin within +/-512 studs at 1/32-stud precision (15 bits each), Y within 0..256 at 1/16 stud (12 bits), yaw (10 bits, about 0.35 degree steps), animation state (3 bits, 8 states), and an "is attacking" flag (1 bit). Total **66 bits = 8.25 bytes** per NPC, versus dozens of bytes as a table.

```luau
--!strict
local Bits = require(game:GetService("ReplicatedStorage").Shared.Net.Bits)

local ARENA_ORIGIN = Vector3.new(0, 0, 0)
local XZ_RANGE = 512
local MAX_PER_PACKET = 100 -- 100 * 66 bits = 825 bytes + header, under the 1,000-byte cap

type NpcSnapshot = { id: number, position: Vector3, yaw: number, state: number, attacking: boolean }

local function encodeSnapshot(sequence: number, npcs: { NpcSnapshot }): buffer
	local w = Bits.writer(16 + #npcs * 9)
	w:write(sequence % 65536, 16)
	w:write(#npcs, 7) -- up to 127 entries
	for _, npc in npcs do
		local rel = npc.position - ARENA_ORIGIN
		w:write(npc.id, 10)
		w:write(Bits.quantize(rel.X, -XZ_RANGE, XZ_RANGE, 15), 15)
		w:write(Bits.quantize(rel.Y, 0, 256, 12), 12)
		w:write(Bits.quantize(rel.Z, -XZ_RANGE, XZ_RANGE, 15), 15)
		w:write(Bits.quantize(npc.yaw % (2 * math.pi), 0, 2 * math.pi, 10), 10)
		w:write(npc.state, 3)
		w:writeBool(npc.attacking)
	end
	return w:finish()
end

local function decodeSnapshot(b: buffer): (number, { NpcSnapshot })
	local r = Bits.reader(b)
	local sequence = r:read(16)
	local count = r:read(7)
	local out: { NpcSnapshot } = table.create(count)
	for i = 1, count do
		local id = r:read(10)
		local x = Bits.dequantize(r:read(15), -XZ_RANGE, XZ_RANGE, 15)
		local y = Bits.dequantize(r:read(12), 0, 256, 12)
		local z = Bits.dequantize(r:read(15), -XZ_RANGE, XZ_RANGE, 15)
		local yaw = Bits.dequantize(r:read(10), 0, 2 * math.pi, 10)
		out[i] = {
			id = id,
			position = ARENA_ORIGIN + Vector3.new(x, y, z),
			yaw = yaw,
			state = r:read(3),
			attacking = r:readBool(),
		}
	end
	return sequence, out
end
```

Server: split NPCs into packets of at most `MAX_PER_PACKET`, encode, `FireAllClients` on an `UnreliableRemoteEvent`. Client: decode and **interpolate** toward the newest snapshot ([[Latency, Prediction and Reconciliation]]).

Because unreliable messages can arrive out of order, the client drops stale ones using a wraparound-safe comparison:

```luau
local lastSeq = -1
local function isNewer(a: number, b: number): boolean
	if b < 0 then
		return true
	end
	local diff = (a - b) % 65536
	return diff ~= 0 and diff < 32768
end

snapshotRemote.OnClientEvent:Connect(function(payload)
	if typeof(payload) ~= "buffer" then
		return
	end
	local ok, seq, npcs = pcall(decodeSnapshot, payload)
	if not ok or not isNewer(seq, lastSeq) then
		return
	end
	lastSeq = seq
	-- apply npcs to interpolation targets
end)
```

Size check: the 1,000-byte limit applies to the encoded payload, and Roblox compresses some types, so measure in Studio (Output reports how many bytes an oversized unreliable event exceeded) and keep a safety margin.

---

## 6. Client-to-server buffers: validation rules

Exploiters can send any buffer of any length with any bits. The bounds-checked reads help, but you still need policy:

```luau
local INPUT_BYTES = 5 -- u16 yaw, u16 pitch, u8 button bits

aimRemote.OnServerEvent:Connect(function(player: Player, payload: unknown)
	if typeof(payload) ~= "buffer" then
		return
	end
	local len = buffer.len(payload)
	if len ~= INPUT_BYTES then -- exact size for fixed-layout messages
		return
	end
	local ok, yawQ, pitchQ, buttons = pcall(function()
		return buffer.readu16(payload, 0), buffer.readu16(payload, 2), buffer.readu8(payload, 4)
	end)
	if not ok then
		return
	end
	-- Range checks still apply after decoding: dequantised values must be
	-- physically possible, and button bits outside the known mask are rejected.
	if bit32.band(buttons, bit32.bnot(0x1F)) ~= 0 then
		return
	end
end)
```

1. Check `typeof(payload) == "buffer"` first.
2. Enforce an **exact** length for fixed layouts, or a maximum for variable ones, **before** reading.
3. Wrap decoding in `pcall`; any out-of-bounds read becomes a dropped message, not a server error spam.
4. Validate decoded **values** (ranges, enums, NaN for floats: `x ~= x`).
5. Rate-limit as with any remote ([[Remote Rate Limiting Pattern]]).

---

## 7. Versioning the layout

A binary layout is a protocol. Changing field widths silently breaks clients still running an old build during a rolling update.

- Put a 4-bit or 8-bit **layout version** at the start of every packed message.
- Decoders reject unknown versions instead of misreading them.
- When saving packed blobs to DataStores, also store a version and keep old decoders for migration ([[Save Schema Migrations]], [[Remote Protocol Versioning]]).

---

## Common mistakes

- Packing everything, including rare UI messages, and making the code unreadable for no measurable gain.
- Forgetting that unreliable events arrive out of order and applying stale snapshots.
- Assuming `buffer.len` equals bytes on the wire; Roblox encodes and may compress.
- Quantising without clamping, so out-of-range values wrap into nonsense.
- Reading client buffers without a length check and `pcall`.
- Using `f32` for values that need integer exactness (currency, IDs).
- Changing a layout without a version field.
- Building strings with `..` per byte instead of using buffers (slow and garbage-heavy).

## Checklist

- [ ] Bandwidth measured before and after; packing is only on high-frequency or high-volume data.
- [ ] Each layout is documented: field, bits, range, precision.
- [ ] Quantisers clamp; ranges match the game's real limits.
- [ ] Unreliable payloads carry a wraparound-safe sequence number and stay under ~900 bytes.
- [ ] Client buffers: type check, length check, `pcall` decode, value validation, rate limit.
- [ ] Every packed message and saved blob starts with a layout version.

**Related:** [[Networking Security - Hub]] · [[Network Protocol and Server Authority]] · [[Remote Payload Validation]] · [[Latency, Prediction and Reconciliation]] · [[Remote Protocol Versioning]]
