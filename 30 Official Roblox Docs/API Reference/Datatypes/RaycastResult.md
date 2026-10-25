---
title: "RaycastResult"
description: "Stores results from a raycast operation."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/RaycastResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Stores results from a raycast operation.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult|RaycastResult]] data type stores the result of a successful raycasting operation performed by [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|WorldRoot:Raycast()]]. It contains the properties listed below.

This object should not be confused with the similarly-named [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams|RaycastParams]] which is used to perform a raycast.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult#Distance\|Distance]] | number | The distance between the ray origin and the intersection point. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult#Instance\|Instance]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | The [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] cell that the ray intersected. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult#Material\|Material]] | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] | The [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] at the intersection point. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The world space point at which the intersection occurred. |
| [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult#Normal\|Normal]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The normal vector of the intersected face. |

## Properties

### Distance

**Type:** number

The distance between the ray origin and the intersection point.

### Instance

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

The [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] cell that the ray intersected.

### Material

**Type:** [[30 Official Roblox Docs/API Reference/Enums/Material|Material]]

The [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]] at the intersection point. For normal parts this is the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|BasePart.Material]]; for [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] this can vary depending on terrain data.

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

The world space point at which the intersection occurred, usually a point directly on the surface of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] cell.

### Normal

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

The normal vector of the intersected face.

---
*Source: [RaycastResult](https://create.roblox.com/docs/reference/engine/datatypes/RaycastResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
