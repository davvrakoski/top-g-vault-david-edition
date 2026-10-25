---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Speed - Connection Leak Finder - Counting Live Connections by Tag"
tags: [roblox, community-knowledge, optimization, memory, connections, debugging, tooling]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptConnection
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/reference/engine/globals/debug
---
# Speed - Connection Leak Finder - Counting Live Connections by Tag

Memory tools tell you that memory is growing; they rarely tell you which `:Connect` call is responsible. Leaked connections are the classic cause the Creator Hub names: a connected callback and every value it captures stay alive until the connection is disconnected or its instance is destroyed. A small debug wrapper that counts live connections per call site turns "LuaHeap goes up" into "Shop.openButton has 340 live connections and should have 1". This note is a dev-only tool pattern; it complements cleanup containers like Trove, it does not replace them.

## The idea

Route connections that you care about through a helper that:

1. Records a tag (a string you pass, or the caller's script and line).
2. Increments a live counter for that tag.
3. Decrements it when the connection is disconnected, or notices later that `Connected` became false (instance destroyed).

Then print the table after a repeatable action. A count that rises with every repeat is a leak.

## The tracker

```lua
-- ReplicatedStorage/Shared/ConnTracker.lua
local RunService = game:GetService("RunService")
local ENABLED = RunService:IsStudio() -- never ship the overhead

local ConnTracker = {}
local live: { [string]: { RBXScriptConnection } } = {}

function ConnTracker.connect(tag: string, signal: RBXScriptSignal, fn: (...any) -> ())
	local c = signal:Connect(fn)
	if ENABLED then
		local list = live[tag]
		if not list then list = {}; live[tag] = list end
		table.insert(list, c)
	end
	return c
end

function ConnTracker.report(minCount: number?)
	local rows = {}
	for tag, list in live do
		local alive = 0
		for i = #list, 1, -1 do
			if list[i].Connected then
				alive += 1
			else
				table.remove(list, i) -- prune dead ones
			end
		end
		if alive >= (minCount or 1) then
			table.insert(rows, { tag = tag, n = alive })
		end
	end
	table.sort(rows, function(a, b) return a.n > b.n end)
	for _, r in rows do print(("%5d  %s"):format(r.n, r.tag)) end
end

return ConnTracker
```

The reference documents that `RBXScriptConnection.Connected` becomes false when `Disconnect()` is called. `Destroy()` disconnects an instance's connections, so `Connected` should also read false after the owner is destroyed (unverified in the docs; confirm once in Studio by destroying a part and printing the flag).

Without a manual tag, `debug.info(2, "sl")` returns the caller's source and line; use it as the tag to find call sites automatically (Studio only, it costs time per call).

## Using it

1. Swap `x.Event:Connect(f)` for `ConnTracker.connect("Shop.buyButton", x.Event, f)` in the suspect system (or everywhere through a find-and-replace on a branch).
2. In a Studio play test, run `ConnTracker.report()` from the command bar (client or server view as needed): baseline.
3. Repeat the suspect action 20 times: open/close the shop, respawn, equip/unequip.
4. Report again. Healthy tags stay flat. Leaking tags grow by about 20.

| Tag | Before | After 20 repeats | Verdict |
|---|---|---|---|
| Shop.buyButton | 1 | 21 | leak: connects on every open |
| Character.Died | 4 | 4 | fine |
| Tool.Activated | 1 | 1 | fine |

## Typical fixes it points to

- Connecting inside an "open" function without disconnecting on "close": move the connection to setup, or keep it in a per-screen cleanup container.
- Connecting to a long-lived object (Player, a service, a shared signal) from a short-lived one (a character, a UI panel). The long-lived side never dies, so neither does the connection.
- Per-character connections on `Player` events created in `CharacterAdded` without cleanup on the next respawn.

## Pitfalls

- Holding the connection objects in `live` keeps them referenced; that is fine in Studio because they are pruned when dead, but never enable the tracker in live servers.
- `Once` connections disconnect themselves after firing; they show up as dead after use, which is correct.
- Custom Luau signals (Signal modules) do not return `RBXScriptConnection`; add a matching counter in your signal class.

## Related
[[Optimization - Hub]] · [[Signals, Connections and Leak-Proof Cleanup]] · [[Trove vs Janitor - Cleanup API Side by Side]] · [[Speed - Player-Keyed Tables - The Most Common Server Memory Leak]]
