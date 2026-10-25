---
title: "CapturesViewConfiguration"
description: "Controls the built-in captures view, the `CoreGui` element that lets players browse and manage screenshots and video captures they take within an experience."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CapturesViewConfiguration"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Controls the built-in captures view, the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element that lets players browse and manage screenshots and video captures they take within an experience.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BaseCoreGuiConfiguration|BaseCoreGuiConfiguration]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

[[30 Official Roblox Docs/API Reference/Classes/CapturesViewConfiguration|CapturesViewConfiguration]] is the per-element configuration object that controls the built-in captures view — the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element that lets players browse and manage the screenshots and video captures they take within an experience. It's created automatically as a child of the [[30 Official Roblox Docs/API Reference/Classes/CoreGuiConfiguration|CoreGuiConfiguration]] service.

It inherits [[30 Official Roblox Docs/API Reference/Classes/BaseCoreGuiConfiguration#Enabled|Enabled]] to toggle whether the captures view is displayed, and adds [[30 Official Roblox Docs/API Reference/Classes/CapturesViewConfiguration#Open|Open]] to control whether the view is currently open.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CapturesViewConfiguration#Open\|Open]] | boolean | Determines whether the built-in captures view is currently open. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BaseCoreGuiConfiguration|BaseCoreGuiConfiguration]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Open

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** UI, Capture

When `true`, the built-in captures view is open and shown to the player; when `false`, the view is closed. Defaults to `false`.

---
*Source: [CapturesViewConfiguration](https://create.roblox.com/docs/reference/engine/classes/CapturesViewConfiguration) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
