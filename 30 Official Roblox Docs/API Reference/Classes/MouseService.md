---
title: "MouseService"
description: "Engine service that manages mouse cursor rendering, mouse lock behavior, the cursor-icon stack, delta sensitivity, and mouse position, delta, and button tracking."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MouseService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Engine service that manages mouse cursor rendering, mouse lock behavior, the cursor-icon stack, delta sensitivity, and mouse position, delta, and button tracking.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Not accessible from scripts (`Input` security). [[30 Official Roblox Docs/API Reference/Classes/MouseService|MouseService]] manages the mouse cursor and mouse input state — cursor rendering (software cursors drawn by the engine and hardware cursors drawn by the operating system), mouse lock behavior, the contextual cursor-icon stack, mouse delta sensitivity, and tracking of the current mouse position, delta, and button state.

[[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] delegates its mouse-related members — such as [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseBehavior|MouseBehavior]], [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseIcon|MouseIcon]], [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseIconEnabled|MouseIconEnabled]], and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#MouseDeltaSensitivity|MouseDeltaSensitivity]] — to this service.

---
*Source: [MouseService](https://create.roblox.com/docs/reference/engine/classes/MouseService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
