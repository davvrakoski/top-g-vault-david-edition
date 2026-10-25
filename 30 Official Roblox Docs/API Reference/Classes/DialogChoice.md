---
title: "DialogChoice"
description: "Used to craft the further choices available to players who have started a dialog conversation with an NPC."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DialogChoice"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Used to craft the further choices available to players who have started a dialog conversation with an NPC.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Used to craft the further choices available to players who have started a dialog conversation with an NPC.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DialogChoice#GoodbyeChoiceActive\|GoodbyeChoiceActive]] | boolean | Toggles whether the goodbye option will be displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/DialogChoice#GoodbyeDialog\|GoodbyeDialog]] | string | Sets the sentence that the dialog will show to the player when the chat ends. |
| [[30 Official Roblox Docs/API Reference/Classes/DialogChoice#ResponseDialog\|ResponseDialog]] | string | Sets what the NPC will say when the player chooses this DialogChoice. |
| [[30 Official Roblox Docs/API Reference/Classes/DialogChoice#UserDialog\|UserDialog]] | string | Sets what the player will say when they choose this DialogChoice. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### GoodbyeChoiceActive

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Toggles whether the goodbye option will be displayed. If true, the dialog will display the content of [[30 Official Roblox Docs/API Reference/Classes/DialogChoice#GoodbyeDialog|DialogChoice.GoodbyeDialog]] as the last option after other dialog choices. Clicking on the goodbye option will exit the dialog.

### GoodbyeDialog

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the sentence that the dialog will show to the player when the chat ends

### ResponseDialog

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets what the NPC will say when the player chooses this DialogChoice.

### UserDialog

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets what the player will say when they choose this DialogChoice.

---
*Source: [DialogChoice](https://create.roblox.com/docs/reference/engine/classes/DialogChoice) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
