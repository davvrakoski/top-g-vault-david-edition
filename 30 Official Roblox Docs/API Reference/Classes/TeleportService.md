---
title: "TeleportService"
description: "Enables transporting `Players` between places and servers. For more information on how to teleport players between servers, see Teleport between places."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TeleportService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Enables transporting [[30 Official Roblox Docs/API Reference/Classes/Player|Players]] between places and servers. For more information on how to teleport players between servers, see [[30 Official Roblox Docs/Projects/Teleport between places|Teleport between places]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

**TeleportService** is responsible for transporting [[30 Official Roblox Docs/API Reference/Classes/Player|Players]] between different places and servers.

For more information on how to teleport players between servers, see [[30 Official Roblox Docs/Projects/Teleport between places|Teleport between places]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#CustomizedTeleportUI\|CustomizedTeleportUI]] | boolean | **Deprecated.** No longer functional. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetArrivingTeleportGui\|GetArrivingTeleportGui()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns the _customLoadingScreen_ the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|LocalPlayer]] arrived into the place with. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetLocalPlayerTeleportData\|GetLocalPlayerTeleportData()]] | Variant | Returns the _teleportData_ the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]] arrived into the place with. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetPlayerPlaceInstanceAsync\|GetPlayerPlaceInstanceAsync()]] | Tuple | Returns the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|PlaceId]] and [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId\|JobId]] of the server the user with the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] is in provided it is in the same game as the current place. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetTeleportSetting\|GetTeleportSetting()]] | Variant | Retrieves a teleport setting saved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#SetTeleportSetting\|TeleportService:SetTeleportSetting()]] using the given key. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#PromptExperienceDetailsAsync\|PromptExperienceDetailsAsync()]] | [[30 Official Roblox Docs/API Reference/Enums/PromptExperienceDetailsResult\|PromptExperienceDetailsResult]] | Prompts a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] with information about the specified experience. The player can choose to teleport to the target experience through the prompt. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#ReserveServer\|ReserveServer()]] | Tuple | **Deprecated.** Returns an access code that can be used to teleport players to a reserved server, along with the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerId\|DataModel.PrivateServerId]] for it. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#ReserveServerAsync\|ReserveServerAsync()]] | Tuple | Returns an access code that can be used to teleport players to a reserved server, along with the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerId\|DataModel.PrivateServerId]] for it. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#SetTeleportGui\|SetTeleportGui()]] | () | Sets the custom [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|teleport GUI]] that will be shown to the local user during teleportation, prior to the teleport being invoked. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#SetTeleportSetting\|SetTeleportSetting()]] | () | Stores a value under a given key that persists across all teleportations in the same game. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#Teleport\|Teleport()]] | () | **Deprecated.** Teleports a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to the place associated with the given `placeId`. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync\|TeleportAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The all-encompassing method to teleport a player or group of players from one server to another. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportPartyAsync\|TeleportPartyAsync()]] | string | **Deprecated.** Teleports a group of [[30 Official Roblox Docs/API Reference/Classes/Player\|Players]] to the same server of the place with the given [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|PlaceId]], returning the [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId\|JobId]] of the server instance they were teleported to. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportToPlaceInstance\|TeleportToPlaceInstance()]] | () | **Deprecated.** Teleports a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to the server instance associated with the given _placeId_ and _instanceId_. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportToPrivateServer\|TeleportToPrivateServer()]] | () | **Deprecated.** Teleport a group of [[30 Official Roblox Docs/API Reference/Classes/Player\|Players]] to a reserved server created using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#ReserveServerAsync\|TeleportService:ReserveServerAsync()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportToSpawnByName\|TeleportToSpawnByName()]] | () | **Deprecated.** A variant of [[30 Official Roblox Docs/API Reference/Classes/TeleportService#Teleport\|TeleportService:Teleport()]] that causes the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to spawn at a [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]] of the given name at the destination place. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#LocalPlayerArrivedFromTeleport\|LocalPlayerArrivedFromTeleport]] | `loadingGui`, `dataTable` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|LocalPlayer]] enters the place following a teleport. |
| [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportInitFailed\|TeleportInitFailed]] | `player`, `teleportResult`, `errorMessage`, `placeId`, `teleportOptions` | Fires when a teleport fails to start, leaving the player in their current server. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CustomizedTeleportUI

> [!warning] Deprecated
> This item is deprecated since the default message it controls has been
> removed. Do not use it for new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Teleport · **Tags:** `NotReplicated`, `Deprecated`

This property used to control whether or not a [[30 Official Roblox Docs/API Reference/Classes/Message|Message]] would be shown by default. The default message has been removed, so this no longer does anything.

## Methods

### GetArrivingTeleportGui

```lua
TeleportService:GetArrivingTeleportGui(): Instance
```

**Thread safety:** Unsafe · **Capabilities:** UI, Teleport

This function returns the _customLoadingScreen_ the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|LocalPlayer]] arrived into the place with.

