---
title: "FacialAgeEstimationResultType"
description: "Describes the outcome of a facial age estimation inquiry initiated by `FacialAgeEstimationService`."
api_type: enum
aliases: ["Enum.FacialAgeEstimationResultType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/FacialAgeEstimationResultType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the outcome of a facial age estimation inquiry initiated by [FacialAgeEstimationService](https://create.roblox.com/docs/reference/engine/classes/FacialAgeEstimationService).*

## Description

Describes the outcome of a facial age estimation inquiry initiated by [FacialAgeEstimationService](https://create.roblox.com/docs/reference/engine/classes/FacialAgeEstimationService). The result type is reported as the `type` field of the dictionary returned by [FacialAgeEstimationService:InquiryAsync()](https://create.roblox.com/docs/reference/engine/classes/FacialAgeEstimationService#InquiryAsync).

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Complete` | 0 | The facial age estimation inquiry finished successfully. |
| `Cancel` | 1 | The facial age estimation inquiry was cancelled before it could complete. |
| `Error` | 2 | The facial age estimation inquiry failed due to an error. |

---
*Source: [FacialAgeEstimationResultType](https://create.roblox.com/docs/reference/engine/enums/FacialAgeEstimationResultType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
