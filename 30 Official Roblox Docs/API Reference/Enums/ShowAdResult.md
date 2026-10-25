---
title: "ShowAdResult"
description: "Result codes returned by `AdService:ShowRewardedVideoAdAsync()` indicating whether a rewarded video ad completed successfully or why it did not."
api_type: enum
aliases: ["Enum.ShowAdResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ShowAdResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Result codes returned by [[30 Official Roblox Docs/API Reference/Classes/AdService#ShowRewardedVideoAdAsync|AdService:ShowRewardedVideoAdAsync()]] indicating whether a rewarded video ad completed successfully or why it did not.*

## Description

Result codes returned by [[30 Official Roblox Docs/API Reference/Classes/AdService#ShowRewardedVideoAdAsync|AdService:ShowRewardedVideoAdAsync()]] indicating whether a rewarded video ad completed successfully or why it did not.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `ShowCompleted` | 1 | The ad was successfully shown to completion. |
| `AdNotReady` | 2 | You are trying to show a full-screen ad before the ad has fully loaded. You might have failed to properly fetch the ad, or the ad might have expired. |
| `AdAlreadyShowing` | 3 | You are trying to show a full-screen ad while another full-screen ad is already playing. |
| `InternalError` | 4 | An unspecified internal error occurred. Try showing the ad again. |
| `ShowInterrupted` | 5 | The ad view of the user has been interrupted. The user might have closed the ad view or left the experience, and should not receive a reward. |
| `InsufficientMemory` | 6 | The device does not have sufficient video memory available to display the ad. |

---
*Source: [ShowAdResult](https://create.roblox.com/docs/reference/engine/enums/ShowAdResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
