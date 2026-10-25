---
title: "ScreenshotHud"
description: "A 2D user interface that allows users to capture and save screenshots to their local device."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ScreenshotHud"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A 2D user interface that allows users to capture and save screenshots to their local device.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

The [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud|ScreenshotHud]] is a 2D user interface that allows users to capture and save screenshots to their local device. It consists of the following UI elements:

- An overlay containing the experience name and Roblox branding. These remain on screen when a screenshot is taken, although the experience name can be disabled through the [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#ExperienceNameOverlayEnabled|ScreenshotHud.ExperienceNameOverlayEnabled]] property.
- A camera button that hides all UI except for the overlay and takes a screenshot.
- A close button that closes the [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud|ScreenshotHud]].

*(image in the full Top G Vault)*

*Code samples for this API (`ScreenshotHud`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ScreenshotHud); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#CameraButtonIcon\|CameraButtonIcon]] | ContentId | Asset ID of the icon used for the camera button. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#CameraButtonIconContent\|CameraButtonIconContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image content used as the icon for the camera button. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#CameraButtonPosition\|CameraButtonPosition]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Screen location of the camera button. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#CloseButtonPosition\|CloseButtonPosition]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Screen location of the close button. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#CloseWhenScreenshotTaken\|CloseWhenScreenshotTaken]] | boolean | Whether the [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud\|ScreenshotHud]] closes automatically when a screenshot is taken. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#ExperienceNameOverlayEnabled\|ExperienceNameOverlayEnabled]] | boolean | **Deprecated.** Whether the experience name in the overlay is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#HideCoreGuiForCaptures\|HideCoreGuiForCaptures]] | boolean | Whether Roblox's core GUI is hidden while a screenshot is captured. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#HidePlayerGuiForCaptures\|HidePlayerGuiForCaptures]] | boolean | Whether the local player's GUI is hidden while a screenshot is captured. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#OverlayFont\|OverlayFont]] | [[30 Official Roblox Docs/API Reference/Enums/Font\|Enum.Font]] | **Deprecated.** [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] used for the experience name in the overlay. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#UsernameOverlayEnabled\|UsernameOverlayEnabled]] | boolean | **Deprecated.** Has no effect. |
| [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#Visible\|Visible]] | boolean | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud\|ScreenshotHud]] is visible. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CameraButtonIcon

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Asset ID of the icon used for the camera button.

### CameraButtonIconContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

The image [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] used as the icon for the camera button on the [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud|ScreenshotHud]]. This is the [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]-type equivalent of the legacy [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#CameraButtonIcon|ScreenshotHud.CameraButtonIcon]] property and supports asset URIs. When set, the camera button displays the specified image instead of the default icon.

### CameraButtonPosition

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Screen location of the camera button.

### CloseButtonPosition

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

Screen location of the close button.

### CloseWhenScreenshotTaken

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines whether the [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud|ScreenshotHud]] closes automatically when a screenshot is taken.

### ExperienceNameOverlayEnabled

> [!warning] Deprecated
> This property is deprecated. Do not use it for new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI · **Tags:** `Hidden`, `Deprecated`

Determines whether the experience name in the overlay is enabled.

### HideCoreGuiForCaptures

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines whether Roblox's core GUI is hidden while a screenshot is captured through the [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud|ScreenshotHud]]. Defaults to `true`, so any enabled [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType|Enum.CoreGuiType]] elements are hidden for the duration of the capture and restored afterward. A saved capture is only flagged as GUI-free when both this property and [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#HidePlayerGuiForCaptures|ScreenshotHud.HidePlayerGuiForCaptures]] are enabled.

### HidePlayerGuiForCaptures

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines whether the local player's GUI is hidden while a screenshot is captured through the [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud|ScreenshotHud]]. Defaults to `true`, so any enabled [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] instances under the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]]'s [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] are hidden for the duration of the capture and restored afterward. A saved capture is only flagged as GUI-free when both this property and [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud#HideCoreGuiForCaptures|ScreenshotHud.HideCoreGuiForCaptures]] are enabled.

### OverlayFont

> [!warning] Deprecated
> This property is deprecated. Do not use it for new work.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI · **Tags:** `Hidden`, `Deprecated`

The [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]] used for the experience name in the overlay.

### UsernameOverlayEnabled

> [!warning] Deprecated
> This property is deprecated. Do not use it for new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI · **Tags:** `Hidden`, `Deprecated`

Currently has no effect.

### Visible

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines whether the [[30 Official Roblox Docs/API Reference/Classes/ScreenshotHud|ScreenshotHud]] is visible.

---
*Source: [ScreenshotHud](https://create.roblox.com/docs/reference/engine/classes/ScreenshotHud) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
