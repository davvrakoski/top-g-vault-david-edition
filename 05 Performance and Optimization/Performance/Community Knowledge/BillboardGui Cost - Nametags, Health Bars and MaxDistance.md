---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "BillboardGui Cost - Nametags, Health Bars and MaxDistance"
tags: [roblox, community-knowledge, performance, ui, billboardgui, npc]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BillboardGui
  - https://devforum.roblox.com/t/billboard-gui-causing-fps-lag/3542255
  - https://devforum.roblox.com/t/whats-the-practical-limit-for-billboardguis-how-many-can-there-be-in-a-scene-before-i-have-to-worry/3958385
  - https://devforum.roblox.com/t/how-to-render-hundreds-of-billboards-without-lag/4025769
---
# BillboardGui Cost - Nametags, Health Bars and MaxDistance

Overhead UI is everywhere in Roblox games: nametags, NPC health bars, damage numbers, shop prices floating over items, quest markers. Each one is a `BillboardGui` that the client renders in 3D every frame it is visible. One or two dozen are cheap; a tower-defense lane with 200 enemies, each with a health bar and a level label, is not. The cost is easy to miss in Studio on a strong PC and obvious on a phone.

## What is known

- **Not free (staff replies):** In "Billboard GUI causing FPS lag" (DevForum 3542255, March 2025) a developer showed FPS dropping from a capped 240 to about 90-150 with billboards over NPCs on a high-end desktop. Replies speaking for the Roblox team (MetaVars, DrRanchDressing) said that neither text nor billboard rendering is low impact, that billboards have some overhead, and that UI performance work was ongoing. A later reply in the same thread reported 20 visible billboards taking FPS from 240 to about 130.
- **MaxDistance is the first lever:** Community replies in the practical-limit thread (3958385) and the "hundreds of billboards" thread (4025769) recommend setting `MaxDistance` so far-away billboards do not draw, and streaming so far NPCs do not exist on the client.
- **Changes cost more than static content:** the same practical-limit thread warns that constantly editing billboard contents hurts performance; a health bar tweened every frame is worse than one that updates on damage.

## Budget rules

| Rule | Starting value (ours) |
| --- | --- |
| `MaxDistance` on every billboard | 40-80 studs for NPC bars, 100-150 for player nametags |
| Health bars shown only after damage or on hover | Hide after 3-5 s without damage |
| Max simultaneous damage numbers | 10-20, pooled, oldest recycled |
| Update rate | On change only; never write `Size` or `Text` every frame |
| Billboards per enemy | One, with all elements inside it |

## Implementation pattern: show on damage

```lua
-- Client: one pooled health bar per NPC, visible only for a few seconds after damage.
local SHOW_FOR = 4
local function attachBar(npc: Model, template: BillboardGui)
    local hum = npc:FindFirstChildOfClass("Humanoid")
    local head = npc:FindFirstChild("Head")
    if not (hum and head) then return end
    local bar = template:Clone()
    bar.Adornee = head
    bar.MaxDistance = 60
    bar.Enabled = false
    bar.Parent = head
    local fill = bar:FindFirstChild("Fill", true) :: Frame
    local token = 0
    hum.HealthChanged:Connect(function(health)
        fill.Size = UDim2.fromScale(math.clamp(health / hum.MaxHealth, 0, 1), 1)
        bar.Enabled = true
        token += 1
        local mine = token
        task.delay(SHOW_FOR, function()
            if token == mine then bar.Enabled = false end
        end)
    end)
end
```

A disabled billboard (`Enabled = false`) is not rendered, which is the cheapest state.

## Other choices

- **Player nametags:** consider the built-in Humanoid display name (`DisplayDistanceType`, `NameDisplayDistance`) instead of custom billboards when the default look is acceptable.
- **Prices over shop items:** use a single `SurfaceGui` on a sign, or show the price in a screen-space prompt only when the player is close (`ProximityPrompt` already has `MaxActivationDistance`).
- **Quest markers:** one screen-space marker that you position with `Camera:WorldToViewportPoint` can replace many world billboards when markers are far.
- **Text effects:** avoid `UIGradient` and `UIStroke` stacks inside high-count billboards; see the UI performance note.

## How to check

1. Spawn your worst-case enemy count in a test place.
2. Compare FPS and the MicroProfiler with billboards enabled and disabled (toggle `Enabled` on all of them with a debug key).
3. Test on a mid-range phone. If the difference is more than a few milliseconds per frame, apply the rules above.

## Related
[[Performance - Hub]] · [[UI Performance - Gradients, Big Lists and Per-Frame Updates]] · [[NPC Crowds, Animation LOD and Server Budgets]] · [[Mobile Performance Deep Dive]]
