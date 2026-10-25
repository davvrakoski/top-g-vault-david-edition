---
title: "Scripting"
description: "An introduction to scripting in Roblox with the Luau programming language."
area: "30 Official Roblox Docs"
cluster: "Scripting"
source: "https://create.roblox.com/docs/scripting"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*An introduction to scripting in Roblox with the Luau programming language.*

Scripts are plain text files that let you add custom, dynamic behavior to your games. You can use scripts to trigger in-game events, respond to player input, save player data, create leaderboards, spawn enemies, control NPC behavior, and much, much more.

> [!success]
> This section is for creators with some coding experience who want to know the specifics of scripting in Roblox.
>
> If you've never written code before and want an introduction to programming, see [[30 Official Roblox Docs/Tutorials/Fundamentals/Coding 1/Coding fundamentals|Coding fundamentals]], which covers concepts like variables, functions, conditionals, loops, and arrays. For a more guided, step-by-step approach, see the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Scripting/Basic Scripting/Introduction to scripting|Basic gameplay]] tutorial.

## Luau

Roblox scripts use the [Luau](https://luau.org) programming language, which is derived from [Lua 5.1](https://www.lua.org/manual/5.1/).

- Compared to Lua 5.1, Luau adds performance enhancements and many useful features, including an optional typing system, string interpolation, and generalized iteration for tables.
- All valid Lua 5.1 code is valid Luau code, but the opposite is not true.

Most books and online resources for Lua are still broadly applicable to Luau. For a detailed summary of differences, see [Compatibility](https://luau.org/compatibility) in the Luau documentation. For language syntax, see the [[30 Official Roblox Docs/Luau/Luau|Luau reference]].

### Luau basics

Luau is gradually typed, so you don't need to specify a type when you create a variable. You can use [[30 Official Roblox Docs/API Reference/Globals/Luau globals#type|type()]] to check object type:

```lua
logMessage = "User has more than 10 items!"
print(logMessage) --> User has more than 10 items!
print(type(logMessage)) --> string
```

Luau has global and local [[30 Official Roblox Docs/Luau/Scope|scopes]], but it's almost always better to declare variables and functions locally with the `local` keyword:

```lua
local logMessage = "User has more than 10 items!"
local function printMessage()
	print(logMessage)
end
printMessage() --> User has more than 10 items!
```

Luau uses `nil` to represent nonexistence or nothingness, which evaluates as `false` in conditional statements:

```lua
local messageToUser
print(messageToUser) --> nil
print(type(messageToUser)) --> nil
if messageToUser then
	-- statement evaluates to false
end
```

As you might have noticed, `--` starts a one-line comment. `--[[]]` creates a block comment:

```lua
--[[
    Shuts off the cosmic moon ray immediately.

    Should only be called within 15 minutes of midnight Mountain Standard
    Time to avoid damage to the cosmic moon ray.
]]
local function stopCosmicMoonRay()
	-- add this later, it might prove important
end
```

[[30 Official Roblox Docs/Luau/Tables|Tables]] are the generic term for arrays and dictionaries. Arrays are one-based rather than zero-based, so the first item is `[1]`. You declare arrays and dictionaries with a single set of curly braces:

```lua
local myArray = {"chips", "sparkling water", "salsa"}
local myDictionary = {
	snack = "chips",
	drink = "sparkling water",
	dip = "salsa"
}
print(myArray[1]) --> chips
print(myDictionary.dip) --> salsa
```

You can iterate over tables using `for` loops with the [[30 Official Roblox Docs/API Reference/Globals/Luau globals#ipairs|ipairs()]] function for arrays and the [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pairs|pairs()]] function for dictionaries, but Luau also lets you omit these functions for cleaner syntax:

```lua
for index, value in ipairs(myArray) do -- standard Lua
	print(index, value)
end
for key, value in pairs(myDictionary) do -- standard Lua
	print(key, value)
end
for key, value in myDictionary do -- Luau generalized iteration
	print(key, value)
end
```

## Your first script

1. In Roblox Studio, hover over **ServerScriptService** in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window and click **+**.
1. Select **Script** to add a new script.
1. Right-click the script and rename it to `HelloScript`.
1. Double-click the script to open it in the [[30 Official Roblox Docs/Studio/Script Editor|Script Editor]].
1. Add the following code to the file:

   ```lua
   local helloArray = {"h", "e", "l", "l", "o"}
   local worldArray = {"w", "o", "r", "l", "d"}

   for index, value in helloArray do
   	print(value)
   end

   print(table.concat(worldArray))
   ```

1. Ensure that the [[30 Official Roblox Docs/Studio/Output|Output]] window is open.
1. [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|Run your game]] and note the output:

   ```text
   h
   e
   l (x2)
   o
   world
   ```

## Get comfortable

A big part of adapting to a new development environment is configuring it to meet your needs and understanding the tools at your disposal:

- The **Script Editor** section of [[30 Official Roblox Docs/Studio/Roblox Studio setup#Customization|Studio Settings]] lets you adjust quality of life features like font, colors, indentation, autocomplete, brackets, and tooltips. You might also want to enable dark mode in the **Studio** section.
- Holding <kbd>Ctrl</kbd> or <kbd>Command</kbd> and clicking on a function or variable takes you to its declaration in your codebase (or its online documentation). Using [[30 Official Roblox Docs/Studio/Script Editor#Find and replace|Find and Find All]] can help you navigate larger projects.
- The [[30 Official Roblox Docs/Studio/Output|Output]] window is the most basic tool for understanding the behavior of your scripts. Use the **⋯** menu to enable **Show Context** and **Show Source**.
- The [[30 Official Roblox Docs/Studio/Script Editor#Script Analysis|Script Analysis]] window shows a summary of errors and warnings, but you might find its utility limited; the Script Editor already highlights these issues as you type.
- Logging capabilities are minimal, with no concept of log levels like `DEBUG` or `FATAL`. Use [[30 Official Roblox Docs/API Reference/Globals/Luau globals#print|print()]] and [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#warn|warn()]].

For more information about configuring Studio for scripting, see [[30 Official Roblox Docs/Studio/Script Editor|Script Editor]].

> [!success]
> Many developers prefer to use an external text editor and version control system rather than the built-in editor. See [[30 Official Roblox Docs/Scripting/Script Sync|Script Sync]] and [[30 Official Roblox Docs/Projects/Third-party tools|third-party tools]].

## Your second script

1. In Roblox Studio, add a script to **ReplicatedStorage** in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window and rename it to `OhNo`.
1. Add the following code to the file:

   ```lua
   print("Hello script types and locations!")
   ```

1. [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|Run your game]].
1. Note how the output is no different than when you ran [[30 Official Roblox Docs/Scripting/Scripting#Your first script|your first script]].

To understand why the script didn't run, see [[30 Official Roblox Docs/Scripting/Script types and locations|Script Types and Locations]].

---
*Source: [Scripting](https://create.roblox.com/docs/scripting) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
