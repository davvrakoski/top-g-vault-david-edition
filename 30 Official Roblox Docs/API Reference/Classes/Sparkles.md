---
title: "Sparkles"
description: "A particle emitter with the visual aesthetic of sparkles."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Sparkles"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A particle emitter with the visual aesthetic of sparkles.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

Sparkles is one of several particle-emitting classes. Like other particle emitters of its kind, Sparkles objects emit particles when parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] (such as a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]]) or an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] within such a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. Compared to the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] class, Sparkles lacks many different customization properties and special methods, such as [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime|ParticleEmitter.Lifetime]] or [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Emit|ParticleEmitter:Emit()]]. It is useful to create a quick special effect in a pinch; for more detailed work it is preferable to use a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] instead.

When [[30 Official Roblox Docs/API Reference/Classes/Sparkles#Enabled|Sparkles.Enabled]] is toggled off, particles emit by this object will continue to render until their lifetime expires. When a Sparkles object's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] is set to `nil` (and/or [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]]ed), all particles will instantly disappear. If this effect is not desired, try hiding the parent object at a far away position, then removing the Sparkles after a few seconds using [[30 Official Roblox Docs/API Reference/Classes/Debris|Debris]] to give the last particles a chance to expire. This object does not have a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Clear|ParticleEmitter:Clear()]] method, but it is possible to set the [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] to `nil` and back to the exact same object for the same effect.

Sparkles particles are only emitted from the center of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] to which they are parented. Parenting a Sparkles object to an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] instead allows customization of the particles' start position.

*Code samples for this API (`Give-Sparkles`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Sparkles); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Sparkles#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | **Deprecated.** Determines the color of the sparkle particles. |
| [[30 Official Roblox Docs/API Reference/Classes/Sparkles#Enabled\|Enabled]] | boolean | Determines whether sparkles are emit. |
| [[30 Official Roblox Docs/API Reference/Classes/Sparkles#SparkleColor\|SparkleColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the color of the sparkle particles. |
| [[30 Official Roblox Docs/API Reference/Classes/Sparkles#TimeScale\|TimeScale]] | float | Controls the speed of the sparkle effect. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Color

> [!warning] Deprecated
> This property is deprecated in favor of `Class.Sparkles.SparkleColor`,
> which does the exact same thing.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`

The Color property determines the color of all the particles emit by a [[30 Official Roblox Docs/API Reference/Classes/Sparkles|Sparkles]] object (both existing and future particles). It behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Color|ParticleEmitter.Color]], except that it is only one color and not a [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]]. Sparkles have a natural color sequence applied which is most apparent when this property is set to white; sparkles very faintly animate between a subtle green and red.

It should be noted that sparkles have a partial [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightEmission|ParticleEmitter.LightEmission]] effect, so dark colors tend to render more transparent and white colors look very bright.

*Code samples for this member (`Give-Sparkles`) are published on the source page; their code is not part of the open-source repo.*

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

The Enabled property, much like [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Enabled|ParticleEmitter.Enabled]], determines whether sparkle particles are emit. Any particles already emit will continue to render until their lifetime expires. This property is useful for keeping pre-made sparkle effects off until they are needed later. Since sparkle particles are destroyed when the `Sparkle` object's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] is set to `nil`, this property is useful in allowing existing particles the opportunity to expire before destroying the Fire object altogether. See the function below.

*Code samples for this member (`Give-Sparkles`, `Sparkles-Enabled`) are published on the source page; their code is not part of the open-source repo.*

### SparkleColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property functions identically to [[30 Official Roblox Docs/API Reference/Classes/Sparkles#Color|Sparkles.Color]].

The SparkleColor property determines the color of all the particles emit by a [[30 Official Roblox Docs/API Reference/Classes/Sparkles|Sparkles]] object (both existing and future particles). It behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Color|ParticleEmitter.Color]], except that it is only one color and not a [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]]. Sparkles have a natural color sequence applied which is most apparent when this property is set to white; sparkles very faintly animate between a subtle green and red.

It should be noted that sparkles have a partial [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightEmission|ParticleEmitter.LightEmission]] effect, so dark colors tend to render more transparent and white colors look very bright.

*Code samples for this member (`Give-Sparkles`) are published on the source page; their code is not part of the open-source repo.*

### TimeScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

A value from 0 to 1 that controls the speed of the sparkle effect. A value of 1 runs the effect at normal speed, 0.5 runs it at half speed, and 0 freezes the effect.

---
*Source: [Sparkles](https://create.roblox.com/docs/reference/engine/classes/Sparkles) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
