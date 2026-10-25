---
title: "RecommendationService"
description: "A service that provides an interface for you to manage and display personalized content recommendations."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/RecommendationService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that provides an interface for you to manage and display personalized content recommendations.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

`RecommendationService` provides an interface for you to manage and display personalized content recommendations. It supports creating, retrieving, updating, and deleting recommendation items, as well as generating lists of recommended content for users. Additionally, it includes functionality for logging user interactions, such as views and actions, to help refine and improve recommendation quality. Once set up, you can monitor analytics in the Creator Dashboard under the **Engagement** section for an experience.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#GenerateItemListAsync\|GenerateItemListAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/RecommendationPages\|RecommendationPages]] | Returns a paginated list of personalized recommendation items for the specified request configuration. |
| [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#GetRecommendationItemAsync\|GetRecommendationItemAsync()]] | Dictionary | Retrieves a single registered recommendation item by its `ItemId`. |
| [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#LogActionEvent\|LogActionEvent()]] | () | Logs a user action, such as a reaction or play, taken on a recommended item. |
| [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#LogImpressionEvent\|LogImpressionEvent()]] | () | Logs an impression event, such as a user viewing a recommended item. |
| [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#LogPreferenceEvent\|LogPreferenceEvent()]] | () | Logs a user preference signal, such as follow or mute, toward a user, universe, or custom content tag. |
| [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#RegisterItemAsync\|RegisterItemAsync()]] | Dictionary | Registers a new item on the server so it can be included in recommendations, returning the generated `ItemId` and `ReferenceId`. |
| [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#RemoveItemAsync\|RemoveItemAsync()]] | () | Removes a registered item from the recommendation system by its `ItemId`. |
| [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#UpdateItemAsync\|UpdateItemAsync()]] | () | Updates the mutable attributes of an existing recommendation item. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GenerateItemListAsync

```lua
RecommendationService:GenerateItemListAsync(generateRecommendationItemListRequest: Dictionary): RecommendationPages
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

This function returns a paginated list of recommended items based on a given request. The request can specify criteria such as configuration name, location, and page size to tailor the recommendations. It returns a [[30 Official Roblox Docs/API Reference/Classes/RecommendationPages|RecommendationPages]] object that can be used to iterate through the list of items.

The `ConfigName` parameter determines how the recommendation engine ranks and returns items. For example, you can have configurations that optimize for views, likes, or purchases. For the ranking to be effective, you must ensure that you are logging the corresponding user interactions using [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#LogImpressionEvent|LogImpressionEvent]] and [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#LogActionEvent|LogActionEvent]].

Supported `ConfigName` are:

- `MaximizeTimespent`: Optimizes recommendations to prioritize content that engages users for longer periods.
- `MaximizeReactions`: Optimizes recommendations to highlight content that generates the most user reactions, such as likes and favorites.
- `MaximizePlays`: Optimizes recommendations to prioritize content that generates the most `Play` actions. To use this configuration effectively, you must log both impressions and `Play` actions. It's recommended to filter for "quality" plays (for example play duration greater than 60 seconds) before logging to reduce noise and improve the system's learning accuracy.
- `MaximizeEngagement`: Optimizes recommendations through a balanced approach that considers multiple engagement signals, including quality views and reactions. This config is designed to highlight content that performs well across different engagement areas.
- `PlayerSpecific`: Returns public items created by the player specified in the request and sorted by the most recent creation time. To use this config, you must pass the `UserId` in the `CustomContexts`.
- `RecentlyAdded`: Returns items sorted by how recent they are, and displays the most recently added public content first.
- `MaximizeJoins`: Optimizes recommendations to prioritize game joins. This configuration is exclusive to Roblox Moments and focuses on maximizing interactions leading to a teleport. In contrast, `MaximizePlays` is purely optimizing `Play` actions.
- `PlayerOwnedItems`: Displays the user's own creations sorted by creation time. This config requires user authentication because it displays private items. This config is only available on the **client**.

This function can be called from both the **server** and the **client**. When called from the server, you must pass the `UserId` in the `CustomContexts`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `generateRecommendationItemListRequest` | Dictionary |  | A dictionary containing the following fields:<br><br>- `ConfigName` — A unique ID for the specific configuration. This determines how the candidates are ranked. - `LocationId` — A developer-defined string that specifies the location where the recommendation is used, such as `"For_you"` or `"Lobby"`. This parameter will not affect the items returned, and it can help you track the performance of multiple recommendation features within your experience. Recommendation metrics for each individual location will be displayed in the Creator Hub. `LocationId` **must** be a string and cannot be `"Other"` or `"other"` as these values are reserved by the Creator Hub. - `PageSize` — The number of items returned for each page. - `BoostCustomTags` — A list of string tags. Any item with this tag will be boosted in ranking. Supports boosting one tag. - `CustomContexts` — A table of key-value pairs used to pass in additional context data for ranking. For example, `UserId` for a Server script. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/RecommendationPages\|RecommendationPages]] | A `RecommendationPages` object containing the paginated list of recommended items for the given request configuration. |

*Code samples for this member (`GenerateItemListAsync-example`) are published on the source page; their code is not part of the open-source repo.*

### GetRecommendationItemAsync

```lua
RecommendationService:GetRecommendationItemAsync(itemId: string): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

This function returns a single recommendation item by its `ItemId`. This is useful for getting the details of a specific item without having to fetch a whole list.

This function can be called only from the **server**.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `itemId` | string |  | The ID of the item to retrieve. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary representing the recommendation item with the following fields:<br><br>- `ItemId` — The unique ID for the item. - `ReferenceId` — The developer-provided ID for the item. - `TracingId` — An ID for tracking recommendation sessions. This will be empty when fetching a single item directly. - `Creator` — A table containing the `CreatorId` and `CreatorType`. - `Attributes` — A list of content attributes associated with the item. - `CustomTags` — A list of custom string tags. - `Visibility` — An enum of type [[30 Official Roblox Docs/API Reference/Enums/RecommendationItemVisibility\|RecommendationItemVisibility]]. |

*Code samples for this member (`GetRecommendationItemAsync-example`) are published on the source page; their code is not part of the open-source repo.*

### LogActionEvent

```lua
RecommendationService:LogActionEvent(actionType: RecommendationActionType, itemId: string, tracingId: string, actionEventDetails: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This function logs a user action on a recommended item, such as a "like," "share," or "purchase." It requires the `itemId` of the item and a `tracingId` from the GenerateItemListAsync response to link the action to a specific recommendation context. Additional details about the action can be provided in the `actionEventDetails` dictionary.

Logging actions is essential for recommendation configurations that rank items based on user engagement such as number of likes or purchases.

This function can only be called from the **client**.

**Note:** Only `LogActionEvent` calls in production actually log actions. Calling this function in Studio doesn't have any effect; you can call it as many times as you want when testing.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `actionType` | [[30 Official Roblox Docs/API Reference/Enums/RecommendationActionType\|RecommendationActionType]] |  | The enum for the type of action. |
| `itemId` | string |  | The item ID returned from registration and [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#GenerateItemListAsync\|GenerateItemListAsync]]. |
| `tracingId` | string |  | The tracing ID returned from the [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#GenerateItemListAsync\|GenerateItemListAsync]] response. Each item has a `TracingId`. |
| `actionEventDetails` | Dictionary | `nil` | A dictionary containing the following fields:<br><br>- `Weight` — A number representing the weight of the action. Default is 1. - `DestinationPlaceId` — The ID of the place the user was sent to after the action. Used for [[30 Official Roblox Docs/API Reference/Enums/RecommendationActionType\|Play]]. - `CommentText` — Any text associated with the action, such as a comment. Used for [[30 Official Roblox Docs/API Reference/Enums/RecommendationActionType\|Comment]]. - `ReactionType` — A string describing the type of reaction, for example, "like" or "dislike". Used for [[30 Official Roblox Docs/API Reference/Enums/RecommendationActionType\|AddReaction]] or [[30 Official Roblox Docs/API Reference/Enums/RecommendationActionType\|RemoveReaction]]. |

**Returns**

| Type | Description |
| --- | --- |
| () | No return value. |

*Code samples for this member (`LogActionEvent-example`) are published on the source page; their code is not part of the open-source repo.*

### LogImpressionEvent

```lua
RecommendationService:LogImpressionEvent(impressionType: RecommendationImpressionType, itemId: string, tracingId: string, impressionEventDetails: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This function logs an impression event, such as a user viewing a recommended item. It requires the `itemId` and a `tracingId` to associate the impression with the recommendation context. Details like view duration and position can be passed in the `impressionEventDetails` dictionary to provide more context for the recommendation engine.

Logging impressions, especially `Duration`, is critical for recommendation configurations that rank items based on view time.

This function can only be called from the **client**.

**Note:** Only `LogImpressionEvent` calls in production actually log impressions. Calling this function in Studio doesn't have any effect; you can call it as many times as you want when testing.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `impressionType` | [[30 Official Roblox Docs/API Reference/Enums/RecommendationImpressionType\|RecommendationImpressionType]] |  | The enum for the type of the impression. |
| `itemId` | string |  | The item ID returned from registration and [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#GenerateItemListAsync\|GenerateItemListAsync]]. |
| `tracingId` | string |  | The tracing ID returned from the [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#GenerateItemListAsync\|GenerateItemListAsync]] response. Each item has a `TracingId`. |
| `impressionEventDetails` | Dictionary | `nil` | A dictionary containing the following fields:<br><br>- `Duration` — The duration of the impression in seconds. - `Weight` — A number representing the weight of the impression. Default is 1. - `ItemPosition` — The position of the item in the recommendation list. - `DepartureIntent` — The [Enum.RecommendationDepartureIntent](https://create.roblox.com/docs/reference/engine/enums/RecommendationDepartureIntent) indicating the user's intent when leaving a view. For example, `Positive` if the view is considered good. |

**Returns**

| Type | Description |
| --- | --- |
| () | No return value. |

*Code samples for this member (`LogImpressionEvent-example`) are published on the source page; their code is not part of the open-source repo.*

### LogPreferenceEvent

```lua
RecommendationService:LogPreferenceEvent(preferenceType: RecommendationPreferenceType, targetType: RecommendationPreferenceTargetType, targetId: string, tracingId: string, itemId: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This function logs a user preference signal, such as follow, unfollow, mute, or unmute, directed at another user, a universe, or a custom content tag. It requires a `preferenceType`, a `targetType`, and a `targetId` whose format depends on the target type: the user key for [[30 Official Roblox Docs/API Reference/Enums/RecommendationPreferenceTargetType|User]], the universe ID as a string for [[30 Official Roblox Docs/API Reference/Enums/RecommendationPreferenceTargetType|Universe]], or the tag string for [[30 Official Roblox Docs/API Reference/Enums/RecommendationPreferenceTargetType|CustomTag]]. When the preference originates from a recommendation card served by [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#GenerateItemListAsync|GenerateItemListAsync]], pass the card's `tracingId` and `itemId` to correlate the event with the recommendation context; otherwise pass empty strings for both.

Logging preferences helps the recommendation engine personalize future results across every recommendation surface, not just item feeds.

This function can only be called from the **client**.

**Note:** Only `LogPreferenceEvent` calls in production actually log preferences. Calling this function in Studio doesn't have any effect; you can call it as many times as you want when testing.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `preferenceType` | [[30 Official Roblox Docs/API Reference/Enums/RecommendationPreferenceType\|RecommendationPreferenceType]] |  | The enum for the type of preference. |
| `targetType` | [[30 Official Roblox Docs/API Reference/Enums/RecommendationPreferenceTargetType\|RecommendationPreferenceTargetType]] |  | The enum for the type of target. |
| `targetId` | string |  | The identifier of the preference target. The format depends on `targetType`. |
| `tracingId` | string |  | The tracing ID returned from the [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#GenerateItemListAsync\|GenerateItemListAsync]] response. Pass an empty string if the preference originates outside a recommendation feed. |
| `itemId` | string |  | The item ID returned from the [[30 Official Roblox Docs/API Reference/Classes/RecommendationService#GenerateItemListAsync\|GenerateItemListAsync]] response. Pass an empty string if the preference originates outside a recommendation feed. |

**Returns**

| Type | Description |
| --- | --- |
| () | No return value. |

### RegisterItemAsync

```lua
RecommendationService:RegisterItemAsync(player: Player, registerRecommendationItemsRequest: Dictionary): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

This function registers a new item to be included in recommendations. It requires a `player` object and a `registerRecommendationItemsRequest` dictionary containing details about the item, such as its content type, reference ID, and custom tags. It returns a dictionary with the `ItemId` and the `ReferenceId` of the newly registered item.

When selecting a `ContentType`, choose the type that best represents your item. Note that different content types are not ranked against each other directly. Instead, they are mixed into the final recommendation list based on a configured ratio. For example, a configuration might display one `Static` item for every ten items. If your experience only features a single type of content, ensure that all registered items share the same `ContentType`.

The `ItemId` is a unique ID returned by the `RecommendationService`. All functions in the `RecommendationService` use the `ItemId` as input and output.

The `ReferenceId` is a developer-provided identifier for an item. To make sure that this reference ID is unique, we recommend that you use a UUID. You can use this reference ID as a key to store rendering-specific metadata in a data store.

When you register an item, you should only provide information that is relevant for ranking and recommendations. All other data needed for rendering should be stored separately in, for example, a data store. This approach decouples the recommendation logic from the rendering process, and results in a system that is more modular and easier to maintain.

`Attributes` is a list of content attributes associated with the item. Each attribute in the list can contain the following fields:

- `AssetId` — The ID of an asset, such as an image or video.
- `Text` — A short text string, like a title.
- `Description` — A longer text description for the attribute.
- `SeekStartTime` / `SeekEndTime` — The start and end times for seeking within video content.
- `TrimStartTime` / `TrimEndTime` — The start and end times for trimming video content.

Common Error Codes:

- **HTTP 403 (Forbidden)** — This error can occur when you call `RegisterItemAsync` from Studio. Even if you run it as a server script in Studio, the request is not issued from a Roblox server. To resolve this, publish your experience and run it in the Roblox client.
- **HTTP 400 (Bad Request)** — This error indicates that a parameter is malformed. Common causes include a custom tag containing a comma or the `Attributes` table exceeding its size limit. If you encounter a 400 error and have a large `Attributes` table, try reducing its size. Remember to only include attributes that are relevant for ranking.

This function can only be called from the **server**.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The player who created the item. |
| `registerRecommendationItemsRequest` | Dictionary |  | A dictionary containing the following fields:<br><br>- `ContentType` — The [[30 Official Roblox Docs/API Reference/Enums/RecommendationItemContentType\|Enum.RecommendationItemContentType]] specifying the type of content. Type is defined in a generic way. For example, you can use `Static` for images, `Dynamic` for videos, and `Interactive` for 3D models that support interaction. - `ReferenceId` — The developer-defined string that uniquely identifies the item. - `Duration` — The duration of the content in seconds. - `Attributes` — The table of attributes for the item, such as `AssetId` or `Description`. - `CustomTags` — The list of string tags for filtering and boosting. Individual custom tags can't contain commas. - `Visibility` — The [[30 Official Roblox Docs/API Reference/Enums/RecommendationItemVisibility\|RecommendationItemVisibility]] enum that controls the item's visibility, such as `Public` or `Private`. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A table with only two fields: `ItemId` and `ReferenceId`. |

*Code samples for this member (`RegisterItemAsync-example`) are published on the source page; their code is not part of the open-source repo.*

### RemoveItemAsync

```lua
RecommendationService:RemoveItemAsync(itemId: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

This function removes an item from the recommendation system. It takes the `itemId` of the item to be deleted as a parameter.

This function can be called from both the **server** and the **client**, with the following limitations:

- When called from the server, it can only remove items registered under the same `universeId`.
- When called from the client, it can only remove items registered by the current `player`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `itemId` | string |  | The itemId to remove. |

**Returns**

| Type | Description |
| --- | --- |
| () | No return value. |

*Code samples for this member (`RemoveItemAsync-example`) are published on the source page; their code is not part of the open-source repo.*

### UpdateItemAsync

```lua
RecommendationService:UpdateItemAsync(updateRecommendationItemRequest: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

This function updates the attributes of an existing recommendation item. It takes an `updateRecommendationItemRequest` dictionary containing the `itemId` and the fields to be updated. Any fields not included in the request will remain unchanged.

Items with their [[30 Official Roblox Docs/API Reference/Enums/RecommendationItemVisibility|RecommendationItemVisibility]] set to `Private` are not recommended to other users, but they can still be returned when a user requests their own creations by using the `ConfigName` of `PlayerOwnedItems`.

In Roblox Moments, moderated items are set to `Private`. While this prevents other users from seeing them, the item creator can still see these moderated items and check their moderation status in their **My Moments** tab.

This function can only be called from the **server**.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `updateRecommendationItemRequest` | Dictionary |  | A dictionary containing the following fields:<br><br>- `ItemId` — The ID of the item to update. - `ReferenceId` — The new developer-defined string to identify the item. - `Creator` — The new creator for the item. Creator is a table containing two fields: `CreatorId: number` and `CreatorType: Enum.CreatorType`. - `Duration` — The new duration for the content in seconds. - `Visibility` — The new visibility setting for the item. - `Attributes` — The new table of attributes for the item. - `CustomTags` — The new list of string tags. Individual custom tags can't contain commas. |

**Returns**

| Type | Description |
| --- | --- |
| () | No return value. |

*Code samples for this member (`UpdateItemAsync-example`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [RecommendationService](https://create.roblox.com/docs/reference/engine/classes/RecommendationService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
