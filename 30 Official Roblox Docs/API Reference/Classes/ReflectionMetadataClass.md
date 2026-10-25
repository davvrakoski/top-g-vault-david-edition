---
title: "ReflectionMetadataClass"
description: "Registers information about a class, and its members. Should be parented to `ReflectionMetadataClasses`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ReflectionMetadataClass"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Registers information about a class, and its members. Should be parented to [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataClasses|ReflectionMetadataClasses]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem|ReflectionMetadataItem]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Registers information about a class, and its members. Should be parented to [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataClasses|ReflectionMetadataClasses]]

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataClass#ExplorerImageIndex\|ExplorerImageIndex]] | int | A number index, which refers to a specific class icon. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataClass#ExplorerOrder\|ExplorerOrder]] | int | Determines how this class is sorted in the Explorer compared to other classes. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataClass#Insertable\|Insertable]] | boolean | Toggles whether or not this object can be inserted through the Advanced Objects menu. |
| [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataClass#PreferredParent\|PreferredParent]] | string | Sets the class that this class would prefer parenting to. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataItem|ReflectionMetadataItem]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ExplorerImageIndex

**Type:** int

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

A number index, which refers to a specific class icon.

### ExplorerOrder

**Type:** int

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

Determines how this class is sorted in the Explorer compared to other classes.

### Insertable

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

Toggles whether or not this object can be inserted through the Advanced Objects menu.

### PreferredParent

**Type:** string

**Thread safety:** ReadSafe · **Category:** Reflection · **Loaded/Saved:** true/true

Sets the class that this class would prefer parenting to.

---
*Source: [ReflectionMetadataClass](https://create.roblox.com/docs/reference/engine/classes/ReflectionMetadataClass) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
