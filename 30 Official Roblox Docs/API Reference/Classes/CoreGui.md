---
title: "CoreGui"
description: "The CoreGui is a service used to store Guis created in-game by Roblox for the core user interface found in every game (such as the game menu, the playerlist, the backpack, etc.). It can also be used by `Plugins` in Roblox Studio."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CoreGui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The CoreGui is a service used to store Guis created in-game by Roblox for the core user interface found in every game (such as the game menu, the playerlist, the backpack, etc.). It can also be used by [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugins]] in Roblox Studio.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BasePlayerGui|BasePlayerGui]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

The CoreGui is a service used to store Guis created in-game by Roblox for the core user interface found in every game (such as the game menu, the playerlist, the backpack, etc.). It can also be used by [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugins]] in Roblox Studio.

You can use the [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled|StarterGui:SetCoreGuiEnabled()]] and [[30 Official Roblox Docs/API Reference/Classes/StarterGui#GetCoreGuiEnabled|StarterGui:GetCoreGuiEnabled()]] methods in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] to enable and disable most elements of the CoreGui. You can also use [[30 Official Roblox Docs/API Reference/Classes/PlayerGui#SetTopbarTransparency|PlayerGui:SetTopbarTransparency()]] to set the transparency of the top bar.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CoreGui#SelectionImageObject\|SelectionImageObject]] | [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] | Overrides the default selection adornment used for gamepad selection in the CoreGui. |
| [[30 Official Roblox Docs/API Reference/Classes/CoreGui#Version\|Version]] | int | The current version of the CoreGui. Every time the CoreGui is majorly changed, this number is increased. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BasePlayerGui|BasePlayerGui]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### SelectionImageObject

**Type:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property is not accessible through scripts but is viewable in the Properties window. It overrides the default selection adornment used for gamepad selection across all CoreGui elements.

### Version

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

The current version of the CoreGui. Every time the CoreGui is majorly changed, this number is increased.

---
*Source: [CoreGui](https://create.roblox.com/docs/reference/engine/classes/CoreGui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
