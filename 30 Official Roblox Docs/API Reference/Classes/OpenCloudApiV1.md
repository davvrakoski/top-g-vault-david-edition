---
title: "OpenCloudApiV1"
description: "Deprecated Open Cloud API surface for in-experience cloud operations such as user notifications."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/OpenCloudApiV1"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Deprecated Open Cloud API surface for in-experience cloud operations such as user notifications.*

> [!warning] Deprecated
> This class is deprecated and should not be used for new work. Use
> `Class.HttpService` instead and see the
> [In-experience HTTP requests guide](30%20Official%20Roblox%20Docs/Cloud%20Services/In-game%20HTTP%20requests.md).

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`, `Deprecated`

## Description

Deprecated Open Cloud API class for in-experience cloud operations. Do not use it for new work. Use [[30 Official Roblox Docs/API Reference/Classes/HttpService|HttpService]] with the [[30 Official Roblox Docs/Cloud Services/In-game HTTP requests|In-experience HTTP requests]] workflow instead.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/OpenCloudApiV1#CreateModel\|CreateModel()]] | OpenCloudModel | **Deprecated.** Creates and returns an `OpenCloudModel` container for a registered model type name. |
| [[30 Official Roblox Docs/API Reference/Classes/OpenCloudApiV1#CreateUserNotificationAsync\|CreateUserNotificationAsync()]] | OpenCloudModel | **Deprecated.** Deprecated method that attempted to send a user notification via Open Cloud; always errors. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CreateModel

> [!warning] Deprecated
> This method is deprecated. Do not use it for new work.

```lua
OpenCloudApiV1:CreateModel(name: string): OpenCloudModel
```

**Thread safety:** Unsafe · **Capabilities:** Network · **Tags:** `Deprecated`, `CustomLuaState`

Deprecated. Creates and returns an `OpenCloudModel` container of the given type name. The factory instantiates a model object that can hold Open Cloud data structures (such as a user-notification payload) for use with other [[30 Official Roblox Docs/API Reference/Classes/OpenCloudApiV1|OpenCloudApiV1]] methods.

The `name` parameter must match a registered model type (for example, `"UserNotification"`). The returned container wraps a typed model instance whose properties are accessible from Luau via PascalCase keys.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The registered model type name (for example, `"UserNotification"`). |

**Returns**

| Type | Description |
| --- | --- |
| OpenCloudModel | An `OpenCloudModel` container wrapping a typed model instance. |

### CreateUserNotificationAsync

> [!warning] Deprecated
> This method is deprecated. Do not use it for new work.

```lua
OpenCloudApiV1:CreateUserNotificationAsync(user: string, userNotification: OpenCloudModel): OpenCloudModel
```

**Thread safety:** Unsafe · **Capabilities:** Network · **Tags:** `Yields`, `Deprecated`

Deprecated. Attempted to send a notification to the specified user via the Open Cloud Notifications API. Always errors with `"API CreateUserNotificationAsync is not enabled."`

The `user` parameter is the target user identifier and `userNotification` is an `OpenCloudModel` container (created via [[30 Official Roblox Docs/API Reference/Classes/OpenCloudApiV1#CreateModel|OpenCloudApiV1:CreateModel()]]) populated with notification payload fields.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `user` | string |  | The target user identifier. |
| `userNotification` | OpenCloudModel |  | An `OpenCloudModel` container (from [[30 Official Roblox Docs/API Reference/Classes/OpenCloudApiV1#CreateModel\|OpenCloudApiV1:CreateModel()]]) populated with notification payload fields. |

**Returns**

| Type | Description |
| --- | --- |
| OpenCloudModel | Unused; the call always errors. |

---
*Source: [OpenCloudApiV1](https://create.roblox.com/docs/reference/engine/classes/OpenCloudApiV1) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
