---
title: "Configuration"
description: "A container object designed to hold value objects. Makes values used in `Tools` or any model using `Scripts` more accessible."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Configuration"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container object designed to hold value objects. Makes values used in [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]] or any model using [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] more accessible.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The `Configuration` object is a container object. It's designed to hold value objects to make their values more accessible to [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]] or any model that uses [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]].

## How does the Configuration object work?

The `Configuration` object is just a container and does not automatically offer any additional functionality to a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]].

Configurations should hold value objects ([[30 Official Roblox Docs/API Reference/Classes/BrickColorValue|BrickColorValue]], [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]], [[30 Official Roblox Docs/API Reference/Classes/IntValue|IntValue]], [[30 Official Roblox Docs/API Reference/Classes/ObjectValue|ObjectValue]], etc.). These value objects should be read by the [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] associated with the configuration to determine constants such as damage, speed, or color.

For example, a script might include a damage variable:

```lua
local damage = 10
```

With a `Configuration` object, that code becomes:

```lua
local configuration = tool:FindFirstChildWhichIsA("Configuration", true)
damage = configuration:FindFirstChild("Damage").Value -- a NumberValue
```

The `Configuration` object is intended to be placed inside a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] in a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] or [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]]. You can then edit its values in the Roblox Studio Properties window rather than having to update the code.

Typically, you would place the script within the same model or tool as the configuration, so you would have some confidence that the configuration existed and had certain values. If you fetch the configuration from an outside script, you should program more defensively, with `if` statements to check that the configuration and values exist and fallback values in the event that the `Find()` methods fail.

## Why should I use the Configuration object?

Configurations can be convenient for tools and models that you want to use across a range of games or distribute in the Creator Store. The object makes it clear that all variables for the tool or model can be found in this one place, and other creators can make changes without having to modify your code.

For variables that you only want to use within a single game and that you want the flexibility to tune without publishing your experience, see [[30 Official Roblox Docs/Production/Experience configs|Experience configs]].

---
*Source: [Configuration](https://create.roblox.com/docs/reference/engine/classes/Configuration) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
