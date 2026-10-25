---
title: "SpotLight"
description: "A light source that emits light directionally in the shape of a cone with a spherical base."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SpotLight"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A light source that emits light directionally in the shape of a cone with a spherical base.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Light|Light]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A **Spotlight** emits light of a specified [[30 Official Roblox Docs/API Reference/Classes/Light#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/Light#Brightness|Brightness]] in the shape of a cone with a spherical base. This object is ideal for **directional** light sources like flashlights and headlights.

[[30 Official Roblox Docs/API Reference/Classes/SpotLight#Range|Range]] controls the distance of illumination and [[30 Official Roblox Docs/API Reference/Classes/SpotLight#Angle|Angle]] defines the angle of light emission from the cone's apex as illustrated below.

A spotlight must be a direct child of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] and will exhibit the following behavior:

- When the spotlight is parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], the [[30 Official Roblox Docs/API Reference/Classes/SpotLight#Face|Face]] property determines the face of the part from which light emanates.

- Although [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] don't have faces, the [[30 Official Roblox Docs/API Reference/Classes/SpotLight#Face|Face]] property determines the axis of the attachment from which light emanates; **-Z** is front, **+X** is right, **+Y** is top, etc.

See also [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight|SurfaceLight]] and [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SpotLight#Angle\|Angle]] | float | The angle of which the light is shone from the SpotLight. |
| [[30 Official Roblox Docs/API Reference/Classes/SpotLight#Face\|Face]] | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] | Sets the side of the parent that the SpotLight comes from. |
| [[30 Official Roblox Docs/API Reference/Classes/SpotLight#Range\|Range]] | float | The size of the area that the SpotLight will illuminate. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Light|Light]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Angle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The angle of which the light is shone from the SpotLight.

### Face

**Type:** [[30 Official Roblox Docs/API Reference/Enums/NormalId|NormalId]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets the side of the parent that the SpotLight comes from.

### Range

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The size of the area that the SpotLight will illuminate.

---
*Source: [SpotLight](https://create.roblox.com/docs/reference/engine/classes/SpotLight) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
