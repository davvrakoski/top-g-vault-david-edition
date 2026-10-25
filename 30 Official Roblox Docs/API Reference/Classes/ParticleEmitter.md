---
title: "ParticleEmitter"
description: "A special object that emits customizable 2D particles into the world."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A special object that emits customizable 2D particles into the world.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A **ParticleEmitter** is a special object that emits customizable 2D particles into the world. To emit and render particles, it must be parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] or an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] within such a part. When parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], particles spawn randomly within the part's bounding box or [[30 Official Roblox Docs/Effects/Particle emitters#Shape|shape]]; when parented to an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], particles spawn from the attachment's position.

Particles emit automatically when the emitter is [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Enabled|Enabled]] with a non-zero [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Rate|Rate]], or manually when the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Emit|Emit]] method is called. With a non-zero [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Speed|Speed]], particles are set in motion outwards and/or inwards, depending on the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapeInOut|ShapeInOut]] property.

By default, particles face the camera, but the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Orientation|Orientation]] can be modified to respect the particle velocity instead.

During the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime|Lifetime]] of the particles, they can change appearance according to the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Size|Size]]. Their motion can change over time according to the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Drag|Drag]] and [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Acceleration|Acceleration]] properties, and they can also move as their parent moves when they are [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LockedToPart|LockedToPart]] or have a non-zero [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#VelocityInheritance|VelocityInheritance]].

To learn more about creating and customizing particle emitters, see [[30 Official Roblox Docs/Effects/Particle emitters|Particle Emitters]].

*Code samples for this API (`Creating-A-ParticleEmitter-from-Scratch`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Acceleration\|Acceleration]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Determines the global-axis acceleration of all active particles, measured in studs per second squared. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Brightness\|Brightness]] | float | Scales the light emitted from the emitter when [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightInfluence\|ParticleEmitter.LightInfluence]] is 0. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence\|ColorSequence]] | Determines the color of all active particles over their individual lifetimes. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Drag\|Drag]] | float | Determines the rate at which particles will lose half their speed through exponential decay. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#EmissionDirection\|EmissionDirection]] | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|NormalId]] | Determines the face of the object that particles emit from. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Enabled\|Enabled]] | boolean | Determines if particles emit from the emitter. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookBlendFrames\|FlipbookBlendFrames]] | boolean | Determines whether the flipbook frames are blended between. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookFramerate\|FlipbookFramerate]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] | Determines how fast the flipbook texture animates in frames per second. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookIncompatible\|FlipbookIncompatible]] | string | The error message to display if the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Texture\|Texture]] is incompatible for a flipbook. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookLayout\|FlipbookLayout]] | [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookLayout\|ParticleFlipbookLayout]] | Determines the layout of the flipbook texture. Must be None, Grid2x2, Grid4x4, Grid8x8 or Custom. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookMode\|FlipbookMode]] | [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookMode\|ParticleFlipbookMode]] | Determines the type of the flipbook animation. Must be Loop, OneShot, PingPong, or Random. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookSizeX\|FlipbookSizeX]] | int | Defines the number of horizontal frames in a custom flipbook layout. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookSizeY\|FlipbookSizeY]] | int | Defines the number of vertical frames in a custom flipbook layout. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookStartRandom\|FlipbookStartRandom]] | boolean | Determines whether the animation starts at a random frame chosen per particle instead of always starting at frame zero. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime\|Lifetime]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] | Defines a random range of ages for newly emitted particles. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightEmission\|LightEmission]] | float | Determines how much particles' colors are blended with the colors behind them. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightInfluence\|LightInfluence]] | float | Determines how much particles are influenced by the environmental light. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LocalTransparencyModifier\|LocalTransparencyModifier]] | float | Determines a multiplier for [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Transparency\|ParticleEmitter.Transparency]] that is only visible to the local client. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LockedToPart\|LockedToPart]] | boolean | Determines whether the particles rigidly move with the part they're being emitted from. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Orientation\|Orientation]] | [[30 Official Roblox Docs/API Reference/Enums/ParticleOrientation\|ParticleOrientation]] | Specifies how to orient particles. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Rate\|Rate]] | float | Determines the number of particles emitted per second. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Rotation\|Rotation]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] | Determines the range of rotations in degrees for newly emitted particles. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#RotSpeed\|RotSpeed]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] | Determines the range of angular speeds of emitted particles, measured in degrees per second. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Shape\|Shape]] | [[30 Official Roblox Docs/API Reference/Enums/ParticleEmitterShape\|ParticleEmitterShape]] | Sets the shape of the emitter to either a box, sphere, cylinder, or disc. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapeInOut\|ShapeInOut]] | [[30 Official Roblox Docs/API Reference/Enums/ParticleEmitterShapeInOut\|ParticleEmitterShapeInOut]] | Sets whether particles emit outward only, inward only, or in both directions. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapePartial\|ShapePartial]] | float | Influences particle emission from cylinder, disc, sphere, and box shapes. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapeStyle\|ShapeStyle]] | [[30 Official Roblox Docs/API Reference/Enums/ParticleEmitterShapeStyle\|ParticleEmitterShapeStyle]] | Sets particle emission to either volumetric or surface-only emission. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Size\|Size]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence\|NumberSequence]] | Determines the world size over individual particles' lifetimes. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Speed\|Speed]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] | Determines a random range of velocities (minimum to maximum) at which new particles will emit, measured in studs per second. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#SpreadAngle\|SpreadAngle]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Determines the angles at which particles may be randomly emit, measured in degrees. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Squash\|Squash]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence\|NumberSequence]] | Allows for non-uniform scaling of particles, curve-controlled over their lifetime. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Texture\|Texture]] | ContentId | Determines the image rendered on particles. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#TextureContent\|TextureContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The image rendered on particles. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md). |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#TimeScale\|TimeScale]] | float | Value between 0 and 1 that controls the speed of the particle effect. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Transparency\|Transparency]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence\|NumberSequence]] | Determines the transparency of particles over their individual lifetimes. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#VelocityInheritance\|VelocityInheritance]] | float | Determines how much of the parent's velocity is inherited by particles when emitted. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#VelocitySpread\|VelocitySpread]] | float | **Deprecated.** Determines how offset a particle can be fired from the local emitter direction of its parent. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#WindAffectsDrag\|WindAffectsDrag]] | boolean | Whether emitted particles follow the [[30 Official Roblox Docs/API Reference/Classes/Workspace#GlobalWind\|Workspace.GlobalWind]] vector. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ZOffset\|ZOffset]] | float | Determines the forward-backward render position of particles; used to control what particles render on top/bottom. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Clear\|Clear()]] | () | Clears all particles that have been emitted. |
| [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Emit\|Emit()]] | () | Emits a given number of particles. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Acceleration

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Motion · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Acceleration** property determines how the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Speed|Speed]] of particles changes over their lifetime. It is defined using a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] to determine the acceleration on the global **X**/**Y**/**Z** axes and is measured in studs per second squared. When changed, this property affects all particles emitted by the emitter, both current and future.

