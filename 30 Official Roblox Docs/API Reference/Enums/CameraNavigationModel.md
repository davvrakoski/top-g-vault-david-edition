---
title: "CameraNavigationModel"
description: "Determines the camera navigation paradigm used in the Roblox Studio editor viewport."
api_type: enum
aliases: ["Enum.CameraNavigationModel"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CameraNavigationModel"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines the camera navigation paradigm used in the Roblox Studio editor viewport.*

## Description

The **CameraNavigationModel** enum selects the camera navigation paradigm for the Roblox Studio editor viewport. It is used by the [[30 Official Roblox Docs/API Reference/Classes/Studio#CameraNavigationModel|Studio.CameraNavigationModel]] property to choose between the classic Roblox navigation model ([[30 Official Roblox Docs/API Reference/Enums/CameraNavigationModel|Enum.CameraNavigationModel.Roblox]]) and an industry-standard model ([[30 Official Roblox Docs/API Reference/Enums/CameraNavigationModel|Enum.CameraNavigationModel.IndustryCompatible]]) that matches conventions found in other professional 3D applications.

[[30 Official Roblox Docs/API Reference/Classes/Studio#CameraNavigationModel|Studio.CameraNavigationModel]] defaults to [[30 Official Roblox Docs/API Reference/Enums/CameraNavigationModel|Enum.CameraNavigationModel.Roblox]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Roblox` | 0 | Classic Roblox Studio camera navigation model with linear zoom and focus-locked orbiting; the default value. |
| `IndustryCompatible` | 1 | Camera navigation model that follows industry-standard 3D application conventions, with non-linear zoom and simultaneous WASD-plus-orbit movement. |

---
*Source: [CameraNavigationModel](https://create.roblox.com/docs/reference/engine/enums/CameraNavigationModel) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
