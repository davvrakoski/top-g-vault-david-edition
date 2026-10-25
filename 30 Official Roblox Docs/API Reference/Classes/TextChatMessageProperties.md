---
title: "TextChatMessageProperties"
description: "Overrides `TextChatMessage` properties when returned by callbacks defined in `TextChatService.OnIncomingMessage` or `TextChannel.OnIncomingMessage`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TextChatMessageProperties"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Overrides [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] properties when returned by callbacks defined in [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage|TextChatService.OnIncomingMessage]] or [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties|BubbleChatMessageProperties]], [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties|ChatWindowMessageProperties]]
- **Memory category:** Instances

## Description

Overrides [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] properties like [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#ChatWindowMessageProperties|ChatWindowMessageProperties]] and [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#BubbleChatMessageProperties|BubbleChatMessageProperties]] when returned by callbacks defined in [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage|TextChatService.OnIncomingMessage]] or [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]]. These properties are useful for customizing the appearance of a message with [[30 Official Roblox Docs/UI/Rich text markup|rich text]] tags.

For sample code, see [[30 Official Roblox Docs/Chat/Examples/Assign chat tags|Assign chat tags]].

If you return empty strings for any of these properties, [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] ignores them and **doesn't** override the original values.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties#PrefixText\|PrefixText]] | string | The [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#PrefixText\|TextChatMessage.PrefixText]] to override. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties#Text\|Text]] | string | The [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Text\|TextChatMessage.Text]] to override. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties#Translation\|Translation]] | string | The [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Translation\|TextChatMessage.Translation]] to override. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### PrefixText

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat

The [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#PrefixText|TextChatMessage.PrefixText]] to override.

### Text

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat

The [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Text|TextChatMessage.Text]] to override.

### Translation

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat

The [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Translation|TextChatMessage.Translation]] to override; represents [[30 Official Roblox Docs/Production/Localization/Automatic translation|automatically translated]] and filtered text messages based on players' localization settings.

---
*Source: [TextChatMessageProperties](https://create.roblox.com/docs/reference/engine/classes/TextChatMessageProperties) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
