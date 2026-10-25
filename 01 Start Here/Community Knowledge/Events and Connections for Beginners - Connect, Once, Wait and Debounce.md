---
area: "01 Start Here"
cluster: "Start Here"
title: "Events and Connections for Beginners - Connect, Once, Wait and Debounce"
tags: [roblox, community-knowledge, start-here, events, debounce, scripting]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/events
  - https://create.roblox.com/docs/scripting/debounce
  - https://devforum.roblox.com/t/what-is-debounce/1288811
  - https://devforum.roblox.com/t/2-questions-about-debounce/919829
  - https://devforum.roblox.com/t/how-to-create-a-debounce-in-my-script/4041039
---
# Events and Connections for Beginners - Connect, Once, Wait and Debounce

Roblox scripting is **event-driven**: instead of checking every frame "has anything happened?", you tell the engine "when X happens, run this function". Players joining, parts being touched, buttons being clicked, characters dying: all are events. Learning four tools (Connect, Once, Wait, Disconnect) plus the debounce pattern covers nearly every beginner gameplay script.

## Connect: run a function every time

```lua
local Players = game:GetService("Players")

local function onPlayerAdded(player)
	print(player.Name, "joined")
end

Players.PlayerAdded:Connect(onPlayerAdded)
```

- The event passes arguments to your function (`PlayerAdded` passes the `Player`; `Touched` passes the part that touched).
- Pass the function **name**, not a call: `:Connect(onPlayerAdded)`, never `:Connect(onPlayerAdded())`.
- Anonymous functions are fine when you need variables from the surrounding code:

```lua
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		print(player.Name, "spawned")
	end)
end)
```

## Once: run only the first time

```lua
workspace.StartPad.Touched:Once(function(hit)
	print("Race started by", hit.Parent.Name)
end)
```

`:Once()` connects, fires one time, then disconnects itself.

## Wait: pause until it fires

```lua
local character = player.Character or player.CharacterAdded:Wait()
```

`:Wait()` yields the script and returns the event's arguments. The `X or Event:Wait()` idiom covers both "already exists" and "not yet".

## Disconnect: stop listening

```lua
local connection
connection = part.Touched:Connect(function(hit)
	if hit.Name == "Goal" then
		print("scored")
		connection:Disconnect()
	end
end)
```

`:Connect()` returns an `RBXScriptConnection`. Disconnect when the listener is no longer needed, especially for connections to things that live longer than the object you care about. When an object is destroyed, its own connections disconnect automatically. Deeper reading: [[Signals, Connections and Leak-Proof Cleanup]].

## Debounce: stop an event firing too often

`Touched` fires many times in a split second as body parts jiggle against a brick. Without a guard, a trap meant to deal 10 damage can deal 60. A **debounce** is a flag that says "busy, ignore new triggers until the cooldown ends".

```lua
local part = script.Parent
local COOLDOWN = 1
local busy = false

part.Touched:Connect(function(hit)
	local humanoid = hit.Parent:FindFirstChildWhichIsA("Humanoid")
	if not humanoid or busy then return end
	busy = true
	humanoid:TakeDamage(10)
	task.wait(COOLDOWN)
	busy = false
end)
```

The flag must live **outside** the connected function. Each event fire runs your function in its own thread, so a flag declared inside it is new every time and never blocks anything. That exact mistake appears again and again in DevForum help threads.

### Per-player debounce

One shared flag blocks everyone. For pads, shops and pickups, keep one entry per player:

```lua
local lastUse = {}
part.Touched:Connect(function(hit)
	local player = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
	if not player then return end
	local now = os.clock()
	if lastUse[player] and now - lastUse[player] < 2 then return end
	lastUse[player] = now
	-- give reward here
end)
game:GetService("Players").PlayerRemoving:Connect(function(p) lastUse[p] = nil end)
```

The official docs show a variant that stores the flag as an attribute on the part (`part:SetAttribute("Touched", true)`), which also makes it visible in Properties while testing.

## Common built-in events to know

| Event | Fires when |
| --- | --- |
| `Players.PlayerAdded` / `PlayerRemoving` | Someone joins / leaves |
| `player.CharacterAdded` | Their character spawns or respawns |
| `humanoid.Died` | Character dies |
| `part.Touched` / `TouchEnded` | Physical contact starts / ends |
| `clickDetector.MouseClick` | Part clicked (passes the player) |
| `prompt.Triggered` | ProximityPrompt used (passes the player) |
| `button.Activated` | GUI button pressed (mouse, touch or gamepad) |
| `instance:GetPropertyChangedSignal("Name")` | A specific property changes |

## Pitfalls

- Connecting inside a loop or inside `CharacterAdded` without cleanup: every respawn adds another listener and effects double.
- Connecting `PlayerAdded` late (after a long `WaitForChild`): players who joined before the line ran are missed. Loop over `Players:GetPlayers()` too.

## Related
[[00 START HERE - Top G Vault]] · [[Events vs Polling]] · [[Touched Events - Network Delay and Reliability]] · [[Cooldown Module]] · [[30 Official Roblox Docs/Scripting/Debounce patterns|Debounce patterns (official)]]
