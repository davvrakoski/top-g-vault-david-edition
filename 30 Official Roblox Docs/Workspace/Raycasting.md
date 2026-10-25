---
title: "Raycasting"
description: "Raycasting allows you to detect collisions and determine the position of objects."
area: "30 Official Roblox Docs"
cluster: "Workspace"
source: "https://create.roblox.com/docs/workspace/raycasting"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Raycasting allows you to detect collisions and determine the position of objects.*

At its most basic level, **raycasting** is the act of sending out an invisible ray from a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] point in a specific direction with a defined length. Once cast, you can detect if the ray hits a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] cell.

[Video: Laser-Maze.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/raycasting/Laser-Maze.mp4)

*Lasers are fired by floating orbs, and raycasting determines whether a laser hits a platform. Platforms touched by the lasers are temporarily destroyed.*

You can cast a ray with the [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|WorldRoot:Raycast()]] method ([[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|Workspace:Raycast()]]) from a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] origin in a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] direction.

```lua title="Basic Raycast" highlight="4"
local Workspace = game:GetService("Workspace")

local rayOrigin = Vector3.new(0, 0, 0)
local rayDirection = Vector3.new(0, -100, 0)

local raycastResult = Workspace:Raycast(rayOrigin, rayDirection)
```

> [!warning]
> When casting a ray, the direction parameter should encompass the desired length of the ray. For instance, if the magnitude of the direction is 10, the resulting ray will also be of length 10. The maximum length is 15,000 studs.

When applicable, you can calculate an unknown directional vector (`rayDirection`) using a known **origin** and **destination**. This is useful when casting a ray between two points that can change, such as from one player character to another.

1. The origin plus a directional vector indicate the ray's destination:

   \$\text + \text = \text\$

2. Subtract \$\text\$ from both sides of the equation:

   \$\text + \text - \text = \text - \text\$

3. The ray's direction equals the destination minus the origin:

   \$\text = \text - \text\$

```lua highlight="4"
local Workspace = game:GetService("Workspace")

local rayOrigin = Workspace.TestOrigin.Position
local rayDestination = Workspace.TestDestination.Position

local rayDirection = rayDestination - rayOrigin

local raycastResult = Workspace:Raycast(rayOrigin, rayDirection)
```

## Filter options

[[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|WorldRoot:Raycast()]] accepts an optional [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams|RaycastParams]] object which tells the raycast to selectively include or exclude certain [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]], ignore the **Water** material for [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]], or use a [[30 Official Roblox Docs/Workspace/Collisions#Collision filtering|collision group]].

| Key | Description |
| --- | --- |
| `FilterDescendantsInstances` | `Array` of objects whose descendants are used in filtering raycasting candidates. |
| `FilterType` | [[30 Official Roblox Docs/API Reference/Enums/RaycastFilterType\|Enum.RaycastFilterType]] enum which determines how the `FilterDescendantsInstances` array is used in the raycast operation.• [[30 Official Roblox Docs/API Reference/Enums/RaycastFilterType\|Exclude]] — Every [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] is considered **except** those that are descendants of objects in the array.<br>• [[30 Official Roblox Docs/API Reference/Enums/RaycastFilterType\|Include]] — Only [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] that are descendants of objects in the array are considered. |
| `IgnoreWater` | Boolean which determines whether the **Water** material is considered when raycasting against [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]]. |
| `CollisionGroup` | String name of the [[30 Official Roblox Docs/Workspace/Collisions#Collision filtering\|collision group]] used for the raycasting operation. |

```lua title="Raycast Filtering" highlight="4-7,9"
local Workspace = game:GetService("Workspace")

local rayOrigin = Vector3.zero
local rayDirection = Vector3.new(0, -100, 0)

local raycastParams = RaycastParams.new()
raycastParams.FilterDescendantsInstances = {script.Parent}
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
raycastParams.IgnoreWater = true

local raycastResult = Workspace:Raycast(rayOrigin, rayDirection, raycastParams)
```

## Hit detection

If the raycasting operation hits an eligible [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] cell, a [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult|RaycastResult]] object is returned containing the results. To test for a hit, confirm that the result is not `nil` and utilize the following properties as needed.

| Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell that the ray intersected. |
| `Position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] position of the intersection between the ray and the [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]. |
| `Distance` | Distance between the ray origin and intersection point. |
| `Material` | The [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] of the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] at the intersection point. |
| `Normal` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] of the normal vector of the intersected face. |

> [!warning]
> When used in a place with [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|instance streaming]] enabled, a client may not have streamed in distant [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]], so a raycast may not detect a hit. Additionally, low-detail "imposter" [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] and [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] generated by the streaming system are purely visual and are not eligible raycast targets.

> [!info]
> You can exempt any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] from hit detection by setting its [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery|BasePart.CanQuery]] property to `false`.

```lua title="Raycast Hit Detection" highlight="7-11"
local Workspace = game:GetService("Workspace")

local rayOrigin = Vector3.zero
local rayDirection = Vector3.new(0, -100, 0)

local raycastResult = Workspace:Raycast(rayOrigin, rayDirection)

if raycastResult then
	print("Instance:", raycastResult.Instance)
	print("Position:", raycastResult.Position)
	print("Distance:", raycastResult.Distance)
	print("Material:", raycastResult.Material)
	print("Normal:", raycastResult.Normal)
else
	warn("No raycast result!")
end
```

---
*Source: [Raycasting](https://create.roblox.com/docs/workspace/raycasting) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