Note, the _customLoadingScreen_ will not be used if the destination place is in a different game.

#### Loading Screen

During a teleport, while the destination place is loading, the _customLoadingScreen_ is parented to the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]]. Once the place has loaded the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|loading screen]] is [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|parented]] to _nil_.

If you wish to preserve the _customLoadingScreen_ and perform your own transitions, you will need to parent it to the local player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]]. For an example of this, see the code sample below.

#### Studio Limitation

Note that this service does not work during playtesting in Roblox Studio; to test aspects of your experience using it, you must publish the experience and play it in the Roblox application.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The _customLoadingScreen_ the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|LocalPlayer]] arrived into the place with. |

*Code samples for this member (`handling-a-teleport-loading-gui`) are published on the source page; their code is not part of the open-source repo.*

### GetLocalPlayerTeleportData

```lua
TeleportService:GetLocalPlayerTeleportData(): Variant
```

**Thread safety:** Unsafe · **Capabilities:** Teleport

This function returns the teleport data the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] arrived with. It can only be called from the client.

Exploiters can spoof teleport data. Send secure data such as player currency through a server-side service such as [[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]] to prevent tampering.

**Returns**

| Type | Description |
| --- | --- |
| Variant | The teleport data the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]] arrived into the place with. |

*Code samples for this member (`getting-LocalPlayer-teleport-data`) are published on the source page; their code is not part of the open-source repo.*

### GetPlayerPlaceInstanceAsync

```lua
TeleportService:GetPlayerPlaceInstanceAsync(userId: User): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Teleport · **Tags:** `Yields`

This function returns the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId|PlaceId]] and [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId|JobId]] of the server the user with the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] is in, provided it is in the same game as the current place.

Then, [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportToPlaceInstance|TeleportService:TeleportToPlaceInstance()]] can be called with this information to allow a user to join the target user's server.

Upon a successful lookup, the function returns the following values:

| # | Name | Type | Description |
| --- | --- | --- | --- |
| **1** | currentInstance | bool | A bool indicating if the user was found in the current instance |
| **2** | error | string | An error message in the event of the lookup failing |
| **3** | placeId | int64 | The PlaceId of the server the user is in |
| **4** | instanceId | string | The JobId of the server the user is in |

If there is a problem during lookup, such as the user being offline, an error is thrown. It is recommended that you wrap calls to this function in `pcall`.

#### Limitations

You should be aware of the following limitations when using this function:

- This function can only be called by the server.
- This function may fail to return the correct information if the user is teleporting.
- It is possible for this function to throw an error, hence developers should wrap it in a [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] (see example below)
- As this function returns the JobId of the server and not the access code returned by [[30 Official Roblox Docs/API Reference/Classes/TeleportService#ReserveServerAsync|TeleportService:ReserveServerAsync()]], the ID returned is not appropriate for use with reserved servers.

#### Studio Limitation

Note that this service does not work during playtesting in Roblox Studio; to test aspects of your experience using it, you must publish the experience and play it in the Roblox application.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | See the table above. |

*Code samples for this member (`following-a-player-in-a-universe`) are published on the source page; their code is not part of the open-source repo.*

### GetTeleportSetting

```lua
TeleportService:GetTeleportSetting(setting: string): Variant
```

**Thread safety:** Unsafe · **Capabilities:** Teleport

This function retrieves a teleport setting saved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#SetTeleportSetting|TeleportService:SetTeleportSetting()]] using the given key.

This method is intended for use on the client only and should not be used on the server.

Teleport settings are preserved across teleportations within the same game. This means data can be saved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#SetTeleportSetting|TeleportService:SetTeleportSetting()]] in one place and retrieved using GetTeleportSetting in another place the user has been teleported to.

For example, in a game that allowed crouching you could save whether the user is currently crouching prior to teleporting as a teleport setting. This could then be retrieved in the destination place after the teleportation:

```lua
local TeleportService = game:GetService("TeleportService")

