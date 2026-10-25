---
title: "ChannelTabsConfiguration"
description: "Configures properties of the optional channel tabs in the default chat window."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ChannelTabsConfiguration"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Configures properties of the optional channel tabs in the default chat window.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/TextChatConfigurations|TextChatConfigurations]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

Configures properties of the optional channel tabs in the default chat window. It is parented to [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].

To learn more, see [[30 Official Roblox Docs/Chat/Customize the chat window|Customizing the Chat Window]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#AbsolutePosition\|AbsolutePosition]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Actual screen position of the channel tab bar, in pixels. |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#AbsoluteSize\|AbsoluteSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Actual screen size of the channel tab bar, in pixels. |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#BackgroundColor3\|BackgroundColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Background color of the channel tabs. |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#BackgroundTransparency\|BackgroundTransparency]] | double | Background transparency of the channel tabs. |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#Enabled\|Enabled]] | boolean | Whether to show the channel tabs. |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] | Font used to render text in the channel tabs. |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#HoverBackgroundColor3\|HoverBackgroundColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Background color of a channel tab when hovering over it. |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#SelectedTabTextColor3\|SelectedTabTextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Color of text in a selected tab. |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#TextColor3\|TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Color of text in an unselected tab. |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#TextSize\|TextSize]] | int64 | Size of the text in channel tabs. |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#TextStrokeColor3\|TextStrokeColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Color of the text stroke for text in channel tabs. |
| [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration#TextStrokeTransparency\|TextStrokeTransparency]] | double | Transparency of the text stroke for text in channel tabs. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/TextChatConfigurations|TextChatConfigurations]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AbsolutePosition

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat · **Tags:** `ReadOnly`, `NotReplicated`

Read-only property that provides the screen position of the channel tab bar in pixels. Behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsolutePosition|GuiBase2d.AbsolutePosition]].

### AbsoluteSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat · **Tags:** `ReadOnly`, `NotReplicated`

Read-only property that provides the screen size of the channel tab bar in pixels. Behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|GuiBase2d.AbsoluteSize]].

### BackgroundColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Background color of the channel tabs. If the background color is not overridden, this value will respect the user's [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTransparency|GuiService.PreferredTransparency]] by making the menu more gray as the transparency of the menu decreases. Default value is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(25, 27, 29)]].

### BackgroundTransparency

**Type:** double

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Background transparency of the channel tabs as a number between `0` and `1`. This value is multiplied with the user's [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTransparency|GuiService.PreferredTransparency]] to create the effective background transparency used by the channel tabs, which may be more opaque than this value set here. Default value is `0`.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Whether to show the channel tabs. Set to `false` to hide.

### FontFace

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Font used to render text in the channel tabs. Default is [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font.BuilderSansBold]].

### HoverBackgroundColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Background color of a channel tab when hovering over it. Default value is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(125, 125, 125)]].

### SelectedTabTextColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Color of text in a selected tab. Default value is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(255, 255, 255)]].

### TextColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Color of text in an unselected tab. Default value is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(175, 175, 175)]].

### TextSize

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Size of the text in channel tabs. Default value is `14`.

### TextStrokeColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Color of the text stroke for text in channel tabs. Default value is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.new(0, 0, 0)]].

### TextStrokeTransparency

**Type:** double

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Transparency of the text stroke for text in channel tabs. Default value is `1`.

---
*Source: [ChannelTabsConfiguration](https://create.roblox.com/docs/reference/engine/classes/ChannelTabsConfiguration) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
