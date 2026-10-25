---
title: "3D workspace"
description: "Describes the workspace container service, which holds all objects that exist in the 3D world."
area: "30 Official Roblox Docs"
cluster: "Workspace"
source: "https://create.roblox.com/docs/workspace"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Describes the workspace container service, which holds all objects that exist in the 3D world.*

[[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] is a container service that holds objects that you want the
Roblox Engine to render in the 3D world. You typically will add these objects to
the workspace:

- [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] objects, which includes both [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] and [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects.
- [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects, which you can attach to special effect generators like a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]], UI objects like a [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]], physical [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]], and more.
- [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] objects that organize geometric groupings.
- [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] objects that are parented by other objects in the workspace.
  Scripts aren't rendered but can affect another object's rendering.

## Parts

[[30 Official Roblox Docs/API Reference/Classes/Part|Part]] objects represent the primitive building blocks in Roblox. By default, all parts have their physics simulated and are rendered if they appear in the 3D workspace. Parts can take the shape of blocks, spheres, cylinders, wedges, or corner wedges. In addition, [[30 Official Roblox Docs/API Reference/Classes/TrussPart|TrussPart]] acts as a truss beam that characters can climb like a ladder.

*(image in the full Top G Vault)*

*Block*

*(image in the full Top G Vault)*

*Sphere*

*(image in the full Top G Vault)*

*Cylinder*

*(image in the full Top G Vault)*

*Wedge*

*(image in the full Top G Vault)*

*Corner Wedge*

You can also apply [[30 Official Roblox Docs/Parts/Solid modeling|solid modeling]] operations to parts, such as union or negate, to combine them into something more complex like bowls or hollow pipes.

## Meshes

A [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] is an object that represents a mesh (a collection of
vertices, edges, and faces that make up a 3D object). You typically create
meshes using third-party software such as [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview),
then import them as a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] using Studio.

Meshes can include far more detail than any solid modeling you can do in
Studio. They can also have internal rigs and textures, allowing you to
create lifelike objects that you can pose and animate.

*(image in the full Top G Vault)*

*Mesh with texture*

*(image in the full Top G Vault)*

*Mesh with SurfaceAppearance*

## Terrain

The [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] object allows you to generate and sculpt detailed and realistic terrain environments, such as mountains, bodies of water, grass-covered hills, or a flat desert. Using the [[30 Official Roblox Docs/Studio/Terrain Editor|Terrain Editor]], you can easily generate and alter large regions of terrain.

*(image in the full Top G Vault)*

## Models

A [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] is a container object for **geometric groupings**, such as
[[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] objects, and other models. Models can be simple
groupings or you can set a primary part within the model, so that it functions as
an assembly, which the physics engine treats as a single rigid body. Models can
also contain scripts that act on the individual objects of the model.

*(image in the full Top G Vault)*

*A model named Octavia*

*(image in the full Top G Vault)*

*The groupings that comprise the model*

## Workspace access in scripts

Within a script, you can access a place's [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] in three different ways, all of which are valid.

- `game:GetService("Workspace")`
- `workspace`
- `game.Workspace`

From there, you can carry out a large set of use cases to script logic for your
games and create dynamic worlds and interactions. For example:

- Obtain a reference to any object in the workspace to change its properties during runtime.
- Obtain a reference to a user's [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] object to [[30 Official Roblox Docs/Workspace/Camera/Customize the camera|manipulate their view]] of the workspace.
- Listen for events on objects in the workspace to carry out
  logic at specific times, such as when a user's playable character [[30 Official Roblox Docs/Workspace/Collisions|touches an object]].

---
*Source: [3D workspace](https://create.roblox.com/docs/workspace) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
