---
title: "Player"
description: "An object that represents a presently connected client to the experience."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Player"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object that represents a presently connected client to the experience.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A `Player` object is a client that is currently connected. These objects are added to the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] service when a new player connects, then removed when they eventually disconnect from the server.

The [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]] property reflects the player's username. When saving information about a player, you should use their [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] since it is possible that a player can change their username.

There are several similar methods in the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] service for working with Player objects. Use these over their respective [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] methods:

- You can get a table of current `Player` objects using [[30 Official Roblox Docs/API Reference/Classes/Players#GetPlayers|Players:GetPlayers()]]; again, use this instead of [[30 Official Roblox Docs/API Reference/Classes/Instance#GetChildren|Instance:GetChildren()]].
- To detect the addition of `Player` objects, it is recommended to use the [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|Players.PlayerAdded]] event (instead of [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildAdded|Instance.ChildAdded]] on the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] service).
- Similarly, you can detect the removal of `Player` objects using [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerRemoving|Players.PlayerRemoving]], which fires just **before** the `Player` is removed (instead of [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildRemoved|Instance.ChildRemoved]] which fires after). This is important if you are saving information about the player that might be removed or cleaned up on removal.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Player#AccountAge\|AccountAge]] | int | Describes the player's account age in days. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#AgeChecked\|AgeChecked]] | [[30 Official Roblox Docs/API Reference/Enums/AgeCheckStatus\|AgeCheckStatus]] | Indicates whether the player has completed an age verification check. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#AutoJumpEnabled\|AutoJumpEnabled]] | boolean | Determines whether the character of a player using a mobile device will automatically jump upon hitting an obstacle. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#CameraMaxZoomDistance\|CameraMaxZoomDistance]] | float | The maximum distance the player's camera is allowed to zoom out. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#CameraMinZoomDistance\|CameraMinZoomDistance]] | float | The minimum distance the player's camera is allowed to zoom in. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#CameraMode\|CameraMode]] | [[30 Official Roblox Docs/API Reference/Enums/CameraMode\|CameraMode]] | Changes the camera's mode to either first or third person. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#CanLoadCharacterAppearance\|CanLoadCharacterAppearance]] | boolean | Determines whether the character's appearance will be loaded when the player spawns. If `false`, the player will spawn with a default appearance. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Character]] | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] | A [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] controlled by the player that contains a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]], body parts, scripts, and other objects. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAppearance\|CharacterAppearance]] | string | **Deprecated.** The URL of the asset containing the character's appearance, clothing, and gear. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAppearanceId\|CharacterAppearanceId]] | int64 | Determines the user ID of the account whose character appearance is used for a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Character]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#DataComplexity\|DataComplexity]] | int | **Deprecated.** The total amount of data currently being stored in the player's cache on the current place. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#DataReady\|DataReady]] | boolean | **Deprecated.** Indicates when the player's data is available to load. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#DevCameraOcclusionMode\|DevCameraOcclusionMode]] | [[30 Official Roblox Docs/API Reference/Enums/DevCameraOcclusionMode\|DevCameraOcclusionMode]] | Sets how the default camera handles objects between the camera and the player. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#DevComputerCameraMode\|DevComputerCameraMode]] | [[30 Official Roblox Docs/API Reference/Enums/DevComputerCameraMovementMode\|DevComputerCameraMovementMode]] | Determines player's camera movement mode when using a device with a mouse and keyboard. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#DevComputerMovementMode\|DevComputerMovementMode]] | [[30 Official Roblox Docs/API Reference/Enums/DevComputerMovementMode\|DevComputerMovementMode]] | Determines player's character movement mode when using a device with a mouse and keyboard. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#DevEnableMouseLock\|DevEnableMouseLock]] | boolean | Determines if the player can toggle mouse lock. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#DevTouchCameraMode\|DevTouchCameraMode]] | [[30 Official Roblox Docs/API Reference/Enums/DevTouchCameraMovementMode\|DevTouchCameraMovementMode]] | Determines player's camera movement mode when using a touch-enabled device. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#DevTouchMovementMode\|DevTouchMovementMode]] | [[30 Official Roblox Docs/API Reference/Enums/DevTouchMovementMode\|DevTouchMovementMode]] | Determines player's character movement mode when using a touch-enabled device. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName\|DisplayName]] | string | The display name of the authenticated user associated with the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#FollowUserId\|FollowUserId]] | int64 | Describes the user ID of the player who was followed into an experience by a player. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#FrustumStreaming\|FrustumStreaming]] | [[30 Official Roblox Docs/API Reference/Enums/FrustumStreamingMode\|FrustumStreamingMode]] | Controls the engine's instance streaming behavior for the player's camera view. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#GameplayPaused\|GameplayPaused]] | boolean | Whether player client-side gameplay is currently paused. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#HasRobloxSubscription\|HasRobloxSubscription]] | boolean | Indicates whether the player has an active Roblox subscription. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#HasVerifiedBadge\|HasVerifiedBadge]] | boolean | Indicates if a player has a **Verified** badge. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#HealthDisplayDistance\|HealthDisplayDistance]] | float | Sets the distance at which this player will see other players' health bars. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#InputLatency\|InputLatency]] | int | Latency used by the Server Authority netcode system. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#LocaleId\|LocaleId]] | string | This property shows the locale ID that the local player has set for their Roblox account. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#MembershipType\|MembershipType]] | [[30 Official Roblox Docs/API Reference/Enums/MembershipType\|MembershipType]] | **Deprecated.** Describes the account's membership type. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#NameDisplayDistance\|NameDisplayDistance]] | float | Sets the distance at which this player will see other players' names. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral\|Neutral]] | boolean | Determines whether the player is on a specific team. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#PartyId\|PartyId]] | string | A unique identifier of the party a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] belongs to. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#ReplicationFocus\|ReplicationFocus]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Sets the part to focus replication around. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#RespawnLocation\|RespawnLocation]] | [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]] | If set, the player will respawn at the given [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#Team\|Team]] | [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]] | Determines the [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]] with which the player is associated. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor\|TeamColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | Determines the [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]] with which the player is associated with according to that team's [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor\|Team.TeamColor]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#ThirdPartyTextChatRestrictionStatus\|ThirdPartyTextChatRestrictionStatus]] | [[30 Official Roblox Docs/API Reference/Enums/ChatRestrictionStatus\|ChatRestrictionStatus]] | A read-only value reflecting the player's text-chat restriction status as reported by a third-party platform. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#User\|User]] | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] | The [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] representing this player's domain-scoped identity within the current experience. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] | int64 | A unique identifying integer assigned to all user accounts. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#userId\|userId]] | int64 | **Deprecated.**  |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Player#AddReplicationFocus\|AddReplicationFocus()]] | () | Adds an additional replication focus for the player. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#ClearCachedAvatarAppearance\|ClearCachedAvatarAppearance()]] | () | Clears the cached avatar appearance for the player, forcing a fresh fetch from the backend on the next respawn. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#ClearCharacterAppearance\|ClearCharacterAppearance()]] | () | Removes all accessories and other character appearance objects from a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Character]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#DistanceFromCharacter\|DistanceFromCharacter()]] | float | Returns the distance between the character's head and the given [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]], or `0` if the player has no character. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#GetCameraState\|GetCameraState()]] | CameraState | Returns a dictionary containing the player's current camera state. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#GetFriendsOnline\|GetFriendsOnline()]] | Array | **Deprecated.** Returns a dictionary of online friends. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#GetFriendsOnlineAsync\|GetFriendsOnlineAsync()]] | Array | Returns a dictionary of online friends. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#GetFriendsWhoPlayedAsync\|GetFriendsWhoPlayedAsync()]] | Array | Returns the user IDs of friends who have previously joined this experience. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData\|GetJoinData()]] | Dictionary | Returns a dictionary containing information describing how the player joins the experience. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#GetMouse\|GetMouse()]] | [[30 Official Roblox Docs/API Reference/Classes/Mouse\|Mouse]] | Returns the mouse being used by the client. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#GetNetworkPing\|GetNetworkPing()]] | float | Returns the round-trip, isolated network latency in seconds. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#GetRankInGroup\|GetRankInGroup()]] | int | **Deprecated.** Returns the player's rank in the group as an integer. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#GetRankInGroupAsync\|GetRankInGroupAsync()]] | int | **Deprecated.** Returns the player's rank in the group as an integer. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#GetRoleInGroup\|GetRoleInGroup()]] | string | **Deprecated.** Returns the player's role in the group as a string, or `Guest` if the player isn't part of the group. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#GetRoleInGroupAsync\|GetRoleInGroupAsync()]] | string | **Deprecated.** Returns the player's role in the group as a string, or `Guest` if the player isn't part of the group. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#HasAppearanceLoaded\|HasAppearanceLoaded()]] | boolean | Returns whether or not the appearance of the player's character has loaded. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#IsBestFriendsWith\|IsBestFriendsWith()]] | boolean | **Deprecated.** Returns whether a player is friends with the specified user. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#IsFriendsWith\|IsFriendsWith()]] | boolean | **Deprecated.** Checks whether a player is a friend of the user with the given |
| [[30 Official Roblox Docs/API Reference/Classes/Player#isFriendsWith\|isFriendsWith()]] | boolean | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Player#IsFriendsWithAsync\|IsFriendsWithAsync()]] | boolean | Checks whether a player is a friend of the user with the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#IsInGroup\|IsInGroup()]] | boolean | **Deprecated.** Checks whether a player is a member of a group with the given ID. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#IsInGroupAsync\|IsInGroupAsync()]] | boolean | Checks whether a player is a member of a group with the given ID. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#IsVerified\|IsVerified()]] | boolean | Returns whether the player meets the specified verification level. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#Kick\|Kick()]] | () | Forcibly disconnect a player from the experience, optionally providing a message. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#LoadBoolean\|LoadBoolean()]] | boolean | **Deprecated.** Returns a boolean value that was previously saved to the player with [[30 Official Roblox Docs/API Reference/Classes/Player#SaveBoolean\|Player:SaveBoolean()]] with the same key. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#loadBoolean\|loadBoolean()]] | boolean | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacter\|LoadCharacter()]] | () | **Deprecated.** Creates a new character for the player, removing the old one. Also clears the player's [[30 Official Roblox Docs/API Reference/Classes/Backpack\|Backpack]] and [[30 Official Roblox Docs/API Reference/Classes/PlayerGui\|PlayerGui]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAppearance\|LoadCharacterAppearance()]] | () | **Deprecated.** Places the given instance either in the player's character, head, or StarterGear based on the instance's class. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync\|LoadCharacterAsync()]] | () | Creates a new character for the player, removing the old one. Also clears the player's [[30 Official Roblox Docs/API Reference/Classes/Backpack\|Backpack]] and [[30 Official Roblox Docs/API Reference/Classes/PlayerGui\|PlayerGui]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterWithHumanoidDescription\|LoadCharacterWithHumanoidDescription()]] | () | **Deprecated.** Spawns a player character with everything equipped in the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterWithHumanoidDescriptionAsync\|LoadCharacterWithHumanoidDescriptionAsync()]] | () | Spawns a player character with everything equipped in the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#LoadInstance\|LoadInstance()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** Returns an instance that was previously saved to the player with [[30 Official Roblox Docs/API Reference/Classes/Player#SaveInstance\|Player:SaveInstance()]] with the same key. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#loadInstance\|loadInstance()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Player#LoadNumber\|LoadNumber()]] | double | **Deprecated.** Returns a number value that was previously saved to the player. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#loadNumber\|loadNumber()]] | double | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Player#LoadString\|LoadString()]] | string | **Deprecated.** Returns a string value that was previously saved to the player. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#loadString\|loadString()]] | string | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Player#Move\|Move()]] | () | Causes the player's character to walk in the given direction until stopped, or interrupted by the player (by using their controls). |
| [[30 Official Roblox Docs/API Reference/Classes/Player#PromptAgeCheck\|PromptAgeCheck()]] | () | Prompts the player to complete age verification. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#RemoveReplicationFocus\|RemoveReplicationFocus()]] | () | Removes a previously added replication focus. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#RequestStreamAroundAsync\|RequestStreamAroundAsync()]] | () | Requests that the server stream to the player around the specified location. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#SaveBoolean\|SaveBoolean()]] | () | **Deprecated.** Used to save a boolean value that can be loaded again at a later time using [[30 Official Roblox Docs/API Reference/Classes/Player#LoadBoolean\|Player:LoadBoolean()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#saveBoolean\|saveBoolean()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Player#SaveInstance\|SaveInstance()]] | () | **Deprecated.** Saves an instance which can be loaded again at a later time. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#saveInstance\|saveInstance()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Player#SaveNumber\|SaveNumber()]] | () | **Deprecated.** Saves a number value that can be loaded again at a later time using. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#saveNumber\|saveNumber()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Player#SaveString\|SaveString()]] | () | **Deprecated.** Saves a string value that can be loaded again at a later time. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#saveString\|saveString()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Player#SetAccountAge\|SetAccountAge()]] | () | Sets the [[30 Official Roblox Docs/API Reference/Classes/Player#AccountAge\|AccountAge]] of the player. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#SetSuperSafeChat\|SetSuperSafeChat()]] | () | Sets whether or not the player sees filtered chats, rather than normal chats. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#WaitForDataReady\|WaitForDataReady()]] | boolean | **Deprecated.** Used to pause the script until the player's data is available to manipulate, or until a certain amount of time has elapsed without fetching the player's data. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#waitForDataReady\|waitForDataReady()]] | boolean | **Deprecated.**  |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAdded\|CharacterAdded]] | `character` | Fires when a player's character spawns or respawns. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAppearanceLoaded\|CharacterAppearanceLoaded]] | `character` | Fires when the full appearance of a [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Character]] has been inserted. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterRemoving\|CharacterRemoving]] | `character` | Fires right before a player's character is removed. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#Chatted\|Chatted]] | `message`, `recipient` | Fires when a player chats in experience using Roblox's provided chat bar. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#Idled\|Idled]] | `time` | This event fires approximately two minutes after the engine classifies the player as idle. Time is the number of seconds that have elapsed since that point. |
| [[30 Official Roblox Docs/API Reference/Classes/Player#OnTeleport\|OnTeleport]] | `teleportState`, `placeId`, `spawnName` | Fires when the teleport state of a player changes. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AccountAge

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `ReadOnly`, `NotReplicated`

This property describes how long ago a player's account was registered in days. It is set using the [[30 Official Roblox Docs/API Reference/Classes/Player#SetAccountAge|SetAccountAge()]] method, which cannot be accessed by scripts.

### AgeChecked

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AgeCheckStatus|AgeCheckStatus]]

**Security:** read None / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players

This read-only property holds an [[30 Official Roblox Docs/API Reference/Enums/AgeCheckStatus|Enum.AgeCheckStatus]] value indicating whether the player has completed age verification. The default value is [[30 Official Roblox Docs/API Reference/Enums/AgeCheckStatus|Enum.AgeCheckStatus.Unchecked]]. It transitions to [[30 Official Roblox Docs/API Reference/Enums/AgeCheckStatus|Enum.AgeCheckStatus.Checked]] when the player passes age verification through the [[30 Official Roblox Docs/API Reference/Classes/Player#PromptAgeCheck|Player:PromptAgeCheck()]] flow.

This property is set by the server and cannot be changed by scripts.

### AutoJumpEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines whether the [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] of a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] using a mobile device will automatically jump when they hit an obstacle. This can make levels more navigable while on a mobile device.

When the player joins the experience, the [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#AutoJumpEnabled|StarterPlayer.AutoJumpEnabled]] value determines the initial state of this property. Then, this property determines the value of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AutoJumpEnabled|Humanoid.AutoJumpEnabled]] property of the [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] on spawn. In other words, it is possible to set the auto-jump behavior on a per-character, per-player, and per-experience basis using these three properties.

*Code samples for this member (`Auto-Jump-Toggle`) are published on the source page; their code is not part of the open-source repo.*

### CameraMaxZoomDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

This property sets the maximum distance the player's camera is allowed to zoom out, in studs.

The default value of this property is set by [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CameraMaxZoomDistance|StarterPlayer.CameraMaxZoomDistance]]. If this value is set to a lower value than [[30 Official Roblox Docs/API Reference/Classes/Player#CameraMinZoomDistance|CameraMinZoomDistance]], it will be increased to [[30 Official Roblox Docs/API Reference/Classes/Player#CameraMinZoomDistance|CameraMinZoomDistance]].

### CameraMinZoomDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

This property sets the minimum distance the player's camera is allowed to zoom in, in studs.

The default value of this property is set by [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CameraMinZoomDistance|StarterPlayer.CameraMinZoomDistance]]. If this value is set to a higher value than [[30 Official Roblox Docs/API Reference/Classes/Player#CameraMaxZoomDistance|CameraMaxZoomDistance]], it will be decreased to [[30 Official Roblox Docs/API Reference/Classes/Player#CameraMaxZoomDistance|CameraMaxZoomDistance]].

### CameraMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CameraMode|CameraMode]]

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

This property sets the player's camera mode, defaulting to third person.

#### Third Person

In the default third person mode ([[30 Official Roblox Docs/API Reference/Enums/CameraMode|Enum.CameraMode.Classic]]), the character can be seen in the camera. While in this mode, the default behavior is:

- Players can right-click and drag (mouse), tap and drag (mobile), use the secondary thumbstick (gamepad), or press the left/right arrows (keyboard) to rotate the camera around their character.
- When a player moves their character, it faces in the corresponding movement direction.
- Players can zoom in and out freely, even to first person on full zoom in.

#### First Person

In first person mode ([[30 Official Roblox Docs/API Reference/Enums/CameraMode|Enum.CameraMode.LockFirstPerson]]), the player's camera is zoomed all the way in. Unless there is a visible GUI present with the [[30 Official Roblox Docs/API Reference/Classes/GuiButton#Modal|GuiButton.Modal]] property set to `true`, moving the mouse, tap-dragging on mobile, or using the secondary thumbstick on a gamepad will rotate the camera around the character.

*Code samples for this member (`playing-in-first-person`) are published on the source page; their code is not part of the open-source repo.*

### CanLoadCharacterAppearance

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Capabilities:** Players

This property determines whether the character's appearance will be loaded when the player spawns. The default value of this property is set by [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer.LoadPlayerAppearance]].

- If `true`, the character will load the appearance of the player corresponding to the player's [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAppearanceId|CharacterAppearanceId]].

- If `false`, the player will spawn with a default appearance.

Attempting to set the property after the character has spawned will not change the character; you must call [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync|LoadCharacterAsync()]] to load the new appearance.

### Character

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Players

This property contains a reference to a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] containing a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], body parts, scripts, and other objects required for simulating the player's avatar in-experience. The model is parented to the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] but it may be moved. It is automatically loaded when [[30 Official Roblox Docs/API Reference/Classes/Players#CharacterAutoLoads|Players.CharacterAutoLoads]] is `true` and it can be manually loaded otherwise using [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync|LoadCharacterAsync()]].

Initially this property is `nil` and it is set when the player's character first spawns. Use the [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAdded|CharacterAdded]] event to detect when a player's character properly loads, and the [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterRemoving|CharacterRemoving]] event to detect when the character is about to despawn. Avoid using [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|Object:GetPropertyChangedSignal()]] on this property.

Note that [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] that are cloned from [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] or [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]] into a player's [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]] or [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] respectively are often run before the old character model is replaced, so [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] may refer to the old model whose [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] property is `nil`. Therefore, in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] under [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] or [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]], it is advisable to make sure the parent of `Character` is not `nil` before using it, for example:

*Code samples for this member (`Player-Character`) are published on the source page; their code is not part of the open-source repo.*

### CharacterAppearance

> [!warning] Deprecated
> This item is deprecated. Do not use it for new work.

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Players · **Tags:** `NotBrowsable`, `Deprecated`

This property indicates the URL of the asset containing the character's appearance, clothing, and gear. It is automatically set by Roblox to load your avatar's appearance when you join an experience.

Attempting to set the property after the character has spawned will not change the character, you must call [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync|LoadCharacterAsync()]] to load the new appearance.

### CharacterAppearanceId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines the user ID of the account whose character appearance is used for a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]]. By default, this property is the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]], which uses the player's avatar as they have created it on Roblox.

Changing this property to the user ID of another account will cause the player to spawn with that account's appearance.

You can also toggle whether or not a player's character appearance is loaded in experience by changing the [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#LoadCharacterAppearance|StarterPlayer.LoadCharacterAppearance]] property.

### DataComplexity

> [!warning] Deprecated
> This item is deprecated, as it may have been used for a now obsolete data
> persistence method. Please save and load player data using
> `Class.DataStoreService` for new work.

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`, `Deprecated`

This property was once used by an ancient data persistence method to indicate the total amount of data currently being stored in the player's cache on the current place.

#### Notes

- Booleans and numbers cost 1 data complexity unit.
- Strings cost their length divided by 100 in data complexity units.
- Instances cost their DataCost in data complexity units.
- Saving the default value (0 for numbers, false for booleans, "" for strings and `nil` for Instances) removes the key from the DataComplexity count.
- If, when using the SaveBoolean, SaveString, SaveNumber or SaveInstance functions, the DataComplexity for the player goes over the limit (currently 45000 units, defined by DataComplexityLimit), the function throws an error, the value is not saved, and any previous value of the key that was being saved to is deleted.

### DataReady

> [!warning] Deprecated
> This item is deprecated, as it may have been used for a now obsolete data
> persistence method. Please save and load player data using
> `Class.DataStoreService` for new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`, `Deprecated`

This property was once used by an ancient data persistence method to indicate when the player's data is available to load. Becomes true when data is available.

### DevCameraOcclusionMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DevCameraOcclusionMode|DevCameraOcclusionMode]]

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

Defines how the default camera scripts handle objects between the camera and the camera subject. Set by [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevCameraOcclusionMode|StarterPlayer.DevCameraOcclusionMode]] and can't be changed for individual players.

The default value is [[30 Official Roblox Docs/API Reference/Enums/DevCameraOcclusionMode|Zoom]]. See [[30 Official Roblox Docs/API Reference/Enums/DevCameraOcclusionMode|Enum.DevCameraOcclusionMode]] for a list of available modes.

### DevComputerCameraMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DevComputerCameraMovementMode|DevComputerCameraMovementMode]]

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines the manner in which a player moves their camera when using a device with a mouse and keyboard. This property cannot be set using a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] (it must be set on the server using a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]]).

