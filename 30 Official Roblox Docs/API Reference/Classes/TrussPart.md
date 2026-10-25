---
title: "TrussPart"
description: "Similar to a `Part` but with a different visual `Style` and the important distinction that default characters are able to climb it."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TrussPart"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Similar to a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] but with a different visual [[30 Official Roblox Docs/API Reference/Classes/TrussPart#Style|Style]] and the important distinction that default characters are able to climb it.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A `TrussPart` is similar to a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] but with a different visual [[30 Official Roblox Docs/API Reference/Classes/TrussPart#Style|Style]] and the important distinction that default characters are able to climb it.

This part type has significantly more restrictive size limitations than other parts; it must be `2*2*n` studs where `n` is a multiple of `2` with a maximum of `512`.

Additionally, this part type does not support styling through the addition of [[30 Official Roblox Docs/API Reference/Classes/Decal|Decals]] or [[30 Official Roblox Docs/API Reference/Classes/Texture|Textures]]. If you wish to create a textured and "climbable" [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] but also utilize the climbing behavior of `TrussPart`, consider setting the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|Transparency]] of the `TrussPart` to `1` to make it invisible, set [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|CanCollide]] on the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] to `false`, and then align the climbable surface of the mesh/model with that of the `TrussPart`.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TrussPart#Style\|Style]] | [[30 Official Roblox Docs/API Reference/Enums/Style\|Style]] | Sets what the truss looks like. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Style

**Type:** [[30 Official Roblox Docs/API Reference/Enums/Style|Style]]

**Thread safety:** ReadSafe · **Category:** Part · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

Sets what the truss looks like, from the following options:

- [[30 Official Roblox Docs/API Reference/Enums/Style|Enum.Style.AlternatingSupports]]
- [[30 Official Roblox Docs/API Reference/Enums/Style|Enum.Style.BridgeStyleSupports]]
- [[30 Official Roblox Docs/API Reference/Enums/Style|Enum.Style.NoSupports]]

---
*Source: [TrussPart](https://create.roblox.com/docs/reference/engine/classes/TrussPart) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
