---
area: "16 Fast Game Kit"
cluster: "Starter Code"
tags: [fast-game-kit, roblox, starter-code, remotes, security]
cssclasses: [tg-a16]
verified: 2026-10-25
---

# Starter Code - 05 Remotes Layer

## Why this matters
Every remote is a door into your server, and exploiters call them with any arguments, as fast as they like. Checking types and rate in each handler by hand means one forgotten check per game.
`Remotes` creates every `RemoteEvent` / `RemoteFunction` by name in one folder and wraps each server handler with argument validators and a per-player token-bucket limit, so a handler only ever sees well-formed, paced calls.

## What every incoming call goes through

1. **Rate limit**: a token bucket per player per remote (`rate` tokens per second, up to `burst`). Over the limit: dropped silently.
2. **Argument count**: more arguments than validators: rejected (hand-crafted calls often add extras).
3. **Argument checks**: each validator must accept its argument. `Check.String` also rejects invalid UTF-8 (which would make a later data store write fail); `Check.Number` / `Check.Integer` reject `NaN` and `inf`.
4. **Handler**: for `OnInvoke`, errors are caught and the client gets `nil` instead of a server stack trace.

In Studio, rejected calls print a warning so you see them while testing; live servers stay quiet.

## The code

`Source/src/shared/Remotes.luau`

