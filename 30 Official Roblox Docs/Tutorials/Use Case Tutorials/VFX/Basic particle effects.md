---
title: "Basic particle effects"
description: "The process of creating particles to elevate the visual effects in your game."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/use-case-tutorials/vfx/basic-particle-effects"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The process of creating particles to elevate the visual effects in your game.*

**Particles** are used to create a wide range of effects in games, from smoke and fire to splashing water. They can help bring your game to life and can provide valuable visual feedback for your players.

In this tutorial, you will use a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] object to create a sparkling effect around a part.

[Video: basicParticleFinished.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/basic-particle-effects/basicParticleFinished.mp4)

## Particle emitters

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] is a special type of object that will **emit** particles from its position when parented to a part or [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]].

The particles themselves are **2D images** that always face the camera. Particles move or change color according to the emitter's properties. By changing just a few of these, you can make an incredible array of different effects.

The example provided below is a model of a gold nugget. A simple particle effect will be used to make it sparkle.

1. Create a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] and name it **GoldNugget**.
2. Set the **MeshId** property to `rbxassetid://2903918852`.
3. Set the **Material** property to **Neon** and the **Color** property to `255, 180, 0`.

   *(image in the full Top G Vault)*

4. Insert a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] object into the part.

   *(image in the full Top G Vault)*

   Once you add the emitter, white stars will immediately start emitting from the part. The star is the default particle image.

   *(image in the full Top G Vault)*

> [!info]
> The pre-made [[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] and [[30 Official Roblox Docs/API Reference/Classes/Smoke|Smoke]] objects can be a convenient way to save time on creating effects, but they are far less customizable than ParticleEmitters.

## Particle emission

Particles are generated randomly throughout the entire volume of a part. They emerge from one **face** of the part according to the **EmissionDirection** property. It defaults to **Top**, meaning the top surface of a part. If you rotate the part, the direction the particles are emitted from will change accordingly.

[Video: rotatingParticleEffect.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/basic-particle-effects/rotatingParticleEffect.mp4)

If you resize the part to be bigger, the particles will be emitted over a wider area.

[Video: scalingParticleEffect.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/basic-particle-effects/scalingParticleEffect.mp4)

## Particle properties

### Color

The first thing to change is the emitter color — **gold** would be a much more appropriate color for a sparkle effect.

Change the **Color** property to **255, 200, 50**.

*(image in the full Top G Vault)*
*(image in the full Top G Vault)*

### Lifetime

By default, the particles last for 5 to 10 seconds, which is too long for sparkles. You can change this using the **Lifetime** property.

Lifetime can have either a single value or a **Min** and a **Max** value, with particles lasting for a random amount of time in seconds between the two values.

Change the **Lifetime** property of the emitter to **0.5, 1** to shorten the duration of the particles.

*(image in the full Top G Vault)*
*(image in the full Top G Vault)*

### Rate

The **Rate** property specifies how many particles are emitted per second. The default value is 20 which is fairly high for a sparkle effect. Change the **Rate** property of the emitter to **7**.

*(image in the full Top G Vault)*
*(image in the full Top G Vault)*

### Speed

The **Speed** property determines how fast a particle will travel in studs per second. It can be either a single value or a range of values.

A sparkle effect should be nice and slow — a range of 2 to 3 seconds works nicely. Change the **Speed** property to **2, 3**.

*(image in the full Top G Vault)*

### SpreadAngle

The particles are currently emitting straight up from the part. To get an even spread of particles in all directions, change the **SpreadAngle** property.

SpreadAngle has an **X** and a **Y** value which determine the range of angles that a particle can be emitted. This is calculated from both sides around the axes. A value of **180, 0** would emit particles in a flat circle across the X-axis; a value of **180, 180** would emit particles in every direction around the part. Change the **SpreadAngle** property of the emitter to **180, 180**.

*(image in the full Top G Vault)*
*(image in the full Top G Vault)*

### Additional properties

To further improve the sparkle effect, try the following property values.

| Property | Value |
| --- | --- |
| Size | 0.3 |
| LightEmission | 1 |
| Transparency | 0.5 |
| Drag | 1.5 |

[Video: basicParticleNoLight.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/basic-particle-effects/basicParticleNoLight.mp4)

With that, your sparkling part is complete. You can try complementing the sparkling effect with a gentle glow by adding a [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]] to the part, as shown at the start of the course — check out the [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Lighting/Light with props|Lighting with Props]] course to learn more about light objects.

---
*Source: [Basic particle effects](https://create.roblox.com/docs/tutorials/use-case-tutorials/vfx/basic-particle-effects) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
