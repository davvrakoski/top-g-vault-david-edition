---
title: "AnalyticsService"
description: "Collection of methods that allows you to track how users interact with your experiences."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AnalyticsService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Collection of methods that allows you to track how users interact with your experiences.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`AnalyticsService` is a collection of methods that allows you to track how users interact with your experiences, specifically player progression, in-experience economy, funnels, and custom events. For more information on using this service, see [[30 Official Roblox Docs/Production/Analytics/Event types|Event types]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#ApiKey\|ApiKey]] | string | **Deprecated.** PlayFab API key. Must be set in order to use [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#FireEvent\|FireEvent]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#FireCustomEvent\|FireCustomEvent()]] | () | **Deprecated.** Fires a custom event with a custom event name and data. |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#FireEvent\|FireEvent()]] | () | **Deprecated.** Report a custom event to PlayFab. |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#FireInGameEconomyEvent\|FireInGameEconomyEvent()]] | () | **Deprecated.** Fire an event used to track player actions pertaining to the in-game |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#FireLogEvent\|FireLogEvent()]] | () | **Deprecated.** Fire a log event used to track errors and warnings experienced by players. |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#FirePlayerProgressionEvent\|FirePlayerProgressionEvent()]] | () | **Deprecated.** Fire an event used to track player progression through the game. |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#GetPlayerSegmentsAsync\|GetPlayerSegmentsAsync()]] | Dictionary | Returns coarse player segment buckets for the current experience. |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogCustomEvent\|LogCustomEvent()]] | () | Logs an event used to track custom metrics of a user in experience. |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogEconomyEvent\|LogEconomyEvent()]] | () | Logs an event used to track player actions related in experience. |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogFunnelStepEvent\|LogFunnelStepEvent()]] | () | Logs an event used to track user actions stepping through a pre-planned funnel. |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogOnboardingFunnelStepEvent\|LogOnboardingFunnelStepEvent()]] | () | Logs an event used to track user actions stepping through an onboarding funnel. |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogProgressionCompleteEvent\|LogProgressionCompleteEvent()]] | () | Logs an event for when a user has completed a level attempt. |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogProgressionEvent\|LogProgressionEvent()]] | () | Logs an event for when a user has started, completed, or failed a level attempt. |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogProgressionFailEvent\|LogProgressionFailEvent()]] | () | Logs an event for when a user has failed a level attempt. |
| [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogProgressionStartEvent\|LogProgressionStartEvent()]] | () | Logs an event for when a user has started a level attempt. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ApiKey

> [!warning] Deprecated
> This property is deprecated. Do not use it for new work.

**Type:** string

**Security:** read LocalUserSecurity / write LocalUserSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic · **Tags:** `Deprecated`

This property contains the game's PlayFab API key. It must be set and valid in order to use [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#FireEvent|FireEvent]].

## Methods

### FireCustomEvent

> [!warning] Deprecated
> This deprecated function is a variant of
> `Class.AnalyticsService:LogCustomEvent()` which should be used instead.

