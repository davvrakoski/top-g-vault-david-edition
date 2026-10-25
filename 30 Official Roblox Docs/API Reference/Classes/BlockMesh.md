---
title: "BlockMesh"
description: "The BlockMesh object applies a 'brick' mesh to the `BasePart` it is parented to. It behaves identically to a `SpecialMesh` with `SpecialMesh.MeshType` set to 'Brick'."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BlockMesh"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The BlockMesh object applies a 'brick' mesh to the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] it is parented to. It behaves identically to a [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] with [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh#MeshType|SpecialMesh.MeshType]] set to 'Brick'.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BevelMesh|BevelMesh]] → [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh|DataModelMesh]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

The BlockMesh object applies a 'brick' mesh to the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] it is parented to. It behaves identically to a [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]] with [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh#MeshType|SpecialMesh.MeshType]] set to 'brick'.

## What does a BlockMesh do?

A BlockMesh gives the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] it was applied to a brick shaped mesh. It is identical in appearance to a standard Roblox [[30 Official Roblox Docs/API Reference/Classes/Part|Part]].

The dimensions of the mesh will scale linearly in all directions with [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|BasePart.Size]], this means a part containing a BlockMesh can be resized the same way as any other part.

The additional functionality a BlockMesh brings however, is the ability to set the [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Scale|DataModelMesh.Scale]] and [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#Offset|DataModelMesh.Offset]] properties. These allow the position and dimensions of the mesh that is displayed to be changed without changing the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|BasePart.Position]] or [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|BasePart.Size]] of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] the mesh is parented to.

Note as the [[30 Official Roblox Docs/API Reference/Classes/BlockMesh|BlockMesh]] object does not include a texture the [[30 Official Roblox Docs/API Reference/Classes/DataModelMesh#VertexColor|DataModelMesh.VertexColor]] property does not do anything.

*Code samples for this API (`BlockMesh-Instantiation`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/BlockMesh); their code is not part of the open-source repo.*

---
*Source: [BlockMesh](https://create.roblox.com/docs/reference/engine/classes/BlockMesh) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
