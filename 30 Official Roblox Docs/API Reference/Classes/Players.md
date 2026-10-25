---
title: "Players"
description: "A service that contains presently connected `Player` objects."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Players"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that contains presently connected [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] objects.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

The [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] service contains [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] objects for presently connected clients to a Roblox server. It also contains information about a place's configuration. It can fetch information about players not connected to the server, such as character appearances, friends, and avatar thumbnail.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Players#BanningEnabled\|BanningEnabled]] | boolean | Enables or disables the three [[30 Official Roblox Docs/API Reference/Classes/Players\|Players]] methods ([[30 Official Roblox Docs/API Reference/Classes/Players#BanAsync\|BanAsync()]], [[30 Official Roblox Docs/API Reference/Classes/Players#UnbanAsync\|UnbanAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/Players#GetBanHistoryAsync\|GetBanHistoryAsync()]]) that constitute the ban API. This property cannot be set through developer-facing Luau and must be set in Studio through the Players properties window. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#BubbleChat\|BubbleChat]] | boolean | Indicates whether or not bubble chat is enabled. It is set with the [[30 Official Roblox Docs/API Reference/Classes/Players#SetChatStyle\|Players:SetChatStyle()]] method. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#CharacterAutoLoads\|CharacterAutoLoads]] | boolean | Indicates whether [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|characters]] will respawn automatically. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#ClassicChat\|ClassicChat]] | boolean | Indicates whether or not classic chat is enabled; set by the [[30 Official Roblox Docs/API Reference/Classes/Players#SetChatStyle\|Players:SetChatStyle()]] method. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer\|LocalPlayer]] | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] that the [[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScript]] is running for. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#localPlayer\|localPlayer]] | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Players#MaxPlayers\|MaxPlayers]] | int | The maximum number of players that can be in a server. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#NumPlayers\|NumPlayers]] | int | **Deprecated.** Returns the number of people in the server at the current time. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#numPlayers\|numPlayers]] | int | **Deprecated.** Returns the number of people in the server at the current time. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#PreferredPlayers\|PreferredPlayers]] | int | The preferred number of players for a server. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#RespawnTime\|RespawnTime]] | float | Controls the amount of time taken for a players character to respawn. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#UseStrafingAnimations\|UseStrafingAnimations]] | boolean | Determines whether R15 character models play directional strafing and backpedaling animations instead of always turning to face their direction of movement. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Players#BanAsync\|BanAsync()]] | () | Bans users from your experience, with options to specify duration, reason, whether the ban applies to the entire universe or just the current place, and more. This method is enabled and disabled by the [[30 Official Roblox Docs/API Reference/Classes/Players#BanningEnabled\|Players.BanningEnabled]] property, which you can toggle in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#Chat\|Chat()]] | () | Makes the local player chat the given message. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#CreateHumanoidModelFromDescription\|CreateHumanoidModelFromDescription()]] | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] | **Deprecated.** Returns a character [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] equipped with everything specified in the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#CreateHumanoidModelFromDescriptionAsync\|CreateHumanoidModelFromDescriptionAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] | Returns a character [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] equipped with everything specified in the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]]. If `HumanoidDescription.UseAvatarSettings` is set to true, Avatar Settings in the experience will be applied to the returned model. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#CreateHumanoidModelFromUserId\|CreateHumanoidModelFromUserId()]] | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] | **Deprecated.** Returns a character Model set-up with everything equipped to match the avatar of the user specified by the passed in userId. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#CreateHumanoidModelFromUserIdAsync\|CreateHumanoidModelFromUserIdAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] | Returns a character Model set-up with everything equipped to match the avatar of the user specified by the passed in userId. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetBanHistoryAsync\|GetBanHistoryAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/BanHistoryPages\|BanHistoryPages]] | Retrieves the ban and unban history of any user within the experience's universe. This method is enabled and disabled by the [[30 Official Roblox Docs/API Reference/Classes/Players#BanningEnabled\|Players.BanningEnabled]] property, which you can toggle in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetCharacterAppearanceAsync\|GetCharacterAppearanceAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] | **Deprecated.** Returns a [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] containing the assets which the player is wearing, excluding gear. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetCharacterAppearanceInfoAsync\|GetCharacterAppearanceInfoAsync()]] | Dictionary | Returns information about the character appearance of a given user. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetFriendsAsync\|GetFriendsAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/FriendPages\|FriendPages]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/FriendPages\|FriendPages]] object which contains information for all of the given player's friends. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromOutfitId\|GetHumanoidDescriptionFromOutfitId()]] | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | **Deprecated.** Returns the HumanoidDescription for a specified outfit, which will be set with the parts/colors/Animations etc of the outfit. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromOutfitIdAsync\|GetHumanoidDescriptionFromOutfitIdAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | Returns the HumanoidDescription for a specified outfit, which will be set with the parts/colors/Animations etc of the outfit. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromUserId\|GetHumanoidDescriptionFromUserId()]] | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | **Deprecated.** Returns a HumanoidDescription which specifies everything equipped for the avatar of the user specified by the passed in userId. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromUserIdAsync\|GetHumanoidDescriptionFromUserIdAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | Returns a HumanoidDescription which specifies everything equipped for the avatar of the user specified by the passed in userId. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetNameFromUserIdAsync\|GetNameFromUserIdAsync()]] | string | Sends a query to the Roblox website for the username of an account with a given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetPlayerByUserId\|GetPlayerByUserId()]] | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | Returns the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] with the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] if they are in-experience. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetPlayerFromCharacter\|GetPlayerFromCharacter()]] | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | Returns the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Player.Character]] matches the given instance, or `nil` if one cannot be found. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetPlayers\|GetPlayers()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]> | Returns a table of all presently connected [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] objects. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#getPlayers\|getPlayers()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]> | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetProfileConfigurationFromUserIdAsync\|GetProfileConfigurationFromUserIdAsync()]] | ProfileConfiguration | Returns the profile configuration of a user as a dictionary. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetUserIdFromNameAsync\|GetUserIdFromNameAsync()]] | int64 | Sends a query to the Roblox website for the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|userId]] of an account with a given username. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#GetUserThumbnailAsync\|GetUserThumbnailAsync()]] | Tuple | Returns the content URL of a player thumbnail given the size and type, as well as a boolean describing if the image is ready to use. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#playerFromCharacter\|playerFromCharacter()]] | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Players#players\|players()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]> | **Deprecated.** Returns a list of players in an experience. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#SetChatStyle\|SetChatStyle()]] | () | Sets whether BubbleChat and ClassicChat are being used, and tells TeamChat and [[30 Official Roblox Docs/API Reference/Classes/Chat\|Chat]] what to do. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#TeamChat\|TeamChat()]] | () | Makes the local player chat the given message, which will only be viewable by users on the same team. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#UnbanAsync\|UnbanAsync()]] | () | Unbans players banned from [[30 Official Roblox Docs/API Reference/Classes/Players#BanAsync\|Players:BanAsync()]] or the User Restrictions Open Cloud API. This method is enabled and disabled by the [[30 Official Roblox Docs/API Reference/Classes/Players#BanningEnabled\|Players.BanningEnabled]] property, which you can toggle in Studio. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded\|PlayerAdded]] | `player` | Fires when a player enters the experience. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerMembershipChanged\|PlayerMembershipChanged]] | `player` | Fires when the experience server recognizes that a player's membership has changed. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerRemoving\|PlayerRemoving]] | `player`, `reason` | Fires when a player is about to leave the experience. |
| [[30 Official Roblox Docs/API Reference/Classes/Players#UserSubscriptionStatusChanged\|UserSubscriptionStatusChanged]] | `user`, `subscriptionId` | Fires when the experience server recognizes that the user's status for a certain subscription has changed. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### BanningEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Players, PluginOrOpenCloud · **Tags:** `NotScriptable`

Enables or disables the three [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] methods ([[30 Official Roblox Docs/API Reference/Classes/Players#BanAsync|BanAsync()]], [[30 Official Roblox Docs/API Reference/Classes/Players#UnbanAsync|UnbanAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/Players#GetBanHistoryAsync|GetBanHistoryAsync()]]) that constitute the ban API. This property cannot be set through developer-facing Luau and must be set in Studio through the Players properties window.

### BubbleChat

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat, Players · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates whether or not bubble chat is enabled. It is set with the [[30 Official Roblox Docs/API Reference/Classes/Players#SetChatStyle|Players:SetChatStyle()]] method using the [[30 Official Roblox Docs/API Reference/Enums/ChatStyle|Enum.ChatStyle]] enum.

When this chat mode is enabled, the experience displays chats in the chat user interface at the top-left corner of the screen.

There are two other chat modes, [[30 Official Roblox Docs/API Reference/Classes/Players#ClassicChat|Players.ClassicChat]] and a chat mode where both classic and bubble chat are enabled.

### CharacterAutoLoads

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Players · **Tags:** `NotReplicated`

This property indicates whether [[30 Official Roblox Docs/API Reference/Classes/Player#Character|characters]] will respawn automatically. The default value is true.

If this property is disabled (false), player [[30 Official Roblox Docs/API Reference/Classes/Player#Character|characters]] will not spawn until the [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync|Player:LoadCharacterAsync()]] function is called for each [[30 Official Roblox Docs/API Reference/Classes/Player|Player]], including when players join the experience.

This can be useful in experiences where players have finite lives, such as competitive experiences in which players do not respawn until a round ends.

*Code samples for this member (`player-respawn-timer`) are published on the source page; their code is not part of the open-source repo.*

### ClassicChat

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat, Players · **Tags:** `ReadOnly`, `NotReplicated`

Indicates whether or not classic chat is enabled. This property is set by the [[30 Official Roblox Docs/API Reference/Classes/Players#SetChatStyle|Players:SetChatStyle()]] method using the [[30 Official Roblox Docs/API Reference/Enums/ChatStyle|Enum.ChatStyle]] enum.

When this chat mode is enabled, the experience displays chats in a bubble above the sender's head.

There are two other chat modes, [[30 Official Roblox Docs/API Reference/Classes/Players#BubbleChat|Players.BubbleChat]] and a chat mode where both classic and bubble chat are enabled.

### LocalPlayer

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Player|Player]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `ReadOnly`, `NotReplicated`

This read-only property refers to the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] whose client is running the experience.

This property is only defined for [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] and [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] required by them, since they run on the client. For the server, on which [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] objects run their code, this property is `nil`.

### localPlayer

> [!warning] Deprecated
> This property is a deprecated variant of `Class.Players.LocalPlayer` which
> should be used instead.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Player|Player]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`, `Deprecated`

### MaxPlayers

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `ReadOnly`, `NotReplicated`

This property determines the maximum number of players that can be in a server. This property can only be set through a specific place's settings on the [Creator Dashboard](https://create.roblox.com/dashboard/creations).

### NumPlayers

> [!warning] Deprecated
> This item is deprecated. Instead, of using this item, you should count the
> number of players returned by `Class.Players:GetPlayers()`.

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

This property indicates the number of people in the server at the current time. It is read only. Meaning it cannot be written to, only read.

### numPlayers

> [!warning] Deprecated
> This property is a deprecated variant of `Class.Players.NumPlayers` which
> has also been deprecated. Neither property should be used in new work.
> Instead, you should count the number of players returned by
> `Class.Players:GetPlayers()`.

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`, `Deprecated`

This property indicates the number of people in the server at the current time. It is read only. Meaning it cannot be written to, only read.

### PreferredPlayers

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Players · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates the number of players to which Roblox's matchmaker will fill servers. This number will be less than the maximum number of players ([[30 Official Roblox Docs/API Reference/Classes/Players#MaxPlayers|Players.MaxPlayers]]) supported by the experience.

### RespawnTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Players

This property controls the time, in seconds, it takes for a player to respawn when [[30 Official Roblox Docs/API Reference/Classes/Players#CharacterAutoLoads|Players.CharacterAutoLoads]] is true. It defaults to 5.0 seconds.

This is useful when you want to change how long it takes to respawn based on the type of your experience but don't want to handle spawning players individually.

Although this property can be set from within a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], you can more easily set it directly on the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] object in Studio's [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window.

### UseStrafingAnimations

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Players, PluginOrOpenCloud · **Tags:** `NotScriptable`

When enabled, R15 character [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]] play directional locomotion animations, strafing sideways and backpedaling while keeping their current facing direction instead of rotating to face whichever direction they move. When disabled, characters turn to face their direction of movement. Defaults to `false`.

This property cannot be set through developer-facing Luau and must be set in Studio through the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] properties window.

## Methods

### BanAsync

```lua
Players:BanAsync(config: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players, Consequences · **Tags:** `Yields`

The [[30 Official Roblox Docs/API Reference/Classes/Players#BanAsync|Players:BanAsync()]] method allows you to easily ban users who violate your experience's guidelines. You can specify the ban duration, enable the ban to propagate to suspected alternate accounts, enable the ban to temporarily block the banned user's device from rejoining the experience, and provide a message to the banned user in accordance with the [[30 Official Roblox Docs/Players/Users and players#Ban users|Usage Guidelines]]. You should also post your experience rules somewhere accessible to all users and provide a way for them to appeal. This method is enabled and disabled by the [[30 Official Roblox Docs/API Reference/Classes/Players#BanningEnabled|Players.BanningEnabled]] property, which you can toggle in Studio.

#### Banning and Messaging

Banned users will be immediately evicted and prevented from rejoining your experiences. They will be presented with an error modal displaying the time left on their ban and your `DisplayReason`. Roblox's backend systems will evict players across all servers from the place(s) that you specify. `DisplayReason` can have a maximum length of 400 characters and is subject to a text filter. For more information on acceptable modal text, see [[30 Official Roblox Docs/Players/Users and players#Message guidelines|ban messaging]].

#### Places and Universe

By default, bans extend to any place within that universe. To limit the ban to only the place from which this API is called, configure `ApplyToUniverse` to `false`. However, if a user is banned in the start place of the universe, it effectively results in the user being excluded from the entirety of the universe, irrespective of whether a universal ban is in place or not.

#### Alternative Accounts

Users often play under multiple different accounts, known as alternate accounts, which are sometimes used to circumvent account bans. To help you keep banned users out, the default behavior of this API will propagate all bans from the source account you banned to any of their suspected alternate accounts. You can turn off ban propagations to alternate accounts by configuring `ExcludeAltAccounts` to `true`.

#### Device Blocks

To help address disruptive users who circumvent alternate account detection, set `ApplyDeviceBlock` to `true`. This blocks the banned user's device from rejoining the experience for 24 hours after the ban is applied.

#### Ban Duration

Not all transgressions are the same, so not all bans should be the same length. This API lets you configure the duration of the ban, in seconds, with the `Duration` field. To specify a permanent ban, set the field to `-1`. You may also want to dynamically configure the ban duration based on the user's ban history, which you can query for using [[30 Official Roblox Docs/API Reference/Classes/Players#GetBanHistoryAsync|Players:GetBanHistoryAsync()]]. For example, you may want to consider the number of bans, the duration of previous bans, or build logic off of the notes you save under `PrivateReason` which can be up to 1000 characters and are not text filtered. `PrivateReason` notes are never shared with the client and can be considered safe from attackers.

#### Errors and Throttling

This method invokes an HTTP call to backend services which are subject to throttling and may fail. If you're calling this API with more than one [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]], this method will attempt to make the HTTP call for each ID. It will then aggregate any error messages and join them as a comma separated list. For example, if this method is invoked for five users and requests for those with [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]] 2 and 4 fail, the following error message appears:

`HTTP failure for UserId 2: Timedout, HTTP 504 (Service unavailable) failure for UserId 4: Service exception`

The message will always include `failure for UserId {}` if it is an HTTP error.

#### Client-Side Requirement

Because of the risks associated with banning users, this method may only be called on the backend experience server (client-side calls will result in an error). You may test this API in Studio, during [[30 Official Roblox Docs/Projects/Collaboration|collaborative]] creation, or in a [[30 Official Roblox Docs/Studio/Studio testing modes#Collaborative testing|team test]], but the bans will not apply to production.

This API uses the [User Restrictions Open Cloud API](https://create.roblox.com/docs/cloud/reference/UserRestriction). You will be able to utilize these APIs to manage your bans in third party applications.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | Dictionary |  | - `UserIds` (required; array) — Array of [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]] of players to be banned. Max size is `50`.<br><br>- `ApplyToUniverse` (optional; boolean) — Whether ban propagates to all places within the experience universe. Default is `true`.<br><br>- `Duration` (required; integer) — Duration of the ban, in seconds. Permanent bans should have a value of `-1`. `0` and all other negative values are invalid.<br><br>- `DisplayReason` (required; string) — The message that will be displayed to users when they attempt to and fail to join an experience. Maximum string length is `400`.<br><br>- `PrivateReason` (required; string) — Internal messaging that will be returned when querying the user's ban history. Maximum string length is `1000`.<br><br>- `ExcludeAltAccounts` (optional; boolean) — When `true`, Roblox does not attempt to ban alternate accounts. Default is `false`.<br><br>- `ApplyDeviceBlock` (optional; boolean) — When `true`, Roblox will block banned users' devices from rejoining the experience for 24 hours after the ban is applied. Default is `false`. The block can be overridden by unbanning a user via a call to [[30 Official Roblox Docs/API Reference/Classes/Players#UnbanAsync\|Players:UnbanAsync()]]. Note that unbanning a user through any other method will not lift the device block. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Players-Ban`) are published on the source page; their code is not part of the open-source repo.*

### Chat

```lua
Players:Chat(message: string): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Players

This function makes the local player chat the given message. Since this item is protected, attempting to use it in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] will cause an error.

Instead, when creating a custom chat system, or a system that needs access to the chat, you can use the [[30 Official Roblox Docs/API Reference/Classes/Chat|Chat]] service's [[30 Official Roblox Docs/API Reference/Classes/Chat#Chat|Chat:Chat()]] function instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The message chatted. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Players-Chat1`) are published on the source page; their code is not part of the open-source repo.*

### CreateHumanoidModelFromDescription

> [!warning] Deprecated
> This method has been superseded by
> `Class.Players:CreateHumanoidModelFromDescriptionAsync()|CreateHumanoidModelFromDescriptionAsync()`.

```lua
Players:CreateHumanoidModelFromDescription(description: HumanoidDescription, rigType: HumanoidRigType, assetTypeVerification: AssetTypeVerification = Default): Model
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance, Players · **Tags:** `Yields`, `Deprecated`

Returns a character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] equipped with everything specified in the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]], and is R6 or R15 as specified by `rigType`. This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Players#CreateHumanoidModelFromDescriptionAsync|CreateHumanoidModelFromDescriptionAsync()]], which should be used in new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `description` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | Specifies the appearance of the returned character. |
| `rigType` | [[30 Official Roblox Docs/API Reference/Enums/HumanoidRigType\|HumanoidRigType]] |  | Specifies whether the returned character will be R6 or R15. |
| `assetTypeVerification` | [[30 Official Roblox Docs/API Reference/Enums/AssetTypeVerification\|AssetTypeVerification]] | `Default` | The asset type verification mode. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] | A [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] character [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]. |

### CreateHumanoidModelFromDescriptionAsync

```lua
Players:CreateHumanoidModelFromDescriptionAsync(description: HumanoidDescription, rigType: HumanoidRigType, assetTypeVerification: AssetTypeVerification = Default): Model
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance, Players · **Tags:** `Yields`

Returns a character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] equipped with everything specified in the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]], and is R6 or R15 as specified by `rigType`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `description` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | Specifies the appearance of the returned character. |
| `rigType` | [[30 Official Roblox Docs/API Reference/Enums/HumanoidRigType\|HumanoidRigType]] |  | Specifies whether the returned character will be R6 or R15. |
| `assetTypeVerification` | [[30 Official Roblox Docs/API Reference/Enums/AssetTypeVerification\|AssetTypeVerification]] | `Default` | The asset type verification mode. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] | A [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] character [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]. |

*Code samples for this member (`create-humanoid-model-from-description`) are published on the source page; their code is not part of the open-source repo.*

### CreateHumanoidModelFromUserId

> [!warning] Deprecated
> This method has been superseded by
> `Class.Players:CreateHumanoidModelFromUserIdAsync()|CreateHumanoidModelFromUserIdAsync()`.

```lua
Players:CreateHumanoidModelFromUserId(userId: User): Model
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`, `Deprecated`

Returns a character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] set up with everything equipped to match the avatar of the user specified by the passed in `userId`, including whether that character is currently R6 or R15. This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Players#CreateHumanoidModelFromUserIdAsync|CreateHumanoidModelFromUserIdAsync()]], which should be used in new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The userId for a Roblox user. (The UserId is the number in the profile of the user e.g www.roblox.com/users/1/profile). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] | A Humanoid character Model. |

*Code samples for this member (`create-humanoid-model-from-userid`) are published on the source page; their code is not part of the open-source repo.*

### CreateHumanoidModelFromUserIdAsync

```lua
Players:CreateHumanoidModelFromUserIdAsync(userId: User): Model
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`

Returns a character Model set-up with everything equipped to match the avatar of the user specified by the passed in userId. This includes whether that character is currently R6 or R15.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The userId for a Roblox user. (The UserId is the number in the profile of the user e.g www.roblox.com/users/1/profile). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] | A Humanoid character Model. |

*Code samples for this member (`create-humanoid-model-from-userid`) are published on the source page; their code is not part of the open-source repo.*

### GetBanHistoryAsync

```lua
Players:GetBanHistoryAsync(userId: User): BanHistoryPages
```

**Thread safety:** Unsafe · **Capabilities:** Players, Consequences · **Tags:** `Yields`

Retrieves the ban and unban history of any user within the experience's universe. This method returns a [[30 Official Roblox Docs/API Reference/Classes/BanHistoryPages|BanHistoryPages]] instance that inherits from [[30 Official Roblox Docs/API Reference/Classes/Pages|Pages]]. This method is enabled and disabled by the [[30 Official Roblox Docs/API Reference/Classes/Players#BanningEnabled|Players.BanningEnabled]] property, which you can toggle in Studio.

This function call will only succeed on production servers and not on client devices or in Studio.

This API uses the [User Restrictions Open Cloud API](https://create.roblox.com/docs/cloud/reference/UserRestriction). You will be able to utilize these APIs to manage your bans in third party applications.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the player whose ban history to retrieve. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BanHistoryPages\|BanHistoryPages]] | See [[30 Official Roblox Docs/API Reference/Classes/BanHistoryPages\|BanHistoryPages]] for return reference. |

### GetCharacterAppearanceAsync

> [!warning] Deprecated
> This method is deprecated. Do not use it for new work.

```lua
Players:GetCharacterAppearanceAsync(userId: User): Model
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`, `Deprecated`

This function returns a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] containing the assets which the player is wearing, excluding gear.

If you prefer a Luau table of information about these assets instead of a model, use [[30 Official Roblox Docs/API Reference/Classes/Players#GetCharacterAppearanceInfoAsync|Players:GetCharacterAppearanceInfoAsync()]].

This method behaves similar to [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset|InsertService:LoadAsset()]], and is like using [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset|LoadAsset]] on the asset information returned by [[30 Official Roblox Docs/API Reference/Classes/Players#GetCharacterAppearanceInfoAsync|Players:GetCharacterAppearanceInfoAsync()]] except faster.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the specified player. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] | A [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] containing the assets the player is wearing, excluding gear. |

*Code samples for this member (`how-to-get-a-character-s-appearance`) are published on the source page; their code is not part of the open-source repo.*

### GetCharacterAppearanceInfoAsync

```lua
Players:GetCharacterAppearanceInfoAsync(userId: User): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`

This function returns information about a player's avatar on the Roblox website in the form of a dictionary. It is not to be confused with [[30 Official Roblox Docs/API Reference/Classes/Players#GetCharacterAppearanceAsync|GetCharacterAppearanceAsync]], which actually loads the assets described by this method. You can use [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset|InsertService:LoadAsset()]] to load the assets that are used in the player's avatar. The structure of the returned dictionary is as follows:

| Name | Type | Description |
| --- | --- | --- |
| `assets` | table (see below) | Describes the equipped assets (hats, body parts, etc) |
| `bodyColors` | table (see below) | Describes the BrickColor values for each limb |
| `bodyColor3s` | table (see below) | Describes the Color3 instance for each limb which may not match perfectly with bodyColors |
| `defaultPantsApplied` | bool | Describes whether default pants are applied |
| `defaultShirtApplied` | bool | Describes whether default shirt is applied |
| `emotes` | table (see below) | Describes the equipped emote animations |
| `playerAvatarType` | string | Either "R15" or "R6" |
| `scales` | table (see below) | Describes various body scaling factors |

#### Assets Sub-Table

The `assets` table is an array of tables containing the following keys that describe the assets currently equipped by the player:

| Name | Type | Description |
| --- | --- | --- |
| `id` | number | The asset ID of the equipped asset |
| `assetType` | table | A table with `name` and `id` fields, each describing the kind of asset equipped ("Hat", "Face", etc.) |
| `name` | string | The name of the equipped asset |

#### Scales Sub-Table

The `scales` table has the following keys, each a number corresponding to one [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] scaling property: `bodyType`, `head`, `height`, `proportion`, `depth`, `width`.

#### Body Colors Sub-Table

The `bodyColors` table has the following keys, each a number corresponding to a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]] ID number which can be used with `Datatype.BrickColor.new(id)`: `leftArmColorId`, `torsoColorId`, `rightArmColorId`, `headColorId`, `leftLegColorId`, `rightLegColorId`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The \*_userId_ of the specified player. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing information about the character appearance of a given user. |

*Code samples for this member (`example-return-dictionary`) are published on the source page; their code is not part of the open-source repo.*

### GetFriendsAsync

```lua
Players:GetFriendsAsync(userId: User): FriendPages
```

**Thread safety:** Unsafe · **Capabilities:** Players, Social · **Tags:** `Yields`

The GetFriendsAsync [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] function returns a [[30 Official Roblox Docs/API Reference/Classes/FriendPages|FriendPages]] object which contains information for all of the given user's friends. The items within the [[30 Official Roblox Docs/API Reference/Classes/FriendPages|FriendPages]] object are tables with the following fields:

| Name | Type | Description |
| --- | --- | --- |
| Id | int64 | The friend's UserId |
| Username | string | The friend's username |
| DisplayName | string | The [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName\|display name]] of the friend. |

See the code samples for an easy way to iterate over all a player's friends.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The user ID of the player being specified. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FriendPages\|FriendPages]] | A [[30 Official Roblox Docs/API Reference/Classes/FriendPages\|FriendPages]] object containing information for all of the given user's friends. |

*Code samples for this member (`print-roblox-friends`) are published on the source page; their code is not part of the open-source repo.*

### GetHumanoidDescriptionFromOutfitId

> [!warning] Deprecated
> This method has been superseded by
> `Class.Players:GetHumanoidDescriptionFromOutfitIdAsync()|GetHumanoidDescriptionFromOutfitIdAsync()`.

```lua
Players:GetHumanoidDescriptionFromOutfitId(outfitId: int64): HumanoidDescription
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance, Players · **Tags:** `Yields`, `Deprecated`

Returns the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] for the specified `outfitId`, set with the parts, colors, animations, and other properties of the outfit. An outfit can be one created by a user, or the outfit for a bundle created by Roblox. This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromOutfitIdAsync|GetHumanoidDescriptionFromOutfitIdAsync()]], which should be used in new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `outfitId` | int64 |  | The ID of the outfit for which the HumanoidDescription is sought. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | HumanoidDescription initialized with the specification for the passed in outfitId. |

*Code samples for this member (`get-humanoiddescription-from-outfitid`) are published on the source page; their code is not part of the open-source repo.*

### GetHumanoidDescriptionFromOutfitIdAsync

```lua
Players:GetHumanoidDescriptionFromOutfitIdAsync(outfitId: int64): HumanoidDescription
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance, Players · **Tags:** `Yields`

Returns the HumanoidDescription for a specified outfitId, which will be set with the parts/colors/Animations etc of the outfit. An outfit can be one created by a user, or it can be the outfit for a bundle created by Roblox.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `outfitId` | int64 |  | The ID of the outfit for which the HumanoidDescription is sought. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | HumanoidDescription initialized with the specification for the passed in outfitId. |

*Code samples for this member (`get-humanoiddescription-from-outfitid`) are published on the source page; their code is not part of the open-source repo.*

### GetHumanoidDescriptionFromUserId

> [!warning] Deprecated
> This method has been superseded by
> `Class.Players.GetHumanoidDescriptionFromUserIdAsync|GetHumanoidDescriptionFromUserIdAsync()`.

```lua
Players:GetHumanoidDescriptionFromUserId(userId: User): HumanoidDescription
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance, Players · **Tags:** `Yields`, `Deprecated`

Returns a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] which specifies everything equipped for the avatar of the user specified by the passed in `userId`, including scales and body colors. This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromUserIdAsync|GetHumanoidDescriptionFromUserIdAsync()]], which should be used in new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The userId for a Roblox user. (The UserId is the number in the profile of the user e.g www.roblox.com/users/1/profile). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | HumanoidDescription initialized with the passed in user's avatar specification. |

*Code samples for this member (`get-humanoiddescription-from-userid`) are published on the source page; their code is not part of the open-source repo.*

### GetHumanoidDescriptionFromUserIdAsync

```lua
Players:GetHumanoidDescriptionFromUserIdAsync(userId: User): HumanoidDescription
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance, Players · **Tags:** `Yields`

Returns a HumanoidDescription which specifies everything equipped for the avatar of the user specified by the passed in userId. Also includes scales and body colors.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The userId for a Roblox user. (The UserId is the number in the profile of the user e.g www.roblox.com/users/1/profile). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | HumanoidDescription initialized with the passed in user's avatar specification. |

*Code samples for this member (`get-humanoiddescription-from-userid`) are published on the source page; their code is not part of the open-source repo.*

### GetNameFromUserIdAsync

```lua
Players:GetNameFromUserIdAsync(userId: User): string
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`

The GetNameFromUserIdAsync [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] function will send a query to the Roblox website asking what the username is of the account with the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]].

This method errors if no account exists with the given UserId. If you aren't certain such an account exists, it's recommended to wrap calls to this function with [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]]. In addition, you can manually cache results to make future calls with the same UserId fast. See the code samples to learn more.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the player being specified. |

**Returns**

| Type | Description |
| --- | --- |
| string | The name of a user with the specified [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]]. |

*Code samples for this member (`Name-From-UserId`, `Name-From-UserId-Cache`) are published on the source page; their code is not part of the open-source repo.*

### GetPlayerByUserId

```lua
Players:GetPlayerByUserId(userId: User): Player
```

**Thread safety:** Safe · **Capabilities:** Players

This function searches each [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] in [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] for one whose [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]] matches the given `userId`. If such a player does not exist, it returns `nil`.

