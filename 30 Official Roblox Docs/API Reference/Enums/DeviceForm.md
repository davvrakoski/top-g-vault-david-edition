---
title: "DeviceForm"
description: "Describes the physical form factor of a device used during Studio device emulation."
api_type: enum
aliases: ["Enum.DeviceForm"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DeviceForm"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the physical form factor of a device used during Studio device emulation.*

## Description

Studio-only device form factor for device emulation. Passed as the `DeviceForm` field of the device info table accepted by [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#CreateDeviceAsync|StudioDeviceSimulatorService:CreateDeviceAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#UpdateDeviceAsync|StudioDeviceSimulatorService:UpdateDeviceAsync()]], and exposed on device records returned by [[30 Official Roblox Docs/API Reference/Classes/StudioDeviceSimulatorService#GetDeviceListAsync|StudioDeviceSimulatorService:GetDeviceListAsync()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Console` | 0 | Represents a gaming console device, such as an Xbox or PlayStation. |
| `Phone` | 1 | Represents a mobile phone with a touchscreen. |
| `Tablet` | 2 | Represents a tablet with a touchscreen. |
| `Desktop` | 3 | Represents a desktop or laptop computer. |
| `VR` | 4 | Represents a virtual reality headset. |

---
*Source: [DeviceForm](https://create.roblox.com/docs/reference/engine/enums/DeviceForm) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
