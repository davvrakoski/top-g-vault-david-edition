---
title: "WorldRoot"
description: "Base class for handling physics simulation and 3D spatial queries."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/WorldRoot"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Base class for handling physics simulation and 3D spatial queries.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], [[30 Official Roblox Docs/API Reference/Classes/WorldModel|WorldModel]]
- **Memory category:** BaseParts
- **Tags:** `NotCreatable`

## Description

This base class provides an API for any instance intended for handling 3D spatial queries and simulation, such as [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] and [[30 Official Roblox Docs/API Reference/Classes/WorldModel|WorldModel]].

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#ArePartsTouchingOthers\|ArePartsTouchingOthers()]] | boolean | Returns true if any of the given [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] are touching any other parts. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Blockcast\|Blockcast()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult\|RaycastResult]]? | Casts a block shape in a given direction and returns a [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult\|RaycastResult]] if the shape hits a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#BulkMoveTo\|BulkMoveTo()]] | () | Moves an array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] to an array of [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrames]]. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#CollisionGroupsAreCollidable\|CollisionGroupsAreCollidable()]] | boolean | Returns whether the two groups will collide in this world. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#CollisionGroupSetCollidable\|CollisionGroupSetCollidable()]] | () | Sets the collision status between two groups in this world. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartOnRay\|FindPartOnRay()]] | Tuple | **Deprecated.** Returns the first [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell intersecting with the given [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]]. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#findPartOnRay\|findPartOnRay()]] | Tuple | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartOnRayWithIgnoreList\|FindPartOnRayWithIgnoreList()]] | Tuple | **Deprecated.** Returns the first [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell intersecting with the given [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] that isn't in, nor is a descendant of an object in, the given ignore list. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartOnRayWithWhitelist\|FindPartOnRayWithWhitelist()]] | Tuple | **Deprecated.** Returns the first [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell intersecting with the given [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] that is in, or is a descendant of an object in, the given inclusion list. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartsInRegion3\|FindPartsInRegion3()]] | List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | **Deprecated.** Returns an array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] in the given [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]]. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#findPartsInRegion3\|findPartsInRegion3()]] | List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartsInRegion3WithIgnoreList\|FindPartsInRegion3WithIgnoreList()]] | List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | **Deprecated.** Returns an array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] in the given [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] that aren't in, or a descendant of an entry in, the given ignore list. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartsInRegion3WithWhiteList\|FindPartsInRegion3WithWhiteList()]] | List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | **Deprecated.** Returns an array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] in the given [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] that are in, or descendant of an entry in, the given inclusion list. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetMaxCollisionGroups\|GetMaxCollisionGroups()]] | int | Returns the maximum number of collision groups in this world. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartBoundsInBox\|GetPartBoundsInBox()]] | List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | Returns an array of parts whose **bounding boxes** overlap a given box. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartBoundsInRadius\|GetPartBoundsInRadius()]] | List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | Returns an array of parts whose **bounding boxes** overlap a given sphere. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartsInPart\|GetPartsInPart()]] | List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | Returns an array of parts whose occupied space is shared with the given part. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetRegisteredCollisionGroups\|GetRegisteredCollisionGroups()]] | Array | Returns a table with info on all of this world's collision groups. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#IKMoveTo\|IKMoveTo()]] | () | Moves the specified part to the specified location via inverse kinematics rather than moving it there directly, to ensure any joints, constraints, or collisions that part is participating in remain physically satisfied. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#IsCollisionGroupRegistered\|IsCollisionGroupRegistered()]] | boolean | Checks if a collision group is registered in this world. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#IsRegion3Empty\|IsRegion3Empty()]] | boolean | **Deprecated.** Returns a bool indicating whether there are no [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] within the given [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]]. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#IsRegion3EmptyWithIgnoreList\|IsRegion3EmptyWithIgnoreList()]] | boolean | **Deprecated.** Returns a boolean indicating whether there are no [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] within the given [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]], ignoring any [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] that are descendants of the objects within the given ignore list. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast\|Raycast()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult\|RaycastResult]]? | Casts a ray using an origin, direction, and optional [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams\|RaycastParams]], then returns a [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult\|RaycastResult]] if an eligible object or terrain intersects the ray. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#RegisterCollisionGroup\|RegisterCollisionGroup()]] | () | Registers a new collision group in this world with the given name. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#RenameCollisionGroup\|RenameCollisionGroup()]] | () | Renames specified collision group in this world. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Shapecast\|Shapecast()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult\|RaycastResult]]? | Casts the shape of a given [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] in a direction and returns a [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult\|RaycastResult]] if the shape hits a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Spherecast\|Spherecast()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult\|RaycastResult]]? | Casts a spherical shape in a given direction and returns a [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult\|RaycastResult]] if the shape hits a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#StepPhysics\|StepPhysics()]] | () | Advances the simulation for parts in the world forward based on a specified time increment and an optional set of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]]. |
| [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#UnregisterCollisionGroup\|UnregisterCollisionGroup()]] | () | Unregisters the collision group for the given name in this world. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### ArePartsTouchingOthers

```lua
WorldRoot:ArePartsTouchingOthers(partList: Instances, overlapIgnored: float = 0.000199999995): boolean
```

**Thread safety:** Unsafe

**ArePartsTouchingOthers** returns true if at least one of the given [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] are touching any other parts. Two parts are considered "touching" if they are within the distance threshold, `overlapIgnored`.

If no parts are provided, false is returned.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `partList` | Instances |  | A list of parts checks to see if any parts in the list are touching any parts not in the list. |
| `overlapIgnored` | float | `0.000199999995` | The part overlap threshold in studs that is ignored before parts are considered to be touching. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | True if and only if any of the [[30 Official Roblox Docs/API Reference/Classes/Part\|parts]] in `partList` are touching any other parts (parts not in the partList). False if no parts are passed. |

*Code samples for this member (`checking-for-touching-parts`) are published on the source page; their code is not part of the open-source repo.*

### Blockcast

```lua
WorldRoot:Blockcast(cframe: CFrame, size: Vector3, direction: Vector3, params: RaycastParams = RaycastParams{IgnoreWater=false, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}): RaycastResult?
```

**Thread safety:** Safe

Casts a block shape in a given direction and returns the first collision with a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] cell. This is analogous to how [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|WorldRoot:Raycast()]] casts a linear ray in a direction to find a collision, but it uses a 3D shape instead of a ray.