This method is useful in finding the purchaser of a developer product using [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#ProcessReceipt|MarketplaceService.ProcessReceipt]] which provides a table that includes the purchaser's [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] and not a reference to the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object itself. Most experiences will require a reference to the player in order to grant products.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the player being specified. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] with the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]], or `nil` if no connected player has that UserId. |

*Code samples for this member (`Players-GetPlayerByUserId1`) are published on the source page; their code is not part of the open-source repo.*

### GetPlayerFromCharacter

```lua
Players:GetPlayerFromCharacter(character: Model): Player
```

**Thread safety:** Unsafe · **Capabilities:** Players

This function returns the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] associated with the given [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]], or `nil` if one cannot be found. It is equivalent to the following function:

```lua
local function getPlayerFromCharacter(character)
	for _, player in game:GetService("Players"):GetPlayers() do
		if player.Character == character then
			return player
		end
	end
end
```

This method is often used when some event in player's character fires (such as their [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Died|dying]]). Such an event might not directly reference the Player object, but this method provides easy access. The inverse of this function can be described as getting the Character of a Player. To do this, simply access the Character property.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] |  | A character instance that you want to get the player from. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose [[30 Official Roblox Docs/API Reference/Classes/Player#Character\|Player.Character]] matches the given model, or `nil` if one cannot be found. |

