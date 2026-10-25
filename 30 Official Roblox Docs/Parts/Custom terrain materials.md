---
title: "Custom terrain materials"
description: "Enable Expanded Terrain to paint up to 62 custom materials onto terrain and take advantage of terrain performance improvements."
area: "30 Official Roblox Docs"
cluster: "Parts"
source: "https://create.roblox.com/docs/parts/custom-terrain-materials"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Enable Expanded Terrain to paint up to 62 custom materials onto terrain and take advantage of terrain performance improvements.*

**Custom terrain materials** let you define up to 62 paintable materials for terrain so you can build distinct environments within a single place or add more color and variety to an existing landscape. Each material can use a custom color and an optional [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] for custom textures.

## Enable Expanded Terrain

Expanded Terrain is off by default and is enabled per place. Enabling it swaps the terrain backend, so the place must reopen for the change to take effect.

To enable custom terrain materials in a place:

1. In a place in Studio, go to the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] and select [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].
2. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, set **Expanded Terrain** to **Enabled**.
3. In the **Restart Place** dialog, click **Restart**.

> [!info]
> When you enable this feature in a new place, Studio saves and closes the place for you. You must still reopen the place for the change to take effect.

## Create custom terrain materials

You can create custom terrain materials from the Terrain Editor's material picker:

1. Open the **Terrain Editor** and choose a brush tool such as **Paint**, **Draw**, **Fill**, or **Sculpt**.
2. Open the material picker next to **Source Material**.
3. Click the **+** icon to create a new terrain material.
4. Choose a name and a base material. You can select a [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] to apply custom textures or adjust the **Color** to tint the material.
5. Paint, draw, fill, or sculpt with the selected material.

*(image in the full Top G Vault)*

You can also use custom terrain materials with the **Replace** tool to swap one material for another without changing the rest of the terrain.

Custom terrain materials support multiple color variations of both default terrain materials and custom [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariants]]. For example, you can create several shades of grass in the same place instead of overriding a single base material globally.

To create a [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] for use with terrain materials, see [[30 Official Roblox Docs/Parts/Materials#Custom materials|Custom materials]]. You can also generate variants with the [[30 Official Roblox Docs/Studio/Material Generator|Material Generator]].

## Manage terrain materials

Use the **Terrain Materials Manager** to add, remove, or edit custom terrain materials for a place.

Open the manager from **Window** ⟩ **3D**, or right-click a material in the Terrain Editor material picker and select **Open in Terrain Material Manager**.

*(image in the full Top G Vault)*

When you change a material's settings, such as its color, the update applies immediately to all terrain that uses that material. If you delete a material that the terrain still uses, the affected terrain turns bright purple so you can identify and replace it.

## Limitations

- Custom physical properties on a [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] aren't yet respected by custom terrain material slots.
- Editing terrain in Team Create might introduce meshing or visual bugs.
- Heightmap and colormap import might produce different results than before. Import with a colormap is more sensitive to the colors of your materials.

---
*Source: [Custom terrain materials](https://create.roblox.com/docs/parts/custom-terrain-materials) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
