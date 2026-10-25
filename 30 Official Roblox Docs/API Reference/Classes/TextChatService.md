---
title: "TextChatService"
description: "A service handling in-experience text chat."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TextChatService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service handling in-experience text chat.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

A service handling in-experience text chat, including managing [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannels]], decorating messages, filtering text, creating [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommands]], and [[30 Official Roblox Docs/Chat/Examples/Custom text chat UI|developing custom chats interfaces]]. To learn more, see [[30 Official Roblox Docs/Chat/Text chat overview|text chat overview]].

For further customization, `TextChatService` has the following singleton children:

- [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]]
- [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration|ChatInputBarConfiguration]]
- [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]]
- [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration|ChannelTabsConfiguration]]

To display content from a [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] in a custom location, place a [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]] under a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] or [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#ChatTranslationEnabled\|ChatTranslationEnabled]] | boolean | Determines whether a user has chat translation enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#ChatVersion\|ChatVersion]] | [[30 Official Roblox Docs/API Reference/Enums/ChatVersion\|ChatVersion]] | **Deprecated.** Determines whether to fully enable [[30 Official Roblox Docs/API Reference/Classes/TextChatService\|TextChatService]] or revert to the legacy chat system. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CreateDefaultCommands\|CreateDefaultCommands]] | boolean | Determines whether [[30 Official Roblox Docs/API Reference/Classes/TextChatService\|TextChatService]] should create default [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand\|TextChatCommands]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CreateDefaultTextChannels\|CreateDefaultTextChannels]] | boolean | Determines whether [[30 Official Roblox Docs/API Reference/Classes/TextChatService\|TextChatService]] should create default [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannels]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#PlatformIntegratedChat\|PlatformIntegratedChat]] | [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|RolloutState]] | Determines whether platform-integrated chat is enabled for the experience. Requires `RobloxScript` security. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CanUserChatAsync\|CanUserChatAsync()]] | boolean | Determines whether a user has permission to chat in experiences. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CanUsersChatAsync\|CanUsersChatAsync()]] | boolean | Determines whether or not two users can receive messages from each other. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CanUsersDirectChatAsync\|CanUsersDirectChatAsync()]] | Array | Determines whether a user has permission to chat directly with other users in experiences based on factors such as their parental control settings. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#DisplayBubble\|DisplayBubble()]] | () | Displays a chat bubble above the provided part or player character. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#GetChatGroupsAsync\|GetChatGroupsAsync()]] | Array | Returns chat group IDs that indicate which players can synchronously text chat together. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#BubbleDisplayed\|BubbleDisplayed]] | `partOrCharacter`, `textChatMessage` | Fires when [[30 Official Roblox Docs/API Reference/Classes/TextChatService#DisplayBubble\|TextChatService:DisplayBubble()]] is called. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#MessageReceived\|MessageReceived]] | `textChatMessage` | Fires when [[30 Official Roblox Docs/API Reference/Classes/TextChannel#DisplaySystemMessage\|TextChannel:DisplaySystemMessage()]] is invoked on the client, or when the client receives a valid [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync\|TextChannel:SendAsync()]] response from the server. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#SendingMessage\|SendingMessage]] | `textChatMessage` | Fires when [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync\|TextChannel:SendAsync()]] is called by the sending client. |

### Callbacks

| Callback | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnBubbleAdded\|OnBubbleAdded()]] | Tuple | Called when a bubble chat is about to be displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnChatWindowAdded\|OnChatWindowAdded()]] | Tuple | Called when a new message is about to be displayed in the chat window. This can only be implemented on the client. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage\|OnIncomingMessage()]] | Tuple | Called when [[30 Official Roblox Docs/API Reference/Classes/TextChatService\|TextChatService]] is receiving an incoming message. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ChatTranslationEnabled

**Type:** boolean

**Security:** read None / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat · **Tags:** `NotReplicated`

Determines whether a user has chat translation enabled. If `true`, messages the user receives will be translated into their preferred language. Use [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Translation|TextChatMessage.Translation]] to get the message translation. This property is client-side only and reflects the user's own preference; read it from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] to adapt custom chat UIs when the user toggles translation.

