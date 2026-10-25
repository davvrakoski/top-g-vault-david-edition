---
title: "ChatCallbackType"
description: "Identifies a hook point in the legacy Luau chat pipeline for use with `Chat:RegisterChatCallback()` and `Chat:InvokeChatCallback()`."
api_type: enum
aliases: ["Enum.ChatCallbackType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ChatCallbackType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies a hook point in the legacy Luau chat pipeline for use with [[30 Official Roblox Docs/API Reference/Classes/Chat#RegisterChatCallback|Chat:RegisterChatCallback()]] and [[30 Official Roblox Docs/API Reference/Classes/Chat#InvokeChatCallback|Chat:InvokeChatCallback()]].*

## Description

Enumerates the callback hook points available in the legacy Luau chat system. Pass a value to [[30 Official Roblox Docs/API Reference/Classes/Chat#RegisterChatCallback|Chat:RegisterChatCallback()]] to bind a function to the corresponding event, and to [[30 Official Roblox Docs/API Reference/Classes/Chat#InvokeChatCallback|Chat:InvokeChatCallback()]] to invoke the registered function for that event. Each value targets either the client or the server; attempting to register a server-only callback on the client (or vice versa) raises an error.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `OnCreatingChatWindow` | 1 | Client-only callback invoked before the chat window is constructed, allowing custom settings to be supplied. |
| `OnClientSendingMessage` | 2 | Client-only callback reserved for when the client sends a message; not currently invoked. |
| `OnClientFormattingMessage` | 3 | Client-only callback invoked before a message is displayed, allowing its display data to be modified. |
| `OnServerReceivingMessage` | 17 | Server-only callback invoked when the server receives a message from a speaker, allowing the message to be modified or suppressed. |

---
*Source: [ChatCallbackType](https://create.roblox.com/docs/reference/engine/enums/ChatCallbackType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
