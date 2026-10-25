---
title: "DeviceSimulatorScalingMode"
description: "Controls how the Device Simulator viewport scales the simulated device resolution within the Studio window."
api_type: enum
aliases: ["Enum.DeviceSimulatorScalingMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DeviceSimulatorScalingMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how the Device Simulator viewport scales the simulated device resolution within the Studio window.*

## Description

Controls how the Device Simulator viewport scales the simulated device resolution within the Studio window. The active mode is read and written via [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#GetScalingModeAsync|StudioDeviceSimulatorService:GetScalingModeAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#SetScalingModeAsync|StudioDeviceSimulatorService:SetScalingModeAsync()]]. The default mode is [[30 Official Roblox Docs/API Reference/Enums/DeviceSimulatorScalingMode|Enum.DeviceSimulatorScalingMode.ScaleToPhysicalSize]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `ScaleToPhysicalSize` | 0 | Scales the simulated viewport so that its pixels correspond to their physical size on the developer's monitor, computed from the screen DPI and an optional target DPI override. |
| `ActualResolution` | 1 | Renders the simulated viewport at a 1:1 pixel mapping with no scaling applied. |
| `FitToWindow` | 2 | Scales the simulated viewport uniformly to fill as much of the available Studio window as possible while preserving the device's aspect ratio. |

---
*Source: [DeviceSimulatorScalingMode](https://create.roblox.com/docs/reference/engine/enums/DeviceSimulatorScalingMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
