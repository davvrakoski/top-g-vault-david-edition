---
title: "SurfaceLight"
description: "A light source that emits illumination of a specified color and brightness from a face for a specified range."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SurfaceLight"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A light source that emits illumination of a specified color and brightness from a face for a specified range.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Light|Light]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A SurfaceLight is a light source that emits illumination of a specified [[30 Official Roblox Docs/API Reference/Classes/Light#Color|Light.Color]] and [[30 Official Roblox Docs/API Reference/Classes/Light#Brightness|Light.Brightness]] from a [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight#Face|SurfaceLight.Face]] for a specified [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight#Range|SurfaceLight.Range]].

In order for a SurfaceLight to provide illumination, it must be the direct child of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] (the part or attachment itself must be a descendant of the Workspace). If a SurfaceLight is parented to a part, then the light will emanate from the part's selected face(s). If parented to an attachment SurfaceLight is equivalent to a [[30 Official Roblox Docs/API Reference/Classes/SpotLight|SpotLight]].

For more light types, please see the **see also** section.

## See Also

- [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]]
- [[30 Official Roblox Docs/API Reference/Classes/SpotLight|SpotLight]]

*Code samples for this API (`surfacelight`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/SurfaceLight); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight#Angle\|Angle]] | float | The angle of which the light is shone from the SurfaceLight. |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight#Face\|Face]] | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] | Sets the side of the parent that the SurfaceLight comes from. |
| [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight#Range\|Range]] | float | The distance from the SurfaceLight's face that will illuminate. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Light|Light]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Angle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The angle of which the light is shone from the SurfaceLight.

### Face

**Type:** [[30 Official Roblox Docs/API Reference/Enums/NormalId|NormalId]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets the side of the parent that the SurfaceLight comes from.

### Range

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The distance from the SurfaceLight's face that will illuminate.

---
*Source: [SurfaceLight](https://create.roblox.com/docs/reference/engine/classes/SurfaceLight) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
