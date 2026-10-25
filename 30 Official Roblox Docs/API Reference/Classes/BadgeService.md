---
title: "BadgeService"
description: "Provides information on badges and awards them."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BadgeService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Provides information on badges and awards them.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

`BadgeService` provides information and functionality related to [[30 Official Roblox Docs/Production/Publishing/Badges|badges]]. Badges are used across the platform to recognize a player's achievements and activity. Upon awarding a badge to a player, it is added to their inventory and displayed on their profile page.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BadgeService#AwardBadge\|AwardBadge()]] | boolean | **Deprecated.** Award a badge to a player given the ID of each. |
| [[30 Official Roblox Docs/API Reference/Classes/BadgeService#AwardBadgeAsync\|AwardBadgeAsync()]] | boolean | Award a badge to a player given the ID of each. |
| [[30 Official Roblox Docs/API Reference/Classes/BadgeService#CheckUserBadgesAsync\|CheckUserBadgesAsync()]] | Array | Checks a list of badge IDs against a [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] and returns a list of badge IDs that the player owns. |
| [[30 Official Roblox Docs/API Reference/Classes/BadgeService#GetBadgeInfoAsync\|GetBadgeInfoAsync()]] | Dictionary | Fetch information about a badge given its ID. |
| [[30 Official Roblox Docs/API Reference/Classes/BadgeService#GetUserBadgesAsync\|GetUserBadgesAsync()]] | Array | Checks a list of badge IDs against a [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] and returns, for each badge the player owns, its ID and the date it was awarded. |
| [[30 Official Roblox Docs/API Reference/Classes/BadgeService#IsDisabled\|IsDisabled()]] | boolean | **Deprecated.** Returns whether a given badge is disabled. |
| [[30 Official Roblox Docs/API Reference/Classes/BadgeService#IsLegal\|IsLegal()]] | boolean | **Deprecated.** Determines if a given badge is associated with the current game. |
| [[30 Official Roblox Docs/API Reference/Classes/BadgeService#UserHasBadge\|UserHasBadge()]] | boolean | **Deprecated.** Checks whether a user has the badge given the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] and the badge ID. |
| [[30 Official Roblox Docs/API Reference/Classes/BadgeService#UserHasBadgeAsync\|UserHasBadgeAsync()]] | boolean | Checks whether a player has the badge given the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] and the badge ID. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### AwardBadge

> [!warning] Deprecated
> Use `Class.BadgeService:AwardBadgeAsync()|AwardBadgeAsync()` instead.

```lua
BadgeService:AwardBadge(userId: User, badgeId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement · **Tags:** `Yields`, `Deprecated`

Award a badge to a player given the ID of each.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the user the badge is to be awarded to. |
| `badgeId` | int64 |  | The ID of the badge to be awarded. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Boolean of `true` if the badge was awarded successfully. |

### AwardBadgeAsync

```lua
BadgeService:AwardBadgeAsync(userId: User, badgeId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement · **Tags:** `Yields`

Grants a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] a badge with the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] and the badge ID.

In order to successfully award a badge:

- The player must be presently connected to the experience.
- The player must not already have the badge (note that a player may delete an awarded badge from their profile and be awarded the badge again).
- The badge must be awarded from a server script (a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Server]] or [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Legacy]]) or a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] eventually required by one, not from a client script.
- The badge must be awarded in a place that is part of the experience associated with the badge.
- The badge must be enabled; check this using the `IsEnabled` property of the badge fetched through [[30 Official Roblox Docs/API Reference/Classes/BadgeService#GetBadgeInfoAsync|BadgeService:GetBadgeInfoAsync()]].

Rate limit is `50 + 35 * [number of users]` per minute.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the user the badge is to be awarded to. |
| `badgeId` | int64 |  | The ID of the badge to be awarded. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Boolean of `true` if the badge was awarded successfully. |

*Code samples for this member (`badges---awarding-a-badge`) are published on the source page; their code is not part of the open-source repo.*

### CheckUserBadgesAsync

```lua
BadgeService:CheckUserBadgesAsync(userId: User, badgeIds: Array): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement · **Tags:** `Yields`

Checks a list of badge IDs against a [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] and returns a list of badge IDs that the player owns. This method supports batches of up to 10 badges; use [[30 Official Roblox Docs/API Reference/Classes/BadgeService#UserHasBadgeAsync|BadgeService:UserHasBadgeAsync()]] for single badge lookups.

When called from a server script, any [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] can be used. If the user with the target user ID has not recently been in the server, only badge IDs that are associated with the requesting experience will be checked, and any badge IDs that are not associated with the requesting experience will not be included in the response (as if they were not owned).

For users that have recently been in the server, any badges for any experiences can be queried, no matter who created the badge or which experience it is used for.

In a client script (a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]]), only the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] of the local user whose client is running the script can be used.

Rate limit is `10 + 5 * [number of players]` per minute in each server.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] of the player to check for ownership of the specified badges. |
| `badgeIds` | Array |  | The list of IDs of the badges to check ownership of. Maximum length of 10. |

**Returns**

| Type | Description |
| --- | --- |
| Array | The list of badge IDs the given user owns out of the provided badge IDs. Empty if none of the provided badges are owned by the given user. Not guaranteed to be in the same order as the input list. Some badge IDs may be omitted if the user with the target `userId` has not recently been in the server and the badge IDs are not associated with the requesting experience. |

*Code samples for this member (`badges---checking-earned-badges-batch`) are published on the source page; their code is not part of the open-source repo.*

### GetBadgeInfoAsync

```lua
BadgeService:GetBadgeInfoAsync(badgeId: int64): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement · **Tags:** `Yields`

This method fetches information about a badge given its ID and returns a dictionary with the following fields:

| Key | Type | Description |
| --- | --- | --- |
| `Name` | string | The name of the badge. |
| `Description` | string | The description of the badge. |
| `IconImageId` | int64 | The asset ID of the image for the badge. |
| `IsEnabled` | boolean | Indicates whether the badge is available to be awarded. |
| `AwardCount` | int64 | The total number of times the badge has been awarded. |
| `PastDayAwardCount` | int64 | The number of times the badge was awarded in the past day. |
| `Rarity` | number | The rarity of the badge as a value from 0.0 (0%) to 1.0 (100%), representing the percentage of players who earned the badge in the past day. |

This method takes a brief moment to load the information from Roblox; repeated calls will cache for a short duration.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `badgeId` | int64 |  | The badge ID of the badge whose information should be fetched. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary of information about the specified badge. |

*Code samples for this member (`getbadgeinfoasync`) are published on the source page; their code is not part of the open-source repo.*

### GetUserBadgesAsync

```lua
BadgeService:GetUserBadgesAsync(userId: User, badgeIds: Array): Array
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement · **Tags:** `Yields`

Checks a list of badge IDs against a [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] and returns, for each badge the player owns, a dictionary containing the badge's ID and the date it was awarded. This method supports batches of up to 100 badges; use [[30 Official Roblox Docs/API Reference/Classes/BadgeService#UserHasBadgeAsync|BadgeService:UserHasBadgeAsync()]] for single badge lookups.

Each entry in the returned list is a dictionary with the following fields:

| Key | Type | Description |
| --- | --- | --- |
| `BadgeId` | int64 | The ID of the owned badge. |
| `AwardedDate` | DateTime | The date and time the badge was awarded to the user. |

When called from a server script, any [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] can be used. If the user with the target [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] has not recently been in the server, only badge IDs that are associated with the requesting experience will be checked, and any badge IDs that are not associated with the requesting experience will not be included in the response (as if they were not owned).

For users that have recently been in the server, any badges for any experiences can be queried, no matter who created the badge or which experience it is used for.

In a client script (a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]]), only the [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] of the local user whose client is running the script can be used.

Rate limit is `10 + 5 * [number of players]` per minute in each server.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] of the player to check for ownership of the specified badges. |
| `badgeIds` | Array |  | The list of IDs of the badges to check ownership of. Maximum length of 100. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A list of dictionaries, one for each badge the given user owns out of the provided badge IDs. Each dictionary contains a `BadgeId` and an `AwardedDate`. Empty if none of the provided badges are owned by the given user. Not guaranteed to be in the same order as the input list. Some badge IDs may be omitted if the user with the target [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] has not recently been in the server and the badge IDs are not associated with the requesting experience. |

*Code samples for this member (`badges---getting-earned-badges`) are published on the source page; their code is not part of the open-source repo.*

### IsDisabled

> [!warning] Deprecated
> This function is deprecated. Do not use it for new work. Instead, it can
> be checked by calling BadgeService:GetBadgeInfoAsync() and checking the
> IsEnabled field.

```lua
BadgeService:IsDisabled(badgeId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement · **Tags:** `Yields`, `Deprecated`

This function returns whether the badge with the given ID is marked **disabled** on the Roblox website. A badge can be disabled by its owner on its page on the Roblox website, in the settings sub-menu. When a badge is disabled, this function returns true and the badge can no longer be awarded. A badge may be quickly re-enabled through the same menu.

In Studio, a badge can only be tested if it is **disabled**. Calling this function with an enabled badge in Studio will return **true** and produce a warning "Sorry, badges can only be tested if they are disabled on Roblox game servers".

Note that even if a badge is enabled it may not necessarily be awardable (for example if it isn't associated with the current game).

Badges that are associated with special events are a common reason for a badge to be disabled. Often, it is easier to simply disable a badge instead of hard-coding a time check for when some event ends.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `badgeId` | int64 |  | The ID of the badge. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | True if the specified badge is not available to be awarded. |

### IsLegal

> [!warning] Deprecated
> This function is deprecated and will always return true. Do not use it for
> new work.

```lua
BadgeService:IsLegal(badgeId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement · **Tags:** `Yields`, `Deprecated`

This function determines if a given badge is associated with the current game. It returns true if the badge is associated with the current game.

Badges can only be awarded from a place that is part of the game associated with the badge. This means, for example, a developer cannot award a badge associated with another developer's game.

Even if this returns true, a badge may still not be award-able. For example, it may be disabled.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `badgeId` | int64 |  | The badge ID of the badge. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | True if the badge is associated with the current game. |

### UserHasBadge

> [!warning] Deprecated
> This method has been superseded by
> `Class.BadgeService:UserHasBadgeAsync()` which should be used for new work
> instead.

```lua
BadgeService:UserHasBadge(userId: User, badgeId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement · **Tags:** `Yields`, `Deprecated`

Checks and returns whether a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] owns a badge given their [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] and the badge ID. You can call the function from a server script or a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] eventually required by one. When calling the method from a client script (a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]]), it only works for the local user whose client is running the script.

When called from a server script, any [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] can be used. If the user with the target user ID has not recently been in the server, only badge IDs that are associated with the requesting experience will be checked. If the requested badge ID is not associated with the requesting experience and the target user has not recently been in the server, the method behaves as if the badge is not owned.

For users that have recently been in the server, any badge for any experience can be queried, no matter who created the badge or which experience it is used for.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The user ID of the user. |
| `badgeId` | int64 |  | The badge ID of the badge. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | True if the user has the badge. |

### UserHasBadgeAsync

```lua
BadgeService:UserHasBadgeAsync(userId: User, badgeId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AssetManagement · **Tags:** `Yields`

Checks and returns whether a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] owns a badge given their [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] and the badge ID. You can call this method from a server script or a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] eventually required by one. When calling this method from a client script (a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]]), it only works for the local user whose client is running the script.

When called from a server script, any [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] can be used. If the user with the target user ID has not recently been in the server, only badge IDs that are associated with the requesting experience will be checked. If the requested badge ID is not associated with the requesting experience and the target user has not recently been in the server, the method behaves as if the badge is not owned.

For users that have recently been in the server, any badge for any experience can be queried, no matter who created the badge or which experience it is used for.

Rate limit is `50 + 35 * [number of players]` per minute.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the player to check for ownership of the specified badge. |
| `badgeId` | int64 |  | The badge ID of the badge whose ownership will be checked. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Indicates if the specified user has the specified badge. |

*Code samples for this member (`badges---checking-earned-badges`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [BadgeService](https://create.roblox.com/docs/reference/engine/classes/BadgeService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
