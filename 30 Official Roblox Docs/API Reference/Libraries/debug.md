---
title: "debug"
description: "This library provides functions useful for debugging and profiling code."
api_type: library
aliases: ["debug"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/libraries/debug"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/library]
cssclasses: [tg-a30]
---

*This library provides functions useful for debugging and profiling code.*

## Description

Provides a few basic functions for debugging code in Roblox. Unlike the [[30 Official Roblox Docs/API Reference/Libraries/debug|debug]] library found in Lua natively, this version has been heavily sandboxed.

## Summary

### Functions

| Function | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Libraries/debug#traceback\|traceback()]] | string | Returns a string of undefined format that describes the current function call stack. |
| [[30 Official Roblox Docs/API Reference/Libraries/debug#traceback\|traceback()]] | string | Returns a string of undefined format that describes the current function call stack. |
| [[30 Official Roblox Docs/API Reference/Libraries/debug#info\|info()]] | Tuple | Traverses the entire stack of current thread and returns a string containing the call stack of target level details. |
| [[30 Official Roblox Docs/API Reference/Libraries/debug#info\|info()]] | Tuple | Traverses the entire stack of current thread and returns a string containing the call stack of target function details. |
| [[30 Official Roblox Docs/API Reference/Libraries/debug#info\|info()]] | Tuple | Traverses the entire stack of target thread and returns a string containing the call stack of target level details. |
| [[30 Official Roblox Docs/API Reference/Libraries/debug#profilebegin\|profilebegin()]] | () | Starts profiling for a label. |
| [[30 Official Roblox Docs/API Reference/Libraries/debug#profileend\|profileend()]] | () | Stops profiling for the most recent label that [[30 Official Roblox Docs/API Reference/Libraries/debug#profilebegin\|debug.profilebegin()]] opened. |
| [[30 Official Roblox Docs/API Reference/Libraries/debug#getmemorycategory\|getmemorycategory()]] | string | Returns the name of the current thread's active memory category. |
| [[30 Official Roblox Docs/API Reference/Libraries/debug#setmemorycategory\|setmemorycategory()]] | string | Assigns a custom tag to the current thread's memory category. |
| [[30 Official Roblox Docs/API Reference/Libraries/debug#resetmemorycategory\|resetmemorycategory()]] | () | Resets the tag assigned by [[30 Official Roblox Docs/API Reference/Libraries/debug#setmemorycategory\|debug.setmemorycategory()]] to the automatically assigned value (typically, the script name). |
| [[30 Official Roblox Docs/API Reference/Libraries/debug#dumpcodesize\|dumpcodesize()]] | () | Displays a table of native code size of individual functions and scripts. |

## Functions

### traceback

```lua
debug.traceback(message: string, level: number = 1): string
```

Returns a traceback of the current function call stack as a string; in other words, a description of the functions that have been called up to this point. During debugging, this behaves like an error stack trace but does not stop execution of the script.

The `level` parameter specifies what level of the call stack to consider, with `1` being the call of [[30 Official Roblox Docs/API Reference/Libraries/debug#traceback|debug.traceback()]] itself, `2` being the call of the function calling [[30 Official Roblox Docs/API Reference/Libraries/debug#traceback|debug.traceback()]], and so on. See the code sample below for an example of sequential function calls.

Note that this function will often return inaccurate results (compared to the original source code) and that the format of the returned traceback may change at any time. You should **not** parse the return value for specific information such as script names or line numbers.

The following example includes sequential function calls; `fnB()` is called, and it calls `fnA()` which then calls [[30 Official Roblox Docs/API Reference/Libraries/debug#traceback|debug.traceback()]].

```lua
local function fnA()
	print(debug.traceback("Specific moment during fnA()"))
end

local function fnB()
	fnA()
end

-- Call function fnB() to begin traceback
fnB()
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `message` | string |  | The first line of the returned string. |
| `level` | number | `1` | The number of calls "up" the call stack to return. |

**Returns**

| Type | Description |
| --- | --- |
| string | Traceback of the current function call stack. |

### traceback

```lua
debug.traceback(thread: thread, message: string, level: number = 1): string
```

Returns a traceback of the current function call stack as a string; in other words, a description of the functions that have been called up to this point. During debugging, this behaves like an error stack trace but does not stop execution of the script.

The `level` parameter specifies what level of the call stack to consider, with `1` being the call of [[30 Official Roblox Docs/API Reference/Libraries/debug#traceback|debug.traceback()]] itself, `2` being the call of the function calling [[30 Official Roblox Docs/API Reference/Libraries/debug#traceback|debug.traceback()]], and so on. See the code sample below for an example of sequential function calls.

Note that this function will often return inaccurate results (compared to the original source code) and that the format of the returned traceback may change at any time. You should **not** parse the return value for specific information such as script names or line numbers.

The following example includes sequential function calls; `fnB()` is called, and it calls `fnA()` which then calls [[30 Official Roblox Docs/API Reference/Libraries/debug#traceback|debug.traceback()]].

```lua
local function fnA()
	print(debug.traceback("Specific moment during fnA()"))
end

local function fnB()
	fnA()
end

-- Call function fnB() to begin traceback
fnB()
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `thread` | thread |  | A thread as returned by [[30 Official Roblox Docs/API Reference/Libraries/coroutine#create\|coroutine.create()]]. |
| `message` | string |  | The first line of the returned string. |
| `level` | number | `1` | The number of calls "up" the call stack to return. |

**Returns**

| Type | Description |
| --- | --- |
| string | Traceback of the current function call stack. |

### info

```lua
debug.info(level: number, options: string): Tuple
```

Allows programmatic inspection of the call stack. This function differs from [[30 Official Roblox Docs/API Reference/Libraries/debug#traceback|debug.traceback()]] in that it guarantees the format of the data it returns. This is useful for general logging and filtering purposes as well as for sending the data to systems expecting structured input, such as crash aggregation.

```lua
local function fnA()
	-- Output source identifier ("s") and line ("l") at levels 1 and 2
	print(debug.info(1, "sl"))  --> fnA() 3
	print(debug.info(2, "sl"))  --> fnA() 7
end

fnA()
```

Note that this function is similar to [debug.getinfo](https://www.lua.org/pil/23.1.html), an unavailable part of the standard Lua library which serves a similar purpose.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `level` | number |  | Determines at what level of the call stack the information returned should describe. A value of `1` represents the function which is calling [[30 Official Roblox Docs/API Reference/Libraries/debug#info\|debug.info()]], a value of `2` represents the function that called that function, and so on. |
| `options` | string |  | A string that describes what the returned information should represent. It must only contain 0 or 1 instances of the characters `slnaf`, each representing a piece of information:<br><br>- `s` ([[30 Official Roblox Docs/Luau/Strings\|string]]) — The function source identifier, equal to the full name of the script the function is defined in. - `l` ([[30 Official Roblox Docs/Luau/Numbers\|number]]) — The line number of the function call represented by `level`. - `n` ([[30 Official Roblox Docs/Luau/Strings\|string]]) — The name of the function; may be `nil` for anonymous functions and C functions without an assigned debug name. - `a` ([[30 Official Roblox Docs/Luau/Numbers\|number]], [[30 Official Roblox Docs/Luau/Booleans\|boolean]]) — Arity of the function, which refers to the parameter count and whether the function is variadic. - `f` ([[30 Official Roblox Docs/Luau/Functions\|function]]) — The function which was inspected. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | One value per character in `options`, in the order they appear: source identifier (`s`), line number (`l`), function name (`n`), parameter count and whether variadic (`a`), or the function itself (`f`). |

### info

```lua
debug.info(function: function, options: string): Tuple
```

Allows programmatic inspection of the call stack. This function differs from [[30 Official Roblox Docs/API Reference/Libraries/debug#traceback|debug.traceback()]] in that it guarantees the format of the data it returns. This is useful for general logging and filtering purposes as well as for sending the data to systems expecting structured input, such as crash aggregation.

```lua
local function fnA()

end

local function fnB()

end

-- Output line ("l"), name ("n"), and identifier ("f") for both fnA() and fnB()
print(debug.info(fnA, "lnf"))  --> 1 fnA function: 0x75e3d3c398a81252
print(debug.info(fnB, "lnf"))  --> 5 fnB function: 0x6022a6dc5ccf4ab2
```

Note that this function is similar to [debug.getinfo](https://www.lua.org/pil/23.1.html), an unavailable part of the standard Lua library which serves a similar purpose.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `function` | function |  | The function of the call stack which the information returned should describe. |
| `options` | string |  | A string that describes what the returned information should represent. It must only contain 0 or 1 instances of the characters `slnaf`, each representing a piece of information:<br><br>- `s` ([[30 Official Roblox Docs/Luau/Strings\|string]]) — The function source identifier, equal to the full name of the script the function is defined in. - `l` ([[30 Official Roblox Docs/Luau/Numbers\|number]]) — The line that `function` is defined on. - `n` ([[30 Official Roblox Docs/Luau/Strings\|string]]) — The name of the function; may be `nil` for anonymous functions and C functions without an assigned debug name. - `a` ([[30 Official Roblox Docs/Luau/Numbers\|number]], [[30 Official Roblox Docs/Luau/Booleans\|boolean]]) — Arity of the function, which refers to the parameter count and whether the function is variadic. - `f` ([[30 Official Roblox Docs/Luau/Functions\|function]]) — The function which was inspected. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | One value per character in `options`, in the order they appear: source identifier (`s`), line number (`l`), function name (`n`), parameter count and whether variadic (`a`), or the function itself (`f`). |

### info

```lua
debug.info(thread: thread, level: number, options: string): Tuple
```

Allows programmatic inspection of the call stack. This function differs from [[30 Official Roblox Docs/API Reference/Libraries/debug#traceback|debug.traceback()]] in that it guarantees the format of the data it returns. This is useful for general logging and filtering purposes as well as for sending the data to systems expecting structured input, such as crash aggregation.

```lua
local function fnA()
	-- Output source identifier ("s") and line ("l") at levels 1 and 2
	print(debug.info(1, "sl"))  --> fnA() 3
	print(debug.info(2, "sl"))  --> fnA() 7
end

fnA()
```

Note that this function is similar to [debug.getinfo](https://www.lua.org/pil/23.1.html), an unavailable part of the standard Lua library which serves a similar purpose.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `thread` | thread |  | A thread as returned by [[30 Official Roblox Docs/API Reference/Libraries/coroutine#create\|coroutine.create()]]. |
| `level` | number |  | Determines at what level of the call stack the information returned should describe. A value of `1` represents the function which is calling [[30 Official Roblox Docs/API Reference/Libraries/debug#info\|debug.info()]], a value of `2` represents the function that called that function, and so on. |
| `options` | string |  | A string that describes what the returned information should represent. It must only contain 0 or 1 instances of the characters `slnaf`, each representing a piece of information:<br><br>- `s` ([[30 Official Roblox Docs/Luau/Strings\|string]]) — The function source identifier, equal to the full name of the script the function is defined in. - `l` ([[30 Official Roblox Docs/Luau/Numbers\|number]]) — The line number of the function call represented by `level`. - `n` ([[30 Official Roblox Docs/Luau/Strings\|string]]) — The name of the function; may be `nil` for anonymous functions and C functions without an assigned debug name. - `a` ([[30 Official Roblox Docs/Luau/Numbers\|number]], [[30 Official Roblox Docs/Luau/Booleans\|boolean]]) — Arity of the function, which refers to the parameter count and whether the function is variadic. - `f` ([[30 Official Roblox Docs/Luau/Functions\|function]]) — The function which was inspected. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | One value per character in `options`, in the order they appear: source identifier (`s`), line number (`l`), function name (`n`), parameter count and whether variadic (`a`), or the function itself (`f`). |

### profilebegin

```lua
debug.profilebegin(label: string): ()
```

Starts profiling for a [[30 Official Roblox Docs/Performance Optimization/Microprofiler/MicroProfiler|MicroProfiler]] label.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `label` | string |  | The text that this [[30 Official Roblox Docs/Performance Optimization/Microprofiler/MicroProfiler\|MicroProfiler]] label displays. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### profileend

```lua
debug.profileend(): ()
```

Stops profiling for the most recent [[30 Official Roblox Docs/Performance Optimization/Microprofiler/MicroProfiler|MicroProfiler]] label that [[30 Official Roblox Docs/API Reference/Libraries/debug#profilebegin|debug.profilebegin()]] opened.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### getmemorycategory

```lua
debug.getmemorycategory(): string
```

Returns the name of the current thread's active memory category.

**Returns**

| Type | Description |
| --- | --- |
| string | The current thread's active memory category. |

### setmemorycategory

```lua
debug.setmemorycategory(tag: string): string
```

Assigns a custom tag name to the current thread's memory category in the [[30 Official Roblox Docs/Studio/Developer Console|Developer Console]]. Useful for analyzing memory usage of multiple threads in the same script which would otherwise be grouped together under the same tag/name. Returns the name of the current thread's previous memory category.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tag` | string |  | The custom name to assign to the current thread's memory category in the Developer Console. |

**Returns**

| Type | Description |
| --- | --- |
| string | The current thread's previous memory category. |

### resetmemorycategory

```lua
debug.resetmemorycategory(): ()
```

Resets the tag assigned by [[30 Official Roblox Docs/API Reference/Libraries/debug#setmemorycategory|debug.setmemorycategory()]] to the automatically assigned value (typically, the script name).

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### dumpcodesize

```lua
debug.dumpcodesize(): ()
```

Displays a table of native code size of individual functions and scripts. This function is only available in the Command Bar in Studio. More details can be found on the [[30 Official Roblox Docs/Luau/Native code generation|Native Code Generation]] page.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [debug](https://create.roblox.com/docs/reference/engine/libraries/debug) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
