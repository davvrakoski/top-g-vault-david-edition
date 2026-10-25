---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Signals, Connections and Leak-Proof Cleanup"
tags: [deep-dive, roblox, signals, memory-leaks, cleanup, trove]
verified: 2026-10-25
cssclasses: [tg-a03]
---

# Signals, Connections and Leak-Proof Cleanup

**Why this matters:** connections are the number one source of server memory that climbs for hours and then crashes; every `:Connect` you forget keeps its callback, its upvalues and often a whole character model alive.
This note explains exactly what the engine cleans up for you (less than people think), gives a typed pure-Luau signal and a Trove-style cleanup container, and shows how to prove a leak is fixed.

The vault's [[Cleanup Bag Pattern]] gives a minimal bag. This note goes deeper: lifetimes, ownership rules, edge cases, and a production-grade container.

---

## 1. What the engine disconnects for you, and what it does not

| Situation | Connections on it disconnected? |
| --- | --- |
| `instance:Destroy()` | **Yes.** Destroy sets Parent to nil, locks Parent, disconnects all connections and destroys all children. |
| `instance.Parent = nil` | **No.** The instance and its connections live on while anything references it. |
| Player leaves the game | **Not guaranteed.** Historically the `Player` object and character were not destroyed, so `player.CharacterAdded` connections and everything they capture stay alive. Roblox added `Workspace.PlayerCharacterDestroyBehavior` to destroy them automatically; check the current default in your place, or destroy manually. |
| Character respawns | The **old character model** is removed; whether it is destroyed depends on the same setting. Connections to the old Humanoid can survive. |
| Script that made the connection is destroyed | Disconnected (Roblox's performance docs list destroying the script as a cleanup path). |
| A module's table is no longer referenced | **No.** Connections made inside the module stay connected; the connection keeps the callback alive, not the other way round. |
| Streaming removes a part on the client | **No.** Streamed-out instances are parented to nil, not destroyed, so connections survive and reattach if it streams back in (see [[StreamingEnabled Gotchas and Streaming-Safe Client Code]]). |

Roblox's own performance docs call out the Player case directly: connections on `Player` and character instances consume memory if you do not disconnect them, and this becomes significant as hundreds of users join and leave.

Manual cleanup on leave, if you are not using the automatic behaviour:

```luau
local Players = game:GetService("Players")

Players.PlayerRemoving:Connect(function(player)
	-- Let other PlayerRemoving handlers (saving!) run first.
	task.defer(function()
		local character = player.Character
		if character then
			character:Destroy()
		end
		player:Destroy()
	end)
end)
```

Destroying the player must happen **after** your save logic has read what it needs. `task.defer` pushes it to the next resumption point; if saves yield, coordinate explicitly instead (see [[BindToClose and Server Shutdown Save Flush]]).

---

## 2. The ownership rule

> Every connection, thread and instance has exactly one owner, and the owner's teardown destroys it.

Owners are things with a clear end: a round, a character life, an open UI screen, an NPC, a tool equip. "The server" is not an owner, because it never ends, so anything owned by "the server" must be bounded (one per game, not one per player or per round).

Smells that a connection has no owner:

- `:Connect` inside a function called per player or per round, with the return value discarded.
- `RunService.Heartbeat:Connect` inside an `Equipped` handler.
- `task.spawn(function() while true do ... end end)` without a `running` flag or cancel handle.
- Tables keyed by `Player` or `Instance` with no removal path.

---

## 3. A Trove-style cleanup container

Open-source libraries such as Trove and Maid implement this well; review their licence before using them (see [[Open-Source Evaluation Rubric]]). Below is a self-contained version that handles the cases that bite in production: threads, `Destroy`-able objects, plain functions, re-entrant cleanup and binding to an instance's lifetime.

```luau
--!nonstrict
-- Implementation is loosely typed; the exported type gives callers full checking.
-- ReplicatedStorage/Shared/Util/Trove.luau
export type Trove = {
	Add: <T>(self: Trove, item: T) -> T,
	Connect: (self: Trove, signal: RBXScriptSignal, fn: (...any) -> ()) -> RBXScriptConnection,
	Spawn: (self: Trove, fn: (...any) -> (), ...any) -> thread,
	Extend: (self: Trove) -> Trove,
	AttachToInstance: (self: Trove, instance: Instance) -> (),
	Clean: (self: Trove) -> (),
	Destroy: (self: Trove) -> (),
}

local Trove = {}
Trove.__index = Trove

local function cleanItem(item: any)
	local kind = typeof(item)
	if kind == "RBXScriptConnection" then
		item:Disconnect()
	elseif kind == "Instance" then
		item:Destroy()
	elseif kind == "thread" then
		-- A thread cannot cancel itself; skip if it is the one running cleanup.
		if coroutine.running() ~= item then
			pcall(task.cancel, item)
		end
	elseif kind == "function" then
		item()
	elseif kind == "table" then
		if typeof(item.Destroy) == "function" then
			item:Destroy()
		elseif typeof(item.Disconnect) == "function" then
			item:Disconnect()
		end
	end
end

function Trove.new(): Trove
	local self = setmetatable({ _items = {}, _cleaning = false }, Trove)
	return (self :: any) :: Trove
end

function Trove:Add(item)
	if self._cleaning then
		-- Adding during cleanup would leak; clean it immediately instead.
		cleanItem(item)
		return item
	end
	table.insert(self._items, item)
	return item
end

function Trove:Connect(signal, fn)
	return self:Add(signal:Connect(fn))
end

function Trove:Spawn(fn, ...)
	return self:Add(task.spawn(fn, ...))
end

function Trove:Extend()
	-- Child trove: cleaned with the parent, or earlier on its own.
	local child = Trove.new()
	self:Add(child)
	return child
end

function Trove:AttachToInstance(instance)
	-- Clean when the instance is destroyed (Destroying fires before teardown).
	self:Connect(instance.Destroying, function()
		self:Destroy()
	end)
end

function Trove:Clean()
	if self._cleaning then
		return
	end
	self._cleaning = true
	local items = self._items
	-- Reverse order: things added later usually depend on things added earlier.
	for i = #items, 1, -1 do
		local item = items[i]
		items[i] = nil
		local ok, err = pcall(cleanItem, item)
		if not ok then
			warn("[Trove] cleanup error:", err)
		end
	end
	self._cleaning = false
end

function Trove:Destroy()
	self:Clean()
end

return Trove
```

Design choices worth copying:

- **Reverse-order cleanup.** A tween created after a part should be cancelled before the part is destroyed.
- **`pcall` per item.** One failing cleanup must not leave the rest connected.
- **Add-during-clean is handled.** A callback that runs during cleanup and adds more items would otherwise leak them.
- **`Extend`.** A round trove owns per-player troves; ending the round cleans everything, and a player leaving early cleans only theirs.

---

## 4. Lifetime patterns in practice

### Per character life

```luau
--!strict
local Players = game:GetService("Players")
local Trove = require(game:GetService("ReplicatedStorage").Shared.Util.Trove)

local function onCharacter(player: Player, character: Model)
	local life = Trove.new()
	life:AttachToInstance(character) -- cleaned if the model is destroyed

	local humanoid = character:WaitForChild("Humanoid") :: Humanoid
	life:Connect(humanoid.Died, function()
		-- death logic
		life:Destroy() -- do not wait for the model to be removed
	end)
	life:Connect(humanoid.HealthChanged, function(health)
		-- update a server-side state table
	end)
end

Players.PlayerAdded:Connect(function(player)
	local playerTrove = Trove.new()
	playerTrove:Connect(player.CharacterAdded, function(character)
		onCharacter(player, character)
	end)
	if player.Character then
		task.spawn(onCharacter, player, player.Character)
	end
	playerTrove:Connect(player.AncestryChanged, function(_, parent)
		if parent == nil then
			playerTrove:Destroy()
		end
	end)
end)
```

The `if player.Character` branch matters: if the character spawned before your connection was made (common with deferred events and slow module loading), `CharacterAdded` already fired. See [[Player and Character Lifecycle Without Race Conditions]].

### Per UI screen

Create a trove when the screen opens, add every connection, tween and spawned thread to it, destroy it on close. A classic leak is a shop screen that connects `MouseButton1Click` on every open, so after ten opens one click buys ten items.

### Per tool equip

Connect input and render-step handlers on `Equipped` into a trove; destroy the trove on `Unequipped` **and** on tool `Destroying`.

---

## 5. A typed pure-Luau signal

Use `RBXScriptSignal`s from instances when they exist. For your own module-to-module events, a pure-Luau signal is better than a `BindableEvent` because bindables serialize their arguments: tables arrive as **copies**, metatables are lost, and non-string keys are converted to strings. A Luau signal passes values by reference with zero allocation.

```luau
--!nonstrict
-- Implementation is loosely typed; the exported type gives callers full checking.
-- ReplicatedStorage/Shared/Util/Signal.luau
export type Connection = { Connected: boolean, Disconnect: (self: Connection) -> () }
export type Signal<T...> = {
	Connect: (self: Signal<T...>, fn: (T...) -> ()) -> Connection,
	Once: (self: Signal<T...>, fn: (T...) -> ()) -> Connection,
	Fire: (self: Signal<T...>, T...) -> (),
	Wait: (self: Signal<T...>) -> T...,
	DisconnectAll: (self: Signal<T...>) -> (),
	Destroy: (self: Signal<T...>) -> (),
}

local Signal = {}
Signal.__index = Signal

local ConnectionClass = {}
ConnectionClass.__index = ConnectionClass

function ConnectionClass:Disconnect()
	if not self.Connected then
		return
	end
	self.Connected = false
	local list = self._signal._handlers
	local index = table.find(list, self)
	if index then
		table.remove(list, index)
	end
end

function Signal.new<T...>(): Signal<T...>
	return (setmetatable({ _handlers = {} }, Signal) :: any) :: Signal<T...>
end

function Signal:Connect(fn)
	local connection = setmetatable({ Connected = true, _fn = fn, _signal = self }, ConnectionClass)
	table.insert(self._handlers, connection)
	return connection
end

function Signal:Once(fn)
	local connection
	connection = self:Connect(function(...)
		connection:Disconnect()
		fn(...)
	end)
	return connection
end

function Signal:Fire(...)
	-- Snapshot so handlers can disconnect themselves (or others) safely mid-fire.
	local snapshot = table.clone(self._handlers)
	for _, connection in snapshot do
		if connection.Connected then
			task.spawn(connection._fn, ...)
		end
	end
end

function Signal:Wait()
	local thread = coroutine.running()
	self:Once(function(...)
		task.spawn(thread, ...)
	end)
	return coroutine.yield()
end

function Signal:DisconnectAll()
	for _, connection in table.clone(self._handlers) do
		connection:Disconnect()
	end
end

function Signal:Destroy()
	self:DisconnectAll()
end

return Signal
```

Usage with full types:

```luau
local itemGranted = Signal.new() :: Signal.Signal<Player, string, number>
itemGranted:Connect(function(player, itemId, amount)
	print(player.Name, itemId, amount)
end)
itemGranted:Fire(somePlayer, "potion_small", 3)
```

Design notes: `task.spawn` per handler isolates errors (one failing listener does not stop the others) and lets handlers yield. For hot paths with thousands of fires per second, popular libraries reuse a "free runner" thread to avoid creating a coroutine per call; measure before optimising.

---

## 6. Proving a leak is fixed

Do not trust "it looks fine". Measure:

1. In a test server, repeat the suspect action 100 times (open/close shop, spawn/despawn NPC, player join/leave with a bot script).
2. Developer Console > **Memory**: watch `PlaceMemory > Instances`, `Signals` and `LuaHeap`. Then **LuauHeap**: take a snapshot before and after.
3. In the LuauHeap **Unique References / Unparented Instances** views, look for instances with no parent that are still reachable from scripts. The view shows the path that pins them, which usually names the leaking connection's upvalue.
4. Tag systems with `debug.setmemorycategory("Inventory")` at the start of their threads so the **Memory Categories** view attributes heap to them.

The fix is confirmed when memory plateaus after garbage collection and the unparented count returns to baseline. See [[Developer Console Memory Categories Explained]].

---

## Common mistakes

- Assuming `Parent = nil` cleans up like `Destroy()`.
- Assuming player objects are destroyed when a player leaves.
- Connecting inside per-open UI code without disconnecting on close.
- Storing `[player] = data` in a module table and never removing the key on `PlayerRemoving`.
- Using `BindableEvent` for Luau-to-Luau events and being surprised that tables arrive as copies without methods.
- `while true do` loops with no exit condition tied to an owner.
- Destroying a trove from inside one of its own threads and expecting that thread to be cancelled (a running thread cannot cancel itself; return from it instead).
- Forgetting the "already spawned" case when connecting `CharacterAdded` late.

## Checklist

- [ ] Every `:Connect`, `task.spawn`/`task.delay` loop and runtime-created instance is added to an owner's trove.
- [ ] Owners are bounded lifetimes: round, life, screen, equip, NPC.
- [ ] Player and character cleanup is explicit or `PlayerCharacterDestroyBehavior` is confirmed on.
- [ ] Tables keyed by Player/Instance are cleared on removal.
- [ ] Custom events use a Luau signal, not a BindableEvent.
- [ ] Signal fire is safe when handlers disconnect during the fire.
- [ ] A 100-cycle test shows memory and unparented instances return to baseline.

**Related:** [[Scripting - Hub]] · [[Cleanup Bag Pattern]] · [[Memory Leaks and Lifecycle Management]] · [[Memory grows over time]] · [[Events vs Polling]]
