---
title: "DataModel"
description: "The root of Roblox's parent-child hierarchy. Its direct children are services, such as `Workspace` and `Lighting`, that act as the fundamental components of a Roblox game."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DataModel"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The root of Roblox's parent-child hierarchy. Its direct children are services, such as [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]], that act as the fundamental components of a Roblox game.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider|ServiceProvider]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

The [[30 Official Roblox Docs/Projects/Data model|Data Model]] (commonly known as `game` after the global variable used to access it) is the root of Roblox's parent-child hierarchy. Its direct children are services, such as [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] and [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]], that act as the fundamental components of a Roblox game.

*Code samples for this API (`DataModel1`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/DataModel); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#CreatorId\|CreatorId]] | int64 | Describes the ID of the user or group that owns the place. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#CreatorType\|CreatorType]] | [[30 Official Roblox Docs/API Reference/Enums/CreatorType\|CreatorType]] | Describes the [[30 Official Roblox Docs/API Reference/Enums/CreatorType\|Enum.CreatorType]] of the place, whether the place is owned by a user or a group. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#GameId\|GameId]] | int64 | Describes the ID of the experience that the place running on the server belongs to. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#GearGenreSetting\|GearGenreSetting]] | [[30 Official Roblox Docs/API Reference/Enums/GearGenreSetting\|GearGenreSetting]] | **Deprecated.** Not functional. Historically described the gear permissions of the place as set on the Roblox website. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#Genre\|Genre]] | [[30 Official Roblox Docs/API Reference/Enums/Genre\|Genre]] | **Deprecated.** Not functional. Historically described the [[30 Official Roblox Docs/API Reference/Enums/Genre\|Enum.Genre]] of the place as set on the Roblox website. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId\|JobId]] | string | A unique identifier for the running game server instance. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#lighting\|lighting]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** Refers to the game's [[30 Official Roblox Docs/API Reference/Classes/Lighting\|Lighting]] service. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#MatchmakingType\|MatchmakingType]] | [[30 Official Roblox Docs/API Reference/Enums/MatchmakingType\|MatchmakingType]] | Represents how players in the server are handled by matchmaking. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|PlaceId]] | int64 | Describes the ID of the place running on the server. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceVersion\|PlaceVersion]] | int | Describes the version of the place the server is running on. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerId\|PrivateServerId]] | string | Describes the private server ID of the server, if the server is a private server or a [[30 Official Roblox Docs/API Reference/Classes/TeleportService#ReserveServerAsync\|reserved server]]. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerOwnerId\|PrivateServerOwnerId]] | int64 | Describes the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] of the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] that owns the private server if the server is private. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#RunService\|RunService]] | [[30 Official Roblox Docs/API Reference/Classes/RunService\|RunService]] | A reference to the [[30 Official Roblox Docs/API Reference/Classes/RunService\|RunService]] service. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#VIPServerId\|VIPServerId]] | string | **Deprecated.** A string that could identify the current server as a private server. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#VIPServerOwnerId\|VIPServerOwnerId]] | int64 | **Deprecated.** The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] of the account who owns the private server. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#Workspace\|Workspace]] | [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]] | A reference to the [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]] service. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#Workspace\|workspace]] | [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]] | **Deprecated.**  |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#BindToClose\|BindToClose()]] | () | Binds a function to be called before the server shuts down. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#GetJobsInfo\|GetJobsInfo()]] | Array | Returns a table containing basic information about the jobs performed by the task scheduler. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#GetMessage\|GetMessage()]] | string | **Deprecated.** **_[OBSOLETE]:_** This function will always return a blank string. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#GetObjects\|GetObjects()]] | Instances | **Deprecated.** Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] associated with the given content URL. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#GetRemoteBuildMode\|GetRemoteBuildMode()]] | boolean | **Deprecated.** This method is no longer useful and will always return false. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#IsGearTypeAllowed\|IsGearTypeAllowed()]] | boolean | **Deprecated.** Returns whether gear of the given [[30 Official Roblox Docs/API Reference/Enums/GearType\|Enum.GearType]] is permitted to be added to [[30 Official Roblox Docs/API Reference/Classes/Player\|Players']] [[30 Official Roblox Docs/API Reference/Classes/StarterGear\|StarterGears]]. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#IsLoaded\|IsLoaded()]] | boolean | Returns true if the client has finished loading the game for the first time. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#SavePlace\|SavePlace()]] | boolean | **Deprecated.** Saves the current place. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#SetPlaceId\|SetPlaceId()]] | () | Sets the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|DataModel.PlaceId]] of the current game instance. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#SetUniverseId\|SetUniverseId()]] | () | Sets the [[30 Official Roblox Docs/API Reference/Classes/DataModel#GameId\|DataModel.GameId]] of the current game instance to the given `universeId`. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#AllowedGearTypeChanged\|AllowedGearTypeChanged]] |  | **Deprecated.** Fires when SetGearSettings is called with a different value for `allowedGenres`. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#GraphicsQualityChangeRequest\|GraphicsQualityChangeRequest]] | `betterQuality` | Fires when the user prompts and increase or decrease in graphics quality using the hotkeys. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#ItemChanged\|ItemChanged]] | `object`, `descriptor` | **Deprecated.** Fires when a property of any object in the [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#Loaded\|Loaded]] |  | Fires on the client when the game finishes loading for the first time. |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#ServerRestartScheduled\|ServerRestartScheduled]] | `restartTime`, `source`, `attributes` | Fires on the server when the server has been scheduled to restart. Provides the scheduled restart time, source, and custom attributes. |