Unlike [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartsInPart|WorldRoot:GetPartsInPart()]], this method does not detect [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] that **initially** intersect the shape.

If a hit is detected, a [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult|RaycastResult]] is returned containing the hit information. The [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult#Distance|Distance]] property represents the distance the shape has to travel to find a hit, and the [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult#Position|Position]] property represents the intersection point that causes the hit.

This method throws an error if it is passed invalid [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], size, or direction inputs.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `cframe` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The initial position and rotation of the cast block shape. |
| `size` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The size of the cast block shape in studs. The maximum size is 512 studs. |
| `direction` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Direction of the shapecast, with the magnitude representing the maximum distance the shape can travel. The maximum distance is 1024 studs. |
| `params` | [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams\|RaycastParams]] | `RaycastParams{IgnoreWater=false, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}` | An object used to specify hit eligibility in the shapecast operation. If not provided, default values are used where all parts are considered and [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] water is not ignored. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult\|RaycastResult]]? | Contains the result of the shapecast operation, or `nil` if no eligible [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell was hit. |

*Code samples for this member (`worldroot---blockcast`) are published on the source page; their code is not part of the open-source repo.*

### BulkMoveTo

```lua
WorldRoot:BulkMoveTo(partList: Instances, cframeList: Array, eventMode: BulkMoveMode = FireAllEvents): ()
```

**Thread safety:** Unsafe

This function moves an array of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] to an array of [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]] without necessarily firing the default property [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] events. This provides a very fast way to move large numbers of parts, as you don't have to pay the cost of separate property sets for each individual part.

Both `partList` and `cframeList` are sequential arrays (Luau tables with integer indices starting at 1), not dictionaries. Each part at index `i` in `partList` is moved to the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] at index `i` in `cframeList`. The arrays must contain the same number of entries.

```lua
local Workspace = game:GetService("Workspace")

local partList = { Workspace.Part1, Workspace.Part2 }
local cframeList = { CFrame.new(0, 5, 0), CFrame.new(10, 5, 0) }
Workspace:BulkMoveTo(partList, cframeList, Enum.BulkMoveMode.FireCFrameChanged)
```

The third argument allows you to further optimize the movement operation. By default, the [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] event of each part fires for [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|Position]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Orientation|Orientation]], and [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|CFrame]]. However, if you specify [[30 Official Roblox Docs/API Reference/Enums/BulkMoveMode|FireCFrameChanged]] as the third argument, only the [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] event for the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|CFrame]] property will fire.

