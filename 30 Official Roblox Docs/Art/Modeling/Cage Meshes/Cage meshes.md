---
title: "Cage meshes"
description: "Cage meshes are low-resolution surfaces that let one mesh reshape and layer over another, powering layered accessories."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/modeling/cage-meshes"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Cage meshes are low-resolution surfaces that let one mesh reshape and layer over another, powering layered accessories.*

**Cage meshes** are invisible surfaces of a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] that allow other supported meshes to stretch and deform over each other. With cage meshes, you can create a set of meshes that can dynamically resize, reshape, and layer over another mesh of any shape or size.

They power **layered accessories** — 3D accessories such as jackets, dresses, and cardigans that stretch to fit a character body and stack naturally on top of one another — and you can also apply them to any [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], as long as all the cage meshes [[30 Official Roblox Docs/Art/Modeling/Cage Meshes/Cage meshes#How cages pair|share the same UV mapping]].

### Reshape volume

*(image in the full Top G Vault)*

*An outer cage is an invisible surface that can reshape a mesh's volume.*

### Deform any shape

*(image in the full Top G Vault)*

*A single caged mesh deformed onto many differently-shaped targets.*

### Layered accessories

*(image in the full Top G Vault)*

*Layered accessories stretch and stack to fit different avatar body shapes.*

A cage mesh is a simplified copy of a render mesh that defines a wrapping surface. Unlike Roblox's [[30 Official Roblox Docs/Workspace/Collisions|collision system]], which works universally, cage meshes can only work with other paired cage meshes.

To fit one mesh over another, Roblox pairs the vertices of one cage with those of the other by their UV coordinates, then reshapes the render mesh so that its cage matches the target cage. Cage meshes are typically configured in a modeling tool such as [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview).

> [!info]
> In specific cases, you can also create and reshape cage meshes programmatically at runtime, such as in experiences that let users build and customize avatar items. See [[30 Official Roblox Docs/Avatar/Avatar in-experience creation|Avatar in-experience creation]].

## Cage mesh components

In Studio, cage meshes are children of a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] and are represented by descendants of the [[30 Official Roblox Docs/API Reference/Classes/BaseWrap|BaseWrap]] class:

| Cage mesh type | In Blender | In Studio |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/WrapTarget\|WrapTarget]]<br><br> The initial caged surface that other paired cage meshes can target. <br><br>Every caging deformation requires a target mesh. | *(image in the full Top G Vault)*<br> A render mesh with a single `_OuterCage` mesh. | *(image in the full Top G Vault)*<br> A [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] with a child [[30 Official Roblox Docs/API Reference/Classes/WrapTarget\|WrapTarget]]. |
| [[30 Official Roblox Docs/API Reference/Classes/WrapLayer\|WrapLayer]]<br><br> Allows its parent [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] to wrap around a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget\|WrapTarget]], such as a layered clothing accessory wrapping over an avatar body.<br><br> All targets and layers must share identical UVs. | *(image in the full Top G Vault)*<br> A render mesh with an `_InnerCage` and an `_OuterCage` mesh. | *(image in the full Top G Vault)*<br> A [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] with a child [[30 Official Roblox Docs/API Reference/Classes/WrapLayer\|WrapLayer]]. |

Because a cage behaves like a component of its parent, a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] is the only valid parent for these objects. You author cage meshes alongside your render mesh in a modeling application like [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview) and import them together.

> [!info]
> When you import a model that contains cage meshes, make sure **Uses Cages** is enabled in the [[30 Official Roblox Docs/Studio/Importer#Import settings|3D Importer]] so that Studio detects the cages and creates the cage objects for you.

## How cages pair

Roblox pairs cages by their **UV coordinates** rather than by position, so any two cages that share a UV layout can wrap over each other, even when their shapes differ. This is what lets a single accessory fit bodies of completely different shapes and sizes without remodeling it for each one.

*(image in the full Top G Vault)*

The following shapes are completely different, but they all share the identical UV map above, so a single layered mesh can deform onto any of them.

*(image in the full Top G Vault)*

*Cube*

*(image in the full Top G Vault)*

*Sphere — shaped from a cube*

*(image in the full Top G Vault)*

*Flattened — sculpted from a cube*

## Create caged assets

Use the following guides to create caged assets. Each guide includes downloadable files and basic implementation steps to follow along.

- [[30 Official Roblox Docs/Art/Modeling/Cage Meshes/Create cages in Blender|Create cages in Blender]] — author the outer and inner cages for a model and import them into Studio.
- [[30 Official Roblox Docs/Art/Modeling/Cage Meshes/Apply deformation|Apply deformation]] — deform a caged mesh onto a target with a [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]].
- [[30 Official Roblox Docs/Art/Accessories/Creating/Create your first layered accessory|Create your own layered accessory]] — create a layered accessory using Roblox's provided reference cages.

---
*Source: [Cage meshes](https://create.roblox.com/docs/art/modeling/cage-meshes) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
