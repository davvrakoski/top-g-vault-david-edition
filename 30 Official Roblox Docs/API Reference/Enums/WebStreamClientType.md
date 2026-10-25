---
title: "WebStreamClientType"
description: "Specifies what type of streaming to use when creating a `WebStreamClient`."
api_type: enum
aliases: ["Enum.WebStreamClientType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/WebStreamClientType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies what type of streaming to use when creating a [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient|WebStreamClient]].*

## Description

Specifies what type of streaming to use when creating a [[30 Official Roblox Docs/API Reference/Classes/WebStreamClient|WebStreamClient]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `SSE` | 0 | Traditional Server-Sent Events (SSE) client. Requires `text/event-stream` to be returned in the `Content-Type` header. Messages in the stream will follow the [event stream format](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events#event_stream_format). |
| `RawStream` | 1 | General purpose HTTP streaming client. It can connect to any server that provides streaming data transfer (e.g. [chunked encoding](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Transfer-Encoding)). It provides no guarantees about the stream format. |
| `WebSocket` | 2 | [WebSocket](https://en.wikipedia.org/wiki/WebSocket) client that provides a bidirectional communication channel over a TCP connection. |

---
*Source: [WebStreamClientType](https://create.roblox.com/docs/reference/engine/enums/WebStreamClientType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