*Code samples for this member (`Players-GetPlayerFromCharacter1`) are published on the source page; their code is not part of the open-source repo.*

### GetPlayers

```lua
Players:GetPlayers(): List<Player>
```

**Thread safety:** Safe · **Capabilities:** Players

This method returns a table of all presently connected [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] objects. It functions the same way [[30 Official Roblox Docs/API Reference/Classes/Instance#GetChildren|Instance:GetChildren()]] would except that it only returns [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] objects found under [[30 Official Roblox Docs/API Reference/Classes/Players|Players]]. When used with a `for` loop, it is useful for iterating over all players in an experience.

```lua
local Players = game:GetService("Players")

for _, player in Players:GetPlayers() do
	print(player.Name)
end
```

Scripts that connect to [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|Players.PlayerAdded]] are often trying to process every Player that connects to the experience. This method is useful for iterating over already-connected players that wouldn't fire [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|PlayerAdded]]. Using this method ensures that no player is missed!

```lua
local Players = game:GetService("Players")

local function onPlayerAdded(player)
	print("Player: " .. player.Name)
end

for _, player in Players:GetPlayers() do
	onPlayerAdded(player)
end
Players.PlayerAdded:Connect(onPlayerAdded)
```

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]> | A table containing all the players in the server. |

*Code samples for this member (`Give-Sparkles-to-Everyone`) are published on the source page; their code is not part of the open-source repo.*