### Callbacks

| Callback | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataModel#OnClose\|OnClose()]] | Tuple | **Deprecated.** Invoked before the game is shut down. When this callback returns, or the timeout period is hit, the game finishes shutting down. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider|ServiceProvider]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CreatorId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property describes the ID of the user or group that owns the place. If the [[30 Official Roblox Docs/API Reference/Classes/DataModel#CreatorType|DataModel.CreatorType]] property is `User` then `CreatorId` will be the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]] of the place's owner. If the [[30 Official Roblox Docs/API Reference/Classes/DataModel#CreatorType|DataModel.CreatorType]] is `Group` then `CreatorId` will be the ID of the group that owns the place.

*Code samples for this member (`detect-when-the-place-owner-joins-the-game`) are published on the source page; their code is not part of the open-source repo.*

### CreatorType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CreatorType|CreatorType]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property describes the [[30 Official Roblox Docs/API Reference/Enums/CreatorType|Enum.CreatorType]] of the place, whether the place is owned by a user or a group. If `User`, then the [[30 Official Roblox Docs/API Reference/Classes/DataModel#CreatorId|DataModel.CreatorId]] property will describe the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] of the account that owns the game. If `Group`, then it will describe the group ID.

*Code samples for this member (`detect-when-the-place-owner-joins-the-game`) are published on the source page; their code is not part of the open-source repo.*

### GameId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property describes the ID of the experience that the place running on the server belongs to.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId|DataModel.PlaceId]], which describes the ID of the place running on the server
- [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId|DataModel.JobId]], which is a unique identifier for the server game instance running
- [[30 Official Roblox Docs/API Reference/Classes/TeleportService|TeleportService]], which is a service that can be used to transport [[30 Official Roblox Docs/API Reference/Classes/Player|Players]] between games

### GearGenreSetting

> [!warning] Deprecated
> This property is deprecated and is no longer functional. It should not be
> used.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/GearGenreSetting|GearGenreSetting]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