```lua
--!strict
-- Remotes: the one place that creates, guards and calls every RemoteEvent / RemoteFunction.
-- Server: Remotes.Server.OnEvent / OnInvoke register a remote with argument checks and a
--         per-player token-bucket rate limit. Remotes.Server.Fire / FireAll talk to clients.
-- Client: Remotes.Client.Fire / Invoke / On.
-- Remote instances live in ReplicatedStorage.Remotes and are created only by the server.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local FOLDER_NAME = "Remotes"
local CLIENT_WAIT_SECONDS = 15
local DEFAULT_RATE = 2 -- tokens added per second
local DEFAULT_BURST = 5 -- bucket size: max calls in a quick burst
local IS_SERVER = RunService:IsServer()

export type Validator = (value: any) -> boolean

export type Spec = {
	args: { Validator }, -- one validator per argument, in order; extra arguments are rejected
	rate: number?,
	burst: number?,
}

----------------------------------------------------------------------
-- Argument validators (use them in Spec.args)
----------------------------------------------------------------------

local function isFiniteNumber(value: any): boolean
	return type(value) == "number" and value == value and value ~= math.huge and value ~= -math.huge
end

local Check = {}

-- A valid UTF-8 string of at most maxLength bytes.
function Check.String(maxLength: number): Validator
	return function(value: any): boolean
		return type(value) == "string" and #value <= maxLength and utf8.len(value) ~= nil
	end
end

-- A finite number (no NaN, no inf) within [min, max].
function Check.Number(min: number, max: number): Validator
	return function(value: any): boolean
		return isFiniteNumber(value) and value >= min and value <= max
	end
end

-- A whole number within [min, max].
function Check.Integer(min: number, max: number): Validator
	return function(value: any): boolean
		return isFiniteNumber(value) and value >= min and value <= max and math.floor(value) == value
	end
end

function Check.Boolean(): Validator
	return function(value: any): boolean
		return type(value) == "boolean"
	end
end

-- One of a fixed list of strings (item keys, setting names...).
function Check.OneOf(allowed: { string }): Validator
	local set: { [string]: boolean } = {}
	for _, name in allowed do
		set[name] = true
	end
	return function(value: any): boolean
		return type(value) == "string" and set[value] == true
	end
end

-- nil, or whatever the inner validator accepts.
function Check.Optional(inner: Validator): Validator
	return function(value: any): boolean
		return value == nil or inner(value)
	end
end

----------------------------------------------------------------------
-- Folder and instance lookup
----------------------------------------------------------------------

local cachedFolder: Folder? = nil

local function getFolder(): Folder
	if cachedFolder then
		return cachedFolder
	end
	local folder: Folder
	if IS_SERVER then
		local existing = ReplicatedStorage:FindFirstChild(FOLDER_NAME)
		if existing and existing:IsA("Folder") then
			folder = existing
		else
			folder = Instance.new("Folder")
			folder.Name = FOLDER_NAME
			folder.Parent = ReplicatedStorage
		end
	else
		local found = ReplicatedStorage:WaitForChild(FOLDER_NAME, CLIENT_WAIT_SECONDS)
		if not (found and found:IsA("Folder")) then
			error("[Remotes] ReplicatedStorage." .. FOLDER_NAME .. " not found: is the server Bootstrap running?")
		end
		folder = found
	end
	cachedFolder = folder
	return folder
end

local function serverEvent(name: string): RemoteEvent
	local folder = getFolder()
	local existing = folder:FindFirstChild(name)
	if existing then
		if existing:IsA("RemoteEvent") then
			return existing
		end
		error("[Remotes] " .. name .. " already exists as a " .. existing.ClassName)
	end
	local remote = Instance.new("RemoteEvent")
	remote.Name = name
	remote.Parent = folder
	return remote
end

local function serverFunction(name: string): RemoteFunction
	local folder = getFolder()
	local existing = folder:FindFirstChild(name)
	if existing then
		if existing:IsA("RemoteFunction") then
			return existing
		end
		error("[Remotes] " .. name .. " already exists as a " .. existing.ClassName)
	end
	local remote = Instance.new("RemoteFunction")
	remote.Name = name
	remote.Parent = folder
	return remote
end

local function clientRemote(name: string): Instance
	local remote = getFolder():WaitForChild(name, CLIENT_WAIT_SECONDS)
	if not remote then
		error("[Remotes] " .. name .. " not found: register it on the server first")
	end
	return remote
end

----------------------------------------------------------------------
-- Rate limiting (server)
----------------------------------------------------------------------

type Bucket = { tokens: number, updated: number }
local buckets: { [Player]: { [string]: Bucket } } = {}

local function allow(player: Player, name: string, rate: number, burst: number): boolean
	local perPlayer = buckets[player]
	if not perPlayer then
		perPlayer = {}
		buckets[player] = perPlayer
	end
	local now = os.clock()
	local bucket = perPlayer[name]
	if not bucket then
		bucket = { tokens = burst, updated = now }
		perPlayer[name] = bucket
	end
	bucket.tokens = math.min(burst, bucket.tokens + (now - bucket.updated) * rate)
	bucket.updated = now
	if bucket.tokens < 1 then
		return false
	end
	bucket.tokens -= 1
	return true
end

local function argsValid(spec: Spec, count: number, args: { any }): boolean
	if count > #spec.args then
		return false -- extra arguments are a sign of a hand-crafted call
	end
	for index, validator in spec.args do
		if not validator(args[index]) then
			return false
		end
	end
	return true
end

local function reject(player: Player, name: string, why: string)
	if RunService:IsStudio() then
		warn(("[Remotes] rejected %s from %s: %s"):format(name, player.Name, why))
	end
end

if IS_SERVER then
	getFolder()
	Players.PlayerRemoving:Connect(function(player: Player)
		buckets[player] = nil
	end)
end

----------------------------------------------------------------------
-- Server API
----------------------------------------------------------------------

local Server = {}
local boundFunctions: { [string]: boolean } = {}

-- Client -> server event. The handler only runs for calls that pass the rate limit and checks.
function Server.OnEvent(name: string, spec: Spec, handler: (Player, ...any) -> ()): RBXScriptConnection
	assert(IS_SERVER, "Remotes.Server is server-only")
	local remote = serverEvent(name)
	local rate = spec.rate or DEFAULT_RATE
	local burst = spec.burst or DEFAULT_BURST
	return remote.OnServerEvent:Connect(function(player: Player, ...: any)
		if not allow(player, name, rate, burst) then
			reject(player, name, "rate limit")
			return
		end
		if not argsValid(spec, select("#", ...), { ... }) then
			reject(player, name, "bad arguments")
			return
		end
		handler(player, ...)
	end)
end

-- Client -> server request with a reply. Errors in the handler are caught and return nil.
function Server.OnInvoke(name: string, spec: Spec, handler: (Player, ...any) -> ...any)
	assert(IS_SERVER, "Remotes.Server is server-only")
	assert(not boundFunctions[name], "[Remotes] " .. name .. " already has a handler")
	boundFunctions[name] = true
	local remote = serverFunction(name)
	local rate = spec.rate or DEFAULT_RATE
	local burst = spec.burst or DEFAULT_BURST
	remote.OnServerInvoke = function(player: Player, ...: any): ...any
		if not allow(player, name, rate, burst) then
			reject(player, name, "rate limit")
			return nil
		end
		if not argsValid(spec, select("#", ...), { ... }) then
			reject(player, name, "bad arguments")
			return nil
		end
		local results = table.pack(pcall(handler, player, ...))
		if not results[1] then
			warn(("[Remotes] %s handler error: %s"):format(name, tostring(results[2])))
			return nil
		end
		return table.unpack(results, 2, results.n)
	end
end

-- Create a server -> client event up front so clients can connect before the first Fire.
function Server.Declare(name: string)
	assert(IS_SERVER, "Remotes.Server is server-only")
	serverEvent(name)
end

function Server.Fire(name: string, player: Player, ...: any)
	assert(IS_SERVER, "Remotes.Server is server-only")
	serverEvent(name):FireClient(player, ...)
end

function Server.FireAll(name: string, ...: any)
	assert(IS_SERVER, "Remotes.Server is server-only")
	serverEvent(name):FireAllClients(...)
end

----------------------------------------------------------------------
-- Client API
----------------------------------------------------------------------

local Client = {}

function Client.Fire(name: string, ...: any)
	assert(not IS_SERVER, "Remotes.Client is client-only")
	local remote = clientRemote(name)
	if remote:IsA("RemoteEvent") then
		remote:FireServer(...)
	else
		error("[Remotes] " .. name .. " is not a RemoteEvent")
	end
end

-- Returns (true, ...results) or (false, errorMessage). Never throws.
function Client.Invoke(name: string, ...: any): (boolean, ...any)
	assert(not IS_SERVER, "Remotes.Client is client-only")
	local args = table.pack(...)
	return pcall(function(): ...any
		local remote = clientRemote(name)
		if not remote:IsA("RemoteFunction") then
			error("[Remotes] " .. name .. " is not a RemoteFunction")
		end
		return remote:InvokeServer(table.unpack(args, 1, args.n))
	end)
end

function Client.On(name: string, handler: (...any) -> ()): RBXScriptConnection
	assert(not IS_SERVER, "Remotes.Client is client-only")
	local remote = clientRemote(name)
	if not remote:IsA("RemoteEvent") then
		error("[Remotes] " .. name .. " is not a RemoteEvent")
	end
	return remote.OnClientEvent:Connect(handler)
end

return {
	Check = Check,
	Server = Server,
	Client = Client,
}
```

