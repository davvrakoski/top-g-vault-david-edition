---
title: "CommandPermission"
description: "Specifies the minimum security permission level required to invoke a Studio command."
api_type: enum
aliases: ["Enum.CommandPermission"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CommandPermission"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the minimum security permission level required to invoke a Studio command.*

## Description

Specifies the minimum security permission level a Lua execution context must hold to invoke a Studio command registered through the plugin command system. [[30 Official Roblox Docs/API Reference/Enums/CommandPermission|Enum.CommandPermission.Plugin]] is the standard permission for plugin scripts; [[30 Official Roblox Docs/API Reference/Enums/CommandPermission|Enum.CommandPermission.LocalUser]] is the higher-privilege level reserved for IDE-only APIs.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Plugin` | 0 | The command is accessible to scripts running at the standard Plugin security level. |
| `LocalUser` | 1 | The command requires the LocalUser security level, granting access to IDE-only APIs. |

---
*Source: [CommandPermission](https://create.roblox.com/docs/reference/engine/enums/CommandPermission) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
