---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Map - Objective Markers and Off-Screen Arrows - BillboardGui, Edge Clamping and Distance"
tags: [roblox, community-knowledge, maps, waypoints, ui, navigation]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BillboardGui
  - https://create.roblox.com/docs/reference/engine/classes/Camera
  - https://create.roblox.com/docs/reference/engine/classes/ScreenGui
  - https://create.roblox.com/docs/reference/engine/classes/Beam
---
# Map - Objective Markers and Off-Screen Arrows - BillboardGui, Edge Clamping and Distance

Landmarks and lighting guide players who are exploring; markers guide players who have a job to do. A quest giver across town, a teammate who needs help, the flag carrier: these need a marker that is visible through walls, shows distance, and turns into an arrow at the screen edge when the target is behind you. Done badly, markers clutter the screen and players stop looking at the world.

## In-world marker: BillboardGui
- Parent a `BillboardGui` to an `Attachment` or part at the target, or set its `Adornee`. Use `StudsOffsetWorldSpace` to lift it above the head or door.
- **`AlwaysOnTop = true`** to see it through walls. The BillboardGui docs note this also changes its look: colours match a `ScreenGui`, `LightInfluence` is treated as 0 and `Brightness` has no effect.
- **Constant screen size:** give `Size` in offset (pixels), e.g. `UDim2.fromOffset(48, 48)`. Scale-based sizes shrink with distance like a real object, which suits signs but not objective icons.
- **`MaxDistance`** hides it beyond a range. The docs recommend a value high enough that the UI is already small when it pops in or out.
- Show distance as text under the icon, rounded to 10 studs or converted to metres (1 stud = 0.28 m).
- Create markers **on the client** (`LocalScript`) from data the server sends, so each player sees only their own objectives.

## Off-screen arrow: project and clamp
When the target leaves the screen, swap the billboard for a `ScreenGui` arrow on the edge pointing at it.

```lua
-- LocalScript: edge arrow for one target
local RunService = game:GetService("RunService")
local cam = workspace.CurrentCamera
local arrow = script.Parent.Arrow -- ImageLabel, AnchorPoint 0.5,0.5, in a ScreenGui with IgnoreGuiInset = true
local target: BasePart = workspace.Objective
local MARGIN = 48

RunService.RenderStepped:Connect(function()
	local vp = cam.ViewportSize
	local p, onScreen = cam:WorldToViewportPoint(target.Position)
	if onScreen and p.Z > 0 then
		arrow.Visible = false -- the BillboardGui handles on-screen
		return
	end
	local centre = vp / 2
	local dir = Vector2.new(p.X, p.Y) - centre
	if p.Z < 0 then dir = -dir end -- behind the camera: projection is mirrored
	if dir.Magnitude < 1 then dir = Vector2.new(0, 1) end
	-- clamp to the screen rectangle minus a margin
	local half = centre - Vector2.new(MARGIN, MARGIN)
	local s = math.min(half.X / math.abs(dir.X + 1e-6), half.Y / math.abs(dir.Y + 1e-6))
	local pos = centre + dir * s
	arrow.Visible = true
	arrow.Position = UDim2.fromOffset(pos.X, pos.Y)
	arrow.Rotation = math.deg(math.atan2(dir.Y, dir.X)) + 90 -- if the arrow image points up
end)
```
Details from the Camera docs: `WorldToViewportPoint` returns screen position and depth and **ignores the GUI inset**, so put the arrow in a `ScreenGui` with `IgnoreGuiInset = true` (or use `WorldToScreenPoint` instead). A point behind the camera has negative depth; flip the direction or the arrow points the wrong way.

## Path lines
For tutorials or "follow me" moments, a `Beam` between attachments along the route (or a trail of floor arrows) works better than a marker, because it shows the way around walls. Generate waypoints with `PathfindingService` and draw short beam segments between them; remove them when the player arrives.

## Rules that keep the screen clean
- **One primary objective marker** at a time, big and coloured. Secondary markers smaller and paler.
- **Fade markers near the target** (under ~15 studs): the player can see it by then, and the marker covers the thing it points at.
- **Team colours** for teammates; never use the objective colour for anything else.
- **Hide in cutscenes and photo mode.**
- **Don't mark everything.** Exploration games lose their point if every chest has a marker; mark goals, not secrets.
- **Accessibility:** add a shape difference (diamond vs circle), not just colour.

## Testing
- Stand with the target directly behind you: the arrow must point down or to the side, not up.
- Test on phone portrait and landscape; margins must keep arrows clear of the thumbstick and jump button.
- Teleport far away: the distance text should update, and `MaxDistance` must not hide the main objective.

## Related
[[Maps - Hub]] - [[Quest Objective Framework]] - [[Map - Minimap and World Map UI - Projection, Rotation, Clipping and Fog of War]] - [[Wayfinding with Landmarks and Weenies]] - [[Guiding Players with Light, Color and Affordance]]
