---
title: "SocialService"
description: "Facilitates social functions that impact relationships made on the Roblox platform."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SocialService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Facilitates social functions that impact relationships made on the Roblox platform.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

**SocialService** facilitates social functions that impact relationships made on the Roblox platform. Its primary usage is to show [[30 Official Roblox Docs/Production/Promotion/Player invite prompts|invite prompts]] and the phone book to players, allowing them to send invitation requests to their friends through [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptGameInvite|PromptGameInvite()]] and [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptPhoneBook|PromptPhoneBook()]] respectively. You may leverage signals when such requests are made.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#CanSendCallInviteAsync\|CanSendCallInviteAsync()]] | boolean | Indicates whether the given [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] can invite other players to a call. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#CanSendGameInviteAsync\|CanSendGameInviteAsync()]] | boolean | Indicates whether the given [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] can invite other players. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetEventRsvpStatusAsync\|GetEventRsvpStatusAsync()]] | [[30 Official Roblox Docs/API Reference/Enums/RsvpStatus\|RsvpStatus]] | Returns the local player's RSVP status for the given event. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetExperienceEventAsync\|GetExperienceEventAsync()]] | ExperienceEvent? | Returns details for the specified experience event or `nil` if it is unavailable. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetPartyAsync\|GetPartyAsync()]] | Array | Returns an array of dictionaries containing data for all members of the specified party who are currently in the experience. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetPlayersByPartyId\|GetPlayersByPartyId()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]> | Returns a table of all presently connected [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] objects whose [[30 Official Roblox Docs/API Reference/Classes/Player#PartyId\|Player.PartyId]] property matches the passed `partyId`. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetUpcomingExperienceEventsAsync\|GetUpcomingExperienceEventsAsync()]] | List<ExperienceEvent> | Returns active and upcoming experience events for the current experience. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#HideSelfView\|HideSelfView()]] | () | Hides the calling player's self view. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptFeedbackSubmissionAsync\|PromptFeedbackSubmissionAsync()]] | () | Prompts the player to submit feedback or a player support ticket about the current experience. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptGameInvite\|PromptGameInvite()]] | () | Prompts the given [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] with the invite screen. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptLinkSharing\|PromptLinkSharing()]] | Tuple | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptLinkSharingAsync\|PromptLinkSharingAsync()]] | Tuple | Generates an expiring share link and prompts the given [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] with the platform share sheet. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptPhoneBook\|PromptPhoneBook()]] | () | Prompts the given [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] with the phone book. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptRsvpToEventAsync\|PromptRsvpToEventAsync()]] | [[30 Official Roblox Docs/API Reference/Enums/RsvpStatus\|RsvpStatus]] | Prompts the local [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] with a prompt to change their RSVP status to the given event. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#ShowSelfView\|ShowSelfView()]] | () | Shows the calling player's self view. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#CallInviteStateChanged\|CallInviteStateChanged]] | `player`, `inviteState` | Fires when a player's call invite state changes. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#GameInvitePromptClosed\|GameInvitePromptClosed]] | `player`, `recipientIds` | Fires when a player closes an invite prompt. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#PhoneBookPromptClosed\|PhoneBookPromptClosed]] | `player` | Fires when a player closes the phone book prompt. |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#ShareSheetClosed\|ShareSheetClosed]] | `player` | Fires when the player closes the share sheet opened by [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptLinkSharingAsync\|PromptLinkSharingAsync()]]. |

### Callbacks

| Callback | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SocialService#OnCallInviteInvoked\|OnCallInviteInvoked()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Callback for when a call is placed from the phone book. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CanSendCallInviteAsync

```lua
SocialService:CanSendCallInviteAsync(player: Instance): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Social · **Tags:** `Yields`

Returns `true` if the given [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] can send a call invite to a friend. You should always use the result of this method before calling [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptPhoneBook|PromptPhoneBook()]] since the ability to open the phone book may vary depending on the player.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] instance of the player potentially sending a call invite. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the specified player can send a call invite. |

*Code samples for this member (`SocialService-PromptPhoneBook`) are published on the source page; their code is not part of the open-source repo.*

### CanSendGameInviteAsync

```lua
SocialService:CanSendGameInviteAsync(player: Instance, recipientId: User = U1.AQAAAAAAAAAAAAAAAAAAAAA): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Social · **Tags:** `Yields`

