---
title: "TextChannel"
description: "Represents a text chat channel."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TextChannel"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents a text chat channel.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Represents a text chat channel. Contains [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSources]] as descendants.

To send a chat message to the [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]], call [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync|TextChannel:SendAsync()]] from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]. The corresponding [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] of the user with `TextSource.CanSend = true` must be in that channel.

Messages from different TextChannels can be separated into different tabs in the chat window using [[30 Official Roblox Docs/API Reference/Classes/ChannelTabsConfiguration|ChannelTabsConfiguration]]. Multiple channels with the same name might cause unexpected behavior with the chat window, even if the player isn't a member of the other channels.

To learn more, see [[30 Official Roblox Docs/Chat/Text chat overview|In-Experience Text Chat]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChannel#DirectChatRequester\|DirectChatRequester]] | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] | The `TextChannel` will only deliver messages to users that can send direct messages to the `DirectChatRequester`. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChannel#AddUserAsync\|AddUserAsync()]] | Tuple | Adds a [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSource]] to the [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]] given userId of a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChannel#DisplaySystemMessage\|DisplaySystemMessage()]] | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] | Displays a system message to the user. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync\|SendAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] | Sends a [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] to the server. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SetDirectChatRequester\|SetDirectChatRequester()]] | () | Sets the [[30 Official Roblox Docs/API Reference/Classes/TextChannel#DirectChatRequester\|DirectChatRequester]] for the `TextChannel`. The `TextChannel` will only deliver messages to users that can send direct messages to the `DirectChatRequester`. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChannel#MessageReceived\|MessageReceived]] | `incomingMessage` | Fires when [[30 Official Roblox Docs/API Reference/Classes/TextChannel#DisplaySystemMessage\|TextChannel:DisplaySystemMessage()]] is invoked on the client, or when the client receives a valid [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync\|TextChannel:SendAsync()]] response from the server. |

### Callbacks

| Callback | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage\|OnIncomingMessage()]] | Tuple | Called when [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]] is receiving an incoming message. |
| [[30 Official Roblox Docs/API Reference/Classes/TextChannel#ShouldDeliverCallback\|ShouldDeliverCallback()]] | Tuple | Called for each client when [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]] is receiving an incoming message to determine whether or not it should be delivered to that client. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### DirectChatRequester

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Player|Player]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Chat · **Tags:** `ReadOnly`, `NotReplicated`

The `TextChannel` will only deliver messages to users that can send direct messages to the `DirectChatRequester`. This property can only be set using [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SetDirectChatRequester|SetDirectChatRequester()]].

## Methods

### AddUserAsync