local isCrouching = TeleportService:GetTeleportSetting("isCrouching")
```

If no teleport setting exists under the given key, this function will return _nil_.

#### Differences from GlobalDataStores

Although they share some similarities, there are some key differences between teleport settings and datastores:

- [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|GlobalDataStore:SetAsync()]] stores the data on Roblox servers whereas SetTeleportSetting stores the data locally
- Data stored in a [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStore]] is preserved after the user leaves the game universe whereas teleport settings are not
- [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStores]] can only be accessed on the server, whereas teleport settings can only be accessed on the client
- [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStores]] have usage limits, whereas teleport settings do not

In general teleport settings should be used to preserve client side information within a single play session across different places in a game. [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStores]] should be used to save important player data that needs to be accessed across player sessions.

#### Teleport settings and security

As teleport settings are stored locally, it is possible they can be manipulated by malicious users. This risk can be mitigated by employing server side validation.

#### Studio Limitation

Note that this service does not work during playtesting in Roblox Studio; to test aspects of your experience using it, you must publish the experience and play it in the Roblox application.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `setting` | string |  | The key the value was stored under using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#SetTeleportSetting\|TeleportService:SetTeleportSetting()]]. |

**Returns**

| Type | Description |
| --- | --- |
| Variant | The value stored under the given key. |

### PromptExperienceDetailsAsync

```lua
TeleportService:PromptExperienceDetailsAsync(player: Player, universeId: int64): PromptExperienceDetailsResult
```

**Thread safety:** Unsafe · **Capabilities:** Teleport · **Tags:** `Yields`

Prompts the specified [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] with information of the specified experience. The prompt includes the experience name, creator name, maturity rating, etc. The prompt also includes a **Join** button which the player can use to be teleported to the target experience. If the player is ineligible to join the target experience, the button will be disabled.

Any teleport failures after the player clicks the **Join** button will also fire [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportInitFailed|TeleportService.TeleportInitFailed]] providing a reason for the failure.

#### Limitations

- For security purposes, teleporting a user from your experience to another experience owned by others fails by default. See [[30 Official Roblox Docs/Projects/Teleport between places|here]] for steps to enable cross-experience teleportation.
- This function currently can only be called from the client with [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] as the `player` parameter.
- The join button will always be disabled during Studio playtesting; to test aspects of your experience using it, you must publish the experience and play it in the Roblox application.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to be presented the prompt. |
| `universeId` | int64 |  | [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel.UniverseId]] of the experience to be presented to the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/PromptExperienceDetailsResult\|PromptExperienceDetailsResult]] | [[30 Official Roblox Docs/API Reference/Enums/PromptExperienceDetailsResult\|Enum.PromptExperienceDetailsResult]] |

*Code samples for this member (`present-experience-details-page`) are published on the source page; their code is not part of the open-source repo.*

### ReserveServer

> [!warning] Deprecated
> Use `Class.TeleportService:ReserveServerAsync()|ReserveServerAsync()`
> instead.

```lua
TeleportService:ReserveServer(placeId: int64): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Teleport · **Tags:** `Yields`, `Deprecated`

Returns an access code that can be used to teleport players to a reserved server, along with the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerId|DataModel.PrivateServerId]] for it.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `placeId` | int64 |  | The [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|DataModel.PlaceId]] of the place the reserved server is being created for. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The server access code required by [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportToPrivateServer\|TeleportService:TeleportToPrivateServer()]] and the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerId\|DataModel.PrivateServerId]] for the reserved server. |

*Code samples for this member (`TeleportService-ReserveServer1`, `teleportservice-teleport-to-a-reserved-server-via-chat`) are published on the source page; their code is not part of the open-source repo.*

### ReserveServerAsync

