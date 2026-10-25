---
title: "BenefitType"
description: "Indicates the type of virtual benefit granted to a user when they purchase a commerce product through `CommerceService`."
api_type: enum
aliases: ["Enum.BenefitType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/BenefitType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the type of virtual benefit granted to a user when they purchase a commerce product through [[30 Official Roblox Docs/API Reference/Classes/CommerceService|CommerceService]].*

## Description

The `BenefitType` enum classifies the virtual items that a user receives as part of a [[30 Official Roblox Docs/API Reference/Classes/CommerceService|CommerceService]] commerce product purchase. Each benefit entry returned by [[30 Official Roblox Docs/API Reference/Classes/CommerceService#GetCommerceProductInfoAsync|CommerceService:GetCommerceProductInfoAsync()]] includes a `BenefitType` field that identifies whether the granted item is a developer product, an individual avatar asset, or an avatar bundle.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `DeveloperProduct` | 0 | The benefit is a developer product whose receipt is delivered through [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#BindReceiptHandler\|MarketplaceService:BindReceiptHandler()]] upon purchase of a commerce product. |
| `AvatarAsset` | 1 | The benefit is a single avatar asset granted to the user's inventory upon purchase of a commerce product. |
| `AvatarBundle` | 2 | The benefit is an avatar bundle granted to the user's inventory upon purchase of a commerce product. |

---
*Source: [BenefitType](https://create.roblox.com/docs/reference/engine/enums/BenefitType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
