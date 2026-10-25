---
title: "AdService"
description: "The service responsible for in-experience advertising."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AdService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The service responsible for in-experience advertising.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

[[30 Official Roblox Docs/API Reference/Classes/AdService|AdService]] is responsible for in-experience advertising. This includes [[30 Official Roblox Docs/Production/Promotion/Rewarded video ads|rewarded video]] and [[30 Official Roblox Docs/Production/Promotion/Ad integrations|ad integrations]].

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AdService#CreateAdRewardFromDevProductId\|CreateAdRewardFromDevProductId()]] | [[30 Official Roblox Docs/API Reference/Datatypes/AdReward\|AdReward]] | Creates an [[30 Official Roblox Docs/API Reference/Datatypes/AdReward\|AdReward]] to give users who watch a video ad. |
| [[30 Official Roblox Docs/API Reference/Classes/AdService#GetAdAvailabilityNowAsync\|GetAdAvailabilityNowAsync()]] | GetAdAvailabilityNowResult | Checks if an ad with the specified format is available to be shown to the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|LocalPlayer]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AdService#GetCampaignEligibilityAsync\|GetCampaignEligibilityAsync()]] | GetCampaignEligibilityResult | Checks a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]'s eligibility to be shown an [[30 Official Roblox Docs/Production/Promotion/Ad integrations\|ad integration]] campaign. |
| [[30 Official Roblox Docs/API Reference/Classes/AdService#RegisterAdOpportunityAsync\|RegisterAdOpportunityAsync()]] | () | Tracks how many times a user had the chance to watch a video ad and the rate at which they actually watched the ad. |
| [[30 Official Roblox Docs/API Reference/Classes/AdService#RegisterDisclosureButton\|RegisterDisclosureButton()]] | () | Registers an ad disclosure button for an [[30 Official Roblox Docs/Production/Promotion/Ad integrations\|ad integration]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AdService#ShowRewardedVideoAdAsync\|ShowRewardedVideoAdAsync()]] | [[30 Official Roblox Docs/API Reference/Enums/ShowAdResult\|ShowAdResult]] | Plays the video ad to the current user inside the experience. |
| [[30 Official Roblox Docs/API Reference/Classes/AdService#ShowVideoAd\|ShowVideoAd()]] | () | **Deprecated.** Show mobile video advertisements. |
| [[30 Official Roblox Docs/API Reference/Classes/AdService#UnregisterAdOpportunity\|UnregisterAdOpportunity()]] | () | Stops tracking an instance that was previously registered with [[30 Official Roblox Docs/API Reference/Classes/AdService#RegisterAdOpportunityAsync\|RegisterAdOpportunityAsync]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AdService#VideoAdClosed\|VideoAdClosed]] | `adShown` | **Deprecated.** Fires when an [[30 Official Roblox Docs/API Reference/Classes/AdService\|AdService]] video closes. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CreateAdRewardFromDevProductId

```lua
AdService:CreateAdRewardFromDevProductId(devProductId: int64): AdReward
```

**Thread safety:** Unsafe · **Capabilities:** Monetization

Constructs an [[30 Official Roblox Docs/API Reference/Datatypes/AdReward|AdReward]] that wraps the given developer product so it can be passed to [[30 Official Roblox Docs/API Reference/Classes/AdService#ShowRewardedVideoAdAsync|ShowRewardedVideoAdAsync]]. When the user watches the entire rewarded video ad, the developer product identified by `devProductId` is granted through the [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#ProcessReceipt|ProcessReceipt]] callback with a `ProductPurchaseChannel` of [[30 Official Roblox Docs/API Reference/Enums/ProductPurchaseChannel|Enum.ProductPurchaseChannel.AdReward]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `devProductId` | int64 |  | The ID of the developer product you want to grant as a reward. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/AdReward\|AdReward]] | An [[30 Official Roblox Docs/API Reference/Datatypes/AdReward\|AdReward]] configured as a developer product reward for the specified product. |

### GetAdAvailabilityNowAsync

```lua
AdService:GetAdAvailabilityNowAsync(adFormat: AdFormat): GetAdAvailabilityNowResult
```

**Thread safety:** Unsafe · **Capabilities:** Monetization · **Tags:** `Yields`

This method may only be called from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]].

Note that you should call this method as close as possible to the moment you plan to show the ad. For example, if you have a "Watch video ad to get a reward" button in a shop menu, only call this method when the user opens the shop menu. This approach improves performance by preventing ads from unnecessarily being held in memory, and it benefits CPM (cost-per-thousand impressions) and earnings by optimizing the ad fill rate.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `adFormat` | [[30 Official Roblox Docs/API Reference/Enums/AdFormat\|AdFormat]] |  | The format of the requested ad. For example, [[30 Official Roblox Docs/API Reference/Enums/AdFormat\|Enum.AdFormat.RewardedVideo]]. |

**Returns**

| Type | Description |
| --- | --- |
| GetAdAvailabilityNowResult | A dictionary that looks like `{ AdAvailabilityResult: Enum.AdAvailabilityResult }`. |

### GetCampaignEligibilityAsync

```lua
AdService:GetCampaignEligibilityAsync(campaignId: string, player: Player? = nil): GetCampaignEligibilityResult
```

**Thread safety:** Unsafe · **Capabilities:** Monetization · **Tags:** `Yields`

[[30 Official Roblox Docs/API Reference/Classes/AdService#GetCampaignEligibilityAsync|GetCampaignEligibilityAsync]] checks whether a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] is eligible to be shown a specific [[30 Official Roblox Docs/Production/Promotion/Ad integrations|ad integration]] campaign, returning a dictionary that looks like `{ IsEligible: boolean }`.

Call this method and confirm that `result.IsEligible` is `true` before you display any of the campaign's ad integration assets or register their disclosure buttons with [[30 Official Roblox Docs/API Reference/Classes/AdService#RegisterDisclosureButton|RegisterDisclosureButton]]. All ad integration assets should remain hidden until the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] is confirmed eligible.

When called from the client, the `player` argument defaults to the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|LocalPlayer]]. When called from the server, `player` is required. The call raises an error if the supplied `campaignId` exceeds the maximum allowed length.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `campaignId` | string |  | The ID of the campaign that you want to check a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]'s eligibility for. |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]? | `nil` | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] you want to check eligibility for. If omitted, it will default to the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|LocalPlayer]]. On the server, `player` argument is required. |

**Returns**

| Type | Description |
| --- | --- |
| GetCampaignEligibilityResult | A dictionary that looks like `{ IsEligible: boolean }`. |

*Code samples for this member (`AdService-AdIntegrations`) are published on the source page; their code is not part of the open-source repo.*

### RegisterAdOpportunityAsync

```lua
AdService:RegisterAdOpportunityAsync(instance: Instance, placementId: int64?): ()
```

**Thread safety:** Unsafe · **Capabilities:** Monetization · **Tags:** `Yields`

This method may only be called from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]].

Registers a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] for ad opportunity tracking. Once registered, the system periodically checks whether the button is visible and unobstructed (the topmost input-sinking element at its center point). These visibility transitions are reported as ad opportunity impressions and used to measure the rate at which users are presented with, and choose to watch, rewarded video ads.

The `instance` must be a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] that is a descendant of a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] under [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]]. If the instance is moved out of a valid hierarchy at runtime, tracking pauses automatically and resumes when it returns to a valid ancestor. Call [[30 Official Roblox Docs/API Reference/Classes/AdService#UnregisterAdOpportunity|UnregisterAdOpportunity]] to stop tracking the instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] to track as a rewarded video ad opportunity. Must be a descendant of a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGui]]. |
| `placementId` | int64? |  | The ID of the placement of the rewarded video ad inside the experience. Allows for reporting on the performance of individual ad placements. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`AdService-RegisterAdOpportunityAsync`) are published on the source page; their code is not part of the open-source repo.*

### RegisterDisclosureButton

```lua
AdService:RegisterDisclosureButton(disclosureButton: GuiButton, adIntegrationPlacementId: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Monetization

This method may only be called from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]].

[[30 Official Roblox Docs/API Reference/Classes/AdService#RegisterDisclosureButton|RegisterDisclosureButton]] marks a button in your experience as an ad disclosure for an ad integration. When a user clicks it, they can see who is paying for the ad. See [[30 Official Roblox Docs/Production/Promotion/Ad integrations#Labeling and disclosure|ad integrations]] for guidance on what the disclosures should look like and when they should be visible.

Note: you must verify that the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|LocalPlayer]] is eligible to see the associated ad integration campaign by calling [[30 Official Roblox Docs/API Reference/Classes/AdService#GetCampaignEligibilityAsync|GetCampaignEligibilityAsync]] and verifying that `result.IsEligible` is `true` before attempting to register a disclosure button for it. If you do not wait, or the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|LocalPlayer]] is not eligible to see the associated campaign, then [[30 Official Roblox Docs/API Reference/Classes/AdService#RegisterDisclosureButton|RegisterDisclosureButton]] will raise an error.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `disclosureButton` | [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] |  | The [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] you want to mark as an ad integration disclosure. The [[30 Official Roblox Docs/API Reference/Classes/GuiButton\|GuiButton]] must follow labeling guidelines outlined [[30 Official Roblox Docs/Production/Promotion/Ad integrations#Labeling and disclosure\|here]]. |
| `adIntegrationPlacementId` | string |  | The ID of the placement that this disclosure is attached to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ShowRewardedVideoAdAsync

```lua
AdService:ShowRewardedVideoAdAsync(player: Player, reward: AdReward, placementId: int64?): ShowAdResult
```

**Thread safety:** Unsafe · **Capabilities:** UI, Monetization · **Tags:** `Yields`

**Warning**: Rewarded Video ads must be user opt-in and clearly disclosed. For details, review our [[30 Official Roblox Docs/Production/Promotion/Rewarded video ads#Eligibility requirements|eligibility requirements]] and [advertising standards](https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards).

This method may only be called from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Server]].

Note: before calling this method, you must first verify that the specified user has a rewarded video ad available to show by calling [[30 Official Roblox Docs/API Reference/Classes/AdService#GetAdAvailabilityNowAsync|GetAdAvailabilityNowAsync]]. If the client does not have an available ad, then [[30 Official Roblox Docs/API Reference/Classes/AdService#ShowRewardedVideoAdAsync|ShowRewardedVideoAdAsync]] will return [[30 Official Roblox Docs/API Reference/Enums/ShowAdResult|Enum.ShowAdResult.AdNotReady]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to trigger a rewarded video ad play for. |
| `reward` | [[30 Official Roblox Docs/API Reference/Datatypes/AdReward\|AdReward]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/AdReward\|AdReward]] to grant the user after they view the ad. |
| `placementId` | int64? |  | The ID of the placement of the rewarded video ad inside the experience. Allows for reporting on the performance of individual ad placements. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/ShowAdResult\|ShowAdResult]] | The [[30 Official Roblox Docs/API Reference/Enums/ShowAdResult\|Enum.ShowAdResult]] of the client's ad presentation. You should not use this result to grant the reward. Instead, you should grant the reward from your [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#ProcessReceipt\|ProcessReceipt]] implementation. For [[30 Official Roblox Docs/Production/Monetization/Developer Products\|developer products]] earned through rewarded video ads, the `receipt.ProductPurchaseChannel` will be [[30 Official Roblox Docs/API Reference/Enums/ProductPurchaseChannel\|Enum.ProductPurchaseChannel.AdReward]]. |

*Code samples for this member (`AdService-RewardedVideo`) are published on the source page; their code is not part of the open-source repo.*

### ShowVideoAd

> [!warning] Deprecated
> `Class.AdService.ShowVideoAd|ShowVideoAd` has been decommissioned and is
> no longer operational.

```lua
AdService:ShowVideoAd(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Monetization · **Tags:** `Deprecated`

Show mobile video advertisements.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### UnregisterAdOpportunity

```lua
AdService:UnregisterAdOpportunity(instance: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Monetization

Removes `instance` from the ad opportunity tracker so that it no longer counts toward the rewarded video ad opportunity reporting started by [[30 Official Roblox Docs/API Reference/Classes/AdService#RegisterAdOpportunityAsync|RegisterAdOpportunityAsync()]]. Call it once an instance should no longer be treated as an ad opportunity, such as when its associated UI is closed or removed.

If the supplied `instance` is not currently being tracked, this method has no effect.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The instance to stop tracking. This should be an instance that you previously passed to [[30 Official Roblox Docs/API Reference/Classes/AdService#RegisterAdOpportunityAsync\|RegisterAdOpportunityAsync()]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### VideoAdClosed

> [!warning] Deprecated
> `Class.AdService.VideoAdClosed|VideoAdClosed` has been decommissioned and
> is no longer operational.

```lua
AdService.VideoAdClosed(adShown: boolean)
```

**Capabilities:** Monetization · **Tags:** `Deprecated`

Fires when an [[30 Official Roblox Docs/API Reference/Classes/AdService|AdService]] video closes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `adShown` | boolean |  |  |

---
*Source: [AdService](https://create.roblox.com/docs/reference/engine/classes/AdService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