```lua
TeleportService:ReserveServerAsync(placeId: int64): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Teleport · **Tags:** `Yields`

This function returns an access code that can be used to teleport players to a reserved server, along with the server's [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerId|DataModel.PrivateServerId]]. It can only be called on the server.

#### Reserved Servers

You can access reserved servers using:

- [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportService:TeleportAsync()]] with the [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions#ReservedServerAccessCode|TeleportOptions.ReservedServerAccessCode]] parameter.
- [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportToPrivateServer|TeleportService:TeleportToPrivateServer()]], with the access code `ReserveServerAsync` returns.
  - A server is started when the access code is first used.
  - Access codes remain valid indefinitely, meaning reserved servers can still be joined if no game server is running (in this case a new server will be started).

You can see if the current server is a reserved server by using the following code:

```lua
local isReserved = game.PrivateServerId ~= "" and game.PrivateServerOwnerId == 0
```

The [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerId|DataModel.PrivateServerId]] is constant across all server instances associated with the server access code, the [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId|DataModel.JobId]] is not.

#### Studio Limitation

Note that this service does not work during playtesting in Roblox Studio; to test aspects of your experience using it, you must publish the experience and play it in the Roblox application.

#### Cross-Platform Play

Players on Xbox and PlayStation with cross‑play disabled will arrive in a different server than players with cross‑play enabled. This can cause multiple game servers with the same [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerId|PrivateServerId]] to exist. You can use [[30 Official Roblox Docs/API Reference/Classes/DataModel#MatchmakingType|DataModel.MatchmakingType]] to differentiate these game servers.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `placeId` | int64 |  | The [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|DataModel.PlaceId]] of the place the reserved server is being created for. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The server access code required by [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportToPrivateServer\|TeleportService:TeleportToPrivateServer()]] and the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerId\|DataModel.PrivateServerId]] for the reserved server. |

*Code samples for this member (`TeleportService-ReserveServer1`, `teleportservice-teleport-to-a-reserved-server-via-chat`) are published on the source page; their code is not part of the open-source repo.*

### SetTeleportGui

```lua
TeleportService:SetTeleportGui(gui: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI, Teleport

This function sets the custom [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|teleport GUI]] that will be shown to the local user during teleportation, prior to the teleport being invoked.

Note, the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|teleport GUI]] will not be used if the destination place is in a different game. It will also not persist across multiple teleports and will need to be set prior to each one.

This function should only be used on the client. If the teleportation function is called from the server (as is the case with [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportService:TeleportAsync()]]) then this function should be called on the client prior to this. One way of doing this is listening to a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] that fires several seconds before teleportation.

#### Loading screen

During a teleport, while the destination place is loading, the _customLoadingScreen_ is parented to the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]]. Once the place has loaded the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|loading screen]] is [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|parented]] to _nil_.

This [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] can be fetched at the destination place using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetArrivingTeleportGui|TeleportService:GetArrivingTeleportGui()]], allowing you to parent it to the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] and perform your own transitions.

You are advised to also [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|parent]] the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] to the [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] in the start place while the teleport is initiating.

#### External references

The teleport GUI and all of its descendants are carried to the destination place, but any property that references an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] **outside** the GUI's own tree is cleared during the teleport. For example, a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] inside the GUI whose [[30 Official Roblox Docs/API Reference/Classes/Sound#SoundGroup|SoundGroup]] points to a [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] under [[30 Official Roblox Docs/API Reference/Classes/SoundService|SoundService]] will arrive with that reference set to `nil`, because the target lives outside the GUI and cannot safely cross the boundary between servers.

References that point to other instances **within** the GUI tree are preserved. If your loading screen depends on an external instance, recreate that instance inside the GUI tree.

#### Studio Limitation

Note that this service does not work during playtesting in Roblox Studio; to test aspects of your experience using it, you must publish the experience and play it in the Roblox application.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `gui` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The loading [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGui]] that is to be displayed during teleportation. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`teleporting-the-local-player`) are published on the source page; their code is not part of the open-source repo.*

### SetTeleportSetting