### ChatVersion

> [!warning] Deprecated
> This property has been deprecated in newly created Studio experiences.
> `TextChatService` is the only allowed chat system and is automatically
> enabled.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ChatVersion|ChatVersion]]

**Security:** read None / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Chat

Determines whether to fully enable [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] or revert to the legacy chat system. Setting this property to [[30 Official Roblox Docs/API Reference/Enums/ChatVersion|Enum.ChatVersion.LegacyChatService]] effectively disables [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].

### CreateDefaultCommands

**Type:** boolean

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Chat

Determines whether [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] should create default [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommands]]. If `true`, the following [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommands]] are created and put in a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] named **TextChatCommands** inside [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]]:

| Name | Primary Alias | Secondary Alias | Description | Usage Example |
| --- | --- | --- | --- | --- |
| **RBXClearCommand** | clear | cls | Clears the chat log for the local user. | `/cls` |
| **RBXConsoleCommand** | console |  | Opens the Developer Console. | `/console` |
| **RBXEmoteCommand** | emote | e | Plays an avatar emote. | `/e dance` |
| **RBXHelpCommand** | help | ? | Shows a list of chat commands. | `/help` |
| **RBXMuteCommand** | mute | m | Mutes a user by their [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Name]] or [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName\|DisplayName]] in all [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannels]]. | `/m Username` |
| **RBXTeamCommand** | team | t | Enters team chat mode where messages are only visible to teammates. | `/t` |
| **RBXUnmuteCommand** | unmute | um | Unmutes a user by their [[30 Official Roblox Docs/API Reference/Classes/Instance#Name\|Name]] or [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName\|DisplayName]] in all [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannels]]. | `/um Username` |
| **RBXVersionCommand** | version | v | Shows the chat version. | `/version` |
| **RBXWhisperCommand** | whisper | w | Enters whisper mode with another [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]. | `/w DisplayName` or `/w @Username` |

Note that you can edit, create, and remove [[30 Official Roblox Docs/API Reference/Classes/TextChatCommand|TextChatCommands]] even if [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CreateDefaultCommands|CreateDefaultCommands]] is `true`. Also note that mute and unmute commands apply to all [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannels]].

### CreateDefaultTextChannels

**Type:** boolean

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Chat

Determines whether [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] should create default [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannels]]. If `true`, a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] named **TextChannels** is created inside [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] at runtime to contain the [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannels]] outlined in the table below. Each of the default channels has the described special behavior applied to messages using its internally bound [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]] callback function, changing how messages appear when sent through the channel. The callback is assigned automatically either at runtime (if the [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] exists) or when the [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] is created.

| Channel | Description |
| --- | --- |
| **RBXGeneral** | [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]] for player messages. In the chat window, messages are modified such that [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#PrefixText\|PrefixText]] receives a [[30 Official Roblox Docs/UI/Rich text markup\|rich text]] font color tag to give chatting players their distinctive name color. If [[30 Official Roblox Docs/API Reference/Classes/Player#Team\|Player.Team]] exists, that [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor\|Team.TeamColor]] is used instead of the default name color. |
| **RBXSystem** | [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]] for system messages. In the chat window, messages are modified such that [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Text\|TextChatMessage.Text]] is given a light grey color tag by default, or a red color tag if [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Metadata\|TextChatMessage.Metadata]] contains the word `"Error"`. |
| **RBXTeam[BrickColor]** | [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]] for team-specific player messages, created when a [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor\|TeamColor]] is in use by any [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]] within the [[30 Official Roblox Docs/API Reference/Classes/Teams\|Teams]] service. Name of the created channel is **RBXTeam** followed by the [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor\|TeamColor]] name. For example, **RBXTeamCrimson** is a [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]] created when there is an active team whose [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor\|TeamColor]] property is the "Crimson" [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]].<br><br>In the chat window, messages are modified such that [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#PrefixText\|PrefixText]] is colored according to the [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor\|TeamColor]] and is prepended with **[Team]**.<br><br>Team channels create [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSources]] for all non‑[[30 Official Roblox Docs/API Reference/Classes/Player#Neutral\|Neutral]] players with the matching [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor\|TeamColor]], allowing them to use team‑only chat. Channels are removed if there are no remaining teams with an associated [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor\|TeamColor]]. |
| **RBXWhisper:[UserId1]_[UserId2]** | [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]] for whisper messages between two players, created when a player uses the `/whisper` command on another player. For example **RBXWhisper:2276836_505306092** is a [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]] for players with [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]] **2276836** and **505306092**. Inside whisper channels are two [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSources]] associated with the respective [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]].<br><br>In the chat window, messages are colored the same as those in **RBXGeneral** and [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#PrefixText\|TextChatMessage.PrefixText]] is modified to show whether a message was sent from or received by the local user.<br><br>Whisper channels are removed when either player leaves the experience. |

Note that the default [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]] callbacks can be overwritten. Also note that you can edit, create, and remove [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannels]] even if [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CreateDefaultTextChannels|CreateDefaultTextChannels]] is `true`.

