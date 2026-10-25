---
title: "GeometryService"
description: "Service containing geometric operations."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GeometryService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Service containing geometric operations.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

Service containing geometric operations not directly related to specific objects.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GeometryService#CalculateConstraintsToPreserve\|CalculateConstraintsToPreserve()]] | Array | Returns a table of [[30 Official Roblox Docs/API Reference/Classes/Constraint\|Constraints]] and [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]] which you may choose to preserve, along with their respective parents. |
| [[30 Official Roblox Docs/API Reference/Classes/GeometryService#FragmentAsync\|FragmentAsync()]] | Array | Breaks a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] into multiple [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] instances, according to the pattern of points passed in, by using voronoi decomposition. |
| [[30 Official Roblox Docs/API Reference/Classes/GeometryService#GenerateFragmentSites\|GenerateFragmentSites()]] | Array | Provides an array of positions which can easily be passed into `FragmentAsync` to perform simple types of destruction. |
| [[30 Official Roblox Docs/API Reference/Classes/GeometryService#IntersectAsync\|IntersectAsync()]] | Array | Creates one or more [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperations]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]] from the intersecting geometry of multiple parts. |
| [[30 Official Roblox Docs/API Reference/Classes/GeometryService#SubtractAsync\|SubtractAsync()]] | Array | Creates one or more [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperations]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]] from one part minus the space occupied by other parts. |
| [[30 Official Roblox Docs/API Reference/Classes/GeometryService#SweepPartAsync\|SweepPartAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] | Creates a [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] which has the shape of the input part stretched/dragged through the given set of `CFrame` positions. |
| [[30 Official Roblox Docs/API Reference/Classes/GeometryService#UnionAsync\|UnionAsync()]] | Array | Creates one or more [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperations]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]] from one part plus the space occupied by other parts. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CalculateConstraintsToPreserve

```lua
GeometryService:CalculateConstraintsToPreserve(source: Instance, destination: Array, options: Dictionary = nil): Array
```

**Thread safety:** Unsafe · **Capabilities:** CSG

Returns a table of [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]] and [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] which you may choose to preserve, along with their respective parents. Iterating over this table lets you decide whether to reparent recommended constraints and attachments to their respective parents.

For more information and detailed examples, see https://create.roblox.com/docs/parts/solid-modeling#in-experience-solid-modeling.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | An original object that the solid modeling operation was performed on, for example `part` in [[30 Official Roblox Docs/API Reference/Classes/GeometryService#UnionAsync\|UnionAsync()]]. |
| `destination` | Array |  | Array of resulting [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]] from the solid modeling operation, for example the results of [[30 Official Roblox Docs/API Reference/Classes/GeometryService#UnionAsync\|UnionAsync()]]. |
| `options` | Dictionary | `nil` | Options dictionary for the method:<br><br>- `tolerance` — The distance tolerance, in regards to [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] preservation, between the attachment and the closest point on the original part's surface versus the closest point on the resulting part's surface. If the resulting distance following the solid modeling operation is greater than this value, the [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent\|Parent]] of attachments and their associated constraints will be `nil` in the returned recommendation table. - `weldConstraintPreserve` — A [[30 Official Roblox Docs/API Reference/Enums/WeldConstraintPreserve\|Enum.WeldConstraintPreserve]] enum value describing how [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint\|WeldConstraints]] are preserved in the resulting recommendation table. - `dropAttachmentsWithoutConstraints` — Boolean with default of `true`. If set to `false`, [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachments]] that have no [[30 Official Roblox Docs/API Reference/Classes/Constraint\|Constraints]] will be preserved. |

**Returns**

| Type | Description |
| --- | --- |
| Array | Table containing information for general case [[30 Official Roblox Docs/API Reference/Classes/Constraint\|Constraints]], [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint\|NoCollisionConstraints]], and [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint\|WeldConstraints]]. In cases where an [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] or [[30 Official Roblox Docs/API Reference/Classes/Constraint\|Constraint]] should be dropped, its respective parent will be `nil`.<br><br>For general case [[30 Official Roblox Docs/API Reference/Classes/Constraint\|Constraints]] such as [[30 Official Roblox Docs/API Reference/Classes/HingeConstraint\|HingeConstraint]]:<br><br>\| Key \| Type \| \| --- \| --- \| \| `Attachment` \| [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] \| \| `Constraint` \| [[30 Official Roblox Docs/API Reference/Classes/Constraint\|Constraint]] or `nil` \| \| `AttachmentParent` \| [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or `nil` \| \| `ConstraintParent` \| [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or `nil` \|<br><br>For [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint\|WeldConstraints]]:<br><br>\| Key \| Type \| \| --- \| --- \| \| `WeldConstraint` \| [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint\|WeldConstraint]] \| \| `WeldConstraintParent` \| [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or `nil` \| \| `WeldConstraintPart0` \| [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] \| \| `WeldConstraintPart1` \| [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] \|<br><br>For [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint\|NoCollisionConstraints]]:<br><br>\| Key \| Type \| \| --- \| --- \| \| `NoCollisionConstraint` \| [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint\|NoCollisionConstraint]] \| \| `NoCollisionConstraintParent` \| [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or `nil` \| \| `NoCollisionConstraintPart0` \| [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] \| \| `NoCollisionConstraintPart1` \| [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] \| |

*Code samples for this member (`GeometryService-CalculateConstraintsToPreserve`) are published on the source page; their code is not part of the open-source repo.*

### FragmentAsync

```lua
GeometryService:FragmentAsync(part: BasePart, sites: Array, options: Dictionary = nil): Array
```

**Thread safety:** Unsafe · **Capabilities:** CSG · **Tags:** `Yields`

Breaks a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] into multiple [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] instances, according to the pattern of points passed in, by using voronoi decomposition. [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] is not supported. Similar to [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Clone()]], the returned parts have no set [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]].

For more information and detailed examples, see https://create.roblox.com/docs/parts/solid-modeling#in-experience-solid-modeling.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | A [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]], [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]], or [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] to operate on. |
| `sites` | Array |  | Array of `Vector3` defining the site positions. Each site will become a separate part. You can also provide a jagged 2D array of `Vector3` by including inner arrays of `Vector3` as elements of the outer array. Each inner array will have all of its voronoi cells merged into a single part. [[30 Official Roblox Docs/API Reference/Classes/GeometryService#GenerateFragmentSites\|GeometryService:GenerateFragmentSites]] can be used to easily create this input. |
| `options` | Dictionary | `nil` | Options table containing all the controls for the method:<br><br>- `CollisionFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity\|CollisionFidelity]] in the resulting parts, with one caveat: If a 2D array of sites is provided, this collision fidelity will only be applied to parts which came from more than one site. The others will be given `Hull` precision. - `RenderFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity\|RenderFidelity]] in the resulting parts. - `FluidFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#FluidFidelity\|FluidFidelity]] in the resulting parts. - `SplitApart` — Boolean controlling whether a part should be split into multiple parts if it contains multiple connected components. Default is `true` (split). |

**Returns**

| Type | Description |
| --- | --- |
| Array | Array of [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] along with mapping info. Each array element is a Dictionary with two elements: `{ “Instance”: instance, “Index”: index }`. `Index` is the index in the outer array of sites; in other words, it tells you which group of sites this instance came from. Note that it is possible for multiple instances to have the same index, if SplitApart is `true`. |

*Code samples for this member (`GeometryService-FragmentAsync`) are published on the source page; their code is not part of the open-source repo.*

### GenerateFragmentSites

```lua
GeometryService:GenerateFragmentSites(part: BasePart, options: Dictionary = nil): Array
```

**Thread safety:** Unsafe · **Capabilities:** CSG

Provides an array of positions which can easily be passed into [[30 Official Roblox Docs/API Reference/Classes/GeometryService#FragmentAsync|FragmentAsync()]] to perform common types of destruction: Fragmenting an entire [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] into pieces, or a localized area of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] into pieces.

The positions outputted are partially random, so the output should not be relied on to look exactly the same as the first time it is run with the same parameters.

For more information and detailed examples, see https://create.roblox.com/docs/parts/solid-modeling#in-experience-solid-modeling. Luau code to mimic this API has also been provided on that page, which can be freely modified if a slightly different effect is desired.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]], [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]], or [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] which you are planning to pass into [[30 Official Roblox Docs/API Reference/Classes/GeometryService#FragmentAsync\|FragmentAsync()]]. This is necessary to make the fragment site generation and the subsequent [[30 Official Roblox Docs/API Reference/Classes/GeometryService#FragmentAsync\|FragmentAsync()]] call efficient. |
| `options` | Dictionary | `nil` | Options table containing all the controls for the method:<br><br>- `SiteSpacing` — The approximate distance between sites, which directly corresponds to the diameter of the resulting fragments. If not specified, a reasonable value will be chosen. - `Origin` — If provided, this will be the center of the area to be fragmented. If not provided, the entire object will be fragmented. - `Radius` — If provided, this will be the center of the area to be fragmented. Either `Origin` and `Radius` should both be provided, or neither. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of `Vector3` which is typically passed into [[30 Official Roblox Docs/API Reference/Classes/GeometryService#FragmentAsync\|FragmentAsync()]]. The output depends on the options provided. If `Origin` and `Radius` are provided, then the output array will contain several `Vector3` elements which will all be located within the radius, but the first element of the array will be an inner array containing many `Vector3` sites which are outside the radius. If `Origin` and `Radius` are not provided, the output will simply be an array of `Vector3` positions within the extents of the input `part`. |

*Code samples for this member (`GeometryService-GenerateFragmentSites`) are published on the source page; their code is not part of the open-source repo.*

### IntersectAsync

```lua
GeometryService:IntersectAsync(part: Instance, parts: Array, options: Dictionary = nil): Array
```

**Thread safety:** Unsafe · **Capabilities:** CSG · **Tags:** `Yields`

Creates one or more [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperations]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] from the intersecting geometry of multiple parts. Primitive [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]], [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperations]], and [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] are supported as inputs, but not [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]].

Similarly to [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Clone()]], the returned parts have no set [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]]. In most cases, you should parent the results to the same place as the main part, then [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Destroy()]] the original parts.

This function replaces [[30 Official Roblox Docs/API Reference/Classes/BasePart#IntersectAsync|BasePart:IntersectAsync()]]. Go to that page for a description of the differences.

For more information and detailed examples, see https://create.roblox.com/docs/parts/solid-modeling#in-experience-solid-modeling.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | Main [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]], [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]], or [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] to operate on. |
| `parts` | Array |  | Array of other parts to intersect with the main part. |
| `options` | Dictionary | `nil` | Options table containing all the controls for the method:<br><br>- `CollisionFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity\|CollisionFidelity]] in the resulting parts. - `RenderFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/PartOperation#RenderFidelity\|RenderFidelity]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity\|RenderFidelity]] in the resulting parts. - `FluidFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#FluidFidelity\|FluidFidelity]] in the resulting parts. - `SplitApart` — Boolean controlling whether the objects should all be kept together or properly split apart. Default is `true` (split). |

**Returns**

| Type | Description |
| --- | --- |
| Array | One or more [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperations]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]]. If the input contained any [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]], then the results will always be [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]]. |

