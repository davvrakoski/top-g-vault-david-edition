---
title: "Post-processing effects"
description: "Post-processing effects are customizable filters that quickly enrich the visuals of a game."
area: "30 Official Roblox Docs"
cluster: "Environment"
source: "https://create.roblox.com/docs/environment/post-processing-effects"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Post-processing effects are customizable filters that quickly enrich the visuals of a game.*

**Post-processing effects** are customizable filters that allow you to quickly enrich the visuals of your game. Using the post-processing effect objects in the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service or [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]], you can:

- Simulate a camera viewing a bright light and exaggerate its glow ([[30 Official Roblox Docs/Environment/Post-processing effects#Bloom|bloom]]).
- Apply a Gaussian [[30 Official Roblox Docs/Environment/Post-processing effects#Blur|blur]] to the entirety of your game, or add a blur to parts of your game that aren't in focus ([[30 Official Roblox Docs/Environment/Post-processing effects#Depth-of-field|depth‑of‑field]]).
- Enhance an environment's appearance to create a specific mood through hue ([[30 Official Roblox Docs/Environment/Post-processing effects#Color correction|color correction]]).
- Render a halo of light that moves with the sun ([[30 Official Roblox Docs/Environment/Post-processing effects#Sun rays|sun rays]]).

*(image in the full Top G Vault)*

*Landscape with depth-of-field effect applied, simulating distance blur*

## Add post-processing effects

When you add post-processing effects to the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service, they display to **all players** who enter the game. This is useful for effects
that affect the global environment, such as [[30 Official Roblox Docs/Environment/Post-processing effects#Sun rays|sun rays]].

When you add post-processing effects to the [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]] object, they only display to a **specific player**. This is useful for effects that should only pertain to that player based on their actions, such as blurring the 3D world view when they have a UI menu open.

To add post-processing effects to either the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service or [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]]:

1. In the **Explorer** window, hover over the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service or [[30 Official Roblox Docs/API Reference/Classes/Camera|Camera]],
   then click the ⊕ button. A contextual menu displays.
1. From the menu, insert one or more of the following post-processing effects:

   - **BloomEffect**
   - **BlurEffect**
   - **ColorCorrectionEffect**
   - **DepthOfFieldEffect**
   - **SunRaysEffect**
   - **ColorGradingEffect**

1. Depending on your Studio settings, some effects may not appear. To increase
   your rendering quality level:

   1. Open [[30 Official Roblox Docs/Studio/Roblox Studio setup#Customization|Studio Settings]].
   2. In the left-side navigation, select **Rendering**, then the **Editor Quality Level** dropdown menu.
   3. Set it to the highest level.

## Bloom

The [[30 Official Roblox Docs/API Reference/Classes/BloomEffect|BloomEffect]] effect exaggerates lights within your game by simulating a camera viewing a bright light. When this effect has a high value, parts with light colors glow.

### Default

*(image in the full Top G Vault)*

### Bloom Effect

*(image in the full Top G Vault)*

## Blur

The [[30 Official Roblox Docs/API Reference/Classes/BlurEffect|BlurEffect]] effect applies a Gaussian blur to the entirety of the 3D world view. You can use this effect to blur the background when a player has a menu open, allowing them to focus on the most important details.

### Default

*(image in the full Top G Vault)*

### Blur Effect

*(image in the full Top G Vault)*

## Color correction

The [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect|ColorCorrectionEffect]] effect adjusts color properties to enhance an environment's appearance. You can also use this effect to provide player feedback, such as tinting the screen red when their character's health is low.

The following list describes the primary [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect|ColorCorrectionEffect]] properties:

- [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect#Brightness|Brightness]] — Sets the brightness of pixels.
- [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect#Contrast|Contrast]] — Sets the change in separation between dark and light colors.
- [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect#Saturation|Saturation]] — Sets the intensity of colors.
- [[30 Official Roblox Docs/API Reference/Classes/ColorCorrectionEffect#TintColor|TintColor]] — Determines how much the RGB channels of pixels scale.

### Default

*(image in the full Top G Vault)*

### Color Correction Effect

*(image in the full Top G Vault)*

## Depth-of-field

The [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect|DepthOfFieldEffect]] effect blurs parts of your game that aren't in focus. You can use this effect to blur distant objects or to focus a player on specific parts of your game, such as an item in a shop.

### Default

*(image in the full Top G Vault)*

### Depth-of-Field Effect

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

## Sun rays

The [[30 Official Roblox Docs/API Reference/Classes/SunRaysEffect|SunRaysEffect]] effect creates a halo of light with rays around the sun that move based on the [[30 Official Roblox Docs/API Reference/Classes/Lighting#ClockTime|ClockTime]]
or [[30 Official Roblox Docs/API Reference/Classes/Lighting#TimeOfDay|TimeOfDay]] property. Objects between the player's camera and the sun shape this effect, allowing for realistic visuals of light and shadow.

[Video: Sun-Rays-Effect.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/post-processing/Sun-Rays-Effect.mp4)

## Color grading

The [[30 Official Roblox Docs/API Reference/Classes/ColorGradingEffect|ColorGradingEffect]] effect modifies how color values calculated by the renderer should be converted to the screen's color range, impacting the mood and appearance of your place.

This effect's primary property is [[30 Official Roblox Docs/API Reference/Classes/ColorGradingEffect#TonemapperPreset|TonemapperPreset]]. The following values are available:

- [[30 Official Roblox Docs/API Reference/Enums/TonemapperPreset|Enum.TonemapperPreset.Default]] — Sets the tone mapper to use the post‑2019 Roblox appearance which provides vivid colors and high contrasts.
- [[30 Official Roblox Docs/API Reference/Enums/TonemapperPreset|Enum.TonemapperPreset.Retro]] — Sets the tone mapper to imitate the pre‑2019 Roblox appearance. Colors look less saturated and there's less contrast between them.

If you wish to recreate a full pre‑2019 Roblox look for your game, experiment with [[30 Official Roblox Docs/API Reference/Enums/TonemapperPreset|Enum.TonemapperPreset.Retro]] and set the brightness of all lights to a maximum of `1.0`.

### Default

*(image in the full Top G Vault)*

### Retro

*(image in the full Top G Vault)*

---
*Source: [Post-processing effects](https://create.roblox.com/docs/environment/post-processing-effects) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
