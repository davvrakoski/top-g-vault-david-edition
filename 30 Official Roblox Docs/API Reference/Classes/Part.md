---
title: "Part"
description: "A common type of `BasePart` that comes in different primitive shapes."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Part"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A common type of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that comes in different primitive shapes.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart|FormFactorPart]] → [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/FlagStand|FlagStand]], [[30 Official Roblox Docs/API Reference/Classes/Platform|Platform]], [[30 Official Roblox Docs/API Reference/Classes/Seat|Seat]], [[30 Official Roblox Docs/API Reference/Classes/SkateboardPlatform|SkateboardPlatform]], [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]]
- **Memory category:** BaseParts

## Description

The Part object is a type of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. It comes in five different primitive shapes: Ball, Block, Cylinder, Wedge, and CornerWedge.

*Code samples for this API (`using-a-script-to-create-a-part`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Part); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Part#Shape\|Shape]] | [[30 Official Roblox Docs/API Reference/Enums/PartType\|PartType]] | Sets the overall shape of the object. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart|FormFactorPart]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Shape

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PartType|PartType]]

**Thread safety:** ReadSafe · **Category:** Part · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

The Shape property sets the overall shape of the object to one of a predetermined list of built-in shapes.

The [[30 Official Roblox Docs/API Reference/Enums/PartType|Enum.PartType]] enum controls the shape value, and has five possible shapes:

| Shape/Value | Description                             |
| ----------- | --------------------------------------- |
| Ball        | A spherical shape.                      |
| Block       | A block shape.                          |
| Cylinder    | A cylinder shape.                       |
| Wedge       | A wedge shape with a slope on one side. |
| CornerWedge | A wedge shape with slopes on two sides. |

[[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and [[30 Official Roblox Docs/Parts/Solid modeling|solid modeling]] can be used to obtain completely custom part shapes.

Collisions between balls, blocks, and wedges, and corner wedges are exact, whereas collisions between terrain, cylinders, TriangleMeshes, and other geometry types are approximations. This means that the ball shape can be useful to create stable colliders for car wheels.

*Code samples for this member (`using-a-script-to-create-a-part`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Part](https://create.roblox.com/docs/reference/engine/classes/Part) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
