---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/infinite-yield-possible"
title: "Infinite Yield Possible - Causes and Fixes"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/infinite-yield-possible-on-waitforchild/2975790
  - https://devforum.roblox.com/t/functions-scripts-break-in-team-test-and-in-live-game/4751287
cssclasses: [tg-a40]
---

# Infinite Yield Possible - Causes and Fixes

`Infinite yield possible on 'X:WaitForChild("Y")'` is a **warning**, not an error. It prints when `WaitForChild` without a timeout has waited about 5 seconds. The thread is still waiting; if the child never appears, that script is stuck forever.

## The causes help threads keep finding

1. **Wrong path or name.** Typos, wrong case, or the object lives somewhere else (`PlayerGui` vs `StarterGui`, `Character` vs `Player`).
2. **Wrong side.** The object is created by a LocalScript, so the server never sees it (or the reverse: server-only objects in `ServerStorage` are invisible to clients).
3. **It was destroyed or replaced.** In a 2024 thread, @c0rr_n spotted that a server script rebuilt the player's GUI on character load, removing the container another script was waiting on. Respawns reset `ScreenGui`s with `ResetOnSpawn = true`.
4. **StreamingEnabled.** The part exists on the server but isn't streamed to this client yet (or streamed out).
5. **It only exists in some cases** (only for group members, only after a purchase). Waiting for it unconditionally hangs everyone else.
6. **Server-side warnings vs client-side warnings are different bugs**: check which side printed it in the Developer Console.

## Fixes

- Use `FindFirstChild` when something is optional; `WaitForChild` only for things that **will** replicate.
- Always pass a timeout for anything that might never arrive, and handle `nil`.
- For world objects with streaming on, prefer CollectionService tags with added/removed handlers, or `InstanceHandle` attributes (see [[Instance Attributes - InstanceHandle Notes]]).

```lua
-- Own helper: wait along a path with one timeout and a clear message
local function waitForPath(root: Instance, path: {string}, timeout: number): Instance?
	local deadline = os.clock() + timeout
	local current: Instance? = root
	for _, name in path do
		if not current then return nil end
		local remaining = deadline - os.clock()
		if remaining <= 0 then
			warn(("[waitForPath] timed out at %s.%s"):format(current:GetFullName(), name))
			return nil
		end
		current = current:WaitForChild(name, remaining)
	end
	return current
end

local gui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local label = waitForPath(gui, {"HUD", "TopBar", "Coins"}, 10)
if label then
	(label :: TextLabel).Text = "0"
end
```

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Works in Studio, Breaks Live - Checklist]] · [[StreamingEnabled Gotchas and Streaming-Safe Client Code]] · [[Player and Character Lifecycle Without Race Conditions]] · [[UI Scripting Gotchas - ResetOnSpawn and PlayerGui]]

<!-- TDOD_GRAPH_END -->
