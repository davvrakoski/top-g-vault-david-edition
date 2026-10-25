---
title: "Chat"
description: "Houses the Luau code responsible for running the legacy chat system."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Chat"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Houses the Luau code responsible for running the legacy chat system.*

> [!warning] Deprecated
> This class is deprecated. Use `Class.TextChatService` instead.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

The **Chat** service houses the Luau code responsible for running the [[30 Official Roblox Docs/Chat/Text chat overview#Migrate from legacy chat|legacy chat system]]. Similar to [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]], default objects like [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] and [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] are inserted into the service.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Chat#BubbleChatEnabled\|BubbleChatEnabled]] | boolean | Determines whether player's chat messages will appear above their in-game avatar. |
| [[30 Official Roblox Docs/API Reference/Classes/Chat#LoadDefaultChat\|LoadDefaultChat]] | boolean | Toggles whether the default chat framework should be automatically loaded when the game runs. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Chat#CanUserChatAsync\|CanUserChatAsync()]] | boolean | Will return false if the player with the specified [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] is not allowed to chat because of their account settings. |
| [[30 Official Roblox Docs/API Reference/Classes/Chat#CanUsersChatAsync\|CanUsersChatAsync()]] | boolean | Will return false if the two users cannot communicate because their account settings do not allow it. |
| [[30 Official Roblox Docs/API Reference/Classes/Chat#Chat\|Chat()]] | () | Fires the [[30 Official Roblox Docs/API Reference/Classes/Chat#Chatted\|Chat.Chatted]] event with the parameters specified in this method. |
| [[30 Official Roblox Docs/API Reference/Classes/Chat#FilterStringAsync\|FilterStringAsync()]] | string | Filters a string sent from a player to another player using filtering that is appropriate to the players' account settings. |
| [[30 Official Roblox Docs/API Reference/Classes/Chat#FilterStringForBroadcast\|FilterStringForBroadcast()]] | string | Filters a string sent from a player meant for broadcast to no particular target. More restrictive than [[30 Official Roblox Docs/API Reference/Classes/Chat#FilterStringAsync\|Chat:FilterStringAsync()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Chat#FilterStringForPlayerAsync\|FilterStringForPlayerAsync()]] | string | **Deprecated.** Filters a string appropriate to the given player's age settings, so they see what is appropriate to them. |
| [[30 Official Roblox Docs/API Reference/Classes/Chat#InvokeChatCallback\|InvokeChatCallback()]] | Tuple | Invoke a chat callback function registered by [[30 Official Roblox Docs/API Reference/Classes/Chat#RegisterChatCallback\|RegisterChatCallback]]. Used by the Luau Chat System. |
| [[30 Official Roblox Docs/API Reference/Classes/Chat#RegisterChatCallback\|RegisterChatCallback()]] | () | Register a function to be called upon the invocation of some chat system event ([[30 Official Roblox Docs/API Reference/Classes/Chat#InvokeChatCallback\|InvokeChatCallback]]). |
| [[30 Official Roblox Docs/API Reference/Classes/Chat#SetBubbleChatSettings\|SetBubbleChatSettings()]] | () | Customizes various settings of the in-game bubble chat. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Chat#Chatted\|Chatted]] | `part`, `message`, `color` | Fires when [[30 Official Roblox Docs/API Reference/Classes/Chat#Chat\|Chat:Chat()]] is called. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### BubbleChatEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

If true, entering a message in the chat will result in a chat bubble popping up above the player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]]. This behavior can either be enabled by directly ticking this checkbox in Studio, or by using a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]:

```lua
local ChatService = game:GetService("Chat")
ChatService.BubbleChatEnabled = true
```

This must be done on the client, toggling this value in a server-side [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] will have no effect.

### LoadDefaultChat

**Type:** boolean

**Security:** read None / write NotAccessibleSecurity · **Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Chat

When set to `true` (the default), the engine inserts the default Luau chat system scripts (such as `ChatScript` and `BubbleChat`) into the `Chat` service at runtime. Setting this to `false` prevents the legacy chat framework from loading, which is useful if you are replacing it with a custom chat implementation or migrating to [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].

This property defaults to `true`. It is not writable by scripts at runtime.

## Methods

### CanUserChatAsync

```lua
Chat:CanUserChatAsync(userId: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Chat · **Tags:** `Yields`

Returns whether the player identified by `userId` is permitted to use in-game text chat. The check evaluates the player's chat privacy mode, third-party platform restrictions, and any active moderation timeouts.

On the server, the specified player must be connected to the current server; otherwise the call errors. On the client, the method must be called only for the local player's [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | int64 |  |  |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### CanUsersChatAsync

```lua
Chat:CanUsersChatAsync(userIdFrom: int64, userIdTo: int64): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Chat · **Tags:** `Yields`

Returns whether two players are permitted to exchange chat messages with each other. The method evaluates user blocking, age-based communication constraints, and chat privacy mode compatibility between the two accounts.

This method can only be called from server-side [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]]. Both players must be connected to the current server; otherwise the call errors.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userIdFrom` | int64 |  |  |
| `userIdTo` | int64 |  |  |

**Returns**

| Type | Description |
| --- | --- |
| boolean |  |

### Chat

```lua
Chat:Chat(partOrCharacter: Instance, message: string, color: ChatColor = Blue): ()
```

**Thread safety:** Unsafe · **Capabilities:** Chat

The Chat function fires the [[30 Official Roblox Docs/API Reference/Classes/Chat#Chatted|Chat.Chatted]] event with the parameters specified in this method.

By default, there is a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] inside of each player's [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] object named _BubbleChat_, which causes a dialog-like billboard to appear above the _partOrCharacter_ when the chatted event is fired.

_Note:_ Since dialogs are controlled by a LocalScript, you will not be able to see any dialogs created from this method unless you are running in _Play Solo_ mode.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `partOrCharacter` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | An instance that is the part or character which the _BubbleChat_ dialog should appear above. |
| `message` | string |  | The message string being chatted. |
| `color` | [[30 Official Roblox Docs/API Reference/Enums/ChatColor\|ChatColor]] | `Blue` | An [[30 Official Roblox Docs/API Reference/Enums/ChatColor\|Enum.ChatColor]] specifying the color of the chatted message. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Chat-Chat1`) are published on the source page; their code is not part of the open-source repo.*

### FilterStringAsync

```lua
Chat:FilterStringAsync(stringToFilter: string, playerFrom: Player, playerTo: Player): string
```

**Thread safety:** Unsafe · **Capabilities:** Chat · **Tags:** `Yields`

**Partial Deprecation Warning**: Calling this function from the client using a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] is deprecated, and will be disabled in the future. Text filtering should be done from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] on the server using the similarly-named [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterStringAsync|TextService:FilterStringAsync()]], which uses a different set of parameters and return type.

Games that do not properly filter player-generated text might be subject to moderation action. Please be sure a game properly filters text before publishing it.

**FilterStringAsync** filters a string using filtering that is appropriate for the sending and receiving player. If the filtered string is to be used for a persistent message, such as the name of a shop, writing on a plaque, etc, then the function should be called with the author as both the sender and receiver.

This function should be used **every time** a player can enter custom text in **any context**, most commonly using a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]]. Some examples of text to be filtered:

- Custom chat messages
- Custom character names
- Names for a shop in a tycoon-style game

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `stringToFilter` | string |  | The raw string to be filtered, exactly as entered by the player. |
| `playerFrom` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The author of the text. |
| `playerTo` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The intended recipient of the provided text; use the author if the text is persistent (see description). |

**Returns**

| Type | Description |
| --- | --- |
| string |  |

### FilterStringForBroadcast

```lua
Chat:FilterStringForBroadcast(stringToFilter: string, playerFrom: Player): string
```

**Thread safety:** Unsafe · **Capabilities:** Chat · **Tags:** `Yields`

Filters a string sent from _playerFrom_ for broadcast to no particular target. The filtered message has more restrictions than [[30 Official Roblox Docs/API Reference/Classes/Chat#FilterStringAsync|Chat:FilterStringAsync()]].

Some examples of where this method could be used:

- Message walls
- Cross-server shouts
- User-created signs

Calling FilterString from [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] is deprecated and will be disabled in the future. Text filtering should be done from server-side [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] using FilterStringAsync.

_Note:_ A game not using this filter function for custom chat or other user generated text may be subjected to moderation action.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `stringToFilter` | string |  | Message string being filtered. |
| `playerFrom` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | Instance of the player sending the message. |

**Returns**

| Type | Description |
| --- | --- |
| string | Filtered message string. |

*Code samples for this member (`Chat-FilterStringForBroadcast`) are published on the source page; their code is not part of the open-source repo.*

### FilterStringForPlayerAsync

> [!warning] Deprecated
> This item has been superseded by `Class.Chat:FilterStringAsync()` and
> `Class.Chat:FilterStringForBroadcast()` which should be used in all new
> work

```lua
Chat:FilterStringForPlayerAsync(stringToFilter: string, playerToFilterFor: Player): string
```

**Thread safety:** Unsafe · **Capabilities:** Chat · **Tags:** `Yields`, `Deprecated`

The FilterStringForPlayerAsync function filters a string appropriate to the given player's age settings, so they see what is appropriate to them. This function will only work if called from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] on the server. If called on a client it will fail.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `stringToFilter` | string |  | String being filtered. |
| `playerToFilterFor` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | Player that the string is being filtered for. |

**Returns**

| Type | Description |
| --- | --- |
| string | Filtered string result. |

### InvokeChatCallback

```lua
Chat:InvokeChatCallback(callbackType: ChatCallbackType, callbackArguments: Tuple): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Chat

InvokeChatCallback will call a function registered by [[30 Official Roblox Docs/API Reference/Classes/Chat#RegisterChatCallback|RegisterChatCallback]], given the ChatCallbackType enum and the arguments to send the function. It will return the result of the registered function, or raise an error if no function has been registered.

This function is called by the Luau Chat System so that chat callbacks may be registered to change the behavior of certain features. Unless you are replacing the default Luau Chat System with your own, you should not need to call this function. You can read about the different callback functions at [[30 Official Roblox Docs/API Reference/Classes/Chat#RegisterChatCallback|Chat:RegisterChatCallback()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `callbackType` | [[30 Official Roblox Docs/API Reference/Enums/ChatCallbackType\|ChatCallbackType]] |  | The type of callback to invoke. |
| `callbackArguments` | Tuple |  | The arguments that will be sent to the registered callback function. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | The values returned by the function registered to the given ChatCallbackType. |

### RegisterChatCallback

```lua
Chat:RegisterChatCallback(callbackType: ChatCallbackType, callbackFunction: Function): ()
```

**Thread safety:** Unsafe · **Capabilities:** Chat

RegisterChatCallback binds a function to some chat system event in order to affect the behavior of the Luau chat system. The first argument determines the event (using the [[30 Official Roblox Docs/API Reference/Enums/ChatCallbackType|Enum.ChatCallbackType]] enum) to which the second argument, the function, shall be bound. The default Luau chat system uses [[30 Official Roblox Docs/API Reference/Classes/Chat#InvokeChatCallback|InvokeChatCallback]] to invoke registered functions. Attempting to register a server- or client- only callback on a peer that isn't a server or client respectively will raise an error. The following sections describe in what ways registered functions will be used.

#### OnCreatingChatWindow

Client-only. Invoked before the client constructs the chat window. Must return a table of settings to be merged into the information returned by the ChatSettings module.

#### OnClientFormattingMessage

Client-only. Invoked before the client displays a message (whether it is a player chat message, system message, or /me command). This function is invoked with the message object and may (or may not) return a table to be merged into `message.ExtraData`.

#### OnClientSendingMessage

Not invoked at this time.

#### OnServerReceivingMessage

Server-only. Invoked when the server receives a message from a speaker (note that speakers may not necessarily be a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] chatting). This callback is called with the Message object. The function can make changes to the Message object to change the manner in which the message is processed. **The Message object must be returned for this callback to do anything.** Setting this callback can allow the server to, for example:

- Set `message.ShouldDeliver` to false in order to cancel delivery of the message to players (useful for implementing a chat exclusion list)
- Get/set the speaker's name color (`message.ExtraData.NameColor`, a Color3) on a message-by-message basis

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `callbackType` | [[30 Official Roblox Docs/API Reference/Enums/ChatCallbackType\|ChatCallbackType]] |  | The callback to which the function shall be registered (this determines in what way the function is called). |
| `callbackFunction` | Function |  | The function to call when the callback is invoked using Chat:InvokeChatCallback. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetBubbleChatSettings

```lua
Chat:SetBubbleChatSettings(settings: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Chat

This function customizes various settings of the in-game bubble chat.

Before using this, make sure that bubble chat is enabled by setting [[30 Official Roblox Docs/API Reference/Classes/Chat#BubbleChatEnabled|Chat.BubbleChatEnabled]] to true.

The settings argument is a table where the keys are the names of the settings you want to edit and the values are what you want to change these settings to. Note that you don't have to include all of them in the settings argument, omitting some will result in them keeping their default value.

This function is client-side only, attempting to call it on the server will trigger an error.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `settings` | Variant |  | A settings table. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`customize-visual-aspects`, `restore-default-settings`) are published on the source page; their code is not part of the open-source repo.*

## Events

### Chatted

```lua
Chat.Chatted(part: Instance, message: string, color: ChatColor)
```

**Capabilities:** Chat

Fires when [[30 Official Roblox Docs/API Reference/Classes/Chat#Chat|Chat:Chat()]] is called. The event passes the part or character the message is associated with, the message string, and the [[30 Official Roblox Docs/API Reference/Enums/ChatColor|Enum.ChatColor]]. When fired on the server, the event replicates to all connected clients. The default `BubbleChat` [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] listens for this event and displays a chat bubble above the specified part or character.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  |  |
| `message` | string |  |  |
| `color` | [[30 Official Roblox Docs/API Reference/Enums/ChatColor\|ChatColor]] |  |  |

---
*Source: [Chat](https://create.roblox.com/docs/reference/engine/classes/Chat) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
