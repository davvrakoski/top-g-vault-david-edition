---
title: "Fire"
description: "A preconfigured particle emitter with the visual aesthetic of fire."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Fire"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A preconfigured particle emitter with the visual aesthetic of fire.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

[[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] is one of several preconfigured particle-emitting classes, alongside [[30 Official Roblox Docs/API Reference/Classes/Smoke|Smoke]], [[30 Official Roblox Docs/API Reference/Classes/Sparkles|Sparkles]], and others. Like the others, it emits particles when parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] while [[30 Official Roblox Docs/API Reference/Classes/Fire#Enabled|Enabled]]. This object is useful to create a quick visual effect for fire, but for more detailed work it's recommended that you use a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] instead.

Particles emit from the center of the parent in an upward (**+Y**) direction, but a negative [[30 Official Roblox Docs/API Reference/Classes/Fire#Heat|Heat]] value may be used to emit particles downward (**-Y**). Using an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] as the parent instead of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] allows for the emission position/direction to be modified by changing the [[30 Official Roblox Docs/API Reference/Classes/Attachment#CFrame|Attachment.CFrame]] or related properties.

[[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] objects consist of two emitters, each affected in various ways by the [[30 Official Roblox Docs/API Reference/Classes/Fire#Size|Size]], [[30 Official Roblox Docs/API Reference/Classes/Fire#Heat|Heat]], [[30 Official Roblox Docs/API Reference/Classes/Fire#Color|Color]], and [[30 Official Roblox Docs/API Reference/Classes/Fire#SecondaryColor|SecondaryColor]] properties. Particles which emit from the smaller, secondary emitter have a significantly longer lifetime (and rise farther) than those emitted by the primary emitter.

When [[30 Official Roblox Docs/API Reference/Classes/Fire#Enabled|Enabled]] is off, existing particles continue to render until they expire. However, if the [[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] object's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] is set to `nil`, all existing particles immediately disappear, similar to the behavior of [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Clear|ParticleEmitter:Clear()]].

[[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] objects emit no light on their own. To help create a cohesive environment around a burning object, try adding a [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]] with an orange [[30 Official Roblox Docs/API Reference/Classes/Light#Color|Color]].

*Code samples for this API (`Lighting-Torches`, `Toggle-Fire-Effect`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Fire); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Fire#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the color of the primary (outer) flame particles. |
| [[30 Official Roblox Docs/API Reference/Classes/Fire#Enabled\|Enabled]] | boolean | Determines whether flame particles are emit. |
| [[30 Official Roblox Docs/API Reference/Classes/Fire#Heat\|Heat]] | float | Determines the velocity at which particles are emit. |
| [[30 Official Roblox Docs/API Reference/Classes/Fire#LocalTransparencyModifier\|LocalTransparencyModifier]] | float | A multiplier for the [[30 Official Roblox Docs/API Reference/Classes/Fire\|Fire]] object's transparency that is only visible to the local client. |
| [[30 Official Roblox Docs/API Reference/Classes/Fire#SecondaryColor\|SecondaryColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the color of the of the secondary (inner) flame particles. |
| [[30 Official Roblox Docs/API Reference/Classes/Fire#Size\|Size]] | float | Determines the size of the flame particles. |
| [[30 Official Roblox Docs/API Reference/Classes/Fire#Size\|size]] | float | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Fire#TimeScale\|TimeScale]] | float | Controls the speed of the particle effect. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property determines the color of the larger particles emitted by a [[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] object. It is essentially the color of the outer portion of the flame.

In general, the cooler flames are on the outside of a fire. Therefore, fire looks more realistic if the outer portions are red or orange-yellow. A fire that is bright all throughout doesn't look very realistic, so avoid setting this property to yellow or white.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property, much like [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Enabled|ParticleEmitter.Enabled]], determines whether flame particles are emitted. Any particles already emitted will continue to render until their lifetime expires.

Since all fire particles are destroyed when the [[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] object's [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] is set to `nil`, this property is useful in allowing existing particles the opportunity to expire before destroying the [[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] object altogether (see the code example below).

*Code samples for this member (`Fire-Enabled`) are published on the source page; their code is not part of the open-source repo.*

### Heat

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

This property determines how fast particles are emitted from the [[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] object. It is limited to the range of `-25` to `25` inclusive. Positive values are in the top (**+Y**) direction of the parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], while negative values are in the downward (**-Y**) direction. It also affects the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Acceleration|ParticleEmitter.Acceleration]] of the inner particles.

### LocalTransparencyModifier

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`

This property is a multiplier for the [[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] object's transparency that is only visible to the local client. It does not replicate from client to server and is useful for when the object should appear differently for a specific client.

### SecondaryColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property determines the color of the smaller particles emitted by a [[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] object. It is essentially the color of the inner portion of the flame.

Note that the inner particles use a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightEmission|ParticleEmitter.LightEmission]] of `1`, so darker colors will instead cause the particles to appear transparent, and black will stop rendering inner particles altogether.

### Size

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`

This property determines the size of the flame particles. It must be in the range of `2` to `30`. Unlike [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Size|ParticleEmitter.Size]], the actual size of the flames will not match 1:1 with the equivalent size in studs; it is somewhat smaller.

If you add a [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]] as a sibling to the [[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] object to generate light, try setting the light's [[30 Official Roblox Docs/API Reference/Classes/Light#Brightness|Brightness]] and [[30 Official Roblox Docs/API Reference/Classes/PointLight#Range|Range]] proportional to this property so that larger flames produce more light.

### size

> [!warning] Deprecated
> This property is a deprecated variant of `Class.Fire.Size` which should be
> used instead.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`, `Deprecated`

### TimeScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

A value between `0` and `1` than controls the speed of the particle effect. `1` runs at normal speed, `0.5` runs at half speed, and `0` freezes time.

---
*Source: [Fire](https://create.roblox.com/docs/reference/engine/classes/Fire) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