Note that you should only use this function if you're sure that part movement is a bottleneck in your code. Simply setting the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|CFrame]] property of individual parts and welded models is fast enough in the majority of cases.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `partList` | Instances |  | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] to be moved. Each entry is matched by index to the corresponding entry in `cframeList`. |
| `cframeList` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrames]] that the parts will be moved to, matched by index to `partList`. Both arrays must be the same length. |
| `eventMode` | [[30 Official Roblox Docs/API Reference/Enums/BulkMoveMode\|BulkMoveMode]] | `FireAllEvents` | An [[30 Official Roblox Docs/API Reference/Enums/BulkMoveMode\|Enum.BulkMoveMode]] enum specifying which [[30 Official Roblox Docs/API Reference/Classes/Object#Changed\|Changed]] events fire during the move. Default is [[30 Official Roblox Docs/API Reference/Enums/BulkMoveMode\|FireAllEvents]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### CollisionGroupsAreCollidable

```lua
WorldRoot:CollisionGroupsAreCollidable(name1: string, name2: string): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Returns whether the two specified collision groups will collide in this world. This method will also return `true` if either of the groups are unregistered in this world, as the default collision mask collides with all groups.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name1` | string |  |  |
| `name2` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### CollisionGroupSetCollidable

```lua
WorldRoot:CollisionGroupSetCollidable(name1: string, name2: string, collidable: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Sets the collision status between two groups in this world. This method will throw an error if either of the groups is unregistered in this world, so it's recommended that you confirm each group's registration through [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#IsCollisionGroupRegistered|WorldRoot:IsCollisionGroupRegistered()]] before making this call.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name1` | string |  |  |
| `name2` | string |  |  |
| `collidable` | boolean |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### FindPartOnRay

> [!warning] Deprecated
> This function has been deprecated. Use `Class.WorldRoot:Raycast()` along
> with `Datatype.RaycastParams` for new work.

```lua
WorldRoot:FindPartOnRay(ray: Ray, ignoreDescendantsInstance: Instance = nil, terrainCellsAreCubes: boolean = False, ignoreWater: boolean = False): Tuple
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**FindPartOnRay** uses [[30 Official Roblox Docs/Workspace/Raycasting|raycasting]] to find the first [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] cell intersecting with a given [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]]. This function returns the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or terrain cell hit, the point of intersection, the surface normal at the point of intersection, and the associated [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]] hit.

If the `ignoreDescendantsInstance` parameter is provided, the raycasting calculation will ignore the given object and all of its descendants. It behaves similar to the [[30 Official Roblox Docs/API Reference/Classes/Mouse#TargetFilter|Mouse.TargetFilter]] property.

The `terrainCellsAreCubes` and `ignoreWater` parameters determine whether [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] cells should be treated as cubes or not, and whether water should be ignored or not.

In order to include or exclude multiple objects and their descendants, use the [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartOnRayWithWhitelist|WorldRoot:FindPartOnRayWithWhitelist()]] and [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartOnRayWithIgnoreList|WorldRoot:FindPartOnRayWithIgnoreList()]] variants.

#### Notes

- Theoretically, a ray extends infinitely in one direction. However, the max length of the direction vector on Roblox is 15000 studs.
- The length (magnitude) of the directional vector is important, as parts further away than its length will not be tested.
- If the ray does not intersect anything, the return values will be `nil` and the point at the end of the ray, respectively.
- Parts that are in a [[30 Official Roblox Docs/Workspace/Collisions#Collision filtering|collision group]] that does not collide with the "Default" collision group are ignored implicitly.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `ray` | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] whose origin and direction define the raycast. |
| `ignoreDescendantsInstance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | An [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] whose descendants are ignored in the raycast. |
| `terrainCellsAreCubes` | boolean | `False` | Whether [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cells are treated as full cubes when calculating intersection. Default is false. |
| `ignoreWater` | boolean | `False` | Whether [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] water cells are ignored by the ray. Default is false. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell hit, the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] point of intersection, the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] surface normal at the point of intersection, and the [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] of the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or terrain cell hit. |

### findPartOnRay

> [!warning] Deprecated
> This deprecated function is a variant of `Class.WorldRoot:FindPartOnRay()`
> which should be used instead.

```lua
WorldRoot:findPartOnRay(ray: Ray, ignoreDescendantsInstance: Instance = nil, terrainCellsAreCubes: boolean = False, ignoreWater: boolean = False): Tuple
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `ray` | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] |  |  |
| `ignoreDescendantsInstance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` |  |
| `terrainCellsAreCubes` | boolean | `False` |  |
| `ignoreWater` | boolean | `False` |  |

**Returns**

| Type | Description |
| --- | --- |
| Tuple |  |

### FindPartOnRayWithIgnoreList

> [!warning] Deprecated
> This function has been deprecated. Use `Class.WorldRoot:Raycast()` along
> with `Datatype.RaycastParams` for new work.

```lua
WorldRoot:FindPartOnRayWithIgnoreList(ray: Ray, ignoreDescendantsTable: Instances, terrainCellsAreCubes: boolean = False, ignoreWater: boolean = False): Tuple
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

This function is a variant of [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartOnRay|WorldRoot:FindPartOnRay()]] with the addition of an ignore list. This lets you ignore certain parts or [[30 Official Roblox Docs/API Reference/Classes/Model|Models]].

Those looking to **include** a specific group of objects should instead use [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartOnRayWithWhitelist|WorldRoot:FindPartOnRayWithWhitelist()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `ray` | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] whose origin and direction define the raycast. |
| `ignoreDescendantsTable` | Instances |  | An array of objects whose descendants are excluded from the raycast. |
| `terrainCellsAreCubes` | boolean | `False` | Whether [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cells are treated as full cubes when calculating intersection. Default is false. |
| `ignoreWater` | boolean | `False` | Whether [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] water cells are ignored by the ray. Default is false. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell hit, the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] point of intersection, the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] surface normal at the point of intersection, and the [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] of the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or terrain cell hit. |

### FindPartOnRayWithWhitelist

> [!warning] Deprecated
> This function has been deprecated. Use `Class.WorldRoot:Raycast()` along
> with `Datatype.RaycastParams` for new work.