The default value of this property is determined by [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevComputerCameraMovementMode|StarterPlayer.DevComputerCameraMovementMode]].

This property doesn't affect players using a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device. See [[30 Official Roblox Docs/API Reference/Classes/Player#DevTouchCameraMode|DevTouchCameraMode]] instead.

### DevComputerMovementMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DevComputerMovementMode|DevComputerMovementMode]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines the manner in which a player moves their character when using a device with a mouse and keyboard. This property cannot be set using a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] (it must be set on the server using a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]]).

The default value of this property is determined by [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevComputerMovementMode|StarterPlayer.DevComputerMovementMode]].

This property doesn't affect players using a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device. See [[30 Official Roblox Docs/API Reference/Classes/Player#DevTouchMovementMode|DevTouchMovementMode]] instead.

### DevEnableMouseLock

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines if a player is able to toggle mouse lock by pressing <kbd>Shift</kbd>. A player can disable the mouse lock switch in the experience's settings during play. By default, this property is set to the value of [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#EnableMouseLockOption|StarterPlayer.EnableMouseLockOption]]. This can be set server-side during runtime by using a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]]. It can not be set client-side.

When mouse lock is enabled, the player's cursor is locked to the center of the screen. Moving the mouse will orbit the camera around the player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]], and the character will face the same direction as the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]]. It also offsets the camera view just over the right shoulder of the player's character.

### DevTouchCameraMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DevTouchCameraMovementMode|DevTouchCameraMovementMode]]

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines the manner in which a player moves their camera when using a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device. This property cannot be set using a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] (it must be set on the server using a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]]).

The default value of this property is determined by [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevTouchCameraMovementMode|StarterPlayer.DevTouchCameraMovementMode]].

This property doesn't affect players who aren't using a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device. See [[30 Official Roblox Docs/API Reference/Classes/Player#DevComputerCameraMode|DevComputerCameraMode]] instead.

### DevTouchMovementMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/DevTouchMovementMode|DevTouchMovementMode]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines the manner in which a player moves their character when using a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device. This property cannot be set using a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] (it must be set on the server using a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]]).

The default value of this property is determined by [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#DevTouchMovementMode|StarterPlayer.DevTouchMovementMode]].

This property doesn't affect players who aren't using a [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchEnabled|TouchEnabled]] device. See [[30 Official Roblox Docs/API Reference/Classes/Player#DevComputerMovementMode|DevComputerMovementMode]] instead.

### DisplayName

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players

This property contains the display name of the authenticated user associated with the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object. Unlike [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]], display names are non-unique names a player displays to others.

#### Usage Notes

- Since display names are non-unique, it's possible for two players in a single instance to have identical names. If you need a globally unique identifier for a player, use [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] instead.

- Characters generated with [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync|LoadCharacterAsync()]] or by the Roblox engine will have their [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayName|Humanoid.DisplayName]] property assigned to the [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName|Player.DisplayName]] property.

- Display names may have unicode characters in the string. See [[30 Official Roblox Docs/API Reference/Libraries/utf8|UTF-8]] for more information on how to work with strings with unicode characters.

### FollowUserId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Players · **Tags:** `ReadOnly`, `NotReplicated`

This property contains the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] of the user that a player followed into the experience, or `0` if the player did not follow anyone in. This property is useful for alerting players who have been followed by another player into the experience.

You can get the name of the player followed using this user ID and the [[30 Official Roblox Docs/API Reference/Classes/Players#GetNameFromUserIdAsync|Players:GetNameFromUserIdAsync()]] method.

*Code samples for this member (`Followed-Alert`) are published on the source page; their code is not part of the open-source repo.*

### FrustumStreaming

**Type:** [[30 Official Roblox Docs/API Reference/Enums/FrustumStreamingMode|FrustumStreamingMode]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players

This property controls the engine's instance streaming behavior for the camera view of the given player. [[30 Official Roblox Docs/API Reference/Enums/FrustumStreamingMode|Enabled]] means the player will always stream their camera view. [[30 Official Roblox Docs/API Reference/Enums/FrustumStreamingMode|Automatic]] means the engine will decide to stream the camera view based on the player's capability (based on the bandwidth, device memory, etc.) and gameplay suitability. [[30 Official Roblox Docs/API Reference/Enums/FrustumStreamingMode|Disabled]] means the player will never stream their camera view. [[30 Official Roblox Docs/API Reference/Enums/FrustumStreamingMode|Default]] currently behaves the same as [[30 Official Roblox Docs/API Reference/Enums/FrustumStreamingMode|Disabled]].

### GameplayPaused

**Type:** boolean

**Security:** read None / write NotAccessibleSecurity · **Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `Hidden`

This property indicates if the player is currently in a pause state in a place with [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|StreamingEnabled]] activated. It is set on the client but replicated to the server.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|Workspace.StreamingEnabled]] which controls whether content streaming is enabled
- [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingIntegrityMode|Workspace.StreamingIntegrityMode]] and [[30 Official Roblox Docs/API Reference/Enums/StreamingIntegrityMode|Enum.StreamingIntegrityMode]] for more details on when gameplay is paused.

### HasRobloxSubscription

**Type:** boolean

**Security:** read None / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players

This read-only property is `true` when the player has an active Roblox subscription (the flagship Roblox membership), and `false` otherwise. It is set by the server and cannot be changed by scripts.

