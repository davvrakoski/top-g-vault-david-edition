---
title: "NetworkOwnership"
description: "Defines how simulation authority is determined for the Network Ownership Unit/Mechanism this part is attached to."
api_type: enum
aliases: ["Enum.NetworkOwnership"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/NetworkOwnership"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Defines how simulation authority is determined for the Network Ownership Unit/Mechanism this part is attached to.*

## Description

Defines how to determine which client has ownership of a part for a server (network).

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Automatic` | 0 | Network ownership is determined automatically by the server. |
| `Manual` | 1 | Network ownership is set manually by the developer. |
| `OnContact` | 2 | The first player to touch a part is given ownership of that part for the server (network). Ownership will not change if another player touches that part unless network ownership has been released by the owner. |

---
*Source: [NetworkOwnership](https://create.roblox.com/docs/reference/engine/enums/NetworkOwnership) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
