---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/preloadasync-loading-screens"
title: "PreloadAsync and Loading Screens - Preload Less, Load Faster"
tags: [roblox, community, "cluster/performance-and-security", loading, memory, mobile]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ContentProvider#PreloadAsync
  - https://devforum.roblox.com/t/speed-up-loading-screen/3840882
  - https://devforum.roblox.com/t/properly-using-preloadasync/1148953
---
# PreloadAsync and Loading Screens - Preload Less, Load Faster

The most common slow loading screen on the DevForum looks like this: loop over `game:GetDescendants()` and call `PreloadAsync` on every item. Asher (asher_dz, Jul 2025) did exactly that and asked why loading took so long. The replies: **stop preloading the whole game.**

## What PreloadAsync actually does (Creator Hub)

- It **yields until the assets behind the given Instances have loaded**: decal images, sounds, meshes and similar. A callback runs per asset with its `Enum.AssetFetchStatus`.
- Failed assets print an error, but the method itself doesn't throw. It keeps going until the whole list is done.
- **SurfaceAppearance and MaterialVariant aren't supported.** Calling it on them does nothing. Their textures still stream in at runtime.
- When you preload assets for **non-visible** instances, the engine stores them in the disk cache and may unload them from memory afterwards. Preloading isn't a way to "pin" textures in RAM.
- Don't build progress bars from `ContentProvider.RequestQueueSize`. The docs say it can go up and down as assets are added. To show progress, preload items one at a time.

## Community advice (DevForum, 2021 to 2025)

- HenryBenryDev: ContentProvider is mostly useful for **images, meshes and sounds**. For plain parts it mostly just yields. Gather only decals, textures, sounds and meshes into one list and preload that.
- DadCatGames: choose by type, or **tag** the assets you care about (`CollectionService` tag such as `Preload`) and preload only those.
- In the loading screen itself, use `task.wait`, not the deprecated `wait`.
- Jackscarlett (2021) suggested passing **Instances**, not raw strings, to be safe. That was their reading of older forum posts, not something the docs require.

## What's worth preloading

| Preload | Skip |
|---|---|
| Loading screen and main menu images | Everything in Workspace |
| Your first-screen HUD icons | Far-away map content, especially with streaming on |
| Sounds that play in the first seconds (UI clicks, intro music) | SurfaceAppearance and MaterialVariant (not supported) |
| The animation set for the player's starting character or weapon | Rare cosmetics, shop thumbnails behind a menu |

## Original tagged preloader (client, in ReplicatedFirst)

```lua
local ContentProvider = game:GetService("ContentProvider")
local CollectionService = game:GetService("CollectionService")

local MAX_WAIT = 8 -- seconds; never trap a player behind a stuck asset

local function preloadTagged(onProgress: (number, number) -> ())
	local list = CollectionService:GetTagged("Preload")
	local total, done = #list, 0
	local finished = false
	task.delay(MAX_WAIT, function() finished = true end)
	for _, inst in list do
		if finished then break end
		ContentProvider:PreloadAsync({ inst }) -- one at a time so progress is honest
		done += 1
		onProgress(done, total)
	end
end

return preloadTagged
```

Keep the tagged set small. A loading screen that takes longer than the engine's own join adds wait time without adding quality. Use a time cap like the one above, so one slow asset can't stall the screen forever.

## Credits

Roblox Creator Hub, *ContentProvider* reference (CC BY 4.0). DevForum: asher_dz, HenryBenryDev, DadCatGames (*Speed Up Loading Screen*, 2025); ChetRChase, Jackscarlett (*Properly using PreloadAsync*, 2021). The code above is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[ContentProvider]] · [[Texture Memory and Triangle Budgets for Roblox Scenes]] · [[StreamingEnabled Gotchas and Streaming-Safe Client Code]] · [[Mobile Performance Deep Dive]]

<!-- TDOD_GRAPH_END -->