Use this property instead of [[30 Official Roblox Docs/API Reference/Classes/Player#MembershipType|Player.MembershipType]] to check for the Roblox subscription.

*Code samples for this member (`check-roblox-subscription`) are published on the source page; their code is not part of the open-source repo.*

### HasVerifiedBadge

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players

This property indicates if the player has a **Verified** badge.

### HealthDisplayDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

This property sets the distance in studs at which this player will see other [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] health bars. If set to `0`, the health bars will not be displayed. This property is set to [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#HealthDisplayDistance|StarterPlayer.HealthDisplayDistance]] by default.

If a humanoid's health bar is visible, you can set the display type using [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType|Humanoid.DisplayDistanceType]].

### InputLatency

**Type:** int

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Players

Latency used by the Server Authority netcode system. This property is not accessible through scripts.

### LocaleId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`

This property shows the locale ID that the local player has set for their Roblox account. It holds a string with the two letter code, for example `en-us`.

See also [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#RobloxLocaleId|LocalizationService.RobloxLocaleId]], the locale ID used for localizing internal content. This can be a different value when the player's account locale isn't supported for internal content localization.

### MembershipType

> [!warning] Deprecated
> This property is deprecated. Use `Class.Player.HasRobloxSubscription` to
> check whether a player has an active Roblox subscription.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/MembershipType|MembershipType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `ReadOnly`, `NotReplicated`

This property can only be read from to determine membership (it cannot be set to another membership type). It holds a [[30 Official Roblox Docs/API Reference/Enums/MembershipType|Enum.MembershipType]] enum of the account's membership type.

*Code samples for this member (`check-membership-status`) are published on the source page; their code is not part of the open-source repo.*

### NameDisplayDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Camera · **Loaded/Saved:** true/true · **Capabilities:** Players

This property sets the distance in studs at which this player will see other [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] names. If the property is set to `0`, names are hidden. This property is set to [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#NameDisplayDistance|StarterPlayer.NameDisplayDistance]] by default.

If a humanoid's name is visible, you can set the display type using [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType|Humanoid.DisplayDistanceType]].

### Neutral

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Team · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines whether the player is on a specific team.

- When `true`, the player is not on a specific team. This also means that the [[30 Official Roblox Docs/API Reference/Classes/Player#Team|Team]] property will be `nil` and the [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|TeamColor]] will be white.

- When `false`, the player is on a specific team. The [[30 Official Roblox Docs/API Reference/Classes/Player#Team|Team]] property will correspond to the [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] that the player is on, as will the [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|TeamColor]].

### PartyId

**Type:** string

**Security:** read None / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `Hidden`, `NotReplicated`

A read-only string identifying the party the player currently belongs to within the experience. If the player is not in a party, this value is an empty string.

This property is essential for integrating with the Roblox Party feature. Use it in combination with [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetPlayersByPartyId|SocialService:GetPlayersByPartyId()]] and [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetPartyAsync|SocialService:GetPartyAsync()]] to access information about a player's party and its members.

To test this service in your experience, use the [[30 Official Roblox Docs/Studio/Studio testing modes#Party simulation|Party Simulator]] in Roblox Studio or publish the experience and play it in the Roblox application.

*Code samples for this member (`Player-PartyId`) are published on the source page; their code is not part of the open-source repo.*

### ReplicationFocus

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Players

This property sets the part to focus replication around a player. Different Roblox systems that communicate over the network (such as physics, streaming, etc.) replicate at different rates depending on how close objects are to the replication focus.

When this property is `nil`, it reverts to its default behavior which is to treat the local player's character's [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]] as the replication focus.

This property should only be set on the server with a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], not a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]. Note that this property does not change or update network ownership of parts.

### RespawnLocation

**Type:** [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Players

If set, the player will respawn at the given [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]] which must meet the following criteria:

- Descendant of [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].

- The [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]] property is set to the player's [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|TeamColor]] or the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Neutral|SpawnLocation.Neutral]] property is set to `true`.

#### Alternatives

- A [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] will spawn from [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocations]] belonging to their team. In some cases it may be simpler to change the player's [[30 Official Roblox Docs/API Reference/Classes/Player#Team|Team]] instead.
- Implement your own custom spawn logic using [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PVInstance:PivotTo()]] to manually move the [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]].

*Code samples for this member (`change-spawn-on-touch`) are published on the source page; their code is not part of the open-source repo.*

### Team

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Team|Team]]

**Thread safety:** ReadSafe · **Category:** Team · **Loaded/Saved:** true/true · **Capabilities:** Players · **Tags:** `NotReplicated`

This property is a reference to a [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] object within the [[30 Official Roblox Docs/API Reference/Classes/Teams|Teams]] service. If the player isn't on a team or has an invalid [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|TeamColor]], this property is `nil`. When this property is set, the player has joined the [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] and the [[30 Official Roblox Docs/API Reference/Classes/Team#PlayerAdded|Team.PlayerAdded]] event fires on the associated team. Similarly, [[30 Official Roblox Docs/API Reference/Classes/Team#PlayerRemoved|Team.PlayerRemoved]] fires when the property is unset from a certain [[30 Official Roblox Docs/API Reference/Classes/Team|Team]].

### TeamColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Team · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines which [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] a player is associated with according to that team's [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor|Team.TeamColor]]. If no [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] object has the associated [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]], the player will not be associated with a team.

It's often a better idea to set [[30 Official Roblox Docs/API Reference/Classes/Player#Team|Player.Team]] to the respective [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] instead of using this property. Setting this property often leads to repetition of the same [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] value for a certain team across many scripts.

### ThirdPartyTextChatRestrictionStatus

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ChatRestrictionStatus|ChatRestrictionStatus]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Players · **Tags:** `ReadOnly`, `NotReplicated`

This read-only property holds the [[30 Official Roblox Docs/API Reference/Enums/ChatRestrictionStatus|Enum.ChatRestrictionStatus]] that a third-party platform (for example, a console platform's parental or communication settings) reports for the player's text chat. The default value is [[30 Official Roblox Docs/API Reference/Enums/ChatRestrictionStatus|Enum.ChatRestrictionStatus.Unknown]].

This property cannot be set from scripts.

### User

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/User|User]]

**Security:** read None / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players

A read-only [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] value that represents this player's domain-scoped identity within the current experience. The [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] encapsulates the player's domain user ID alongside the domain type and domain ID, providing an unambiguous identifier that carries its context.

Use this property as the standard way to identify users in new code. Engine APIs that accept user ID parameters also accept [[30 Official Roblox Docs/API Reference/Datatypes/User|User]] values directly.

*Code samples for this member (`Player-User`) are published on the source page; their code is not part of the open-source repo.*

### UserId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players

This property contains a read-only integer that **uniquely and consistently** identifies the user's account on Roblox. Unlike the player's [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName|DisplayName]] which may change, this value will never change for the same account.

This property is essential when saving/loading player data using [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStores]].

*Code samples for this member (`Player-UserId1`, `GlobalDataStore-GetAsync1`) are published on the source page; their code is not part of the open-source repo.*

### userId

> [!warning] Deprecated
> This property is a deprecated variant of `Class.Player.UserId` which
> should be used instead.

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `Deprecated`

## Methods

### AddReplicationFocus

```lua
Player:AddReplicationFocus(part: BasePart): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players

This method adds an additional replication focus for the player in order to trigger streaming around the location of the specified `part`. In this manner, streaming can occur around multiple locations, not just the location of [[30 Official Roblox Docs/API Reference/Classes/Player#ReplicationFocus|Player.ReplicationFocus]]. This has no effect in experiences that are not streaming enabled.

Additional foci will use the same values of [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingMinRadius|Workspace.StreamingMinRadius]] and [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius|Workspace.StreamingTargetRadius]] as are used by the primary focus.

This method should only be called on the server. It has no effect when called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] to use as a new replication focus. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ClearCachedAvatarAppearance

```lua
Player:ClearCachedAvatarAppearance(): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance, Players

This method clears the cached avatar appearance for the player. The next time [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync|LoadCharacterAsync()]] is called with the player's default platform appearance, a fresh version will be fetched from the backend instead of using the cached version.

Avatar appearance is cached after the first load to improve respawn latency and reduce backend load; most players do not change their avatar mid-session. Call this method when you want to reflect a change the player has made to their avatar outside of the experience, for example to implement a custom refresh button that mirrors the behavior of the default in-experience menu.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ClearCharacterAppearance

```lua
Player:ClearCharacterAppearance(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players

This method removes all [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]], [[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirt]], [[30 Official Roblox Docs/API Reference/Classes/Pants|Pants]], [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh|CharacterMesh]], and [[30 Official Roblox Docs/API Reference/Classes/BodyColors|BodyColors]] from the given player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]]. In addition, it also removes the T-Shirt [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] on the player's torso. The character's body part colors and face will remain unchanged. This method does nothing if the player does not have a [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Player-ClearCharacterAppearance1`) are published on the source page; their code is not part of the open-source repo.*

### DistanceFromCharacter

```lua
Player:DistanceFromCharacter(point: Vector3): float
```

**Thread safety:** Unsafe · **Capabilities:** Players

This method returns the distance between the character's head and the given [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] point, or `0` if the player has no [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]].

This is useful when determining the distance between a player and another object or location in experience.

If you would like to determine the distance between two non-player instances or positions, you can use the following:

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `point` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The location from which player's distance to is being measured. |

**Returns**

| Type | Description |
| --- | --- |
| float | The distance in studs between the player and the location. |

*Code samples for this member (`Player-DistanceFromCharacter1`, `Player-DistanceFromCharacter`) are published on the source page; their code is not part of the open-source repo.*

### GetCameraState

```lua
Player:GetCameraState(): CameraState
```

**Thread safety:** Safe · **Capabilities:** Players · **Tags:** `CustomLuaState`

Returns a dictionary containing information about the player's current camera state. This method requires [[30 Official Roblox Docs/Projects/Server Authority/Server authority model|Server Authority]] to be enabled in the game. The dictionary contains the following fields:

