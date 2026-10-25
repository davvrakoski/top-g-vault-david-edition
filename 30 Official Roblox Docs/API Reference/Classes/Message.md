---
title: "Message"
description: "Fills the entire screen with a semi-transparent grey background, with centered text in the middle of the screen."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Message"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Fills the entire screen with a semi-transparent grey background, with centered text in the middle of the screen.*

> [!warning] Deprecated
> With the introduction of Roblox's GUI features hints have been deprecated and
> `Class.TextLabel|TextLabels` should be used instead for new work. The
> `Class.TextLabel` object offers a wide range of features for displaying and
> customizing text that messages do not.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/Hint|Hint]]
- **Memory category:** Instances
- **Tags:** `Deprecated`

## Description

Fills the entire screen with a semi-transparent grey background, with centered text in the middle of the screen.

Messages will not display if the [[30 Official Roblox Docs/API Reference/Classes/Message#Text|Message.Text]] field is empty.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Message#Text\|Text]] | string | **Deprecated.** Sets the text of a [[30 Official Roblox Docs/API Reference/Classes/Message\|Message]] or [[30 Official Roblox Docs/API Reference/Classes/Hint\|Hint]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Text

> [!warning] Deprecated
> `Class.Message|Messages` and `Class.Hint|Hints` have been deprecated;
> `Class.TextLabel|TextLabels` should be used instead in new work.

**Type:** string

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the text of a [[30 Official Roblox Docs/API Reference/Classes/Message|Message]] or [[30 Official Roblox Docs/API Reference/Classes/Hint|Hint]].

A [[30 Official Roblox Docs/API Reference/Classes/Message|Message]] will be invisible if its [[30 Official Roblox Docs/API Reference/Classes/Message#Text|Message.Text]] property is blank, however the black bar of a [[30 Official Roblox Docs/API Reference/Classes/Hint|Hint]] will remain visible.

---
*Source: [Message](https://create.roblox.com/docs/reference/engine/classes/Message) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
