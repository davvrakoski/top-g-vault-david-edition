---
title: "AssetFetchStatus"
description: "Describes the download state of an asset requested through `ContentProvider`."
api_type: enum
aliases: ["Enum.AssetFetchStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AssetFetchStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the download state of an asset requested through [[30 Official Roblox Docs/API Reference/Classes/ContentProvider|ContentProvider]].*

## Description

Describes the download state of an asset requested through [[30 Official Roblox Docs/API Reference/Classes/ContentProvider|ContentProvider]]. Every content ID has exactly one status at any given time, transitioning from [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus|Enum.AssetFetchStatus.None]] (never requested) to [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus|Enum.AssetFetchStatus.Loading]] (fetch in progress) and finally to a terminal state of [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus|Enum.AssetFetchStatus.Success]], [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus|Enum.AssetFetchStatus.Failure]], or [[30 Official Roblox Docs/API Reference/Enums/AssetFetchStatus|Enum.AssetFetchStatus.TimedOut]].

Query the current status with [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#GetAssetFetchStatus|ContentProvider:GetAssetFetchStatus()]] and listen for transitions with [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#GetAssetFetchStatusChangedSignal|ContentProvider:GetAssetFetchStatusChangedSignal()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 0 | The asset loaded successfully. |
| `Failure` | 1 | The asset failed to load successfully. Subsequent attempts are likely to fail; there may be something wrong with the [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] string. |
| `None` | 2 | The engine has no information about this asset. The engine never tried to load it. |
| `Loading` | 3 | The engine is in the middle of trying to load this asset. |
| `TimedOut` | 4 | The engine tried to load this asset but timed out. Future attempts to load may succeed. |

---
*Source: [AssetFetchStatus](https://create.roblox.com/docs/reference/engine/enums/AssetFetchStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
