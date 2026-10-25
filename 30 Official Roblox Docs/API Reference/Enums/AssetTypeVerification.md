---
title: "AssetTypeVerification"
description: "Determines the asset type verification mode."
api_type: enum
aliases: ["Enum.AssetTypeVerification"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AssetTypeVerification"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines the asset type verification mode.*

## Description

Determines the asset type verification mode used when calling [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/Players#CreateHumanoidModelFromDescriptionAsync|Players:CreateHumanoidModelFromDescriptionAsync()]]. This verification mode determines if the method will load models or not. Loading models can be insecure if it's possible for malicious users to trick your game into loading unexpected models that you own which may include malicious scripts. You should set this to `Always` unless you want to load non-catalog assets.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Default` | 1 | Use the default behavior for asset type verification. |
| `ClientOnly` | 2 | Only verify asset types on the client. Asset type verification can not be turned off on the client. |
| `Always` | 3 | Always verify the asset types to be loaded and disallow loading models. |

---
*Source: [AssetTypeVerification](https://create.roblox.com/docs/reference/engine/enums/AssetTypeVerification) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
