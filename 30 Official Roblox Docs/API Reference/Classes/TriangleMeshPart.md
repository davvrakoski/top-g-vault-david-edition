---
title: "TriangleMeshPart"
description: "Abstract intermediate class that manages physical geometry properties for PartOperations and MeshParts."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TriangleMeshPart"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Abstract intermediate class that manages physical geometry properties for PartOperations and MeshParts.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

TriangleMeshPart is an abstract intermediate class from which [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] inherit. It was created to consolidate the management of physical geometry properties between the two sub-classes. It implements the read-only [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity|CollisionFidelity]] and [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionPrecision|CollisionPrecision]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity\|CollisionFidelity]] | [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity\|CollisionFidelity]] | Determines the level of detail the part's physics will adhere to its mesh. |
| [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionPrecision\|CollisionPrecision]] | float | Quantifies how precise or performant a [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity\|Enum.CollisionFidelity.Tunable]] collision geometry is, from `0` to `1`. |
| [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#FluidFidelity\|FluidFidelity]] | [[30 Official Roblox Docs/API Reference/Enums/FluidFidelity\|FluidFidelity]] | Determines the geometric representation used to compute aerodynamic forces and torques. |
| [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#MeshSize\|MeshSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The original size of the part's source mesh geometry, before any scaling applied through [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size\|BasePart.Size]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CollisionFidelity

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity|CollisionFidelity]]

**Thread safety:** ReadSafe · **Category:** Collision · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

This property determines how the collision model of the [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart|TriangleMeshPart]] relates to the actual geometry of the mesh. This property cannot be read or manipulated by scripts during runtime.

See [[30 Official Roblox Docs/Workspace/Collisions|here]] for a visual representation of the various options.

### CollisionPrecision

**Type:** float

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Collision · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

This property describes the precision-to-performance tradeoff of the part's collision geometry when [[30 Official Roblox Docs/API Reference/Classes/TriangleMeshPart#CollisionFidelity|TriangleMeshPart.CollisionFidelity]] is set to [[30 Official Roblox Docs/API Reference/Enums/CollisionFidelity|Enum.CollisionFidelity.Tunable]]. A value of `0` favors maximum performance with the simplest collision mesh, while a value of `1` favors maximum precision with a collision mesh that closely matches the visual mesh.

### FluidFidelity

**Type:** [[30 Official Roblox Docs/API Reference/Enums/FluidFidelity|FluidFidelity]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

Controls which geometric representation the physics engine uses when it computes aerodynamic (fluid) forces and torques for the part. It defaults to [[30 Official Roblox Docs/API Reference/Enums/FluidFidelity|Enum.FluidFidelity.Automatic]], in which the engine selects a representation on your behalf.

- [[30 Official Roblox Docs/API Reference/Enums/FluidFidelity|Enum.FluidFidelity.Automatic]] — the engine chooses the representation; it currently evaluates fluid forces against the part's collision geometry.
- [[30 Official Roblox Docs/API Reference/Enums/FluidFidelity|Enum.FluidFidelity.UseCollisionGeometry]] — fluid forces are evaluated against the part's collision geometry, matching the shape used for collision detection.
- [[30 Official Roblox Docs/API Reference/Enums/FluidFidelity|Enum.FluidFidelity.UsePreciseGeometry]] — fluid forces are evaluated against the part's precise mesh geometry, producing more accurate forces at a higher computational cost.

Because this property has plugin-level write security, it is configured in Studio rather than assigned by runtime scripts.

This setting only affects a part while fluid forces are active for the place, which is governed by [[30 Official Roblox Docs/API Reference/Classes/Workspace#FluidForces|Workspace.FluidForces]] (an [[30 Official Roblox Docs/API Reference/Enums/FluidForces|Enum.FluidForces]] value that defaults to `Default`; setting it to `Experimental` enables the aerodynamic force model). When fluid forces are not applied to the part, the chosen fidelity has no effect.

### MeshSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

This read-only property reports the size of the part's mesh geometry when it was loaded, as width, height, and depth in studs. It is not affected by resizing the part through [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|BasePart.Size]], so dividing [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|BasePart.Size]] by `MeshSize` gives the scale factor currently applied to the mesh's visual and physical geometry.

---
*Source: [TriangleMeshPart](https://create.roblox.com/docs/reference/engine/classes/TriangleMeshPart) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
