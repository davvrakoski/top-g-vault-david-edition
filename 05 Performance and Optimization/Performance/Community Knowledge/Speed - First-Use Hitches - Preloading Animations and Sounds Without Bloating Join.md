---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Speed - First-Use Hitches - Preloading Animations and Sounds Without Bloating Join"
tags: [roblox, community-knowledge, performance, animation, audio, preload, hitches]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Animator
  - https://create.roblox.com/docs/reference/engine/classes/ContentProvider
  - https://create.roblox.com/docs/reference/engine/classes/Sound
  - https://create.roblox.com/docs/performance-optimization/scene-analysis
  - https://create.roblox.com/docs/performance-optimization/improve
---
# Speed - First-Use Hitches - Preloading Animations and Sounds Without Bloating Join

The first time a player swings a new weapon, the swing animation is late or missing and the hit sound is silent; the second swing is fine. That is a first-use hitch: the asset was downloaded on demand. Preloading everything at join fixes the hitch but makes join slower and wastes memory, which the Creator Hub specifically warns against. The right strategy is **just-ahead-of-time** loading: load assets when the player is about to need them, and reuse what is already loaded.

## Animations

**Load tracks once, reuse them.** `Animator:LoadAnimation()` always creates a new `AnimationTrack`. The API reference warns against calling it to "get" an existing track and points to `Animator:GetTrackByAnimationId()` instead, which returns an already loaded track without creating one.

```lua
local function getTrack(animator: Animator, anim: Animation): AnimationTrack
	return animator:GetTrackByAnimationId(anim.AnimationId) or animator:LoadAnimation(anim)
end
```

- Load a character's or tool's tracks when it spawns or is equipped, not on the first attack.
- The `Animator` must be in Workspace before `LoadAnimation`, or it errors.
- Tracks loaded on a destroyed rig stay referenced if your script keeps them; Scene Analysis notes animations are among the most common production memory leaks. Clear your track tables on death or unequip.

**Warm the asset before it is needed.** Pass the `Animation` instances to `ContentProvider:PreloadAsync()` when the related thing becomes likely, for example when a tool appears in the backpack or a boss arena door opens:

```lua
local ContentProvider = game:GetService("ContentProvider")
local function warm(instances: { Instance })
	task.spawn(function() -- PreloadAsync yields; never block gameplay on it
		ContentProvider:PreloadAsync(instances)
	end)
end
warm(tool.Animations:GetChildren())
```

## Sounds

- A `Sound` reports `IsLoaded` and fires `Loaded`. For a sound that must play exactly on time (a gunshot, a UI click), make sure it is loaded before the first use: create and parent it at equip time, and preload its instance with `PreloadAsync`.
- Reuse Sound instances instead of creating one per play; audio memory is tied to instances referencing the asset, and unloads when none do.
- Long music and ambience: load per area or per round, not at join. Stream the next track while the current one plays.

```lua
local function playWhenReady(sound: Sound)
	if sound.IsLoaded then sound:Play() return end
	sound.Loaded:Once(function() sound:Play() end)
end
```

For impact sounds, playing late is often worse than not playing; skip if not loaded.

## What to preload at join vs later

| When | Preload |
|---|---|
| Join (loading screen) | loading-screen images, main menu art, starting area essentials |
| Character spawn | locomotion and default tool animations, footstep sounds |
| Equip / unlock | that tool's animations and sounds |
| Entering a zone | zone music, ambience, enemy animations for that zone |
| Before a cutscene | that cutscene's animations and voice lines, during a short fade |

## Measuring

- **Scene Analysis > Animation memory / Audio memory** (Studio, Window > Performance Summary > Scene Analysis) shows which clips and audio are loaded and which instances hold them.
- `PreloadAsync` takes an optional callback per asset with an `Enum.AssetFetchStatus`; log failures rather than assuming success.
- Test on a phone with a cleared cache over a slow network (Studio network simulation, then a real device); hitches hide on a fast PC with warm caches.

## Pitfalls

- Waiting on `PreloadAsync` inside an input handler: the attack waits for the download. Always preload earlier, in a spawned thread.
- `ContentProvider.RequestQueueSize` loops to "wait for everything": the docs call this unreliable and slow.
- Calling `LoadAnimation` every attack: unbounded new tracks and the performance warning in the reference.

## Related
[[Performance - Hub]] · [[PreloadAsync and Loading Screens - Preload Less, Load Faster]] · [[NPC Animation at Scale - Where to Play Tracks and Animator LOD]] · [[Perf - Sound Instance Budget - Unique Clips, Voice Reuse and Cleanup]]
