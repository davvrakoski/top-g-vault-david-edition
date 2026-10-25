---
title: "OpenCloudService"
description: "Deprecated. Do not use for new work; prefer `HttpService` for in-experience HTTP requests."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/OpenCloudService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Deprecated. Do not use for new work; prefer [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] for in-experience HTTP requests.*

> [!warning] Deprecated
> This class is deprecated and should not be used for new work. Use
> `Class.HttpService` instead and see the
> [In-experience HTTP requests guide](30%20Official%20Roblox%20Docs/Cloud%20Services/In-game%20HTTP%20requests.md).

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`, `Deprecated`

## Description

Deprecated. Do not use for new work; prefer [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] for in-experience HTTP requests. See the [[30 Official Roblox Docs/Cloud Services/In-game HTTP requests|In-experience HTTP requests guide]].

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/OpenCloudService#GetApiV1\|GetApiV1()]] | [[30 Official Roblox Docs/API Reference/Classes/OpenCloudApiV1\|OpenCloudApiV1]] | **Deprecated.** Returns an [[30 Official Roblox Docs/API Reference/Classes/OpenCloudApiV1\|OpenCloudApiV1]] object. Always raises an error. |
| [[30 Official Roblox Docs/API Reference/Classes/OpenCloudService#InvokeAsync\|InvokeAsync()]] | Dictionary | **Deprecated.** Deprecated. Dispatches a named Open Cloud call and returns its result. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetApiV1

> [!warning] Deprecated
> This method is deprecated. Do not use it for new work.

```lua
OpenCloudService:GetApiV1(): OpenCloudApiV1
```

**Thread safety:** Unsafe · **Capabilities:** Network · **Tags:** `Deprecated`

Deprecated. Always raises an error with the message `"API is not enabled"`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/OpenCloudApiV1\|OpenCloudApiV1]] |  |

### InvokeAsync

> [!warning] Deprecated
> This method is deprecated. Do not use it for new work.

```lua
OpenCloudService:InvokeAsync(version: string, methodName: string, arguments: Dictionary, headers: Dictionary = nil): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Network · **Tags:** `Yields`, `Deprecated`

Deprecated. Do not use for new work.

Dispatches a server-side Open Cloud call identified by `version` and `methodName` with the given `arguments` and optional `headers`, and returns the response dictionary.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `version` | string |  | API version string identifying the call surface. |
| `methodName` | string |  | Name of the Open Cloud method to invoke. |
| `arguments` | Dictionary |  | A dictionary of arguments forwarded with the call. |
| `headers` | Dictionary | `nil` | Optional request headers dictionary. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing the response. |

---
*Source: [OpenCloudService](https://create.roblox.com/docs/reference/engine/classes/OpenCloudService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