```lua
WorldRoot:FindPartOnRayWithWhitelist(ray: Ray, whitelistDescendantsTable: Instances, ignoreWater: boolean = False): Tuple
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

This function is a variant of [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartOnRay|WorldRoot:FindPartOnRay()]] with the addition of an inclusion list. This lets you detect only certain parts or [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] and is particularly useful when, for example, looking for points of intersection between a ray and a single part.

If a `nil` value is given in the inclusion list, instances after it will be disregarded.

Those looking to **exclude** a specific group of objects should instead use [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartOnRayWithIgnoreList|WorldRoot:FindPartOnRayWithIgnoreList()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `ray` | [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/Ray\|Ray]] whose origin and direction define the raycast. |
| `whitelistDescendantsTable` | Instances |  | An array of objects whose descendants are the only candidates considered in the raycast. |
| `ignoreWater` | boolean | `False` | Whether [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] water cells are ignored by the ray. Default is false. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell hit, the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] point of intersection, the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] surface normal at the point of intersection, and the [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] of the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or terrain cell hit. |

### FindPartsInRegion3

> [!warning] Deprecated
> This function has been deprecated. Use
> `Class.WorldRoot:GetPartBoundsInBox()` along with `Datatype.OverlapParams`
> for new work.

```lua
WorldRoot:FindPartsInRegion3(region: Region3, ignoreDescendantsInstance: Instance = nil, maxParts: int = 20): List<BasePart>
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in the given [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]].

This function takes an optional maxParts parameter (default 20) which limits the number of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] that can be returned. Once this number has been reached, the search for [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] will stop. This means some [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] may not be returned even if they are within the [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]]

The optional `ignoreDescendantsInstance` parameter can be used to specify a specific instance for whom itself and all of its descendants should be ignored by this function. This can be useful when, for example, looking to see if any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are inside a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] other than the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] itself.

```
local min = part.Position - (0.5 * part.Size)
local max = part.Position + (0.5 * part.Size)
local region = Region3.new(min, max)
local parts = worldroot:FindPartsInRegion3(region, part)  -- Ignore part
```

The [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartsInRegion3WithIgnoreList|WorldRoot:FindPartsInRegion3WithIgnoreList()]] and [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartsInRegion3WithWhiteList|WorldRoot:FindPartsInRegion3WithWhiteList()]] variants of this method exist to provide specific exclusion and inclusion functionality.

If no [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are found, an empty array will be returned.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] to be checked. |
| `ignoreDescendantsInstance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | An [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] to be ignored. |
| `maxParts` | int | `20` | The maximum amount of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] to be returned. |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] within the [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]]. |

### findPartsInRegion3

> [!warning] Deprecated
> This deprecated function is a variant of
> `Class.WorldRoot:FindPartsInRegion3()` which should be used instead.

```lua
WorldRoot:findPartsInRegion3(region: Region3, ignoreDescendantsInstance: Instance = nil, maxParts: int = 20): List<BasePart>
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] |  |  |
| `ignoreDescendantsInstance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` |  |
| `maxParts` | int | `20` |  |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> |  |

### FindPartsInRegion3WithIgnoreList

> [!warning] Deprecated
> This function has been deprecated. Use
> `Class.WorldRoot:GetPartBoundsInBox()` along with `Datatype.OverlapParams`
> for new work.

```lua
WorldRoot:FindPartsInRegion3WithIgnoreList(region: Region3, ignoreDescendantsTable: Instances, maxParts: int = 20): List<BasePart>
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in the given [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] that aren't in, or a descendant of an entry in, the given ignore list.

If a `nil` value is given in the ignore list, instances after this value will not be ignored. If no [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are found, an empty array will be returned.

This function is a variant of [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartsInRegion3|WorldRoot:FindPartsInRegion3()]] with the addition of an ignore list. This allows the developer to exclude certain [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] or [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] from the search. Those looking to find [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in a [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] using an inclusion list should use [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartsInRegion3WithWhiteList|WorldRoot:FindPartsInRegion3WithWhiteList()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] to be checked. |
| `ignoreDescendantsTable` | Instances |  | An array of objects to be ignored. |
| `maxParts` | int | `20` | The maximum number of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] to be returned. |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] found within the [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]]. |

### FindPartsInRegion3WithWhiteList

> [!warning] Deprecated
> This function has been deprecated. Use
> `Class.WorldRoot:GetPartBoundsInBox()` along with `Datatype.OverlapParams`
> for new work.

```lua
WorldRoot:FindPartsInRegion3WithWhiteList(region: Region3, whitelistDescendantsTable: Instances, maxParts: int = 20): List<BasePart>
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in the given [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] that are in, or descendant of an entry in, the given inclusion list.

If a `nil` value is given in the inclusion list, instances after this value will not be ignored. If no [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are found, an empty array will be returned.

This function is a variant of [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartsInRegion3|WorldRoot:FindPartsInRegion3()]] with the addition of an inclusion list. This allows the developer to include only certain [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] or [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] in the search. Those looking to find [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in a [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] using an exclusion list should use [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartsInRegion3WithIgnoreList|WorldRoot:FindPartsInRegion3WithIgnoreList()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] to be checked. |
| `whitelistDescendantsTable` | Instances |  | An array of objects to check. |
| `maxParts` | int | `20` | The maximum number of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] to be returned. |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] within the [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]]. |

### GetMaxCollisionGroups

