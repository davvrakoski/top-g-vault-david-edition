---
title: "MLSession"
description: "A machine-learning inference session that wraps a single loaded model and runs it through `MLSession:ForwardAsync()`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MLSession"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A machine-learning inference session that wraps a single loaded model and runs it through [[30 Official Roblox Docs/API Reference/Classes/MLSession#ForwardAsync|MLSession:ForwardAsync()]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

An `MLSession` wraps a single loaded neural-network model and runs inference on it. You don't construct a session directly; instead, [[30 Official Roblox Docs/API Reference/Classes/MLService#CreateSessionAsync|MLService:CreateSessionAsync()]] loads a model bundle for a given asset and returns a ready-to-use session. Call [[30 Official Roblox Docs/API Reference/Classes/MLSession#ForwardAsync|ForwardAsync()]] on that session to run the model's forward pass on your input data and receive its output.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MLSession#ForwardAsync\|ForwardAsync()]] | Dictionary | Runs the session's model on the given input and asynchronously returns the model's output. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### ForwardAsync

```lua
MLSession:ForwardAsync(data: Dictionary): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

Runs inference for the session's loaded model.

If the model declares a dynamic output dimension, the call errors. Calling this method on a session with no valid loaded model also errors.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `data` | Dictionary |  | A dictionary mapping each of the model's input names to that input's tensor, given as a nested array of numbers matching the input's shape. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary mapping each of the model's output names to that output's tensor, given as a nested array of numbers matching the output's shape. |

---
*Source: [MLSession](https://create.roblox.com/docs/reference/engine/classes/MLSession) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
