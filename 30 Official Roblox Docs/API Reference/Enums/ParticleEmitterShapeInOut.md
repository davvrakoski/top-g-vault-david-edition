---
title: "ParticleEmitterShapeInOut"
description: "Controls the direction particles travel when emitted from a shaped `ParticleEmitter`."
api_type: enum
aliases: ["Enum.ParticleEmitterShapeInOut"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ParticleEmitterShapeInOut"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls the direction particles travel when emitted from a shaped [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]].*

## Description

Controls whether particles emitted from a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] travel outward from, inward toward, or in both directions relative to the emitter shape surface. Used with the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapeInOut|ParticleEmitter.ShapeInOut]] property, which defaults to [[30 Official Roblox Docs/API Reference/Enums/ParticleEmitterShapeInOut|Enum.ParticleEmitterShapeInOut.Outward]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Outward` | 0 | Particles emit directed outward away from the emitter shape surface. |
| `Inward` | 1 | Particles emit directed inward toward the center of the emitter shape. |
| `InAndOut` | 2 | Particles emit in both outward and inward directions from the emitter shape surface, chosen randomly per particle. |

---
*Source: [ParticleEmitterShapeInOut](https://create.roblox.com/docs/reference/engine/enums/ParticleEmitterShapeInOut) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