*Code samples for this member (`GeometryService-IntersectAsync`) are published on the source page; their code is not part of the open-source repo.*

### SubtractAsync

```lua
GeometryService:SubtractAsync(part: Instance, parts: Array, options: Dictionary = nil): Array
```

**Thread safety:** Unsafe · **Capabilities:** CSG · **Tags:** `Yields`

Creates one or more [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperations]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] consisting of the space occupied by one part minus the space occupied by the other parts. Primitive [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]], [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperations]], and [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] are supported as inputs, but not [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]].

Similarly to [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Clone()]], the returned parts have no set [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]]. In most cases, you should parent the results to the same place as the main part, then [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Destroy()]] the original parts.

This function replaces [[30 Official Roblox Docs/API Reference/Classes/BasePart#SubtractAsync|BasePart:SubtractAsync()]]. Go to that page for a description of the differences.

For more information and detailed examples, see https://create.roblox.com/docs/parts/solid-modeling#in-experience-solid-modeling.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | Main [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]], [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]], or [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] to operate on. |
| `parts` | Array |  | Array of parts to subtract from the main part. |
| `options` | Dictionary | `nil` | Options table containing all the controls for the method:<br><br>- `CollisionFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity\|CollisionFidelity]] in the resulting parts. - `RenderFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/PartOperation#RenderFidelity\|RenderFidelity]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity\|RenderFidelity]] in the resulting parts. - `FluidFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#FluidFidelity\|FluidFidelity]] in the resulting parts. - `SplitApart` — Boolean controlling whether the objects should all be kept together or properly split apart. Default is `true` (split). |

**Returns**

| Type | Description |
| --- | --- |
| Array | One or more [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperations]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]]. If the input contained any [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]], then the results will always be [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]]. |

