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
