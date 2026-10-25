---
title: "Script"
description: "An object that contains and runs Luau code on the server."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Script"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object that contains and runs Luau code on the server.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BaseScript|BaseScript]] → [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]
- **Memory category:** Script

## Description

A [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] is a Luau source container that can access server-side objects, properties, and events, such as to award badges to players using [[30 Official Roblox Docs/API Reference/Classes/BadgeService|BadgeService]], while [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] on the client cannot.

The instant that the following conditions are met, a script's code is run in a new thread:

- Its [[30 Official Roblox Docs/API Reference/Classes/BaseScript#Enabled|Enabled]] property is `true`.
- The [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] object is a descendant of the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] or [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]].

The script will continue to run until the above conditions are **not** met, it terminates, or it raises an error (unless that error is raised by a function connected to some event that is firing). Additionally, the thread will be stopped if the script or one of its ancestors is destroyed. A script will continue to run even if the [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] property is set to `nil` and the [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] is not destroyed.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Script#Source\|Source]] | ProtectedString | The code to be executed. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BaseScript|BaseScript]], [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Source

**Type:** ProtectedString

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** PluginOrOpenCloud

Represents the code to be executed. It's protected and discouraged for editing directly. Attempting to access this property in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] causes errors.

If you want to read or modify the source of a script that a user has open, use [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService|ScriptEditorService]] to interact with the [[30 Official Roblox Docs/Studio/Script Editor|Script Editor]] rather than directly modifying this property. Both [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#UpdateSourceAsync|ScriptEditorService:UpdateSourceAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#GetEditorSource|ScriptEditorService:GetEditorSource()]] can read or modify script content from the script editor if the script is opened. You can also read the source from the [command line](https://create.roblox.com/docs/studio/ui-overview#command-bar).

---
*Source: [Script](https://create.roblox.com/docs/reference/engine/classes/Script) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