*Code samples for this member (`GeometryService-SubtractAsync`) are published on the source page; their code is not part of the open-source repo.*

### SweepPartAsync

```lua
GeometryService:SweepPartAsync(part: BasePart, cframes: Array, options: Dictionary = nil): MeshPart
```

**Thread safety:** Unsafe · **Capabilities:** CSG · **Tags:** `Yields`

Creates a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] which has the shape of the input part stretched/dragged through the given set of `CFrame` positions. The exact shape of the result is defined as the union of the convex hulls of each adjacent pair of `CFrames`.

If a single `CFrame` is provided, the result will be a convex hull of the input part.

For more information and detailed examples, see https://create.roblox.com/docs/parts/solid-modeling#in-experience-solid-modeling.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | A [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]], [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]], or [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] to operate on. |
| `cframes` | Array |  | Array of coordinate frames to sweep parts through. |
| `options` | Dictionary | `nil` | Options table containing all the controls for the method:<br><br>- `CollisionFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity\|CollisionFidelity]] in the resulting parts. - `RenderFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity\|RenderFidelity]] in the resulting parts. - `FluidFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#FluidFidelity\|FluidFidelity]] in the resulting parts. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] | A new [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] with the swept geometry. |

*Code samples for this member (`GeometryService-SweepPartAsync`) are published on the source page; their code is not part of the open-source repo.*

### UnionAsync

```lua
GeometryService:UnionAsync(part: Instance, parts: Array, options: Dictionary = nil): Array
```

**Thread safety:** Unsafe · **Capabilities:** CSG · **Tags:** `Yields`

Creates one or more [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperations]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] consisting of the space occupied by one part plus the space occupied by the other parts. Primitive [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]], [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperations]], and [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] are supported as inputs, but not [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]].

Similarly to [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Clone()]], the returned parts have no set [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]]. In most cases, you should parent the results to the same place as the main part, then [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Destroy()]] the original parts.

This function replaces [[30 Official Roblox Docs/API Reference/Classes/BasePart#UnionAsync|BasePart:UnionAsync()]]. Go to that page for a description of the differences.

For more information and detailed examples, see https://create.roblox.com/docs/parts/solid-modeling#in-experience-solid-modeling.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | Main [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]], [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]], or [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] to operate on. |
| `parts` | Array |  | Array of parts to union with the main part. |
| `options` | Dictionary | `nil` | Options table containing all the controls for the method:<br><br>- `CollisionFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity\|CollisionFidelity]] in the resulting parts. - `RenderFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/PartOperation#RenderFidelity\|RenderFidelity]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart#RenderFidelity\|RenderFidelity]] in the resulting parts. - `FluidFidelity` — The value of [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#FluidFidelity\|FluidFidelity]] in the resulting parts. - `SplitApart` — Boolean controlling whether the objects should all be kept together or properly split apart. Default is `true` (split). |

**Returns**

| Type | Description |
| --- | --- |
| Array | One or more [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperations]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]]. If the input contained any [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]], then the results will always be [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]]. |

*Code samples for this member (`GeometryService-UnionAsync`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [GeometryService](https://create.roblox.com/docs/reference/engine/classes/GeometryService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
