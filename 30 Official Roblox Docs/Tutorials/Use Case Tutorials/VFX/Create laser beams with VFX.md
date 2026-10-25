---
title: "Create laser beams with VFX"
description: "A tutorial on creating a laser beam that sets an avatar's health to 0 on impact."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/use-case-tutorials/vfx/laser-traps-with-beams"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*A tutorial on creating a laser beam that sets an avatar's health to 0 on impact.*

A **laser beam** is a ray of light. While rarely dangerous in real life, sci-fi games often use laser beams as a mechanism to damage players on impact. However, because of their versatility and prominence in futuristic media, laser beams are useful for all sorts of gameplay mechanics, such as blaster weapons, puzzles, obstacles, and environment aesthetics.

Using a sample [Laser Beam Blaster](https://create.roblox.com/store/asset/16382650186) model, this tutorial shows you how to create a laser beam special effect with an optional script to set the player's health to zero on collision, including guidance on:

- Setting up an invisible collision box that detects when a player collides with the laser beam.
- Configuring attachments that represent the reach of the laser beam's emission.
- Customizing a beam that emulates the visual characteristics of a futuristic laser beam.
- Scripting behavior for the collision box that damages the player's character.

> [!info]
> You can create your own assets in third-party modeling tools and follow along with your own design. For information on exporting models for use in Studio, see [[30 Official Roblox Docs/Art/Modeling/Export settings|Exporting Requirements]].

[Video: Script.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/laser-traps-with-beams/Script.mp4)

## Get blaster asset

The **Creator Store** is a tab of the **Toolbox** that you can use to find all assets that are made by Roblox and the Roblox community for use within your projects, including model, image, mesh, audio, plugin, video, and font assets. You can use the Creator Store to add an individual asset or asset library directly into an open game.

This tutorial references a high-quality laser beam blaster model that you can use as you replicate each step within the following sections.

*(image in the full Top G Vault)*

To get this blaster asset from your inventory into your game:

1. Add the blaster to your inventory.

   1. Navigate to the asset's [details page](https://create.roblox.com/store/asset/16382650186) on the Creator Store.
   1. In the top-right corner, click the **Get Model** button. The blaster asset is now in your inventory, and you can reuse it in any project on the platform.

1. In Studio, navigate to the **Home** tab, then click the **Toolbox** button. The **Toolbox** window opens.

   *(image in the full Top G Vault)*

1. In the **Toolbox** window, click the **Inventory** tab. The **My Models** sort displays.

   *(image in the full Top G Vault)*

1. Click the **Laser Beam Blaster** tile. The model displays in your viewport.

## Set up a collision box

The complete laser beam that sets players health to zero on impact needs to be able to detect when players collide with the laser. Because [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] objects don't have default collision detection capabilities, you must set up collision detection with basic parts.

For example, this tutorial uses an invisible block part with a [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] object as a collision box that detects when a character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] object touches the laser beam. In the final section of the tutorial, you will create a script that uses this information to trigger damage to the player's health.

To set up the collision box:

1. Insert a **block** part into **LaserBeamBlaster**.

   *(image in the full Top G Vault)*

1. Select the part, then in the **Properties** window,
   1. Set **Name** to **CollisionBox**. The part's name and its case style are important for the script later in the tutorial.
   1. Enable **Anchored** to ensure that the physics system doesn't move the part when the game starts.

1. Scale **CollisionBox** to the length you want your laser beam to blast from the blaster. For example, this tutorial scales the it to be the same length as the blaster.

   *(image in the full Top G Vault)*

1. Move **CollisionBox** to a position where it extends from the blaster's emitter bulb. Your collision box now represents the reach of the laser beam's blast from the blaster.

   *(image in the full Top G Vault)*

## Configure attachments

Before you add a [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] object to your blaster, it's important to configure two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects in the 3D space to represent the reach of the laser's emission from the blaster's emitter bulb. Beams operate by rendering a texture between attachments, so if you don't have attachments for the beam to reference, it cannot function at all.

To configure attachments for the laser beam:

1. To make attachments visible in the viewport, enable **Show Constraint Details** from Studio's **View** menu.
1. Insert two attachments into the collision box.
   1. In the **Explorer** window, hover over **CollisionBox**, then click the ⊕ icon. A contextual menu displays.
   1. From the contextual menu, insert an **Attachment**.
   1. Repeat this process so that **CollisionBox** has two attachment objects.
   1. Rename both attachments **StartAttachment** and **EndAttachment**, respectively.

   *(image in the full Top G Vault)*

