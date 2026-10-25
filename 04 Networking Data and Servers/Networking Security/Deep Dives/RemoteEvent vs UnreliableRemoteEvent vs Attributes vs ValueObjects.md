---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
title: "RemoteEvent vs UnreliableRemoteEvent vs Attributes vs ValueObjects"
tags: [deep-dive, roblox, networking, remoteevent, unreliableremoteevent, attributes, replication]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# RemoteEvent vs UnreliableRemoteEvent vs Attributes vs ValueObjects

**Why this matters:** Roblox gives you four ways to get data from server to client, and choosing the wrong one causes lag spikes, out-of-order bugs, leaked private data or wasted bandwidth that no amount of optimisation later will fix.
This note is a decision guide grounded in the documented delivery guarantees, with the edge cases that the official pages mention only in passing.

---

## 1. The short answer

| You are sending... | Use | Why |
| --- | --- | --- |
| A one-off **event** that must arrive (purchase result, "you leveled up", round started) | `RemoteEvent` | Reliable and ordered. |
| A **request** from client to server (buy, equip, ability) | `RemoteEvent` (client -> server), reply with another `RemoteEvent` | Never block a server thread on the client. |
| **Continuous, replaceable** data (aim direction, cursor, cosmetic positions, voice-like streams) | `UnreliableRemoteEvent` | Old values are worthless once a newer one exists; dropping is fine. |
| **Current state** that late joiners also need (door open, team score, NPC health shown to all) | **Attribute** on the relevant instance | Replicates automatically, including to players who join later. |
| State that needs an **Instance reference** or its own instance (target of a lock-on, selected unit) | `ObjectValue` (a ValueObject) | Attributes cannot hold Instances. |
| **Private per-player** state (inventory, quest progress) | `RemoteEvent` to that player, or values under that player's `PlayerGui`/`PlayerScripts` folder | Attributes on `Player` replicate to **every** client. |

---

## 2. Delivery guarantees, from the docs

**RemoteEvent** (Roblox remote events guide):

- **Reliable**: lost messages are retransmitted while the recipient stays connected.
- **Ordered, including across different RemoteEvent instances**, per connection and direction. Server fires A, B, A to a client -> client receives A, B, A.
- If a client fires faster than the throttle, the **server processes the excess later** (delayed, still ordered), not dropped.
- If no handler is connected, messages **queue** (limited in count and memory) and are delivered when a handler connects; once full, they are discarded with a "Remote event invocation" error.
- Ordering applies to when handlers **start**. If a handler yields, the next message's handler can start before the first finishes.

**RemoteFunction**:

- Reliable, but a **separate ordering domain** from RemoteEvents. Roblox explicitly does not guarantee relative order between RemoteFunction invocations and RemoteEvent messages.
- `InvokeServer`/`InvokeClient` yield until a response. A client can simply never respond to `InvokeClient`, parking your server thread forever. Avoid `InvokeClient` in production code.

**UnreliableRemoteEvent**:

