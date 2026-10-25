---
title: "BubbleChatConfiguration"
description: "Allows for customization of text chat bubbles through `TextChatService`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BubbleChatConfiguration"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Allows for customization of text chat bubbles through [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/TextChatConfigurations|TextChatConfigurations]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

Allows for customization of text chat bubbles through [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]]. See [[30 Official Roblox Docs/Chat/Customize bubble chat|Bubble Chat]] for implementation details.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#AdorneeName\|AdorneeName]] | string | Body part or [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] that bubbles will attach to. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#BackgroundColor3\|BackgroundColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Background color of bubbles. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#BackgroundTransparency\|BackgroundTransparency]] | double | Determines the background transparency of the default bubble chat as a number between 0 and 1. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#BubbleDuration\|BubbleDuration]] | float | Time before a bubble fades out, in seconds. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#BubblesSpacing\|BubblesSpacing]] | float | Vertical space between stacked bubbles, in pixels. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#Enabled\|Enabled]] | boolean | Whether text chat bubbles are enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#Font\|Font]] | [[30 Official Roblox Docs/API Reference/Enums/Font\|Enum.Font]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] of the bubble text. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] of the bubble text. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#LocalPlayerStudsOffset\|LocalPlayerStudsOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Offset of bubbles from their adornee, in studs. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#MaxBubbles\|MaxBubbles]] | float | Maximum number of text chat bubbles shown per user. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#MaxDistance\|MaxDistance]] | float | Maximum distance from the camera that bubbles are shown. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#MinimizeDistance\|MinimizeDistance]] | float | Distance from the camera when bubbles turn into a single bubble with an ellipsis to indicate chatter. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#TailVisible\|TailVisible]] | boolean | Determines if the tail at the bottom of the text chat bubbles is visible. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#TextColor3\|TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Color of bubble text. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#TextSize\|TextSize]] | int64 | Size of bubble text. |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#VerticalStudsOffset\|VerticalStudsOffset]] | float | Extra space between bubbles and their adornee, in studs. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/TextChatConfigurations|TextChatConfigurations]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AdorneeName

**Type:** string

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

String name of the body part or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] that bubbles attach to; if multiple instances of the same name exist, the system attaches to the first instance found. Default is `"HumanoidRootPart"`.

### BackgroundColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

[[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] background color of bubbles. Default is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.fromRGB(250, 250, 250)]].

### BackgroundTransparency

**Type:** double

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Determines the background transparency of the default bubble chat as a number between 0 and 1. This value is multiplied with the user's [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTransparency|GuiService.PreferredTransparency]] to create the effective background transparency used by the bubble chat, which may be more opaque than this value set here. Default value is 0.1.

### BubbleDuration

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Time before a bubble fades out, in seconds. Default is `30`.

### BubblesSpacing

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Vertical space between stacked bubbles, in pixels. Default is `6`.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Whether text chat bubbles are enabled. Default is `false`.

### Font

**Type:** [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat · **Tags:** `Hidden`

[[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]] of the bubble text. Default is [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font.GothamMedium]].

### FontFace

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

[[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]] of the bubble text. Similar to [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#Font|BubbleChatConfiguration.Font]] but allows setting fonts that don't exist in [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]].

### LocalPlayerStudsOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

If adorned to the local player, [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] offset of bubbles from their adornee, in studs, relative to the camera orientation.

### MaxBubbles

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Maximum number of text chat bubbles shown per user. If the number of bubbles exceeds this maximum, the system removes bubbles from the oldest one. Default is `3`.

### MaxDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Maximum distance from the camera that bubbles are shown. Default is `100`.

### MinimizeDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Distance from the camera when bubbles turn into a single bubble with an ellipsis (**⋯**) to indicate chatter.

### TailVisible

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Determines if the tail at the bottom of the text chat bubbles is visible. Default is `True`.

### TextColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

[[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] color of bubble text. Default is [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3.fromRGB(57, 59, 61)]].

### TextSize

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Chat

Size of bubble text. Default is `16`.

### VerticalStudsOffset

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

Extra space between bubbles and their adornee, in studs. Default is `0`.

---
*Source: [BubbleChatConfiguration](https://create.roblox.com/docs/reference/engine/classes/BubbleChatConfiguration) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