Messages from different TextChannels can be separated into different tabs in the chat window using [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration|ChannelTabsConfiguration]].

### PlatformIntegratedChat

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RolloutState|RolloutState]]

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Chat

Requires `RobloxScript` security; not accessible from experience scripts. Controls whether platform-integrated chat is enabled for the experience. When set to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enum.RolloutState.Enabled]], [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage|TextChatService.OnIncomingMessage]] and [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]] callbacks from developer scripts are not invoked, and only CoreScripts can set those callbacks. When set to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enum.RolloutState.Disabled]], behavior is explicitly disabled. Defaults to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enum.RolloutState.Default]].

## Methods

### CanUserChatAsync

```lua
TextChatService:CanUserChatAsync(userId: User): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Chat · **Tags:** `Yields`

Determines whether a user has permission to chat in experiences. Factors such as parental control settings may prevent the user from sending messages. Errors if the `userId` is not in the current server. Note that this method can be used with all current player [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]] in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Server]] or [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Legacy]]. This method can also be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] but only with the [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] of the local player.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the user whose chat permission is being checked. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean indicating whether the user has permission to chat. |

### CanUsersChatAsync

```lua
TextChatService:CanUsersChatAsync(userIdFrom: User, userIdTo: User): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Chat · **Tags:** `Yields`

Determines whether or not two users can receive messages from each other. Both users must be in the current server, otherwise an error will occur.

Factors such as incompatible parental control settings or blocked status may prevent the delivery of messages between users ([[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannels]] internally use this result to determine whether to deliver messages between users). Note that this method is only available for use in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Server]] or [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Legacy]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userIdFrom` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the potential message sender. |
| `userIdTo` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the potential message receiver. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | A boolean indicating whether the two users can exchange messages. |

### CanUsersDirectChatAsync

```lua
TextChatService:CanUsersDirectChatAsync(requesterUserId: User, userIds: Array): Array
```

**Thread safety:** Unsafe · **Capabilities:** Chat · **Tags:** `Yields`

Determines whether a user has permission to chat directly with other users in experiences based on their parental control settings, such as a whisper channel between two users. To be used when:

- The line of communication is user-initiated (not developer- or gameplay-initiated).
- Access to the communication is closed and limited.

You may use this method to gate certain features in your experience depending on the result.

When creating a [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] for a direct chat, use [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SetDirectChatRequester|TextChannel:SetDirectChatRequester]] to set the `requesterUserId` so that the channel can determine whether to deliver messages between users. When [[30 Official Roblox Docs/API Reference/Classes/TextChannel#DirectChatRequester|TextChannel.DirectChatRequester]] is non-`nil`, [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannels]] internally use this result to determine whether to deliver messages between users.

Note that this method is only available for use in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Server]] or [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Legacy]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `requesterUserId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The user who would have initiated the direct chat request. If the user is not in the current server, this method will error. |
| `userIds` | Array |  | A list of users who the `requesterUserId` would like to chat with directly. Users not in the current server are ignored. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A list of users who could participate in the direct chat request. If none of the users can direct chat with the `requesterUserId`, the result is an empty array. |

