---
title: "FunctionalTest"
description: "Deprecated container for automated test scripts; use `TestService` instead."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/FunctionalTest"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Deprecated container for automated test scripts; use [[30 Official Roblox Docs/API Reference/Classes/TestService|TestService]] instead.*

> [!warning] Deprecated
> FunctionalTest has been deprecated, developers are advised to use
> `Class.TestService` instead.

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `Deprecated`

## Description

A deprecated container for automated test scripts that delegates its test-result methods to [[30 Official Roblox Docs/API Reference/Classes/TestService|TestService]] and then signals test completion. New scripts should use [[30 Official Roblox Docs/API Reference/Classes/TestService|TestService]] directly.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FunctionalTest#Description\|Description]] | string | **Deprecated.** The description of the FunctionalTest. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FunctionalTest#Error\|Error()]] | () | **Deprecated.** Prints a red failure message to the output and signals test completion. |
| [[30 Official Roblox Docs/API Reference/Classes/FunctionalTest#Failed\|Failed()]] | () | **Deprecated.** Prints a red message to the output, prefixed by _"TestService: "_. |
| [[30 Official Roblox Docs/API Reference/Classes/FunctionalTest#Pass\|Pass()]] | () | **Deprecated.** Records a successful test result and signals test completion. |
| [[30 Official Roblox Docs/API Reference/Classes/FunctionalTest#Passed\|Passed()]] | () | **Deprecated.** Records a successful test result and signals test completion. |
| [[30 Official Roblox Docs/API Reference/Classes/FunctionalTest#Warn\|Warn()]] | () | **Deprecated.** Prints if a condition is true, otherwise prints a warning. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Description

> [!warning] Deprecated
> FunctionalTest has been deprecated, developers are advised to use
> `Class.TestService` instead.

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The description of the FunctionalTest.

## Methods

### Error

> [!warning] Deprecated
> FunctionalTest has been deprecated, developers are advised to use
> `Class.TestService` instead.

```lua
FunctionalTest:Error(message: string): ()
```

**Thread safety:** Unsafe

Prints a red message to the output, prefixed by _"TestService: "_, then signals test completion. Same behavior as [[30 Official Roblox Docs/API Reference/Classes/FunctionalTest#Failed|FunctionalTest:Failed()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Failed

> [!warning] Deprecated
> FunctionalTest has been deprecated, developers are advised to use
> `Class.TestService` instead.

```lua
FunctionalTest:Failed(message: string): ()
```

**Thread safety:** Unsafe

Prints a red message to the output, prefixed by _"TestService: "_.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Pass

> [!warning] Deprecated
> FunctionalTest has been deprecated, developers are advised to use
> `Class.TestService` instead.

```lua
FunctionalTest:Pass(message: string): ()
```

**Thread safety:** Unsafe

Records a successful test result and signals test completion. Same behavior as [[30 Official Roblox Docs/API Reference/Classes/FunctionalTest#Passed|FunctionalTest:Passed()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Passed

> [!warning] Deprecated
> FunctionalTest has been deprecated, developers are advised to use
> `Class.TestService` instead.

```lua
FunctionalTest:Passed(message: string): ()
```

**Thread safety:** Unsafe

Records a successful test result and signals test completion. Same behavior as [[30 Official Roblox Docs/API Reference/Classes/FunctionalTest#Pass|FunctionalTest:Pass()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### Warn

> [!warning] Deprecated
> FunctionalTest has been deprecated, developers are advised to use
> `Class.TestService` instead.

```lua
FunctionalTest:Warn(message: string): ()
```

**Thread safety:** Unsafe

Prints if a condition is true, otherwise prints a warning.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`FunctionalTest-Warn1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [FunctionalTest](https://create.roblox.com/docs/reference/engine/classes/FunctionalTest) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