[[30 Official Roblox Docs/API Reference/Classes/SocialService#CanSendGameInviteAsync|CanSendGameInviteAsync()]] returns `true` if the given [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] can invite other players to the current experience. You should always use the result of this method before calling [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptGameInvite|PromptGameInvite()]] since the ability to invite players may vary depending on the platform or player.

See [[30 Official Roblox Docs/Production/Promotion/Player invite prompts|Player Invite Prompts]] for more details on implementing player invite prompts, customizing prompts and notifications, and using launch data.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] instance of the player potentially sending an invite. |
| `recipientId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] | `U1.AQAAAAAAAAAAAAAAAAAAAAA` | Optional [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the potential **recipient**, used to check whether the sender can invite that specific recipient. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the specified player can send an invite. |

*Code samples for this member (`sending-a-game-invite`) are published on the source page; their code is not part of the open-source repo.*

### GetEventRsvpStatusAsync

```lua
SocialService:GetEventRsvpStatusAsync(eventId: string): RsvpStatus
```

**Thread safety:** Unsafe · **Capabilities:** Social · **Tags:** `Yields`

Returns the local player's RSVP status for the given event. Events must be in the current experience and must not have already started. If the event has already started, this method will return an error.

Use [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetUpcomingExperienceEventsAsync|GetUpcomingExperienceEventsAsync()]] to obtain a valid event ID at runtime rather than hardcoding one. Note that you can use [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptRsvpToEventAsync|PromptRsvpToEventAsync()]] to prompt the player to change their RSVP status for the event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `eventId` | string |  | The event ID of the event to prompt the player to change their RSVP status for. This must be a valid event ID that exists in the current experience, represented as a string (not a number). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/RsvpStatus\|RsvpStatus]] | Returns an [[30 Official Roblox Docs/API Reference/Enums/RsvpStatus\|Enum.RsvpStatus]] indicating the player's current RSVP status for the event. If the player has not RSVP'd to the event, this will return [[30 Official Roblox Docs/API Reference/Enums/RsvpStatus\|Enum.RsvpStatus.None]]. |

*Code samples for this member (`SocialService-PromptRsvpToEventAsync`) are published on the source page; their code is not part of the open-source repo.*

### GetExperienceEventAsync

```lua
SocialService:GetExperienceEventAsync(eventId: string): ExperienceEvent?
```

**Thread safety:** Unsafe · **Capabilities:** Social · **Tags:** `Yields`

`GetExperienceEventAsync()` yields until the request completes and then returns a dictionary describing the requested event. The dictionary contains the following fields:

- `Id` (string)
- `Title` (string)
- `Subtitle` (string)
- `Description` (string)
- `DisplayTitle` (string)
- `DisplaySubtitle` (string)
- `DisplayDescription` (string)
- `ThumbnailIds` (array of numbers): Asset IDs for the event thumbnails. The first ID is the primary thumbnail.
- `StartTime` (dictionary)
  - `Day` (number)
  - `Year` (number)
  - `Month` (number)
  - `Minute` (number)
  - `Millisecond` (number)
  - `Hour` (number)
  - `Second` (number)
- `EndTime` (dictionary)
  - `Day` (number)
  - `Year` (number)
  - `Month` (number)
  - `Minute` (number)
  - `Millisecond` (number)
  - `Hour` (number)
  - `Second` (number)
- `HasStarted` (boolean)
- `HasEnded` (boolean)
- `Status` ([[30 Official Roblox Docs/API Reference/Enums/ExperienceEventStatus|Enum.ExperienceEventStatus]])
- `UserRsvpStatus` ([[30 Official Roblox Docs/API Reference/Enums/RsvpStatus|Enum.RsvpStatus]] or `nil`)

If the event cannot be found, belongs to a different experience, or the response is malformed, this method returns `nil`. Requests may also fail with a `HttpError <status>` message if the service returns an unexpected error code.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `eventId` | string |  | The string identifier of the event to retrieve. Must correspond to an event in the current experience. |

**Returns**

| Type | Description |
| --- | --- |
| ExperienceEvent? | A dictionary describing the event, or `nil` if the event does not exist, belongs to another experience, or is otherwise unavailable. |

*Code samples for this member (`SocialService-GetUpcomingExperienceEventsAsync`) are published on the source page; their code is not part of the open-source repo.*

### GetPartyAsync

```lua
SocialService:GetPartyAsync(partyId: string): Array
```

**Thread safety:** Unsafe · **Capabilities:** Social · **Tags:** `Yields`

Returns an array of dictionaries containing data for all members associated with the given `partyId`. The returned array reflects the current state of the party across all active server instances within the experience and it is ordered by the time each party member accepted the party invite. This means the first element in the array is the earliest to accept and the last is the most recent.

This method is useful for retrieving up-to-date information about all party members currently in the experience and across different servers, enabling coordinated group behavior such as teleportation, matchmaking, or party-based gameplay logic.

Each dictionary in the returned array contains the following fields:

| Key | Value Type | Description |
| --- | --- | --- |
| `UserId` | number | The player's [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] property. |
| `PlaceId` | number | The [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|DataModel.PlaceId]] of the place the party member is currently in. |
| `JobId` | string | The [[30 Official Roblox Docs/API Reference/Classes/DataModel#JobId\|DataModel.JobId]] of the server instance the user currently resides in. |
| `PrivateServerId` | string | If applicable, the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PrivateServerId\|DataModel.PrivateServerId]] when the party member is in a private or reserved server. |
| `ReservedServerAccessCode` | string | If applicable, the access code for the reserved server that the user currently resides in. Useful for teleporting party members to each other using [[30 Official Roblox Docs/API Reference/Classes/TeleportService#TeleportAsync\|TeleportService:TeleportAsync()]]. |

To test this service in your experience, use the [[30 Official Roblox Docs/Studio/Studio testing modes#Party simulation|Party Simulator]] in Roblox Studio or publish the experience and play it in the Roblox application.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `partyId` | string |  | The unique identifier of the party to retrieve member data for, corresponding to a [[30 Official Roblox Docs/API Reference/Classes/Player#PartyId\|Player.PartyId]] value. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of dictionaries representing the members of the specified party who are currently in the experience. |

*Code samples for this member (`SocialService-GetPartyAsync`) are published on the source page; their code is not part of the open-source repo.*

### GetPlayersByPartyId

```lua
SocialService:GetPlayersByPartyId(partyId: string): List<Player>
```

**Thread safety:** Unsafe · **Capabilities:** Social

Returns a table of all presently connected [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] objects whose [[30 Official Roblox Docs/API Reference/Classes/Player#PartyId|Player.PartyId]] property matches the provided `partyId`. This method behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/Players#GetPlayers|Players:GetPlayers()]] but filters the results to include only those players belonging to the specified party.

To test this service in your experience, use the [[30 Official Roblox Docs/Studio/Studio testing modes#Party simulation|Party Simulator]] in Roblox Studio or publish the experience and play it in the Roblox application.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `partyId` | string |  | The unique identifier of the party to filter players by, corresponding to a [[30 Official Roblox Docs/API Reference/Classes/Player#PartyId\|Player.PartyId]] value. |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]> | A table of [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] objects whose [[30 Official Roblox Docs/API Reference/Classes/Player#PartyId\|Player.PartyId]] property matches the passed `partyId`. |

*Code samples for this member (`SocialService-GetPlayersByPartyId`, `Party-Team-Integration`) are published on the source page; their code is not part of the open-source repo.*

### GetUpcomingExperienceEventsAsync

```lua
SocialService:GetUpcomingExperienceEventsAsync(): List<ExperienceEvent>
```

**Thread safety:** Unsafe · **Capabilities:** Social · **Tags:** `Yields`

`GetUpcomingExperienceEventsAsync()` yields while the client requests data for the current experience and then returns an array of dictionaries, each with the same structure described in [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetExperienceEventAsync|GetExperienceEventAsync()]]. The array includes only events that are currently active or have not yet ended, excluding cancelled, moderated, or unpublished events. Results are sorted so the soonest start time appears first.

Use this method to discover valid event IDs at runtime rather than hardcoding them; hardcoded IDs become stale when events end and cause RSVP prompts to fail until the experience is republished.

If the service indicates there are no matching events, this method returns an empty array. Requests may raise a `HttpError <status>` message if the service returns an unexpected error code.

**Returns**

| Type | Description |
| --- | --- |
| List<ExperienceEvent> | An array of dictionaries describing each active or upcoming event in the current experience, ordered by soonest start time first. |

*Code samples for this member (`SocialService-GetUpcomingExperienceEventsAsync`) are published on the source page; their code is not part of the open-source repo.*

### HideSelfView

```lua
SocialService:HideSelfView(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Social

Hides the calling player's self view. If this method is called while the self view is already hidden, it does nothing.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### PromptFeedbackSubmissionAsync

```lua
SocialService:PromptFeedbackSubmissionAsync(options: Dictionary?): ()
```

**Thread safety:** Unsafe · **Capabilities:** Social · **Tags:** `Yields`

Displays a dialog to the player, allowing them to provide feedback about their experience or submit a player support ticket.

- The submitted feedback becomes available to developers in the Creator Dashboard under the **Audience** > **Feedback** section.
- The submitted player support requests become available to developers in the Creator Dashboard under the **Audience** > **Player Support** section. The Player Support flow is currently in **alpha** and is only available to select experiences.

This method yields until the player either submits feedback, dismisses the dialog, or a timeout is reached. As an asynchronous operation, it should be called using `task.spawn()` or within a coroutine.

#### Feedback Types

The `FeedbackType` key in the options dictionary determines which flow is displayed:

- [Enum.FeedbackType.Feedback](https://create.roblox.com/docs/reference/engine/enums/FeedbackType) (default) — Displays a general feedback prompt where the player can rate and comment on the experience.
- [Enum.FeedbackType.PlayerSupport](https://create.roblox.com/docs/reference/engine/enums/FeedbackType) — (**Alpha; select experiences only**) Displays a player support flow where the player can submit a categorized support ticket directly to the experience developer. This enables in-experience customer support without requiring players to leave the game.

#### Feedback Flow

When `FeedbackType` is [Enum.FeedbackType.Feedback](https://create.roblox.com/docs/reference/engine/enums/FeedbackType) (or omitted), the player is shown a general feedback prompt where they can rate and optionally comment on the experience. Submitted feedback appears in the Creator Dashboard under **Audience** > **Feedback**. Players can submit feedback once per day per experience.

#### Player Support Flow (Alpha)

When `FeedbackType` is set to [Enum.FeedbackType.PlayerSupport](https://create.roblox.com/docs/reference/engine/enums/FeedbackType), the player is guided through a support ticket submission flow. This flow is currently in **alpha** and is only available to select experiences. The prompt presents a form where the player selects a category, writes a description of their issue, and chooses whether to share their user ID with the developer. The available categories are:

| Category | Description |
| --- | --- |
| Bug Report | The player is reporting a bug or technical issue. |
| Data Restore Request | The player is requesting that lost or corrupted data be restored. |
| Purchasing Issue | The player has an issue with an in-experience purchase. |
| Other | A general issue that does not fit the other categories. |

The player also chooses whether to share their [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]] with the developer as part of the ticket.

#### Eligibility

Before showing the prompt, this method performs an eligibility check. The eligibility rules differ depending on the feedback type.

A player is ineligible for the **Feedback** flow if:

- The player is the experience owner (developers cannot submit feedback for their own experiences).
- The player has been rate limited (submitted too many reviews recently).
- The player does not meet age requirements.

A player is ineligible for the **Player Support** flow if:

- The player does not meet age requirements.
- The player already has 5 in-progress tickets.
- The player is banned from the experience.

If the player is ineligible, the prompt displays a message indicating that feedback or support is unavailable and the method returns without error.

#### Notes

- This service does not work during playtesting in Roblox Studio. To test the feedback prompt, you must publish the experience and play it in the Roblox application.
- The method will time out and resume if the player does not interact with the prompt within a reasonable period.
- If the submission fails due to a text filter violation or network error, the player is notified within the dialog.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `options` | Dictionary? |  | Optional `Dictionary` configuring the prompt. Supported keys: - `FeedbackType` ([Enum.FeedbackType](https://create.roblox.com/docs/reference/engine/enums/FeedbackType)). Selects which feedback flow to display. Defaults to [Enum.FeedbackType.Feedback](https://create.roblox.com/docs/reference/engine/enums/FeedbackType). |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`PromptFeedbackSubmissionAsync`, `PromptFeedbackSubmissionAsync-PlayerSupport`) are published on the source page; their code is not part of the open-source repo.*

### PromptGameInvite

```lua
SocialService:PromptGameInvite(player: Instance, experienceInviteOptions: Instance = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Social

[[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptGameInvite|PromptGameInvite()]] displays an invite prompt to the local player through which they may invite their friends to the current experience. Before calling this method, you should use [[30 Official Roblox Docs/API Reference/Classes/SocialService#CanSendGameInviteAsync|CanSendGameInviteAsync()]] to determine whether the player can send an invite, as this ability may vary depending on the platform or player.

See [[30 Official Roblox Docs/Production/Promotion/Player invite prompts|Player Invite Prompts]] for more details on implementing invite prompts, customizing prompts and notifications, and using launch data.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to prompt with the invite popup. |
| `experienceInviteOptions` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | Optional [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions\|ExperienceInviteOptions]] object for customizing the prompt. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`sending-a-game-invite`) are published on the source page; their code is not part of the open-source repo.*

### PromptLinkSharing

> [!warning] Deprecated
> Use
> `Class.SocialService:PromptLinkSharingAsync()|PromptLinkSharingAsync()`
> instead.

```lua
SocialService:PromptLinkSharing(player: Player, options: Dictionary = nil): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Social · **Tags:** `Yields`, `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | Prompts the given [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] with a Roblox platform-level share sheet with a generated share link. |
| `options` | Dictionary | `nil` | `Dictionary` that specifies the configuration for the generated link. It includes the following optional key-value pairs:<br><br>- `FallbackLinkId` (string). Determines how this share link will direct player to once expired. Default to experience join link. - `ExpirationSeconds` (number). Determines time to expiration once the share link is created. Truncates to nearest integer. Defaults to 86,400. - `PreviewTitle` (string) Preview title of the share link. - `PreviewDescription` (string) Preview description of the share link. - `PreviewAssetId` (number) Image asset ID used for share link preview. - `LaunchData` (string). Used to set a parameter in [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData\|Player:GetJoinData()]] when a player joined using the generated share link. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing an [Enum.PromptLinkSharingResult](https://create.roblox.com/docs/reference/engine/enums/PromptLinkSharingResult) indicating the result of the link sharing prompt. |

### PromptLinkSharingAsync

```lua
SocialService:PromptLinkSharingAsync(player: Player, options: Dictionary = nil): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Social · **Tags:** `Yields`

This call is restricted to server scripts. After a link is successfully generated, the target player will either be prompted to open a share sheet with the generated link, or the link will be copied directly to the clipboard if share sheet functionality is not available to the player.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | Prompts the given [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] with a Roblox platform-level share sheet with a generated share link. |
| `options` | Dictionary | `nil` | `Dictionary` that specifies the configuration for the generated link. It includes the following optional key-value pairs:<br><br>- `FallbackLinkId` (string). Determines how this share link will direct player to once expired. Default to experience join link. - `ExpirationSeconds` (number). Determines time to expiration once the share link is created. Truncates to nearest integer. Defaults to 86,400. - `PreviewTitle` (string) Preview title of the share link. - `PreviewDescription` (string) Preview description of the share link. - `PreviewAssetId` (number) Image asset ID used for share link preview. - `LaunchData` (string). Used to set a parameter in [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData\|Player:GetJoinData()]] when a player joined using the generated share link. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing an [Enum.PromptLinkSharingResult](https://create.roblox.com/docs/reference/engine/enums/PromptLinkSharingResult) indicating the result of the link sharing prompt. |

*Code samples for this member (`SocialService-PromptLinkSharingAsync`) are published on the source page; their code is not part of the open-source repo.*

### PromptPhoneBook

```lua
SocialService:PromptPhoneBook(player: Instance, tag: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Social

Prompts the given [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] with the phone book. If the player chooses to call someone, the [[30 Official Roblox Docs/API Reference/Classes/SocialService#CallInviteStateChanged|CallInviteStateChanged]] event fires. You should use [[30 Official Roblox Docs/API Reference/Classes/SocialService#CanSendCallInviteAsync|CanSendCallInviteAsync()]] prior to calling [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptPhoneBook|PromptPhoneBook()]] since the ability to see the phone book may vary depending on the player.

If a player is not eligible to open the phone book, an error dialog is shown.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The player to prompt with the phone book. |
| `tag` | string |  | String to help differentiate between various phone book "entry points" or similar. For example, you can pass a string defining what region of an experience the calling player's character is currently in. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`SocialService-PromptPhoneBook`) are published on the source page; their code is not part of the open-source repo.*

### PromptRsvpToEventAsync

```lua
SocialService:PromptRsvpToEventAsync(eventId: string): RsvpStatus
```

**Thread safety:** Unsafe · **Capabilities:** Social · **Tags:** `Yields`

`PromptRsvpToEventAsync()` displays a prompt to the local player through which they may change their RSVP status to the given event.

Events must be in the current experience and must not have already started. If the event has already started, this method will return an error.

Note that you can use [[30 Official Roblox Docs/API Reference/Classes/SocialService#GetEventRsvpStatusAsync|GetEventRsvpStatusAsync()]] to check the player's current RSVP status before calling this method.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `eventId` | string |  | The event ID of the event to prompt the player to change their RSVP status for. This must be a valid event ID that exists in the current experience, represented as a string (not a number). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/RsvpStatus\|RsvpStatus]] | Returns a [[30 Official Roblox Docs/API Reference/Enums/RsvpStatus\|Enum.RsvpStatus]] indicating the player's new RSVP status after the prompt is closed. If the player closes the prompt without changing their RSVP status, this will return [[30 Official Roblox Docs/API Reference/Enums/RsvpStatus\|Enum.RsvpStatus.None]] or their old [[30 Official Roblox Docs/API Reference/Enums/RsvpStatus\|Enum.RsvpStatus]] if they had already selected a status. |

*Code samples for this member (`SocialService-PromptRsvpToEventAsync`) are published on the source page; their code is not part of the open-source repo.*

### ShowSelfView

```lua
SocialService:ShowSelfView(selfViewPosition: SelfViewPosition = LastPosition): ()
```

**Thread safety:** Unsafe · **Capabilities:** Social

Shows the calling player's self view. If this method is called while the self view is already visible, it does nothing.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `selfViewPosition` | [[30 Official Roblox Docs/API Reference/Enums/SelfViewPosition\|SelfViewPosition]] | `LastPosition` | The position to place the self view . |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### CallInviteStateChanged

```lua
SocialService.CallInviteStateChanged(player: Instance, inviteState: InviteState)
```

**Capabilities:** Social

This event fires when a player's call invite state changes.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] instance of the player who had a call invite state change. |
| `inviteState` | [[30 Official Roblox Docs/API Reference/Enums/InviteState\|InviteState]] |  | The new call invite state. |

*Code samples for this member (`SocialService-CallInviteStateChanged`) are published on the source page; their code is not part of the open-source repo.*

### GameInvitePromptClosed

```lua
SocialService.GameInvitePromptClosed(player: Instance, recipientIds: Array)
```

**Capabilities:** Social

This event fires when a player closes an invite prompt.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] instance of the player who closed the prompt. |
| `recipientIds` | Array |  | No longer populated; an empty array. |

### PhoneBookPromptClosed

```lua
SocialService.PhoneBookPromptClosed(player: Instance)
```

**Capabilities:** Social

Fires when a player closes the phone book prompt.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] instance of the player who closed the phone book. |

### ShareSheetClosed

```lua
SocialService.ShareSheetClosed(player: Player)
```

**Capabilities:** Social

Fires on the server when the player closes or dismisses the platform share sheet that was opened as a result of a successful call to [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptLinkSharingAsync|PromptLinkSharingAsync()]]. The `player` argument is the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] who closed the share sheet.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] who closed the share sheet. |

## Callbacks

### OnCallInviteInvoked

```lua
SocialService.OnCallInviteInvoked(tag: string, callParticipantIds: Array): Instance
```

**Thread safety:** Unsafe · **Capabilities:** Social

A callback to process when a call is placed from the phone book. The `tag` parameter can be used to differentiate between different "entry points" or similar, as described in [[30 Official Roblox Docs/API Reference/Classes/SocialService#PromptPhoneBook|PromptPhoneBook()]]. Only one callback can be set.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tag` | string |  | String to help differentiate between various phone book entry points. |
| `callParticipantIds` | Array |  | Array containing all of the players involved in the call. The caller will always be the first player in the array. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Table including the `PlaceId` and `ReservedServerAccessCode` keys whose values are the [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|DataModel.PlaceId]] and the server access code returned by [[30 Official Roblox Docs/API Reference/Classes/TeleportService#ReserveServerAsync\|TeleportService:ReserveServerAsync()]], respectively. |

*Code samples for this member (`SocialService-OnCallInviteInvoked`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [SocialService](https://create.roblox.com/docs/reference/engine/classes/SocialService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
