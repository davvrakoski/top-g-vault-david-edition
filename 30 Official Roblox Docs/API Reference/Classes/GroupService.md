---
title: "GroupService"
description: "GroupService is a service that allows developers to fetch information about a Roblox group from within a game."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GroupService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*GroupService is a service that allows developers to fetch information about a Roblox group from within a game.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`GroupService` is a service that allows developers to fetch information about a Roblox group from within a game.

Basic information on the group, including its name, description, owner, roles and emblem can be fetched using [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetGroupInfoAsync|GroupService:GetGroupInfoAsync()]]. Lists of a group's allies and enemies can be fetched using [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetAlliesAsync|GroupService:GetAlliesAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetEnemiesAsync|GroupService:GetEnemiesAsync()]].

`GroupService` can also be used to fetch a list of groups a player is a member of, using [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetGroupsAsync|GroupService:GetGroupsAsync()]]. If you wish to verify if a player is in a group, use the [[30 Official Roblox Docs/API Reference/Classes/Player#IsInGroupAsync|Player:IsInGroupAsync()]] method rather than [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetGroupsAsync|GroupService:GetGroupsAsync()]].

The service has a number of useful applications, such as detecting if a player is an ally or enemy upon joining the game, or prompting a player to join a group using the [[30 Official Roblox Docs/API Reference/Classes/GroupService#PromptJoinAsync|GroupService:PromptJoinAsync()]] method.

*Code samples for this API (`Group-Ally-Enemy-Checker`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/GroupService); their code is not part of the open-source repo.*

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetAlliesAsync\|GetAlliesAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/StandardPages\|StandardPages]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/StandardPages\|StandardPages]] object including information on all of the specified group's allies. |
| [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetEnemiesAsync\|GetEnemiesAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/StandardPages\|StandardPages]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/StandardPages\|StandardPages]] object including information on all of the specified group's enemies. |
| [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetGroupInfoAsync\|GetGroupInfoAsync()]] | Variant | Returns a table containing information about the given group. |
| [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetGroupsAsync\|GetGroupsAsync()]] | Array | Returns a list of tables containing information on all of the groups a given player is a member of. |
| [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetRolesInGroupAsync\|GetRolesInGroupAsync()]] | Variant | Returns all roles held by the specified user in the specified group, supporting multi-role group membership. |
| [[30 Official Roblox Docs/API Reference/Classes/GroupService#PromptJoinAsync\|PromptJoinAsync()]] | [[30 Official Roblox Docs/API Reference/Enums/GroupMembershipStatus\|GroupMembershipStatus]] | Prompts the local [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to join a specified Roblox group via a native modal. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetAlliesAsync

```lua
GroupService:GetAlliesAsync(groupId: int64): StandardPages
```

**Thread safety:** Unsafe · **Capabilities:** Groups · **Tags:** `Yields`

Returns a [[30 Official Roblox Docs/API Reference/Classes/StandardPages|StandardPages]] object including information on all of the specified group's allies.

This pages does not include a list of group IDs but instead a list of group information tables, mirroring the format of those returned by [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetGroupInfoAsync|GroupService:GetGroupInfoAsync()]]. See below for the structure of these tables.

```lua
group = {
    Name = "Knights of the Seventh Sanctum",
    Id = 377251,
    Owner = {
        Name = "Vilicus",
        Id = 23415609
    },
    EmblemUrl = "http://www.roblox.com/asset/?id=60428602",
    Description = "We fight alongside the balance to make sure no one becomes too powerful",
    Roles = {
        [1] = {
            Name = "Apprentice",
            Rank = 1
        },
        [2] = {
            Name = "Warrior",
            Rank = 2
        },
        [3] = {
            Name = "Earth Walker",
            Rank = 255
        }
    }
}
```

Note, as this function returns a [[30 Official Roblox Docs/API Reference/Classes/StandardPages|StandardPages]] object rather than an array, developers may wish to convert it to an array for ease of use (see examples).

This function has a number of useful applications, including detecting if a player is a member of an allied group.

For enemies, use [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetEnemiesAsync|GroupService:GetEnemiesAsync()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `groupId` | int64 |  | The group's ID. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StandardPages\|StandardPages]] | A [[30 Official Roblox Docs/API Reference/Classes/StandardPages\|StandardPages]] object containing group information tables for each of the specified group's allies. |

*Code samples for this member (`GroupService-GetAlliesAsync1`, `Group-Ally-Enemy-Checker`) are published on the source page; their code is not part of the open-source repo.*

### GetEnemiesAsync

```lua
GroupService:GetEnemiesAsync(groupId: int64): StandardPages
```

**Thread safety:** Unsafe · **Capabilities:** Groups · **Tags:** `Yields`

Returns a [[30 Official Roblox Docs/API Reference/Classes/StandardPages|StandardPages]] object including information on all of the specified group's enemies.

This pages does not include a list of group IDs but instead a list of group information tables, mirroring the format of those returned by [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetGroupInfoAsync|GroupService:GetGroupInfoAsync()]]. See below for the structure of these tables.

```lua
group = {
    Name = "Knights of the Seventh Sanctum",
    Id = 377251,
    Owner = {
        Name = "Vilicus",
        Id = 23415609
    },
    EmblemUrl = "http://www.roblox.com/asset/?id=60428602",
    Description = "We fight alongside the balance to make sure no one becomes too powerful",
    Roles = {
        [1] = {
            Name = "Apprentice",
            Rank = 1
        },
        [2] = {
            Name = "Warrior",
            Rank = 2
        },
        [3] = {
            Name = "Earth Walker",
            Rank = 255
        }
    }
}
```

Note, as this function returns a [[30 Official Roblox Docs/API Reference/Classes/StandardPages|StandardPages]] object rather than an array, developers may wish to convert it to an array for ease of use (see examples).

This function has a number of useful applications, including detecting if a player is a member of an enemy group.

For allies, use [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetAlliesAsync|GroupService:GetAlliesAsync()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `groupId` | int64 |  | The group's ID. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StandardPages\|StandardPages]] | A [[30 Official Roblox Docs/API Reference/Classes/StandardPages\|StandardPages]] object containing group information tables for each of the specified group's enemies. |

*Code samples for this member (`GroupService-GetEnemiesAsync1`, `Group-Ally-Enemy-Checker`) are published on the source page; their code is not part of the open-source repo.*

### GetGroupInfoAsync

```lua
GroupService:GetGroupInfoAsync(groupId: int64): Variant
```

**Thread safety:** Unsafe · **Capabilities:** Groups · **Tags:** `Yields`

Returns a table containing information about the given group.

The table returned is the same format as that returned in [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetAlliesAsync|GroupService:GetAlliesAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetEnemiesAsync|GroupService:GetEnemiesAsync()]]. This format can be seen below.

```lua
group = {
    Name = "Knights of the Seventh Sanctum",
    Id = 377251,
    Owner = {
        Name = "Vilicus",
        Id = 23415609
    },
    EmblemUrl = "http://www.roblox.com/asset/?id=60428602",
    Description = "We fight alongside the balance to make sure no one becomes too powerful",
    Roles = {
        [1] = {
            Name = "Apprentice",
            Rank = 1
        },
        [2] = {
            Name = "Warrior",
            Rank = 2
        },
        [3] = {
            Name = "Earth Walker",
            Rank = 255
        }
    }
}
```

Note, if a group has no owner the Owner field will be set to `nil`.

This function has a number of useful applications, including loading the latest description and logo of a group for display in a group base.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `groupId` | int64 |  | The group ID of the group. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | A dictionary of information about the group. |

*Code samples for this member (`GroupService-GetGroupInfoAsync1`, `Load-Group-Emblem`) are published on the source page; their code is not part of the open-source repo.*

### GetGroupsAsync

```lua
GroupService:GetGroupsAsync(userId: User): Array
```

**Thread safety:** Unsafe · **Capabilities:** Groups · **Tags:** `Yields`

This function returns a list of tables containing information on all of the groups a given [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] is a member of.

The list returned will include an entry for every group the player is a member of. These entries are tables with the following fields.

| Name | Description |
| --- | --- |
| **Name** | The group's name |
| **Id** | The group ID |
| **EmblemUrl** | An asset url linking to the group's thumbnail (for example: http://www.roblox.com/asset/?id=276165514) |
| **EmblemId** | The assetId of the emblem, the same which is used in the EmblemUrl |
| **Rank** *(deprecated)* | The rankId the player has. Deprecated: players may now hold more than one role in a group. Use [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetRolesInGroupAsync\|GroupService:GetRolesInGroupAsync()]] instead. |
| **Role** *(deprecated)* | The name of the player's group rank. Deprecated: players may now hold more than one role in a group. Use [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetRolesInGroupAsync\|GroupService:GetRolesInGroupAsync()]] instead. |
| **IsPrimary** | A boolean indicating if this is the player's primary group |
| **IsInClan** *(deprecated)* | Always `false`. Deprecated: the Clans feature has been sunset. |

