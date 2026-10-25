---
title: "ScreenGui"
description: "Primary container of on-screen 2D user interface elements."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ScreenGui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Primary container of on-screen 2D user interface elements.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/GuiMain|GuiMain]]
- **Memory category:** Instances

## Description

[[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] is a storage container for 2D [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] displayed on the user's screen. A [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] only shows if parented to a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]]; parenting a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] to [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] ensures it clones into each player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] when they join the experience and their character first spawns. See [[30 Official Roblox Docs/UI/On-screen UI containers|On‑Screen UI Containers]] for further details.

*(image in the full Top G Vault)*

For performance improvements, the appearance of a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] is cached until one of the following events occurs:

- A descendant is added to or removed from it.
- A property of a descendant changes.
- A property of the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] itself changes.

If any of these events occur, the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] appearance is recomputed on the next frame it gets rendered.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ClipToDeviceSafeArea\|ClipToDeviceSafeArea]] | boolean | Whether to clip the contents of this [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGui]] to the device's safe area. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#DisplayOrder\|DisplayOrder]] | int | Controls the Z-index order in which multiple [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGui]] containers are drawn. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#IgnoreGuiInset\|IgnoreGuiInset]] | boolean | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGui]] overflows into the range of Roblox's core UI elements. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#SafeAreaCompatibility\|SafeAreaCompatibility]] | [[30 Official Roblox Docs/API Reference/Enums/SafeAreaCompatibility\|SafeAreaCompatibility]] | Specifies whether automatic UI compatibility transformations are applied to descendant "fullscreen" [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]] on displays with screen cutouts. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ScreenInsets\|ScreenInsets]] | [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets\|ScreenInsets]] | Controls the safe area insets that are applied to the contents of the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGui]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ClipToDeviceSafeArea

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

If this property is `true`, all [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] descendants of the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] will be clipped to the device's safe area (see [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|Enum.ScreenInsets]]). The default is `true` to maintain backwards compatibility of UI that is intentionally hidden offscreen, such as objects that slide into view from a screen edge when they're needed.

*(image in the full Top G Vault)*

If this property is `false`, [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] descendants will **not** be clipped to the device's safe area and may be obscured by the camera notch or other screen cutouts.

*(image in the full Top G Vault)*

Note that this property will be ignored if you set [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ScreenInsets|ScreenInsets]] to [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|None]], as doing so implies that you intentionally want to disregard the device's safe insets.

### DisplayOrder

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property controls the Z-index order in which multiple [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] containers are drawn. Those with a higher [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#DisplayOrder|DisplayOrder]] will be drawn on top of those with a lower value.

### IgnoreGuiInset

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `NotReplicated`

If this property is `false` (default), [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ScreenInsets|ScreenInsets]] is set to [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|CoreUISafeInsets]], effectively keeping its bounds below the Roblox top bar core UI.

If this property is changed to `true` and [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ScreenInsets|ScreenInsets]] is currently set to [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|CoreUISafeInsets]], [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ScreenInsets|ScreenInsets]] will be set to [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|DeviceSafeInsets]].

See [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ScreenInsets|ScreenInsets]] for details on how screen insets affect the contents of a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].

### SafeAreaCompatibility

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SafeAreaCompatibility|SafeAreaCompatibility]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property specifies whether automatic UI compatibility transformations are applied to descendant "fullscreen" [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] of the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] on displays with screen cutouts. Eligibility occurs if the total area of the descendant [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] (including any applied border or [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]]) covers the device's safe area both horizontally and vertically. See the [[30 Official Roblox Docs/API Reference/Enums/SafeAreaCompatibility|Enum.SafeAreaCompatibility]] enum reference for details.

The default value is [[30 Official Roblox Docs/API Reference/Enums/SafeAreaCompatibility|FullscreenExtension]] in order to automatically improve the appearance of UI that was authored for screens without any cutouts. However, it's recommended that you avoid fullscreen extensions for new work; instead, use the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ScreenInsets|ScreenInsets]] property to specify which insets should be respected for different [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] containers.

Note that descendant UI objects will continue to be clipped by the device's safe area if [[30 Official Roblox Docs/API Reference/Classes/ScreenGui#ClipToDeviceSafeArea|ClipToDeviceSafeArea]] is set to `true`.

### ScreenInsets

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|ScreenInsets]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

This property controls the safe area insets that are applied to the contents of the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]].

The default of [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|CoreUISafeInsets]] keeps all descendant [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] inside the core UI safe area, clear of the Roblox top bar buttons and other screen cutouts like the device's camera notch.

*(image in the full Top G Vault)*

If you set this property to [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|None]], UI objects may be obscured behind core UI objects or device cutouts like the camera notch. As a result, you should only use [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|None]] for a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] that contains noninteractive content like background images.

See [[30 Official Roblox Docs/UI/On-screen UI containers#Screen insets|On-Screen UI Containers]] for alternative examples.

---
*Source: [ScreenGui](https://create.roblox.com/docs/reference/engine/classes/ScreenGui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
