---
title: "CageType"
description: "Specifies which cage surface — inner or outer — to read or write on a `BaseWrap` object."
api_type: enum
aliases: ["Enum.CageType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CageType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies which cage surface — inner or outer — to read or write on a [[30 Official Roblox Docs/API Reference/Classes/BaseWrap|BaseWrap]] object.*

## Description

Specifies which cage surface to target when calling cage-mesh methods on a [[30 Official Roblox Docs/API Reference/Classes/BaseWrap|BaseWrap]] object such as `GetVertices()`, `GetFaces()`, `GetUVs()`, and `ModifyVertices()`.

A [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] carries two cage meshes: an inner cage that fits against the surface beneath it (the avatar body or an underlying accessory) and an outer cage that defines the surface the next clothing layer conforms to. `CageType` selects which of those two meshes the called method operates on.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Inner` | 0 | Selects the inner cage mesh, which defines the surface that conforms to the body or underlying layer beneath the accessory. |
| `Outer` | 1 | Selects the outer cage mesh, which defines the surface that the next clothing layer above this accessory conforms to. |

---
*Source: [CageType](https://create.roblox.com/docs/reference/engine/enums/CageType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
