---
title: "PluginAction"
description: "Represents a generic performable action in Roblox Studio that can optionally be bound to a keyboard shortcut."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PluginAction"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents a generic performable action in Roblox Studio that can optionally be bound to a keyboard shortcut.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotReplicated`

## Description

`PluginAction` represents a generic performable action in Studio with no directly‑associated [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton|PluginToolbarButton]]. If [[30 Official Roblox Docs/API Reference/Classes/PluginAction#AllowBinding|AllowBinding]] is `true`, the action can be assigned a keyboard shortcut through Studio's **File** ⟩ **Customize Shortcuts** window.

A `PluginAction` must be created using the [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreatePluginAction|Plugin:CreatePluginAction()]] method in order to work as expected.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginAction#ActionId\|ActionId]] | string | A string that uniquely identifies this action. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginAction#AllowBinding\|AllowBinding]] | boolean | Determines whether the action can be assigned a keyboard shortcut in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginAction#StatusTip\|StatusTip]] | string | The description of the action when viewing it from the keyboard shortcuts window in Roblox Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginAction#Text\|Text]] | string | The text that is displayed when viewing this action in Roblox Studio. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginAction#Triggered\|Triggered]] |  | Fires when the action is triggered. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ActionId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

A string that uniquely identifies this action. This string is the key used when saving and loading the action's state in Roblox Studio.

### AllowBinding

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property determines whether the action can be assigned a keyboard shortcut through Studio's **File** ⟩ **Customize Shortcuts** window. Default is `true`.

### StatusTip

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

The description of the action when viewing it from the keyboard shortcuts window in Roblox Studio.

### Text

**Type:** string

**Security:** read None / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

The text that is displayed when viewing this action in Roblox Studio.

## Events

### Triggered

```lua
PluginAction.Triggered()
```

**Security:** PluginSecurity

Fires when the action is triggered, typically through the keyboard shortcut that it was bound to.

---
*Source: [PluginAction](https://create.roblox.com/docs/reference/engine/classes/PluginAction) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
