--!strict
-- PlayerData: session-locked, versioned player saves. Every read and write uses UpdateAsync.
-- Stored value under key "u_<UserId>":
--   { schemaVersion, data, lock = { id, jobId, time }?, lastSaved, releasedBy? }
-- Same design as the vault deep dive "DataStore Session Locking, Retries, Versioning and Erasure".

local DataStoreService = game:GetService("DataStoreService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local ServerConfig = require(script.Parent.Parent.ServerConfig)
local DataTemplate = require(script.Parent.DataTemplate)

export type Data = DataTemplate.Data

export type Session = {
	player: Player,
	userId: number,
	lockId: string,
	data: Data,
	dirty: boolean,
	lost: boolean, -- another server took the lock: never save again
	released: boolean, -- final save done and lock released
	temporary: boolean, -- Studio fallback data: never saved
	writing: boolean, -- a write is in flight (writes for one session never overlap)
}

local AUTOSAVE_INTERVAL = 90 -- seconds; also refreshes the lock
local LOCK_EXPIRY = 600 -- seconds; must be several times AUTOSAVE_INTERVAL
local ACQUIRE_ATTEMPTS = 8
local ACQUIRE_WAIT = 4 -- seconds between lock attempts (old server may still be saving)
local SAVE_ATTEMPTS = 4
local SHUTDOWN_DEADLINE = 25 -- seconds; BindToClose gives 30 in total

local sessions: { [Player]: Session } = {}
local pendingReleases: { [Session]: boolean } = {}
local loadedCallbacks: { (Player, Session) -> () } = {}
local shuttingDown = false
local store: DataStore? = nil

local function getStore(): DataStore
	-- Created lazily inside a pcall: GetDataStore throws in Studio without API access.
	if not store then
		store = DataStoreService:GetDataStore(ServerConfig.DataStoreName)
	end
	return store :: DataStore
end

local function keyFor(userId: number): string
	return "u_" .. userId
end

local function deepCopy(value: any): any
	if type(value) ~= "table" then
		return value
	end
	local copy = {}
	for key, item in value do
		copy[key] = deepCopy(item)
	end
	return copy
end

-- Bounded exponential backoff with jitter. Only wrap operations that are safe to repeat
-- (full-state writes are; "add 100 coins to whatever is stored" is not).
local function retry(label: string, attempts: number, fn: () -> ...any): boolean
	local delaySeconds = 1
	for attempt = 1, attempts do
		local ok, err = pcall(fn)
		if ok then
			return true
		end
		warn(("[PlayerData] %s attempt %d/%d failed: %s"):format(label, attempt, attempts, tostring(err)))
		if attempt < attempts then
			-- During shutdown keep waits short so everything fits in the 30 s window.
			local cap = if shuttingDown then 1 else 16
			task.wait(math.min(delaySeconds, cap) + math.random() * 0.5)
			delaySeconds *= 2
		end
	end
	return false
end

type AcquireStatus = "ok" | "locked" | "newer" | "error"

local function tryAcquire(userId: number, lockId: string): (AcquireStatus, any)
	local status: AcquireStatus = "error"
	local result: any = nil
	local ok, err = pcall(function()
		result = getStore():UpdateAsync(keyFor(userId), function(old: any, keyInfo: DataStoreKeyInfo?)
			local now = os.time()
			-- old == nil only when the key truly does not exist: a real new player.
			local stored = old
				or { schemaVersion = DataTemplate.SCHEMA_VERSION, data = DataTemplate.new(), lastSaved = 0 }
			if (stored.schemaVersion or 1) > DataTemplate.SCHEMA_VERSION then
				status = "newer" -- saved by a newer server version: never load or overwrite it here
				return nil
			end
			local lock = stored.lock
			if lock and lock.id ~= lockId and (now - lock.time) < LOCK_EXPIRY then
				status = "locked" -- another live server holds this player; cancel the write
				return nil
			end
			stored.lock = { id = lockId, jobId = game.JobId, time = now }
			status = "ok"
			local metadata = if keyInfo then keyInfo:GetMetadata() else nil
			return stored, { userId }, metadata
		end)
	end)
	if not ok then
		warn("[PlayerData] load error for " .. userId .. ": " .. tostring(err))
		return "error", nil
	end
	return status, result
end

local function releaseLockOnly(userId: number, lockId: string)
	pcall(function()
		getStore():UpdateAsync(keyFor(userId), function(old: any)
			if old and old.lock and old.lock.id == lockId then
				old.lock = nil
				return old
			end
			return nil
		end)
	end)
end

-- Write the full in-memory state. Writes for one session are serialized, and the snapshot
-- is taken after any earlier write finishes, so an older snapshot can never land last.
local function write(session: Session, release: boolean): boolean
	while session.writing do
		task.wait(0.1)
	end
	if session.lost or session.released then
		return false
	end
	if session.temporary then
		if release then
			session.released = true
		end
		return true -- Studio fallback: nothing to save
	end
	session.writing = true
	session.dirty = false -- changes made from here on belong to the next write
	local snapshot = deepCopy(session.data) -- deep copy: nested tables may change while we yield
	local lostLock = false
	local alreadyReleased = false
	local ok = retry("save " .. session.userId, SAVE_ATTEMPTS, function()
		lostLock = false
		alreadyReleased = false
		getStore():UpdateAsync(keyFor(session.userId), function(old: any, keyInfo: DataStoreKeyInfo?)
			if release and old and old.lock == nil and old.releasedBy == session.lockId then
				-- An earlier attempt saved and released, but its reply was lost: done.
				alreadyReleased = true
				return nil
			end
			if not old or not old.lock or old.lock.id ~= session.lockId then
				lostLock = true
				return nil -- someone else owns this player now: do NOT overwrite
			end
			old.schemaVersion = DataTemplate.SCHEMA_VERSION
			old.data = snapshot
			old.lastSaved = os.time()
			if release then
				old.lock = nil
				old.releasedBy = session.lockId
			else
				old.lock = { id = session.lockId, jobId = game.JobId, time = os.time() }
			end
			local metadata = if keyInfo then keyInfo:GetMetadata() else nil
			return old, { session.userId }, metadata
		end)
	end)
	session.writing = false
	if not ok then
		session.dirty = true
	end
	if alreadyReleased then
		session.released = true
		return true
	end
	if lostLock then
		session.lost = true
		warn("[PlayerData] lock lost for " .. session.userId)
		if session.player.Parent == Players then
			session.player:Kick("Your data was opened in another server. Please rejoin.")
		end
		return false
	end
	if ok and release then
		session.released = true
	end
	return ok
end

local function newSession(player: Player, lockId: string, data: Data, dirty: boolean, temporary: boolean): Session
	return {
		player = player,
		userId = player.UserId,
		lockId = lockId,
		data = data,
		dirty = dirty,
		lost = false,
		released = false,
		temporary = temporary,
		writing = false,
	}
end

-- Returns the session, or nil plus the kick message to show.
local function load(player: Player): (Session?, string?)
	local lockId = HttpService:GenerateGUID(false)
	for _ = 1, ACQUIRE_ATTEMPTS do
		local status, stored = tryAcquire(player.UserId, lockId)
		if player.Parent ~= Players then
			-- Left while loading: give the lock back if we took it.
			if status == "ok" then
				task.spawn(releaseLockOnly, player.UserId, lockId)
			end
			return nil, nil
		end
		if status == "ok" then
			local data, migrated = DataTemplate.migrate(stored.schemaVersion or 1, stored.data)
			return newSession(player, lockId, data, migrated, false), nil
		elseif status == "newer" then
			return nil, "This server is out of date. Please rejoin to get the latest version."
		end
		-- "locked": the previous server is probably finishing its final save.
		-- "error": data stores degraded (or Studio without API access). Both: wait and retry.
		if status == "error" and RunService:IsStudio() and ServerConfig.StudioTempDataOnError then
			break
		end
		task.wait(ACQUIRE_WAIT)
	end
	if RunService:IsStudio() and ServerConfig.StudioTempDataOnError then
		warn("[PlayerData] Studio: using TEMPORARY data for " .. player.Name .. " (will not save)")
		return newSession(player, lockId, DataTemplate.new(), false, true), nil
	end
	return nil, "Could not load your data. Please rejoin in a minute."
end

-- Final save + unlock, started at most once per session. Tracked so BindToClose can wait.
local function releaseOnce(session: Session)
	if pendingReleases[session] or session.released then
		return
	end
	pendingReleases[session] = true
	task.spawn(function()
		write(session, true)
		pendingReleases[session] = nil
	end)
end

local function onPlayerAdded(player: Player)
	local session, kickMessage = load(player)
	if not session then
		if player.Parent == Players then
			player:Kick(kickMessage) -- never let a player play on default data after a failed load
		end
		return
	end
	session.data.stats.joins += 1
	session.dirty = true
	sessions[player] = session
	for _, callback in loadedCallbacks do
		task.spawn(callback, player, session)
	end
end

local PlayerData = {}

-- Run `callback(player, session)` for every player whose data loads (and for players
-- already loaded when you register). Callbacks run in their own threads.
function PlayerData.OnLoaded(callback: (Player, Session) -> ())
	table.insert(loadedCallbacks, callback)
	for player, session in sessions do
		task.spawn(callback, player, session)
	end
end

function PlayerData.Get(player: Player): Session?
	local session = sessions[player]
	if session and not session.lost then
		return session
	end
	return nil
end

function PlayerData.GetData(player: Player): Data?
	local session = PlayerData.Get(player)
	return if session then session.data else nil
end

-- Yield until the player's data is loaded, they leave, or `timeout` seconds pass.
function PlayerData.AwaitLoaded(player: Player, timeout: number): Session?
	local deadline = os.clock() + timeout
	while player.Parent == Players and os.clock() < deadline do
		local session = PlayerData.Get(player)
		if session then
			return session
		end
		task.wait(0.2)
	end
	return PlayerData.Get(player)
end

function PlayerData.MarkDirty(player: Player)
	local session = sessions[player]
	if session then
		session.dirty = true
	end
end

-- Save now and keep the lock (after purchases, before teleports). Returns true on success.
function PlayerData.SaveNow(player: Player): boolean
	local session = sessions[player]
	return if session then write(session, false) else false
end

function PlayerData.HasPurchase(session: Session, purchaseId: string): boolean
	return table.find(session.data.purchaseHistory, purchaseId) ~= nil
end

function PlayerData.RecordPurchase(session: Session, purchaseId: string)
	local history = session.data.purchaseHistory
	table.insert(history, purchaseId)
	while #history > ServerConfig.MaxPurchaseHistory do
		table.remove(history, 1) -- drop the oldest
	end
	session.dirty = true
end

function PlayerData.Start()
	Players.PlayerAdded:Connect(onPlayerAdded)
	for _, player in Players:GetPlayers() do
		task.spawn(onPlayerAdded, player) -- players who joined before Start ran
	end

	Players.PlayerRemoving:Connect(function(player: Player)
		local session = sessions[player]
		if session then
			sessions[player] = nil
			releaseOnce(session)
		end
	end)

	-- Autosave: refreshes every lock even when nothing changed, or locks would expire.
	task.spawn(function()
		while true do
			task.wait(AUTOSAVE_INTERVAL)
			-- Iterate a copy: players can join or leave while this loop yields.
			for _, session in table.clone(sessions) do
				if DataStoreService:GetRequestBudgetForRequestType(Enum.DataStoreRequestType.StandardWrite) < 5 then
					task.wait(2) -- leave headroom for leave-saves and purchases
				end
				task.spawn(write, session, false)
			end
		end
	end)

	-- Shutdown flush: release every session and wait (with a deadline) for all final saves.
	game:BindToClose(function()
		shuttingDown = true
		local deadline = os.clock() + SHUTDOWN_DEADLINE -- same in Studio, or a half-saved lock blocks the next test
		for player, session in sessions do
			sessions[player] = nil
			releaseOnce(session)
		end
		while next(pendingReleases) ~= nil and os.clock() < deadline do
			task.wait(0.1)
		end
		if next(pendingReleases) ~= nil then
			warn("[PlayerData] shutdown deadline hit with saves still running")
		end
	end)
end

return PlayerData
