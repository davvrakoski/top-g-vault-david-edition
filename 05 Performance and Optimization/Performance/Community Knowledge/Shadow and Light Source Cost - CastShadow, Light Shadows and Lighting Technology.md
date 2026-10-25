---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Shadow and Light Source Cost - CastShadow, Light Shadows and Lighting Technology"
tags: [roblox, community-knowledge, performance, lighting, shadows, rendering]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/reference/engine/enums/Technology
  - https://create.roblox.com/docs/effects/light-sources
  - https://create.roblox.com/docs/environment/lighting
  - https://devforum.roblox.com/t/878634
  - https://devforum.roblox.com/t/future-vs-shadowmap/658587
  - https://devforum.roblox.com/t/lighting-optimizations/1073832
---
# Shadow and Light Source Cost - CastShadow, Light Shadows and Lighting Technology

Lighting is the part of a Roblox scene where a builder can lose 5 ms of GPU time without adding a single part. A street of shadow-casting point lights, a forest where every leaf mesh casts shadows, or a Future-lit interior with 40 lamps all look fine on a desktop GPU and stall phones. The fixes are mostly property changes, so they are worth knowing before the art pass, not after the launch.

## What the engine does (official guidance)

- **Quality levels:** the Improve Performance guide says the engine degrades shadow quality as the player's graphics quality drops and disables shadows entirely below quality level 4. Your low-end players often never see shadows, so do not rely on shadows for gameplay readability.
- **Technology modes** (`Lighting.Technology`): `Voxel` uses a 4x4x4 voxel light grid; `ShadowMap` adds crisp sun shadows; `Future` is the highest-fidelity mode with shadowed local lights. `Legacy`, `Compatibility` and `Unified` are deprecated.
- **MicroProfiler scopes to watch:** `Perform/Scene/computeLightingPerform` (light grid and shadow updates), `LightGridCPU` (voxel grid updates), `ShadowMapSystem` (shadow mapping).

## What a Roblox rendering engineer added

In the "Future Is Bright Phase 3" release thread (DevForum 878634) the engineering post ranked local light shadow cost: spot light shadows are cheapest when the angle is fairly narrow (below about 120 degrees), surface light shadows next, and point light shadows are the most expensive by a margin. A widely quoted DevForum explanation (exact thread unverified) adds that all modes share the voxel light grid and Future layers shadow-mapped lighting on top of it for nearby lights, which is why many large-range lights scale badly.

## Community experience

- A help thread on lag (Future vs ShadowMap, DevForum 658587) is typical: switching the place from Future to ShadowMap fixed the frame rate, and the advice was that Future gets expensive with many lights.
- Builders in "Lighting optimizations?" (DevForum 1073832) kept Future for its look but only allowed shadows on lights inside buildings, accepting lower fidelity outdoors.

## A practical lighting budget

| Rule | Why |
| --- | --- |
| Pick `ShadowMap` unless interiors truly need shadowed local lights | Biggest single lever |
| Turn `Light.Shadows` off on every fill or accent light | Most lamps do not need to cast shadows to read as lit |
| Use `SpotLight` aimed down instead of `PointLight` for ceiling lamps | Cheaper shadows, better pools of light |
| Keep `Range` as small as the look allows | Fewer light grid cells and shadow pixels affected |
| `CastShadow = false` on grass, leaves, small debris, distant props | The guide calls out dense small shadow casters; warns of possible shadow artifacts |
| Disable shadows on moving objects when possible | Moving casters force shadow updates |
| Switch lights off per room or by distance | The guide suggests room-by-room lighting for interiors |

## Distance-based light culling (client)

```lua
-- Client: enable tagged lamps only within 120 studs of the camera, checked twice a second.
local CollectionService = game:GetService("CollectionService")
local RANGE = 120

task.spawn(function()
    while true do
        local cam = workspace.CurrentCamera.CFrame.Position
        for _, light in CollectionService:GetTagged("CullLight") do
            local holder = light.Parent
            if holder and holder:IsA("BasePart") then
                light.Enabled = (holder.Position - cam).Magnitude < RANGE
            end
        end
        task.wait(0.5)
    end
end)
```

Tag lights rather than scanning the workspace. With streaming enabled, tagged lights that stream out simply disappear from `GetTagged`.

## Checklist before shipping a lit area

1. Count lights with `Shadows = true` in the area; aim for a handful in view, not dozens.
2. Profile on a mid-range phone at graphics level 5-6 and look for the scopes above.
3. Check the area at quality level 1-3 too: no shadows, so silhouettes must still read.
4. Search for `PointLight` instances used as ceiling lamps and convert where possible.

## Related
[[Performance - Hub]] · [[MicroProfiler Reading Guide]] · [[Visual Scalability and Quality Tiers]] · [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]]
