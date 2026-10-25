---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Workspace Settings Audit - Performance-Relevant Properties"
tags: [roblox, community-knowledge, performance, workspace, settings, audit]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/physics/adaptive-timestepping
  - https://create.roblox.com/docs/performance-optimization/improve
---
# Workspace Settings Audit - Performance-Relevant Properties

The Workspace object holds a long list of switches, many of them `RolloutState` flags that default to whatever the engine-wide rollout currently is. Places created years ago keep old values, copied templates bring someone else's choices, and a single wrong setting (fixed 240 Hz physics, streaming off on a huge map) can cost more than any script fix. Run this audit once per project and again before each major release. Every property below was checked against the Workspace API page on 2026-10-25.

## Streaming group

| Property | What to check |
| --- | --- |
| `StreamingEnabled` | On for any map bigger than a single arena. The Improve Performance guide names it the highest-impact client memory setting. |
| `StreamingTargetRadius` / `StreamingMinRadius` | Start from the recommended values, lower them if mobile memory is tight. |
| `StreamOutBehavior` | `LowMemory` streams out only under memory pressure; `Opportunistic` also streams out content well outside `StreamingTargetRadius`, which keeps memory flatter on long sessions. |
| `StreamingIntegrityMode` | `MinimumRadiusPause` or `PauseOutsideLoadedArea` pause simulation of the player until nearby content arrives; useful on fast-travel games. |
| `ModelStreamingBehavior` | `Improved` never sends models during join (faster joins); `Legacy` sends them with their parent. |
| `PredictiveStreamingMode` | Lets the engine pre-stream along likely paths and spawns. The docs say `Default` currently behaves like `Disabled`. |

`Workspace:ApplyRecommendedStreamingSettings()` (callable from the command bar) changes only the streaming properties that differ from Roblox's current recommendation and returns `true` if it changed anything. Run it on old places, then commit the result to source control so you know what changed.

## Physics group

| Property | What to check |
| --- | --- |
| `PhysicsSteppingMethod` | Keep `Adaptive` unless you have a proven need. Fixed mode steps every assembly at 240 Hz (four steps per 60 FPS frame). |
| `FallenPartsDestroyHeight` | Set just below your lowest playable floor so lost debris gets cleaned up quickly. Clamped to +/-50,000; only settable in Studio, plugins or the command bar. |
| `FallHeightEnabled` | Leave `true`. Turning the kill plane off lets debris fall forever. |
| `TouchesUseCollisionGroups` | Turning it on makes non-colliding groups skip touch events too; cheaper, but can break kill bricks that rely on touches. |
| `FluidForces` | Aerodynamics only if your game needs it; it adds work for parts with `EnableFluidForces`. |
| `ImprovedPhysicsReplication` | Leave at default unless testing a known issue. |

## Rendering and animation group

| Property | What to check |
| --- | --- |
| `MeshStreamingAndImprovedLods` | When enabled, meshes fetch the lowest LOD first and stream higher detail; good for join time on large maps. |
| `RenderingCacheOptimizations` | Caches render state for static objects; helps scenes with many parts. |
| `EnableSLIMAvatars` | With streaming on, distant avatars render as lightweight SLIM versions. |
| `ClientAnimatorThrottling` | Throttles animations on remote models based on visibility, FPS and active animation count. |
| `LayeredClothingCacheOptimizations` | Cache optimizations for layered clothing; matters on avatar-heavy social games. |
| `MeshPartHeadsAndAccessories` | Whether character heads and accessories download as MeshParts. |

## Replication and scripting group

- `SignalBehavior`: `Default` currently equals `Immediate`, and the enum page says it will eventually become `Deferred`. Switching early lets you find ordering bugs on your own schedule; test before shipping it.
- `ReplicateInstanceDestroySetting`: improved replication of server `Destroy()` calls.
- `NextGenerationReplication`: alternate property replication path; check the current DevForum announcement before forcing it.

## Audit script (command bar)

```lua
local ws = workspace
local keys = {
    "StreamingEnabled", "StreamingTargetRadius", "StreamingMinRadius",
    "StreamOutBehavior", "StreamingIntegrityMode", "ModelStreamingBehavior",
    "PhysicsSteppingMethod", "FallenPartsDestroyHeight", "FallHeightEnabled",
    "TouchesUseCollisionGroups", "MeshStreamingAndImprovedLods",
    "RenderingCacheOptimizations", "EnableSLIMAvatars", "SignalBehavior",
}
for _, k in keys do
    local ok, v = pcall(function() return ws[k] end)
    print(("%-30s %s"):format(k, ok and tostring(v) or "(not readable)"))
end
```

Paste the output into your performance log so later regressions can be traced to a settings change.

## Pitfalls

- `RolloutState.Default` changes meaning when Roblox flips a rollout. If a release suddenly behaves differently, compare against the latest DevForum announcement for that flag.
- Some properties are not scriptable at runtime; the pcall above keeps the audit from erroring.
- Never "fix" performance by turning streaming off: it raises memory and join time on every device.

## Related
[[Performance - Hub]] · [[Performance Audit Procedure]] · [[StreamingEnabled Gotchas and Streaming-Safe Client Code]] · [[Physics Throttling, Sleep and Adaptive Timestepping]]