- **No delivery and no ordering guarantees**, and no ordering relationship with RemoteEvents or RemoteFunctions.
- Dropped when lost in transit, when the network is congested, when the **payload exceeds 1,000 bytes**, when the client exceeds the throttle (dropped, unlike RemoteEvent's delay), or when **no handler is connected** (discarded immediately, no queue).
- Messages can arrive out of order; include a sequence number or timestamp and ignore older ones ([[Buffers and Bit Packing for Network Payloads]]).

**Throttle**: RemoteEvents and UnreliableRemoteEvents both have a client-to-server limit of approximately **500 requests per second per client, shared across all remotes of the same type** (RemoteEvent reference, as of 2026; check the docs). If you have 30 remotes each firing 20 times per second from one client, you are already at 600.

**Properties and attributes**:

- Replicate **server to client** only. A client setting an attribute changes it locally and nothing else.
- The engine **does not guarantee the order** between property replication and remote events. The attributes doc gives this exact example: if the server changes a property and then calls `FireAllClients`, the client may see the change before or after `OnClientEvent` fires.
- Treat replicated properties as **state, not events**. If you set an attribute three times in one frame, do not assume the client observes all three values.

---

## 3. The ordering trap, and how to avoid it

A typical bug:

```luau
-- SERVER (buggy assumption)
door:SetAttribute("Open", true)
doorOpenedRemote:FireAllClients(door)

-- CLIENT
doorOpenedRemote.OnClientEvent:Connect(function(door)
	-- May run BEFORE the attribute has replicated: Open is still false here.
	if door:GetAttribute("Open") then
		playCreak(door)
	end
end)
```

Fixes, in order of preference:

1. **Put everything the client needs in the remote payload** (`FireAllClients(door, true)`), and let the attribute be only for late joiners.
2. **Drive the effect from the attribute** itself with `GetAttributeChangedSignal("Open")`, and drop the remote.
3. Never mix the two for one fact.

Pick one source of truth per fact: *state* lives in attributes; *moments* travel in remotes.

---

## 4. Attributes vs ValueObjects

| | Attributes | ValueObjects (`IntValue`, `StringValue`, `ObjectValue`, ...) |
| --- | --- | --- |
| Is an Instance? | No, stored on the instance | Yes, a child instance |
| Memory/instance count | Cheaper; no extra instance | One instance per value (counts toward instance budgets, [[Instance Count and Part Budgets]]) |
| Can hold Instance references | **No** | Yes (`ObjectValue`) |
| Supported types | Strings, numbers, booleans and many Roblox datatypes (Vector3, Color3, CFrame, UDim2, ranges, sequences, fonts...); see the attributes docs for the full list | One type per class |
| Change signal | `GetAttributeChangedSignal(name)`, `AttributeChanged` | `.Changed` (fires with the new value) |
| Visible in Studio | Properties > Attributes | Explorer children |
| Taggable / can have its own attributes | No | Yes |
| Typical use | Config and runtime state on parts, NPCs, tools | Legacy leaderstats, instance references, values other scripts discover by name |

Use attributes by default. Use `ObjectValue` when you need an instance reference. Keep `leaderstats` as ValueObjects because the default player list reads them that way.

---

## 5. Privacy: what replicates to whom

| Location | Who receives it |
| --- | --- |
| Attributes/values on a `Player` object | **All clients** (the Player instance replicates to everyone) |
| Attributes on a character model | All clients that have it streamed in |
| `ReplicatedStorage` | All clients |
| A player's `PlayerGui` (and `Backpack`, `PlayerScripts` contents created by the server) | That player only |
| `ServerStorage`, `ServerScriptService` | No clients |
| `RemoteEvent:FireClient(player, ...)` | That player only |

So "put coins as an attribute on the Player" is fine (everyone seeing coins is usually acceptable), but putting a hidden-role flag ("isImpostor") on the Player leaks it to every exploiter. Send secrets with `FireClient` to the one player who should know.

---

## 6. Argument rules that bite (all remote types)

From the remote events guide's argument limitations:

- **Non-string table keys are converted to strings.** `{ [workspace.Baseplate] = true }` arrives keyed by a string. Use arrays of pairs instead.
- **Functions are not sent**; they arrive as `nil`.
- **Mixed tables** (array part and dictionary part together) and sparse arrays do not survive reliably; send either a clean array or a string-keyed dictionary.
- **Metatables are lost**; class instances arrive as plain tables.
- **Instances the receiver cannot see arrive as `nil`**: server-only instances (ServerStorage) or parts not streamed in on that client.

The last point matters with StreamingEnabled: `FireClient(player, someNpcModel)` arrives as `nil` if that NPC has not streamed to that player. Send an ID and let the client resolve it ([[StreamingEnabled Gotchas and Streaming-Safe Client Code]]).

---

## 7. A small, typed request/response pattern without RemoteFunction

```luau
--!strict
-- Shared/Net/Request.luau (client side)
local HttpService = game:GetService("HttpService")

local pending: { [string]: thread } = {}
local requestRemote: RemoteEvent? = nil

local Request = {}

function Request.init(request: RemoteEvent, response: RemoteEvent)
	requestRemote = request
	response.OnClientEvent:Connect(function(requestId: unknown, ok: unknown, result: unknown)
		if typeof(requestId) ~= "string" then
			return
		end
		local thread = pending[requestId]
		if thread then
			pending[requestId] = nil
			task.spawn(thread, ok == true, result)
		end
	end)
end

function Request.send(action: string, payload: any, timeout: number?): (boolean, any)
	local remote = requestRemote
	assert(remote, "Request.init must be called first")
	local id = HttpService:GenerateGUID(false)
	pending[id] = coroutine.running()
	task.delay(timeout or 10, function()
		local thread = pending[id]
		if thread then
			pending[id] = nil
			task.spawn(thread, false, "timeout")
		end
	end)
	remote:FireServer(id, action, payload)
	return coroutine.yield()
end

return Request
```

The server handler validates `action` against an allowlist, validates the payload, does the work, and replies with `responseRemote:FireClient(player, id, ok, result)`. Benefits over `RemoteFunction`: the server never yields on a client, timeouts are explicit, and all traffic shares RemoteEvent ordering.

---

## 8. Bandwidth rules of thumb

- **Send changes, not state, for high-frequency data**; send full state on join and on resync.
- **Coalesce**: if ten things change in one frame, send one remote with ten entries, not ten remotes.
- **Lower the rate before shrinking the payload**: 10-20 Hz with client interpolation looks smooth for most non-player entities.
- **Attributes that change every frame are expensive**; each change replicates. Prefer an unreliable snapshot for continuously moving values and attributes for discrete state.
- **Measure**: Developer Console network view and `Stats.DataSendKbps` on the server under a full lobby ([[Performance Audit Procedure]]).

---

## Common mistakes

- Using `RemoteFunction:InvokeClient` and letting a malicious client hang server threads.
- Expecting a remote and an attribute change sent together to arrive in a fixed order.
- Putting secret or competitive information in attributes on the Player object.
- Sending instances through remotes that the receiver has not streamed in.
- Firing per-frame data through a reliable RemoteEvent, so packet loss causes catch-up bursts and latency.
- Sending UnreliableRemoteEvent payloads near the 1,000-byte cap and losing them silently.
- One remote per tiny action, multiplying throttle usage and handler code.
- Tables with Instance keys or mixed array/dictionary parts.

## Checklist

- [ ] Each replicated fact has exactly one channel: state -> attribute/value, moment -> remote, stream -> unreliable.
- [ ] No `InvokeClient` in production; requests use event pairs with timeouts.
- [ ] Unreliable payloads carry sequence numbers and stay well below 1,000 bytes.
- [ ] Nothing secret is stored on Player, character or ReplicatedStorage.
- [ ] Remotes send IDs, not instances, for anything that might be streamed out.
- [ ] Client fire rates summed across all remotes stay far below the ~500/s throttle.
- [ ] Bandwidth measured in a full server.

**Related:** [[Networking Security - Hub]] · [[Network Protocol and Server Authority]] · [[Remote Payload Validation]] · [[Remote Rate Limiting Pattern]] · [[Network Ownership and Physics Replication]]
