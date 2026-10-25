---
title: "SafeAreaCompatibility"
description: "Describes how descendants of a `ScreenGui` adapt to screens with cutouts."
api_type: enum
aliases: ["Enum.SafeAreaCompatibility"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SafeAreaCompatibility"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes how descendants of a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] adapt to screens with cutouts.*

## Description

This enum describes the automatic compatibility transformations that apply to descendant "fullscreen" [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] of a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] on displays with screen cutouts.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | Do not apply compatibility transformations to any descendants of the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGui]]. |
| `FullscreenExtension` | 1 | If the total area of any descendant [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] within the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGui]] (including any applied border or [[30 Official Roblox Docs/API Reference/Classes/UIStroke\|UIStroke]]) covers the device's safe area both horizontally and vertically, its background area will be expanded to cover the fullscreen area. This expansion does **not** affect the size or position of the descendant's **content**, except in the case of [[30 Official Roblox Docs/API Reference/Classes/ImageLabel\|ImageLabel]], [[30 Official Roblox Docs/API Reference/Classes/ImageButton\|ImageButton]], or [[30 Official Roblox Docs/API Reference/Classes/VideoFrame\|VideoFrame]] where the image/video is considered part of the background and will be expanded to fullscreen.<br><br>Note that this option is intended to automatically improve the appearance of UI that was authored for screens without any cutouts. However, it's recommended that you avoid fullscreen extensions for new work; instead, use the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ScreenInsets\|ScreenInsets]] property to specify which insets should be respected for different [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGuis]]. |

---
*Source: [SafeAreaCompatibility](https://create.roblox.com/docs/reference/engine/enums/SafeAreaCompatibility) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
