---
title: "BaseScript"
description: "The base class for all script objects which run automatically."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BaseScript"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The base class for all script objects which run automatically.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/Script|Script]]
- **Memory category:** Script
- **Tags:** `NotCreatable`

## Description

The base class for all script objects which run automatically.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BaseScript#Disabled\|Disabled]] | boolean | Determines whether a [[30 Official Roblox Docs/API Reference/Classes/BaseScript\|BaseScript]] runs or not. |
| [[30 Official Roblox Docs/API Reference/Classes/BaseScript#Enabled\|Enabled]] | boolean | Determines whether a [[30 Official Roblox Docs/API Reference/Classes/BaseScript\|BaseScript]] runs or not. |
| [[30 Official Roblox Docs/API Reference/Classes/BaseScript#LinkedSource\|LinkedSource]] | ContentId | **Deprecated.** The content ID of an uploaded script. When set binds the uploaded code to the script's [[30 Official Roblox Docs/API Reference/Classes/Script#Source\|Script.Source]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext\|RunContext]] | [[30 Official Roblox Docs/API Reference/Enums/RunContext\|RunContext]] | Determines the context under which the script runs. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Disabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true

Determines whether a [[30 Official Roblox Docs/API Reference/Classes/BaseScript|BaseScript]] runs or not.

Setting this property to true while the script is running drops its references to the script's thread; a thread that is yielded (or that yields later) is never resumed and becomes eligible for garbage collection. A thread that is actively executing continues to run until it next yields or returns.

If this property is changed from true to false, a fresh run of the script is started. This means that [[30 Official Roblox Docs/API Reference/Classes/BaseScript#Disabled|Disabled]] can be toggled to restart a script.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Tags:** `NotReplicated`

Determines whether a [[30 Official Roblox Docs/API Reference/Classes/BaseScript|BaseScript]] runs or not. We recommend this property over the similar but opposite [[30 Official Roblox Docs/API Reference/Classes/BaseScript#Disabled|Disabled]].

Setting this property to false while the script is running drops its references to the script's thread; a thread that is yielded (or that yields later) is never resumed and becomes eligible for garbage collection. A thread that is actively executing continues to run until it next yields or returns.

If this property is changed from false to true, a fresh run of the script is started. This means that [[30 Official Roblox Docs/API Reference/Classes/BaseScript#Enabled|Enabled]] can be toggled to restart a script.

### LinkedSource

> [!warning] Deprecated
> This property is now replaced by
> [packages](30%20Official%20Roblox%20Docs/Projects/Assets/Packages.md) which has greater
> functionality.

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** LoadUnownedAsset · **Tags:** `Deprecated`

The content ID of an uploaded script. When set binds the uploaded code to the script's [[30 Official Roblox Docs/API Reference/Classes/Script#Source|Script.Source]].

By default, this property is set to _'[Embedded]'_. This means the source of the script is not linked to an upload script and is instead written in the script.

```lua
script.LinkedSource = "http://www.roblox.com/asset/?id=1014476" -- link source
```

Developers should remove a linked source via the properties window, rather than setting the property to _'[Embedded]'_.

For the LinkedSource property for [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]], please see [[30 Official Roblox Docs/API Reference/Classes/ModuleScript#LinkedSource|ModuleScript.LinkedSource]].

### RunContext

**Type:** [[30 Official Roblox Docs/API Reference/Enums/RunContext|RunContext]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true

Determines the context under which the script runs. Only available for [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]], not [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]].

When set to `Legacy`, [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] only run when parented to certain containers. See [[30 Official Roblox Docs/Scripting/Script types and locations|Script types and locations]].

If `RunContext` is assigned while the script is running, the engine drops its references to that thread, and a fresh run of the script is started under the new context (if possible). A thread that is actively executing continues to run until it next yields or returns.

---
*Source: [BaseScript](https://create.roblox.com/docs/reference/engine/classes/BaseScript) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
