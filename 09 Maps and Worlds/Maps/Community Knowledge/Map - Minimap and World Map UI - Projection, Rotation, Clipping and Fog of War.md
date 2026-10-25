---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Map - Minimap and World Map UI - Projection, Rotation, Clipping and Fog of War"
tags: [roblox, community-knowledge, maps, minimap, ui, navigation]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/viewport-frames
  - https://create.roblox.com/docs/reference/engine/classes/GuiObject
  - https://create.roblox.com/docs/reference/engine/classes/CanvasGroup
  - https://create.roblox.com/docs/reference/engine/classes/StarterGui
  - https://devforum.roblox.com/t/best-way-to-make-a-mini-map-with-live-updates-of-where-the-player-is/366901
---
# Map - Minimap and World Map UI - Projection, Rotation, Clipping and Fog of War

A minimap is the map's second level design: it decides what players think the world looks like. A good one is a simplified drawing with landmarks and objectives, not a photo of every roof. The racing HUD note covers a basic dot-on-image minimap; this note covers a full system: the map image, a rotating circular minimap, a fullscreen world map, edge-clamped icons and fog of war.

## Step 1: the map image
Two options:
| Option | How | Pros | Cons |
|---|---|---|---|
| **Painted image** | Top-down screenshot from Studio (camera high above, low `FieldOfView` to flatten perspective), traced and simplified in an image editor, uploaded as a Decal/Image | Cheapest at runtime, clean and readable | Must redo after map changes |
| **ViewportFrame** | Clone a simplified version of the map into a `ViewportFrame` with its own `Camera` (Roblox's viewport docs list minimaps as a use case) | Live, 3D, no repainting | Costs rendering; keep it to a low-poly proxy, never the full map |

Painted images read better. Draw roads, water, POI outlines and names; leave out props.

## Step 2: world to map coordinates
Record the world bounds the image covers (`minX`, `minZ`, `maxX`, `maxZ`). Then any world position maps to 0-1:

```lua
local MIN = Vector2.new(-1024, -1024) -- world X/Z at the image's top-left
local MAX = Vector2.new(1024, 1024)   -- world X/Z at the image's bottom-right
local function toMap(pos: Vector3): Vector2
	return Vector2.new((pos.X - MIN.X) / (MAX.X - MIN.X), (pos.Z - MIN.Y) / (MAX.Y - MIN.Y))
end
```
Use the result as a `UDim2.fromScale` position for icons on the fullscreen map. Check the axes once by standing at a corner; a flipped Z is the most common bug.

## Step 3: a rotating, round minimap
For a minimap centred on the player that turns with the camera:
1. A `CanvasGroup` as the minimap window with a `UICorner` (`CornerRadius = UDim.new(0.5, 0)`) makes it round. The CanvasGroup docs say it **always clips descendants** and applies `UICorner` to the whole group.
2. Inside it, a large `ImageLabel` of the map, sized so the window shows ~200-400 studs of world.
3. Each frame: move the map image so the player's map point sits at the window centre, and set the image's `Rotation` from the camera yaw.

```lua
local cam = workspace.CurrentCamera
local function yawDegrees(): number
	local look = cam.CFrame.LookVector
	return math.deg(math.atan2(look.X, look.Z))
end
-- every RenderStepped: mapImage.Rotation = yawDegrees() + 180 (sign and offset depend on your image)
```

Clipping caveat from the GuiObject docs: `ClipsDescendants` is ignored when rotated GUI is involved unless `StarterGui.ClipsDescendantsSupportsRotation` is enabled, and even then clipping **by** a rotated parent or by a `UICorner` is not supported. The `CanvasGroup` approach avoids both problems. Note `GuiObject.Rotation` always turns around the object's centre, so rotate a centred holder frame and offset the image inside it.

## Step 4: icons that stay on the edge
Objectives outside the minimap window should stick to its rim, pointing the right way:
- Compute the icon's offset from the player in map pixels, rotate it by the same yaw.
- If its length is larger than the window radius minus a margin, scale it down to that radius.
- Fade or shrink edge icons so they read as "that way", not "here".
Limit icons: players, party members, the current objective, and a few POI types. Fifty icons is noise.

## Step 5: fog of war (optional)
Divide the map into cells (for example 64 x 64 studs). Track visited cells per player on the server (when their character enters a cell) and save them as a compact string or bitset. On the client, draw unrevealed cells as dark squares over the map image, or reveal by region (one "cloud" per POI) to keep it cheap. Revealing a POI when first seen is a strong exploration reward.

## Fullscreen map tips
- Open with M and a button on mobile; pause nothing in multiplayer.
- Let players place a waypoint by clicking; convert the click back with the inverse of `toMap` and show a 3D marker in the world.
- Show floors separately for multi-level buildings.
- Update icons at 10-20 Hz, not every frame, on low-end devices.

## Related
[[Maps - Hub]] - [[Racing - Race HUD - Minimap, Position, Lap and Split Times]] - [[Wayfinding with Landmarks and Weenies]] - [[Advanced Map Readability and Navigation]]
