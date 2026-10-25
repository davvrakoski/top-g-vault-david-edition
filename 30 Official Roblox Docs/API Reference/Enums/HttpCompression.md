---
title: "HttpCompression"
description: "Specifies the compression algorithm applied to HTTP request body sent via `HttpService`."
api_type: enum
aliases: ["Enum.HttpCompression"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/HttpCompression"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the compression algorithm applied to HTTP request body sent via [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]].*

## Description

Specifies the compression algorithm applied to the body of an HTTP request when calling [[30 Official Roblox Docs/API Reference/Classes/HttpService#RequestAsync|HttpService:RequestAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/HttpService#PostAsync|HttpService:PostAsync()]]. Pass this enum value in the `Compress` field of the request options table to reduce bandwidth when sending large payloads.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | No compression is applied to the request body. This is the default. |
| `Gzip` | 1 | The request body is compressed using the Gzip algorithm before being sent. |

---
*Source: [HttpCompression](https://create.roblox.com/docs/reference/engine/enums/HttpCompression) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