Acceleration will slow particles down if the vector points in the opposite [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#EmissionDirection|EmissionDirection]] in which they are emitted. Otherwise, it will speed them up.

### Brightness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Scales the light emitted from the emitter when [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightInfluence|ParticleEmitter.LightInfluence]] is 0.

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Color** property determines the color of all active particles over their individual lifetimes. The color applies to the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Texture|Texture]] when rendering and it uses the texture alpha along with the emitter's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Transparency|Transparency]]. If an emitter has a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightEmission|LightEmission]] value that's greater than 0, darker colors make particles appear more transparent.

Changing this property affects all particles emitted by the emitter, both current and future.

When this property uses a gradient [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]], a particle's present color is determined by linearly interpolating on the sequence using the particle's age and its total lifetime. For example, if a particle spawned 2 seconds ago and has a 4 second lifetime, the color will be whatever is 50% of the way through the [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]].

### Drag

**Type:** float

**Thread safety:** ReadSafe · **Category:** Particles · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Drag** property determines the rate in seconds at which individual particles will lose half their speed via exponential decay. Drag is applied by scaling the expected velocity from [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Speed|Speed]] and any velocity inherited from the parent from [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#VelocityInheritance|VelocityInheritance]]. Setting this property to a negative value will cause particles' velocities to grow exponentially.

### EmissionDirection

**Type:** [[30 Official Roblox Docs/API Reference/Enums/NormalId|NormalId]]

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **EmissionDirection** property determines the face ([[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId]]) of the parent object that particles emit from. A negative [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Speed|Speed]] means particles emit in the opposite direction. [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#SpreadAngle|SpreadAngle]] further varies the emission direction.

If you add a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] to an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], which has a direction, you can rotate the attachment itself ([[30 Official Roblox Docs/API Reference/Classes/Attachment#Orientation|Attachment.Orientation]]) instead of using this property.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Enabled** property determines if particles emit from the emitter. Setting this to `false` stops further particles from spawning, but any existing particles remain active until they expire. This property is useful when you have a pre-made particle effect that you want to remain disabled until you need it to emit particles.

If you want to clear all particles from a disabled emitter, call [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Clear|Clear()]]. Then, if desired, call [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Emit|Emit()]] on the emitter to emit and render particles.

### FlipbookBlendFrames

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Flipbook · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **FlipbookBlendFrames** property determines whether the frames in the flipbook texture are blended between using a linear crossfade, or swapped instantly.

### FlipbookFramerate

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]]