```lua
TeleportService:SetTeleportSetting(setting: string, value: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Teleport

This function stores a value under a given key that persists across all teleportations in the same game.

This method is intended for use on the client only and should not be used on the server.

The stored value can later be retrieved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetTeleportSetting|TeleportService:GetTeleportSetting()]]. This will work in the current place and any subsequent places the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] teleports to, provided they are in the same game.

For example, in a game that allowed crouching you could save whether the user is currently crouching prior to teleporting as a teleport setting:

```lua
local TeleportService = game:GetService("TeleportService")

local isCrouching = false
TeleportService:SetTeleportSetting("isCrouching", isCrouching)
```

The stored value may only contain value types. It cannot contain [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] or other types that reference engine state, as these cannot safely cross the boundary between servers.

Allowed values:

- Primitives: a `bool`, a `number`, or a `string`
- Value types such as [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]], [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]], [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]], [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]], [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]], `Enum` items, and similar
- A table without mixed keys (all strings or all integers) containing only the allowed types above

Not allowed (these will be removed before the teleport completes):

- [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] and instance references
- [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection|Connections]], [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal|RBXScriptSignal]], and functions
- `SharedTable`
- Types that reference engine or [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] state, such as [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]], [[30 Official Roblox Docs/API Reference/Datatypes/RaycastParams|RaycastParams]], and [[30 Official Roblox Docs/API Reference/Datatypes/RaycastResult|RaycastResult]]

If a stored setting contains a disallowed type, that value is removed and an error is written to the developer console. Convert instance references to plain values (for example, a numeric ID or a string path).

If data is already stored under the given key, the previous value will be overwritten by the new value.

#### Differences from GlobalDataStores

Although they share some similarities, there are some key differences between teleport settings and datastores:

- [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|GlobalDataStore:SetAsync()]] stores the data on Roblox servers whereas SetTeleportSetting stores the data locally
- Data stored in a [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStore]] is preserved after the user leaves the game universe whereas teleport settings are not
- [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStores]] can only be accessed on the server, whereas teleport settings can only be accessed on the client
- [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStores]] have usage limits, whereas teleport settings do not

In general teleport settings should be used to preserve client side information within a single play session across different places in a game. [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStores]] should be used to save important player data that needs to be accessed across player sessions.

#### Teleport settings and security

As teleport settings are stored locally, it is possible they can be manipulated by malicious users. This risk can be mitigated by employing server side validation.

#### Studio Limitation

Note that this service does not work during playtesting in Roblox Studio; to test aspects of your experience using it, you must publish the experience and play it in the Roblox application.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `setting` | string |  | The key to store the _value_ under. This key can be used to retrieve the value using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetTeleportSetting\|TeleportService:GetTeleportSetting()]]. |
| `value` | Variant |  | The value to store. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Teleport

> [!warning] Deprecated
> Use `Class.TeleportService:TeleportAsync()|TeleportAsync()` for
> server-side teleports. For client-side teleports, use a
> `Class.RemoteEvent` to signal the server to call `TeleportAsync()`. For a
> migration guide, see
> [Teleport between places](30%20Official%20Roblox%20Docs/Projects/Teleport%20between%20places.md#migrate-to-secure-teleports).

```lua
TeleportService:Teleport(placeId: int64, player: Instance = nil, teleportData: Variant, customLoadingScreen: Instance = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI, Teleport

This method should not be used for new work; the numerous teleport functions have been combined into a single method, [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportAsync()]], which should be used instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `placeId` | int64 |  | The ID of the place to teleport to. |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to teleport, if this function is being called from the client this defaults to the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]]. |
| `teleportData` | Variant |  | Optional data to be passed to the destination place. Can be retrieved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetLocalPlayerTeleportData\|TeleportService:GetLocalPlayerTeleportData()]]. |
| `customLoadingScreen` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | Optional custom loading screen to be placed in the [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] at the destination place. Can be retrieved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetArrivingTeleportGui\|TeleportService:GetArrivingTeleportGui()]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`teleporting-the-local-player`, `teleporting-from-the-server`) are published on the source page; their code is not part of the open-source repo.*

### TeleportAsync

```lua
TeleportService:TeleportAsync(placeId: int64, players: Instances, teleportOptions: Instance = nil): Instance
```

**Thread safety:** Unsafe · **Capabilities:** UI, Teleport · **Tags:** `Yields`

