---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "Lean ReplicatedStorage - Join Payload Audit and On-Demand Delivery"
tags: [roblox, community-knowledge, optimization, load-time, replication, memory]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/performance-optimization/design
  - https://create.roblox.com/docs/reference/engine/classes/ReplicatedStorage
  - https://create.roblox.com/docs/reference/engine/classes/ServerStorage
  - https://create.roblox.com/docs/reference/engine/classes/PlayerGui
---
# Lean ReplicatedStorage - Join Payload Audit and On-Demand Delivery

`ReplicatedStorage` is the default dumping ground: every weapon model, every pet, every map, every sound pack, every free-model leftover. The Improve Performance guide is blunt about the cost: before a player can see or do anything, the client must receive everything in `ReplicatedFirst` and `ReplicatedStorage`, plus the initial Workspace (all of it if streaming is off) and anything scripts preload. Whatever sits in ReplicatedStorage also stays in client memory for the whole session. Trimming it is one of the few changes that improves join time, memory and mobile crash rates at once.

## What belongs where

| Container | Replicates | Put here |
| --- | --- | --- |
| `ReplicatedFirst` | First, before everything | Loading screen UI and its script only |
| `ReplicatedStorage` | To every client at join | Shared ModuleScripts, remotes, small templates used constantly (UI icons used everywhere, the default weapon) |
| `ServerStorage` | Never | Maps not in play, rare items, NPC templates, event content, big audio sets |
| A player's `PlayerGui` | Only to that player | One-off per-player content you clone in on demand |
| Workspace (streaming on) | Near the player | The live world |

## Audit script (command bar)

```lua
-- Lists the biggest top-level folders in ReplicatedStorage by descendant count
-- and counts meshes, images and sounds inside each one.
local rows = {}
for _, child in game.ReplicatedStorage:GetChildren() do
    local n, meshes, sounds, images = 0, 0, 0, 0
    for _, d in child:GetDescendants() do
        n += 1
        if d:IsA("MeshPart") then meshes += 1
        elseif d:IsA("Sound") then sounds += 1
        elseif d:IsA("Decal") or d:IsA("Texture") or d:IsA("ImageLabel") or d:IsA("ImageButton") then images += 1 end
    end
    table.insert(rows, {child:GetFullName(), n, meshes, sounds, images})
end
table.sort(rows, function(a, b) return a[2] > b[2] end)
for _, r in rows do
    print(("%-50s inst=%6d mesh=%4d snd=%4d img=%4d"):format(r[1], r[2], r[3], r[4], r[5]))
end
```

Anything with thousands of instances that a new player does not need in the first minute is a candidate to move. Also look for animation data left inside rigs by animation plugins; the guide calls this out as a hidden replication cost.

## On-demand delivery patterns

**Shared but rare content (event map, boss arena):** keep it in ServerStorage; when it is needed, clone it into Workspace. With streaming on, clients receive only the parts near them. The guide recommends loading large trees in chunks across frames.

**Per-player content (a cosmetic preview, a private menu model):** clone the template from ServerStorage into that player's `PlayerGui` (or a folder inside it). Contents of a player's PlayerGui replicate only to that player, so other clients never download it. The client can then move it into a ViewportFrame or its own local workspace folder.

**Catalog-style content (100 pets):** ship a lightweight data module (names, prices, mesh IDs) in ReplicatedStorage and build the visual from the IDs on the client only when shown. Meshes and images download when first used.

## Before and after

Record these on a mid-range phone, twice each, before and after the move:

- Time from clicking Play to controllable character.
- Client memory after 1 minute (Developer Console).
- Instance count on the client (`#game:GetDescendants()` printed from a LocalScript in a test build).

## Pitfalls

- LocalScripts that `require` a module which references a moved model will error; search for `ReplicatedStorage.` paths before moving.
- `WaitForChild` on content that now arrives later needs a timeout and a fallback.
- Do not swap the problem for `PreloadAsync` on everything; preload only what the loading screen and spawn area need (see the PreloadAsync note).
- Free models dropped into ReplicatedStorage often carry scripts; audit them for backdoors while you are there.

## Related
[[Optimization - Hub]] · [[PreloadAsync and Loading Screens - Preload Less, Load Faster]] · [[Instance Count and Part Budgets]] · [[Map Rotation and Voting - Loading Maps from ServerStorage]]