1. Move **StartAttachment** to the edge of **CollisionBox** that overlaps with the emitter bulb, then move **EndAttachment** to the edge of **CollisionBox** that represents the reach of the laser beam.

   *(image in the full Top G Vault)*

1. Make the **CollisionBox** transparent so that you will be able to see the texture the beam renders between the attachments without obstruction.
   1. In the **Explorer** window, select **CollisionBox**.
   1. In the **Properties** window, set **Transparency** to `1` to make the part completely transparent.

   *(image in the full Top G Vault)*

## Customize the beam

Now that you have [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects in the 3D space, you can add and customize a [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] object to emulate the visual characteristics of a laser beam. This tutorial provides guidance on how to create a futuristic, bright pink beam that animates quickly, but by experimenting with the same properties, you can create a variety of different special effects.

To customize the beam:

1. Insert a beam into **CollisionBox**.
   1. In the **Explorer** window, hover over **CollisionBox**, then click the ⊕ icon. A contextual menu displays.
   1. From the contextual menu, insert a **Beam**.
1. Assign the collision box's attachments to the new [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] object.
   1. In the **Explorer** window, select the beam.
   1. In the **Properties** window,
      1. Set **Attachment0** to **StartAttachment**.
      1. Set **Attachment1** to **EndAttachment**. The beam renders its default texture between the two attachments.

   *(image in the full Top G Vault)*

1. Customize the beam's visual appearance so it looks like a futuristic laser beam.
   1. In the **Explorer** window, verify the beam is still selected.
   1. In the **Properties** window,
      1. Set **Texture** to `rbxassetid://6060542021` to render a new texture that looks like a laser beam.
      1. Set **Color** to `255, 47, 137` to tint the laser bright pink.
      1. Set **LightEmission** to `0.5` to add a faint glow to the laser.
      1. Set **Width0** and **Width1** to `4` to widen the laser.
      1. Set **TextureSpeed** to `2` to make the laser animate more quickly.
      1. Enable **FaceCamera** to ensure the laser is visible no matter the angle of the player from the laser.

   [Video: Beam-3.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/laser-traps-with-beams/Beam-3.mp4)

> [!info]
> For more information on all beam properties you can customize, see [[30 Official Roblox Docs/Effects/Beams|Beams]].

## Script damage behavior

Your laser beam is currently aesthetically pleasing for its environment, but it's also completely harmless as a blaster weapon. To modify the laser blaster so that it can deal damage to players, you must add in a script to the collision box that triggers this behavior.

The sample script works by waiting to see which objects touch the collision box. If an object that touches the collision box includes a child [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] object, the script sets its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Health property]] to `0`. By default, every player character includes a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] object, so every time a player collides with the collision box, the script instantaneously sets their health to zero, and the character falls apart.

To script the behavior that damages the player:

1. Insert a script into **LaserBeamBlaster**.
   1. In the **Explorer** window, hover over **LaserBeamBlaster**, then click the ⊕ icon. A contextual menu displays.
   1. From the contextual menu, insert a **Script**.

2. Replace the default code with the following code:

   ```lua
   local laserTrap = script.Parent
   local collisionBox = laserTrap.CollisionBox

   local function onTouch(otherPart)
   	local character = otherPart.Parent
   	local humanoid = character:FindFirstChildWhichIsA("Humanoid")

   	if humanoid then
   		humanoid.Health = 0
   	end
   end

   collisionBox.Touched:Connect(onTouch)
   ```

3. Test the behavior by walking into the laser beam.

   1. Choose **Test** from the dropdown menu and click the **Play** button to its right to begin the playtest.

      *(image in the full Top G Vault)*

   1. Walk into the laser beam to see your character fall apart. When you're done, click the **Stop** button. Studio exits playtest mode.

      *(image in the full Top G Vault)*

   > [!warning]
   > If the behavior isn't working correctly, make sure the script is a child of **LaserBeamBlaster**, and that the collision box is named `CollisionBox`.

You now have a dangerous laser beam blaster! Using the skills in this tutorial, you can customize all sorts of beam special effects, such as glowing force fields, rapid waterfalls, and speed ramps. For example, you can experiment with additional beam properties like `CurveSize0` and `CurveSize1`, [[30 Official Roblox Docs/Production/Creator Store|import]] your own textures, and pair beams with other special effects, like [[30 Official Roblox Docs/Effects/Particle emitters|Particle Emitters]] and [[30 Official Roblox Docs/Effects/Light sources|Light Sources]]. Happy creating!

---
*Source: [Create laser beams with VFX](https://create.roblox.com/docs/tutorials/use-case-tutorials/vfx/laser-traps-with-beams) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
