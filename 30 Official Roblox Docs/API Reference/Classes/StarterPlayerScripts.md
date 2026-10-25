---
title: "StarterPlayerScripts"
description: "A container for objects to be copied to a Player's PlayerScripts when they join a game."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StarterPlayerScripts"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A container for objects to be copied to a Player's PlayerScripts when they join a game.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

[[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] is a container object located within the [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] service. It can contain [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] and other objects to be copied to the [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] container once when a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] joins the game. For example, if you want to create special effects on the client when certain conditions are met, you can place a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] within this container to do that.

When an experience is run, this object will also house the default multi-platform Roblox control scripts for the camera and character. If [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] named `CameraScript` or `ControlScript` are placed within this container, they will **replace** the Roblox defaults for those scripts respectively. If desired, you can add empty [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] for each of these to disable them altogether; this is useful for experiences that do not follow the typical control paradigms of a Roblox experience.

---
*Source: [StarterPlayerScripts](https://create.roblox.com/docs/reference/engine/classes/StarterPlayerScripts) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