**Thread safety:** ReadSafe · **Category:** Flipbook · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **FlipbookFramerate** property determines how fast the flipbook texture animates in frames per second. Like [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime|Lifetime]], you can set a minimum and maximum range to randomize the framerate of the flipbook, with a maximum of 30 frames per second.

### FlipbookIncompatible

**Type:** string

**Thread safety:** ReadSafe · **Category:** Flipbook · **Loaded/Saved:** true/true · **Capabilities:** Basic

The error message to display if the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Texture|Texture]] is incompatible for a flipbook. The flipbook texture size must be an exact multiple of the flipbook layout size.

### FlipbookLayout

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookLayout|ParticleFlipbookLayout]]

**Thread safety:** ReadSafe · **Category:** Flipbook · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **FlipbookLayout** property determines the layout of the texture. It can be any value of the [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookLayout|Enum.ParticleFlipbookLayout]] enum:

- **None** – Disable flipbook features and use the texture as a single static texture over the particle's lifetime.
- **Grid2x2** – 2×2 frames for a 4-frame animation.
- **Grid4x4** – 4×4 frames for a 16-frame animation.
- **Grid8x8** – 8×8 frames for a 64-frame animation.
- **Custom** – A custom grid size defined by [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookSizeX|FlipbookSizeX]] and [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookSizeY|FlipbookSizeY]].

### FlipbookMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookMode|ParticleFlipbookMode]]

**Thread safety:** ReadSafe · **Category:** Flipbook · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **FlipbookMode** property determines the type of the flipbook animation. It can be any value of the [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookMode|Enum.ParticleFlipbookMode]] enum:

- **Loop** – Continuously play through all frames, starting back at the first frame after playing the last.
- **OneShot** – Play through the animation only once across the particle's lifetime. With this setting, the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookFramerate|FlipbookFramerate]] property doesn't apply; instead, the framerate is determined by the particle's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime|Lifetime]] divided evenly by the number of frames in the animation. **OneShot** animations are useful for clear non-repeating animations, such as an explosion that creates a puff of smoke and then fades out.
- **PingPong** – Play from the first to the last frame, then in reverse from the last to the first, repeating throughout the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime|Lifetime]] of the particle.
- **Random** – Play the frames in a random order, blending/crossfading from one frame to the next. This can be useful for organic particle textures at low framerates, such as stars slowly twinkling between subtly different shapes.

### FlipbookSizeX

**Type:** int

**Thread safety:** ReadSafe · **Category:** Flipbook · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **FlipbookSizeX** property defines the number of horizontal frames (columns) in a custom flipbook layout. This property only applies when [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookLayout|FlipbookLayout]] is set to [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookLayout|Custom]].

