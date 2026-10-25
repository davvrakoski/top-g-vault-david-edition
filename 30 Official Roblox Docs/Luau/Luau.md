---
title: "Luau"
description: "Luau is the scripting language creators use in Roblox Studio."
area: "30 Official Roblox Docs"
cluster: "Luau"
source: "https://create.roblox.com/docs/luau"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Luau is the scripting language creators use in Roblox Studio.*

[Luau](https://luau.org) is the scripting language creators use in Roblox Studio. It is a fast, small, safe, gradually typed embeddable scripting language derived from [Lua 5.1](https://www.lua.org/manual/5.1/).

> [!success]
> Contributing your Luau scripts for AI training can help enhance Luau-focused AI tools in Studio. For more information, see [Empower Luau creation](https://create.roblox.com/data-collection).

## Support in Studio

The **Script Editor** in Studio supports Luau with autocompletion, syntax highlighting, static linting, type checking, and script analysis. It also shows documentation and function signatures for members of the [[30 Official Roblox Docs/API Reference/API Reference|Roblox Engine API]].

## Types

Luau includes the following data types:

- [[30 Official Roblox Docs/Luau/Nil|Nil]] represents non-existence or nothingness. It's different from any other value or data type.
- [[30 Official Roblox Docs/Luau/Booleans|Booleans]], or `bool`, have a value of either `false` or `true`.
- [[30 Official Roblox Docs/Luau/Numbers|Numbers]], or `double`, represent double-precision (64-bit) floating-point numbers.
- [[30 Official Roblox Docs/Luau/Strings|Strings]] are sequences of characters, such as letters, numbers, and symbols.
- [[30 Official Roblox Docs/Luau/Tables|Tables]] are [[30 Official Roblox Docs/Luau/Tables#Arrays|arrays]] or [[30 Official Roblox Docs/Luau/Tables#Dictionaries|dictionaries]] of any value except `nil`.
- [[30 Official Roblox Docs/Luau/Enums|Enums]] are fixed lists of items.

Luau is dynamically typed by default. Variables, function parameters, and return values can be any data type. This helps you write code faster because you don't need to provide types for each piece of data. You can still declare explicit types for variables in Luau and enable [[30 Official Roblox Docs/Luau/Type checking|strict type checking]] to make type issues obvious and easy to locate.

## Data structures

You can also implement the following data structures using primitive data types:

- [[30 Official Roblox Docs/Luau/Stacks|Stacks]] are Last-In-First-Out collections of items that you can implement using tables.
- [[30 Official Roblox Docs/Luau/Queues|Queues]] are First-In-First-Out collections of items that you can implement using tables.
- [[30 Official Roblox Docs/Luau/Metatables|Metatables]] are tables with advanced configurations that can achieve functionalities such as storing pairs of keys and values and calculating arithmetic operations.

## Features

In Luau, [[30 Official Roblox Docs/Luau/Variables|variables]] and [[30 Official Roblox Docs/Luau/Functions|functions]] can have global and local [[30 Official Roblox Docs/Luau/Scope|scope]] within a script. Luau has logical, relational, and compound assignment [[30 Official Roblox Docs/Luau/Operators|operators]]. You can use [[30 Official Roblox Docs/Luau/Control structures|control structures]] and [[30 Official Roblox Docs/Luau/Functions|functions]] to control when Luau executes code. Many operators and variable assignments perform [[30 Official Roblox Docs/Luau/Type coercion|type coercion]] to change values to the types that Luau expects.

---
*Source: [Luau](https://create.roblox.com/docs/luau) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
