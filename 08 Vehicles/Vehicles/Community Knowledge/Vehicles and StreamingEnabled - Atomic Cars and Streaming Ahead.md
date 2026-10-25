---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Vehicles and StreamingEnabled - Atomic Cars and Streaming Ahead"
tags: [roblox, community-knowledge, vehicles, streaming, performance]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/reference/engine/enums/ModelStreamingMode
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
---
# Vehicles and StreamingEnabled - Atomic Cars and Streaming Ahead

Vehicles break two streaming assumptions at once: they are **multi-part models that scripts expect to be complete**, and they **move faster than a walking character**, so the player drives into areas that have not loaded yet. Open-world car games on Roblox nearly always need StreamingEnabled for memory, so the car code must be written for it.

## 1. Make each vehicle model Atomic
Default streaming can deliver a car's parts piecemeal. A client script that does `car.Wheels.FL` may find the folder but not the wheel. Set `Model.ModelStreamingMode`:

| Mode | Behaviour | Use for |
|---|---|---|
| `Atomic` | The model and all descendants stream in and out together | Every drivable vehicle |
| `Persistent` | Sent soon after join, never streamed out | A small number of always-needed models (the player's own garage car is a bad fit if there are 50 of them) |
| `PersistentPerPlayer` | Persistent only for players added with `Model:AddPersistentPlayer()` | The car the player is currently driving |
| `Nonatomic` / `Default` | Normal per-part streaming | Scenery |

Pattern: every car is `Atomic`; when a player sits in the driver seat the server calls `car:AddPersistentPlayer(player)` and on exit `car:RemovePersistentPlayer(player)`. That guarantees the driver never sees their own car vanish, without making every car persistent for everyone.

Even with Atomic, write client code that waits:
```lua
local car = workspace.Vehicles:WaitForChild(carName, 10)
if not car then return end -- streamed out or gone; do not error
```

## 2. Stream ahead of a fast car
Streaming focuses on the character's PrimaryPart by default. The character is in the car, so that is fine at walking pace, but at 150 studs/s you outrun it. Tools, from cheapest:

1. **`Workspace.PredictiveStreamingMode = Enabled`.** Opt-in; the engine uses signals such as high velocity in a consistent direction to pre-stream likely areas. No code changes; try this first.
2. **`Player:RequestStreamAroundAsync(position, timeOut)`** from the server, for a point a second or two ahead of the car:
   ```lua
   local ahead = root.Position + root.AssemblyLinearVelocity * 1.5
   task.spawn(function()
   	player:RequestStreamAroundAsync(ahead, 2)
   end)
   ```
   Throttle it (once every 1-2 s per player), never every frame.
3. **`Player:AddReplicationFocus(part)`** for a long-lived extra focus, used sparingly (for example a race finish area during a race).

## 3. Decide what happens at the edge
`Workspace.StreamingIntegrityMode = PauseOutsideLoadedArea` (the docs' recommended setting) pauses gameplay if the player gets into an unloaded region instead of letting the car fall through missing road. Listen to `Player.GameplayPaused` on the client to show a small "loading" hint. If pauses are frequent, raise `StreamingMinRadius` along roads or slow cars down near map seams.

## 4. Other players' cars
- Cars far away stream out on other clients; their client scripts (lights, sounds) must clean up on `AncestryChanged` / `Destroying` and start again when the model returns.
- Do not put a car's state only on client-side instances. Keep fuel, health and owner as **attributes on the model** so they arrive with it.
- Network ownership does not depend on streaming; the server still knows the car exists when a client does not.

## Pitfalls
- Wheels welded with `Motor6D` / constraints whose attachments are in a different model: streaming may deliver one model without the other. Keep the whole vehicle in one model.
- Map roads as `Nonatomic` huge models stream poorly; split road meshes into chunks.
- Testing only in Studio with a tiny map hides all of this; test with `StreamingTargetRadius` set low to exaggerate problems.

## Related
[[Vehicles - Hub]] · [[StreamingEnabled Gotchas and Streaming-Safe Client Code]] · [[Large World Streaming Architecture]] · [[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]]
