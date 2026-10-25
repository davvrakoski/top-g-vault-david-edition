---
title: "CylinderMesh"
description: "The CylinderMesh object applies a 'cylinder' mesh to the `BasePart` it is parented to."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CylinderMesh"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The CylinderMesh object applies a 'cylinder' mesh to the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] it is parented to.*

> [!warning] Deprecated
> This class is deprecated, and `Class.CylinderMesh|CylinderMeshes` are no
> longer supported. Do not use it for new work.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BevelMesh|BevelMesh]] → [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh|DataModelMesh]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts
- **Tags:** `Deprecated`

## Description

The CylinderMesh object applies a 'cylinder' mesh to the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] it is parented to.

## What does a CylinderMesh do?

A CylinderMesh gives the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] it was applied to a cylinder shaped mesh.

The mesh applied gives the same appearance as that due to the [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh#MeshType|SpecialMesh.MeshType]] of a [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] being set to 'Cylinder' or [[30 Official Roblox Docs/API Reference/Classes/Part#Shape|Part.Shape]] being set to 'Cylinder'. However, unlike those two cases, it is orientated so that the height of the cylinder is along the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] Y axis.

The dimensions of the mesh scale relative to the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|BasePart.Size]] of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. This scale is uniformly along the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] Y axis and maintaining a 1:1 ratio for the part's X and Z axis, using the lowest value. This means the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] can be resized normally, but the cross section of the cylinder will always remain a circle and cannot be stretched or compressed.

Note as the CylinderMesh object does not include a texture the [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#VertexColor|DataModelMesh.VertexColor]] property does not do anything.

## Why use a CylinderMesh?

The advantage of using a mesh over setting the [[30 Official Roblox Docs/API Reference/Classes/Part#Shape|Part.Shape]] property of a part to 'Cylinder' is that the [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Scale|DataModelMesh.Scale]] and [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Offset|DataModelMesh.Offset]] properties are exposed. These allow the position and dimensions of the mesh that is displayed to be changed without changing the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|BasePart.Position]] or [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|BasePart.Size]] of the [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] the mesh is parented to.

The key difference between a CylinderMesh or a [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] with [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh#MeshType|SpecialMesh.MeshType]] set to 'Cylinder' is the orientation of the cylinder mesh. With a CylinderMesh, the height of the cylinder is aligned with the height (Y axis) of the part. With a [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] (or [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] with [[30 Official Roblox Docs/API Reference/Classes/Part#Shape|Part.Shape]] set to 'Cylinder'), the height of the cylinder is aligned with the X axis.

*Code samples for this API (`CylinderMesh-Instantiation`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/CylinderMesh); their code is not part of the open-source repo.*

---
*Source: [CylinderMesh](https://create.roblox.com/docs/reference/engine/classes/CylinderMesh) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
