---
title: "AnalyticsEconomyFlowType"
description: "Specifies the direction of currency flow in an economy event logged by `AnalyticsService:LogEconomyEvent()`."
api_type: enum
aliases: ["Enum.AnalyticsEconomyFlowType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AnalyticsEconomyFlowType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the direction of currency flow in an economy event logged by [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogEconomyEvent|AnalyticsService:LogEconomyEvent()]].*

## Description

Passed as the `flowType` argument to [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogEconomyEvent|AnalyticsService:LogEconomyEvent()]] to indicate whether an in-experience currency transaction is adding currency to or removing currency from a player's balance. Use [[30 Official Roblox Docs/API Reference/Enums/AnalyticsEconomyFlowType|Source]] when the player gains currency (for example, purchasing coins with Robux or earning gold from gameplay) and [[30 Official Roblox Docs/API Reference/Enums/AnalyticsEconomyFlowType|Sink]] when the player spends currency (for example, buying an item from a shop).

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Sink` | 0 | Currency is being removed from the player's account. |
| `Source` | 1 | Currency is being added to the player's account. |

---
*Source: [AnalyticsEconomyFlowType](https://create.roblox.com/docs/reference/engine/enums/AnalyticsEconomyFlowType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
