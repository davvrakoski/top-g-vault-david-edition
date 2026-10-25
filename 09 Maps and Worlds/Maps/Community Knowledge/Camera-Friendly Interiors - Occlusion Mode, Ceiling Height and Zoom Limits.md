---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Camera-Friendly Interiors - Occlusion Mode, Ceiling Height and Zoom Limits"
tags: [roblox, community-knowledge, maps, interiors, camera, level-design]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/enums/DevCameraOcclusionMode
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/reference/engine/classes/StarterPlayer
  - https://create.roblox.com/docs/workspace/camera
  - https://devforum.roblox.com/t/invisicam-doesnt-work-in-game/2950137
---
# Camera-Friendly Interiors - Occlusion Mode, Ceiling Height and Zoom Limits

Most Roblox games use the default third-person camera, which orbits the character at a distance the player chooses. Interiors built at real-world scale (2.5 m ceilings, 1 m corridors) fight that camera: it snaps against walls, pops through ceilings, or hides the character behind furniture. Players read this as "the game feels janky" without knowing why. The fix is part level design (room proportions) and part settings (occlusion mode and zoom limits).

## The two engine settings (Engine API)

| Setting | Where | Notes |
| --- | --- | --- |
| `DevCameraOcclusionMode` | `StarterPlayer` | `Zoom` (default) pulls the camera in until nothing blocks the view. `Invisicam` keeps distance and makes blocking objects translucent locally. The Player page says the value comes from StarterPlayer and cannot be changed per player. |
| `CameraMaxZoomDistance` / `CameraMinZoomDistance` | `StarterPlayer` defaults, `Player` per player | Can be changed per player at runtime, which is the useful lever for interiors. |

A DevForum thread (2950137) reports Invisicam set from a LocalScript working in Studio but not in live servers. Set it on StarterPlayer in the place file and test in a live server.

## Which mode suits which map

| Map style | Mode | Why |
| --- | --- | --- |
| Open world, few interiors | Zoom | Natural, no see-through artifacts |
| Dense city, many walls between camera and player | Invisicam | Keeps the player visible without camera snapping |
| Horror, tight corridors | Zoom plus low max zoom | Invisicam reveals what is behind walls and kills tension |
| Top-down or fixed camera games | Custom camera script | Default occlusion does not apply to scripted cameras |

## Room proportions that the default camera tolerates

Our starting values for a default R15 character (about 5 studs tall), not engine rules; test in your game:

- Ceiling height 12-16 studs in rooms players spend time in. Real-scale 9-10 stud ceilings make Zoom mode jam the camera at the shoulder.
- Corridor width 8-10 studs minimum; 6 studs feels like a vent.
- Door openings 6-8 studs wide and 9-10 studs tall, so the camera can follow through without clipping the frame.
- Keep large furniture against walls; a tall shelf in the room's middle constantly blocks the view.
- Avoid low beams and hanging lamps below about 10 studs over walkable floor.

The Map Blockout to Art Pass note covers building a metrics gym; add a "camera corridor" to it with these widths.

## Per-room zoom limits

```lua
-- LocalScript: shorten max zoom inside tagged interior zones.
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local player = Players.LocalPlayer
local OUTDOOR_MAX, INDOOR_MAX = 40, 14

local function insideAny(pos: Vector3): boolean
    for _, zone in CollectionService:GetTagged("InteriorZone") do
        local rel = zone.CFrame:PointToObjectSpace(pos)
        local h = zone.Size / 2
        if math.abs(rel.X) <= h.X and math.abs(rel.Y) <= h.Y and math.abs(rel.Z) <= h.Z then
            return true
        end
    end
    return false
end

task.spawn(function()
    while true do
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            player.CameraMaxZoomDistance = insideAny(root.Position) and INDOOR_MAX or OUTDOOR_MAX
        end
        task.wait(0.25)
    end
end)
```

Interior zone parts are invisible, anchored, with `CanCollide`, `CanTouch` and `CanQuery` off. If the max drops below the current zoom, the camera moves in to the new limit.

## Other fixes builders use

- **Hide the roof:** for top-down-ish interiors, set the roof's `LocalTransparencyModifier` from the client while the player is inside, or put the roof in a model the client hides.
- **Thick walls:** a single paper-thin wall lets the camera sit inside it for a frame; walls of at least 1 stud reduce flicker.
- **Separate interior spaces:** big shops or houses can live in a separate interior area entered through a door teleport, with proportions made for the camera instead of the facade.

## Related
[[Maps - Hub]] · [[Map Blockout to Art Pass Workflow]] · [[Custom Camera Systems in Luau]] · [[Scale in Studs - Real-World Sizes Converted]]
