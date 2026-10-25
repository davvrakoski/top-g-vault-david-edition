---
title: "StarterCharacterScripts"
description: "Stores instances to be parented to a player's character when it spawns."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StarterCharacterScripts"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Stores instances to be parented to a player's character when it spawns.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

The [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]] container stores scripts to be parented to a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] when it spawns. Unlike scripts stored in the [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] folder, these scripts will not persist when the character respawns.

If a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] named `Animate`, `Sound`, or `Health` is placed in this container, it will replace the default script that manages character animations, character sounds, and character health regeneration respectively.

---
*Source: [StarterCharacterScripts](https://create.roblox.com/docs/reference/engine/classes/StarterCharacterScripts) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
