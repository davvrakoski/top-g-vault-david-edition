---
title: "RBXScriptConnection"
description: "A connection between an `RBXScriptSignal` and a function."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptConnection"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*A connection between an [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal|RBXScriptSignal]] and a function.*

## Description

The `RBXScriptConnection` data type is a special object returned by the [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal#Connect|Connect()]] method of an event ([[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal|RBXScriptSignal]]). This is used primarily to disconnect a listener from an [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal|RBXScriptSignal]].

```lua
local part = Instance.new("Part")
-- Store reference to the RBXScriptConnection so it can be disconnected later
local connection : RBXScriptConnection = part.Touched:Connect(function(otherPart)
    print("Hello world!")
end)
-- Disconnect when the connection is no longer needed
connection:Disconnect()
```

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection#Connected\|Connected]] | bool | The state of the RBXScriptConnection. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection#Disconnect\|Disconnect()]] | () | Disconnects the connection from the event. |

## Properties

### Connected

**Type:** bool

Describes whether or not the connection is still alive. This becomes `false` if [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection#Disconnect|Disconnect()]] is called.

## Methods

### Disconnect

```lua
RBXScriptConnection:Disconnect(): ()
```

Disconnects the connection from the event.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [RBXScriptConnection](https://create.roblox.com/docs/reference/engine/datatypes/RBXScriptConnection) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
