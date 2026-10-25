---
title: "DebugSettings"
description: "Collection of various developer-facing diagnostics information."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DebugSettings"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Collection of various developer-facing diagnostics information.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`, `NotBrowsable`

## Description

The DebugSettings allows you to view diagnostics information regarding Roblox. It is labeled as **Diagnostics** in the Roblox Studio Settings menu.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DebugSettings#DataModel\|DataModel]] | int | Describes whether a [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]] is actively in memory, as an integer (where 1 = true, and 0 = false). |
| [[30 Official Roblox Docs/API Reference/Classes/DebugSettings#InstanceCount\|InstanceCount]] | int | The number of instances active in the simulation. |
| [[30 Official Roblox Docs/API Reference/Classes/DebugSettings#IsScriptStackTracingEnabled\|IsScriptStackTracingEnabled]] | boolean | Whether or not a stacktrace is displayed in the output for an error. |
| [[30 Official Roblox Docs/API Reference/Classes/DebugSettings#JobCount\|JobCount]] | int | Returns the number of internal DataModel jobs actively being processed. |
| [[30 Official Roblox Docs/API Reference/Classes/DebugSettings#PlayerCount\|PlayerCount]] | int | The number of players currently in the active game-instance. |
| [[30 Official Roblox Docs/API Reference/Classes/DebugSettings#ReportSoundWarnings\|ReportSoundWarnings]] | boolean | Whether or not sound warnings should be reported. |
| [[30 Official Roblox Docs/API Reference/Classes/DebugSettings#RobloxVersion\|RobloxVersion]] | string | The current client version of Roblox. Can also be retrieved by using the version() function. |
| [[30 Official Roblox Docs/API Reference/Classes/DebugSettings#TickCountPreciseOverride\|TickCountPreciseOverride]] | [[30 Official Roblox Docs/API Reference/Enums/TickCountSampleMethod\|TickCountSampleMethod]] | Sets the internal sampling method used to measure elapsed time with consistency across platforms. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### DataModel

**Type:** int

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Performance · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

Describes whether a [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] is actively in memory, as an integer (where 1 = true, and 0 = false).

### InstanceCount

**Type:** int

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Performance · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

The number of instances active in the simulation.

### IsScriptStackTracingEnabled

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Errors · **Loaded/Saved:** true/true

Whether or not a stacktrace is displayed in the output for an error.

### JobCount

**Type:** int

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Performance · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

Returns the number of internal DataModel jobs actively being processed.

### PlayerCount

**Type:** int

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Performance · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

The number of players currently in the active game-instance.

### ReportSoundWarnings

**Type:** boolean

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Errors · **Loaded/Saved:** true/true

Whether or not sound warnings should be reported.

### RobloxVersion

**Type:** string

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Profile · **Loaded/Saved:** false/true · **Tags:** `ReadOnly`, `NotReplicated`

The current client version of Roblox. Can also be retrieved by using the version() function.

### TickCountPreciseOverride

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TickCountSampleMethod|TickCountSampleMethod]]

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Benchmarking · **Loaded/Saved:** true/true

Sets the internal sampling method used to measure elapsed time with consistency across platforms.

---
*Source: [DebugSettings](https://create.roblox.com/docs/reference/engine/classes/DebugSettings) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
