---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Custom Gizmos with Handles and ArcHandles"
tags: [roblox, community-knowledge, studio, plugins, gizmos, handles, building]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Handles
  - https://create.roblox.com/docs/reference/engine/classes/ArcHandles
  - https://create.roblox.com/docs/reference/engine/enums/HandlesStyle
  - https://create.roblox.com/docs/reference/engine/classes/ChangeHistoryService
---
# Studio Tools - Custom Gizmos with Handles and ArcHandles

Studio's Move/Scale/Rotate draggers are great for parts. They can't edit things that aren't parts: a spawn zone's radius stored as an attribute, a camera rail's control point, a light's range, a door's swing angle. **Handles** (arrows or spheres along the faces) and **ArcHandles** (rotation rings) let a plugin draw its own drag gizmos in the viewport and turn mouse drags into any value you like. That gives designers direct, visual control instead of typing numbers.

## The two classes

| Class | Looks like | Key members |
| --- | --- | --- |
| `Handles` | Arrows (`Style = Enum.HandlesStyle.Movement`) or spheres (`Resize`, the default) on chosen `Faces` | `MouseButton1Down(face)`, `MouseDrag(face, distance)`, `MouseButton1Up(face)`, `MouseEnter/Leave(face)` |
| `ArcHandles` | Three rotation rings on chosen `Axes` | `MouseButton1Down(axis)`, `MouseDrag(axis, relativeAngle, deltaRadius)`, `MouseButton1Up(axis)` |

Both need `Adornee` set to a 3D object (a `BasePart`; use an invisible helper part for things that aren't parts). **To be clickable they must be parented to `CoreGui` or a PlayerGui**, per the reference. Plugins use `CoreGui`, which also means they are never saved into the place.

## Example: drag a zone radius stored as an attribute

```lua
local CoreGui = game:GetService("CoreGui")
local CHS = game:GetService("ChangeHistoryService")

local function attachRadiusGizmo(zonePart: BasePart)
	local h = Instance.new("Handles")
	h.Style = Enum.HandlesStyle.Resize
	h.Faces = Faces.new(Enum.NormalId.Right, Enum.NormalId.Left)
	h.Adornee = zonePart
	h.Parent = CoreGui

	local startRadius, recording
	h.MouseButton1Down:Connect(function()
		startRadius = zonePart:GetAttribute("Radius") or 10
		recording = CHS:TryBeginRecording("ZoneRadius", "Resize zone radius")
	end)
	h.MouseDrag:Connect(function(_face, distance)
		local r = math.max(1, startRadius + distance)
		r = math.round(r * 2) / 2 -- snap to 0.5 studs
		zonePart:SetAttribute("Radius", r)
		zonePart.Size = Vector3.new(r * 2, zonePart.Size.Y, r * 2)
	end)
	h.MouseButton1Up:Connect(function()
		if recording then
			CHS:FinishRecording(recording, Enum.FinishRecordingOperation.Commit)
			recording = nil
		end
	end)
	return h
end
```

`distance` is the drag length along the handle's axis, measured from where the drag started (as the event works in practice; the reference only names the parameter, so check the sign with a print first). That is why the code keeps `startRadius` from mouse-down instead of adding `distance` each frame.

## Rotation with ArcHandles

`relativeAngle` is the angle in **radians** dragged since mouse-down. Store the starting CFrame on mouse-down and apply `start * CFrame.fromAxisAngle(Vector3.FromAxis(axis), relativeAngle)` on each drag. Snap with `math.rad(StudioService.RotateIncrement)` to match the user's toolbar setting (see [[Studio Tools - Viewport Tools with plugin GetMouse and Activate]]).

## Show gizmos only for the selection

Create gizmos in a `Selection.SelectionChanged` handler for selected objects of your type (for example tagged `SpawnZone`), and destroy the old ones. Keep at most a few dozen at once. Every gizmo is a live 3D GUI object.

## Undo and safety

- Open **one recording on mouse-down** and finish it on mouse-up, so a whole drag is one undo step ([[Studio Tools - Undo-Safe Plugins with ChangeHistoryService Recordings]]).
- If the user presses Escape or another tool takes over mid-drag, `MouseButton1Up` may not fire. Also finish (or cancel) the recording on `plugin.Deactivation` and `Unloading`.
- Destroy everything you parented to `CoreGui` in `plugin.Unloading`. Studio does not clean it up for you ([[Studio Tools - Plugin Cleanup - Unloading, Connections and Reload Safety]]).

## Related adornments

`BoxHandleAdornment`, `SphereHandleAdornment`, `CylinderHandleAdornment` and `LineHandleAdornment` draw non-interactive shapes (and have their own `MouseButton1Down`). They are good for showing radii, paths and trigger volumes. `AlwaysOnTop` and `ZIndex` let them show through walls. For outlines of whole models, `Highlight` works, but Studio shows **at most 255 at once**. See [[Studio Tools - Edit-Mode Overlays - Visualise Tags and Zones from a Plugin]].

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Tools - Selection-Driven Batch Tools - Selection Service and SelectionChanged]] · [[CollectionService Tag-Driven Architecture]] · [[Visual Debugging for Vehicle Physics in Studio]]