## How to use

**Server (in a service's `Start`):**

```lua
local Remotes = require(ReplicatedStorage.Shared.Remotes)
local Check = Remotes.Check

-- Client -> server, no reply. Two numbers in range, at most 4 per second (burst 8).
Remotes.Server.OnEvent("PlaceBlock", { args = { Check.Integer(1, 64), Check.Integer(1, 64) }, rate = 4, burst = 8 },
	function(player: Player, x: number, z: number)
		-- x and z are guaranteed whole numbers 1..64 here
	end)

-- Client -> server with a reply.
Remotes.Server.OnInvoke("Equip", { args = { Check.OneOf({ "Sword", "Bow" }) } }, function(player: Player, item: string)
	return { ok = true }
end)

-- Server -> client.
Remotes.Server.Declare("Notify") -- create early so clients can connect first
Remotes.Server.Fire("Notify", player, "Hello")
Remotes.Server.FireAll("Notify", "Round starting")
```

**Client:**

```lua
local Remotes = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Remotes"))
Remotes.Client.Fire("PlaceBlock", 10, 12)
local ok, result = Remotes.Client.Invoke("Equip", "Sword") -- never throws; ok = false on failure
Remotes.Client.On("Notify", function(message) print(message) end)
```

Validators available: `Check.String(maxLength)`, `Check.Number(min, max)`, `Check.Integer(min, max)`, `Check.Boolean()`, `Check.OneOf({ ... })`, `Check.Optional(validator)`. A validator is any `(value) -> boolean`, so you can write your own (for example, "is a Player in this server").

**Choosing limits:** a button press is fine at `rate = 1-2`, `burst = 3-5`. Anything guessable (codes) should be strict (`rate = 0.2`). The engine's own limit is about 500 remote requests per second per client, shared by all remotes of the same type, so your limits are always the tighter ones.

## Common mistakes

- **Trusting anything from the client:** prices, amounts, "I hit this enemy", item IDs. Send intent ("buy SpeedCoil"), decide on the server.
- **`InvokeClient` from the server.** A client can hang it forever or error it. This layer has no server-to-client invoke on purpose; use events.
- **Instances as arguments.** They can be `nil` (streaming), belong to someone else, or be swapped. Validate ownership and existence ([[Instance Arguments Over Remotes - Nil, Streaming and Ownership Checks]]).
- **Tables from the client without a schema.** Non-string keys are converted to strings, mixed tables lose parts, and sizes are unbounded. Prefer flat, typed arguments.
- **Creating remotes from the client.** They would only exist on that client. The server creates them all.
- **One remote per action with no limit** (or one giant remote with a "type" string and no per-type limit). Here each name has its own bucket.

## Checklist

- [ ] Every client-callable remote goes through `Remotes.Server.OnEvent` / `OnInvoke` with a validator per argument.
- [ ] Limits set per remote; guessable ones strict.
- [ ] Spam test (fire 1,000 times in a loop from the client): server stays responsive, no grants beyond the limit.
- [ ] Bad-input test: wrong types, `NaN`, huge strings, extra arguments: all rejected, nothing errors.
- [ ] No `InvokeClient` anywhere.

**Related:** [[Starter Code - Hub]] · [[Remote Rate Limiting Pattern]] · [[Remote Type and Allowlist Validation]] · [[Remote Payload Validation]] · [[Recipe - Server-Side Cooldowns and Rate Limits]] · [[RemoteEvent vs UnreliableRemoteEvent vs Attributes vs ValueObjects]] · [[Remote events and callbacks]]
