---
title: "AppLifecycleManagerState"
description: "Describes the current lifecycle state of the Roblox application as reported by `AppLifecycleObserverService:GetCurrentState()`."
api_type: enum
aliases: ["Enum.AppLifecycleManagerState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AppLifecycleManagerState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the current lifecycle state of the Roblox application as reported by `AppLifecycleObserverService:GetCurrentState()`.*

## Description

Reports the application lifecycle state returned by `AppLifecycleObserverService:GetCurrentState()` and related events. Transitions follow [[30 Official Roblox Docs/API Reference/Enums/AppLifecycleManagerState|Enum.AppLifecycleManagerState.Detached]] → [[30 Official Roblox Docs/API Reference/Enums/AppLifecycleManagerState|Enum.AppLifecycleManagerState.Active]] → [[30 Official Roblox Docs/API Reference/Enums/AppLifecycleManagerState|Enum.AppLifecycleManagerState.Inactive]] → [[30 Official Roblox Docs/API Reference/Enums/AppLifecycleManagerState|Enum.AppLifecycleManagerState.Hidden]] → [[30 Official Roblox Docs/API Reference/Enums/AppLifecycleManagerState|Enum.AppLifecycleManagerState.Detached]]; intermediate states are traversed automatically when the application jumps between non-adjacent states.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Detached` | 0 | The application has not yet started or is shutting down. This is the initial state before the lifecycle manager is created and the final state entered during application termination. |
| `Active` | 1 | The application is in the foreground and has input focus. This is the normal running state where the user is actively interacting with the experience. |
| `Inactive` | 2 | The application is visible but does not have input focus. On iOS this occurs during transitions such as incoming calls or notification center pull-down; on macOS it corresponds to the application resigning active status. |
| `Hidden` | 3 | The application is fully in the background and not visible to the user. On mobile platforms this corresponds to the app being backgrounded; on desktop it corresponds to the window being minimized or fully occluded. |

---
*Source: [AppLifecycleManagerState](https://create.roblox.com/docs/reference/engine/enums/AppLifecycleManagerState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
