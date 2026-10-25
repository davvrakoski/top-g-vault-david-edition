---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Pivots for Moving Props - Blender Origins, PivotOffset and Hinges"
tags: [roblox, community-knowledge, 3d-art, blender, pivots]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/pivot-tools
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/reference/engine/classes/Model
  - https://create.roblox.com/docs/reference/engine/classes/PVInstance
---
# Pivots for Moving Props - Blender Origins, PivotOffset and Hinges

Doors, chests, levers, drawbridges and turrets all rotate around one point. If that point is wrong, scripts need ugly offset maths and every door in the game behaves differently. Roblox gives every part and model a pivot (`BasePart.PivotOffset`, `Model.WorldPivot`) that `PVInstance:GetPivot()` and `PivotTo()` use, so the clean approach is: set the pivot once in the art, then script everything through `PivotTo`. Import-time pivot options are covered in [[FBX Import Settings, Scale and Collision Fidelity]]; grid pivots for kit pieces are in [[Modular Kits and Grid Snapping in Studs]]. This note is about props that move.

## Where the pivot should be

| Prop | Pivot location |
|---|---|
| Door | bottom of the hinge edge |
| Chest lid | on the back hinge line |
| Lever | at the base axle |
| Drawer | anywhere; it slides, so use the back centre |
| Turret | yaw axis at the base ring; pitch axis at the barrel trunnion (two separate pieces) |
| Rotating sign / fan | exact centre of rotation |

## Set it in Blender

1. In Edit Mode select the hinge edge or the axle loop.
2. *Shift+S > Cursor to Selected*.
3. Back in Object Mode: *Object > Set Origin > Origin to 3D Cursor*.
4. Apply rotation and scale (*Ctrl+A*) so the pivot axes match world axes. Make the hinge axis a clean world axis (for a door, vertical +Z in Blender, which becomes +Y in Roblox).
5. Export each moving piece as its own object.

## Fix or set it in Studio

- **Pivot tools:** Studio's *Edit Pivot* mode (Model tab) lets you drag the pivot and snap it to a surface or edge. This edits `PivotOffset` on a part or `WorldPivot` on a model without moving the geometry.
- For a **Model** door (frame detail plus panel), set the model's `WorldPivot` to the hinge and set `PrimaryPart` if other code expects one.
- Scripts can read `part.PivotOffset` and set it too, which is useful for generated props.

## Script through the pivot

`PivotTo` moves a part or model so that its pivot lands on a target CFrame. A door then becomes "rotate the closed pivot by an angle":

```lua
local door = workspace.Shed.Door -- Model with WorldPivot on the hinge
local closed = door:GetPivot()

local function setOpen(angleDeg: number)
	door:PivotTo(closed * CFrame.Angles(0, math.rad(angleDeg), 0))
end
```

For smooth motion, tween a `NumberValue` from 0 to 90 and call `setOpen` in its `Changed` event, because `TweenService` cannot tween `PivotTo` directly. For physics-driven doors, put a `HingeConstraint` with both attachments on the hinge line; the pivot then only matters for editing.

## Pitfalls

- Origin at the bounding-box centre (Blender default after many operations): the door spins around its middle.
- Rotation not applied: the hinge axis is tilted a few degrees and the door wobbles as it opens.
- Moving a model with `CFrame` on one part instead of `PivotTo`: the other parts stay behind unless welded.
- Re-importing the mesh: a fresh import can reset a pivot you edited only in Studio. Fix pivots in the source file so re-imports stay correct.

## Related
[[3D Modeling Blender - Hub]] - [[FBX Import Settings, Scale and Collision Fidelity]] - [[Modular Kits and Grid Snapping in Studs]] - [[Art - Low-Poly Vehicle Models - Separate Wheels, Body Parts and Pivots]]
