---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Memory Limits on Low-End Phones - Budgets and Crash Avoidance"
tags: [roblox, community-knowledge, ui, platform, memory, mobile, performance]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
  - https://create.roblox.com/docs/performance-optimization/design
  - https://create.roblox.com/docs/studio/optimization/memory-usage
  - https://create.roblox.com/docs/reference/engine/classes/Stats
  - https://create.roblox.com/docs/production/analytics/performance
  - https://devforum.roblox.com/t/real-world-building-and-scripting-optimization-for-roblox/3127146
---
# Platform - Memory Limits on Low-End Phones - Budgets and Crash Avoidance

On a phone, running out of memory does not slow the game down politely: the OS kills Roblox and the player sees their home screen. The design-for-performance docs call lower-end mobile devices "severely" memory-limited and prone to out-of-memory (OOM) crashes. Because the typical player is on such a device, client memory is the budget that decides whether your game is playable for most of your audience, not just how smooth it is.

## Who you are building for (Roblox's own numbers)
From Creator Docs, *Test on hardware* (checked 2026-10-25):
- **Android** is roughly **65%** of a typical game's player base.
- Of those, about **60%** have **2 to 4 GB** RAM, about **35%** have 4 to 8 GB, about **5%** more than 8 GB.
- Over **50%** of all Roblox players are on devices scoring **10,000 to 20,000** on Passmark.

Roblox does not get all of that RAM: the docs note the OS and other apps need some. A 2 GB phone leaves well under 2 GB for your game, the engine, avatars and the OS. A community budget from a real project (MrChickenRocket, 2024, summarised in [[Mobile Budgets from a Real Project - Triangles, Draw Calls and Memory]]) targets supporting 2 GB phones.

## Why your Studio numbers lie
- Studio runs the **server and client together**, so memory is "significantly higher" than a real client (docs).
- The Device Emulator checks aspect ratio and controls but is **not accurate for memory**.
- Measure on a device: F9 Developer Console > Memory (Client), or the **Performance Stats** overlay from the in-game settings.

## Reading memory from code
- `Stats:GetTotalMemoryUsageMb()`: OS-reported session memory, close to Task Manager; can differ a lot from the sum of tags because paged-out memory is excluded.
- `Stats:GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.X)`: one category, when memory tracking is on.

A cheap safety valve: when total memory crosses a threshold you set from device testing, shed optional content.

```lua
-- LocalScript: shed optional content under memory pressure (thresholds come from YOUR device tests)
local Stats = game:GetService("Stats")
local SOFT_MB = 1300 -- example value for a 3 GB baseline phone; measure your own

task.spawn(function()
	while true do
		task.wait(10)
		local mb = Stats:GetTotalMemoryUsageMb()
		if mb > SOFT_MB and not workspace:GetAttribute("LowMemory") then
			workspace:SetAttribute("LowMemory", true) -- e.g. unload cosmetic ViewportFrames, stop preloading
			warn(string.format("Low memory mode at %.0f MB", mb))
		end
	end
end)
```

## Where client memory goes, and the fixes
Use the Developer Console categories (explained in [[Developer Console Memory Categories Explained]]):

| Category grows | Typical cause | Fix |
|---|---|---|
| GraphicsTexture | Many unique textures, high-res decals, UI images | Reuse textures, built-in materials (they use far less memory than custom textures, per docs), atlas UI icons |
| GraphicsMeshParts | Duplicate meshes with different IDs | Use packages and reuse one asset (docs) |
| Instances / PlaceMemory | Whole map loaded | **Instance streaming**; split huge worlds into places with teleports |
| LuaHeap | Tables never cleared, caches growing | Disconnect connections, clear caches, check heap snapshots |
| Sounds | Long sounds loaded at once | Stream music, unload unused |
| HttpCache | Everything preloaded | Preload only the first screen's assets |

Also from the docs: do not put everything in `ReplicatedStorage`, because every client downloads and holds it; keep server-only assets in `ServerStorage`.

## Watch it after release
The Performance Dashboard shows client memory and **crash rate** by device over time, with Roblox update annotations. The hardware guide notes a crash uptick after your update usually means a memory regression on low-end devices; compare against the previous place version.

## Baseline routine
1. Pick one baseline phone in the 2 to 4 GB class.
2. Each milestone: join, play the heaviest area 10 minutes, note F9 client memory.
3. Set your soft limit about 15 to 20% under the level where crashes started (vault rule of thumb).
4. Re-test after every big content drop.

## Related
[[UI UX - Hub]] · [[Mobile Budgets from a Real Project - Triangles, Draw Calls and Memory]] · [[Developer Console Memory Categories Explained]] · [[Memory grows over time]]
