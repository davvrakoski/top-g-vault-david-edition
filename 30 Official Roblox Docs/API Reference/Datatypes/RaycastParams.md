---
title: "RaycastParams"
description: "A container for parameters used in raycasting operations."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/RaycastParams"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A container for parameters used in raycasting operations.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams|RaycastParams]] data type stores parameters for [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|WorldRoot:Raycast()]] operations. The [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#ExcludeInstances|ExcludeInstances]] and [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#IncludeInstances|IncludeInstances]] properties store a set of objects and their descendants that will be excluded and included from the query. The [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#IgnoreWater|RaycastParams.IgnoreWater]] property can be used to ignore [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] water, and the [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#CollisionGroup|RaycastParams.CollisionGroup]] property can specify a collision group for the raycasting operation.

This object is different from the similarly named [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult|RaycastResult]] which provides the results of a raycast.

Unlike most data types in Luau, you can change all of the members of [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams|RaycastParams]] without creating a new object, allowing you to reuse the same object repeatedly.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#new\|new()]] |  | Returns a blank [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams\|RaycastParams]]. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#ExcludeInstances\|ExcludeInstances]] | {[[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]}? | An optional array of instances whose descendants will be excluded from the query. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#IncludeInstances\|IncludeInstances]] | {[[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]}? | An optional array of instances whose descendants will be included in the query. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#IgnoreWater\|IgnoreWater]] | bool | Determines whether the water material is considered when raycasting against [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#CollisionGroup\|CollisionGroup]] | string | The collision group used for the operation. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#RespectCanCollide\|RespectCanCollide]] | bool | Determines whether the raycast operation considers a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide\|CanCollide]] property value over its [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery\|CanQuery]] value. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#BruteForceAllSlow\|BruteForceAllSlow]] | bool | When enabled, the query will ignore all part collision properties and perform a brute-force check on every part. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#Margin\|Margin]] | number | Expands the cast shape uniformly in every direction. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#SizeGradient\|SizeGradient]] | number | Scales the cast shape over the length of the cast, tapering the swept volume. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#FilterDescendantsInstances\|FilterDescendantsInstances]] | Array | An array of objects whose descendants are used to filter raycasting candidates. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#FilterType\|FilterType]] | [[30 Official Roblox Docs/API Reference/Enums/RaycastFilterType\|RaycastFilterType]] | Determines whether the [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#FilterDescendantsInstances\|FilterDescendantsInstances]] array is used as an exclude or include list. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#AddToFilter\|AddToFilter()]] | () | Adds the instances provided to [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#FilterDescendantsInstances\|FilterDescendantsInstances]]. |

## Constructors

### new

```lua
RaycastParams.new(): RaycastParams
```

Returns a blank [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams|RaycastParams]] object. Unlike other data type constructors, this constructor does not have any parameters, so you should set its properties appropriately.

## Properties

### ExcludeInstances

**Type:** {[[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]}?

An optional array of instances whose descendants will be excluded from the query. This property can be used simultaneously with [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#IncludeInstances|IncludeInstances]] to allow for mixed filtering, for example including a large folder but excluding specific child instances. If an instance matches both an exclude and include filter, exclusions take priority over inclusions.

### IncludeInstances

**Type:** {[[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]}?

An optional array of instances whose descendants will be included in the query. This property can be used simultaneously with [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#ExcludeInstances|ExcludeInstances]] to allow for mixed filtering. If an instance matches both an exclude and include filter, exclusions take priority over inclusions.

Setting `IncludeInstances` to `nil` versus an empty array (`{}`) has opposite effects. `IncludeInstances = nil` is the most permissive filter (includes everything), whereas `IncludeInstances = {}` is the most restrictive filter (includes nothing).

### IgnoreWater

**Type:** bool

Determines whether the water material is considered when raycasting against [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]].

### CollisionGroup

**Type:** string

Specifies a collision group for the raycasting operation. Parts in collision groups that are set to **not** collide with this group are ignored. If this property is omitted, the raycast assumes the **Default** collision group.

### RespectCanCollide

**Type:** bool

This property, if `true`, makes the raycast operation use an intersected part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|CanCollide]] value in favor of its [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery|CanQuery]] value when determining whether that part is included in the [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult|RaycastResult]].

### BruteForceAllSlow

**Type:** bool

When enabled, the query will ignore all part collision properties and perform a brute-force check on every part. This will negatively impact performance and should not be used in live experiences.

### Margin

**Type:** number

Expands the cast shape uniformly in every direction. Must be finite and greater than or equal to `0`. Defaults to `0`.

`Margin` applies to [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Shapecast|WorldRoot:Shapecast()]], [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Blockcast|WorldRoot:Blockcast()]], [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Spherecast|WorldRoot:Spherecast()]] and [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|WorldRoot:Raycast()]]. The expanded shape is what the maximum-size limit is checked against, so a large `Margin` can make an otherwise valid cast throw.

Setting a non-zero `Margin` on a [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|WorldRoot:Raycast()]] makes the operation behave as a sphere cast of that radius.

### SizeGradient

**Type:** number

Scales the cast shape over the length of the cast. Must be finite and greater than or equal to `-1`. Defaults to `0`, which casts the shape at a constant size.

The shape starts at its original size and is scaled by `1 + SizeGradient` by the end of the cast, interpolating in between. A `SizeGradient` of `0.5` finishes the cast 50% larger, `-0.5` finishes it at half size, and `-1` shrinks it away entirely.

`SizeGradient` scales the shape's own size, not [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#Margin|Margin]], so a cast with both keeps its margin at a constant width along the way. [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Spherecast|WorldRoot:Spherecast()]] is the exception: radius and margin are one and the same for a sphere, so both scale together.

### FilterDescendantsInstances

**Type:** Array

An array of objects whose descendants are used to filter raycasting candidates. Note that this property has been superseded by [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#ExcludeInstances|ExcludeInstances]] and [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#IncludeInstances|IncludeInstances]] which should be used for new work.

### FilterType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RaycastFilterType|RaycastFilterType]]

Determines whether the [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#FilterDescendantsInstances|FilterDescendantsInstances]] array is used as an exclude or include list. Note that this property has been superseded by [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#ExcludeInstances|ExcludeInstances]] and [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#IncludeInstances|IncludeInstances]] which should be used for new work.

## Methods

### AddToFilter

```lua
RaycastParams:AddToFilter(instances: Instance | Array): ()
```

Adds the instances provided to [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#FilterDescendantsInstances|FilterDescendantsInstances]]. Note that this property has been superseded by [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#ExcludeInstances|ExcludeInstances]] and [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams#IncludeInstances|IncludeInstances]] which should be used for new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instances` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Array |  | An instance or an array containing instances to add. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [RaycastParams](https://create.roblox.com/docs/reference/engine/datatypes/RaycastParams) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