This function serves as the all-encompassing method to teleport a player or group of players from one server to another. It can be used to:

- Teleport players to a different place.
- Teleport players to a specific server.
- Teleport players to a reserved server.

#### Server-Only

This method can only be called from the server. If you need to initiate a teleport from the client, use a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] to signal the server, then call [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportService:TeleportAsync()]] from a server [[30 Official Roblox Docs/API Reference/Classes/Script|Script]]. Client-side teleports using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#Teleport|TeleportService:Teleport()]] is not recommended for new work. See [[30 Official Roblox Docs/Projects/Teleport between places|Teleport between places]] for more information.

#### Group Teleport Limitations

- Groups of players can only be teleported within a single experience.
- No more than 50 players can be teleported with a single [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportService:TeleportAsync()]] call.

#### Potential Errors

This is a list of potential reasons a teleport may fail, ranging from invalid teleports to network issues.

| Error | Description |
| --- | --- |
| Invalid placeId | The provided place ID is below 0. |
| Players empty | The provided list of players to teleport is empty. |
| List of players instances is incorrect | Any of the provided players is not a Player object. |
| TeleportOptions not of correct type | The provided teleportOption is not a TeleportOptions object. |
| TeleportAsync called from Client | The client called TeleportAsync, which can only be called from the server. |
| Incompatible Parameters | Conflicting teleport options were used and TeleportService doesn't know where to send the player.<br><br> Conflicting TeleportOption parameters:<br>• ReservedServerAccessCode and ServerInstanceId<br>• ShouldReserveServer and ServerInstanceId<br>• ShouldReserveServer and ReservedServerAccessCode |

For more information on how to teleport players between servers and receive user data from a teleport, see [[30 Official Roblox Docs/Projects/Teleport between places|Teleport between places]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `placeId` | int64 |  | The place ID the player(s) should be teleported to. |
| `players` | Instances |  | An array of the player(s) to teleport. |
| `teleportOptions` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | An optional [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions\|TeleportOptions]] object containing additional arguments to the [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync\|TeleportService:TeleportAsync()]] call. If this is not passed, no result will be returned. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | If a [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions\|TeleportOptions]] parameter is passed, this will be a [[30 Official Roblox Docs/API Reference/Classes/TeleportAsyncResult\|TeleportAsyncResult]] object that provides information about the final teleport destination. |

### TeleportPartyAsync

> [!warning] Deprecated
> Use `Class.TeleportService:TeleportAsync()|TeleportAsync()` instead. For a
> migration guide, see
> [Teleport between places](30%20Official%20Roblox%20Docs/Projects/Teleport%20between%20places.md#migrate-to-secure-teleports).

```lua
TeleportService:TeleportPartyAsync(placeId: int64, players: Instances, teleportData: Variant, customLoadingScreen: Instance = nil): string
```

**Thread safety:** Unsafe · **Capabilities:** UI, Teleport · **Tags:** `Yields`, `Deprecated`

This method should not be used for new work; the numerous teleport functions have been combined into a single method, [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportAsync()]], which should be used instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `placeId` | int64 |  | The ID of the place to teleport to. |
| `players` | Instances |  | An array containing the [[30 Official Roblox Docs/API Reference/Classes/Player\|Players]] to teleport. |
| `teleportData` | Variant |  | Optional data to be passed to the destination place. Can be retrieved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetLocalPlayerTeleportData\|TeleportService:GetLocalPlayerTeleportData()]]. |
| `customLoadingScreen` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | Optional custom loading screen to be placed in the [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] at the destination place. Can be retrieved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetArrivingTeleportGui\|TeleportService:GetArrivingTeleportGui()]]. |

**Returns**

| Type | Description |
| --- | --- |
| string | The [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId\|DataModel.JobId]] of the server instance the [[30 Official Roblox Docs/API Reference/Classes/Player\|Players]] were teleported to. |

*Code samples for this member (`teleport-all-players-in-the-server`) are published on the source page; their code is not part of the open-source repo.*

### TeleportToPlaceInstance

