---
title: "Variables"
description: "A name that holds a value."
area: "30 Official Roblox Docs"
cluster: "Luau"
source: "https://create.roblox.com/docs/luau/variables"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*A name that holds a value.*

A **variable** is a name that holds a value. Variable values can be [[30 Official Roblox Docs/Luau/Numbers|numbers]], [[30 Official Roblox Docs/Luau/Strings|strings]], [[30 Official Roblox Docs/Luau/Booleans|booleans]], [[30 Official Roblox Docs/API Reference/Datatypes/_Index - Datatypes|data types]], and more.

## Name variables

Variable names can be any non-reserved string of letters, digits, and underscores that don't start with a digit.

```lua
LETTERS   -- valid
a1        -- valid
var_name  -- valid
_test     -- valid

if        -- NOT valid
25th      -- NOT valid
```

Variable names are **case-sensitive**, so `TestVar` and `TESTVAR` are different names. Avoid naming variables with an underscore and all uppercase letters, such as `_VERSION`, because Luau may reserve them for internal global variables.

### Best practices

It's best practice to spell out words fully. Abbreviations generally make code easier to write, but harder to read. Following common naming practices when naming your variables can help you and others understand their meaning or purpose:

- Use `PascalCase` names for class and enum-like objects.
- Use `PascalCase` names for all Roblox APIs. `camelCase` APIs are mostly deprecated.
- Use `camelCase` names for local variables, member values, and [[30 Official Roblox Docs/Luau/Functions|functions]].
- Use `LOUD_SNAKE_CASE` names for constants, such as [[30 Official Roblox Docs/Luau/Variables#Const variables|const]] values or other values that you don't expect to [[30 Official Roblox Docs/Luau/Variables#Change values|change]].
- Don't capitalize entire acronyms within names. For example, write `aJsonVariable` or `MakeHttpCall`.

### Reserved names

Luau reserves the following keywords, so you can't use them to name variables or [[30 Official Roblox Docs/Luau/Functions|functions]]:

- `and`
- `for`
- `or`
- `break`
- `function`
- `repeat`
- `do`
- `if`
- `return`
- `else`
- `in`
- `then`
- `elseif`
- `local`
- `true`
- `end`
- `nil`
- `until`
- `false`
- `not`
- `while`

## Assign values

To create a variable and assign a value to it, use the `=` operator. Put the variable on the left of the `=` and the value on the right. If you don't put a value, the value is `nil`.

Variables can have **global** or **local** [[30 Official Roblox Docs/Luau/Scope|scopes]]. They have global scope by default, but it's almost always better to create them with local scope because Luau accesses local variables faster than global ones. To give a variable local scope, put the keyword `local` before a variable's name when you assign a value to it. To give it local scope and also prevent reassigning it, use [[30 Official Roblox Docs/Luau/Variables#Const variables|const]] instead of `local`. For more information, see [[30 Official Roblox Docs/Luau/Scope|Scope]].

```lua
local nilVar
local x = 10
local word = "Hello"
local boolean = true

print(nilVar) -- nil
print(x) -- 10
print(word) -- Hello
print(boolean) -- true
```

### Assign values to multiple variables

You can assign values to multiple variables in one line by separating each variable-value pair with a comma. If you have more variables than values, then Luau assigns `nil` to the extra variables. If you have more values than variables, Luau doesn't assign the extra values to any variables.

```lua
local a, b, c = 1, 2, 3
local d, e, f = 4, 5 -- extra variable
local g, h = 7, 8, 9 -- extra value

print(a, b, c) -- 1, 2, 3
print(d, e, f) -- 4, 5, nil
print(g, h) -- 7, 8
```

## Change values

To change a value of a variable, assign another value to it.

```lua
local x, y = 10, 20
print(x) -- 10
print(y) -- 20

x = 1000
y = 2000
print(x) -- 1000
print(y) -- 2000
```

## Const variables

To create a variable that you can't reassign, use `const` instead of `local`. Trying to reassign a `const` variable causes an error, including through a [[30 Official Roblox Docs/Luau/Operators#Compound assignment|compound assignment operator]] such as `+=`.

```lua
const MAX_HEALTH = 100

MAX_HEALTH = 50 -- error: cannot reassign a const variable
MAX_HEALTH += 1 -- error: cannot reassign a const variable
```

Like `local`, `const` accepts a [[30 Official Roblox Docs/Luau/Type checking|type annotation]], such as `const MAX_HEALTH: number = 100`.

You can also declare a function with `const`, which prevents reassigning the name of the function.

```lua
const function addOneAndTwo()
	local result = 1 + 2
	print(result)
end

addOneAndTwo = nil -- error: cannot reassign a const variable
```

`const` makes the variable itself immutable, not the value that it holds. If a `const` variable holds a [[30 Official Roblox Docs/Luau/Tables|table]], you can still change the contents of the table. To make the contents immutable as well, use [[30 Official Roblox Docs/API Reference/Libraries/table#freeze|table.freeze()]].

```lua
const SETTINGS = { volume = 0 }

SETTINGS.volume = 1 -- ok, changes a value inside the table
SETTINGS = {} -- error: cannot reassign a const variable
```

Unlike the keywords in [[30 Official Roblox Docs/Luau/Variables#Reserved names|Reserved names]], `const` is contextual. Luau only treats it as a keyword where `local` is valid, so existing code that uses `const` as a variable name still works.

```lua
local const = 1
print(const) -- 1

const = 2 -- ok, `const` is a variable name here
```

For more information and edge cases, see the [Luau documentation](https://luau.org/syntax/#const-bindings).

---
*Source: [Variables](https://create.roblox.com/docs/luau/variables) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
