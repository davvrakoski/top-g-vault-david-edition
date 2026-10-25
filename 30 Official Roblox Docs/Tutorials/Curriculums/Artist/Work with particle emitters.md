---
title: "Work with particle emitters"
description: "Explains how to work with particle emitters to create special effects for a carnival game."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/curriculums/artist/work-with-particle-emitters"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to work with particle emitters to create special effects for a carnival game.*

**Particle emitters** create special effects by emitting 2D images, also referred to as particles, into the 3D world. By customizing how particles look and behave as they emit into the environment, you can create visual art that makes your games feel unique and captivating to potential players.

To demonstrate, check out the **Mansion of Wonder** template uses the following three images to create VFX art in different areas of the carnival ride:

*(image in the full Top G Vault)*<br>
*(image in the full Top G Vault)*<br>

[Video: Rock-Video.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-mansion-of-wonder/particle-emitters/Rock-Video.mp4)

*(image in the full Top G Vault)*<br>
*(image in the full Top G Vault)*<br>

[Video: Fire-Video.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-mansion-of-wonder/particle-emitters/Fire-Video.mp4)

*(image in the full Top G Vault)*<br>
*(image in the full Top G Vault)*<br>

[Video: Portal-Video.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-mansion-of-wonder/particle-emitters/Portal-Video.mp4)

Using the exact same techniques, in this chapter, let's explore how to find the carnival ride's laser blast and explosion particle emitters, then customize their properties until you transform the bland starting particles into your own VFX creations.

## Find sample emitters

This lesson's template provides two basic particle emitters that players interact with during the carnival ride:

- One for the **laser blast** that flies through the air when players shoot their blaster.
- Another for the **explosion** when the laser blast hits a ghost or slime enemy.

Both particle emitters start with simple white particles so that you can see your progress in real time as you customize their visual appearance and behavior and visual appearance throughout this chapter.

To find the sample particle emitters:

1. Using the following camera controls, move your camera to get a good view of the two particle emitter stands near the front of the mansion. The first particle emitter you will customize is the laser blast particle emitter on the left with the white sparkles.

     | **Action** | **Control** |
     | --- | --- |
     | **Move** | <kbd>W</kbd> <kbd>A</kbd> <kbd>S</kbd> <kbd>D</kbd> |
     | **Rotate** | Hold the right mouse button to rotate around the selected object. |
     | **Zoom** | Use your mouse's scroll wheel. |
     | **Focus** | Press <kbd>F</kbd> to focus on a the selected object. |

   *(image in the full Top G Vault)*

1. Find the laser blast particle emitter.

   1. In the **Explorer** window, go to the search bar, then type **BlastParticles**.
   1. In your search results, click the particle emitter result.

   *(image in the full Top G Vault)*

   > [!warning]
   > If you don't see the **Explorer** and **Properties** windows, toggle them on from Studio's **Window** menu.

## Customize laser blast

Whenever you select something in the 3D viewport or the **Explorer** window, the **Properties** window updates to display all properties that you can directly customize within Studio's interface. For example, when you selected the **BlastParticles** particle emitter in the previous section, the **Properties** window updated with all properties for that specific particle emitter.

To introduce you to customizing properties, let's start with customizing the color and image of the laser blast's particles. As you get more comfortable with this process, you can experiment with more properties.

### Color

