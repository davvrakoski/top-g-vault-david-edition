---
title: "DeveloperMemoryTag"
description: "A memory tracking category."
api_type: enum
aliases: ["Enum.DeveloperMemoryTag"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DeveloperMemoryTag"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*A memory tracking category.*

## Description

A list of memory categories, and a description of what they are allocated to.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Internal` | 0 | General data that doesn't have any categorization. This could be due to either internal reasons, or because it simply isn't being tracked categorically. |
| `HttpCache` | 1 | A cache of HTTP responses. |
| `Instances` | 2 | All the Instances present in memory. |
| `Signals` | 3 | Events, signals, connections, etc. |
| `LuaHeap` | 4 | All of the data in Luau, including everything happening in core scripts, built-in data types, etc. |
| `Script` | 5 | All memory being manipulated and referenced by scripts. |
| `PhysicsCollision` | 6 | Collision detection in the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]]. |
| `BaseParts` | 7 | 3D parts used for simulation. |
| `GraphicsSolidModels` | 8 | Rendering solid models (stuff made with Union, Negate, etc.). |
| `GraphicsMeshParts` | 10 | Rendering of mesh parts. |
| `GraphicsParticles` | 11 | Rendering of particles from ParticleEmitters. |
| `GraphicsParts` | 12 | Rendering of regular parts. |
| `GraphicsSpatialHash` | 13 | Spatial hash lookup tables of the game world that are used for rendering. |
| `GraphicsTerrain` | 14 | Rendering of terrain geometry. |
| `GraphicsTexture` | 15 | Rendering of textures in the game world. |
| `GraphicsTextureCharacter` | 16 | Rendering of texture composition maps that are generated for Humanoids. |
| `Sounds` | 17 | Data of sounds in-game. |
| `StreamingSounds` | 18 | Playback of sounds in-game. |
| `TerrainVoxels` | 19 | Occupancy/Material data of the Terrain. |
| `Gui` | 21 | Gui element data and rendering. |
| `Animation` | 22 | Playback of Animations on Humanoids and AnimationControllers. |
| `Navigation` | 23 | Pathfinding for Humanoids via the PathfindingService. |
| `GeometryCSG` | 24 | Geometry mesh data for CSG objects such as [[30 Official Roblox Docs/API Reference/Classes/UnionOperation\|UnionOperation]] and [[30 Official Roblox Docs/API Reference/Classes/PartOperation\|PartOperation]]. |
| `GraphicsSlimModels` | 25 | Rendering memory for SLIM (streamed level-of-detail instance mesh) model data. |

---
*Source: [DeveloperMemoryTag](https://create.roblox.com/docs/reference/engine/enums/DeveloperMemoryTag) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