*Code samples for this member (`TextChatService-User-Chat`) are published on the source page; their code is not part of the open-source repo.*

### DisplayBubble

```lua
TextChatService:DisplayBubble(partOrCharacter: Instance, message: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Chat

Displays a chat bubble above the provided part or player character, and fires the [[30 Official Roblox Docs/API Reference/Classes/TextChatService#BubbleDisplayed|BubbleDisplayed]] event with the parameters specified in this method. Can display bubbles for non-player characters (NPCs) if you specify a part within the character, such as its head.

Note that this method is only available for use in [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], or in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `partOrCharacter` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The part or character that the bubble to be displayed above. |
| `message` | string |  | The text to be displayed in the chat bubble. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetChatGroupsAsync

```lua
TextChatService:GetChatGroupsAsync(players: Instances): Array
```

**Thread safety:** Unsafe · **Capabilities:** Chat · **Tags:** `Yields`

Returns a sorted array of arrays of chat group IDs for the given players. Each chat group ID is a string that represents a communication-compatible group within the current universe.

If two or more players share the same chat group ID, those players are able to synchronously text chat with each other based on their age-check status and chat settings.

This method is server-side only and intended for real-time use cases such as matchmaking and teleporting. It is more efficient than calling [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CanUsersChatAsync|TextChatService:CanUsersChatAsync()]] pairwise when evaluating many players at once, since pairwise checks scale as N^2 and cannot be merged across player lists. Chat group IDs are unique to the current universe, may change over time, and should not be stored once the user has left the experience. While you can hold onto the data returned for the purposes of gameplay while the user is in the experience, this data should not be stored after they've left.

To use this method, you must enable **Chat & Voice Groups APIs** in **Experience Settings** ⟩ **Communication** in Roblox Studio and agree to the Roblox Terms of Use.

In Roblox Studio this API is only available when the experience is running in **Team Test**.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `players` | Instances |  | A list of [[30 Official Roblox Docs/API Reference/Classes/Player\|Players]] currently in the experience to evaluate for text chat compatibility. |

**Returns**

| Type | Description |
| --- | --- |
| Array | A sorted array of arrays of chat group ID strings. Players who share a matching chat group ID are eligible to synchronously text chat with each other. |

*Code samples for this member (`TextChatService-Chat-Groups-Teleport`, `TextChatService-GetChatGroupsAsync`) are published on the source page; their code is not part of the open-source repo.*

## Events

### BubbleDisplayed

```lua
TextChatService.BubbleDisplayed(partOrCharacter: Instance, textChatMessage: TextChatMessage)
```

**Capabilities:** Chat

Fires when [[30 Official Roblox Docs/API Reference/Classes/TextChatService#DisplayBubble|TextChatService:DisplayBubble()]] is called.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `partOrCharacter` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The part or character that the bubble chat is displayed above. |
| `textChatMessage` | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] |  | The [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] associated with the bubble. |

### MessageReceived

```lua
TextChatService.MessageReceived(textChatMessage: TextChatMessage)
```

**Capabilities:** Chat

Like [[30 Official Roblox Docs/API Reference/Classes/TextChannel#MessageReceived|TextChannel.MessageReceived]], fires when [[30 Official Roblox Docs/API Reference/Classes/TextChannel#DisplaySystemMessage|TextChannel:DisplaySystemMessage()]] is invoked on the client, or when the client receives a valid [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync|TextChannel:SendAsync()]] response from the server. This event is only fired on the client.

If the server's [[30 Official Roblox Docs/API Reference/Classes/TextChannel#ShouldDeliverCallback|TextChannel.ShouldDeliverCallback]] property is bound and returns `false`, the client will not fire [[30 Official Roblox Docs/API Reference/Classes/TextChatService#MessageReceived|TextChatService.MessageReceived]].

Use the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] parameter to get the [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] and the text of the message (with [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Text|TextChatMessage.Text]]).

The [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] parameter is the final result of any functions bound to [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage|TextChatService.OnIncomingMessage]] or [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `textChatMessage` | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] |  | The received [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]]. |

### SendingMessage

```lua
TextChatService.SendingMessage(textChatMessage: TextChatMessage)
```

**Capabilities:** Chat

Fires when [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync|TextChannel:SendAsync()]] is called by the sending client. Use this to allow placeholder messages to be shown to the user while waiting for server response to [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync|TextChannel:SendAsync()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `textChatMessage` | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] |  | The [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] from the [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync\|TextChannel:SendAsync()]] call. |

## Callbacks

### OnBubbleAdded

```lua
TextChatService.OnBubbleAdded(message: TextChatMessage, adornee: Instance): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Chat

