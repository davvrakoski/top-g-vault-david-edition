---
title: "MessagingService"
description: "Allows servers of the same experience to communicate with each other."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MessagingService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Allows servers of the same experience to communicate with each other.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

**MessagingService** allows servers of the same experience to communicate with each other in real time, typically within 1-2 seconds, using topics. Topics are developer‑defined strings (1–80 characters) that servers use to send and receive messages.

Delivery is best effort and not guaranteed. Make sure to architect your experience so delivery failures are not critical.

[[30 Official Roblox Docs/Cloud Services/Cross-server messaging|Cross-Server Messaging]] explores how to communicate between servers in greater detail.

If you want to publish ad-hoc messages to live game servers, or publish across experiences, you can use the [[30 Official Roblox Docs/Cloud/Guides/Messaging usage guide|Open Cloud APIs]].

#### Limitations

Note that these limits are subject to change.

| Limit | Maximum |
| --- | --- |
| **Size of message** | 1kB |
| **Messages sent per game server** | 600 + 240 * (number of players in this game server) per minute |
| **Messages received per topic** | (40 + 80 * number of servers) per minute |
| **Messages received for entire game** | (400 + 200 * number of servers) per minute |
| **Subscriptions allowed per game server** | 20 + 8 * (number of players in this game server) |
| **Subscribe requests per game server** | 240 requests per minute |

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MessagingService#PublishAsync\|PublishAsync()]] | () | Invokes the supplied callback whenever a message is pushed to the topic. |
| [[30 Official Roblox Docs/API Reference/Classes/MessagingService#SubscribeAsync\|SubscribeAsync()]] | [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Begins listening to the given topic. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### PublishAsync

```lua
MessagingService:PublishAsync(topic: string, message: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** ServerCommunication · **Tags:** `Yields`

This function sends the provided message to all subscribers to the topic, triggering their registered callbacks to be invoked.

Yields until the message is received by the backend.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `topic` | string |  | Determines where the message is sent. |
| `message` | Variant |  | The data to include in the message. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SubscribeAsync

```lua
MessagingService:SubscribeAsync(topic: string, callback: Function): RBXScriptConnection
```

**Thread safety:** Unsafe · **Capabilities:** ServerCommunication · **Tags:** `Yields`

This function registers a callback to begin listening to the given topic. The callback is invoked when a topic receives a message. It can be called multiple times for the same topic.

#### Callback

The callback is invoked with a single argument, a table with the following entries:

| Field | Summary |
| --- | --- |
| **Data** | Developer supplied payload |
| **Sent** | Unix time in seconds at which the message was sent |

It yields until the subscription is properly registered and returns a connection object.

To unsubscribe, call [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection|Disconnect()]] on the returned object. Once called, the callback should never be invoked. Killing the script containing the connections also causes the underlying connect to be unsubscribed.

See also [[30 Official Roblox Docs/API Reference/Classes/MessagingService#PublishAsync|MessagingService:PublishAsync()]] which sends the provided message to all subscribers to the topic, triggering their registered callbacks to be invoked.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `topic` | string |  | Determines where to listen for messages. |
| `callback` | Function |  | Function to be invoked whenever a message is received. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection\|RBXScriptConnection]] | Connection that can be used to unsubscribe from the topic. |

*Code samples for this member (`subscribing-to-cross-server-messages`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [MessagingService](https://create.roblox.com/docs/reference/engine/classes/MessagingService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