```lua
TextChannel:AddUserAsync(userId: User): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Chat · **Tags:** `Yields`

Adds a [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] to the [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] given userId of the user (with [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]]). Can only be used in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

If a [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] representing the user does not exist, this adds a [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]].

If a [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] representing the user does exist, this returns the [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]].

If the user has chat off or isn't in the server, this returns a tuple `nil`, `false`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `userId` | [[30 Official Roblox Docs/API Reference/Datatypes/User\|User]] |  | The userId of the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Returns [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSource]] and `true` if a new [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSource]] is created for the user, [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSource]] and `false` if there is an existing [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSource]], or `nil` and `false` if the user has chat off or is not in this server. |

### DisplaySystemMessage

```lua
TextChannel:DisplaySystemMessage(systemMessage: string, metadata: string): TextChatMessage
```

**Thread safety:** Unsafe · **Capabilities:** Chat

Displays a system message to user. Can only be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], or in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]]. Messages are only visible to that user and aren't automatically filtered or localized.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `systemMessage` | string |  | The system message sent to the [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]]. |
| `metadata` | string |  | Use to identify system message types, such as the default system messages. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] | A [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] with [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Status\|TextChatMessage.Status]] property that indicates the condition of the message. |

### SendAsync

```lua
TextChannel:SendAsync(message: string, metadata: string): TextChatMessage
```

**Thread safety:** Unsafe · **Capabilities:** Chat · **Tags:** `Yields`

Sends a [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] to the server. Can only be used in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], or in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]]. Please note that only messages typed and sent by the user will be delivered.

The `metadata` argument has a limit of 200 characters. If this is called with a `metadata` argument that has more than 200 characters, the message will not be sent to other users. Instead, the sender will receive a [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] with the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Metadata|TextChatMessage.Metadata]] and [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Text|TextChatMessage.Text]] properties set to empty strings.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The message to send to the [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]]. |
| `metadata` | string |  | Custom metadata to attach to the message. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] | A [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] with [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Status\|TextChatMessage.Status]] property that indicates the condition of the message. |

### SetDirectChatRequester

```lua
TextChannel:SetDirectChatRequester(requester: Player): ()
```

**Thread safety:** Unsafe · **Capabilities:** Chat

Sets the [[30 Official Roblox Docs/API Reference/Classes/TextChannel#DirectChatRequester|DirectChatRequester]] for the `TextChannel`. This method is only available for use in server scripts.

Use this API if you are working with [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] and have a custom implementation of direct chat outside of the default text channels.

When called on a `TextChannel` that is parented to `TextChatService` and has no existing `TextSources`, `SetDirectChatRequester` adds the requested users as a `TextSource` and set the `DirectChatRequester` property for the channel.

When `DirectChatRequester` is set, only messages between users that can direct chat with the `DirectChatRequester` are delivered.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `requester` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] whose direct-message permissions gate the channel; only users who can send direct messages to this player are delivered messages on the channel. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`TextChannel-SetDirectChatRequester`) are published on the source page; their code is not part of the open-source repo.*

## Events

### MessageReceived

```lua
TextChannel.MessageReceived(incomingMessage: TextChatMessage)
```

**Capabilities:** Chat

Like [[30 Official Roblox Docs/API Reference/Classes/TextChatService#MessageReceived|TextChatService.MessageReceived]], fires when [[30 Official Roblox Docs/API Reference/Classes/TextChannel#DisplaySystemMessage|TextChannel:DisplaySystemMessage()]] is invoked on the client, or when the client receives a valid [[30 Official Roblox Docs/API Reference/Classes/TextChannel#SendAsync|TextChannel:SendAsync()]] response from the server. This event is only fired on the client.

If the server's [[30 Official Roblox Docs/API Reference/Classes/TextChannel#ShouldDeliverCallback|TextChannel.ShouldDeliverCallback]] property is bound and returns `false`, the client will not fire [[30 Official Roblox Docs/API Reference/Classes/TextChannel#MessageReceived|TextChannel.MessageReceived]].

Use the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] parameter to get the [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] and the text of the message (with [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Text|TextChatMessage.Text]]).

The [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] parameter is the final result of any functions bound to [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage|TextChatService.OnIncomingMessage]] or [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `incomingMessage` | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] |  | The received [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]]. |

## Callbacks

### OnIncomingMessage

```lua
TextChannel.OnIncomingMessage(message: TextChatMessage): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Chat

Called when [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] is receiving an incoming message. Can only be implemented on the client.

Use this to decorate [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessages]]. If this callback returns a [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties|TextChatMessageProperties]], those properties are merged with the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] parameter to create a new [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]].

When bound to the client sending a message, this callback is run twice; first when the message is initially sent and received locally, and again when the client receives the result of the filtered message from the server.

[[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]] callbacks always run **after** the [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnIncomingMessage|TextChatService.OnIncomingMessage]] callback.

This should be defined only once per [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] in the source code. Multiple bindings to the same channel will override one another in a nondeterministic manner.

When [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CreateDefaultTextChannels|TextChatService:CreateDefaultTextChannels()]] is true, those default [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannels]] have their [[30 Official Roblox Docs/API Reference/Classes/TextChannel#OnIncomingMessage|TextChannel.OnIncomingMessage]] callbacks assigned internally in order to exhibit special default behavior.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] |  | The incoming [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]]. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | If a [[30 Official Roblox Docs/API Reference/Classes/TextChatMessageProperties\|TextChatMessageProperties]] is returned, those properties are merged with the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] parameter to create a new [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] with those properties. |

### ShouldDeliverCallback

```lua
TextChannel.ShouldDeliverCallback(message: TextChatMessage, textSource: TextSource): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Chat

Called for each client when [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] is receiving an incoming message to determine whether or not it should be delivered to that client. Can only be defined on the server.

Once defined, this callback needs to return a truthy value such as `true`, `1`, or `"hello"` to deliver the message to said client. If the callback returns anything else (including `nil`), the message won't be delivered to that client, although the sender will see the message regardless.

The sender can be referenced by [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#TextSource|TextChatMessage.TextSource]], while the receiver is the `textSource` argument. Note that the sender and receiver can be the same, as the callback iterates through all possible receivers.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage\|TextChatMessage]] |  | The message being sent, which also contains the sender of the message. |
| `textSource` | [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSource]] |  | The [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSource]] of the user who will be receiving the message. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A truthy value (such as `true`, `1`, or a non-empty string) to deliver the message to the given client, or a falsy value (including `nil`) to withhold it from that client. |

---
*Source: [TextChannel](https://create.roblox.com/docs/reference/engine/classes/TextChannel) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
