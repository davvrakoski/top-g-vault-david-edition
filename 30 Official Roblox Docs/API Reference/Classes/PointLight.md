---
title: "PointLight"
description: "A light source that emits illumination from a single point."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PointLight"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A light source that emits illumination from a single point.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Light|Light]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A PointLight is a light source that emits illumination from a single point. Light is emitted spherically based on the [[30 Official Roblox Docs/API Reference/Classes/PointLight#Range|PointLight.Range]] of the PointLight.

In order for a PointLight to provide illumination, it must be the direct child of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] (the part or attachment itself must be a descendant of the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]).

If a PointLight is parented to a part, then the light will emanate from the part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|BasePart.Position]]. If a PointLight is parented to an attachment, then the light will emanate from the attachment's [[30 Official Roblox Docs/API Reference/Classes/Attachment#WorldPosition|Attachment.WorldPosition]].

For more light types, see the **see also** section.

## See Also

- [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight|SurfaceLight]]
- [[30 Official Roblox Docs/API Reference/Classes/SpotLight|SpotLight]]

*Code samples for this API (`pointlight`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/PointLight); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PointLight#Range\|Range]] | float | The size of the area that the PointLight will illuminate. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Light|Light]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Range

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The size of the area that the PointLight will illuminate.

---
*Source: [PointLight](https://create.roblox.com/docs/reference/engine/classes/PointLight) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
