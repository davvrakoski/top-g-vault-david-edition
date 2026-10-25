---
title: "Create explosions with VFX"
description: "The process for creating a trap that emits a burst of particles when it kills a player."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/use-case-tutorials/vfx/use-particles-for-explosions"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The process for creating a trap that emits a burst of particles when it kills a player.*

Previously, you worked with particles that played continuously, like [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/VFX/Custom particle effects|smoke from a volcano]]. Particles can also be used in a single burst, such as explosions. This tutorial will show you how to create a trap that emits a burst of particles and kills a player.

[Video: burstParticle_finalInContext.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/using-particles-for-explosions/burstParticle_finalInContext.mp4)

## Emitter setup

The explosion will use a ParticleEmitter with some changed properties that will create a burst.

1. Design a dangerous looking trap. Then, insert a **ParticleEmitter** named **Explosion** into the part.

   *(image in the full Top G Vault)*
   *(image in the full Top G Vault)*

2. Create an electric spark effect using these properties.

   | Property | Value | Description |
   | --- | --- | --- |
   | **Texture** | rbxassetid://6101261905 | Electric spark texture. |
   | **Drag** | 10 | How fast particles lose speed. |
   | **Lifetime** | 0.2, 0.6 | Makes explosion particles exist for a short time. |
   | **Speed** | 20, 40 | Compensates for the short lifetime. |
   | **SpreadAngle** | 180, 180 | Fires particles in all directions. |

3. So the trap doesn't emit particles constantly toggle **Enabled** to **off**.

   *(image in the full Top G Vault)*

## Test particle bursts

To test the particle burst, you can use a Studio plugin developed by Roblox.

1. Go to the Marketplace page for the [Emit() Plugin](https://www.roblox.com/library/303835976/ParticleEmitter-Emit-n) Plugin. On that page, click the **Install** button.

   *(image in the full Top G Vault)*

2. When Studio opens, the plugin should install automatically.

   *(image in the full Top G Vault)*

3. Select the **Explosion** emitter and notice the plugin UI that appears in the top left of the 3D viewport. In the number box, type **100** (the amount of particles to emit) and press <kbd>Enter</kbd>.

   *(image in the full Top G Vault)*

4. Press the **Emit** button to test the emitter.

[Video: burstParticle_testParticleEmit.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/using-particles-for-explosions/burstParticle_testParticleEmit.mp4)

## Color and transparency

Some extra steps can make the explosion look more impressive.

1. Open the sequence window for the emitter's **Color** by clicking the three dots next to the property. Then, create keypoints in the window to make a color gradient.

   *(image in the full Top G Vault)*

2. For **Transparency**, use a **number sequence** that increases transparency over a smooth curve to show a gradual fade out.

   *(image in the full Top G Vault)*

   A finished particle effect may look like below.

   *(image in the full Top G Vault)*

## Script setup

With the emitter complete, the explosion can now be played through a script. The script works by checking for players touching the trap. Whenever it detects someone, the particles will emit and the player will die.

1. In the trap part, add a new **Script** named **PlayExplosion**.

   *(image in the full Top G Vault)*

2. Set up variables to store the part and emitter. Then, include a variable named `EMIT_AMOUNT` that stores the number of particles emitted per explosion.

   ```lua
   local trapObject = script.Parent
   local particleEmitter = trapObject.Explosion

   local EMIT_AMOUNT = 100
   ```

3. Code an event to check if a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] touches the part. If so, set that humanoid's health to 0, forcing them to respawn.

   ```lua
   local trapObject = script.Parent
   local particleEmitter = trapObject.Explosion

   local EMIT_AMOUNT = 100

   local function killPlayer(otherPart)
   	local character = otherPart.Parent
   	local humanoid = character:FindFirstChildWhichIsA("Humanoid")

   	if humanoid then
   		humanoid.Health = 0
   	end
   end

   trapObject.Touched:Connect(killPlayer)
   ```

## Play the explosion

In scripts, particles are emitted using the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Emit|Emit()]] function. This creates a one-time burst of a number of particles.

1. Call the `Emit()` function and pass in `EMIT_AMOUNT`, the variable created earlier.

   ```lua
   local trapObject = script.Parent
   local particleEmitter = trapObject.Explosion

   local EMIT_AMOUNT = 100

   local function killPlayer(otherPart)
   	local character = otherPart.Parent
   	local humanoid = character:FindFirstChildWhichIsA("Humanoid")

   	if humanoid then
   		humanoid.Health = 0
   		particleEmitter:Emit(EMIT_AMOUNT)
   	end
   end

   trapObject.Touched:Connect(killPlayer)
   ```

2. Test the script by walking into the trap.

[Video: burstParticle_genericFinal.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/using-particles-for-explosions/burstParticle_genericFinal.mp4)

With just a few changes to the example in this tutorial, you can create a variety of different effects. Some alternatives include sparkles for gathering collectable objects, or explosions to indicate a projectile's impact.

---
*Source: [Create explosions with VFX](https://create.roblox.com/docs/tutorials/use-case-tutorials/vfx/use-particles-for-explosions) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