A particle emitter's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Color|Color]] property tints each particle's texture to either a specific hue or a gradient of color from the time it emits to the time it fades. This lesson focuses on setting particles to a specific hue, but you can learn more about how to set them to a gradient in the [[30 Official Roblox Docs/Effects/Particle emitters#Color|Particle emitters]] guide after you finish the tutorial.

To tint the laser blast particles with a new color:

1. In the **Properties** window, find the **Color** property, then double-click the light grey box to its right. A pop-up **Colors** window displays.

   *(image in the full Top G Vault)*

1. In the **Colors** window, select a color and then click the **OK** button. For example, if you set the **Color** property to `202, 210, 20`, your particles will look like the following image.

   *(image in the full Top G Vault)*

### Texture

A particle emitter's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Texture|Texture]] property tells the particle emitter what picture, also referred to as **textures**, to emit into the environment. Textures can be any 2D image you want, such as a symbol or even something you've drawn. For example, the following video demonstrates how changing a particle emitter's texture creates entirely different effects.

[Video: particle-texture-example.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-mansion-of-wonder/using-textures/particle-texture-example.mp4)

To set the laser blast particles to a new texture:

1. Pick one of the following images to use as the particle emitter's texture, then copy the assetID number beneath the image. You can return to this starter pack of textures when you are ready to customize the explosion.

   *(image in the full Top G Vault)*

   *`rbxassetid://5860841663`*

   *(image in the full Top G Vault)*

   *`rbxassetid://5857851812`*

   *(image in the full Top G Vault)*

   *`rbxassetid://5857851618`*

   *(image in the full Top G Vault)*

   *`rbxassetid://6711256324`*

   *(image in the full Top G Vault)*

   *`rbxassetid://5833235272`*

   *(image in the full Top G Vault)*

   *`rbxassetid://6772783963`*

   *(image in the full Top G Vault)*

   *`rbxassetid://5833323391`*

   *(image in the full Top G Vault)*

   *`rbxassetid://5857892330`*

   *(image in the full Top G Vault)*

   *`rbxassetid://5857892405`*

   *(image in the full Top G Vault)*

   *`rbxassetid://5857931724`*

   *(image in the full Top G Vault)*

   *`rbxassetid://5857851618`*

   *(image in the full Top G Vault)*

   *`rbxassetid://5860841737`*

1. In the **Properties** window, find the **Texture** property, then click on it to highlight the text.

   *(image in the full Top G Vault)*

   > [!warning]
   > If you don't see the same properties as the example image, return to the **Explorer** window and reselect the **BlastParticles** particle emitter.

1. Paste your texture's assetID by pressing <kbd>Ctrl</kbd><kbd>V</kbd> or <kbd>⌘</kbd><kbd>V</kbd>, depending on your computer, then press **Enter**. Your particle emitter now emits particles that look like your texture. For example, if you use the `5833323391` texture, your particles will look like the example below.

   *(image in the full Top G Vault)*

## Customize explosion

Now that you have custom VFX art for your laser blast, you can move on to customizing the explosion whenever the laser blast hits a sinister slime or ghastly ghost. To verify that you're customizing the explosion's properties instead of the laser blast, make sure you select the explosion particle emitter so that the **Properties** window updates with its specific properties:

1. In the **Explorer** window, go to the search bar, then type **ExplosionParticles**.
1. In your search results, click the particle emitter result.

   *(image in the full Top G Vault)*

> [!info]
> Even though this section focuses on customizing the size and speed of the explosion's particles, feel free to use your previous learnings to customize their color and texture too.

### Size

A particle emitter's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Size|Size]] property changes the size of each particle's texture to either a specific size or size that changes from the time it emits to the time it fades. This lesson focuses on setting particles to a specific size, but you can learn more about how to set them to a changing size in the [[30 Official Roblox Docs/Effects/Particle emitters#Size|Particle emitters]] guide after you finish the tutorial.

To set the explosion particles to a new size:

1. In the **Properties** window, find the **Size** property.
1. For best results, set **Size** to a number between `1` and `10`.

   *(image in the full Top G Vault)*

When it comes to particles, there isn't a "one size fits all"; different particle textures look better at various sizes. To demonstrate, review the following video to see how a star texture transforms as the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Size|Size]] value increases.

[Video: newsizecomparison.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-mansion-of-wonder/make-final-touches/newsizecomparison.mp4)

### Speed

A particle emitter's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Speed|Speed]] property changes the rate at which particles emit from the particle emitter. In other words, you can change this property to ensure that particles either burst out quickly or creep out slowly.

To set the explosion particles to a new speed:

1. In the **Properties** window, find the **Speed** property, then set it to a number between `10` (slow) and `100` (fast).

   *(image in the full Top G Vault)*

1. Using your learnings from the previous chapter, playtest the game to see your particles in action. If anything doesn't look right, you can go back and make changes to your design.

   [Video: explosion-final.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-mansion-of-wonder/make-final-touches/explosion-final.mp4)

## Additional properties

Your laser blast and explosion VFX art are almost done! While you've customized a few particle emitter properties, there are many more you can modify to personalize your work. The following sections highlight a few, but feel free to also experiment with any that aren't listed here.

### LightEmission

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#LightEmission|LightEmission]] property makes particles glow. Higher values of this property can make particles glow even in environments with low lighting.

*(image in the full Top G Vault)*

*0*

*(image in the full Top G Vault)*

*0.5*

*(image in the full Top G Vault)*

*1*

### RotSpeed

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#RotSpeed|RotSpeed]] property makes particles rotate over time. To demonstrate how this works, review the following video to see how the particles' straight line texture changes rotation as the [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#RotSpeed|RotSpeed]] property increases.

[Video: rotation-speed-new.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-mansion-of-wonder/make-final-touches/rotation-speed-new.mp4)

### Lifetime

The [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime|Lifetime]] property changes how long in seconds particles are visible once they emit from the particle emitter. Depending on your VFX art, you may want your particles to only be visible for a moment (`0.5` seconds), or for them to linger in the air (`2` seconds).

[Video: lifetime-new.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-mansion-of-wonder/make-final-touches/lifetime-new.mp4)

### Randomized numbers

Randomizing properties can make particles feel less repetitive. You can add randomization to some particle emitters properties, such as [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Lifetime|Lifetime]] and [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#RotSpeed|RotSpeed]], by adding a minimum and maximum value range for the respective property.

To randomize numbers:

1. Click the small arrow next to the property's name. The property expands.

   *(image in the full Top G Vault)*

1. Set **Min** to the minimum value you want your particles to have.
1. Set **Max** to the maximum value you want your particles to have.

Using your new knowledge with particle emitters, take some time to improve your VFX art. When you are ready, continue to the next section to learn more about playtesting and how to save your work to Roblox.

---
*Source: [Work with particle emitters](https://create.roblox.com/docs/tutorials/curriculums/artist/work-with-particle-emitters) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
