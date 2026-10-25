---
title: "PluginCapabilities"
description: "Declares a plugin's capabilities (the data models it targets and the permissions it requests) through a JSON manifest."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PluginCapabilities"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Declares a plugin's capabilities (the data models it targets and the permissions it requests) through a JSON manifest.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

[[30 Official Roblox Docs/API Reference/Classes/PluginCapabilities|PluginCapabilities]] describes what a plugin is allowed to do. Its [[30 Official Roblox Docs/API Reference/Classes/PluginCapabilities#Manifest|Manifest]] property holds a JSON string that declares which data models the plugin targets (such as `Edit`, `Server`, and `Client`) and the permissions the plugin requests. It's used by built-in and standalone plugins to record their declared capabilities.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginCapabilities#Manifest\|Manifest]] | string | A JSON string declaring the plugin's target data models and requested permissions. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Manifest

**Type:** string

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

A JSON-encoded string describing the plugin's declared capabilities. It contains a `Metadata` object whose `TargetDataModels` array names the data models the plugin runs against (`Edit`, `Server`, and `Client`), and a `Permissions` object listing the permissions the plugin requests. Defaults to `{"Metadata":{"TargetDataModels": ["Edit", "Server", "Client"]},"Permissions":{}}`, which targets all three data models and requests no additional permissions.

---
*Source: [PluginCapabilities](https://create.roblox.com/docs/reference/engine/classes/PluginCapabilities) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
