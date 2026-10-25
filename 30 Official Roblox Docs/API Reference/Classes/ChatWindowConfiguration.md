---
title: "ChatWindowConfiguration"
description: "Configures properties of the default chat window."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ChatWindowConfiguration"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Configures properties of the default chat window.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/TextChatConfigurations|TextChatConfigurations]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

Configures properties of the default text chat window. It is parented to [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].

#### Chat UI composition

The default chat UI is composed of two separate elements: the **chat window** (message list) configured by this object, and the **chat input bar** configured by [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration|ChatInputBarConfiguration]]. Each element reports its own `AbsoluteSize` and `AbsolutePosition` independently. To determine the total screen bounds of the entire chat UI, combine values from both configurations by computing the union of the two rectangles.

*Code samples for this API (`ChatWindowConfiguration-Get-Total-Chat-Bounds`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ChatWindowConfiguration); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#AbsolutePosition\|AbsolutePosition]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Actual screen position of the default chat window, in pixels. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#AbsoluteSize\|AbsoluteSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Actual screen size of the default chat window, in pixels. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#BackgroundColor3\|BackgroundColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Background color of the default chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#BackgroundTransparency\|BackgroundTransparency]] | double | Background transparency of the default chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#Enabled\|Enabled]] | boolean | Whether to show the default chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] | Font used to render text in the default chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#HeightScale\|HeightScale]] | float | Factor by which the height of the default chat window should be scaled. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#HorizontalAlignment\|HorizontalAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/HorizontalAlignment\|HorizontalAlignment]] | Horizontal alignment of the chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#TextColor3\|TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Color of the text in default chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#TextSize\|TextSize]] | int64 | Size of the text in default chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#TextStrokeColor3\|TextStrokeColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Color of the text stroke for text in default chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#TextStrokeTransparency\|TextStrokeTransparency]] | double | Transparency of the text stroke for text in default chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#VerticalAlignment\|VerticalAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/VerticalAlignment\|VerticalAlignment]] | Vertical alignment of the chat window. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#WidthScale\|WidthScale]] | float | Factor by which the width of the default chat window should be scaled. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#DeriveNewMessageProperties\|DeriveNewMessageProperties()]] | [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties\|ChatWindowMessageProperties]] | Creates a new [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties\|ChatWindowMessageProperties]] instance that can be used to customize the appearance of messages in the chat window. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/TextChatConfigurations|TextChatConfigurations]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AbsolutePosition

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** Unsafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat · **Tags:** `ReadOnly`, `NotReplicated`

Read-only property that provides the screen position of the default chat window (message list) in pixels. Behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsolutePosition|GuiBase2d.AbsolutePosition]].

This value represents only the message list portion of the chat UI, not the entire chat interface. To get the total bounds including the input bar, see [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#AbsolutePosition|ChatInputBarConfiguration.AbsolutePosition]] and combine both regions. See the code example in the class description above.

### AbsoluteSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** Unsafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat · **Tags:** `ReadOnly`, `NotReplicated`

Read-only property that provides the screen size of the default chat window (message list) in pixels. Behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|GuiBase2d.AbsoluteSize]].

This value represents only the message list portion of the chat UI, not the entire chat interface. To get the total bounds including the input bar, see [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#AbsoluteSize|ChatInputBarConfiguration.AbsoluteSize]] and combine both regions. See the code example in the class description above.

### BackgroundColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Background color of the default chat window. If the background color is not overridden, this value will respect the user's [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTransparency|GuiService.PreferredTransparency]] by making the menu more gray as the transparency of the menu decreases. Default value is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(25, 27, 29)]].

### BackgroundTransparency

**Type:** double

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Background transparency of the default chat window as a number between `0` and `1`. This value is multiplied with the user's [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTransparency|GuiService.PreferredTransparency]] to create the effective background transparency used by the chat window, which may be more opaque than this value set here. Default value is `0.3`.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Whether to show the default chat window. Set to `false` to hide.

### FontFace

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Font used to render text in the default chat window. Default is [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font.BuilderSansMedium]]. Does not apply to [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]].

### HeightScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Factor by which the height of the default chat window should be scaled. Must be a value between `0.5` and `2`. Defining a value outside of range clamps the actual value to the closest bound.

### HorizontalAlignment

**Type:** [[30 Official Roblox Docs/API Reference/Enums/HorizontalAlignment|HorizontalAlignment]]

**Thread safety:** Unsafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Chat

Horizontal alignment of the chat window. Behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#HorizontalAlignment|UIGridStyleLayout.HorizontalAlignment]]. Setting to [[30 Official Roblox Docs/API Reference/Enums/HorizontalAlignment|Left]] or [[30 Official Roblox Docs/API Reference/Enums/HorizontalAlignment|Right]] adding a small padding away from touching the corresponding horizontal edge of the screen. Setting to [[30 Official Roblox Docs/API Reference/Enums/HorizontalAlignment|Center]] aligns the window in the horizontal middle of the screen. Default value is [[30 Official Roblox Docs/API Reference/Enums/HorizontalAlignment|Left]].

### TextColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Color of the text in default chat window. Default value is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(255, 255, 255)]].

### TextSize

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Size of the text in default chat window. Default value is `14`.

### TextStrokeColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Color of the text stroke for text in default chat window. Default value is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(0, 0, 0)]].

### TextStrokeTransparency

**Type:** double

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Transparency of the text stroke for text in default chat window. Default value is `0.5`.

### VerticalAlignment

**Type:** [[30 Official Roblox Docs/API Reference/Enums/VerticalAlignment|VerticalAlignment]]

**Thread safety:** Unsafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Chat

Vertical alignment of the chat window. Behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/UIGridStyleLayout#VerticalAlignment|UIGridStyleLayout.VerticalAlignment]]. Setting to [[30 Official Roblox Docs/API Reference/Enums/VerticalAlignment|Top]] or [[30 Official Roblox Docs/API Reference/Enums/VerticalAlignment|Bottom]] adds a small padding away from touching the corresponding edge of the screen. Setting to [[30 Official Roblox Docs/API Reference/Enums/VerticalAlignment|Center]] aligns the window in the vertical middle of the screen. Default value is [[30 Official Roblox Docs/API Reference/Enums/VerticalAlignment|Top]].

### WidthScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Factor by which the width of the default chat window should be scaled. Must be a value between `0.5` and `2`. Defining a value outside of range clamps the actual value to the closest bound.

## Methods

### DeriveNewMessageProperties

```lua
ChatWindowConfiguration:DeriveNewMessageProperties(): ChatWindowMessageProperties
```

**Thread safety:** Unsafe · **Capabilities:** Chat

Creates a new [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties|ChatWindowMessageProperties]] instance that can be used to customize the appearance of messages in the chat window. [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties|ChatWindowMessageProperties]] inherits from [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties|TextChatMessageProperties]].

This is intended to be used during custom [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnChatWindowAdded|TextChatService.OnChatWindowAdded]] callbacks.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties\|ChatWindowMessageProperties]] | A new [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties\|ChatWindowMessageProperties]] instance whose values you can modify and return from a [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnChatWindowAdded\|TextChatService.OnChatWindowAdded]] callback to customize how individual messages appear in the chat window. |

*Code samples for this member (`TextChatService-User-Chat`, `ChatWindowConfiguration-DeriveNewMessageProperties`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [ChatWindowConfiguration](https://create.roblox.com/docs/reference/engine/classes/ChatWindowConfiguration) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
