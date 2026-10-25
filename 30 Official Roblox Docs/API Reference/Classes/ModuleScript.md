---
title: "ModuleScript"
description: "A script type that runs once when `require()` is called with it. Returns exactly one value, usually a table of functions, to used by other scripts. Useful for compartmentalizing code."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ModuleScript"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A script type that runs once when [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] is called with it. Returns exactly one value, usually a table of functions, to used by other scripts. Useful for compartmentalizing code.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Script

## Description

A [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] is a script type that returns exactly one value by a call to [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]]. [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] run once and only once per Luau environment and return the exact same value for subsequent calls to [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]].

[[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] are essential objects for adhering to the "Don't Repeat Yourself" (DRY) principle, allowing you to write a function only once and use it everywhere. Having multiple copies of a function is problematic when you need to change their behavior, so you should define functions or groups of functions in [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] and have your [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] and [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] call [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] on those modules.

It's important to know that return values from [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] are independent with regards to [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] and [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]], and other environments like the [Command Bar](https://create.roblox.com/docs/studio/ui-overview#command-bar). Using [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] on a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] will run the code on the client, even if a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] did so already on the server. Therefore, be careful if you're using a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] on the client and server at the same time, or debugging it within Studio.

Note that the first call to [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] will not yield (halt) unless the [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] yields (calls [[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]] for example), in which case the current thread that called [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] will yield until the [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] returns a value. If a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] is attempting to [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] another [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] that in turn tries to [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] it, the thread will **hang and never halt** (cyclic [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] calls do not generate errors). Be mindful of your module dependencies in large projects!

If a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] is uploaded to Roblox and the root module has the name set to `MainModule`, it can be uploaded as a model and required using [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] with the model's asset ID. Then it can be loaded into your experience, although this logic only works on the server and will error on the client. If other users want to use the module, it must be public.

*Code samples for this API (`Simple-ModuleScript-Example`, `Simple-ModuleScript-Usage`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ModuleScript); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ModuleScript#LinkedSource\|LinkedSource]] | ContentId | **Deprecated.** Used to store a URL that points to an online script source. Binds the online code to the script's [[30 Official Roblox Docs/API Reference/Classes/Script#Source\|Script.Source]]. |
| [[30 Official Roblox Docs/API Reference/Classes/ModuleScript#Source\|Source]] | ProtectedString | The code to be executed. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### LinkedSource

> [!warning] Deprecated
> This property is now replaced by
> [packages](30%20Official%20Roblox%20Docs/Projects/Assets/Packages.md) which has greater
> functionality.

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** LoadUnownedAsset · **Tags:** `Deprecated`

Used to store a URL that points to an online script source. Binds the online code to the script's [[30 Official Roblox Docs/API Reference/Classes/Script#Source|Script.Source]].

### Source

**Type:** ProtectedString

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** PluginOrOpenCloud

The code to be executed.

If you want to read or modify a script that the user has open, consider using the [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService|ScriptEditorService]] to interact with the Script Editor instead.

---
*Source: [ModuleScript](https://create.roblox.com/docs/reference/engine/classes/ModuleScript) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
