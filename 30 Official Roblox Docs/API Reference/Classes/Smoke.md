---
title: "Smoke"
description: "A particle emitter with the visual aesthetic of smoke."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Smoke"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A particle emitter with the visual aesthetic of smoke.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Smoke is one of several particle-emitting classes. Like other particle emitters of its kind, Smoke objects emit particles when parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] (such as a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]]) or an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] within such a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. Compared to the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] class, Smoke lacks many different customization properties and special methods, such as [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime|ParticleEmitter.Lifetime]] or [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Emit|ParticleEmitter:Emit()]]. It is useful to create a quick special effect in a pinch; for more detailed work it is preferable to use a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] instead.

When [[30 Official Roblox Docs/API Reference/Classes/Smoke#Enabled|Smoke.Enabled]] is toggled off, particles emit by this object will continue to render until their lifetime expires. When a Smoke object's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] is set to `nil` (and/or [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]]ed), all particles will instantly disappear. If this effect is not desired, try hiding the parent object at a far away position, then removing the Smoke after a few seconds using [[30 Official Roblox Docs/API Reference/Classes/Debris|Debris]] to give the last particles a chance to expire. This object does not have a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Clear|ParticleEmitter:Clear()]] method, but it is possible to set the [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] to `nil` and back to the exact same object for the same effect.

Smoke particles are only emitted from the center of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] to which they are parented. Parenting a Smoke object to an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] instead allows customization of the particles' start position.

*Code samples for this API (`Add-Smoke-to-Fire`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Smoke); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Smoke#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the color of the smoke particles. |
| [[30 Official Roblox Docs/API Reference/Classes/Smoke#Enabled\|Enabled]] | boolean | Determines whether smoke particles emit. |
| [[30 Official Roblox Docs/API Reference/Classes/Smoke#Opacity\|Opacity]] | float | Determines how opaque smoke particles render. |
| [[30 Official Roblox Docs/API Reference/Classes/Smoke#RiseVelocity\|RiseVelocity]] | float | Determines the velocity of the smoke particles. |
| [[30 Official Roblox Docs/API Reference/Classes/Smoke#Size\|Size]] | float | Determines the size of newly emit smoke particles. |
| [[30 Official Roblox Docs/API Reference/Classes/Smoke#TimeScale\|TimeScale]] | float | Value between 0-1 that controls the speed of the particle effect. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

The Color property determines the color of all the particles emit by a [[30 Official Roblox Docs/API Reference/Classes/Smoke|Smoke]] object (both existing and future particles). It behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Color|ParticleEmitter.Color]], except that it is only one color and not a [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]]. A color of white with some [[30 Official Roblox Docs/API Reference/Classes/Smoke#Opacity|Smoke.Opacity]] makes for a nice fog effect, and a very opaque black color can compliment a [[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] object nicely.

*Code samples for this member (`Add-Smoke-to-Fire`) are published on the source page; their code is not part of the open-source repo.*

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

The Enabled property, much like [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Enabled|ParticleEmitter.Enabled]], determines whether smoke particles are emitted. Any particles already emit will continue to render until their lifetime expires. This property is useful for keeping pre-made smoke effects off until they are needed later. Since smoke particles are destroyed when the [[30 Official Roblox Docs/API Reference/Classes/Smoke|Smoke]] object's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] is set to `nil`, this property is useful in allowing existing particles the opportunity to expire before destroying the Fire object altogether. See the function below.

*Code samples for this member (`Add-Smoke-to-Fire`, `Smoke-Enabled`) are published on the source page; their code is not part of the open-source repo.*

### Opacity

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

Opacity determines the opaqueness of the smoke particles. It must be in the range [0, 1]. This property works **inversely** in comparison to a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|BasePart.Transparency]] or ParticleEmitter's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Transparency|ParticleEmitter.Transparency]]: a value of 0 is completely invisible, 1 is completely visible.

The texture that Roblox uses for [[30 Official Roblox Docs/API Reference/Classes/Smoke|Smoke]] particles is partially transparent, so setting this property to 1 still yields transparency in rendered smoke.

*Code samples for this member (`Add-Smoke-to-Fire`) are published on the source page; their code is not part of the open-source repo.*

### RiseVelocity

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

RiseVelocity behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Speed|ParticleEmitter.Speed]] and [[30 Official Roblox Docs/API Reference/Classes/Fire#Heat|Fire.Heat]]: it determines how fast the smoke particles move during their lifetime. It must be in the range [-25, 25]. Negative values will cause particles to emit in the bottom (-Y) direction of the parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

When using a [[30 Official Roblox Docs/API Reference/Classes/Smoke|Smoke]] effect to create fog, set this property to 0. For large smoke effects, make the rise subtle (2 to 8). For chimneys and smokestacks, higher values are appropriate.

*Code samples for this member (`Add-Smoke-to-Fire`) are published on the source page; their code is not part of the open-source repo.*

### Size

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

The Size property of [[30 Official Roblox Docs/API Reference/Classes/Smoke|Smoke]] determines the size of the newly emit smoke particles. Unlike [[30 Official Roblox Docs/API Reference/Classes/Smoke#Color|Smoke.Color]], this property will not change the size of existing particles. It must be in the range [0.1, 100]. Unlike [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Size|ParticleEmitter.Size]], this property is only a number (not a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]]). Also note also that the size of the particles is not 1-to-1 with studs; in fact, the size of the smoke particle is more than twice as large. At the largest size, smoke particles can render larger than 200 studs wide!

*Code samples for this member (`Add-Smoke-to-Fire`) are published on the source page; their code is not part of the open-source repo.*

### TimeScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

A value between 0-1 than controls the speed of the particle effect. At 1 it runs at normal speed, at 0.5 it runs at half speed, and at 0 it freezes time.

---
*Source: [Smoke](https://create.roblox.com/docs/reference/engine/classes/Smoke) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
