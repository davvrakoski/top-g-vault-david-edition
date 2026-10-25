---
title: "VRSessionState"
description: "The lifecycle state of the active VR session, as reported by the `VRSessionState` property of `VRService`."
api_type: enum
aliases: ["Enum.VRSessionState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/VRSessionState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The lifecycle state of the active VR session, as reported by the `VRSessionState` property of [[30 Official Roblox Docs/API Reference/Classes/VRService|VRService]].*

## Description

Represents the current state of the VR session managed by [[30 Official Roblox Docs/API Reference/Classes/VRService|VRService]]. The engine updates `VRSessionState` each frame from the active session.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Undefined` | 0 | The VR session state is unknown or has not yet been established; the default value of `VRSessionState`. |
| `Idle` | 1 | The VR headset is connected and ready but is not yet presenting frames to the user. |
| `Visible` | 2 | The VR session is rendering frames visible to the user but does not yet have XR input focus; haptic feedback is available. |
| `Focused` | 3 | The VR session has full XR input focus and is rendering visible frames; haptic feedback is available. |
| `Stopping` | 4 | The VR session is in the process of stopping and will transition to an inactive state. |

---
*Source: [VRSessionState](https://create.roblox.com/docs/reference/engine/enums/VRSessionState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