### FlipbookSizeY

**Type:** int

**Thread safety:** ReadSafe · **Category:** Flipbook · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **FlipbookSizeY** property defines the number of vertical frames (rows) in a custom flipbook layout. This property only applies when [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookLayout|FlipbookLayout]] is set to [[30 Official Roblox Docs/API Reference/Enums/ParticleFlipbookLayout|Custom]].

### FlipbookStartRandom

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Flipbook · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **FlipbookStartRandom** property determines whether each particle begins at a random frame of the animation instead of always starting at the first frame. One use case is to enable this property and also set [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#FlipbookFramerate|FlipbookFramerate]] to zero, causing each emitted particle to be a static frame chosen randomly from the flipbook texture.

### Lifetime

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]]

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Lifetime** property defines the maximum and minimum ages for newly emitted particles. Lifetimes are stored on a per-particle basis, so if this value is changed, existing particles will stay active until their randomly chosen lifetime ends. A lifetime of 0 will prevent particles from emitting at all.

### LightEmission

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **LightEmission** property determines the blending of the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Texture|Texture]] colors with the colors behind them. A value of 0 uses normal blending mode while a value of 1 uses additive blending. When changed, this property instantly affects all particles owned by the emitter, both current and future.

This property should not be confused with [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightInfluence|LightInfluence]] which determines how particles are affected by environmental light.

This property does **not** cause particles to light the environment around them. To accomplish that, consider using a [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]].

### LightInfluence

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **LightInfluence** property determines how much environmental light affects the color of individual particles when they render. It must be in the range of 0–1; behavior of values outside of this range are not defined. At 0, particles are not influenced by light at all (they retain full brightness); at 1, particles are fully influenced by light (in complete darkness, particles will be black).