| Key | Value Type | Description |
| --- | --- | --- |
| `CFrame` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The current [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame\|CFrame]] of the player's camera. |
| `FieldOfView` | number | The current [[30 Official Roblox Docs/API Reference/Classes/Camera#FieldOfView\|FieldOfView]] of the player's camera in degrees. |
| `ViewportSize` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The current [[30 Official Roblox Docs/API Reference/Classes/Camera#ViewportSize\|ViewportSize]] of the player's camera in pixels. |

On the client, this method can only be called on the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]]. On the server, it can be called on any [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object to retrieve their replicated camera state. Typical server-side uses include aim and look-direction logic in server-authoritative gameplay, and camera-aware content streaming.

The `CFrame` field is replicated as part of the player's input stream, meaning it is synchronized with other inputs such as movement and actions. The `FieldOfView` and `ViewportSize` fields use standard client-to-server property replication which is not synchronized with input and may update at a different cadence.

**Returns**

| Type | Description |
| --- | --- |
| CameraState | A dictionary containing [[30 Official Roblox Docs/API Reference/Classes/Camera#CFrame\|CFrame]], [[30 Official Roblox Docs/API Reference/Classes/Camera#FieldOfView\|FieldOfView]], and [[30 Official Roblox Docs/API Reference/Classes/Camera#ViewportSize\|ViewportSize]] values. |

*Code samples for this member (`Player-GetCameraState`) are published on the source page; their code is not part of the open-source repo.*

### GetFriendsOnline

> [!warning] Deprecated
> This method has been superseded by
> `Class.Player:GetFriendsOnlineAsync()|GetFriendsOnlineAsync()`.

```lua
Player:GetFriendsOnline(maxFriends: int = 200): Array
```

**Thread safety:** Unsafe · **Capabilities:** Players, Social · **Tags:** `Yields`, `Deprecated`

This method returns an array describing the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|LocalPlayer]]'s currently online friends, up to a maximum of `maxFriends` entries. It can only be called on the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]]; calling it on any other [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] raises an error. No more than 200 friends are ever returned, and requesting more logs a warning.

This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Player#GetFriendsOnlineAsync|GetFriendsOnlineAsync()]], which shares the same behavior and return format. See that method for the full description of the returned dictionary array.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `maxFriends` | int | `200` | The maximum number of online friends to return. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A dictionary of online friends (see the table above). |

*Code samples for this member (`how-to-get-a-list-of-online-friends`) are published on the source page; their code is not part of the open-source repo.*

### GetFriendsOnlineAsync

```lua
Player:GetFriendsOnlineAsync(maxFriends: int = 200): Array
```

**Thread safety:** Unsafe · **Capabilities:** Players, Social · **Tags:** `Yields`

This function returns a dictionary array of online friends, using a 30 second cache. In the returned array, some fields are only present for certain location types; for example, `PlaceId` won't be present when `LocationType` is `0` (mobile website).

| Name | Type | Description |
| --- | --- | --- |
| `VisitorId` | number | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] of the friend. |
| `UserName` | string | The username of the friend. |
| `DisplayName` | string | The [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName\|DisplayName]] of the friend. |
| `LastOnline` | string | When the friend was last online. |
| `IsOnline` | boolean | If the friend is currently online. |
| `LastLocation` | string | The name of the friend's current location. |
| `PlaceId` | number | The place ID of the friend's last location. |
| `GameId` | string | The [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId\|DataModel.JobId]] of the friend's last location. |
| `LocationType` | number | The location type of the friend's last location. |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `maxFriends` | int | `200` | The maximum number of online friends to return. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A dictionary of online friends (see the table above). |

*Code samples for this member (`how-to-get-a-list-of-online-friends`) are published on the source page; their code is not part of the open-source repo.*

### GetFriendsWhoPlayedAsync

```lua
Player:GetFriendsWhoPlayedAsync(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Players, Social · **Tags:** `Yields`

Returns an array of user IDs of any friends who have previously played this game. For example, if a player has had two friends play the game, the method might return `{1111111111, 2222222222}`. If no friends have played this game, the method returns an empty array (`{}`).

This is particularly useful for friend leaderboards: by narrowing DataStore lookups to only friends who have actually played the experience, you avoid fetching scores for the entire friends list and reduce the risk of hitting DataStore rate limits.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of user IDs. |

### GetJoinData

```lua
Player:GetJoinData(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `CustomLuaState`

Returns a dictionary containing information describing how the player joins the experience. The dictionary contains any of the following fields:

| Key | Value Type | Description |
| --- | --- | --- |
| `SourceGameId` | number | The [[30 Official Roblox Docs/API Reference/Classes/DataModel#GameId\|DataModel.GameId]] of the experience the `Player` teleported from. Only present if the player teleports to the current experience and if a server calls the teleport function. |
| `SourcePlaceId` | number | The [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|DataModel.PlaceId]] of the place the `Player` teleported from. Only present if the player teleports to the current place and a server calls the teleport function. |
| `ReferredByPlayerId` | number | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] of the player who invited the current player to the experience. Use this data to identify the referrer and trigger reward logic. |
| `Members` | array | An array containing the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] numbers of the users teleported alongside the player. Only present if the player teleported as part of a group. |
| `TeleportData` | variant | Reflects the `teleportData` specified in the original teleport. Useful for sharing information between servers the player teleports to. Only present if `teleportData` was specified and a server calls the teleport function. |
| `LaunchData` | string | A plain or JSON encoded string that contains launch data specified in a [[30 Official Roblox Docs/Production/Promotion/Share links\|share link]] or [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions#LaunchData\|ExperienceInviteOptions.LaunchData]]. |
| `GameJoinContext` | dictionary | A dictionary that includes relevant information based on the context of the join. It contains the following keys:<br><br> • `JoinSource`: [[30 Official Roblox Docs/API Reference/Enums/JoinSource\|Enum.JoinSource]]<br>• `ItemType`: optional [[30 Official Roblox Docs/API Reference/Enums/AvatarItemType\|Enum.AvatarItemType]]<br>• `AssetId`: optional `string`<br>• `OutfitId`: optional `string`<br>• `AssetType`: optional [[30 Official Roblox Docs/API Reference/Enums/AssetType\|Enum.AssetType]] |

If a server initiates the player's teleport, the dictionary that this method returns includes the player's teleport data. The [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData|GetJoinData()]] method can only be used to fetch teleport data on the server. To fetch the data on the client, use [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetLocalPlayerTeleportData|TeleportService:GetLocalPlayerTeleportData()]].

Unlike [[30 Official Roblox Docs/API Reference/Classes/TeleportService#GetLocalPlayerTeleportData|TeleportService:GetLocalPlayerTeleportData()]], [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData|GetJoinData()]] only provides teleport data that meets the following security criteria:

- It's guaranteed to have been sent by a Roblox server in the past 48 hours.
- It's guaranteed to have been sent with this [[30 Official Roblox Docs/API Reference/Classes/Player|Player]].
- The `SourcePlaceId` and `SourceGameId` are guaranteed to be the place and universe the data was sent from. This means you can verify the teleport data came from an approved place.

As this data is transmitted by the client, it can still potentially be abused by an exploiter. Sensitive data such as player currency should be transmitted via a secure solution like [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores|Memory Stores]].

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing PlaceId and UserId values (see table in description). |

*Code samples for this member (`Player-GetJoinData-Tracking-Traffic-Sources`, `Player-GetJoinData-Referral-Url-Generator`, `Player-GetJoinData-Table-as-Launch-Data`, `Player-GetJoinData-Decoding-Json-Launch-Data`, `server-teleportdata-example`) are published on the source page; their code is not part of the open-source repo.*

### GetMouse

```lua
Player:GetMouse(): Mouse
```

**Thread safety:** Unsafe · **Capabilities:** Input, Players

This method returns the [[30 Official Roblox Docs/API Reference/Classes/Mouse|Mouse]] being used by the client. The player's mouse instance can be used to track user mouse input including left and right mouse button clicks and movement and location.

Note that [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] provides additional methods, properties, and events to track user input, especially for devices that do not use a mouse.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Mouse\|Mouse]] | The player's [[30 Official Roblox Docs/API Reference/Classes/Mouse\|Mouse]] instance. |

### GetNetworkPing

```lua
Player:GetNetworkPing(): float
```

**Thread safety:** Safe · **Capabilities:** Players

Returns the round-trip, isolated network latency of the player in seconds. "Ping" is a measurement of the time taken for data to be sent from the client to the server, then back again. It doesn't involve data deserialization or processing.

For client-side [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]], this function can only be called on the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]]. This function is useful in identifying and debugging issues that occur in high network latency scenarios. It's also useful for masking latency, such as adjusting the speed of throwing animations for projectiles.

**Returns**

| Type | Description |
| --- | --- |
| float | The round-trip network latency of the player in seconds. |

### GetRankInGroup

> [!warning] Deprecated
> This method has been superseded by
> `Class.Player:GetRankInGroupAsync()|GetRankInGroupAsync()`.

```lua
Player:GetRankInGroup(groupId: int64): int
```

**Thread safety:** Unsafe · **Capabilities:** Players, Groups · **Tags:** `Yields`, `Deprecated`

Only public roles are considered.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `groupId` | int64 |  | The `groupId` of the specified group. |

**Returns**

| Type | Description |
| --- | --- |
| int | The player's rank in the group. |

*Code samples for this member (`Player-GetRankInGroup1`) are published on the source page; their code is not part of the open-source repo.*

### GetRankInGroupAsync

> [!warning] Deprecated
> This method returns only the rank value of the member's highest public
> role. Use `Class.GroupService:GetRolesInGroupAsync()` instead, which
> returns all public roles.

```lua
Player:GetRankInGroupAsync(groupId: int64): int
```

**Thread safety:** Unsafe · **Capabilities:** Players, Groups · **Tags:** `Yields`, `Deprecated`

This method returns the player's rank in the group as an integer between `0` and `255`, where `0` is a non-member and `255` is the group's owner. Only public roles are considered.

This call may not yield the most up-to-date information. If a player leaves a group while they are in the experience, `GetRankInGroupAsync()` will still think they're in that group until they leave. However, this does not happen when used with a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] because the method caches results, so multiple calls of `GetRankInGroupAsync()` on the same player with the same group ID will yield the same result as when the method was first called with the given group ID. The caching behavior is on a per-peer basis: a server does not share the same cache as a client.

