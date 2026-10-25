---
title: "ChatWindowMessageProperties"
description: "Customizes the appearance of an individual text chat message displayed in the chat window."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ChatWindowMessageProperties"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Customizes the appearance of an individual text chat message displayed in the chat window.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties|TextChatMessageProperties]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

Can be used to customize the appearance of text chat messages sent to the ChatWindow. Inherits from [TextChatMessageProperies](https://create.roblox.com/docs/reference/engine/classes/TextChatMessageProperies). To create a new `ChatWindowMessageProperties` instance, use [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#DeriveNewMessageProperties|ChatWindowConfiguration:DeriveNewMessageProperties()]] which will have the current properties from [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]].

```lua
local TextChatService = game:GetService("TextChatService")

local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")

TextChatService.OnChatWindowAdded = function(message: TextChatMessage)
  -- Derive chat message properties
  local properties = ChatWindowConfiguration:DeriveNewMessageProperties()

  -- Change color of message within the chat window
  properties.TextColor3 = Color3.fromRGB(255, 121, 121)

  return properties
end
```

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] | Font used to render text in the chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties#PrefixTextProperties\|PrefixTextProperties]] | [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties\|ChatWindowMessageProperties]] | Determines the properties of the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#PrefixText\|PrefixText]] preceding the chat message. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties#TextColor3\|TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Color of the text in the chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties#TextSize\|TextSize]] | int | Size of the text in the chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties#TextStrokeColor3\|TextStrokeColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Stroke color applied to text in the chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties#TextStrokeTransparency\|TextStrokeTransparency]] | double | Transparency of the stroke applied to text in the chat window. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties|TextChatMessageProperties]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### FontFace

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Chat

Determines the font used to render text in the chat window. Default is [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font.BuilderSansMedium]].

### PrefixTextProperties

**Type:** [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties|ChatWindowMessageProperties]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Chat

Determines the properties of the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#PrefixText|TextChatMessage.PrefixText]] preceding the chat message.

### TextColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Chat

Determines the color of the text in the chat window. Default value is `Datatype.Color3.fromRGB(255, 255, 255)` (white).

### TextSize

**Type:** int

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Chat

Determines the size of the text in the chat window.

### TextStrokeColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Chat

Determines the stroke color applied to text in the chat window. Default value is `Datatype.Color3.fromRGB(0, 0, 0)` (black).

### TextStrokeTransparency

**Type:** double

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Chat

Determines the transparency of the stroke applied to text in the chat window. Default value is `0.5`.

---
*Source: [ChatWindowMessageProperties](https://create.roblox.com/docs/reference/engine/classes/ChatWindowMessageProperties) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