Note unlike [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetAlliesAsync|GroupService:GetAlliesAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetEnemiesAsync|GroupService:GetEnemiesAsync()]], GetGroupsAsync returns a table rather than a [[30 Official Roblox Docs/API Reference/Classes/StandardPages|StandardPages]] object.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the user. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of dictionaries containing information on the group's the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] is a member of. |

*Code samples for this member (`GetGroupsAsync`) are published on the source page; their code is not part of the open-source repo.*

### GetRolesInGroupAsync

```lua
GroupService:GetRolesInGroupAsync(userId: User, groupId: int64): Variant
```

**Thread safety:** Unsafe · **Capabilities:** Groups · **Tags:** `Yields`

Returns a table describing all roles the specified user holds in the specified group. In a multi-role world, a user may belong to more than one role simultaneously.

The returned table has the following structure:

| Key      | Type    | Description                                                       |
| -------- | ------- | ----------------------------------------------------------------- |
| IsMember | boolean | `true` if the user is a member of the group                       |
| Roles    | array   | Array of role tables (empty if not a member or no non-base roles) |

Each entry in the `Roles` array has the following structure:

| Key  | Type    | Description              |
| ---- | ------- | ------------------------ |
| Id   | integer | Unique role ID           |
| Name | string  | Display name of the role |
| Rank | integer | Rank value (0–255)       |

