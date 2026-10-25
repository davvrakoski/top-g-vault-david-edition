---
title: "SoundGroup"
description: "A `SoundGroup` is used to manage the volume and sound effects on multiple `Sounds` at once. `Sounds` in the SoundGroup will have their volume and effects adjusted by the SoundGroup."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SoundGroup"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] is used to manage the volume and sound effects on multiple [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] at once. [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] in the SoundGroup will have their volume and effects adjusted by the SoundGroup.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

A [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] is used to manage the volume and effects on multiple [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] at once. Every sound in the sound group will have its volume adjusted by the group's [[30 Official Roblox Docs/API Reference/Classes/SoundGroup#Volume|Volume]] property which acts as a multiplier, meaning a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] with volume `0.5` assigned to a [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] with a volume of `0.5` will have an effective volume of `0.25`.

If the [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] has any [[30 Official Roblox Docs/API Reference/Classes/SoundEffect|SoundEffects]] as children, those effects will be applied to all of the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] in the group.

Note that a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] must be added to a [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] by setting its [[30 Official Roblox Docs/API Reference/Classes/Sound#SoundGroup|SoundGroup]] property, not by simply parenting the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] to the [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]]. A [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] can only belong to one [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] at a time, although you can nest groups as outlined [[30 Official Roblox Docs/Sound/Sound groups|here]].

See [[30 Official Roblox Docs/Sound/Sound groups|Sound Groups]] for further details on working with the [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]] class.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SoundGroup#Volume\|Volume]] | float | The volume multiplier applied to [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sounds]] that are in the [[30 Official Roblox Docs/API Reference/Classes/SoundGroup\|SoundGroup]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Volume

**Type:** float

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** true/true · **Capabilities:** LegacySound

The volume multiplier applied to [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] which belong to the [[30 Official Roblox Docs/API Reference/Classes/SoundGroup|SoundGroup]]. Value can range from `0` to `10`.

*Code samples for this member (`Sound-SoundGroup`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [SoundGroup](https://create.roblox.com/docs/reference/engine/classes/SoundGroup) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
