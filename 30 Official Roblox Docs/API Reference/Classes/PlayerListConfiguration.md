---
title: "PlayerListConfiguration"
description: "Controls the built-in player list, the `CoreGui` element that displays the players currently in the experience."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PlayerListConfiguration"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Controls the built-in player list, the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element that displays the players currently in the experience.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BaseCoreGuiConfiguration|BaseCoreGuiConfiguration]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

[[30 Official Roblox Docs/API Reference/Classes/PlayerListConfiguration|PlayerListConfiguration]] is the per-element configuration object that controls the built-in player list — the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element that displays the players currently in the experience. It's created automatically as a child of the [[30 Official Roblox Docs/API Reference/Classes/CoreGuiConfiguration|CoreGuiConfiguration]] service and is reached through [[30 Official Roblox Docs/API Reference/Classes/CoreGuiConfiguration#PlayerListConfiguration|CoreGuiConfiguration.PlayerListConfiguration]].

It inherits [[30 Official Roblox Docs/API Reference/Classes/BaseCoreGuiConfiguration#Enabled|Enabled]] to toggle whether the player list is displayed, and adds [[30 Official Roblox Docs/API Reference/Classes/PlayerListConfiguration#Open|Open]] to control whether the list is currently open.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PlayerListConfiguration#Open\|Open]] | boolean | Determines whether the built-in player list is currently open. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BaseCoreGuiConfiguration|BaseCoreGuiConfiguration]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Open

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** UI

When `true`, the built-in player list is open and shown to the player; when `false`, the list is closed. Defaults to `true`.

---
*Source: [PlayerListConfiguration](https://create.roblox.com/docs/reference/engine/classes/PlayerListConfiguration) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
