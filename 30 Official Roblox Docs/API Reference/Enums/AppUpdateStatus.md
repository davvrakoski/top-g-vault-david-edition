---
title: "AppUpdateStatus"
description: "Indicates the result of an application update check performed by `AppUpdateService`."
api_type: enum
aliases: ["Enum.AppUpdateStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AppUpdateStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the result of an application update check performed by `AppUpdateService`.*

## Description

Indicates the result of an application update check performed by `CheckForUpdate()`. The returned status tells the Lua app layer whether an update is available, what kind of channel assignment produced it, or whether the check was unsupported or failed.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unknown` | 0 | The default state before any update check has been performed. |
| `NotSupported` | 1 | The platform does not support application updates. |
| `Failed` | 2 | The update check failed due to an error such as a network failure or missing initialization. |
| `NotAvailable` | 3 | No update is currently required; the client is already running the latest version for its channel. |
| `Available` | 4 | An update is available through a public channel or production deployment. |
| `AvailableBoundChannel` | 5 | An update is available because the user is explicitly bound to a private or public channel. |
| `AvailableBetaProgram` | 6 | An update is available because the user opted into a beta program backed by a channel. |

---
*Source: [AppUpdateStatus](https://create.roblox.com/docs/reference/engine/enums/AppUpdateStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
