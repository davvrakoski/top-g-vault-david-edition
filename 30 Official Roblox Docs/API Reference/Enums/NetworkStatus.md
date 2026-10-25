---
title: "NetworkStatus"
description: "Describes the device's current network reachability state as reported by `ConnectivityService`."
api_type: enum
aliases: ["Enum.NetworkStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/NetworkStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the device's current network reachability state as reported by `ConnectivityService`.*

## Description

Describes the device's current network reachability state as tracked by `ConnectivityService`. The engine's connectivity subsystem monitors platform-level network availability and updates the `NetworkStatus` property with one of these values whenever the state changes.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unknown` | 0 | The network connection state has not yet been determined or is unavailable on the current platform. |
| `Connected` | 1 | The device has an active network connection. |
| `Disconnected` | 2 | The device does not currently have a network connection. |

---
*Source: [NetworkStatus](https://create.roblox.com/docs/reference/engine/enums/NetworkStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
