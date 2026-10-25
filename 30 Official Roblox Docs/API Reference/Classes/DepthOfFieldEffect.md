---
title: "DepthOfFieldEffect"
description: "Simulates a camera lens by blurring parts of a scene not in focus."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DepthOfFieldEffect"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Simulates a camera lens by blurring parts of a scene not in focus.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PostEffect|PostEffect]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **DepthOfFieldEffect** simulates a camera lens by blurring parts of a scene not in focus. Distant objects can be blurred or this effect can be used to focus on specific parts of a scene, like an item in an in-game shop.

Like other post-processing effects, **DepthOfFieldEffect** will only work while [[30 Official Roblox Docs/API Reference/Classes/PostEffect#Enabled|Enabled]] and when parented to [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] or [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|Workspace.CurrentCamera]]. Also, it may render differently on low-end devices or depending on your Studio settings (see the **Quality Level** settings in **Rendering** → **Performance**).

For more details on this effect and others, see [[30 Official Roblox Docs/Environment/Post-processing effects|Post-Processing Effects]].

*(image in the full Top G Vault)*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect#FarIntensity\|FarIntensity]] | float | Intensity of the far field blur. |
| [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect#FocusDistance\|FocusDistance]] | float | Distance away from the camera where objects are in focus. |
| [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect#InFocusRadius\|InFocusRadius]] | float | Controls the distance away from the [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect#FocusDistance\|FocusDistance]] where no blur is applied. |
| [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect#NearIntensity\|NearIntensity]] | float | Intensity of the near field blur. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PostEffect|PostEffect]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### FarIntensity

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Intensity of the far field blur, moving out in distance from the [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect#FocusDistance|FocusDistance]] point plus [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect#InFocusRadius|InFocusRadius]] value.

*(image in the full Top G Vault)*

### FocusDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Controls the distance away from the camera (in studs) where objects are in focus.

*(image in the full Top G Vault)*

### InFocusRadius

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Controls the distance away from the [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect#FocusDistance|FocusDistance]] (on both sides) where no blur is applied. Measured in studs.

*(image in the full Top G Vault)*

### NearIntensity

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** Environment

Intensity of the near field blur, between the camera and the [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect#FocusDistance|FocusDistance]] point minus [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect#InFocusRadius|InFocusRadius]] value.

*(image in the full Top G Vault)*

---
*Source: [DepthOfFieldEffect](https://create.roblox.com/docs/reference/engine/classes/DepthOfFieldEffect) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
