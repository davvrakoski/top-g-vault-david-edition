---
title: "KeyboardService"
description: "Service that maintains keyboard state, `TextBox` focus, and clipboard access; scripts read keyboard input through `UserInputService` instead."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/KeyboardService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Service that maintains keyboard state, [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] focus, and clipboard access; scripts read keyboard input through [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] instead.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

Exposes no members for use in scripts. [[30 Official Roblox Docs/API Reference/Classes/KeyboardService|KeyboardService]] maintains per-window keyboard state — which keys are held, [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] focus and on-screen keyboard geometry, clipboard access, and key-code display strings — that experiences read through [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] (for example [[30 Official Roblox Docs/API Reference/Classes/UserInputService#IsKeyDown|UserInputService:IsKeyDown()]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetKeysPressed|UserInputService:GetKeysPressed()]]).

---
*Source: [KeyboardService](https://create.roblox.com/docs/reference/engine/classes/KeyboardService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
