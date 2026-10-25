---
title: "PackagePermission"
description: "Indicates the current user's or group roleset's permission to the package."
api_type: enum
aliases: ["Enum.PackagePermission"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PackagePermission"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the current user's or group roleset's permission to the package.*

## Description

The [[30 Official Roblox Docs/API Reference/Enums/PackagePermission|Enum.PackagePermission]] indicates the current user's or group roleset's permission to the package.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | Permission data is not available for the current user or group roleset. |
| `NoAccess` | 1 | The current user or group roleset doesn't have access. |
| `Revoked` | 2 | The current user's or group roleset's permission is revoked. |
| `UseView` | 3 | The current user or group roleset can download a copy of the package from Roblox. |
| `Edit` | 4 | The current user or group roleset can download a copy of the package from Roblox and publish package changes to Roblox. |
| `Own` | 5 | The current user or group roleset can download a copy of the page from Roblox, publish package changes to Roblox, and manage who has access to the package. |

---
*Source: [PackagePermission](https://create.roblox.com/docs/reference/engine/enums/PackagePermission) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
