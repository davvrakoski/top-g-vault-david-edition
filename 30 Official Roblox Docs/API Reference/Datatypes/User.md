---
title: "User"
description: "Represents a user's domain-scoped identity within a specific domain."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/User"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Represents a user's domain-scoped identity within a specific domain.*

## Description

The **User** data type represents a user's scoped identity within a specific domain, such as an experience or OAuth application. It encapsulates a domain user ID alongside the domain metadata that uniquely identifies that user within that domain.

Unlike a numeric user ID alone, a [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] value carries its domain context, making it unambiguous across experiences and apps. It is the standard identifier for referencing users in new experience code and is available from [[30 Official Roblox Docs/API Reference/Classes/Player#User|Player.User]].

#### Domain User IDs

User IDs on Roblox are **domain-scoped**: a single account has a unique domain user ID for each experience or app it interacts with. This ensures that user activity in one experience cannot be correlated with activity in another by a third party using the user ID alone.

A domain user ID is an integer that is unique within a given domain (identified by [[30 Official Roblox Docs/API Reference/Enums/DomainType|Enum.DomainType]] and domain ID). Domain user IDs are guaranteed not to collide with existing global user IDs.

#### Serialization

[[30 Official Roblox Docs/API Reference/Datatypes/User|User]] supports round-trip string serialization via [[30 Official Roblox Docs/API Reference/Datatypes/User#ToString|ToString()]] and [[30 Official Roblox Docs/API Reference/Datatypes/User#fromString|fromString()]]. A [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] serialized with `ToString()` and deserialized with `fromString()` produces an identical value. The encoded string is stable, URL-safe, and compact. Use it when persisting or transmitting user identity across systems.

#### Users vs. Players

A [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] represents persistent identity, not live server presence. It can reference any account in the domain, whether or not that user is currently connected. Use [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] when you need the in-server instance.

*Code samples for this API (`User-Overview`) are published on the [source page](https://create.roblox.com/docs/reference/engine/datatypes/User); their code is not part of the open-source repo.*

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/User#fromId\|fromId()]] | `domainUserId` | Creates a [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] from a domain user ID within the current experience. |
| [[30 Official Roblox Docs/API Reference/Datatypes/User#fromString\|fromString()]] | `userString` | Creates a [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] from its serialized string form. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/User#Id\|Id]] | int64 | The domain user ID, unique within this domain. |
| [[30 Official Roblox Docs/API Reference/Datatypes/User#DomainType\|DomainType]] | [[30 Official Roblox Docs/API Reference/Enums/DomainType\|DomainType]] | The type of domain that this domain user ID belongs to. |
| [[30 Official Roblox Docs/API Reference/Datatypes/User#DomainId\|DomainId]] | int64 | The identifier of the specific domain instance. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/User#ToString\|ToString()]] | string | Serializes this [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] into a stable string representation. |

## Constructors

### fromId

```lua
User.fromId(domainUserId: int64): User
```

Creates a new [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] from the given domain user ID, using the current experience as the domain. The ID must be a valid domain user ID (above the global user ID range).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `domainUserId` | int64 |  | The domain-scoped user ID to construct the User from. Must be above the global user ID range. |

*Code samples for this member (`User-fromId`) are published on the source page; their code is not part of the open-source repo.*

### fromString

```lua
User.fromString(userString: string): User
```

Deserializes a [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] from a string previously produced by [[30 Official Roblox Docs/API Reference/Datatypes/User#ToString|ToString()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userString` | string |  | A string previously produced by [[30 Official Roblox Docs/API Reference/Datatypes/User#ToString\|ToString()]]. |

*Code samples for this member (`User-fromString`) are published on the source page; their code is not part of the open-source repo.*

## Properties

### Id

**Type:** int64

The domain user ID for this user within the associated domain. This is an integer that uniquely identifies the user within the specific domain type and domain ID combination.

### DomainType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DomainType|DomainType]]

The [[30 Official Roblox Docs/API Reference/Enums/DomainType|Enum.DomainType]] that identifies the kind of domain this domain user ID belongs to. Currently supported values are [[30 Official Roblox Docs/API Reference/Enums/DomainType|Enum.DomainType.EXPERIENCE]] and [[30 Official Roblox Docs/API Reference/Enums/DomainType|Enum.DomainType.OAUTH]].

### DomainId

**Type:** int64

The identifier of the specific domain instance that this user ID is scoped to. For [[30 Official Roblox Docs/API Reference/Enums/DomainType|Enum.DomainType.EXPERIENCE]], this is the universe ID. For [[30 Official Roblox Docs/API Reference/Enums/DomainType|Enum.DomainType.OAUTH]], this is the application ID.

## Methods

### ToString

```lua
User:ToString(): string
```

Serializes this [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] into a string that encodes the domain type, domain ID, and domain user ID. The result is stable, URL-safe, and compact. Use this when storing or transmitting user identity.

The string can be converted back to a [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] via [[30 Official Roblox Docs/API Reference/Datatypes/User#fromString|fromString()]].

**Returns**

| Type | Description |
| --- | --- |
| string | A stable, URL-safe encoded string representing the domain type, domain ID, and domain user ID that can be deserialized back with [[30 Official Roblox Docs/API Reference/Datatypes/User#fromString\|fromString()]]. |

*Code samples for this member (`User-ToString`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [User](https://create.roblox.com/docs/reference/engine/datatypes/User) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