When a player joins a group in-experience due to a call to [[30 Official Roblox Docs/API Reference/Classes/GroupService#PromptJoinAsync|GroupService:PromptJoinAsync()]], any cached value for that player will be cleared on the client where the prompt was shown.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `groupId` | int64 |  | The `groupId` of the specified group. |

**Returns**

| Type | Description |
| --- | --- |
| int | The player's rank in the group. |

*Code samples for this member (`Player-GetRankInGroup1`) are published on the source page; their code is not part of the open-source repo.*

### GetRoleInGroup

> [!warning] Deprecated
> This method has been superseded by
> `Class.Player.GetRoleInGroupAsync|GetRoleInGroup()`.

```lua
Player:GetRoleInGroup(groupId: int64): string
```

**Thread safety:** Unsafe · **Capabilities:** Players, Groups · **Tags:** `Yields`, `Deprecated`

Only public roles are considered.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `groupId` | int64 |  | The group ID of the specified group. |

**Returns**

| Type | Description |
| --- | --- |
| string | The player's role in the specified group, or `Guest` if the player is not a member. |

*Code samples for this member (`Player-GetRoleInGroup1`) are published on the source page; their code is not part of the open-source repo.*

### GetRoleInGroupAsync

> [!warning] Deprecated
> This method returns only the member's highest public role. Use
> `Class.GroupService:GetRolesInGroupAsync()` instead, which returns all
> public roles.

```lua
Player:GetRoleInGroupAsync(groupId: int64): string
```

**Thread safety:** Unsafe · **Capabilities:** Players, Groups · **Tags:** `Yields`, `Deprecated`

This method returns the player's role in the group as a string, or `Guest` if the player isn't part of the group. Only public roles are considered.

This call may not yield the most up-to-date information. If a player leaves a group while they are in the experience, `GetRoleInGroupAsync()` will still think they're in that group until they leave. However, this does not happen when used with a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] because the method caches results, so multiple calls of `GetRoleInGroupAsync()` on the same player with the same group ID will yield the same result as when the method was first called with the given group ID. The caching behavior is on a per-peer basis: a server does not share the same cache as a client.

When a player joins a group in-experience due to a call to [[30 Official Roblox Docs/API Reference/Classes/GroupService#PromptJoinAsync|GroupService:PromptJoinAsync()]], any cached value for that player will be cleared on the client where the prompt was shown.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `groupId` | int64 |  | The group ID of the specified group. |

**Returns**

| Type | Description |
| --- | --- |
| string | The player's role in the specified group, or `Guest` if the player is not a member. |

*Code samples for this member (`Player-GetRoleInGroup1`) are published on the source page; their code is not part of the open-source repo.*

### HasAppearanceLoaded

```lua
Player:HasAppearanceLoaded(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players

This method returns whether or not the appearance of the player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] has loaded. Appearance includes items such as the player's [[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirt]], [[30 Official Roblox Docs/API Reference/Classes/Pants|Pants]], and [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessories]].

This is useful when determining whether a player's appearance has loaded after they first join the experience, which can be tracked using the [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|Players.PlayerAdded]] event.

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean indicating whether or not the appearance of the player's character has loaded. |

*Code samples for this member (`check-if-a-player-s-appearance-has-loaded`) are published on the source page; their code is not part of the open-source repo.*

### IsBestFriendsWith

> [!warning] Deprecated
> This function is obsolete because the "best friends" feature was removed.
> Use `Class.Player:IsFriendsWithAsync()` instead.

```lua
Player:IsBestFriendsWith(userId: User): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`, `Deprecated`

This function was once used to return whether a player is best friends with the specified user, but the feature has since been removed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the user to check friendship with. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean indicating whether the player is friends with the specified user. |

### IsFriendsWith

> [!warning] Deprecated
> This method has been superseded by the `Class.Player:IsFriendsWithAsync()`
> method which should be used for new work.

```lua
Player:IsFriendsWith(userId: User): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players, Social · **Tags:** `Yields`, `Deprecated`

This method sends a request to Roblox asking whether the player is a friend of the user with the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]]. Results are cached, so multiple calls on the same player with the same `userId` may not reflect the most up-to-date friendship status.

This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Player#IsFriendsWithAsync|IsFriendsWithAsync()]], which shares the same behavior and should be used for new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the specified player. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean indicating whether a player is a friend of the specified user. |

*Code samples for this member (`Player-IsFriendsWith1`) are published on the source page; their code is not part of the open-source repo.*

### isFriendsWith

> [!warning] Deprecated
> This method has been superseded by the `Class.Player:IsFriendsWithAsync()`
> method which should be used for new work.

```lua
Player:isFriendsWith(userId: User): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`, `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  |  |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### IsFriendsWithAsync

```lua
Player:IsFriendsWithAsync(userId: User): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players, Social · **Tags:** `Yields`

This method sends a request to Roblox asking whether a player is a friend of another user, given the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] of that user. This method caches results so multiple calls on the same player with the same `userId` may not yield the most up-to-date result.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the specified player. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean indicating whether a player is a friend of the specified user. |

### IsInGroup

> [!warning] Deprecated
> This method has been superseded by
> `Class.Player.IsInGroupAsync|IsInGroupAsync()`.

```lua
Player:IsInGroup(groupId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players, Groups · **Tags:** `Yields`, `Deprecated`

This method sends a request to Roblox asking whether the player is a member of the group with the given ID.

This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Player#IsInGroupAsync|IsInGroupAsync()]], which shares the same behavior (including its per-peer result caching) and should be used for new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `groupId` | int64 |  | The group ID of the specified group. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean indicating whether the player is in the specified group. |

### IsInGroupAsync

```lua
Player:IsInGroupAsync(groupId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players, Groups · **Tags:** `Yields`

This method sends a request to Roblox asking whether a player is a member of a group, given the ID of that group.

This call may not yield the most up-to-date information. If a player leaves a group while they are in the experience, `IsInGroupAsync()` will still think they're in that group until they leave. However, this does not happen when used with a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] because the method caches results, so multiple calls of `IsInGroupAsync()` on the same player with the same group ID will yield the same result as when the method was first called with the given group ID. The caching behavior is on a per-peer basis: a server does not share the same cache as a client.

When a player joins a group in-experience due to a call to [[30 Official Roblox Docs/API Reference/Classes/GroupService#PromptJoinAsync|GroupService:PromptJoinAsync()]], any cached value for that player will be cleared on the client where the prompt was shown.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `groupId` | int64 |  | The group ID of the specified group. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean indicating whether the player is in the specified group. |

### IsVerified

```lua
Player:IsVerified(level: VerifiedLevel = Low): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players

Returns a boolean value indicating whether the player meets the specified [[30 Official Roblox Docs/API Reference/Enums/VerifiedLevel|Enum.VerifiedLevel]]. When `level` is omitted, this method defaults to [[30 Official Roblox Docs/API Reference/Enums/VerifiedLevel|Enum.VerifiedLevel.Low]]. Note that this is a distinct check from the verified badge.

Verification uses concrete, real-world signals, including, but not limited to, phone number or government ID verification.

When implementing `IsVerified`, exercise caution to ensure that the implementation does not inadvertently block all unverified users.

Note that the method can only be called on the backend server. Calling it client-side results in an error. Additionally, this method will always return `false` in Studio.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | [[30 Official Roblox Docs/API Reference/Enums/VerifiedLevel\|VerifiedLevel]] | `Low` | The verification level to check. Defaults to [[30 Official Roblox Docs/API Reference/Enums/VerifiedLevel\|Enum.VerifiedLevel.Low]]. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean indicating whether the player meets the specified verification level. |

*Code samples for this member (`Player-IsVerified`) are published on the source page; their code is not part of the open-source repo.*

### Kick

```lua
Player:Kick(message: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players, Consequences

This method allows an experience to gracefully disconnect a client and optionally provide a message to the disconnected user. This is useful for moderating abusive users. You should only allow specific users whom you trust to trigger this method on other users.

Calling this method on a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] with no arguments disconnects the user from the server and provides a default notice message. Calling this method on a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] along with a string as the first argument replaces the default message with the provided string.

When you call this method from the server, the custom message can be at most 500 bytes long. If the message is longer, it's discarded and the user sees the default notice message instead. The limit is measured in bytes, not characters, so messages that contain multibyte characters such as emoji or non-Latin text reach the limit sooner.

When using this method from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], only the local user's client can be kicked.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The message to show the user upon kicking. When called from the server, messages longer than 500 bytes are not shown. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### LoadBoolean

> [!warning] Deprecated
> This item is deprecated, as it may have been used for a now obsolete data
> persistence method. Please save and load player data using
> `Class.DataStoreService` for new work.

```lua
Player:LoadBoolean(key: string): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

This function returns a boolean value that was previously saved to the player with [[30 Official Roblox Docs/API Reference/Classes/Player#SaveBoolean|Player:SaveBoolean()]] with the same key. Returns false if the key doesn't exist, not `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The string key under which the boolean was previously saved. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | The saved boolean value, or `false` if the key does not exist. |

### loadBoolean

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Player:LoadBoolean()`
> which has also been deprecated. Neither function should be used in new
> work.

```lua
Player:loadBoolean(key: string): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### LoadCharacter

> [!warning] Deprecated
> This method has been superseded by
> `Class.Player:LoadCharacterAsync()|LoadCharacterAsync()`.

```lua
Player:LoadCharacter(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`, `Deprecated`

This method creates a new [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] for the player, removing the old one, and also clears the player's [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] and [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]]. It can only be called on the server.

This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync|LoadCharacterAsync()]], which shares the same character-loading behavior and should be used for new work.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Player-LoadCharacter1`) are published on the source page; their code is not part of the open-source repo.*

### LoadCharacterAppearance

> [!warning] Deprecated
> This method is deprecated. Do not use it for new work.

```lua
Player:LoadCharacterAppearance(assetInstance: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance, Players · **Tags:** `Deprecated`

The LoadCharacterAppearance [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] function places the given instance either in the player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]], head, or [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGear]] based on the instance's class.

This is useful when giving a player's character an asset from the Roblox catalog, such as a hat or piece of gear.

It is similar to [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync|Player:LoadCharacterAsync()]], except it does not reload the entire character instance, StarterGear, or [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]].

Note:

