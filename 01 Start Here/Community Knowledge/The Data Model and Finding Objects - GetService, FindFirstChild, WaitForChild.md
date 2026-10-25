---
area: "01 Start Here"
cluster: "Start Here"
title: "The Data Model and Finding Objects - GetService, FindFirstChild, WaitForChild"
tags: [roblox, community-knowledge, start-here, data-model, instances, scripting]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/data-model
  - https://create.roblox.com/docs/scripting/services
  - https://create.roblox.com/docs/reference/engine/classes/Instance
  - https://devforum.roblox.com/t/findfirstchild-vs-waitforchild/1794355
  - https://devforum.roblox.com/t/difference-between-waitforchild-and-findfirstchild/899813
---
# The Data Model and Finding Objects - GetService, FindFirstChild, WaitForChild

Every script has to find things: a part, a player's stats, a RemoteEvent, a GUI. In Roblox everything is an **Instance** in one big tree called the **data model**, rooted at `game`. Most beginner errors ("is not a valid member of", "attempt to index nil", "infinite yield") are really "I looked for an object in the wrong place, or before it existed". This note gives you the four ways to find things and when to use each.

## The tree

```
game (DataModel)
├─ Workspace          (also the global `workspace`)
├─ Players
│  └─ Sam (Player)
│     ├─ leaderstats
│     ├─ Backpack
│     └─ PlayerGui
├─ ReplicatedStorage
├─ ServerScriptService
├─ ServerStorage
├─ StarterGui / StarterPack / StarterPlayer
├─ Lighting, SoundService, Teams ...
```

Every Instance has a `Name`, a `ClassName` and a `Parent`. Setting `Parent` moves it; setting it to `nil` removes it from the world (`Destroy()` removes it for good and disconnects its events).

## Way 1: GetService for top-level services

```lua
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
```

Always use `GetService` with the class name. It works even if the service was renamed and creates services that do not exist yet. Put these lines at the top of every script.

## Way 2: dot indexing (when you know it exists)

```lua
local door = workspace.Map.Door
```

Fast and readable, but **errors** if any step is missing: `Door is not a valid member of Model "Map"`. Use it on the server for things you built in Studio.

Names with spaces or symbols need brackets: `workspace["Big Door"]`. Avoid such names.

## Way 3: FindFirstChild (might not exist)

```lua
local shield = character:FindFirstChild("Shield")
if shield then
	shield:Destroy()
end
```

Returns the child or `nil`, never errors. Use it when absence is a normal case (optional items, things that may have been destroyed). Related helpers:
- `FindFirstChildWhichIsA("Humanoid")`: first child of that class (or subclass).
- `FindFirstChild("Name", true)`: searches all descendants (slower; avoid in loops).
- `FindFirstAncestor("Map")`: walks upward.

## Way 4: WaitForChild (will exist soon)

```lua
local remote = ReplicatedStorage:WaitForChild("ClaimReward")
local gui = player:WaitForChild("PlayerGui")
```

Pauses the script until the child appears. Use it mostly in **LocalScripts**, because the client receives the world gradually and your script may run before things replicate. With StreamingEnabled, far-away Workspace parts may never arrive, so do not `WaitForChild` on distant map parts.

If it waits more than about 5 seconds, Output warns `Infinite yield possible`: almost always a wrong name or path. Optional timeout: `WaitForChild("X", 10)` returns `nil` after 10 seconds. See [[Infinite Yield Possible - Causes and Fixes]].

## Community rule of thumb (summarised from DevForum threads)

| Situation | Use |
| --- | --- |
| Services | `GetService` |
| Server script, object placed in Studio | Dot indexing |
| Client script, object from ReplicatedStorage / PlayerGui / character | `WaitForChild` (once, store in a variable) |
| Might legitimately be missing | `FindFirstChild` + `if` |
| The player's character | `player.Character or player.CharacterAdded:Wait()` |

Avoid `repeat task.wait() until x:FindFirstChild("Y")`: `WaitForChild` does the same job without polling.

## Iterating

```lua
for _, child in workspace.Coins:GetChildren() do ... end      -- direct children
for _, d in workspace.Map:GetDescendants() do                  -- everything below
	if d:IsA("BasePart") then d.Anchored = true end
end
```

`IsA("BasePart")` is true for Part, MeshPart, WedgePart and other part types, which is why it beats comparing `ClassName`.

## Creating objects

```lua
local part = Instance.new("Part")
part.Size = Vector3.new(4, 1, 4)
part.Anchored = true
part.Parent = workspace -- set Parent last
```

Setting properties before parenting is faster and avoids half-built objects replicating (see [[Set Parent Last - The Instance.new Parent Argument]]).

## Related
[[00 START HERE - Top G Vault]] · [[Where Scripts Go - Containers, Script Types and RunContext]] · [[Infinite Yield Possible - Causes and Fixes]] · [[StreamingEnabled Gotchas and Streaming-Safe Client Code]] · [[30 Official Roblox Docs/Projects/Data model|Data model (official)]]