This property, along with [[30 Official Roblox Docs/API Reference/Classes/DataModel#Genre|DataModel.Genre]], no longer functions correctly and attempting to read it may throw an error.

### Genre

> [!warning] Deprecated
> This property is deprecated and is no longer functional. It should not be
> used.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/Genre|Genre]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is broken and should not be used.

This property historically described the [[30 Official Roblox Docs/API Reference/Enums/Genre|Enum.Genre]] of the place as set on the Roblox website.

This property, along with [[30 Official Roblox Docs/API Reference/Classes/DataModel#GearGenreSetting|DataModel.GearGenreSetting]], no longer functions correctly due to genres existing on the Roblox website that are not reflected in the [[30 Official Roblox Docs/API Reference/Enums/Genre|Enum.Genre]] enum. As a result, attempting to read this property may throw an error.

### JobId

**Type:** string

**Thread safety:** ReadSafe · **Category:** JobInfo · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a unique identifier for the running game server instance. It is a universally unique identifier (UUID), meaning that no two servers, past or present, will ever have the same ID.

Defaults to an empty string in Studio.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetPlayerPlaceInstanceAsync|TeleportService:GetPlayerPlaceInstanceAsync()]] which can be used to retrieve the [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId|DataModel.JobId]] of a user's current server.
- [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportToPlaceInstance|TeleportService:TeleportToPlaceInstance()]] which can be used to teleport a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] to a specific server.
- [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerId|DataModel.PrivateServerId]] describes the ID of the private server the game server instance belongs to.
- [[30 Official Roblox Docs/API Reference/Classes/HttpService#GenerateGUID|HttpService:GenerateGUID()]], a function that can be used to generate your own UUIDs.

### lighting

> [!warning] Deprecated
> This item has been superseded by
> `Class.ServiceProvider:GetService()|game:GetService("Lighting")`, which
> should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

This property was once used to get the game's [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service.

### MatchmakingType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/MatchmakingType|MatchmakingType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

This property represents how players in the server are handled by matchmaking. Players with different [[30 Official Roblox Docs/API Reference/Classes/DataModel#MatchmakingType|MatchmakingTypes]] cannot be in or teleport to the same server.

Note that this property is only valid on the server [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] and it will be the [[30 Official Roblox Docs/API Reference/Enums/MatchmakingType|Enum.MatchmakingType.Default]] value for all clients, so only reference this property inside of a server‑side [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

### PlaceId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property describes the ID of the place running on the server.

If the place has not been published to Roblox, this ID will correspond with the template being used.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/DataModel#GameId|DataModel.GameId]], which describes the ID of the experience that the current place belongs to
- [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId|DataModel.JobId]], which is a unique identifier for the server game instance running
- [[30 Official Roblox Docs/API Reference/Classes/TeleportService|TeleportService]], which is a service that can be used to transport [[30 Official Roblox Docs/API Reference/Classes/Player|Players]] between places

### PlaceVersion

**Type:** int

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property describes the version of the place the server is running on.

This version number corresponds with the version number shown under the **Version History** section of the place's settings. It is not the current version of the Roblox client. This property is 0 for all unpublished experiences.

When a server instance is created for a place, it uses the place's current version. If the place is later updated while this server is running, the server will remain at its current version.

This property can be used to display a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] showing the current version of the game to [[30 Official Roblox Docs/API Reference/Classes/Player|Players]] to assist with debugging.

*Code samples for this member (`server-version-number-gui`) are published on the source page; their code is not part of the open-source repo.*

### PrivateServerId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

This property describes the private server ID of the server, if the server is a private server.

If the server is not a private server, then this property will be an empty string.

#### Private servers

Private servers refer to the following:

- [[30 Official Roblox Docs/Production/Monetization/Private servers|Private servers]] that users can purchase from the games page
- Reserved servers, private servers created by the developer using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#ReserveServerAsync|TeleportService:ReserveServerAsync()]]

#### PrivateServerId vs JobId

The PrivateServerId of a server is different from the [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId|DataModel.JobId]]. The [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId|JobId]] is the unique identifier of the current server instance.

Private servers (private or reserved servers) can have multiple server instances associated with them over time. This is because, although only one server instance can be running at once for a private server, new server instances can open and close as players join and leave the game. For example, no server instance is running when nobody is playing in the server. The PrivateServerId will be consistent across all of these server instances, and the [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId|DataModel.JobId]] will be unique for each one.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerOwnerId|DataModel.PrivateServerOwnerId]], a property describing the owner of a private server
- [[30 Official Roblox Docs/API Reference/Classes/TeleportService#ReserveServerAsync|TeleportService:ReserveServerAsync()]], a function which creates a reserved server

*Code samples for this member (`detecting-private-servers`) are published on the source page; their code is not part of the open-source repo.*

### PrivateServerOwnerId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

This property describes the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] of the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] that owns the [[30 Official Roblox Docs/Production/Monetization/Private servers|private server]] if the server is private.