- [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]], [[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirt]], [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic|ShirtGraphic]], [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh|CharacterMesh]], [[30 Official Roblox Docs/API Reference/Classes/BodyColors|BodyColors]], and [[30 Official Roblox Docs/API Reference/Classes/Accoutrement|Accoutrement]] are parented to the player's character.
- [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]], [[30 Official Roblox Docs/API Reference/Classes/FileMesh|FileMesh]], [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]], [[30 Official Roblox Docs/API Reference/Classes/BlockMesh|BlockMesh]], [[30 Official Roblox Docs/API Reference/Classes/CylinderMesh|CylinderMesh]], and [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] are parented to the character's head.
- [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] is parented to the player's [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGear]].
- All other classes are ignored.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetInstance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | An instance of the asset being loaded, which can be obtained using the [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset\|InsertService:LoadAsset()]] function. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Player-LoadCharacterAppearance1`) are published on the source page; their code is not part of the open-source repo.*

### LoadCharacterAsync

```lua
Player:LoadCharacterAsync(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`

This method creates a new character for the player, removing the old one. It also clears the player's [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] and [[30 Official Roblox Docs/API Reference/Classes/PlayerGui|PlayerGui]]. This is useful in cases where you want to reload the character without killing the player, such as when you want to load a new character appearance after changing the player's [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAppearance|CharacterAppearance]].

When reloading a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] with their default platform appearance applied, a cached version of their appearance will be loaded. The cached version is cleared whenever the player's appearance is updated using [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService|AvatarEditorService]] or when the player manually resets via the in-experience menu. To programmatically clear this cache, call [[30 Official Roblox Docs/API Reference/Classes/Player#ClearCachedAvatarAppearance|ClearCachedAvatarAppearance()]] before calling `LoadCharacterAsync()`.

After calling `LoadCharacterAsync()` for an individual player, it is not recommended to call it again for the same player until after that player's [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAppearanceLoaded|CharacterAppearanceLoaded]] event has fired.

#### Character Loading Event Order

Calling the `LoadCharacterAsync()` method on any `Player` fires events in the following order:

1. [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] sets, automatically removing old character.
2. [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAdded|Player.CharacterAdded]] fires.
3. [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Object.Changed]] fires on the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] with a value of `Character`.
4. The character appearance initializes.
5. [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAppearanceLoaded|Player.CharacterAppearanceLoaded]] fires.
6. The character's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] sets to the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]].
7. The character rig builds and scales.
8. The character moves to the spawn location.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Player-LoadCharacter1`) are published on the source page; their code is not part of the open-source repo.*

### LoadCharacterWithHumanoidDescription

> [!warning] Deprecated
> This method has been superseded by
> `Class.Player:LoadCharacterWithHumanoidDescriptionAsync()|LoadCharacterWithHumanoidDescriptionAsync()`.

```lua
Player:LoadCharacterWithHumanoidDescription(humanoidDescription: HumanoidDescription, assetTypeVerification: AssetTypeVerification = Default): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`, `Deprecated`

This method spawns a player character with everything equipped in the passed-in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]], such as body parts, colors, body scaling, accessories, clothing, and animations. A `nil` description raises an error, and a description that contains duplicate costume assets or duplicate body parts logs a warning before the character loads.

This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterWithHumanoidDescriptionAsync|LoadCharacterWithHumanoidDescriptionAsync()]], which shares the same behavior and should be used for new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | A [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] containing traits like body parts/colors, body scaling, accessories, clothing, and animations that will be equipped to the loaded character. |
| `assetTypeVerification` | [[30 Official Roblox Docs/API Reference/Enums/AssetTypeVerification\|AssetTypeVerification]] | `Default` | The asset type verification mode. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`spawn-characters-with-humanoiddescription`) are published on the source page; their code is not part of the open-source repo.*

### LoadCharacterWithHumanoidDescriptionAsync

```lua
Player:LoadCharacterWithHumanoidDescriptionAsync(humanoidDescription: HumanoidDescription, assetTypeVerification: AssetTypeVerification = Default): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`

This method spawns a player character with everything equipped in the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].

After calling this method for an individual player, it is not recommended to call it again for the same player until after that player's [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAppearanceLoaded|CharacterAppearanceLoaded]] event has fired.

See also [[30 Official Roblox Docs/Characters/Character appearance|HumanoidDescription System]], an article which explains the humanoid description system in greater detail and provides several scripting examples.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | A [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] containing traits like body parts/colors, body scaling, accessories, clothing, and animations that will be equipped to the loaded character. |
| `assetTypeVerification` | [[30 Official Roblox Docs/API Reference/Enums/AssetTypeVerification\|AssetTypeVerification]] | `Default` | The asset type verification mode. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`spawn-characters-with-humanoiddescription`) are published on the source page; their code is not part of the open-source repo.*

### LoadInstance

> [!warning] Deprecated
> This item is deprecated, as it may have been used for a now obsolete data
> persistence method. Please save and load player data using
> `Class.DataStoreService` for new work.

```lua
Player:LoadInstance(key: string): Instance
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

This function returns an instance that was previously saved to the player with [[30 Official Roblox Docs/API Reference/Classes/Player#SaveInstance|Player:SaveInstance()]] with the same key. Returns `nil` if the key doesn't exist.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The string key under which the instance was previously saved. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The saved [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]], or `nil` if the key does not exist. |

*Code samples for this member (`Player-LoadInstance1`) are published on the source page; their code is not part of the open-source repo.*

### loadInstance

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Player:LoadInstance()`
> which has also been deprecated. Neither function should be used in new
> work.

```lua
Player:loadInstance(key: string): Instance
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |

### LoadNumber

> [!warning] Deprecated
> This item is deprecated, as it may have been used for a now obsolete data
> persistence method. Please save and load player data using
> `Class.DataStoreService` for new work.

```lua
Player:LoadNumber(key: string): double
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

