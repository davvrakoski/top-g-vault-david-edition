---
title: "MeshAttribute"
description: "Identifies a mesh attribute when calling the batch methods on `EditableMesh`."
api_type: enum
aliases: ["Enum.MeshAttribute"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/MeshAttribute"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies a mesh attribute when calling the batch methods on [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]].*

## Description

[[30 Official Roblox Docs/API Reference/Enums/MeshAttribute|Enum.MeshAttribute]] identifies a mesh attribute when calling the batch methods on [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]]. Some methods take this enum as an argument to identify which attribute to operate on.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Vertex` | 0 | The per-element vertex position attribute, storing a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] point in object space for each vertex. |
| `Normal` | 1 | The per-element surface normal attribute, storing a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] direction used for lighting calculations. |
| `Color` | 2 | The per-element color attribute, storing a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] value and a float alpha for each color entry. |
| `UV` | 3 | The per-element UV attribute, storing a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] texture coordinate for each UV entry. |
| `Face` | 4 | The face attribute channel, identifying topology elements that connect vertex positions into triangles. |

---
*Source: [MeshAttribute](https://create.roblox.com/docs/reference/engine/enums/MeshAttribute) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