> [!warning] Deprecated
> Use `Class.TeleportService:TeleportAsync()|TeleportAsync()` instead. For a
> migration guide, see
> [Teleport between places](30%20Official%20Roblox%20Docs/Projects/Teleport%20between%20places.md#migrate-to-secure-teleports).

```lua
TeleportService:TeleportToPlaceInstance(placeId: int64, instanceId: string, player: Instance = nil, spawnName: string, teleportData: Variant, customLoadingScreen: Instance = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI, Teleport · **Tags:** `Deprecated`

This method should not be used for new work; the numerous teleport functions have been combined into a single method, [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportAsync()]], which should be used instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `placeId` | int64 |  | The ID of the place to teleport to. |
| `instanceId` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId\|DataModel.JobId]] of the server instance to teleport to. |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to teleport, if this function is being called from the client this defaults to the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]]. |
| `spawnName` | string |  | Optional name of the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]] to spawn at. |
| `teleportData` | Variant |  | Optional data to be passed to the destination place. Can be retrieved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetLocalPlayerTeleportData\|TeleportService:GetLocalPlayerTeleportData()]]. |
| `customLoadingScreen` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | Optional custom loading screen to be placed in the [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] at the destination place. Can be retrieved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetArrivingTeleportGui\|TeleportService:GetArrivingTeleportGui()]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`following-a-player-in-a-universe`) are published on the source page; their code is not part of the open-source repo.*

### TeleportToPrivateServer

> [!warning] Deprecated
> Use `Class.TeleportService:TeleportAsync()|TeleportAsync()` instead. For a
> migration guide, see
> [Teleport between places](30%20Official%20Roblox%20Docs/Projects/Teleport%20between%20places.md#migrate-to-secure-teleports).

```lua
TeleportService:TeleportToPrivateServer(placeId: int64, reservedServerAccessCode: string, players: Instances, spawnName: string, teleportData: Variant, customLoadingScreen: Instance = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI, Teleport · **Tags:** `Deprecated`

This method should not be used for new work; the numerous teleport functions have been combined into a single method, [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportAsync()]], which should be used instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `placeId` | int64 |  | The ID of the place to teleport to. |
| `reservedServerAccessCode` | string |  | The reserved server access code returned by [[30 Official Roblox Docs/API Reference/Classes/TeleportService#ReserveServerAsync\|TeleportService:ReserveServerAsync()]]. |
| `players` | Instances |  | An array of [[30 Official Roblox Docs/API Reference/Classes/Player\|Players]] to teleport. |
| `spawnName` | string |  | Optional name of the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]] to spawn at. |
| `teleportData` | Variant |  | Optional data to be passed to the destination place. Can be retrieved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetLocalPlayerTeleportData\|TeleportService:GetLocalPlayerTeleportData()]]. |
| `customLoadingScreen` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | Optional custom loading screen to be placed in the [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] at the destination place. Can be retrieved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetArrivingTeleportGui\|TeleportService:GetArrivingTeleportGui()]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`teleportservice-teleport-to-a-reserved-server-via-chat`, `TeleportService-ReserveServer1`) are published on the source page; their code is not part of the open-source repo.*

### TeleportToSpawnByName