If the server is a standard or reserved server then this property will be set to `0`.

This property could be used to identify if a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] is the owner of the private server, for example:

```lua
local Players = game:GetService("Players")

-- is this a private server?
if game.PrivateServerId ~= "" and game.PrivateServerOwnerId ~= 0 then

    -- listen for new players being added
    Players.PlayerAdded:Connect(function(player)

        -- check if the player is the server owner
        if player.UserId == game.PrivateServerOwnerId then
            print("The private server owner has joined the game")
        end
    end)
end
```

See also:

- [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerId|DataModel.PrivateServerId]], a property describing the unique ID of private and [[30 Official Roblox Docs/API Reference/Classes/TeleportService#ReserveServerAsync|reserved servers]]

*Code samples for this member (`detecting-private-servers`) are published on the source page; their code is not part of the open-source repo.*

### RunService

**Type:** [[30 Official Roblox Docs/API Reference/Classes/RunService|RunService]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

A reference to the [[30 Official Roblox Docs/API Reference/Classes/RunService|RunService]] service. Always points to [[30 Official Roblox Docs/API Reference/Classes/RunService|RunService]] and is never `nil`. You can also retrieve it with [[30 Official Roblox Docs/API Reference/Classes/ServiceProvider#GetService|GetService()]], for example `game:GetService("RunService")`.

### VIPServerId

> [!warning] Deprecated
> This property has been deprecated. Use `Class.DataModel.PrivateServerId`
> instead.

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`, `Deprecated`

This property was string that could identify the current server as a private server.

### VIPServerOwnerId

> [!warning] Deprecated
> This property has been deprecated. Use
> `Class.DataModel.PrivateServerOwnerId` instead.

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`, `Deprecated`

This property indicates the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] of the account who owns the private server.

### Workspace

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

This property is a reference to the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] service. It always points to [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] and will never be `nil`.

### workspace

> [!warning] Deprecated
> This deprecated property is a variant of `Class.DataModel.Workspace` which
> should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

## Methods

### BindToClose

```lua
DataModel:BindToClose(function: Function): ()
```

**Thread safety:** Unsafe

Binds a function to be called before the server shuts down. If the bound function accepts a parameter, it passes [[30 Official Roblox Docs/API Reference/Enums/CloseReason|Enum.CloseReason]] specifying the reason for the server shutdown.

You can bind multiple functions by calling [[30 Official Roblox Docs/API Reference/Classes/DataModel#BindToClose|BindToClose()]] repeatedly. Bound functions are called in parallel and run at the same time.

The experience server waits 30 seconds for all bound functions to stop running before it shuts down. After 30 seconds, the server shuts down even if functions are still running. Teleports are disabled during moderation shutdowns.

To verify that the current session is not in Roblox Studio, use [[30 Official Roblox Docs/API Reference/Classes/RunService#IsStudio|RunService:IsStudio()]]. This prevents bound functions from completing their run in offline testing sessions.

When you use [[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]], you should also use `BindToClose` to bind a function saving all unsaved data to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|DataStores]]. This prevents data loss if the server shuts down unexpectedly.

See also:

- [[30 Official Roblox Docs/API Reference/Enums/CloseReason|Enum.CloseReason]] for reasons for the experience server shutdown.
- [[30 Official Roblox Docs/API Reference/Classes/PluginGui#BindToClose|PluginGui:BindToClose()]], which binds a function to a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] close button.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `function` | Function |  | A function called before the experience server shuts down. If the bound function accepts a parameter, it passes [[30 Official Roblox Docs/API Reference/Enums/CloseReason\|Enum.CloseReason]] specifying the reason for the server shutdown. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`saving-player-data-before-shutting-down`, `DataModel-BindToClose1`) are published on the source page; their code is not part of the open-source repo.*

### GetJobsInfo

```lua
DataModel:GetJobsInfo(): Array
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns a table containing basic information about the jobs performed by the task scheduler.

In computing, a task scheduler is a system responsible for executing key tasks at the appropriate intervals.

You can also find live task scheduler statistics in the Task Scheduler window in Roblox Studio.

The first entry in the table returned is a reference dictionary containing the statistics (or headings) available. It is in the following format:

```lua
{
    ["name"] = "name",
    ["averageDutyCycle"] = "averageDutyCycle",
    ["averageStepsPerSecond"] = "averageStepsPerSecond",
    ["averageStepTime"] = "averageStepTime",
    ["averageError"] = "averageError",
    ["isRunning"] = "isRunning",
}
```

The subsequent entries in the table returned are dictionaries containing the above statistics for jobs performed by the task scheduler. For example:

```lua
{
    ["name"] = "Heartbeat",
    ["averageDutyCycle"] = 0,
    ["averageStepsPerSecond"] = 0,
    ["averageStepTime"] = 0,
    ["averageError"] = 0,
    ["isRunning"] = false,
}
```

See also:

- [[30 Official Roblox Docs/API Reference/Classes/TaskScheduler|TaskScheduler]]

**Returns**

| Type | Description |
| --- | --- |
| Array | A table containing information about the jobs performed by the task scheduler, see above for the format. |

*Code samples for this member (`DataModel-GetJobsInfo1`) are published on the source page; their code is not part of the open-source repo.*

### GetMessage

> [!warning] Deprecated
> This item is deprecated since the system was phased out a very long time
> ago, and recently the APIs for setting this message were removed.

```lua
DataModel:GetMessage(): string
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

This function will always return a blank string. It was originally used to set the message displayed on screen while the game was loading.

This system was phased out a very long time ago, and recently the APIs for setting this message were removed.

**Returns**

| Type | Description |
| --- | --- |
| string |  |

### GetObjects

> [!warning] Deprecated
> This item is deprecated. Do not use it for new work.

```lua
DataModel:GetObjects(url: ContentId): Instances
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This method returns an array of [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] associated with the given content URL. It can be used to insert content from the Roblox library. It's not possible to insert [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] using this method as they do not have an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] associated with them and have only a content URL.

Unlike [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset|InsertService:LoadAsset()]], `DataModel:GetObjects()` does not require an asset to be "trusted," meaning that an asset doesn't need to be owned by the logged in user, or created by Roblox, to be inserted. However, if the asset is not owned by the logged in user it must be freely available.

Due to this function's security context it can only be used by plugins or the command bar. For an alternative that can be used in [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] and [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]], see [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset|InsertService:LoadAsset()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `url` | ContentId |  | The given content URL. |

**Returns**

| Type | Description |
| --- | --- |
| Instances | An array of [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instances]] associated with the content URL. |

*Code samples for this member (`view-a-plugin-s-source-code`, `batch-convert-decal-web-urls-to-image-content-ids`) are published on the source page; their code is not part of the open-source repo.*

### GetRemoteBuildMode

> [!warning] Deprecated
> This item is deprecated. Use `Class.RunService:IsServer()` to see if your
> code is running on the server.

```lua
DataModel:GetRemoteBuildMode(): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

This method is no longer useful and will always return false. Use [[30 Official Roblox Docs/API Reference/Classes/RunService#IsServer|RunService:IsServer()]] to see if your code is running on the server.

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### IsGearTypeAllowed

> [!warning] Deprecated
> This property is deprecated and is no longer functional. It should not be
> used.

```lua
DataModel:IsGearTypeAllowed(gearType: GearType): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Currently this function only returns the correct value on the client

This function returns whether gear of the given [[30 Official Roblox Docs/API Reference/Enums/GearType|Enum.GearType]] is permitted to be added to [[30 Official Roblox Docs/API Reference/Classes/Player|Players']] [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGears]]. For example:

```lua
local meleeWeaponsAllowed = game:IsGearTypeAllowed(Enum.GearType.MeleeWeapons)
```

Whether gear of a specific [[30 Official Roblox Docs/API Reference/Enums/GearType|Enum.GearType]] is permitted in the game is determined in a place's settings page under 'Permissions'. Note, all of a gear's associated [[30 Official Roblox Docs/API Reference/Enums/GearType|GearTypes]] must be enabled for it to be permitted in a place.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `gearType` | [[30 Official Roblox Docs/API Reference/Enums/GearType\|GearType]] |  | The given [[30 Official Roblox Docs/API Reference/Enums/GearType\|Enum.GearType]]. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether gear of the given [[30 Official Roblox Docs/API Reference/Enums/GearType\|Enum.GearType]] is permitted in the game. |

### IsLoaded

```lua
DataModel:IsLoaded(): boolean
```

**Thread safety:** Unsafe

When all initial [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] in the game have finished replicating to the client, this function returns true.

Unless they are parented to [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]], [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] do not run until the game has loaded. The following snippet, run from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] yields until the game has loaded:

```lua
if not game:IsLoaded() then
    game.Loaded:Wait()
end
```

See also:

- [[30 Official Roblox Docs/Scripting/Properties and attributes#Replication order|Replication order]] for a more detailed summary of the loading process.
- [[30 Official Roblox Docs/API Reference/Classes/DataModel#Loaded|DataModel.Loaded]], an event that fires when the game has loaded
- [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|Instance:WaitForChild()]], a function which can be used to wait for an individual [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] to replicate without having to wait for the whole game to finish loading.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the client has finished loading the game for the first time. |

*Code samples for this member (`Custom-Loading-Screen`) are published on the source page; their code is not part of the open-source repo.*

### SavePlace

> [!warning] Deprecated
> This item is deprecated. Do not use it for new work.

```lua
DataModel:SavePlace(saveFilter: SaveFilter = SaveAll): boolean
```

**Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

This function was used by an ancient data persistence method to save the current place.

Note:

- In order for this method to work the save place API has to be enabled for the current place.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `saveFilter` | [[30 Official Roblox Docs/API Reference/Enums/SaveFilter\|SaveFilter]] | `SaveAll` |  |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### SetPlaceId

```lua
DataModel:SetPlaceId(placeId: int64): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This function sets the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId|DataModel.PlaceId]] of the game instance to the given `placeId`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `placeId` | int64 |  | The ID to set the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|DataModel.PlaceId]] to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetUniverseId

```lua
DataModel:SetUniverseId(universeId: int64): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

This function sets the [[30 Official Roblox Docs/API Reference/Classes/DataModel#GameId|DataModel.GameId]] of the current game instance to the given `universeId`. This is useful when testing local .rbxl files that have not been published to Roblox.

To access the [[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]] in an unpublished place, both [[30 Official Roblox Docs/API Reference/Classes/DataModel#SetUniverseId|DataModel:SetUniverseId()]] and [[30 Official Roblox Docs/API Reference/Classes/DataModel#SetPlaceId|DataModel:SetPlaceId()]] must be set.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `universeId` | int64 |  | The ID to set the [[30 Official Roblox Docs/API Reference/Classes/DataModel#GameId\|DataModel.GameId]] to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### AllowedGearTypeChanged

> [!warning] Deprecated
> This item is deprecated . Do not use it for new work.

```lua
DataModel.AllowedGearTypeChanged()
```

**Tags:** `Deprecated`

This event fires when SetGearSettings is called with a different value for `allowedGenres`.

### GraphicsQualityChangeRequest

```lua
DataModel.GraphicsQualityChangeRequest(betterQuality: boolean)
```

Fires when the user prompts an increase or decrease in graphics quality using the hotkeys.

This event fires under the following conditions:

- If the user presses <kbd>F10</kbd>, this event fires with a `betterQuality` argument of `true`.
- If the user presses <kbd>Shift</kbd><kbd>F10</kbd>, this event fires with a `betterQuality` argument of `false`.

This event does not provide the current graphics quality level or cover all updates to the graphics quality. For example, changes made in the core GUI escape menu are not registered.

You can retrieve a user's [[30 Official Roblox Docs/API Reference/Enums/SavedQualitySetting|Enum.SavedQualitySetting]] using [[30 Official Roblox Docs/API Reference/Classes/UserGameSettings|UserGameSettings]] with the following snippet:

```lua
UserSettings():GetService("UserGameSettings").SavedQualityLevel
```

If the user's graphics settings are set to automatic then the [[30 Official Roblox Docs/API Reference/Enums/SavedQualitySetting|Enum.SavedQualitySetting]] will be [[30 Official Roblox Docs/API Reference/Enums/SavedQualitySetting|Automatic]]. There is currently no way for developers to reliably get the current graphics quality level of a user's machine.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `betterQuality` | boolean |  | Whether the user has prompted an increase (_true_) or a decrease (_false_) in graphics quality. |

*Code samples for this member (`DataModel-GraphicsQualityChangeRequest1`) are published on the source page; their code is not part of the open-source repo.*

### ItemChanged

> [!warning] Deprecated
> This function has been superseded by `Class.Object.Changed`, which should
> be used in new work instead.

```lua
DataModel.ItemChanged(object: Instance, descriptor: string)
```

**Tags:** `Deprecated`

This event fires when a property of any object in the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] is changed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `object` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |
| `descriptor` | string |  |  |

*Code samples for this member (`DataModel-ItemChanged1`) are published on the source page; their code is not part of the open-source repo.*

### Loaded

```lua
DataModel.Loaded()
```

This event fires on the client when all initial [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] in the game have finished replicating to the client.

Unless they are parented to [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]], [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] do not run until the game has loaded. The following snippet, run from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] yields until the game has loaded:

```lua
if not game:IsLoaded() then
    game.Loaded:Wait()
end
```

See also:

- [[30 Official Roblox Docs/Scripting/Properties and attributes#Replication order|Replication order]] for a more detailed summary of the loading process.
- [[30 Official Roblox Docs/API Reference/Classes/DataModel#Loaded|DataModel.Loaded]], an event that fires when the game has loaded
- [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|Instance:WaitForChild()]], a function which can be used to wait for an individual [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] to replicate without having to wait for the whole game to finish loading.

### ServerRestartScheduled

```lua
DataModel.ServerRestartScheduled(restartTime: DateTime, source: CloseReason, attributes: Dictionary)
```

**Capabilities:** ServerCommunication

Fires when the server has been scheduled to restart, for example when you restart servers from the Creator Hub or [Open Cloud](https://create.roblox.com/docs/cloud/reference/features/universes#Restarts_LaunchRestart) to [[30 Official Roblox Docs/Projects/Release game updates|release an experience update]], or when Roblox needs to restart servers for infrastructure maintenance.

You can use this event to inform players on the server of the impending restart. You could then let them save their progress or teleport them to updated servers at the most convenient time for your game.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `restartTime` | [[30 Official Roblox Docs/API Reference/Datatypes/DateTime\|DateTime]] |  | A [[30 Official Roblox Docs/API Reference/Datatypes/DateTime\|DateTime]] indicating when the server is scheduled to shut down. The actual restart may happen slightly after this projected time, but not before. |
| `source` | [[30 Official Roblox Docs/API Reference/Enums/CloseReason\|CloseReason]] |  | An [[30 Official Roblox Docs/API Reference/Enums/CloseReason\|Enum.CloseReason]] describing what triggered the restart. The value will be [[30 Official Roblox Docs/API Reference/Enums/CloseReason\|Enum.CloseReason.DeveloperUpdate]] for experience updates, and [[30 Official Roblox Docs/API Reference/Enums/CloseReason\|Enum.CloseReason.RobloxMaintenance]] for server maintenance updates. |
| `attributes` | Dictionary |  | A dictionary of developer-supplied metadata associated with the restart. If no attributes are provided, then this will be an empty table. |

*Code samples for this member (`DataModel-ServerRestartScheduled1`) are published on the source page; their code is not part of the open-source repo.*

## Callbacks

### OnClose

> [!warning] Deprecated
> This function is deprecated. It is recommended to use
> `Class.DataModel:BindToClose()` instead.

```lua
DataModel.OnClose(): Tuple
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Invoked before the game is shut down. When this callback returns, or the timeout period is hit, the game finishes shutting down.

**Returns**

| Type | Description |
| --- | --- |
| Tuple |  |

*Code samples for this member (`DataModel-OnClose1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [DataModel](https://create.roblox.com/docs/reference/engine/classes/DataModel) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