```lua
WorldRoot:GetMaxCollisionGroups(): int
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Returns the maximum number of collision groups the engine supports per world. This value is currently 32.

**Returns**

| Type | Description |
| --- | --- |
| int |  |

### GetPartBoundsInBox

```lua
WorldRoot:GetPartBoundsInBox(cframe: CFrame, size: Vector3, overlapParams: OverlapParams = OverlapParams{MaxParts=0, Tolerance=0, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}): List<BasePart>
```

**Thread safety:** Safe · **Tags:** `CustomLuaState`

[[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartBoundsInBox|WorldRoot:GetPartBoundsInBox()]] returns an array of parts whose **bounding boxes** overlap a box whose volume is described using the given center ([[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]) and size ([[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]).

As emphasized, this spatial query method efficiently considers the volume of parts' bounding boxes rather than their actual occupied volume. This may be important when considering cylinders, spheres, unions, and [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] which have non-block shapes. For cases where accuracy especially matters, use [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartsInPart|WorldRoot:GetPartsInPart()]] instead, or further filter the results of this method yourself.

This method uses a [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams|OverlapParams]] object to describe reusable portions of the spatial query, such as an inclusion or exclusion list, the maximum number of parts to query, what [[30 Official Roblox Docs/Workspace/Collisions#Collision filtering|collision group]] to use, and whether the query favors an intersected part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|BasePart.CanCollide]] value over its [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery|BasePart.CanQuery]] value.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `cframe` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The location of the center of the given box volume to be queried. |
| `size` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The size of the given box volume to be queried. |
| `overlapParams` | [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams\|OverlapParams]] | `OverlapParams{MaxParts=0, Tolerance=0, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}` | Contains reusable portions of the spatial query parameters. |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] which matched the spatial query. |

### GetPartBoundsInRadius

```lua
WorldRoot:GetPartBoundsInRadius(position: Vector3, radius: float, overlapParams: OverlapParams = OverlapParams{MaxParts=0, Tolerance=0, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}): List<BasePart>
```

**Thread safety:** Safe · **Tags:** `CustomLuaState`

[[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartBoundsInRadius|WorldRoot:GetPartBoundsInRadius()]] returns an array of parts whose **bounding boxes** overlap a sphere whose volume is described using the given center ([[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]) and radius (number).

As emphasized, this spatial query method efficiently considers the volume of parts' bounding boxes rather than their actual occupied volume. This may be important when considering cylinders, spheres, unions, and [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] which have non-block shapes. For cases where accuracy especially matters, use [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartsInPart|WorldRoot:GetPartsInPart()]] instead, or further filter the results of this method yourself.

This method uses a [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams|OverlapParams]] object to describe reusable portions of the spatial query, such as an inclusion or exclusion list, the maximum number of parts to query, what [[30 Official Roblox Docs/Workspace/Collisions#Collision filtering|collision group]] to use, and whether the query favors an intersected part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|BasePart.CanCollide]] value over its [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery|BasePart.CanQuery]] value.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The location of the center of the given sphere volume to be queried. |
| `radius` | float |  | The radius of the given sphere volume to be queried. |
| `overlapParams` | [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams\|OverlapParams]] | `OverlapParams{MaxParts=0, Tolerance=0, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}` | Contains reusable portions of the spatial query parameters. |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] which matched the spatial query. |

### GetPartsInPart

```lua
WorldRoot:GetPartsInPart(part: BasePart, overlapParams: OverlapParams = OverlapParams{MaxParts=0, Tolerance=0, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}): List<BasePart>
```

**Thread safety:** Safe · **Tags:** `CustomLuaState`

[[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartsInPart|WorldRoot:GetPartsInPart()]] returns an array of parts whose occupied space is shared with the given part (which must exist in the same [[30 Official Roblox Docs/API Reference/Classes/WorldRoot|WorldRoot]] as the parts to be queried). This method can be used in place of [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetTouchingParts|BasePart:GetTouchingParts()]] and is generally a better choice.

As noted, this spatial query method considers the **exact volume** occupied by the given part using a full geometric collision check. As an example, a concave/hollow part won't match queried parts within it unless they actually overlap/touch such a part. For simpler volumes, consider using [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartBoundsInBox|WorldRoot:GetPartBoundsInBox()]] or [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartBoundsInRadius|WorldRoot:GetPartBoundsInRadius()]], as they are less accurate but perform more efficiently.

This method uses a [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams|OverlapParams]] object to describe reusable portions of the spatial query, such as an inclusion or exclusion list, the maximum number of parts to query, what [[30 Official Roblox Docs/Workspace/Collisions#Collision filtering|collision group]] to use, and whether the query favors an intersected part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|BasePart.CanCollide]] value over its [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery|BasePart.CanQuery]] value.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The part whose volume is to be checked against other parts. |
| `overlapParams` | [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams\|OverlapParams]] | `OverlapParams{MaxParts=0, Tolerance=0, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}` | Contains reusable portions of the spatial query parameters. |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] which matched the spatial query. |

### GetRegisteredCollisionGroups

```lua
WorldRoot:GetRegisteredCollisionGroups(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Returns a table with info on all of this world's collision groups. Each value in the returned table is itself a table and containing two members:

| Member | Type | Description |
| --- | --- | --- |
| mask | integer | The collision group's mask; only for internal use. |
| name | string | Name of the collision group. |

**Returns**

| Type | Description |
| --- | --- |
| Array |  |

### IKMoveTo

```lua
WorldRoot:IKMoveTo(part: BasePart, target: CFrame, translateStiffness: float = 0.5, rotateStiffness: float = 0.5, collisionsMode: IKCollisionsMode = OtherMechanismsAnchored): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This function moves the specified part to the specified location via [inverse kinematics](https://en.wikipedia.org/wiki/Inverse_kinematics) rather than moving it there directly, to ensure any joints, [[30 Official Roblox Docs/API Reference/Classes/Constraint|constraints]], or collisions that part is participating in remain physically satisfied. Currently this function is only available in Studio to [[30 Official Roblox Docs/API Reference/Classes/Plugin|plugins]], as it currently conflicts with the physics of a running game.

**Translate stiffness** is a number between 0 and 1 specifying how aggressively to match the part's position to the position part of the target CFrame. **Rotate stiffness** is a number between 0 and 1 specifying how aggressively to match the part's rotation to the rotation part of the target CFrame.

For example:

- If translate stiffness and rotate stiffness are both equal to 1, then the part will be moved exactly to the target CFrame regardless of what physical constraints there are on it.
- If translate stiffness and rotate stiffness are both equal to 0.5, then the part will try to move to exactly the target CFrame, but may be pushed out of the way by physical constraints on it.
- If translate stiffness and rotate stiffness are both equal to 0, then the target CFrame will be ignored and physical constraints will be solved for the object at the position where it was.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The part being moved. |
| `target` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The location to move the specified part. |
| `translateStiffness` | float | `0.5` | A number between 0 and 1 specifying how aggressively to match the part's position to the position part of the target [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |
| `rotateStiffness` | float | `0.5` | A number between 0 and 1 specifying how aggressively to match the part's rotation to the rotation part of the target [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |
| `collisionsMode` | [[30 Official Roblox Docs/API Reference/Enums/IKCollisionsMode\|IKCollisionsMode]] | `OtherMechanismsAnchored` | Allows you to specify what objects should be effected by the physical resolution. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### IsCollisionGroupRegistered

```lua
WorldRoot:IsCollisionGroupRegistered(name: string): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Checks if a collision group is registered in this world. It's recommended that you call this method before calling methods that throw errors for unregistered collision groups, such as [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#CollisionGroupSetCollidable|WorldRoot:CollisionGroupSetCollidable()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### IsRegion3Empty

> [!warning] Deprecated
> This function has been deprecated. Use
> `Class.WorldRoot:GetPartBoundsInBox()` along with `Datatype.OverlapParams`
> for new work.

```lua
WorldRoot:IsRegion3Empty(region: Region3, ignoreDescendentsInstance: Instance = nil): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

**IsRegion3Empty** returns a bool indicating whether there are no [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] within the given [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]].

The optional `ignoreDescendantsInstance` parameter can be used to specify a specific instance for whom itself and all of its descendants should be ignored by this function. This can be useful when, for example, looking to see if any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are inside a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] other than the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] itself.

```
local min = part.Position - (0.5 * part.Size)
local max = part.Position + (0.5 * part.Size)
local region = Region3.new(min, max)
local isPartEmpty = worldroot:IsRegion3Empty(region, part)  -- Ignore part
```

If more than one object and its descendants need to be excluded from the search, developers should use [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#IsRegion3EmptyWithIgnoreList|WorldRoot:IsRegion3EmptyWithIgnoreList()]].

This function only returns if a region is empty or not. Developers looking to find [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in a region should use [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartsInRegion3|WorldRoot:FindPartsInRegion3()]].

#### How do Region3 checks work?

Checking if a part overlaps a [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] is not a simple process. It actually is time consuming and complicated. Instead it checks if parts are roughly in the same area. When this function is called, it figures out which voxels contain the [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]]. It then figures out which parts might be in those voxels. It does this by comparing the axis-aligned bounding box (sometimes called the AABB) of the part with the voxels. The axis-aligned bounding box can be seen in Roblox Studio when a part is selected.

This means that the area that is inspected by the function may be larger than the [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]]. For this reason it is recommended to make sure that the [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] is on the voxel grid. The best way to do this is by setting the coordinates of the [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] to multiples of 4 (since voxels are 4 x 4 x 4 studs).

This method is a fairly quick and easy way to see if any parts are in a general area. If a game needs to know if parts are exactly in an area, then [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetTouchingParts|BasePart:GetTouchingParts()]] should be used. There is a higher cost to using [[30 Official Roblox Docs/API Reference/Classes/BasePart#GetTouchingParts|BasePart:GetTouchingParts()]] since a part is needed in the [[30 Official Roblox Docs/API Reference/Classes/WorldRoot|WorldRoot]] and the function takes more time to run.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] to be checked. |
| `ignoreDescendentsInstance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | An [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] to be ignored. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | True if the [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] is empty. |

### IsRegion3EmptyWithIgnoreList

> [!warning] Deprecated
> This function has been deprecated. Use
> `Class.WorldRoot:GetPartBoundsInBox()` along with `Datatype.OverlapParams`
> for new work.

```lua
WorldRoot:IsRegion3EmptyWithIgnoreList(region: Region3, ignoreDescendentsTable: Instances): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Returns a boolean indicating whether there are no [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] within the given [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]], ignoring any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] that are descendants of the objects within the given ignore list. If a `nil` value is given in the ignore list, instances after this value will not be ignored.

This function only returns if a region is empty or not. Developers looking to find specific [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in a region should use [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartsInRegion3WithIgnoreList|WorldRoot:FindPartsInRegion3WithIgnoreList()]].

This function is a variant of [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#IsRegion3Empty|WorldRoot:IsRegion3Empty()]] with the addition of an ignore list. In cases where an inclusion list is required instead, developers should check to see if any parts are returned by [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#FindPartsInRegion3WithWhiteList|WorldRoot:FindPartsinRegion3WithWhitelist()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] to be checked. |
| `ignoreDescendentsTable` | Instances |  | An array of objects to be ignored. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | True if the [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] is empty. |

### Raycast

```lua
WorldRoot:Raycast(origin: Vector3, direction: Vector3, raycastParams: RaycastParams = RaycastParams{IgnoreWater=false, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}): RaycastResult?
```

**Thread safety:** Safe

Casts a ray using an origin, direction, and optional [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams|RaycastParams]]. If it finds an eligible [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] cell, a [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult|RaycastResult]] is returned containing the results of the operation. If no [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams|RaycastParams]] object is provided, the defaults are used (all parts are considered and [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] water is not ignored).

Note that the length (magnitude) of the directional vector is important, as objects/terrain further away than its length will not be tested. If you're using a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] to help create the ray components, consider using [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#LookVector|CFrame.LookVector]] as the directional vector and multiply it by the desired length as shown in the example below. The maximum length of the direction vector is 15,000 studs.

This method does **not** use a [[30 Official Roblox Docs/API Reference/Datatypes/Ray|Ray]] object, but its origin and direction components can be borrowed from [[30 Official Roblox Docs/API Reference/Datatypes/Ray#Origin|Ray.Origin]] and [[30 Official Roblox Docs/API Reference/Datatypes/Ray#Direction|Ray.Direction]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `origin` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The origin point of the ray. |
| `direction` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The directional vector of the ray. Note that the length of this vector matters, as parts/terrain further away than its length will not be tested. |
| `raycastParams` | [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams\|RaycastParams]] | `RaycastParams{IgnoreWater=false, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}` | An object used to specify hit eligibility in the raycast operation. If not provided, default values are used where all parts are considered and [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] water is not ignored. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult\|RaycastResult]]? | Contains the results of a raycast operation, or `nil` if no eligible [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell was hit. |

*Code samples for this member (`worldroot---raycast`) are published on the source page; their code is not part of the open-source repo.*

### RegisterCollisionGroup

```lua
WorldRoot:RegisterCollisionGroup(name: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Registers a new collision group in this world with the given name. The name cannot be `"Default"`.

Note that this method has a slight performance overhead based on the number of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in the world, so it's recommended that you register all collision groups at edit time through the Studio [[30 Official Roblox Docs/Workspace/Collisions#Collision groups|editor]] and call [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#UnregisterCollisionGroup|UnregisterCollisionGroup()]] and [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#RenameCollisionGroup|RenameCollisionGroup()]] as infrequently as possible.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RenameCollisionGroup

```lua
WorldRoot:RenameCollisionGroup(from: string, to: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Renames the specified registered collision group in this world, but does **not** rename the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CollisionGroup|CollisionGroup]] property of parts that utilize the group. The first argument of this method is the name of the group to rename, the second argument is the new name for the group. If the specified group does not exist, this method will not do anything. The naming conventions for the new name follow the same rules as if the group was being created with [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#RegisterCollisionGroup|RegisterCollisionGroup()]].

This method will throw a runtime error in the following circumstances:

- Invalid or empty name provided for either argument.
- The method is called from a client.

Note that this method has a slight performance overhead based on the number of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in the world, so it's recommended that you register all collision groups at edit time through the Studio [[30 Official Roblox Docs/Workspace/Collisions#Collision groups|editor]] and rename them as infrequently as possible.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `from` | string |  |  |
| `to` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Shapecast

```lua
WorldRoot:Shapecast(part: BasePart, direction: Vector3, params: RaycastParams = RaycastParams{IgnoreWater=false, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}, cframeOverride: CFrame? = nil, sizeOverride: Vector3? = nil): RaycastResult?
```

**Thread safety:** Unsafe

Casts the shape of the given [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] in a given direction and returns the first collision with a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] cell. This is analogous to how [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|WorldRoot:Raycast()]] casts a linear ray in a direction to find a collision, but it uses a 3D shape instead of a ray. Unlike [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Blockcast|WorldRoot:Blockcast()]] and [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Spherecast|WorldRoot:Spherecast()]], which use a simple box or sphere, this method casts the actual geometry of the provided part.

Unlike [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartsInPart|WorldRoot:GetPartsInPart()]], this method does not detect [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] that **initially** intersect the shape.

If a hit is detected, a [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult|RaycastResult]] is returned containing the hit information. The [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult#Distance|Distance]] property represents the distance the shape has to travel to find a hit, and the [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult#Position|Position]] property represents the intersection point that causes the hit.

This method throws an error if it is passed a non-existent part, an invalid direction, or a part with [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] geometry.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The part whose shape is cast. The cast uses this part's geometry (block, ball, mesh, and so on) and size; excessively large parts may not be supported, and it cannot be a [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] part. |
| `direction` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Direction of the shapecast, with the magnitude representing the maximum distance the shape can travel. The maximum distance is 1024 studs. |
| `params` | [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams\|RaycastParams]] | `RaycastParams{IgnoreWater=false, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}` | An object used to specify hit eligibility in the shapecast operation. If not provided, default values are used where all other parts are considered and [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] water is not ignored. The part being cast is always excluded from the results. |
| `cframeOverride` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]? | `nil` | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] from which the shape begins the cast. If not provided, the part's own [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame\|CFrame]] is used. |
| `sizeOverride` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]? | `nil` | The size of the cast shape. If not provided, the part's own [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size\|Size]] is used. Every component must be finite and greater than or equal to `0`, and the shape must not exceed the maximum supported side length. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult\|RaycastResult]]? | Contains the result of the shapecast operation, or `nil` if no eligible [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell was hit. |

### Spherecast

```lua
WorldRoot:Spherecast(position: Vector3, radius: float, direction: Vector3, params: RaycastParams = RaycastParams{IgnoreWater=false, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}): RaycastResult?
```

**Thread safety:** Safe

Casts a spherical shape in a given direction and returns the first collision with a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] cell. This is analogous to how [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|WorldRoot:Raycast()]] casts a linear ray in a direction to find a collision, but it uses a 3D shape instead of a ray.

Unlike [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartsInPart|WorldRoot:GetPartsInPart()]], this method does not detect [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] that **initially** intersect the shape.

If a hit is detected, a [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult|RaycastResult]] is returned containing the hit information. The [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult#Distance|Distance]] property represents the distance the shape has to travel to find a hit, and the [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult#Position|Position]] property represents the intersection point that causes the hit.

This method throws an error if it is passed invalid radius or direction inputs.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The initial position of the cast spherical shape. |
| `radius` | float |  | The radius of the cast spherical shape in studs. The maximum radius is 256 studs. |
| `direction` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | Direction of the shapecast, with the magnitude representing the maximum distance the shape can travel. The maximum distance is 1024 studs. |
| `params` | [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams\|RaycastParams]] | `RaycastParams{IgnoreWater=false, BruteForceAllSlow=false, RespectCanCollide=false, CollisionGroup=Default, FilterDescendantsInstances={}}` | An object used to specify hit eligibility in the shapecast operation. If not provided, default values are used where all parts are considered and [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] water is not ignored. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult\|RaycastResult]]? | Contains the result of the shapecast operation, or `nil` if no eligible [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell was hit. |

*Code samples for this member (`worldroot---spherecast`) are published on the source page; their code is not part of the open-source repo.*

### StepPhysics

```lua
WorldRoot:StepPhysics(dt: float, parts: Instances = {}): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Advances the simulation for parts in the world forward based on a specified time increment and an optional set of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. When a set of parts is specified, only these parts will be simulated and all other parts in the world will be treated as anchored. When this argument is left out, all parts in the world will be included in the simulation. The specified time increment can be any positive number, with larger values increasing the runtime of the function. Depending on the value of the time increment, the physics system may subdivide it into multiple individual steps to maintain the accuracy and stability of the simulation. Even if the function performs multiple substeps, the results of the simulation will only be seen once the function completes. To visualize the individual steps of a simulation, the function can be called once per RenderStep via the [[30 Official Roblox Docs/API Reference/Classes/RunService#RenderStepped|RunService.RenderStepped]] event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `dt` | float |  | The amount of time that will be simulated. This argument must be a positive number. Larger values will increase the runtime of this function. |
| `parts` | Instances | `{}` | Optional array of parts that will be simulated. This set must contain instances that are of type [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]; any other types will be ignored. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`worldroot---stepphysics`) are published on the source page; their code is not part of the open-source repo.*

### UnregisterCollisionGroup

```lua
WorldRoot:UnregisterCollisionGroup(name: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Physics

Unregisters the collision group for the given name in this world, with the following behaviors:

- If an invalid name is provided, the method will not do anything.
- If the reserved name `"Default"` is provided **or** if the method is called from a client, it will throw an error.
- If there are any parts in the collision group when it is removed, those parts will still maintain the same collision group name. The physical behavior of parts in a removed group is undefined, so it's recommended to move any parts in a removed group to another group, such as the `"Default"` group.

Note that this method has a slight performance overhead based on the number of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] in the world, so it's recommended that you register all collision groups at edit time through the Studio [[30 Official Roblox Docs/Workspace/Collisions#Collision groups|editor]] and call this method as infrequently as possible.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [WorldRoot](https://create.roblox.com/docs/reference/engine/classes/WorldRoot) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