This function was once used by an ancient data persistence method to return a number value that was previously saved to the player with [[30 Official Roblox Docs/API Reference/Classes/Player#SaveNumber|Player:SaveNumber()]] with the same key. Returns 0 if the key doesn't exist, not `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The string key under which the number was previously saved. |

**Returns**

| Type | Description |
| --- | --- |
| double | The saved number value, or `0` if the key does not exist. |

*Code samples for this member (`Player-LoadNumber1`) are published on the source page; their code is not part of the open-source repo.*

### loadNumber

> [!warning] Deprecated
> This deprecated function is a variant of `Class.Player:LoadNumber()` which
> has also been deprecated. Neither function should be used in new work.

```lua
Player:loadNumber(key: string): double
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| double |  |

### LoadString

> [!warning] Deprecated
> This item is deprecated, as it may have been used for a now obsolete data
> persistence method. Please save and load player data using
> `Class.DataStoreService` for new work.

```lua
Player:LoadString(key: string): string
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

This function returns a string value that was previously saved to the player with [[30 Official Roblox Docs/API Reference/Classes/Player#SaveString|Player:SaveString()]] with the same key. Returns an empty string ("") if the key doesn't exist, not `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The string key under which the string was previously saved. |

**Returns**

| Type | Description |
| --- | --- |
| string | The saved string value, or an empty string if the key does not exist. |

*Code samples for this member (`Player-LoadString1`) are published on the source page; their code is not part of the open-source repo.*

### loadString

> [!warning] Deprecated
> This function is a deprecated variant of `Class.Player:LoadString()` which
> has also been deprecated. Neither function should be used in new work.

```lua
Player:loadString(key: string): string
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| string |  |

### Move

```lua
Player:Move(walkDirection: Vector3, relativeToCamera: boolean = False): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players

This method causes the player's character to walk in the given direction until stopped, or interrupted by the player (by using their controls).

This is useful when scripting NPC [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]] that move around a map but are not controlled by an actual player's input.

Note that the function's second argument indicates whether the provided [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] should move the player relative to world coordinates (`false`) or the player's [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] (`true`).

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `walkDirection` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The Vector3 direction that the player should move. |
| `relativeToCamera` | boolean | `False` | A boolean indicating whether the player should move relative to the player's camera. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Player-Move1`) are published on the source page; their code is not part of the open-source repo.*

### PromptAgeCheck

```lua
Player:PromptAgeCheck(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players

This method requests that the player be shown the age verification prompt. When called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], it must target the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]]; when called from a server [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], it can target any [[30 Official Roblox Docs/API Reference/Classes/Player|Player]]. Repeated calls for the same player within a short cooldown window are silently ignored.

On success, the `PromptAgeCheckRequested` event fires on the target player's client. When the player passes verification, their [[30 Official Roblox Docs/API Reference/Classes/Player#AgeChecked|Player.AgeChecked]] property transitions to [[30 Official Roblox Docs/API Reference/Enums/AgeCheckStatus|Enum.AgeCheckStatus.Checked]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RemoveReplicationFocus

```lua
Player:RemoveReplicationFocus(part: BasePart): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players

This method removes a replication focus previously added by [[30 Official Roblox Docs/API Reference/Classes/Player#AddReplicationFocus|AddReplicationFocus()]]. Has no effect in experiences that are not streaming enabled.

This method should only be called on the server. It has no effect when called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] to remove as a replication focus. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RequestStreamAroundAsync

```lua
Player:RequestStreamAroundAsync(position: Vector3, timeOut: double = 0): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`

For experiences where [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|instance streaming]] is enabled, requests that the server stream to the player regions (parts and terrain) around the specified **X**, **Y**, **Z** location in the 3D world. It is useful if the experience knows that the player's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] will be set to the specified location in the near future. Without providing the location with this call, the player may not have streamed in content for the destination, resulting in a streaming pause or other undesirable behavior.

The effect of this call will be temporary and there are no guarantees of what will be streamed in around the specified location. Client memory limits and network conditions may impact what will be available on the client.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | World location where streaming is requested. |
| `timeOut` | double | `0` | Optional timeout for the request, the maximum duration that the engine attempts to stream regions around the `position` parameter before abandoning the request. If you don't specify a value, the timeout is effectively infinite. However, if the client is low on memory, the engine abandons all streaming requests, even those that are still within the timeout duration. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SaveBoolean

> [!warning] Deprecated
> This item is deprecated, as it may have been used for a now obsolete data
> persistence method. Please save and load player data using
> `Class.DataStoreService` for new work.

```lua
Player:SaveBoolean(key: string, value: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

This function is used to save a boolean value that can be loaded again at a later time using [[30 Official Roblox Docs/API Reference/Classes/Player#LoadBoolean|Player:LoadBoolean()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The string key to associate with the saved boolean value. |
| `value` | boolean |  | The boolean value to save. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Player-SaveBoolean1`) are published on the source page; their code is not part of the open-source repo.*

### saveBoolean

> [!warning] Deprecated
> This function is a deprecated variant of `Class.Player:SaveBoolean()`
> which has also been deprecated. Neither function should be used in new
> work.

```lua
Player:saveBoolean(key: string, value: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  |  |
| `value` | boolean |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SaveInstance

> [!warning] Deprecated
> This item is deprecated, as it may have been used for a now obsolete data
> persistence method. Please save and load player data using
> `Class.DataStoreService` for new work.

```lua
Player:SaveInstance(key: string, value: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

This function was once used by an ancient data persistence method to save an instance which can be loaded again at a later time using [[30 Official Roblox Docs/API Reference/Classes/Player#LoadInstance|Player:LoadInstance()]]..

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The string key to associate with the saved instance. |
| `value` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] to save. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Player-SaveInstance1`) are published on the source page; their code is not part of the open-source repo.*

### saveInstance

> [!warning] Deprecated
> This function is a deprecated variant of `Class.Player:SaveInstance()`
> which has also been deprecated. Neither function should be used in new
> work.

```lua
Player:saveInstance(key: string, value: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  |  |
| `value` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SaveNumber

> [!warning] Deprecated
> This item is deprecated, as it may have been used for a now obsolete data
> persistence method. Please save and load player data using
> `Class.DataStoreService` for new work.

```lua
Player:SaveNumber(key: string, value: double): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

This function was once used by an ancient data persistence method to save a number value that can be loaded again at a later time using [[30 Official Roblox Docs/API Reference/Classes/Player#LoadNumber|Player:LoadNumber()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The string key to associate with the saved number value. |
| `value` | double |  | The number value to save. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Player-SaveNumber1`) are published on the source page; their code is not part of the open-source repo.*

### saveNumber

> [!warning] Deprecated
> This function is a deprecated variant of `Class.Player:SaveNumber()` which
> has also been deprecated. Neither function should be used in new work.

```lua
Player:saveNumber(key: string, value: double): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  |  |
| `value` | double |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SaveString

> [!warning] Deprecated
> This item is deprecated, as it may have been used for a now obsolete data
> persistence method. Please save and load player data using
> `Class.DataStoreService` for new work.

```lua
Player:SaveString(key: string, value: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

This function was once used by an ancient data persistence method to save a string value that can be loaded again at a later time using [[30 Official Roblox Docs/API Reference/Classes/Player#LoadString|Player:LoadString()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The string key to associate with the saved string value. |
| `value` | string |  | The string value to save. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Player-SaveString1`) are published on the source page; their code is not part of the open-source repo.*

### saveString

> [!warning] Deprecated
> This function is a deprecated variant of `Class.Player:SaveString()` which
> has also been deprecated. Neither function should be used in new work.

```lua
Player:saveString(key: string, value: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  |  |
| `value` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetAccountAge

```lua
Player:SetAccountAge(accountAge: int): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Players

This method sets the [[30 Official Roblox Docs/API Reference/Classes/Player#AccountAge|AccountAge]] of the player in days, meaning the age of the account itself relative to when it was first created.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `accountAge` | int |  | The age of the account in days. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetSuperSafeChat

```lua
Player:SetSuperSafeChat(value: boolean): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Players

This method sets whether or not the player sees chat filtered by [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterStringAsync|TextService:FilterStringAsync()]] rather than normal chats.

```lua
local Players = game:GetService("Players")

local player = Players.LocalPlayer
player:SetSuperSafeChat(true)
```

Regardless of whether a player has filtered chat enabled, all chat should be filtered by [[30 Official Roblox Docs/API Reference/Classes/TextService|TextService]] when broadcast to other players or on the player's own screen. [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterStringAsync|TextService:FilterStringAsync()]] returns a [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult|TextFilterResult]] object that can be filtered differently according to the message's intended use.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `value` | boolean |  | A boolean indicating whether or not the player sees filtered chat. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### WaitForDataReady

> [!warning] Deprecated
> This item is deprecated, as it may have been used for a now obsolete data
> persistence method. Please save and load player data using
> `Class.DataStoreService` for new work.

```lua
Player:WaitForDataReady(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`, `Deprecated`

This function is used to pause the script until the player's data is available to manipulate, or until a certain amount of time has elapsed without fetching the player's data

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean indicating whether the player's data loaded successfully. |

### waitForDataReady

> [!warning] Deprecated
> This function is a deprecated variant of `Class.Player:WaitForDataReady()`
> which has also been deprecated. Neither function should be used in new
> work.

```lua
Player:waitForDataReady(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`, `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

## Events

### CharacterAdded

```lua
Player.CharacterAdded(character: Model)
```

**Capabilities:** Players

This event fires when a player's character spawns or respawns. It fires soon after setting [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] to a non-`nil` value or calling [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync|LoadCharacterAsync()]], which is before the character is parented to the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].

This can be used alongside the [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterRemoving|CharacterRemoving]] event which fires right before a player's character is about to be removed, typically after death. As such, both of these events can potentially fire many times as players die then respawn in a place.

Note that the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] and its default body parts (head, torso, and limbs) will exist on the server when this event fires, but clothing items like [[30 Official Roblox Docs/API Reference/Classes/Hat|Hats]], [[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirts]], and [[30 Official Roblox Docs/API Reference/Classes/Pants|Pants]] might take a few seconds to be added to the character. The parts will also take time to replicate to clients. Connect [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildAdded|Instance.ChildAdded]] on the added character to detect these, or wait for the [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAppearanceLoaded|CharacterAppearanceLoaded]] event to be sure the character has everything equipped.

If you instead need to track when a player joins/leaves the experience, use the events [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|Players.PlayerAdded]] and [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerRemoving|Players.PlayerRemoving]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] |  | An instance of the character that spawned/respawned. |

*Code samples for this member (`spawns-and-despawns`, `accessory-remover`) are published on the source page; their code is not part of the open-source repo.*

### CharacterAppearanceLoaded

```lua
Player.CharacterAppearanceLoaded(character: Model)
```

**Capabilities:** Players

This event fires when the full appearance of a [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] has been inserted. It only fires on the server.

A [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] generally has a range of objects modifying its appearance, including [[30 Official Roblox Docs/API Reference/Classes/Accoutrement|Accoutrements]], [[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirts]], [[30 Official Roblox Docs/API Reference/Classes/Pants|Pants]] and [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh|CharacterMeshes]]. This event will fire when all such objects have been inserted into the character.

For custom character implementations, such as using a character model named `StarterCharacter` inside [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]], use [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAdded|CharacterAdded]] and handle your own accessories.

One use for this event is to ensure all accessories have loaded before destroying them. See below for an example of this.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Player.Character]] [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]. |

*Code samples for this member (`remove-accessories-after-loading`) are published on the source page; their code is not part of the open-source repo.*

### CharacterRemoving

```lua
Player.CharacterRemoving(character: Model)
```

**Capabilities:** Players

This event fires right before a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Character]] is removed, such as when the player is respawning. This can be used alongside the [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAdded|CharacterAdded]] event which fires when a player's character spawns or respawns.

If you instead need to track when a player joins/leaves the experience, use the events [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|Players.PlayerAdded]] and [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerRemoving|Players.PlayerRemoving]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] |  | An instance of the character that is being removed. |

*Code samples for this member (`spawns-and-despawns`) are published on the source page; their code is not part of the open-source repo.*

### Chatted

```lua
Player.Chatted(message: string, recipient: Player)
```

**Capabilities:** Chat, Players

This event fires when a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] types a message and presses
<kbd>Enter</kbd> in Roblox's provided chat bar. This is done using some
Luau bindings by the default chat script. You can prevent players from chatting by using [[30 Official Roblox Docs/API Reference/Classes/StarterGui#SetCoreGuiEnabled|StarterGui:SetCoreGuiEnabled()]] and setting [[30 Official Roblox Docs/API Reference/Enums/CoreGuiType|Enum.CoreGuiType.Chat]] to `false`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The content of the message the player typed in chat. |
| `recipient` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | **Deprecated.** For whisper messages, this was the Player who was the intended target of the chat message. |

### Idled

```lua
Player.Idled(time: double)
```

**Capabilities:** Players

This event fires approximately two minutes after the engine classifies the player as idle. Time is the number of seconds that have elapsed since that point. The event continues to fire every 30 seconds for as long as the player remains idle.

Once the player becomes active again, `Idled` stops firing and the elapsed idle time resets. There is no separate event for the transition back to activity. If the player goes idle again later, `Idled` waits the same ~2 minutes before firing again.

This event only fires in client scripts, not server scripts; use a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] to notify the server of idle players.

Roblox automatically disconnects players that have been idle for at least 20 minutes, so this event is useful for warning players that they will be disconnected soon, disconnecting players prior to those 20 minutes, or other away from keyboard (AFK) features.

To track how often automatic disconnects occur, try correlating this event with occurrences of [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerRemoving|Players.PlayerRemoving]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `time` | double |  | The time in seconds the player has been idle. |

### OnTeleport

```lua
Player.OnTeleport(teleportState: TeleportState, placeId: int64, spawnName: string)
```

**Capabilities:** Players, Teleport

This event fires when the [[30 Official Roblox Docs/API Reference/Enums/TeleportState|Enum.TeleportState]] of a player changes. This event is useful for detecting whether a teleportation was successful.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `teleportState` | [[30 Official Roblox Docs/API Reference/Enums/TeleportState\|TeleportState]] |  | The new [[30 Official Roblox Docs/API Reference/Enums/TeleportState\|Enum.TeleportState]] of the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]. |
| `placeId` | int64 |  | The ID of the place the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] is being teleported to. |
| `spawnName` | string |  | The name of the spawn to teleport to, if [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportToSpawnByName\|TeleportService:TeleportToSpawnByName()]] has been used. |

*Code samples for this member (`Player-OnTeleport1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Player](https://create.roblox.com/docs/reference/engine/classes/Player) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
