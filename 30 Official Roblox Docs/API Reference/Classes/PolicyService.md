---
title: "PolicyService"
description: "Helps you query information regarding policy compliance for players around the world based on age range, location, and platform type."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PolicyService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Helps you query information regarding policy compliance for players around the world based on age range, location, and platform type.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`PolicyService` helps you query information regarding policy compliance for players around the world based on age range, location, and platform type.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PolicyService#CanViewBrandProjectAsync\|CanViewBrandProjectAsync()]] | boolean | Determines if a user can see brand project assets inside your experience. |
| [[30 Official Roblox Docs/API Reference/Classes/PolicyService#GetPolicyInfoForPlayerAsync\|GetPolicyInfoForPlayerAsync()]] | Dictionary | Returns policy information about a player based on geolocation, age group, and platform. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CanViewBrandProjectAsync

```lua
PolicyService:CanViewBrandProjectAsync(player: Player, brandProjectId: string): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

Determines if a user can see brand project assets inside your experience. This method lets you work with brands to only show commercial assets to brand-compliant audiences.

To use `CanViewBrandProjectAsync`, you must use a brand project ID provided by Roblox. To request a brand project ID,
[contact us](https://docs.google.com/forms/d/e/1FAIpQLSfGTRQwATB2wUg0P4HUSTtyXrhptFahJifo1ew84SyqtfSBfg/viewform).

You must call this method on a server-side Script and wrap it in a [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The `Player` object you're trying to show the brand project to. |
| `brandProjectId` | string |  | The brand project ID provided by Roblox. Represents all assets associated with a brand project. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether or not the brand project can be shown to the specific user. |

*Code samples for this member (`PolicyService-BrandProjectIntegrationServer`, `PolicyService-BrandProjectIntegrationClient`) are published on the source page; their code is not part of the open-source repo.*

### GetPolicyInfoForPlayerAsync

```lua
PolicyService:GetPolicyInfoForPlayerAsync(player: Instance): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

Returns policy information about a player based on geolocation, age group, and platform. The structure of the returned dictionary is as follows:

| Name | Type | Required for | Description |
| --- | --- | --- | --- |
| `AreAdsAllowed` | Boolean | Any experience that includes [[30 Official Roblox Docs/Production/Monetization/Immersive ads\|immersive ads]]. | When `true`, the player might see immersive ads within an experience. |
| `ArePaidRandomItemsRestricted` | Boolean | Any experience that has paid random items. | When `true`, the player can **not** interact with paid random item generators, either via in‑experience currency bought with Robux or Robux directly. |
| `IsContentSharingAllowed` | Boolean | Any feature in the experience that enables users to create content (e.g. text, images, video, audio) that other users can see in the experience or allows user to share content within experiences. | When `true`, the player can use features related to sharing UGC within an experience, such as uploading a screen capture, sharing a video, or posting an image to a content feed that other users can see. |
| `IsEligibleToPurchaseCommerceProduct` | Boolean | Any experience that wants to sell [[30 Official Roblox Docs/Production/Monetization/Commerce products\|commerce products]]. | When `true`, the player is eligible to purchase commerce products within an experience. |
| `IsEligibleToPurchaseSubscription` | Boolean | Any experience that wants to sell subscriptions. | When `true`, the player is eligible to purchase subscriptions within an experience. |
| `IsPaidItemTradingAllowed` | Boolean | Any experience that allows users to purchase virtual items that they can trade with other players. | When `true`, the player can trade virtual items that they purchased with in-experience currency or Robux. |
| `IsPhotoToAvatarAllowed` | Boolean | Any experience that uses the Photo-to-Avatar APIs. | When `true`, the player is permitted by policy to use the Photo-to-Avatar API [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptSelectAvatarGenerationImageAsync\|AvatarCreationService:PromptSelectAvatarGenerationImageAsync()]]. This flag reflects age (for example, users under 13) and regional restrictions, which are evaluated server-side. Check it before calling Photo-to-Avatar APIs to avoid policy-related errors. Note that a `true` value does not by itself guarantee the prompt will succeed: camera and photo-library availability is checked separately on the player's device, so calls can still fail on platforms where camera access is unavailable. |
| `IsSubjectToChinaPolicies` | Boolean | Any experience that is available in China. | When `true`, an experience should enforce compliance changes. See [this forum post](https://devforum.roblox.com/t/new-programs-available-roblox-china-licensed-to-operate/1023361) for more information. |
| `AllowedExternalLinkReferences` | Array | Not required. | This is a legacy field. It always returns an empty array. |
| `IsEndlessContentLoadAllowed` | Boolean | Any experience that includes a feature where content loads automatically and endlessly as the user scrolls, such as a feed, providing an endless flow of media content without requiring the user to engage in any specific interaction such as manual "load more" actions or separate pagination. | When `true`, the player can use features with endless content loading within an experience. |
| `IsEndlessContentAutoplayAllowed` | Boolean | Any experience that contains media content (video or audio) that automatically and endlessly plays without requiring user interaction or initiation, for example clicking a play button. | When `true`, the player can use features within an experience that automatically and endlessly play media content. |

##### Exceptions

Like any async call, this method needs to be wrapped in [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] and error-handled properly. A full list of possible error messages and their reasons is:

| Message | Reason |
| --- | --- |
| Instance was not a player | The `player` parameter is not a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] instance. |
| Players not found | Internal error that the [[30 Official Roblox Docs/API Reference/Classes/Players\|Players]] object is missing. |
| This method cannot be called on the client for a non-local player | This method cannot be called on the client for a non-local [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]. |
| GetPolicyInfoForPlayerAsync is called too many times | Internal error that `GetPolicyInfoForPlayerAsync()` is called more than 100 (current setting) times before an HTTP response comes back. |

See also [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetCountryRegionForPlayerAsync|LocalizationService:GetCountryRegionForPlayerAsync()]] which returns a country/region code string according to the player's client IP geolocation.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to get policy information for. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing information about the policy information of the requested player; see above for the dictionary structure. |

*Code samples for this member (`getting-policy-information-for-a-player`, `getting-policy-for-a-player-for-commerce-products`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [PolicyService](https://create.roblox.com/docs/reference/engine/classes/PolicyService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