> [!warning] Deprecated
> Use `Class.TeleportService:TeleportAsync()|TeleportAsync()` instead. For a
> migration guide, see
> [Teleport between places](30%20Official%20Roblox%20Docs/Projects/Teleport%20between%20places.md#migrate-to-secure-teleports).

```lua
TeleportService:TeleportToSpawnByName(placeId: int64, spawnName: string, player: Instance = nil, teleportData: Variant, customLoadingScreen: Instance = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI, Teleport · **Tags:** `Deprecated`

This method should not be used for new work; the numerous teleport functions have been combined into a single method, [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportAsync()]], which should be used instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `placeId` | int64 |  | The ID of the place to teleport to. |
| `spawnName` | string |  | The name of the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]] to spawn at. |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to teleport, if this function is being called from the client this defaults to the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|Players.LocalPlayer]]. |
| `teleportData` | Variant |  | Optional data to be passed to the destination place. Can be retrieved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetLocalPlayerTeleportData\|TeleportService:GetLocalPlayerTeleportData()]]. |
| `customLoadingScreen` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | Optional custom loading screen to be placed in the [[30 Official Roblox Docs/API Reference/Classes/CoreGui\|CoreGui]] at the destination place. Can be retrieved using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetArrivingTeleportGui\|TeleportService:GetArrivingTeleportGui()]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`TeleportService-TeleportToSpawnByName1`) are published on the source page; their code is not part of the open-source repo.*

## Events

### LocalPlayerArrivedFromTeleport

```lua
TeleportService.LocalPlayerArrivedFromTeleport(loadingGui: Instance, dataTable: Variant)
```

**Capabilities:** Teleport

This function fires when the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] enters the place following a teleport. The `teleportData` and `customLoadingScreen` are provided as arguments.

When fetching _teleportData_ and the _customLoadingScreen_ you are advised to use [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetLocalPlayerTeleportData|TeleportService:GetLocalPlayerTeleportData()]] and [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetArrivingTeleportGui|TeleportService:GetArrivingTeleportGui()]] instead. This is because these functions can be called immediately without having to wait for this event to fire.

This event should be connected immediately in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] parented to [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]]. Otherwise, when the connection is made the event may have already fired.

#### Loading Screen

During a teleport, while the destination place is loading, the _customLoadingScreen_ is parented to the [[30 Official Roblox Docs/API Reference/Classes/CoreGui|CoreGui]]. Once the place has loaded the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|loading screen]] is [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|parented]] to _nil_.

If you wish to preserve the _customLoadingScreen_ and perform your own transitions, you will need to parent it to the local player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]]. For example, using the following code inside a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]]:

```lua
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")

TeleportService.LocalPlayerArrivedFromTeleport:Connect(function(customLoadingScreen, teleportData)
	local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
	ReplicatedFirst:RemoveDefaultLoadingScreen()

	customLoadingScreen.Parent = playerGui
	-- animate screen here
	wait(5)
	-- destroy screen
	customLoadingScreen:Destroy()
end)
```

The _customLoadingScreen_ will not be used if the destination place is in a different game.

#### Studio Limitation

Note that this service does not work during playtesting in Roblox Studio; to test aspects of your experience using it, you must publish the experience and play it in the Roblox application.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `loadingGui` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The _customLoadingScreen_ the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|LocalPlayer]] arrived into the place with. |
| `dataTable` | Variant |  | The _teleportData_ the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|LocalPlayer]] arrived into the place with. |

### TeleportInitFailed

```lua
TeleportService.TeleportInitFailed(player: Instance, teleportResult: TeleportResult, errorMessage: string, placeId: int64, teleportOptions: Instance)
```

**Capabilities:** Teleport

This event fires on both the client and the server when a request to teleport from a function such as [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportService:TeleportAsync()]] fails and the player does not leave the current server. It provides a reason for the failure, as well as all of the information necessary to retry the teleport. If a group teleport fails, the event will fire once per player.

#### TeleportOptions

The [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions|TeleportOptions]] object provided by this event is not identical to the one passed to the original [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync|TeleportService:TeleportAsync()]] call. It is a new object populated with the necessary parameters to retry the teleport and send the player to the exact same destination. This is especially important for facilitating group teleports when they fail.

| Original Teleport Type | Teleport Data | ReservedServerAccessCode | ServerInstanceId | ShouldReserveServer |
| --- | --- | --- | --- | --- |
| Individual player to place | Original value | None | None | false |
| Player(s) to reserved server | Original value | Original value, or the code generated if ShouldReserveServer was originally true | None | false |
| Player(s) to specific server | Original value | None | Original value | false |
| Players to place | Original value | None | Same destination ID as the other players in the original teleport | false |

For more information on how to teleport players between servers, see [[30 Official Roblox Docs/Projects/Teleport between places|Teleport between places]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] instance that failed to teleport. |
| `teleportResult` | [[30 Official Roblox Docs/API Reference/Enums/TeleportResult\|TeleportResult]] |  | The reason for the teleport failure. |
| `errorMessage` | string |  | The message provided to the player explaining the teleport failure. |
| `placeId` | int64 |  | The original target place ID of the teleport. |
| `teleportOptions` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | A [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions\|TeleportOptions]] object that can be passed back to [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync\|TeleportService:TeleportAsync()]] to retry the failed teleport. |

---
*Source: [TeleportService](https://create.roblox.com/docs/reference/engine/classes/TeleportService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
