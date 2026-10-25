---
title: "ServiceVisibility"
description: "Controls when a service is displayed in the Explorer window in Roblox Studio."
api_type: enum
aliases: ["Enum.ServiceVisibility"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ServiceVisibility"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls when a service is displayed in the Explorer window in Roblox Studio.*

## Description

Controls when a service is displayed in the Explorer panel in Roblox Studio. This enum is used by the `ServiceVisibility` property on [[30 Official Roblox Docs/API Reference/Classes/ReflectionMetadataClass|ReflectionMetadataClass]], which defines the default explorer visibility for a service class. It does not affect whether the service is accessible via [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#GetService|GetService()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Always` | 0 | The service is always visible in the Explorer window. |
| `Off` | 1 | The service is hidden from the Explorer window by default, but can still be added via the Insert Service menu. |
| `WithChildren` | 2 | The service is visible in the Explorer window only when it has children; it can still be added via the Insert Service menu. |

---
*Source: [ServiceVisibility](https://create.roblox.com/docs/reference/engine/enums/ServiceVisibility) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
