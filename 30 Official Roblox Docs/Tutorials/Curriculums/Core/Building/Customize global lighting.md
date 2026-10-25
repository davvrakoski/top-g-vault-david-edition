---
title: "Customize global lighting"
description: "Explains how to use global lighting settings to refine the look and feel of your game."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/curriculums/core/building/customize-global-lighting"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to use global lighting settings to refine the look and feel of your game.*

![](https://www.youtube.com/watch?v=VtsWu2G0ZiM)

**Global lighting** controls the overall look and atmosphere of your game. By adjusting a few properties on the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service, you can change the color, shadows, time of day, and atmospheric effects of a scene.

In this section, you'll update the lighting to match the [Island Jump - Final](https://www.roblox.com/games/14238807008/Island-Jump-Completed-Sample) sample.

> [!info]
> Lighting is mostly configured through property values, making it a great fit for Assistant. After applying the prompt, spend some time in the viewport adjusting **Ambient**, **ClockTime**, and **Density** until the scene looks the way you want. For an overview of every lighting object Studio offers, see [[30 Official Roblox Docs/Environment/Lighting and effects|Lighting and effects]].

## Set lighting properties

The [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service controls how light behaves in your game. The sample game adjusts properties such as ambient color, lighting technology, shadow settings, and sun position to create a cooler ocean palette, sharper shadows, and stronger directional lighting.

### Build with Assistant

```text title="Customize global lighting"
On the Lighting service, set the following properties:
- Ambient: Color3.fromRGB(16, 16, 16)
- ColorShift_Top: Color3.fromRGB(196, 222, 255)
- OutdoorAmbient: Color3.fromRGB(134, 158, 190)
- ShadowSoftness: 0
- LightingStyle: Realistic
- ClockTime: 9
- GeographicLatitude: 78
```

After it runs, the world picks up a cooler blue-grey tone, shadows get hard edges, and the sun shifts to mid-morning over to the right of your sea stacks.

### Build it Yourself

In the **Properties** window of **Lighting**:

1. **Tint the ambient and reflective light.** [[30 Official Roblox Docs/API Reference/Classes/Lighting#Ambient|Lighting.Ambient]] colors light in shaded areas (like the inside of your tunnel), [[30 Official Roblox Docs/API Reference/Classes/Lighting#OutdoorAmbient|Lighting.OutdoorAmbient]] colors light where the sky is visible, and [[30 Official Roblox Docs/API Reference/Classes/Lighting#ColorShift_Top|Lighting.ColorShift_Top]] tints surfaces facing the sun. Together they pull the whole world toward a cool blue-grey ocean tone.

   1. Set **Ambient** to `16, 16, 16`.
   2. Set **ColorShift_Top** to `196, 222, 255`.
   3. Set **OutdoorAmbient** to `134, 158, 190`.

   **A comparison between the sample Island Jump game's default and custom ambient lighting**

   *(image in the full Top G Vault)*

   *Default Properties*

   *(image in the full Top G Vault)*

   *Custom Properties*

2. **Switch to realistic lighting.** Studio defaults to [[30 Official Roblox Docs/API Reference/Enums/LightingStyle|Soft]], which produces a flatter look. Set **LightingStyle** to [[30 Official Roblox Docs/API Reference/Enums/LightingStyle|Realistic]] so local light sources cast precise shadows and illumination. Your flare will start dropping a real shadow on the platform beneath it.

   *(image in the full Top G Vault)*

   *[[30 Official Roblox Docs/API Reference/Enums/LightingStyle|Soft]]*

   *(image in the full Top G Vault)*

   *[[30 Official Roblox Docs/API Reference/Enums/LightingStyle|Realistic]]*

3. **Harden shadows.** Set **ShadowSoftness** to `0` to give shadows crisp edges. This makes the moment players step from outside into the tunnel feel more dramatic.

   *(image in the full Top G Vault)*

   *Default Shadows*

   *(image in the full Top G Vault)*

   *Custom Shadows*

4. **Move the sun.** [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime|ClockTime]] is the time of day on a 0-24 hour scale, and [[30 Official Roblox Docs/API Reference/Classes/Lighting#GeographicLatitude|GeographicLatitude]] rotates the world to position the sun at a different angle. The values below drop the sun toward the right of the sea stacks for longer, more directional shadows.

   1. Set **ClockTime** to `9`.
   2. Set **GeographicLatitude** to `78`.

   > [!info]
   > **ClockTime** and **TimeOfDay** are linked. Changing one updates the other, so you only need to set one.

*(image in the full Top G Vault)*

*Default sun position*

*(image in the full Top G Vault)*

*Custom sun position*

For an overview of the rest of the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] properties, see [[30 Official Roblox Docs/Environment/Global lighting|Global lighting]].

## Atmosphere properties

The [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] object is a child of the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service. It adds depth by simulating particles in the air and blending distant scenery into the sky. The two most important properties are `Density`, which controls the thickness of the atmosphere, and `Offset`, which controls where that blending begins.

### Build with Assistant

```text title="Thicken the atmosphere"
On the Atmosphere object inside the Lighting service, set:
- Density: 0.375
- Offset: 0.17
```

### Build it Yourself

1. In the **Explorer**, expand the **Lighting** service and select its child **Atmosphere** object. In the **Properties** window:

1. Set **Density** to `0.375` to thicken the air. This obscures the edge of your water terrain, so players don't see where the world ends.

  *(image in the full Top G Vault)*

  *Default air particle density*

  *(image in the full Top G Vault)*

  *Custom air particle density*

1. Set **Offset** to `0.17`. Lower offset values blend distant objects into the sky, which is good for endless-feeling worlds. Higher values keep a clear silhouette. This middle value keeps the mountains you'll add next chapter visible while still giving you a hint of distant fog.

  *(image in the full Top G Vault)*

  *Default [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Offset|Atmosphere.Offset]]*

  *(image in the full Top G Vault)*

  *Custom [[30 Official Roblox Docs/API Reference/Classes/Atmosphere#Offset|Atmosphere.Offset]]*

For more information about Atmosphere, see [[30 Official Roblox Docs/Environment/Atmospheric effects|Atmospheric Effects]].

Now that you've configured the game's lighting, the next section shows you how to replace the greybox layout with polished assets.

### Pre-Customization

*(image in the full Top G Vault)*

### Customized Visual Effects

*(image in the full Top G Vault)*

---
*Source: [Customize global lighting](https://create.roblox.com/docs/tutorials/curriculums/core/building/customize-global-lighting) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
