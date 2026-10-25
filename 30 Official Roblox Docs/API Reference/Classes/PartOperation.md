---
title: "PartOperation"
description: "An abstract class that all parts based on solid modeling inherit from."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PartOperation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An abstract class that all parts based on solid modeling inherit from.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart|TriangleMeshPart]] → [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/IntersectOperation|IntersectOperation]], [[30 Official Roblox Docs/API Reference/Classes/NegateOperation|NegateOperation]], [[30 Official Roblox Docs/API Reference/Classes/UnionOperation|UnionOperation]]
- **Memory category:** Instances

## Description

An abstract class that all parts based on [[30 Official Roblox Docs/Parts/Solid modeling|solid modeling]] inherit from.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PartOperation#RenderFidelity\|RenderFidelity]] | [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity\|RenderFidelity]] | The level of detail used to render the solid modeled part. |
| [[30 Official Roblox Docs/API Reference/Classes/PartOperation#SmoothingAngle\|SmoothingAngle]] | float | An angle in degrees which affects the smooth shading of a solid modeled part. |
| [[30 Official Roblox Docs/API Reference/Classes/PartOperation#TriangleCount\|TriangleCount]] | int | The number of polygons in this solid model. |
| [[30 Official Roblox Docs/API Reference/Classes/PartOperation#UsePartColor\|UsePartColor]] | boolean | Sets whether the [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]] can be recolored using inherited color properties. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PartOperation#SubstituteGeometry\|SubstituteGeometry()]] | () | Substitutes the geometry of this [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]] with the geometry of another [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart|TriangleMeshPart]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### RenderFidelity

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity|RenderFidelity]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic, CSG

This property determines the level of detail that the solid modeled part will be shown in. It can be set to the possible values of the [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity|Enum.RenderFidelity]] enum except for [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity|Performance]].

The default value is [[30 Official Roblox Docs/API Reference/Enums/RenderFidelity|Automatic]], meaning the part's detail is based on its distance from the camera as outlined in the following table.

| Distance From Camera | Render Fidelity |
| --- | --- |
| Less than 250 studs | Highest |
| 250-500 studs | Medium |
| 500 or more studs | Lowest |

### SmoothingAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic, CSG

This property represents an angle in degrees for a threshold value between face normals on a [[30 Official Roblox Docs/Parts/Solid modeling|solid modeled]] part. If the normal difference is less than the value, normals will be adjusted to smooth the difference. While a value between 30 and 70 degrees usually produces a good result, values between 90 and 180 are not recommended as they may cause a "shadowing" effect on unions with sharp edges.

Note that smoothing does not affect the normals between different materials or different colors.

### TriangleCount

**Type:** int

**Security:** read None / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, CSG

The number of polygons in this solid model.

### UsePartColor

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic, CSG

Sets whether the [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] can be recolored using the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|BasePart.Color]] or [[30 Official Roblox Docs/API Reference/Classes/BasePart#BrickColor|BasePart.BrickColor]] properties. When true, the entire union will be colored as per [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|Color]] or [[30 Official Roblox Docs/API Reference/Classes/BasePart#BrickColor|BrickColor]]. When false, the parts in the union will maintain their original colors from before the onion operation was performed.

## Methods

### SubstituteGeometry

```lua
PartOperation:SubstituteGeometry(source: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic, CSG

Substitutes the geometry of this [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] with the geometry of another [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]]. This makes it easier to utilize the geometry of a solid modeling operation like [[30 Official Roblox Docs/API Reference/Classes/GeometryService#UnionAsync|UnionAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GeometryService#SubtractAsync|SubtractAsync()]], or [[30 Official Roblox Docs/API Reference/Classes/GeometryService#IntersectAsync|IntersectAsync()]] but maintain properties, attributes, tags, and children of the main part such as [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]], [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]], [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitters]], light objects, decals, and more. This approach also circumvents the potential "flicker" of completely replacing the original [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] with another.

Note that if you're calling this method on a [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] with child [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] or [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]], you should calculate the affected instances with [[30 Official Roblox Docs/API Reference/Classes/GeometryService#CalculateConstraintsToPreserve|CalculateConstraintsToPreserve()]], then drop those whose recommended parent is `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `source` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]] whose geometry will substitute the geometry of this [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`PartOperation-SubstituteGeometry`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [PartOperation](https://create.roblox.com/docs/reference/engine/classes/PartOperation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
