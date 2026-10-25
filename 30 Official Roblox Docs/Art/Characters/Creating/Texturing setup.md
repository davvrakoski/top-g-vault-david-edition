---
title: "Texturing setup"
description: "Set up Blender to optimize your project for texturing the eyes and face of your template."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/characters/creating/texturing-setup"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Set up Blender to optimize your project for texturing the eyes and face of your template.*

**Texturing** is the process of customizing the color, tone, and shading of your model's surface. Custom meshes and models use a 2D image, known as a texture map, to project various surface appearance elements onto your 3D object.

*(image in the full Top G Vault)*

*Model after custom sculpting*

*(image in the full Top G Vault)*

*Model after texturing*

Each template comes with a color texture map, which you can alter and modify using Blender's texture editing tools. Since most Roblox avatars can take advantage of custom skin tones, it's important to understand how to [[30 Official Roblox Docs/Art/Characters/Creating/Blender configuration#Preview skin tones|preview custom skin tones]] in Blender to verify how your final asset will look in a Roblox game.

For the purpose of demonstrating the basic texturing process, this tutorial goes over basic texture painting setup, applies a completely opaque texture over parts of the character eyes, and partially opaque details over the face. You can apply these same techniques to other parts of your character geometry.

> [!warning]
> When texturing parts of your character model's body, ensure that your character model includes a modesty layer over sensitive regions. For more information, see [[30 Official Roblox Docs/Marketplace/Marketplace policy#Modesty layers|Marketplace policy - Modesty layers]].

## Texture settings

If you're using a Blender downloadable template, it's important to keep in mind that Blender requires you to **manually** save your textures in the Texture Paint tab's 2D view window. If you just save your `.blend` project file, your textures do **_not_** save with it. This can cause you to lose hours of work if you don't periodically save your progress as you go.

*(image in the full Top G Vault)*

Blender 5.2 and later versions offer a texture setting to override this behavior:

1. In the topbar, navigate to **Edit** > **Preferences**. The **Preferences** window displays.
1. In the vertical navigation, select the **Save & Load** tab.
1. In the **Blend Files** section, set **Save Modified Images** to **Always Save**.

   *(image in the full Top G Vault)*

## Set texture resolution

Roblox Studio supports a texture resolution of **1024 x 1024** for albedo texture maps. When using applications like Blender or Maya to texture paint directly on a model, extremely fine details may not paint as expected due to the resolution and level of detail of the painting.

*(image in the full Top G Vault)*

*Texture painting at 1024 x 1024 resolution*

*(image in the full Top G Vault)*

*Texture painting at 2048 x 2048 resolution*

When adding fine details to your texture, increase the image resolution of your texture map temporarily to **2048 x 2048** or **4096 x 4096**. After completing your texturing, change the image resolution back to **1024 x 1024** to bake in the changes.

To change your texture image resolution:

1. In the **Layout** tab, select the `Head_Geo`.
1. Switch to the **Texture Paint** tab, then in the 2D view window, select **Image** > **Resize**.
1. Set the texture size:
   - Use **2048** or **4096** for a higher resolution when creating detailed texture work.
   - Use **1024** for the default Roblox-supported resolution.

      [Video: Texturing_09.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Texturing_09.mp4)

---
*Source: [Texturing setup](https://create.roblox.com/docs/art/characters/creating/texturing-setup) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
