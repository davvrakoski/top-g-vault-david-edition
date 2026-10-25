---
title: "ConfigureServerService"
description: "Configures a server's `DataModel` for a place session during game-server startup."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ConfigureServerService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Configures a server's [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] for a place session during game-server startup.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

Internal-only service; not accessible from scripts and exposes no scriptable properties, methods, events, or callbacks. Configures a [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] for a place session and starts it running on the game server. During server startup it applies incoming join settings (place and universe identifiers, matchmaking context, players, localization, voice and avatar-chat options, and similar values), then either starts the [[30 Official Roblox Docs/API Reference/Classes/RunService|RunService]] so simulation and scripts begin, or loads the place without running it for editing and other non-play sessions.

---
*Source: [ConfigureServerService](https://create.roblox.com/docs/reference/engine/classes/ConfigureServerService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
