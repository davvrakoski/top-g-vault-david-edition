---
title: "BaseCoreGuiConfiguration"
description: "Base class for the configuration objects that control individual built-in `CoreGui` elements."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BaseCoreGuiConfiguration"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Base class for the configuration objects that control individual built-in [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] elements.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/CapturesViewConfiguration|CapturesViewConfiguration]], [[30 Official Roblox Docs/API Reference/Classes/PlayerListConfiguration|PlayerListConfiguration]], [[30 Official Roblox Docs/API Reference/Classes/SelfViewConfiguration|SelfViewConfiguration]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

[[30 Official Roblox Docs/API Reference/Classes/BaseCoreGuiConfiguration|BaseCoreGuiConfiguration]] is the base class inherited by the per-element configuration objects that control Roblox's built-in [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] elements: [[30 Official Roblox Docs/API Reference/Classes/PlayerListConfiguration|PlayerListConfiguration]], [[30 Official Roblox Docs/API Reference/Classes/SelfViewConfiguration|SelfViewConfiguration]], and [[30 Official Roblox Docs/API Reference/Classes/CapturesViewConfiguration|CapturesViewConfiguration]]. Each of these concrete configuration objects is created automatically as a child of the [[30 Official Roblox Docs/API Reference/Classes/CoreGuiConfiguration|CoreGuiConfiguration]] service.

It defines the shared [[30 Official Roblox Docs/API Reference/Classes/BaseCoreGuiConfiguration#Enabled|Enabled]] property that toggles whether the corresponding core GUI element is enabled.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BaseCoreGuiConfiguration#Enabled\|Enabled]] | boolean | Determines whether the built-in [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] element controlled by this configuration object is enabled. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true

When `true`, the built-in [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]] element associated with the inheriting configuration object is enabled; when `false`, that element is disabled. Enabled is not the same as currently shown. Defaults to `true`.

Each concrete subclass — [[30 Official Roblox Docs/API Reference/Classes/PlayerListConfiguration|PlayerListConfiguration]], [[30 Official Roblox Docs/API Reference/Classes/SelfViewConfiguration|SelfViewConfiguration]], and [[30 Official Roblox Docs/API Reference/Classes/CapturesViewConfiguration|CapturesViewConfiguration]] — inherits this property to toggle its respective element.

---
*Source: [BaseCoreGuiConfiguration](https://create.roblox.com/docs/reference/engine/classes/BaseCoreGuiConfiguration) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