```lua
AnalyticsService:FireCustomEvent(player: Instance, eventCategory: string, customData: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This function triggers a custom event with a custom event name data.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The player who triggered the custom event. `nil` if not player related. |
| `eventCategory` | string |  | User defined category. This should be the name of the event. |
| `customData` | Variant |  | Optional. User defined data, could be a string, a number or a table. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`analytics-event---custom`) are published on the source page; their code is not part of the open-source repo.*

### FireEvent

> [!warning] Deprecated
> This function has been deprecated in favor of more descriptive methods,
> including `Class.AnalyticsService:LogCustomEvent()`,
> `Class.AnalyticsService:LogEconomyEvent()`, and
> `Class.AnalyticsService:LogProgressionEvent()`.

```lua
AnalyticsService:FireEvent(category: string, value: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This function reports a custom event to PlayFab. The event is reported using a **category** and **value**, where the category is a string and the value can be a string or table. In order to use PlayFab, you must have a valid [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#ApiKey|ApiKey]] set.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `category` | string |  | 'The category of event to report. Cannot contain the following characters: comma `,`, double quote `"` or newline characters `\r\n`'. |
| `value` | Variant |  | A value to be serialized and reported. Serialized length must not exceed 1 KiB, or 1024 bytes. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### FireInGameEconomyEvent

> [!warning] Deprecated
> This deprecated function is a variant of
> `Class.AnalyticsService:LogEconomyEvent()` which should be used instead.

```lua
AnalyticsService:FireInGameEconomyEvent(player: Instance, itemName: string, economyAction: AnalyticsEconomyAction, itemCategory: string, amount: int, currency: string, location: Variant, customData: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This function triggers an event used to track player actions pertaining to the in-game economy. For example, it should be called to track when players acquire or spend virtual items within the economy like currency.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The player who triggered the economy event. |
| `itemName` | string |  | The name of the item. |
| `economyAction` | [[30 Official Roblox Docs/API Reference/Enums/AnalyticsEconomyAction\|AnalyticsEconomyAction]] |  | Indicates the acquisition or spending of an in game resource. |
| `itemCategory` | string |  | A user defined category for items such as "Vehicle," "Weapon.". |
| `amount` | int |  | The amount of the currency. |
| `currency` | string |  | The currency used. Examples: 'gold', 'gems', 'life.'. |
| `location` | Variant |  | The event location. A dictionary that each key-value represents an entry of location data. The key-value is a string-string pair. With this you can query which are the most popular "stores" then maybe you want to increase/lower the price for the stores.<br><br>See the example below:<br><br>`local location = {`<br>`    ["placeDesc"] = "Dungeon1",`<br>`    ["levelDesc"] = "level2",`<br>`    ["mapDesc"] = "LeftChamberMap",`<br>`    ["storeName"] = "DarkSmith",`<br>`    ["userDefinedKey"] = "0005"`<br>`}` |
| `customData` | Variant |  | Optional. User defined data, could be a string, a number or a table. |

**Returns**

| Type | Description |
| --- | --- |
| () | No return. |

*Code samples for this member (`analytics-event---economy`) are published on the source page; their code is not part of the open-source repo.*

### FireLogEvent

> [!warning] Deprecated
> This method is deprecated. Do not use it for new work.

```lua
AnalyticsService:FireLogEvent(player: Instance, logLevel: AnalyticsLogLevel, message: string, debugInfo: Variant, customData: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This function triggers an event used to track errors and warnings experienced by players. For example, it could be called to indicate when a function call fails, such as a datastore save or [[30 Official Roblox Docs/API Reference/Classes/TeleportService#Teleport|TeleportService:Teleport()]]. See the example below.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The player who triggered the error event, `nil` if not player related. |
| `logLevel` | [[30 Official Roblox Docs/API Reference/Enums/AnalyticsLogLevel\|AnalyticsLogLevel]] |  | The specified log level (e.g. Debug, Error). |
| `message` | string |  | User defined message. |
| `debugInfo` | Variant |  | Optional. A dictionary which contains predefined keys including "errorCode" and "stackTrace". Both keys values are strings. stackTrace is a traceback of the current function call stack. |
| `customData` | Variant |  | Optional. User defined data, could be a string, a number or a table. |

**Returns**

| Type | Description |
| --- | --- |
| () | No return. |

*Code samples for this member (`analytics-event---log`) are published on the source page; their code is not part of the open-source repo.*

### FirePlayerProgressionEvent

> [!warning] Deprecated
> This deprecated function is a variant of
> `Class.AnalyticsService:LogProgressionEvent()` which should be used
> instead.

```lua
AnalyticsService:FirePlayerProgressionEvent(player: Instance, category: string, progressionStatus: AnalyticsProgressionStatus, location: Variant, statistics: Variant, customData: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This function triggers an event used to track player progression through the game. For example, it should be called when a player starts an in-game tutorial and again that player finishes the tutorial.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The player who triggered the event. |
| `category` | string |  | A user defined category for progression. |
| `progressionStatus` | [[30 Official Roblox Docs/API Reference/Enums/AnalyticsProgressionStatus\|AnalyticsProgressionStatus]] |  | Indicates the status of the progression. |
| `location` | Variant |  | The event location. A dictionary that each key-value represents an entry of location data. The key-value is a string-string pair. With this developers can query where is the most frequent location for a specific progression event category. For example, the category could be "LevelUp". |
| `statistics` | Variant |  | Optional. A dictionary that each key-value represents an entry of statistics data that allows developers to track any specific data that they want to collect as players progress through their game. Key-Value is a string-number pair. |
| `customData` | Variant |  | Optional. User defined data, could be a string, a number or a table. |

**Returns**

| Type | Description |
| --- | --- |
| () | No return. |

*Code samples for this member (`analytics-event---progression`) are published on the source page; their code is not part of the open-source repo.*

### GetPlayerSegmentsAsync

```lua
AnalyticsService:GetPlayerSegmentsAsync(player: Player): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

This server-only method returns coarse segment buckets for a player in the current experience. Use these buckets at runtime to personalize content or gate features for specific player groups. If a cached result is not already available, the method may yield while the engine fetches the segment data. Successfully fetched results are cached per player for the lifetime of the server session.

If segment data is unavailable, this method does not throw. Instead, it returns `HasData = false` and all enum fields are set to `Unknown`.

This method throws only when called from the client or when the `player` argument is invalid.

The returned dictionary has the following structure:

| Name | Type | Description |
| --- | --- | --- |
| `HasData` | bool | Whether segment data was successfully retrieved for the player. |
| `ActivePayerStatus` | [[30 Official Roblox Docs/API Reference/Enums/ActivePayerStatus\|Enum.ActivePayerStatus]] | The player's current payer status bucket for this experience. |
| `WhenUserFirstPlayed` | [[30 Official Roblox Docs/API Reference/Enums/WhenUserFirstPlayed\|Enum.WhenUserFirstPlayed]] | When the player first played this experience, represented as a bucket. |
| `PlatformSpenderStatus` | [[30 Official Roblox Docs/API Reference/Enums/PlayerPlatformSpenderStatus\|Enum.PlayerPlatformSpenderStatus]] | The player's platform-wide spender status bucket, including whether the player falls outside the active spender bucket. |
| `ExperienceActivationStatus` | [[30 Official Roblox Docs/API Reference/Enums/ExperienceActivationStatus\|Enum.ExperienceActivationStatus]] | Whether the player is new, active, lapsed, or reactivated in this experience, based on the last 30 days. |
| `EngagementLevel` | [[30 Official Roblox Docs/API Reference/Enums/EngagementLevel\|Enum.EngagementLevel]] | How many days the player played this experience in the last 7 days, represented as a bucket. |
| `PlatformActivationStatus` | [[30 Official Roblox Docs/API Reference/Enums/PlayerPlatformActivationStatus\|Enum.PlayerPlatformActivationStatus]] | Whether the player is new, active, lapsed, or reactivated on Roblox, based on the last 60 days. |
| `UserNewReturningStatus` | [[30 Official Roblox Docs/API Reference/Enums/UserNewReturningStatus\|Enum.UserNewReturningStatus]] | Whether the player is new to this experience or has played it before. |
| `UserAcquisitionSource` | [[30 Official Roblox Docs/API Reference/Enums/UserAcquisitionSource\|Enum.UserAcquisitionSource]] | How the player first found this experience. |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The player whose segment buckets should be returned. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing coarse player segment buckets for the current experience. |

*Code samples for this member (`AnalyticsService-GetPlayerSegmentsAsync`) are published on the source page; their code is not part of the open-source repo.*

### LogCustomEvent

```lua
AnalyticsService:LogCustomEvent(player: Player, eventName: string, value: double = 1, customFields: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Logs an event used to track custom metrics of a user in experience. For more information, see [[30 Official Roblox Docs/Production/Analytics/Custom events|Custom events]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The user who triggered the event. |
| `eventName` | string |  | The name of the custom event. |
| `value` | double | `1` | The value of the event that will be used in aggregation. |
| `customFields` | Dictionary | `nil` | Optional dictionary of custom fields that will provide breakdowns in Roblox-provided charts. Only specific keys, provided by [[30 Official Roblox Docs/API Reference/Enums/AnalyticsCustomFieldKeys\|Enum.AnalyticsCustomFieldKeys]], will be used for these breakdowns. Limited to 8,000 unique combinations of values across the three custom fields per experience. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Log-Custom-Event`) are published on the source page; their code is not part of the open-source repo.*

### LogEconomyEvent

```lua
AnalyticsService:LogEconomyEvent(player: Player, flowType: AnalyticsEconomyFlowType, currencyType: string, amount: float, endingBalance: float, transactionType: string, itemSku: string, customFields: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Logs an event used to track player actions related in experience. For more information, see [[30 Official Roblox Docs/Production/Analytics/Economy events|Economy events]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The user who triggered the event. |
| `flowType` | [[30 Official Roblox Docs/API Reference/Enums/AnalyticsEconomyFlowType\|AnalyticsEconomyFlowType]] |  | Should specify the direction that currency is flowing using [[30 Official Roblox Docs/API Reference/Enums/AnalyticsEconomyFlowType\|Enum.AnalyticsEconomyFlowType]]. |
| `currencyType` | string |  | The name of the currency being added or removed, for example `"gold"`, `"gems"`, or `"energy"`. Limited to 5 unique currency types per experience. |
| `amount` | float |  | The amount of currency being added or removed. This value should always be positive. |
| `endingBalance` | float |  | The user's balance after the currency has been added or removed. This value should always be greater than or equal to `0`. |
| `transactionType` | string |  | The type of transaction that occurred. While you're free to use any transaction type, it's recommended to use the provided types from [[30 Official Roblox Docs/API Reference/Enums/AnalyticsEconomyTransactionType\|Enum.AnalyticsEconomyTransactionType]] such as `"IAP"` or `"ContextualPurchase"` to enable future insights from Roblox tools and charts.<br><br>Because this field type is a string, you'll need to pass the `Name` value of the enum. For example [[30 Official Roblox Docs/API Reference/Enums/AnalyticsEconomyTransactionType\|Enum.AnalyticsEconomyTransactionType.IAP.Name]].<br><br>Limited to 20 unique types per experience. |
| `itemSku` | string |  | Optional SKU of the item or bundle being purchased. This is a unique identifier for the item being purchased. Limited to 100 unique SKUs per experience. |
| `customFields` | Dictionary | `nil` | Optional dictionary of custom fields that will provide breakdowns in Roblox-provided charts. Only specific keys, provided by [[30 Official Roblox Docs/API Reference/Enums/AnalyticsCustomFieldKeys\|Enum.AnalyticsCustomFieldKeys]], will be used for these breakdowns. Limited to 8,000 unique combinations of values across the three custom fields per experience. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`AnalyticsService-LogEconomyEvent-IAP`) are published on the source page; their code is not part of the open-source repo.*

### LogFunnelStepEvent

```lua
AnalyticsService:LogFunnelStepEvent(player: Player, funnelName: string, funnelSessionId: string, step: int = 1, stepName: string, customFields: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Logs an event used to track user actions stepping through a pre-planned funnel. Funnel breakdowns only consider the user and event values from the first step in a funnel session. See [[30 Official Roblox Docs/Production/Analytics/Funnel events|Funnel events]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The user who triggered the event. |
| `funnelName` | string |  | The name of the funnel. This should be the same for all steps in the funnel. Limited to 10 unique funnels per experience. |
| `funnelSessionId` | string |  | Optional unique identifier for the funnel session. This should be the same for all steps in the funnel.<br><br>Note that this field is only necessary for **recurring** funnels, for example a purchase flow funnel or an item upgrade funnel. If you don't have a natural funnel session identifier, it's recommended to use [[30 Official Roblox Docs/API Reference/Classes/HttpService#GenerateGUID\|HttpService:GenerateGUID()]]. |
| `step` | int | `1` | The step number in the funnel. This should be unique for each step in the funnel. All funnels start at step 1. Limited to steps 1-100.<br><br>Repeated steps by the same user in the same funnel session, or when `funnelSessionId` is `nil` will be ignored.<br><br>Note that if any steps are skipped, the intermediate steps will be considered completed. |
| `stepName` | string |  | Optional name of the step in the funnel. This field is only used for display purposes in Roblox-provided charts. |
| `customFields` | Dictionary | `nil` | Optional dictionary of custom fields that will provide breakdowns in Roblox-provided charts. Only specific keys, provided by [[30 Official Roblox Docs/API Reference/Enums/AnalyticsCustomFieldKeys\|Enum.AnalyticsCustomFieldKeys]], will be used for these breakdowns. Limited to 8,000 unique combinations of values across the three custom fields per experience. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`AnalyticsService-LogFunnelStepEvent-Shop`) are published on the source page; their code is not part of the open-source repo.*

### LogOnboardingFunnelStepEvent

```lua
AnalyticsService:LogOnboardingFunnelStepEvent(player: Player, step: int, stepName: string, customFields: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Logs an event used to track user actions stepping through an onboarding funnel. Funnel breakdowns only consider the user and event values from the first step in a funnel session. See [[30 Official Roblox Docs/Production/Analytics/Funnel events|Funnel events]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The user who triggered the event. |
| `step` | int |  | The step number in the funnel. This should be unique for each step in the funnel. All funnels start at step 1. Limited to steps 1-100.<br><br>Note that if any steps are skipped, the intermediate steps will be considered completed. |
| `stepName` | string |  | Optional name of the step in the funnel. This field is only used for display purposes in Roblox-provided charts. |
| `customFields` | Dictionary | `nil` | Optional dictionary of custom fields that will provide breakdowns in Roblox-provided charts. Only specific keys, provided by [[30 Official Roblox Docs/API Reference/Enums/AnalyticsCustomFieldKeys\|Enum.AnalyticsCustomFieldKeys]], will be used for these breakdowns. Limited to 8,000 unique combinations of values across the three custom fields per experience. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`AnalyticsService-LogOnboardingFunnelStepEvent-TwoSteps`) are published on the source page; their code is not part of the open-source repo.*

### LogProgressionCompleteEvent

```lua
AnalyticsService:LogProgressionCompleteEvent(player: Player, progressionPathName: string, level: int, levelName: string, customFields: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Logs an event for when a user has completed a level attempt. This event does not currently display in any Roblox-provided charts.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The player who triggered the event. |
| `progressionPathName` | string |  | The name of the progression path this event belongs to, such as a world, chapter, or level group. This groups related progression events together. Cannot be empty and cannot contain a comma `,`, double quote `"`, single quote `'`, or newline character. |
| `level` | int |  | The numeric level the player is progressing through within the progression path. |
| `levelName` | string |  | The name of the level associated with this event. This field is used for display purposes in Roblox-provided charts. |
| `customFields` | Dictionary | `nil` | Optional dictionary of custom fields that will provide breakdowns in Roblox-provided charts. Only specific keys, provided by [[30 Official Roblox Docs/API Reference/Enums/AnalyticsCustomFieldKeys\|Enum.AnalyticsCustomFieldKeys]], will be used for these breakdowns. Limited to 8,000 unique combinations of values across the three custom fields per experience. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### LogProgressionEvent

```lua
AnalyticsService:LogProgressionEvent(player: Player, progressionPathName: string, status: AnalyticsProgressionType, level: int, levelName: string, customFields: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Logs an event for when a user has started, completed, or failed a level attempt. This event does not currently display in any Roblox-provided charts.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The player who triggered the event. |
| `progressionPathName` | string |  | The name of the progression path this event belongs to, such as a world, chapter, or level group. This groups related progression events together. Cannot be empty and cannot contain a comma `,`, double quote `"`, single quote `'`, or newline character. |
| `status` | [[30 Official Roblox Docs/API Reference/Enums/AnalyticsProgressionType\|AnalyticsProgressionType]] |  | The progression status to record, provided as an [[30 Official Roblox Docs/API Reference/Enums/AnalyticsProgressionType\|Enum.AnalyticsProgressionType]] value such as `Start`, `Complete`, or `Fail`. The [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogProgressionStartEvent\|AnalyticsService:LogProgressionStartEvent()]], [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogProgressionCompleteEvent\|AnalyticsService:LogProgressionCompleteEvent()]], and [[30 Official Roblox Docs/API Reference/Classes/AnalyticsService#LogProgressionFailEvent\|AnalyticsService:LogProgressionFailEvent()]] methods are shortcuts that set this status for you. |
| `level` | int |  | The numeric level the player is progressing through within the progression path. |
| `levelName` | string |  | The name of the level associated with this event. This field is used for display purposes in Roblox-provided charts. |
| `customFields` | Dictionary | `nil` | Optional dictionary of custom fields that will provide breakdowns in Roblox-provided charts. Only specific keys, provided by [[30 Official Roblox Docs/API Reference/Enums/AnalyticsCustomFieldKeys\|Enum.AnalyticsCustomFieldKeys]], will be used for these breakdowns. Limited to 8,000 unique combinations of values across the three custom fields per experience. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### LogProgressionFailEvent

```lua
AnalyticsService:LogProgressionFailEvent(player: Player, progressionPathName: string, level: int, levelName: string, customFields: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Logs an event for when a user has failed a level attempt. This event does not currently display in any Roblox-provided charts.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The user who triggered the event. |
| `progressionPathName` | string |  | The name of the progression path this event belongs to, such as a world, chapter, or level group. This groups related progression events together. Cannot be empty and cannot contain a comma `,`, double quote `"`, single quote `'`, or newline character. |
| `level` | int |  | The numeric level the player is progressing through within the progression path. |
| `levelName` | string |  | The name of the level associated with this event. This field is used for display purposes in Roblox-provided charts. |
| `customFields` | Dictionary | `nil` | Optional dictionary of custom fields that will provide breakdowns in Roblox-provided charts. Only specific keys, provided by [[30 Official Roblox Docs/API Reference/Enums/AnalyticsCustomFieldKeys\|Enum.AnalyticsCustomFieldKeys]], will be used for these breakdowns. Limited to 8,000 unique combinations of values across the three custom fields per experience. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### LogProgressionStartEvent

```lua
AnalyticsService:LogProgressionStartEvent(player: Player, progressionPathName: string, level: int, levelName: string, customFields: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Logs an event for when a user has started a level attempt. This event does not currently display in any Roblox-provided charts.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The player who triggered the event. |
| `progressionPathName` | string |  | The name of the progression path this event belongs to, such as a world, chapter, or level group. This groups related progression events together. Cannot be empty and cannot contain a comma `,`, double quote `"`, single quote `'`, or newline character. |
| `level` | int |  | The numeric level the player is progressing through within the progression path. |
| `levelName` | string |  | The name of the level associated with this event. This field is used for display purposes in Roblox-provided charts. |
| `customFields` | Dictionary | `nil` | Optional dictionary of custom fields that will provide breakdowns in Roblox-provided charts. Only specific keys, provided by [[30 Official Roblox Docs/API Reference/Enums/AnalyticsCustomFieldKeys\|Enum.AnalyticsCustomFieldKeys]], will be used for these breakdowns. Limited to 8,000 unique combinations of values across the three custom fields per experience. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [AnalyticsService](https://create.roblox.com/docs/reference/engine/classes/AnalyticsService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