The `Roles` array is ordered from the highest role to the lowest role. Only public roles are included. A role's `Rank` value is retained for backwards compatibility, but does not determine its position in the role hierarchy. Use the stable `Id` to identify a role.

This method supersedes [[30 Official Roblox Docs/API Reference/Classes/Player#GetRankInGroupAsync|Player:GetRankInGroupAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/Player#GetRoleInGroupAsync|Player:GetRoleInGroupAsync()]], which return only the member's highest public role.

This call may not yield the most up-to-date information. Results are cached per user and group, so multiple calls with the same `userId` and `groupId` may yield the same result until the cache expires. The caching behavior is on a per-peer basis: a server does not share the same cache as a client.

When a player joins a group in-experience due to a call to [[30 Official Roblox Docs/API Reference/Classes/GroupService#PromptJoinAsync|GroupService:PromptJoinAsync()]], any cached result for that player and group will be cleared on the client where the prompt was shown.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The user's ID. |
| `groupId` | int64 |  | The group's ID. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | A table with two fields: `IsMember` (boolean) and `Roles` (array of public role tables). Each role table contains `Id` (integer), `Name` (string), and `Rank` (integer). The array is ordered from highest to lowest role. |

*Code samples for this member (`GroupService-GetRolesInGroupAsync`) are published on the source page; their code is not part of the open-source repo.*

### PromptJoinAsync

```lua
GroupService:PromptJoinAsync(groupId: int64): GroupMembershipStatus
```

**Thread safety:** Unsafe · **Capabilities:** Groups · **Tags:** `Yields`

`PromptJoinAsync()` displays a prompt to the local player through which they may join the specified Roblox group. The group must exist and the player must meet the eligibility criteria to join. If the player is ineligible, this method will return [[30 Official Roblox Docs/API Reference/Enums/GroupMembershipStatus|Enum.GroupMembershipStatus.None]].

Note that you can use [[30 Official Roblox Docs/API Reference/Classes/Player#IsInGroupAsync|Player:IsInGroupAsync()]] to check the player's current membership status before calling this method.

If the player successfully joins, any cached results from [[30 Official Roblox Docs/API Reference/Classes/GroupService#GetRolesInGroupAsync|GroupService:GetRolesInGroupAsync()]], [[30 Official Roblox Docs/API Reference/Classes/Player#GetRankInGroupAsync|Player:GetRankInGroupAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/Player#GetRoleInGroupAsync|Player:GetRoleInGroupAsync()]] for that player and group will be cleared on the client where the prompt was shown.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `groupId` | int64 |  | ID of the group to prompt the player to join. This must be a valid group ID. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/GroupMembershipStatus\|GroupMembershipStatus]] | [[30 Official Roblox Docs/API Reference/Enums/GroupMembershipStatus\|Enum.GroupMembershipStatus]] indicating the player's group membership status after the prompt is closed. If the player closes the prompt without joining, this will return [[30 Official Roblox Docs/API Reference/Enums/GroupMembershipStatus\|Enum.GroupMembershipStatus.None]] or their previous status if they were already a member. |

*Code samples for this member (`GroupService-PromptJoinAsync1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [GroupService](https://create.roblox.com/docs/reference/engine/classes/GroupService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
