---
title: "StyleDerive"
description: "When parented to a `StyleSheet`, references another `StyleSheet` from which the parent inherits `StyleRules` and token definitions."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StyleDerive"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*When parented to a [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]], references another [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] from which the parent inherits [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]] and token definitions.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

When parented to a [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]], references another [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] from which the parent inherits [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]] and token definitions. Multiple `StyleDerive` instances can exist under a [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] and you can order them by [[30 Official Roblox Docs/API Reference/Classes/StyleDerive#Priority|Priority]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StyleDerive#Priority\|Priority]] | int | A number that determines how style properties inherited through this `StyleDerive` apply relative to the same properties inherited through other `StyleDerives`. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleDerive#StyleSheet\|StyleSheet]] | [[30 Official Roblox Docs/API Reference/Classes/StyleSheet\|StyleSheet]] | The [[30 Official Roblox Docs/API Reference/Classes/StyleSheet\|StyleSheet]] from which the parent [[30 Official Roblox Docs/API Reference/Classes/StyleSheet\|StyleSheet]] inherits [[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRules]] and token definitions. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Priority

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

A number that determines how style properties inherited through this `StyleDerive` apply relative to the same properties inherited through other `StyleDerives`. Higher priority takes precedence over lower; for example, if a `StyleDerive` with a priority of `10` points to a sheet `StyleSheetA`, its [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]] and tokens will take precedence over the same [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]] and tokens inherited through lower-priority `StyleDerives`.

### StyleSheet

**Type:** [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] from which the parent [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] inherits [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]] and token definitions.

---
*Source: [StyleDerive](https://create.roblox.com/docs/reference/engine/classes/StyleDerive) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
