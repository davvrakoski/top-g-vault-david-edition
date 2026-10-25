---
title: "CustomLog"
description: "Internal-only instance that writes text to a file in the engine's logs directory."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/CustomLog"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Internal-only instance that writes text to a file in the engine's logs directory.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotReplicated`

## Description

Internal-only (`InternalTest` security); not available to ordinary experience scripts. [[30 Official Roblox Docs/API Reference/Classes/CustomLog|CustomLog]] writes text to a file in the engine's logs directory: [[30 Official Roblox Docs/API Reference/Classes/CustomLog#Open|CustomLog:Open()]] creates a file named after the instance's [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]] (with a `.log` extension), [[30 Official Roblox Docs/API Reference/Classes/CustomLog#WriteAppend|CustomLog:WriteAppend()]] appends text, and [[30 Official Roblox Docs/API Reference/Classes/CustomLog#Close|CustomLog:Close()]] closes the file handle. The instance cannot be parented to or contain other instances.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/CustomLog#Close\|Close()]] | () | Closes the open log file. |
| [[30 Official Roblox Docs/API Reference/Classes/CustomLog#GetLogPath\|GetLogPath()]] | string | Returns the full filesystem path of the log file. |
| [[30 Official Roblox Docs/API Reference/Classes/CustomLog#Open\|Open()]] | () | Opens the log file for writing, creating or truncating it. |
| [[30 Official Roblox Docs/API Reference/Classes/CustomLog#WriteAppend\|WriteAppend()]] | () | Appends a string to the open log file. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### Close

```lua
CustomLog:Close(): ()
```

**Thread safety:** Unsafe · **Capabilities:** InternalTest

Closes the file handle previously opened by [[30 Official Roblox Docs/API Reference/Classes/CustomLog#Open|CustomLog:Open()]]. Closing an already-closed log has no effect.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetLogPath

```lua
CustomLog:GetLogPath(): string
```

**Thread safety:** Unsafe · **Capabilities:** InternalTest

Returns the full filesystem path of the log file targeted by [[30 Official Roblox Docs/API Reference/Classes/CustomLog#Open|CustomLog:Open()]]. The path is set when [[30 Official Roblox Docs/API Reference/Classes/CustomLog#Open|CustomLog:Open()]] is called and is derived from the instance's [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]]; it is empty before the log has been opened.

**Returns**

| Type | Description |
| --- | --- |
| string | The absolute filesystem path of the log file. |

### Open

```lua
CustomLog:Open(): ()
```

**Thread safety:** Unsafe · **Capabilities:** InternalTest

Opens a file named after the instance's [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]] (with a `.log` extension) in the engine's logs directory, truncating any existing contents so that writing starts from an empty file.

This method throws a runtime error if the log is already open, if [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Instance.Name]] is empty, if the name resolves to a path outside the logs directory, or if the file otherwise fails to open.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### WriteAppend

```lua
CustomLog:WriteAppend(append: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** InternalTest

Writes `append` to the end of the open log file. The text is written verbatim, without adding a trailing newline.

This method throws a runtime error if the log is not open (call [[30 Official Roblox Docs/API Reference/Classes/CustomLog#Open|CustomLog:Open()]] first) or if the write fails.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `append` | string |  | The text to append to the log file. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [CustomLog](https://create.roblox.com/docs/reference/engine/classes/CustomLog) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
