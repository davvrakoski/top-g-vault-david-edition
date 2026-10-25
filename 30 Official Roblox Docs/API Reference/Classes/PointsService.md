---
title: "PointsService"
description: "This service controls the points award system used to showcase a player's achievements and participation throughout Roblox."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PointsService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*This service controls the points award system used to showcase a player's achievements and participation throughout Roblox.*

> [!warning] Deprecated
> This class was once used to control an ancient achievement system since
> removed and deprecated. It and its members should not be used in new work.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `Deprecated`

## Description

The PointsService class controls points.

Points are an award system used to showcase a player's achievements and participation throughout Roblox. How points are awarded through this service is at the discretion of the game's developer.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PointsService#AwardPoints\|AwardPoints()]] | Tuple | **Deprecated.** Attempts to award the user with the specified [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] the specified number of points. |
| [[30 Official Roblox Docs/API Reference/Classes/PointsService#GetAwardablePoints\|GetAwardablePoints()]] | int | **Deprecated.** Returns the number of points the current game has available to award to players. |
| [[30 Official Roblox Docs/API Reference/Classes/PointsService#GetGamePointBalance\|GetGamePointBalance()]] | int | **Deprecated.** Returns the total number of points a player has in the current game. |
| [[30 Official Roblox Docs/API Reference/Classes/PointsService#GetPointBalance\|GetPointBalance()]] | int | **Deprecated.** Returns the total number of points the given player has across all games. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PointsService#PointsAwarded\|PointsAwarded]] | `userId`, `pointsAwarded`, `userBalanceInGame`, `userTotalBalance` | **Deprecated.** Fires when points have been successfully awarded to a player, while also passing along the updated balance of points the player has in the current game and all games. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### AwardPoints

> [!warning] Deprecated
> This function was once part of the `PointService` class used to control an
> ancient achievement system since removed and deprecated. It should not be
> used in new work.

```lua
PointsService:AwardPoints(userId: int64, amount: int): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`, `Deprecated`

This function attempts to award the user with the specified [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]] the specified number of points.

If successful, this function will return the UserId of the user the points were awarded to, the number of points awarded, the new total number of points the user has in the game and another value which appears to always be 0.

This function will cause an error if the specified UserId is not positive or if the number of points specified is 0.

The function can be used to award a negative number of points to a user however.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | int64 |  |  |
| `amount` | int |  |  |

**Returns**

| Type | Description |
| --- | --- |
| Tuple |  |

*Code samples for this member (`PointsService-AwardPoints1`, `PointsService-AwardPoints`) are published on the source page; their code is not part of the open-source repo.*

### GetAwardablePoints

> [!warning] Deprecated
> This function was once part of the `PointService` class used to control an
> ancient achievement system since removed and deprecated. It should not be
> used in new work.

```lua
PointsService:GetAwardablePoints(): int
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

This function returns the number of points the current game has available to award to players.

**Returns**

| Type | Description |
| --- | --- |
| int |  |

### GetGamePointBalance

> [!warning] Deprecated
> This function was once part of the `PointService` class used to control an
> ancient achievement system since removed and deprecated. It should not be
> used in new work.

```lua
PointsService:GetGamePointBalance(userId: int64): int
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`, `Deprecated`

This function returns the total number of points a player has in the current game.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | int64 |  |  |

**Returns**

| Type | Description |
| --- | --- |
| int |  |

### GetPointBalance

> [!warning] Deprecated
> This function was once part of the `PointService` class used to control an
> ancient achievement system since removed and deprecated. It should not be
> used in new work.

```lua
PointsService:GetPointBalance(userId: int64): int
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`, `Deprecated`

This function returns the total number of points the given player has across **_all_** games.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | int64 |  |  |

**Returns**

| Type | Description |
| --- | --- |
| int |  |

## Events

### PointsAwarded

> [!warning] Deprecated
> This function was once part of the `PointService` class used to control an
> ancient achievement system since removed and deprecated. It should not be
> used in new work.

```lua
PointsService.PointsAwarded(userId: int64, pointsAwarded: int, userBalanceInGame: int, userTotalBalance: int)
```

**Capabilities:** Basic

This event fires when points have been successfully awarded to a player, while also passing along the updated balance of points the player has in the current game and all games.

When a player is awarded points successfully the below example would print the userId and their new point balance. If, for example, the Roblox account was awarded thirty points (and had none to begin with)

> User: 1 has now earned 30 (+30) points in the current game, now making
> their total balance

would be printed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | int64 |  |  |
| `pointsAwarded` | int |  |  |
| `userBalanceInGame` | int |  |  |
| `userTotalBalance` | int |  |  |

*Code samples for this member (`PointsService-PointsAwarded1`, `PointsService-PointsAwarded`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [PointsService](https://create.roblox.com/docs/reference/engine/classes/PointsService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