By default, this value is 1 if inserted with Studio tools. If inserted using [[30 Official Roblox Docs/API Reference/Datatypes/Instance#new|Instance.new()]], it is 0.

### LocalTransparencyModifier

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`

The `LocalTransparencyModifier` property is a multiplier applied to the particle emitter's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Transparency|Transparency]] that is only visible to the local client. It does not replicate from client to server and is useful for when particles should not render for a specific client.

Uses the same formula as [[30 Official Roblox Docs/API Reference/Classes/BasePart#LocalTransparencyModifier|BasePart.LocalTransparencyModifier]]:

`1` - ((`1` - [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Transparency|Transparency]]) × (`1` - `LocalTransparencyModifier`))

A value of `0` (default) has no effect on the particle transparency. A value of `1` makes all particles completely invisible to the local client regardless of their [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Transparency|Transparency]] value.

### LockedToPart

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Particles · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **LockedToPart** property determines if particles "stick" to the emission source (the [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] or [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] to which the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] is parented). If `true`, active particles will move in lock step if the parent object moves.

Alternatively, consider using the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#VelocityInheritance|VelocityInheritance]] property with a value of 1 which may be more appropriate for some effects.

### Orientation

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ParticleOrientation|ParticleOrientation]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Orientation** property determines which orientation mode to use for an emitter's particle geometry.

| Orientation | Particle Behavior |
| --- | --- |
| **FacingCamera** | Standard camera-facing billboard quad; default behavior. |
| **FacingCameraWorldUp** | Facing the camera, but rotating only on the vertical upward world **Y** axis. |
| **VelocityParallel** | Aligned parallel to their direction of movement. |
| **VelocityPerpendicular** | Aligned perpendicular to their direction movement. |

### Rate

**Type:** float

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Rate** property determines how many particles are emitted per second while the emitter is [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Enabled|Enabled]]. It is the inverse of frequency, meaning that a rate of 5 emits a particle every 0.2 seconds. When changed, this property has no affect on any active particles.

### Rotation

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]]

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Rotation** property determines the range of rotations in degrees for newly emitted particles, measured in degrees. Positive values are in the clockwise direction. This property is commonly set to `[0, 360]` to provide a completely random rotation to new particles. [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#RotSpeed|RotSpeed]] also influences the rotation of a particle over its lifetime.

Changes to this value only affect new particles; existing particles maintain the rotation at which they were originally emitted.

### RotSpeed

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]]

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **RotSpeed** property determines a random range of angular speeds for newly emitted particles, measured in degrees per second. A random angular speed is chosen upon emission, so changing this property doesn't affect active particles. This property, along with [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Rotation|Rotation]], affects the angle of the rendered particle image.

Particles with very high angular speeds can appear to rotate slower or not at all, since the angle of rotation is synchronized with the software render speed. For example, if particles rotate at exactly 360 degrees every frame, there will be no apparent change in rotation.

### Shape

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ParticleEmitterShape|ParticleEmitterShape]]

**Thread safety:** ReadSafe · **Category:** EmitterShape · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Shape** property sets the shape of the emitter to either a box, sphere, cylinder, or disc. After you make a selection, you can adjust the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapeStyle|ShapeStyle]], [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapeInOut|ShapeInOut]], and [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#ShapePartial|ShapePartial]] properties to further customize particle emission. For visual examples, see [[30 Official Roblox Docs/Effects/Particle emitters#Shape|here]].

### ShapeInOut

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ParticleEmitterShapeInOut|ParticleEmitterShapeInOut]]

**Thread safety:** ReadSafe · **Category:** EmitterShape · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets whether particles emit outward only, inward only, or in both directions. For visual examples, see [[30 Official Roblox Docs/Effects/Particle emitters#Shape|here]].

### ShapePartial

**Type:** float

**Thread safety:** ReadSafe · **Category:** EmitterShape · **Loaded/Saved:** true/true · **Capabilities:** Basic

Depending on the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Shape|Shape]] value, this property performs a different action:

- For cylinders, it specifies the top radius proportion. A value of 0 means the top of the cylinder has zero radius, making it a cone. A value of 1 means the cylinder has no deformation.

- For discs, it specifies the inner radius proportion. A value of 0 means the disc is fully closed (circle/ellipse), while a value of 1 means emission only occurs on the outermost rim of the disc. Values between 0 and 1 emit from an annulus with a certain thickness.

- For spheres, it specifies the hemispherical angle over which particles emit. A value of 1 means particles emit from the entire sphere; a value of 0.5 means particles emit from a half-dome; a value of 0 means particles only emit from a single point at the north pole.

For visual examples, see [[30 Official Roblox Docs/Effects/Particle emitters#Shape|here]].

### ShapeStyle

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ParticleEmitterShapeStyle|ParticleEmitterShapeStyle]]

**Thread safety:** ReadSafe · **Category:** EmitterShape · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets particle emission to either volumetric or surface-only emission. For visual examples, see [[30 Official Roblox Docs/Effects/Particle emitters#Shape|here]].

### Size

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Size** property determines the world size of all active particles over their individual lifetimes. This property represents the dimensions of the square [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Texture|Texture]] for each particle. It is a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] that works similarly to [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Transparency|Transparency]].

A particle's present size is determined by linearly interpolating on this sequence using the particle's age and its total lifetime. For example, if a particle spawned 2 seconds ago and has a 4 second lifetime, the size will be whatever is 50% of the way through the [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]]. For any [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint|NumberSequenceKeypoint]] with a non-zero envelope value, a random value in the envelope range is chosen for each keypoint for each particle when it emits.

### Speed

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange|NumberRange]]

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Speed** property determines a random range of velocities (minimum to maximum) at which new particles will emit, measured in studs per second. Each particle's velocity is chosen upon emission and it applies in the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#EmissionDirection|EmissionDirection]]. Negative values cause particles to travel in reverse.

Note that changing [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Speed|Speed]] does not affect active particles and they retain whatever speed they already have. However, [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Acceleration|Acceleration]], [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Drag|Drag]], and [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#VelocityInheritance|VelocityInheritance]] can be used to affect the speed of active particles over their lifetime.

### SpreadAngle

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **SpreadAngle** property determines the random angles at which a particle may be emitted. For example, if the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#EmissionDirection|EmissionDirection]] is **Top** (+**Y**), this [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] describes the size of the random angle spread on the **X**/**Z** axes, in degrees.

Setting one axis to 360 will cause particles to emit in all direction in a **circle**. Setting both to 360 will cause particles to emit in all directions in a **sphere**.

### Squash

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Allows for non-uniform scaling of particles, curve-controlled over their lifetime. Values greater than 0 cause particles to both shrink horizontally and grow vertically, while values less than 0 cause particles to both grow horizontally and shrink vertically.

### Texture

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Texture** property determines the image rendered on particles. This image is influenced by [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Color|Color]], [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Transparency|Transparency]], [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightInfluence|LightInfluence]], and [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightEmission|LightEmission]]. Textures with transparent backgrounds work best for particles.

### TextureContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The image rendered on particles. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md).

This property is the [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] equivalent of [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Texture|Texture]]. Assigning `TextureContent` updates `Texture`. The appearance of the texture is influenced by [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Color|Color]], [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Transparency|Transparency]], [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightInfluence|LightInfluence]], and [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightEmission|LightEmission]].

### TimeScale

**Type:** float

**Thread safety:** ReadSafe · **Category:** Particles · **Loaded/Saved:** true/true · **Capabilities:** Basic

A value between 0 and 1 that controls the speed of the particle effect. At 1, it runs at normal speed; at 0.5 it runs at half speed; at 0 it freezes in time.

### Transparency

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Transparency** property determines the transparency of all active particles over their individual lifetimes. It works similar to [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Size|Size]] in how it affects particles over time. In terms of rendering, a value of 0 is completely visible (opaque) and a value of 1 is completely invisible (not rendered at all).

A particle's present transparency is determined by linearly interpolating on this sequence using the particle's age and its total lifetime. For example, if a particle spawned 2 seconds ago and has a 4 second lifetime, the transparency will be whatever is 50% of the way through the [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]]. For any [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint|NumberSequenceKeypoint]] with a non-zero envelope value, a random value in the envelope range is chosen for each keypoint for each particle when it emits.

### VelocityInheritance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Particles · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **VelocityInheritance** property determines how much of the parent part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Velocity|Velocity]] is inherited by particles when they are emitted. A value of 0 means that no velocity is inherited, while a value of 1 means the particle will have the exact same speed as the parent [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

When used in conjunction with [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Drag|Drag]], a particle emitter can appear to "shed" particles from a moving part.

### VelocitySpread

> [!warning] Deprecated
> This property has been superseded by `Class.ParticleEmitter.SpreadAngle`
> which should be used in all new work.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `NotReplicated`, `Deprecated`

This property determines how offset a particle can be fired from the local emitter direction of its parent. When a particle is created its offset is picked randomly between 0 and VelocitySpread. This value is measured in degrees.

### WindAffectsDrag

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Particles · **Loaded/Saved:** true/true · **Capabilities:** Basic

If true, emitted particles follow the [[30 Official Roblox Docs/API Reference/Classes/Workspace#GlobalWind|Workspace.GlobalWind]] vector. Only applies if the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Drag|Drag]] property is greater than 0.

### ZOffset

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **ZOffset** property determines the forward-backward render position of particles, in studs, without changing their size on the screen. When changed, this property affects both current and future particles. Note that this property accepts fractional values; it is not like [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex|GuiObject.ZIndex]] (an integer).

Positive values move particles closer to the camera and negative values move particles away. Sufficiently negative values can cause particles to render inside or behind the parent part.

## Methods

### Clear

```lua
ParticleEmitter:Clear(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

The **Clear** method instantly clears all existing particles that have been emitted by the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] through its natural emission (non-zero [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Rate|Rate]] on an [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Enabled|Enabled]] emitter) or via [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Emit|Emit()]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ParticleEmitter-Burst`) are published on the source page; their code is not part of the open-source repo.*

### Emit

```lua
ParticleEmitter:Emit(particleCount: int = 16): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

The **Emit** method will cause the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] to instantly emit the given number of particles.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `particleCount` | int | `16` | The number of particles to emit. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Emit-Particles-Over-Distance`, `ParticleEmitter-Burst`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [ParticleEmitter](https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
