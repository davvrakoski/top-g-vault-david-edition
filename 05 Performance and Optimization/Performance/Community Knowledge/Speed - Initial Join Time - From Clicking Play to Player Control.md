---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Speed - Initial Join Time - From Clicking Play to Player Control"
tags: [roblox, community-knowledge, performance, loading, join-time, replication, streaming]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/identify
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/players/loading-screens
  - https://create.roblox.com/docs/production/analytics/performance
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
---
# Speed - Initial Join Time - From Clicking Play to Player Control

Join time is the first thing every player experiences and the easiest place to lose them: a long black or spinner screen on a phone is a quit. The Creator Hub defines load time as everything from clicking **Play** until the world renders and the player can act. This note breaks that into stages, shows how to time each one, and lists fixes by stage. (Preloading specifically is covered in [[PreloadAsync and Loading Screens - Preload Less, Load Faster]]; payload trimming in [[Lean ReplicatedStorage - Join Payload Audit and On-Demand Delivery]].)

## The stages (official order)

1. **Connect** to a server (matchmaking and server start; mostly outside your control, but a heavy server start script delays it for the first player in a new server).
2. **ReplicatedFirst** replicates; your custom loading screen inside it appears.
3. **The rest of the DataModel** replicates: everything in ReplicatedStorage and Workspace. With instance streaming, only the area near the spawn point.
4. **Avatar loads**; the default or custom loading screen goes away and the world renders.

Then a stage the docs call out separately: **startup scripts**. Heavy LocalScript work right after replication delays the moment the game becomes playable.

## Time each stage

There is no built-in join timer; a stopwatch on your baseline device is the official suggestion. For finer detail, log timestamps from a LocalScript in ReplicatedFirst:

```lua
-- ReplicatedFirst/JoinTimer.client.lua
local Players = game:GetService("Players")
local t0 = os.clock()
local function mark(label) print(("[join] %-18s %.2fs"):format(label, os.clock() - t0)) end

mark("ReplicatedFirst")
if not game:IsLoaded() then game.Loaded:Wait() end
mark("game.Loaded")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
mark("character")
char:WaitForChild("HumanoidRootPart")
mark("root part")
-- call mark("playable") from your own code when input is enabled
```

This misses connect time (it starts after ReplicatedFirst arrives), so combine it with the stopwatch.

Also enable **Studio Settings > Network > Print Join Size Breakdown**: it prints the top 20 instances by size and a percentage breakdown by class when you start a test.

## Fixes by stage

| Slow stage | Likely cause | Fix |
|---|---|---|
| ReplicatedFirst | big images, models or scripts in it | keep only the loading UI there; small images |
| game.Loaded | huge ReplicatedStorage, no streaming | enable streaming; move assets to ServerStorage and send on demand |
| game.Loaded, unexpectedly | free-model scripts generating thousands of instances | search for unknown scripts; the docs warn about this |
| character | many accessories, server waiting on data before spawning | spawn first, load data in parallel; `CharacterAutoLoads` only off if you have a reason |
| playable | client modules doing heavy synchronous setup | defer non-essential init; spread work across frames |
| everything slow on phone only | too much preloading | preload only loading screen images, main menu art, spawn area |

## Order your startup work

1. **ReplicatedFirst**: show loading UI immediately; call `ReplicatedFirst:RemoveDefaultLoadingScreen()` once your own screen is visible.
2. Wait for `game.Loaded` (check `game:IsLoaded()` first so you do not wait forever if it already fired).
3. Preload only what the first 10 seconds show.
4. Let the player move; load menus, shops and other areas lazily on first open.
5. If you must load a lot, show progress and offer a **Skip** button, as the docs recommend.

## Watch the API calls

The Performance dashboard has a metric, **Client API Calls in First 60s After Join** (only for some top games), whose healthy state is "asset delivery is the most-called API". If inventory, friends or user lookups lead instead, your scripts are making non-critical web calls during join. Even without the metric, avoid calling `GetFriendsAsync`, catalogue lookups or badge checks before the player can move.

## Targets

The docs suggest considering streaming if load times exceed a few seconds on your baseline device. Write your own target down (for example "under 10 s to control on the baseline Android over Wi-Fi") and re-measure after every update; a sudden jump usually means new content landed in ReplicatedStorage.

## Related
[[Performance - Hub]] · [[PreloadAsync and Loading Screens - Preload Less, Load Faster]] · [[Lean ReplicatedStorage - Join Payload Audit and On-Demand Delivery]] · [[Instance Streaming Deep Dive]] · [[Loading and Spawn Pipeline Blueprint]]
