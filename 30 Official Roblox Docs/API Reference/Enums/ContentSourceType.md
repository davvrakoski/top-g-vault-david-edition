---
title: "ContentSourceType"
description: "The source type of a `Content` value."
api_type: enum
aliases: ["Enum.ContentSourceType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ContentSourceType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The source type of a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] value.*

## Description

The source type of [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] value. Indicates which properties of a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] contain the referenced content.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | Empty value with no source type. Does not reference any content or hold any non‑`nil` value. |
| `Uri` | 1 | An [asset URI](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) `string` value contained in [[30 Official Roblox Docs/API Reference/Datatypes/Content#Uri\|Content.Uri]]. |
| `Object` | 2 | A non-`nil` [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]] reference contained in [[30 Official Roblox Docs/API Reference/Datatypes/Content#Object\|Content.Object]]. |
| `Opaque` | 3 | A non-`nil` `Opaque` reference contained in [[30 Official Roblox Docs/API Reference/Datatypes/Content#Opaque\|Content.Opaque]]. |

---
*Source: [ContentSourceType](https://create.roblox.com/docs/reference/engine/enums/ContentSourceType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
