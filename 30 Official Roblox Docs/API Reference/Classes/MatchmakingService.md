---
title: "MatchmakingService"
description: "The service responsible for managing custom matchmaking data."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MatchmakingService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The service responsible for managing custom matchmaking data.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

[[30 Official Roblox Docs/API Reference/Classes/MatchmakingService|MatchmakingService]] is responsible for managing custom matchmaking attributes. Use it to read and write matchmaking data.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MatchmakingService#GetServerAttribute\|GetServerAttribute()]] | Tuple | Retrieves the value of a specific server attribute. |
| [[30 Official Roblox Docs/API Reference/Classes/MatchmakingService#InitializeServerAttributesForStudio\|InitializeServerAttributesForStudio()]] | Tuple | Initiates the server attribute schema and its values to test in Studio. |
| [[30 Official Roblox Docs/API Reference/Classes/MatchmakingService#SetServerAttribute\|SetServerAttribute()]] | Tuple | Assigns a value to a specific server attribute. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetServerAttribute

```lua
MatchmakingService:GetServerAttribute(name: string): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Retrieves the value of a specific server attribute.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the server attribute. Limited to a maximum of 50 characters. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Returns the server attribute value if the attribute is found and if the error is `nil`. Otherwise, returns `nil` for the attribute value and an error message. |

### InitializeServerAttributesForStudio

```lua
MatchmakingService:InitializeServerAttributesForStudio(serverAttributes: Dictionary): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Initiates the server attribute schema and its values to test in Studio. This method is optional and has no effect when running outside of Studio.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `serverAttributes` | Dictionary |  | An array of attribute name-value pairs. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Returns `true` if the call succeeded. Otherwise, returns `false` and an error message. |

### SetServerAttribute

```lua
MatchmakingService:SetServerAttribute(name: string, value: Variant): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Assigns a value to a specific server attribute.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the server attribute. Limited to a maximum of 50 characters. |
| `value` | Variant |  | The value of the server attribute. Limited to a maximum of 50 characters. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Returns `true` if the call succeeded. Otherwise, returns `false` and an error message. |

*Code samples for this member (`Matchmaking-Service-Code-Sample`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [MatchmakingService](https://create.roblox.com/docs/reference/engine/classes/MatchmakingService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
