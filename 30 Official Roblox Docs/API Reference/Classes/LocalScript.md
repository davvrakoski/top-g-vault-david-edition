---
title: "LocalScript"
description: "An object that contains and runs Luau code on the client (player's device) instead of the server."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/LocalScript"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object that contains and runs Luau code on the client (player's device) instead of the server.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] → [[30 Official Roblox Docs/API Reference/Classes/BaseScript|BaseScript]] → [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Script

## Description

A [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] is a Luau source container that runs its contents on the client (player's device) instead of the server. It is used to access client-only objects such as the player's [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]].

For code run through [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]], the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|LocalPlayer]] property of the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] service will return the player whose client is running the script.

See [[30 Official Roblox Docs/Projects/Data model#Client|here]] for a table of valid container services from which [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] will execute.

---
*Source: [LocalScript](https://create.roblox.com/docs/reference/engine/classes/LocalScript) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
