---
title: "Logger"
description: "A named logger that emits structured log entries scoped to a hierarchical path."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Logger"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A named logger that emits structured log entries scoped to a hierarchical path.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

A `Logger` emits structured log entries that are tagged with a hierarchical name, letting you group related messages by subsystem or feature. Obtain a top-level logger from [[30 Official Roblox Docs/API Reference/Classes/LogService#GetLogger|LogService:GetLogger()]], then create nested child loggers with [[30 Official Roblox Docs/API Reference/Classes/Logger#GetLogger|Logger:GetLogger()]]. Each logger has a short [[30 Official Roblox Docs/API Reference/Classes/Logger#Name|Logger.Name]] and a dot-joined [[30 Official Roblox Docs/API Reference/Classes/Logger#FullPath|Logger.FullPath]] built from its ancestry (for example a logger named `Damage` created from a logger named `Combat` has the full path `Combat.Damage`).

```lua
local LogService = game:GetService("LogService")

local combat = LogService:GetLogger("Combat")
local damage = combat:GetLogger("Damage")

print(damage.Name)      --> Damage
print(damage.FullPath)  --> Combat.Damage

damage:Info("Dealt {amount} damage to {target}", {amount = 25, target = "Goblin"})
```

Loggers behave the same as the structured logging methods on [[30 Official Roblox Docs/API Reference/Classes/LogService|LogService]]: messages flow to the **Output** window, the Developer Console, and [[30 Official Roblox Docs/API Reference/Classes/LogService#MessageOut|LogService.MessageOut]], and are included in [[30 Official Roblox Docs/API Reference/Classes/LogService#GetLogHistory|LogService:GetLogHistory()]] tagged with the logger's full path.

#### Hierarchy and Propagation

When a message is logged on a logger, its [[30 Official Roblox Docs/API Reference/Classes/Logger#MessageOut|Logger.MessageOut]] event fires on that logger **and** on every ancestor up to the root. This lets you attach a listener on a parent logger to observe all messages emitted by its descendants. The message is emitted to the engine's output system exactly once, tagged with the originating logger's full path.

#### Template Syntax and Context

The logging methods accept the same `{key}` template placeholders and `context` tables as the structured logging methods on [[30 Official Roblox Docs/API Reference/Classes/LogService|LogService]]. See [[30 Official Roblox Docs/API Reference/Classes/LogService|LogService]] for details on template syntax and how context values are stored.

#### Lifetime

A logger remains valid as long as you hold a reference to it. Once all references to a logger (and its descendants) are released, it is reclaimed, and calling any method on a stale logger raises an error. The number of live loggers and the length of a logger's full path are both bounded; exceeding either limit raises an error from [[30 Official Roblox Docs/API Reference/Classes/Logger#GetLogger|Logger:GetLogger()]].

#### Warning

This class might have unexpected or unreliable behavior and content might be truncated. Don't rely on contents of events and messages emitted by loggers for any important game logic.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Logger#Name\|Name]] | string | The name segment of this logger within its parent. |
| [[30 Official Roblox Docs/API Reference/Classes/Logger#FullPath\|FullPath]] | string | The dot-joined path of this logger from the root logger. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Logger#GetLogger\|GetLogger()]] | [[30 Official Roblox Docs/API Reference/Classes/Logger\|Logger]] | Returns a child logger with the given name, creating it if it does not already exist. |
| [[30 Official Roblox Docs/API Reference/Classes/Logger#Output\|Output()]] | () | Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType\|Enum.MessageType.MessageOutput]] level with optional structured context. |
| [[30 Official Roblox Docs/API Reference/Classes/Logger#Info\|Info()]] | () | Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType\|Enum.MessageType.MessageInfo]] level with optional structured context. |
| [[30 Official Roblox Docs/API Reference/Classes/Logger#Warn\|Warn()]] | () | Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType\|Enum.MessageType.MessageWarning]] level with optional structured context. |
| [[30 Official Roblox Docs/API Reference/Classes/Logger#Error\|Error()]] | () | Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType\|Enum.MessageType.MessageError]] level with optional structured context. |
| [[30 Official Roblox Docs/API Reference/Classes/Logger#Log\|Log()]] | () | Logs a message at the specified level with optional structured context. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Logger#MessageOut\|MessageOut]] | `message`, `messageType`, `context` | Fires when a message is logged through this logger or any of its descendants. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Name

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Logging · **Tags:** `ReadOnly`, `NotReplicated`

The name of this logger as supplied to [[30 Official Roblox Docs/API Reference/Classes/LogService#GetLogger|LogService:GetLogger()]] or [[30 Official Roblox Docs/API Reference/Classes/Logger#GetLogger|Logger:GetLogger()]]. This is a single path segment and never contains a `.` character. Use [[30 Official Roblox Docs/API Reference/Classes/Logger#FullPath|Logger.FullPath]] for the complete dot-joined path.

### FullPath

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Logging · **Tags:** `ReadOnly`, `NotReplicated`

The full path of this logger, formed by joining the [[30 Official Roblox Docs/API Reference/Classes/Logger#Name|Logger.Name]] of each logger from the root down to this one with `.` separators. For a top-level logger the full path equals its name. Messages logged through this logger are tagged with this full path in [[30 Official Roblox Docs/API Reference/Classes/LogService#GetLogHistory|LogService:GetLogHistory()]].

## Methods

### GetLogger

```lua
Logger:GetLogger(name: string): Logger
```

**Thread safety:** Unsafe · **Capabilities:** Logging · **Tags:** `CustomLuaState`

Returns the child logger with the given `name`, creating it if it does not already exist. Calling this with the same name repeatedly returns the same logger instance for as long as a reference to it is held. The returned logger's [[30 Official Roblox Docs/API Reference/Classes/Logger#FullPath|Logger.FullPath]] is this logger's full path followed by `.` and `name`.

This method raises an error if the name is empty, contains a `.`, or contains control characters, if the resulting full path is too long, or if the maximum number of live loggers has been exceeded.

```lua
local LogService = game:GetService("LogService")

local network = LogService:GetLogger("Network")
local http = network:GetLogger("Http")

print(http.FullPath)  --> Network.Http
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the child logger. Must be non-empty, must not contain a `.` character, and must not contain control characters. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Logger\|Logger]] | The child [[30 Official Roblox Docs/API Reference/Classes/Logger\|Logger]] whose full path is this logger's full path followed by `.name`. |

### Output

```lua
Logger:Output(message: string, context: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Logging · **Tags:** `CustomLuaState`

Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType|Enum.MessageType.MessageOutput]] level, tagged with this logger's [[30 Official Roblox Docs/API Reference/Classes/Logger#FullPath|Logger.FullPath]]. When a `context` table is provided, template placeholders like `{key}` in the message are replaced with the corresponding context values, and the context is preserved as structured data for display in the Developer Console and Studio's **Output** window.

```lua
local LogService = game:GetService("LogService")
local logger = LogService:GetLogger("Shop")

logger:Output("Player {name} opened the shop", {name = "Alice"})
-- Output: "Player Alice opened the shop"
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The message string. Supports `{key}` template placeholders when a context table is provided. |
| `context` | Dictionary | `nil` | An optional dictionary of key-value pairs. When provided, `{key}` placeholders in the message are replaced with the corresponding values. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Info

```lua
Logger:Info(message: string, context: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Logging · **Tags:** `CustomLuaState`

Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType|Enum.MessageType.MessageInfo]] level, tagged with this logger's [[30 Official Roblox Docs/API Reference/Classes/Logger#FullPath|Logger.FullPath]]. When a `context` table is provided, template placeholders like `{key}` in the message are replaced with the corresponding context values.

```lua
local LogService = game:GetService("LogService")
local logger = LogService:GetLogger("Combat")

logger:Info("Dealt {amount} damage", {amount = 42})
-- Output: "Dealt 42 damage"
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The message string. Supports `{key}` template placeholders when a context table is provided. |
| `context` | Dictionary | `nil` | An optional dictionary of key-value pairs. When provided, `{key}` placeholders in the message are replaced with the corresponding values. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Warn

```lua
Logger:Warn(message: string, context: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Logging · **Tags:** `CustomLuaState`

Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType|Enum.MessageType.MessageWarning]] level, tagged with this logger's [[30 Official Roblox Docs/API Reference/Classes/Logger#FullPath|Logger.FullPath]]. When a `context` table is provided, template placeholders like `{key}` in the message are replaced with the corresponding context values.

```lua
local LogService = game:GetService("LogService")
local logger = LogService:GetLogger("Combat")

logger:Warn("Health low: {hp}", {hp = 5})
-- Output: "Health low: 5"
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The message string. Supports `{key}` template placeholders when a context table is provided. |
| `context` | Dictionary | `nil` | An optional dictionary of key-value pairs. When provided, `{key}` placeholders in the message are replaced with the corresponding values. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Error

```lua
Logger:Error(message: string, context: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Logging · **Tags:** `CustomLuaState`

Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType|Enum.MessageType.MessageError]] level, tagged with this logger's [[30 Official Roblox Docs/API Reference/Classes/Logger#FullPath|Logger.FullPath]]. Unlike [[30 Official Roblox Docs/API Reference/Classes/LogService#Error|LogService:Error()]], this method emits an error-level log entry and returns normally; it does **not** throw. When a `context` table is provided, template placeholders like `{key}` in the message are replaced with the corresponding context values.

```lua
local LogService = game:GetService("LogService")
local logger = LogService:GetLogger("Network")

logger:Error("Request failed: {reason}", {reason = "timeout"})
-- Emits an error-level log; execution continues.
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The message string. Supports `{key}` template placeholders when a context table is provided. |
| `context` | Dictionary | `nil` | An optional dictionary of key-value pairs. When provided, `{key}` placeholders in the message are replaced with the corresponding values. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Log

```lua
Logger:Log(messageType: MessageType, message: string, context: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Logging · **Tags:** `CustomLuaState`

Logs a message at the specified [[30 Official Roblox Docs/API Reference/Enums/MessageType|Enum.MessageType]] level, tagged with this logger's [[30 Official Roblox Docs/API Reference/Classes/Logger#FullPath|Logger.FullPath]]. This is a general-purpose method that combines [[30 Official Roblox Docs/API Reference/Classes/Logger#Output|Output()]], [[30 Official Roblox Docs/API Reference/Classes/Logger#Info|Info()]], [[30 Official Roblox Docs/API Reference/Classes/Logger#Warn|Warn()]], and [[30 Official Roblox Docs/API Reference/Classes/Logger#Error|Error()]] into a single call with an explicit message type parameter. Unlike [[30 Official Roblox Docs/API Reference/Classes/LogService#Log|LogService:Log()]], passing [[30 Official Roblox Docs/API Reference/Enums/MessageType|Enum.MessageType.MessageError]] emits an error-level log and returns normally rather than throwing.

```lua
local LogService = game:GetService("LogService")
local logger = LogService:GetLogger("Combat")

logger:Log(Enum.MessageType.MessageInfo, "Event {action}", {action = "spawn"})
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `messageType` | [[30 Official Roblox Docs/API Reference/Enums/MessageType\|MessageType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/MessageType\|Enum.MessageType]] specifying the log level. |
| `message` | string |  | The message string. Supports `{key}` template placeholders when a context table is provided. |
| `context` | Dictionary | `nil` | An optional dictionary of key-value pairs. When provided, `{key}` placeholders in the message are replaced with the corresponding values. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### MessageOut

```lua
Logger.MessageOut(message: string, messageType: MessageType, context: Dictionary)
```

**Capabilities:** Logging

Fires whenever a message is logged through this logger or any logger beneath it in the hierarchy. Because a logged message fires `MessageOut` on the originating logger and each of its ancestors, a listener attached to a parent logger observes every message emitted by its descendants. The `message` parameter contains the fully rendered text (template placeholders already replaced), and the `context` parameter carries the structured key-value pairs when the message was logged with a context table; otherwise it is nil.

```lua
local LogService = game:GetService("LogService")
local combat = LogService:GetLogger("Combat")

combat.MessageOut:Connect(function(message, messageType, context)
	print("[Combat]", message)
end)

-- A message logged on a descendant also fires the parent's MessageOut.
combat:GetLogger("Damage"):Info("Hit for {amount}", {amount = 10})
-- Prints: [Combat] Hit for 10
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The fully rendered message string after any template placeholder substitution. |
| `messageType` | [[30 Official Roblox Docs/API Reference/Enums/MessageType\|MessageType]] |  | A [[30 Official Roblox Docs/API Reference/Enums/MessageType\|Enum.MessageType]] value indicating the severity level of the message. |
| `context` | Dictionary |  | A dictionary of key-value pairs provided when the message was logged, or nil if no context was supplied. |

---
*Source: [Logger](https://create.roblox.com/docs/reference/engine/classes/Logger) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
