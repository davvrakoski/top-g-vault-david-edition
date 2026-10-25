---
title: "BubbleChatMessageProperties"
description: "Overrides `BubbleChatConfiguration` properties for an individual bubble chat message."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BubbleChatMessageProperties"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Overrides [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]] properties for an individual bubble chat message.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties|TextChatMessageProperties]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Overrides [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]] properties for an individual bubble chat message. Return an instance of this class from the [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnBubbleAdded|TextChatService.OnBubbleAdded]] callback to customize the appearance of a single message's bubble; any property set here takes precedence over the game-wide [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties#BackgroundColor3\|BackgroundColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Background color of bubbles. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties#BackgroundTransparency\|BackgroundTransparency]] | double | Background transparency of bubbles. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] | Font of the bubble text. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties#TailVisible\|TailVisible]] | boolean | Determines whether the tail at the bottom of the chat bubble is visible. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties#TextColor3\|TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Color of bubble text. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties#TextSize\|TextSize]] | int64 | Size of bubble text. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties|TextChatMessageProperties]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### BackgroundColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Chat

Background color of bubbles in [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]].

### BackgroundTransparency

**Type:** double

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Chat

Background transparency of bubbles.

### FontFace

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Chat

Font of the bubble text in [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]].

### TailVisible

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Chat

Determines whether the tail at the bottom of the chat bubble is visible. Defaults to `true`.

### TextColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Chat

Color of bubble text in [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]].

### TextSize

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Chat

Size of bubble text.

---
*Source: [BubbleChatMessageProperties](https://create.roblox.com/docs/reference/engine/classes/BubbleChatMessageProperties) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
