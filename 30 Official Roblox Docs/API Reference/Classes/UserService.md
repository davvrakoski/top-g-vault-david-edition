---
title: "UserService"
description: "A service that handles queries regarding users on the Roblox platform."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/UserService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that handles queries regarding users on the Roblox platform.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

A service that handles queries regarding users on the Roblox platform.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UserService#GetUserInfosByUserIdsAsync\|GetUserInfosByUserIdsAsync()]] | Array | Returns an array of user information including user name and display name. |
| [[30 Official Roblox Docs/API Reference/Classes/UserService#GetUserFromGlobalUserIdAsync\|GetUserFromGlobalUserIdAsync()]] | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] | Returns a [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] for the given global user ID within the current experience. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetUserInfosByUserIdsAsync

```lua
UserService:GetUserInfosByUserIdsAsync(userIds: Array): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

This function lets you request information about users outside of the current [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] in bulk. The input and output values are both arrays.

- The order of the user info objects in the return value's array may not match the order of the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]] sent in the input parameter's array. Use the `Id` field of the user info object to identify your input array with the output array.
- It's possible to receive fewer user info objects than requested if one or more of the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]] in the request array are invalid, such as negative numbers or user IDs that don't have accounts associated with them. It's possible to receive a response with zero results if all [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]] are invalid.
- If a Roblox user does not have a [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName|DisplayName]] associated with their account, this function will instead return the same string as the user's username in their info object's `DisplayName` field. While a user's [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] will never change, they may change their username or display name, so the same input [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]] may return a different string for these fields from one day to another.
- Since [[30 Official Roblox Docs/API Reference/Classes/UserService#GetUserInfosByUserIdsAsync|GetUserInfosByUserIdsAsync()]] makes an external web request, it will yield and may fail if the backend service is experiencing interruptions. Ensure you can handle downtime appropriately by wrapping this method with a [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]].
- Results are limited to 250 per minute, so if you receive an HTTP 429 error, try again later, ideally after reducing the number of [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]] in your input array, reducing the number of method calls, or both.

The signature of a singular user info object is:

| Key | Type | Description |
| --- | --- | --- |
| `Id` | number | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] associated with the user. |
| `Username` | string | The username associated with the user. |
| `DisplayName` | string | The [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName\|DisplayName]] associated with the user. |
| `HasVerifiedBadge` | boolean | The [[30 Official Roblox Docs/API Reference/Classes/Player#HasVerifiedBadge\|HasVerifiedBadge]] value associated with the user. |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userIds` | Array |  | An array of [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]] requested. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of dictionary objects that contain user information. |

*Code samples for this member (`userservice-getuserinfosbyuseridsasync-example`) are published on the source page; their code is not part of the open-source repo.*

### GetUserFromGlobalUserIdAsync

```lua
UserService:GetUserFromGlobalUserIdAsync(userId: int64): User
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

Resolves a global user ID to a [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] for the current experience domain. Use this when you have a legacy global user ID (for example, one previously saved in a data store) and need the corresponding [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] value.

This is a server-only yielding call.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | int64 |  | The global user ID to resolve. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] | User: The [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] representing the resolved domain-scoped identity. |

*Code samples for this member (`UserService-GetUserFromGlobalUserIdAsync`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [UserService](https://create.roblox.com/docs/reference/engine/classes/UserService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
