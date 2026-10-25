---
title: "StyleLink"
description: "Links a `StyleSheet` to the instance tree whose root is the parent of the `StyleLink`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StyleLink"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Links a [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] to the instance tree whose root is the parent of the `StyleLink`.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

Links a [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] to the instance tree whose root is the parent of the `StyleLink`. For example, placing a `StyleLink` under a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] applies the referenced [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] to both the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] and all of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] within it. Only one [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] can apply to a given tree.

*(image in the full Top G Vault)*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StyleLink#StyleSheet\|StyleSheet]] | [[30 Official Roblox Docs/API Reference/Classes/StyleSheet\|StyleSheet]] | The [[30 Official Roblox Docs/API Reference/Classes/StyleSheet\|StyleSheet]] to link to the parent such that the parent's descendants are styled accordingly. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### StyleSheet

**Type:** [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] to link to the parent such that the parent's descendants are styled accordingly.

---
*Source: [StyleLink](https://create.roblox.com/docs/reference/engine/classes/StyleLink) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
