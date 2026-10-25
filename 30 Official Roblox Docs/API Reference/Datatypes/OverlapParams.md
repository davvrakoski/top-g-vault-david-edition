---
title: "OverlapParams"
description: "Stores parameters used in boundary-querying functions."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/OverlapParams"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Stores parameters used in boundary-querying functions.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams|OverlapParams]] data type stores parameters for use with [[30 Official Roblox Docs/API Reference/Classes/WorldRoot|WorldRoot]] boundary-querying functions, in particular [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartBoundsInBox|WorldRoot:GetPartBoundsInBox()]], [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartBoundsInRadius|WorldRoot:GetPartBoundsInRadius()]] and [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartsInPart|WorldRoot:GetPartsInPart()]]. The [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#ExcludeInstances|ExcludeInstances]] and [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#IncludeInstances|IncludeInstances]] properties store a set of objects and their descendants that will be excluded and included from the query. The [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#CollisionGroup|OverlapParams.CollisionGroup]] property can specify a collision group for the boundary query operation.

Unlike most data types in Luau, you can change all of the members of [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams|OverlapParams]] without creating a new object, allowing you to reuse the same object repeatedly.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#new\|new()]] |  | Returns a blank [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams\|OverlapParams]] object. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#ExcludeInstances\|ExcludeInstances]] | {[[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]}? | An optional array of instances whose descendants will be excluded from the query. |
| [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#IncludeInstances\|IncludeInstances]] | {[[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]]}? | An optional array of instances whose descendants will be included in the query. |
| [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#MaxParts\|MaxParts]] | number | The maximum amount of parts to be returned by the query. |
| [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#CollisionGroup\|CollisionGroup]] | string | The collision group used for the operation. |
| [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#Tolerance\|Tolerance]] | number | Slightly increases the volume of the boundary-querying operation. |
| [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#RespectCanCollide\|RespectCanCollide]] | bool | Determines whether the boundary-querying operation considers a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide\|BasePart.CanCollide]] property value over its [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery\|BasePart.CanQuery]] value. |
| [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#BruteForceAllSlow\|BruteForceAllSlow]] | bool | When enabled, the query will ignore all part collision properties and perform a brute-force check on every part. |
| [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#FilterDescendantsInstances\|FilterDescendantsInstances]] | Array | An array of objects whose descendants are used in filtering candidates. |
| [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#FilterType\|FilterType]] | [[30 Official Roblox Docs/API Reference/Enums/RaycastFilterType\|RaycastFilterType]] | Determines whether the [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#FilterDescendantsInstances\|FilterDescendantsInstances]] array is used as an exclude or include list. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#AddToFilter\|AddToFilter()]] | () | Adds the instances provided to [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#FilterDescendantsInstances\|FilterDescendantsInstances]]. |

## Constructors

### new

```lua
OverlapParams.new(): OverlapParams
```

Returns a blank [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams|OverlapParams]] object. Unlike other data type constructors, this constructor does not have any parameters, so you should set its properties appropriately.

## Properties

### ExcludeInstances

**Type:** {[[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]}?

An optional array of instances whose descendants will be excluded from the query. This property can be used simultaneously with [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#IncludeInstances|IncludeInstances]] to allow for mixed filtering, for example including a large folder but excluding specific child instances. If an instance matches both an exclude and include filter, exclusions take priority over inclusions.

### IncludeInstances

**Type:** {[[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]}?

An optional array of instances whose descendants will be included in the query. This property can be used simultaneously with [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#ExcludeInstances|ExcludeInstances]] to allow for mixed filtering. If an instance matches both an exclude and include filter, exclusions take priority over inclusions.

Setting `IncludeInstances` to `nil` versus an empty array (`{}`) has opposite effects. `IncludeInstances = nil` is the most permissive filter (includes everything), whereas `IncludeInstances = {}` is the most restrictive filter (includes nothing).

### MaxParts

**Type:** number

The maximum amount of parts to be returned by the query. The default value of zero (`0`) represents no limit.

### CollisionGroup

**Type:** string

Specifies a collision group for the operation. Parts in collision groups that are set to **not** collide with this group are ignored. If this property is omitted, the operation assumes the **Default** collision group.

### Tolerance

**Type:** number

Slightly increases the volume of the boundary-querying operation, clamped between `0` and `0.05` studs.

### RespectCanCollide

**Type:** bool

This property, if `true`, makes the boundary-querying operation use an intersected part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|BasePart.CanCollide]] value in favor of its [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery|BasePart.CanQuery]] value when determining whether that part is included in the array of spatial query results.

### BruteForceAllSlow

**Type:** bool

When enabled, the query will ignore all part collision properties and perform a brute-force check on every part. This will negatively impact performance and should not be used in live experiences.

### FilterDescendantsInstances

**Type:** Array

An array of objects whose descendants are used in filtering candidates. Note that this property has been superseded by [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#ExcludeInstances|ExcludeInstances]] and [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#IncludeInstances|IncludeInstances]] which should be used for new work.

### FilterType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RaycastFilterType|RaycastFilterType]]

Determines whether the [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#FilterDescendantsInstances|FilterDescendantsInstances]] array is used as an exclude or include list. Note that this property has been superseded by [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#ExcludeInstances|ExcludeInstances]] and [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#IncludeInstances|IncludeInstances]] which should be used for new work.

## Methods

### AddToFilter

```lua
OverlapParams:AddToFilter(instances: Instance | Array): ()
```

Adds the instances provided to [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#FilterDescendantsInstances|FilterDescendantsInstances]]. Note that this property has been superseded by [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#ExcludeInstances|ExcludeInstances]] and [[30 Official Roblox Docs/API Reference/Datatypes/OverlapParams#IncludeInstances|IncludeInstances]] which should be used for new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instances` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Array |  | An instance or an array containing instances to add. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [OverlapParams](https://create.roblox.com/docs/reference/engine/datatypes/OverlapParams) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