Called when a bubble chat is about to be displayed. This can only be implemented on the client.

Use this to customize individual bubble chat messages. If this callback returns a [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties|BubbleChatMessageProperties]], those properties will be applied to the associated bubble, overriding [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]] properties. If a [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]], [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]], or [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] is parented under [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties|BubbleChatMessageProperties]], they will also override their respective counterparts defined in [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]].

If the chat message is sent by a player, `message.TextSource` will correspond to that player, and `adornee` will be `nil`.

If the chat message is sent via [[30 Official Roblox Docs/API Reference/Classes/TextChatService#DisplayBubble|TextChatService:DisplayBubble]], `adornee` will be the `partOrCharacter` provided, and `message.TextSource` will be `nil`.

When bound to the client sending a message, this callback is run twice: first when the message is initially sent and received locally, then again when the client receives the result of the filtered message from the server.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] |  | The incoming [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]]. |
| `adornee` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The part or character the bubble chat message is attached to. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | If a [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties\|BubbleChatMessageProperties]] is returned, its properties override the [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration\|BubbleChatConfiguration]] properties. |

### OnChatWindowAdded

```lua
TextChatService.OnChatWindowAdded(message: TextChatMessage): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Chat

Called when a new message is about to be displayed in the chat window. This can only be implemented on the client.

Use this to customize individual messages that appear in the chat window. If this callback returns a [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties|ChatWindowMessageProperties]], those properties will be applied to the associated message, overriding [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]] properties. If a [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] is parented under [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties|ChatWindowMessageProperties]], it will also override the [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#TextColor3|TextColor3]] property defined in [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration|ChatWindowConfiguration]].

When bound to the client sending a message, this callback is run twice: first when the message is initially sent and received locally, then again when the client receives the result of the filtered message from the server.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] |  | The incoming [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]]. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | If a [[30 Official Roblox Docs/API Reference/Classes/ChatWindowMessageProperties\|ChatWindowMessageProperties]] is returned, its properties override the [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration\|ChatWindowConfiguration]] properties. |

### OnIncomingMessage

```lua
TextChatService.OnIncomingMessage(message: TextChatMessage): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Chat

Called when [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] is receiving an incoming message. Can only be implemented on the client.

Use this to decorate [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessages]]. If this callback returns a [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties|TextChatMessageProperties]], those properties are merged with the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] parameter to create a new [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]].

When bound to the client sending a message, this callback is run twice; first when the message is initially sent and received locally, and again when the client receives the result of the filtered message from the server.

Note that this [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage|TextChatService.OnIncomingMessage]] callback runs **before** any [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]] callbacks.

This should be defined only once in the source code. Multiple bindings will override one another in a non‑deterministic manner. This callback is not invoked when [[30 Official Roblox Docs/API Reference/Classes/TextChatService#PlatformIntegratedChat|TextChatService.PlatformIntegratedChat]] is set to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enum.RolloutState.Enabled]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] |  | The incoming [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]]. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | If a [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties\|TextChatMessageProperties]] is returned, those properties are merged with the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] parameter to create a new [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] with those properties, otherwise, if `nil` is returned, then [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] is not changed. |

---
*Source: [TextChatService](https://create.roblox.com/docs/reference/engine/classes/TextChatService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