### getPlayers

> [!warning] Deprecated
> This function is a deprecated variant of `Class.Players:GetPlayers()`
> which should be used instead.

```lua
Players:getPlayers(): List<Player>
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]> |  |

### GetProfileConfigurationFromUserIdAsync

```lua
Players:GetProfileConfigurationFromUserIdAsync(userId: User): ProfileConfiguration
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance, Players · **Tags:** `Yields`

Returns the profile configuration of the user specified by the given [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]] as a dictionary. The dictionary can include a `BackgroundAssetId` field for the user's profile background asset ID and a `FrameAssetId` field for the user's profile frame image asset ID.

Can only be called from the server and is throttled to a limited number of requests per minute.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the user whose profile configuration to retrieve. |

**Returns**

| Type | Description |
| --- | --- |
| ProfileConfiguration | A dictionary containing the user's profile configuration, such as the background asset ID. |

### GetUserIdFromNameAsync

```lua
Players:GetUserIdFromNameAsync(userName: string): int64
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`

This function will send a query to the Roblox website asking what the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]] is of the account with the given [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] name.

This method errors if no account exists with the given username. If you aren't certain such an account exists, it's recommended to wrap calls to this function with [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]]. In addition, you can manually cache results to quickly make future calls with the same username. See the code samples to learn more.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userName` | string |  | The username of the player being specified. |

**Returns**

| Type | Description |
| --- | --- |
| int64 | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of a user whose name is specified. |

*Code samples for this member (`UserId-From-Name`, `UserId-From-Name-Cache`) are published on the source page; their code is not part of the open-source repo.*

### GetUserThumbnailAsync

```lua
Players:GetUserThumbnailAsync(userId: User, thumbnailType: ThumbnailType, thumbnailSize: ThumbnailSize): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Yields`

This function returns the content URL of an image of a player's avatar given their [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]], the desired image size as a [[30 Official Roblox Docs/API Reference/Enums/ThumbnailSize|Enum.ThumbnailSize]] enum, and the desired type as a [[30 Official Roblox Docs/API Reference/Enums/ThumbnailType|Enum.ThumbnailType]] enum. It also returns a boolean describing if the image is ready to use.

Most often, this method is used with [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#Image|ImageLabel.Image]] or [[30 Official Roblox Docs/API Reference/Classes/Decal#Texture|Decal.Texture]] to display user avatar pictures in an experience.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the player being specified. |
| `thumbnailType` | [[30 Official Roblox Docs/API Reference/Enums/ThumbnailType\|ThumbnailType]] |  | A [[30 Official Roblox Docs/API Reference/Enums/ThumbnailType\|Enum.ThumbnailType]] describing the type of thumbnail. |
| `thumbnailSize` | [[30 Official Roblox Docs/API Reference/Enums/ThumbnailSize\|ThumbnailSize]] |  | A [[30 Official Roblox Docs/API Reference/Enums/ThumbnailSize\|Enum.ThumbnailSize]] specifying the size of the thumbnail. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing the content URL of a user thumbnail based on the specified parameters, and a bool describing if the image is ready to be used or not. |

*Code samples for this member (`display-player-thumbnail`) are published on the source page; their code is not part of the open-source repo.*

### playerFromCharacter

> [!warning] Deprecated
> This function is a deprecated variant of
> `Class.Players:GetPlayerFromCharacter()` which should be used in new work.

```lua
Players:playerFromCharacter(character: Model): Player
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `character` | [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] |  |  |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  |

