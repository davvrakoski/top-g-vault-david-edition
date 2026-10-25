---
title: "ServerScriptService"
description: "A container service for server-only `Script` objects."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ServerScriptService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container service for server-only [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] objects.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

**ServerScriptService** is a container service for [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] and other scripting-related assets that are only meant for server use. The contents are never replicated to player clients at all, which allows for a secure storage of important game logic. Script objects will run if they are within this service and not [[30 Official Roblox Docs/API Reference/Classes/BaseScript#Disabled|Disabled]].

This service houses just one property, [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService#LoadStringEnabled|LoadStringEnabled]], which determines whether the `loadstring` function in Luau is enabled. It's recommended to keep this disabled for security reasons, as misusing this function can lead to remote code execution vulnerabilities.

Scripts running in ServerScriptService may need access to various other assets which are not scripting-related, such as prefabricated models to be [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|cloned]]. Such assets should go in [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]], which behaves similarly to this service except that [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] objects will not run even if they are not [[30 Official Roblox Docs/API Reference/Classes/BaseScript#Disabled|Disabled]]. Assets and [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] that are useful to both the server and clients should go in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] instead. Finally, you can further organize objects within this service through the use of [[30 Official Roblox Docs/API Reference/Classes/Folder|Folders]] without affecting the way it behaves.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService#LoadStringEnabled\|LoadStringEnabled]] | boolean | Toggles whether or not the `loadstring` function can be used by server scripts. Defaults to false. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### LoadStringEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Basic · **Tags:** `NotReplicated`, `NotScriptable`

Toggles whether or not the `loadstring` function can be used by server scripts. Defaults to false.

---
*Source: [ServerScriptService](https://create.roblox.com/docs/reference/engine/classes/ServerScriptService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
