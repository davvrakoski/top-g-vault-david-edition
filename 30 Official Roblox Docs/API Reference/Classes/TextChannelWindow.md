---
title: "TextChannelWindow"
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TextChannelWindow"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui
- **Tags:** `NotBrowsable`

## Description

[[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]] is a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] that renders in-experience text chat messages from a linked [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]]. Place it under a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] or other [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] descendant to display chat in a custom location and layout.

Set [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow#Target|Target]] to a [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] to choose which channel's messages the window shows. The window registers itself with [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] when added to the data model.

Properties set on [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]] do not apply to this window.

Accepted children: [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]], [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]], [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]], and scripts ([[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]]); other child types are rejected.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow#Target\|Target]] | [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]] |  |
| [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] | Font used to render text in this window. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow#UseDefaultFont\|UseDefaultFont]] | boolean | Whether this window uses the live platform default font. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Target

**Type:** [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Chat

A reference to the [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] whose messages this window renders. When set, the window shows messages from the specified channel. Setting this property to `nil` disconnects the window from any channel so it displays no messages.

The default value is `nil` (no channel linked).

### FontFace

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI, Chat

Font used to render this window's messages and its input bar. Applied only when [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow#UseDefaultFont|TextChannelWindow.UseDefaultFont]] is `false`.

*Code samples for this member (`TextChannelWindow-FontFace`) are published on the source page; their code is not part of the open-source repo.*

### UseDefaultFont

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI, Chat

When `true` (default), the window uses the live platform default font. When `false`, the window uses [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow#FontFace|FontFace]].

*Code samples for this member (`TextChannelWindow-FontFace`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [TextChannelWindow](https://create.roblox.com/docs/reference/engine/classes/TextChannelWindow) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
