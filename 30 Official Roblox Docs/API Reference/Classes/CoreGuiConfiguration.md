---
title: "CoreGuiConfiguration"
description: "Service that groups the configuration objects controlling Roblox's built-in `CoreGui` elements."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CoreGuiConfiguration"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Service that groups the configuration objects controlling Roblox's built-in [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] elements.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

[[30 Official Roblox Docs/API Reference/Classes/CoreGuiConfiguration|CoreGuiConfiguration]] is a service that groups the per-element configuration objects controlling Roblox's built-in [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] elements. When it is added to the data model, it automatically creates one child of each configuration type — [[30 Official Roblox Docs/API Reference/Classes/PlayerListConfiguration|PlayerListConfiguration]], [[30 Official Roblox Docs/API Reference/Classes/CapturesViewConfiguration|CapturesViewConfiguration]], and [[30 Official Roblox Docs/API Reference/Classes/SelfViewConfiguration|SelfViewConfiguration]] — and exposes each of them through a property of the same name.

Each child configuration object inherits [[30 Official Roblox Docs/API Reference/Classes/BaseCoreGuiConfiguration#Enabled|Enabled]] to toggle whether its corresponding core GUI element is displayed.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CoreGuiConfiguration#CapturesViewConfiguration\|CapturesViewConfiguration]] | [[30 Official Roblox Docs/API Reference/Classes/CapturesViewConfiguration\|CapturesViewConfiguration]] | References the [[30 Official Roblox Docs/API Reference/Classes/CapturesViewConfiguration\|CapturesViewConfiguration]] object that controls the built-in captures view. |
| [[30 Official Roblox Docs/API Reference/Classes/CoreGuiConfiguration#PlayerListConfiguration\|PlayerListConfiguration]] | [[30 Official Roblox Docs/API Reference/Classes/PlayerListConfiguration\|PlayerListConfiguration]] | References the [[30 Official Roblox Docs/API Reference/Classes/PlayerListConfiguration\|PlayerListConfiguration]] object that controls the built-in player list. |
| [[30 Official Roblox Docs/API Reference/Classes/CoreGuiConfiguration#SelfViewConfiguration\|SelfViewConfiguration]] | [[30 Official Roblox Docs/API Reference/Classes/SelfViewConfiguration\|SelfViewConfiguration]] | References the [[30 Official Roblox Docs/API Reference/Classes/SelfViewConfiguration\|SelfViewConfiguration]] object that controls the built-in self view. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CapturesViewConfiguration

**Type:** [[30 Official Roblox Docs/API Reference/Classes/CapturesViewConfiguration|CapturesViewConfiguration]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Capture

References the [[30 Official Roblox Docs/API Reference/Classes/CapturesViewConfiguration|CapturesViewConfiguration]] object that controls the built-in captures view — the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element that lets players browse and manage the screenshots and video captures they take within an experience. The service creates this child automatically, so the property refers to that instance for the lifetime of the service.

### PlayerListConfiguration

**Type:** [[30 Official Roblox Docs/API Reference/Classes/PlayerListConfiguration|PlayerListConfiguration]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

References the [[30 Official Roblox Docs/API Reference/Classes/PlayerListConfiguration|PlayerListConfiguration]] object that controls the built-in player list — the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element that displays the players currently in the experience. The service creates this child automatically, so the property refers to that instance for the lifetime of the service.

### SelfViewConfiguration

**Type:** [[30 Official Roblox Docs/API Reference/Classes/SelfViewConfiguration|SelfViewConfiguration]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

References the [[30 Official Roblox Docs/API Reference/Classes/SelfViewConfiguration|SelfViewConfiguration]] object that controls the built-in self view — the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element that shows players a preview of their own camera feed. The service creates this child automatically, so the property refers to that instance for the lifetime of the service.

---
*Source: [CoreGuiConfiguration](https://create.roblox.com/docs/reference/engine/classes/CoreGuiConfiguration) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
