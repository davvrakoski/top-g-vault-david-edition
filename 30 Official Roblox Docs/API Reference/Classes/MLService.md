---
title: "MLService"
description: "A service that runs in-engine machine learning inference by loading model bundles and creating inference sessions."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MLService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that runs in-engine machine learning inference by loading model bundles and creating inference sessions.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`MLService` loads machine learning model bundles and produces [[30 Official Roblox Docs/API Reference/Classes/MLSession|MLSession]] objects used to run inference on the client. It fetches a model asset and constructs a neural network session from the downloaded bundle, which the returned [[30 Official Roblox Docs/API Reference/Classes/MLSession|MLSession]] then executes.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MLService#CreateSessionAsync\|CreateSessionAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/MLSession\|MLSession]] | Creates an [[30 Official Roblox Docs/API Reference/Classes/MLSession\|MLSession]] for the model bundle identified by the given asset ID. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CreateSessionAsync

```lua
MLService:CreateSessionAsync(assetId: string): MLSession
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

Fetches the model bundle identified by `assetId`, constructs a neural network session from it, and resolves with a [[30 Official Roblox Docs/API Reference/Classes/MLSession|MLSession]] wrapping that session. As a yield function, it returns only once the model has been downloaded and the session created; if the asset cannot be fetched or the bundle is invalid, it raises an error instead of returning a session.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | string |  | The asset ID of the model bundle to load. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MLSession\|MLSession]] | An [[30 Official Roblox Docs/API Reference/Classes/MLSession\|MLSession]] created from the loaded model bundle. |

---
*Source: [MLService](https://create.roblox.com/docs/reference/engine/classes/MLService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
