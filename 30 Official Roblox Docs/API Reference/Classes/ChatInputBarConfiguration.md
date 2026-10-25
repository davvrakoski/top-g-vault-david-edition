---
title: "ChatInputBarConfiguration"
description: "Configures properties of the default chat input bar."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ChatInputBarConfiguration"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Configures properties of the default chat input bar.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/TextChatConfigurations|TextChatConfigurations]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

Configures properties of the default text chat input bar. It is parented to [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].

#### Chat UI composition

The default chat UI is composed of two separate elements: the **chat window** (message list) configured by [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]], and the **chat input bar** configured by this object. Each element reports its own `AbsoluteSize` and `AbsolutePosition` independently. To determine the total screen bounds of the entire chat UI, combine values from both configurations by computing the union of the two rectangles.

*Code samples for this API (`ChatWindowConfiguration-Get-Total-Chat-Bounds`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ChatInputBarConfiguration); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#AbsolutePosition\|AbsolutePosition]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Actual screen position of the default chat input bar in pixels. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#AbsoluteSize\|AbsoluteSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Actual screen size of the default chat input bar in pixels. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#AutocompleteEnabled\|AutocompleteEnabled]] | boolean | Whether to enable autocomplete for the chat input bar. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#BackgroundColor3\|BackgroundColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Background color of the default chat input bar. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#BackgroundTransparency\|BackgroundTransparency]] | double | Background transparency of the default chat input bar. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#Enabled\|Enabled]] | boolean | Whether to show the default chat input bar. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] | Font used to render text in the default chat input bar. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#IsFocused\|IsFocused]] | boolean | Whether the default chat input bar is focused or not. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#KeyboardKeyCode\|KeyboardKeyCode]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|KeyCode]] | Additional key users can press to trigger focusing on the default chat input bar. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#PlaceholderColor3\|PlaceholderColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Color of the text of the placeholder text in the default chat input bar. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#TargetTextChannel\|TargetTextChannel]] | [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]] | A reference to the target [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#TextBox\|TextBox]] | [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]] | Reference to a designated [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]] instance that sends messages on behalf of the user. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#TextColor3\|TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Color of the text in default chat input bar. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#TextSize\|TextSize]] | int64 | Size of the text in default chat input bar. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#TextStrokeColor3\|TextStrokeColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Color of the text stroke for text in default chat input bar. |
| [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#TextStrokeTransparency\|TextStrokeTransparency]] | double | Transparency of the text stroke for text in default chat input bar. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/TextChatConfigurations|TextChatConfigurations]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AbsolutePosition

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** Unsafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat · **Tags:** `ReadOnly`, `NotReplicated`

Read-only property that provides the screen position of the default chat input bar in pixels. Behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsolutePosition|GuiBase2d.AbsolutePosition]].

This value represents only the input bar portion of the chat UI, not the entire chat interface. To get the total bounds including the message list, see [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#AbsolutePosition|ChatWindowConfiguration.AbsolutePosition]] and combine both regions.

### AbsoluteSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** Unsafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat · **Tags:** `ReadOnly`, `NotReplicated`

Read-only property that provides the screen size of the default chat input bar in pixels. Behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|GuiBase2d.AbsoluteSize]].

This value represents only the input bar portion of the chat UI, not the entire chat interface. To get the total bounds including the message list, see [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#AbsoluteSize|ChatWindowConfiguration.AbsoluteSize]] and combine both regions.

### AutocompleteEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Whether to enable autocomplete for the chat input bar. Set to `false` to disable autocomplete.

### BackgroundColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Background color of the default chat input bar. Default value is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(25, 27, 29)]].

### BackgroundTransparency

**Type:** double

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Background transparency of the default chat input bar as a number between `0` and `1`. This value is multiplied with the user's [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTransparency|GuiService.PreferredTransparency]] to create the effective background transparency used by the chat input bar, which may be more opaque than this value set here. Default value is `0.2`.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Whether to show the default chat input bar. Set to `false` to hide.

### FontFace

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Font used to render text in the default chat input bar. Default is [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font.BuilderSansMedium]]. Does not apply to [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]] instances.

### IsFocused

**Type:** boolean

**Thread safety:** Unsafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat · **Tags:** `ReadOnly`, `NotReplicated`

Indicates whether the default chat input bar is focused or not. Useful for firing property changed events so you can implement callback functions that respond to changes in the input bar's focus state.

*Code samples for this member (`ChatInputBarConfiguration-Typing-Indicator`) are published on the source page; their code is not part of the open-source repo.*

### KeyboardKeyCode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/KeyCode|KeyCode]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Additional key users can press to trigger focusing on the default chat input bar. Useful when you want to have an extra hotkey for focusing in addition to the <kbd>/</kbd> key.

### PlaceholderColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Color of the text of the placeholder text in the default chat input bar. Default value is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(178, 178, 178)]].

### TargetTextChannel

**Type:** [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Chat

Determines which [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] to use when the user sends a message with the default chat input bar.

### TextBox

**Type:** [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat

Reference to a designated [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] instance that sends messages on behalf of the user. You can use it to further integrate your custom chat input bar UI into your experience by freely manipulating appearance, location, and layout. When opting to set this property to a custom [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]], you don't need to write any code for the following behavior:

- When a user types a message and presses [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode.Return]], the message will be sent to [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#TargetTextChannel|ChatInputBarConfiguration.TargetTextChannel]].
- When a message is sent, [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text|TextBox.Text]] will automatically clear.

For security, some limitations are imposed on the [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] when it is promoted to [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#TextBox|ChatInputBarConfiguration.TextBox]]. Luau code will not be able to:

- Change the [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text|TextBox.Text]] property.
- Use the [[30 Official Roblox Docs/API Reference/Classes/TextBox#CaptureFocus|TextBox:CaptureFocus()]] or [[30 Official Roblox Docs/API Reference/Classes/TextBox#ReleaseFocus|TextBox:ReleaseFocus()]] methods.

### TextColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Color of the text in default chat input bar. Default value is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(255, 255, 255)]].

### TextSize

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Size of the text in default chat input bar. Default value is `14`.

### TextStrokeColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Color of the text stroke for text in default chat input bar. Default value is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(0, 0, 0)]].

### TextStrokeTransparency

**Type:** double

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Transparency of the text stroke for text in default chat input bar. Default value is `0.5`.

---
*Source: [ChatInputBarConfiguration](https://create.roblox.com/docs/reference/engine/classes/ChatInputBarConfiguration) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
