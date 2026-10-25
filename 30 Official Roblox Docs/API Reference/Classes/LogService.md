---
title: "LogService"
description: "A service that allows you to read outputted text."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/LogService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that allows you to read outputted text.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

`LogService` allows you to log structured log entries and read outputted text. For logging scoped to a named, hierarchical path, use [[30 Official Roblox Docs/API Reference/Classes/LogService#GetLogger|LogService:GetLogger()]] to obtain a [[30 Official Roblox Docs/API Reference/Classes/Logger|Logger]].

#### Template Syntax

Methods that accept a `context` table support `{key}` template placeholders in the message string. To include a literal brace character in the output, use double braces: `{{` produces a literal `{` and `}}` produces a literal `}`.

```lua
local LogService = game:GetService("LogService")

LogService:Info("Value = {{result}}: {val}", {val = 42})
-- Output: "Value = {result}: 42"
```

#### Context Values

The `context` table accepts any value type. Non-serializable values are automatically converted to strings in the stored context:

- **Instances** are stored as their full path (e.g., `"Workspace.MyModel.Part"`)
- **Functions** are stored as `"<function>"`
- **Other non-primitive types** are stored using their `tostring()` representation

Mixed tables (tables with both string and numeric keys) and pure arrays are accepted. Numeric keys are converted to string keys (e.g., index `1` becomes key `"1"`). If a numeric key collides with an existing string key, the explicit string key takes precedence.

```lua
local LogService = game:GetService("LogService")

-- Instance values are converted to their full path
LogService:Info("Touched {part}", {part = workspace.MyPart})
-- Context stores: {part = "Workspace.MyPart"}

-- Mixed tables are accepted; numeric keys become string keys
LogService:Info("Player {name}", {name = "Alice", 1, 2, 3})
-- Context stores: {name = "Alice", ["1"] = 1, ["2"] = 2, ["3"] = 3}
```

#### Warning

This service might have unexpected or unreliable behavior and content might be truncated. Don't rely on contents of events and messages emitted by this service for any important game logic.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/LogService#ClearOutput\|ClearOutput()]] | () | Clears Roblox Studio's **Output** window. |
| [[30 Official Roblox Docs/API Reference/Classes/LogService#Error\|Error()]] | () | Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType\|Enum.MessageType.MessageError]] level and throws a structured error with optional context. |
| [[30 Official Roblox Docs/API Reference/Classes/LogService#GetLogHistory\|GetLogHistory()]] | Array | Returns a table of tables, each with the message string, message type, and timestamp of a message that the client displays in the **Output** window. |
| [[30 Official Roblox Docs/API Reference/Classes/LogService#GetLogger\|GetLogger()]] | [[30 Official Roblox Docs/API Reference/Classes/Logger\|Logger]] | Returns a top-level [[30 Official Roblox Docs/API Reference/Classes/Logger\|Logger]] with the given name, creating it if it does not already exist. |
| [[30 Official Roblox Docs/API Reference/Classes/LogService#Info\|Info()]] | () | Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType\|Enum.MessageType.MessageInfo]] level with optional structured context. |
| [[30 Official Roblox Docs/API Reference/Classes/LogService#Log\|Log()]] | () | Logs a message at the specified level with optional structured context. |
| [[30 Official Roblox Docs/API Reference/Classes/LogService#Output\|Output()]] | () | Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType\|Enum.MessageType.MessageOutput]] level with optional structured context. |
| [[30 Official Roblox Docs/API Reference/Classes/LogService#Warn\|Warn()]] | () | Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType\|Enum.MessageType.MessageWarning]] level with optional structured context. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/LogService#MessageOut\|MessageOut]] | `message`, `messageType`, `context` | Fires when the client outputs text. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### ClearOutput

```lua
LogService:ClearOutput(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Logging

Clears Roblox Studio's **Output** window. The log history is also cleared, such that [[30 Official Roblox Docs/API Reference/Classes/LogService#GetLogHistory|LogService:GetLogHistory()]] will not return any entries from before the `ClearOutput()` call.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Error

```lua
LogService:Error(message: string, context: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Logging · **Tags:** `CustomLuaState`

Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType|Enum.MessageType.MessageError]] level and throws a structured error with optional context. As this method always throws, use [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] to catch the error. The thrown error is a table with `message`, `template`, `context`, and `stack` fields, and a `__tostring` metamethod that returns the rendered message.

When a `context` table is provided, template placeholders like `{key}` in the message are replaced with the corresponding context values.

```lua
local LogService = game:GetService("LogService")

local ok, err = pcall(function()
	LogService:Error("Failed: {reason}", {reason = "timeout"})
end)
-- ok is false
-- err.message == "Failed: timeout"
-- err.context == {reason = "timeout"}
-- tostring(err) == "Failed: timeout"
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

### GetLogHistory

```lua
LogService:GetLogHistory(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Logging

Returns a table of tables, each with the message string, message type, and timestamp of a message that the client displays in the **Output** window. Each inner table contains the following keys:

- `message` (string) -- the rendered message text.
- `messageType` ([[30 Official Roblox Docs/API Reference/Enums/MessageType|Enum.MessageType]]) -- the log level (MessageOutput, MessageInfo, MessageWarning, or MessageError).
- `timestamp` (number) -- the time the message was emitted, in seconds.
- `context` (dictionary) -- the structured key-value pairs if the message was emitted via a structured logging method; absent otherwise.

The history is capped at a maximum of 512 entries by default. Calling [[30 Official Roblox Docs/API Reference/Classes/LogService#ClearOutput|LogService:ClearOutput()]] empties the history, so subsequent calls return only entries logged after the clear.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of tables, each containing `message` (string), `messageType` ([[30 Official Roblox Docs/API Reference/Enums/MessageType\|Enum.MessageType]]), `timestamp` (number, in seconds), and optionally `context` (dictionary) for entries logged with structured context. |

### GetLogger

```lua
LogService:GetLogger(name: string): Logger
```

**Thread safety:** Unsafe · **Capabilities:** Logging · **Tags:** `CustomLuaState`

Returns the top-level logger with the given `name`, creating it if it does not already exist. Calling this with the same name repeatedly returns the same logger instance for as long as a reference to it is held. Use the returned [[30 Official Roblox Docs/API Reference/Classes/Logger|Logger]] to emit structured log entries scoped to a hierarchical path, and [[30 Official Roblox Docs/API Reference/Classes/Logger#GetLogger|Logger:GetLogger()]] to create nested child loggers.

This method raises an error if the name is empty, contains a `.`, or contains control characters, or if the maximum number of live loggers has been exceeded.

```lua
local LogService = game:GetService("LogService")

local combat = LogService:GetLogger("Combat")
combat:Info("Match started with {count} players", {count = 8})
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the logger. Must be non-empty, must not contain a `.` character, and must not contain control characters. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Logger\|Logger]] | A [[30 Official Roblox Docs/API Reference/Classes/Logger\|Logger]] whose [[30 Official Roblox Docs/API Reference/Classes/Logger#Name\|Logger.Name]] and [[30 Official Roblox Docs/API Reference/Classes/Logger#FullPath\|Logger.FullPath]] both equal `name`. |

### Info

```lua
LogService:Info(message: string, context: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Logging · **Tags:** `CustomLuaState`

Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType|Enum.MessageType.MessageInfo]] level. When a `context` table is provided, template placeholders like `{key}` in the message are replaced with the corresponding context values. The context is preserved as structured data for display in the Developer Console and Studio's **Output** window.

```lua
local LogService = game:GetService("LogService")

LogService:Info("User {name} has {count} items", {name = "Alice", count = 42})
-- Output: "User Alice has 42 items"
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
LogService:Log(messageType: MessageType, message: string, context: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Logging · **Tags:** `CustomLuaState`

Logs a message at the specified [[30 Official Roblox Docs/API Reference/Enums/MessageType|Enum.MessageType]] level. This is a general-purpose method that combines the functionality of [[30 Official Roblox Docs/API Reference/Classes/LogService#Output|Output()]], [[30 Official Roblox Docs/API Reference/Classes/LogService#Info|Info()]], [[30 Official Roblox Docs/API Reference/Classes/LogService#Warn|Warn()]], and [[30 Official Roblox Docs/API Reference/Classes/LogService#Error|Error()]] into a single call with an explicit message type parameter.

When `messageType` is [[30 Official Roblox Docs/API Reference/Enums/MessageType|Enum.MessageType.MessageError]], this method throws a structured error object (same behavior as [[30 Official Roblox Docs/API Reference/Classes/LogService#Error|Error()]]).

```lua
local LogService = game:GetService("LogService")

LogService:Log(Enum.MessageType.MessageInfo, "Event {action}", {action = "click"})
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

### Output

```lua
LogService:Output(message: string, context: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Logging · **Tags:** `CustomLuaState`

Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType|Enum.MessageType.MessageOutput]] level. When a `context` table is provided, template placeholders like `{key}` in the message are replaced with the corresponding context values. The context is preserved as structured data for display in the Developer Console and Studio's **Output** window.

```lua
local LogService = game:GetService("LogService")

LogService:Output("Player {name} joined", {name = "Alice"})
-- Output: "Player Alice joined"
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
LogService:Warn(message: string, context: Dictionary = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** Logging · **Tags:** `CustomLuaState`

Logs a message at the [[30 Official Roblox Docs/API Reference/Enums/MessageType|Enum.MessageType.MessageWarning]] level with optional structured context. When a `context` table is provided, template placeholders like `{key}` in the message are replaced with the corresponding context values. The context is preserved as structured data for display in the Developer Console and Studio's **Output** window.

```lua
local LogService = game:GetService("LogService")

LogService:Warn("Memory usage at {pct}%", {pct = 95})
-- Output: "Memory usage at 95%"
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

## Events

### MessageOut

```lua
LogService.MessageOut(message: string, messageType: MessageType, context: Dictionary)
```

**Capabilities:** Logging

Fires whenever a message is logged through the engine's output system, including calls to [[30 Official Roblox Docs/API Reference/Globals/Luau globals#print|print()]], [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#warn|warn()]], and the structured logging methods on [[30 Official Roblox Docs/API Reference/Classes/LogService|LogService]]. The `message` parameter contains the fully rendered text (template placeholders already replaced). The `context` parameter carries the structured key-value pairs when the message was emitted via a method that accepts a context table; otherwise it is nil.

```lua
local LogService = game:GetService("LogService")

LogService.MessageOut:Connect(function(message, messageType, context)
	if messageType == Enum.MessageType.MessageError then
		print("Error:", message)
	end
	if context then
		-- Access structured data from structured logging calls
		for key, value in context do
			print(key, "=", value)
		end
	end
end)
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The fully rendered message string after any template placeholder substitution. |
| `messageType` | [[30 Official Roblox Docs/API Reference/Enums/MessageType\|MessageType]] |  | A [[30 Official Roblox Docs/API Reference/Enums/MessageType\|Enum.MessageType]] value indicating the severity level of the message. |
| `context` | Dictionary |  | A dictionary of key-value pairs provided when the message was logged via a structured logging method ([[30 Official Roblox Docs/API Reference/Classes/LogService#Output\|LogService:Output()]], [[30 Official Roblox Docs/API Reference/Classes/LogService#Info\|LogService:Info()]], [[30 Official Roblox Docs/API Reference/Classes/LogService#Warn\|LogService:Warn()]], or [[30 Official Roblox Docs/API Reference/Classes/LogService#Error\|LogService:Error()]]), or nil if no context was supplied. |

*Code samples for this member (`LogService-MessageOut1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [LogService](https://create.roblox.com/docs/reference/engine/classes/LogService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