### players

> [!warning] Deprecated
> This item has been superseded by `Class.Players:GetPlayers()` which should
> be used in all new work.

```lua
Players:players(): List<Player>
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

This function was once used to return a list of players in an experience, but has since been deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/Players#GetPlayers|Players:GetPlayers()]]

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]> |  |

### SetChatStyle

```lua
Players:SetChatStyle(style: ChatStyle = Classic): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Players

This function sets whether BubbleChat and ClassicChat are being used, and tells TeamChat and Chat what to do using the [[30 Official Roblox Docs/API Reference/Enums/ChatStyle|Enum.ChatStyle]] enum. Since this item is protected, attempting to use it in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] will cause an error.

This function is used internally when the chat mode is set by the experience.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `style` | [[30 Official Roblox Docs/API Reference/Enums/ChatStyle\|ChatStyle]] | `Classic` | The specified chat style being set. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`setting-a-player-s-chat-style`) are published on the source page; their code is not part of the open-source repo.*

### TeamChat

```lua
Players:TeamChat(message: string): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Players

This function makes the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] chat the given message, which will only be viewable by users on the same team. Since this item is protected, attempting to use it in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] will cause an error.

This function is used internally when the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]] sends a message to their team.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The message being chatted. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`sending-team-chat`) are published on the source page; their code is not part of the open-source repo.*

### UnbanAsync

```lua
Players:UnbanAsync(config: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players, Consequences · **Tags:** `Yields`

Unbans players banned from [[30 Official Roblox Docs/API Reference/Classes/Players#BanAsync|Players:BanAsync()]] or the [User Restrictions Open Cloud API](https://create.roblox.com/docs/cloud/reference/UserRestriction). This method is enabled and disabled by the [[30 Official Roblox Docs/API Reference/Classes/Players#BanningEnabled|Players.BanningEnabled]] property, which you can toggle in Studio.

Like [[30 Official Roblox Docs/API Reference/Classes/Players#BanAsync|Players:BanAsync()]], this method takes in a `config` dictionary that will let you bulk unban users. This configures the users that are unbanned and the scope from which they are unbanned from.

Unbans will only take effect on bans with the same `ApplyToUniverse` scope. For example, an unban with `ApplyToUniverse` set to `true` will not invalidate a previous ban with `ApplyToUniverse` set to `false`. In other words, a universe level unban will not invalidate a place level ban. The opposite also holds true.

For the case where a user's device may be blocked by a ban where `ApplyDeviceBlock` was set to `true`, an unban applied by this method will override the device block for the unbanned player. Please note that unbanning a user through any other method, such as the Open Cloud API or the Creator Hub, will not lift the device block.

This method invokes a HTTP call to backend services, which are throttled and may fail. If you are calling this API with multiple UserIds, this method will attempt to make this HTTP call for each UserId. It will then aggregate any error messages and join them as a comma separated list. For example, if this method is invoked for five `UserIds`: `{1, 2, 3, 4, 5}` and requests for users 2 and 4 fail then the following error message appears: `HTTP failure for UserId 2: Timedout, HTTP 504 (Service unavailable) failure for UserId 4: Service exception.` The message will always include `failure for UserId {}` if it is an HTTP error. It is undefined behavior if you pass in both valid and invalid UserIds, i.e. a `UserId` that is not a positive number, as some network requests may succeed before all input is validated.

Because of the risks associated with banning users, this method may only be called on the backend server. Client side calls will result in an error. You may test this API in Studio, Team Create, and Team Test, but the bans will not apply to production. This function call will only attempt ban requests on production servers and not in Studio testing. However, all input validation steps will still work in Studio.

This API uses the [User Restrictions Open Cloud API](https://create.roblox.com/docs/cloud/reference/UserRestriction). You will be able to utilize these APIs to manage your bans in third party applications.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `config` | Dictionary |  | \| Name \| Type \| Description \| \| --- \| --- \| --- \| \| `UserIds` \| array \| UserIDs to be force allowed into the experience(s). <br> <br>Max size is `50`. \| \| `ApplyToUniverse` \| boolean \| Propagates the unban to all places within this universe. \| |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Players-Unban`) are published on the source page; their code is not part of the open-source repo.*

## Events

### PlayerAdded

```lua
Players.PlayerAdded(player: Player)
```

**Capabilities:** Players

This event fires when a player enters the experience, such as loading the player's saved [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStore]] data.

This can be used alongside the [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerRemoving|Players.PlayerRemoving]] event, which fires when a player is about to leave the experience. For instance, if you would like print a message every time a new player joins or leaves:

```lua
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	print(player.Name .. " joined the experience!")
end)

Players.PlayerRemoving:Connect(function(player, reason)
	print(player.Name .. " left the experience! Reason: " .. tostring(exitReason))
end)
```

If you want to track when a player's character is added or removed from the experience, such as when a player respawns or dies, you can use the [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAdded|Player.CharacterAdded]] and [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterRemoving|Player.CharacterRemoving]] functions.

Note that this event does not work as expected in a solo playtest mode because the player is created before scripts run that connect to [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|PlayerAdded]]. To handle this case, as well as cases in which the script is added into the experience after a player enters, create an `onPlayerAdded()` function that you can call to handle a player's entrance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | An instance of the player that joined the experience. |

*Code samples for this member (`Players-PlayerAdded1`) are published on the source page; their code is not part of the open-source repo.*

### PlayerMembershipChanged

```lua
Players.PlayerMembershipChanged(player: Player)
```

**Capabilities:** Players

This event fires when the experience server recognizes that a player's membership has changed. Note, however, that the server will only attempt to check and update the membership **after** the Premium modal has been closed. Thus, to account for cases where the user purchases Premium **outside** of the experience while playing, you must still prompt them to purchase Premium; this will then show a message telling them they're already upgraded and, once they close the modal, the server will update their membership and trigger this event.

To learn more about and incorporating Premium into your experience and monetizing with the engagement-based payouts system, see [[30 Official Roblox Docs/Production/Monetization/Engagement-based payouts|Engagement-Based Payouts]].

See also:

- [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPremiumPurchase|MarketplaceService:PromptPremiumPurchase()]], used to prompt a user to purchase Premium
- [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService#PromptPremiumPurchaseFinished|MarketplaceService.PromptPremiumPurchaseFinished]], fires when the Premium purchase UI closes

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose membership has changed. |

*Code samples for this member (`handling-premium-membership-changes`) are published on the source page; their code is not part of the open-source repo.*

### PlayerRemoving

```lua
Players.PlayerRemoving(player: Player, reason: PlayerExitReason)
```

**Capabilities:** Players

This event fires right before a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] leaves the experience, before [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildRemoved|ChildRemoved]] fires on [[30 Official Roblox Docs/API Reference/Classes/Players|Players]], and behaves somewhat similarly to [[30 Official Roblox Docs/API Reference/Classes/Instance#DescendantRemoving|Instance.DescendantRemoving]]. Since it fires before the actual removal of a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]], this event is useful for storing player data using a [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore|GlobalDataStore]].

This can be used alongside the [[30 Official Roblox Docs/API Reference/Classes/Player|Player.PlayerAdded]] event, which fires when a player joins the experience. For instance, to print a message every time a new player joins or leaves:

```lua
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	print(player.Name .. " joined the experience!")
end)

Players.PlayerRemoving:Connect(function(player, exitReason)
	print(player.Name .. " left the experience! - Reason: " .. tostring(exitReason))
end)
```

If you want to track when a player's character is added or removed from the experience, such as when a player respawns or dies, you can use the [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAdded|Player.CharacterAdded]] and [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterRemoving|Player.CharacterRemoving]] functions.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | An instance of the player that is leaving. |
| `reason` | [[30 Official Roblox Docs/API Reference/Enums/PlayerExitReason\|PlayerExitReason]] |  | Enum.PlayerExitReason in attempt to inform why. |

*Code samples for this member (`Players-PlayerRemoving1`) are published on the source page; their code is not part of the open-source repo.*

### UserSubscriptionStatusChanged

```lua
Players.UserSubscriptionStatusChanged(user: Player, subscriptionId: string)
```

**Capabilities:** Players, Monetization

This event fires when the experience server recognizes that the user's status for a certain subscription has changed. Note that the server only attempts to check and update the status **after** the Subscription Purchase modal has been closed. To account for cases in which the user purchases the subscription **outside** of the experience while playing, you must still prompt them to purchase the subscription; the prompt shows a message telling the user they're already subscribed, and after they close the modal, the server updates their subscription status and triggers this event.

Note that only server scripts receive this event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `user` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | User whose subscription status has changed. |
| `subscriptionId` | string |  | The ID of the subscription with a status change. |

---
*Source: [Players](https://create.roblox.com/docs/reference/engine/classes/Players) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
