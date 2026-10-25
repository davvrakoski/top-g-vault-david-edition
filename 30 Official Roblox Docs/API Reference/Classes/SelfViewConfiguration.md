---
title: "SelfViewConfiguration"
description: "Controls the built-in self view, the `CoreGui` element that shows a player a preview of their own character within an experience."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SelfViewConfiguration"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Controls the built-in self view, the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element that shows a player a preview of their own character within an experience.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BaseCoreGuiConfiguration|BaseCoreGuiConfiguration]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

[[30 Official Roblox Docs/API Reference/Classes/SelfViewConfiguration|SelfViewConfiguration]] is the configuration object for the built-in self view — the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element that shows a player a preview of their own character within an experience. A single instance is created automatically as a child of the [[30 Official Roblox Docs/API Reference/Classes/CoreGuiConfiguration|CoreGuiConfiguration]] service and is reached through [[30 Official Roblox Docs/API Reference/Classes/CoreGuiConfiguration#SelfViewConfiguration|CoreGuiConfiguration.SelfViewConfiguration]].

It inherits [[30 Official Roblox Docs/API Reference/Classes/BaseCoreGuiConfiguration#Enabled|Enabled]], which toggles whether the self view is available, and adds [[30 Official Roblox Docs/API Reference/Classes/SelfViewConfiguration#Open|Open]], which you can read and write to open or close the view.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SelfViewConfiguration#Open\|Open]] | boolean | Determines whether the built-in self view is currently open. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BaseCoreGuiConfiguration|BaseCoreGuiConfiguration]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Open

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** UI

When `true`, the self view is open; when `false`, it is closed. Defaults to `false`. This property does not update when the view is shown or hidden through [[30 Official Roblox Docs/API Reference/Classes/SocialService#ShowSelfView|SocialService:ShowSelfView()]] or [[30 Official Roblox Docs/API Reference/Classes/SocialService#HideSelfView|SocialService:HideSelfView()]].

---
*Source: [SelfViewConfiguration](https://create.roblox.com/docs/reference/engine/classes/SelfViewConfiguration) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
