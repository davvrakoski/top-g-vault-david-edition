---
title: "Environmental terrain"
description: "Explore how to generate and sculpt realistic terrain environments such as mountains, bodies of water, grass-covered hills, or a flat desert."
area: "30 Official Roblox Docs"
cluster: "Parts"
source: "https://create.roblox.com/docs/parts/terrain"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explore how to generate and sculpt realistic terrain environments such as mountains, bodies of water, grass-covered hills, or a flat desert.*

Studio's [[30 Official Roblox Docs/Studio/Terrain Editor|Terrain Editor]] lets you generate and sculpt detailed and realistic terrain environments such as mountains, bodies of water, grass-covered hills, or a flat desert. Terrain is made up of grids of **voxels** which are 4×4×4 stud regions in the 3D world with a set material.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

Using the editor tools, you can easily [[30 Official Roblox Docs/Parts/Environmental terrain#Generate terrain|generate]] and edit terrain either at a [[30 Official Roblox Docs/Parts/Environmental terrain#Detailed editing|voxel]] or [[30 Official Roblox Docs/Parts/Environmental terrain#Large-scale editing|region]] level with the option of importing a [[30 Official Roblox Docs/Parts/Environmental terrain#Heightmaps and colormaps|heightmap]] and [[30 Official Roblox Docs/Parts/Environmental terrain#Heightmaps and colormaps|colormap]]. For more precise, dynamic, or procedural terrain editing, you can also [[30 Official Roblox Docs/Parts/Environmental terrain#Scripting|script]] terrain creation.

## Terrain materials

The following default materials are available for terrain. You can also paint [[30 Official Roblox Docs/Parts/Custom terrain materials|custom terrain materials]] after you enable **Expanded Terrain**, or apply [[30 Official Roblox Docs/Parts/Materials#Custom materials|custom materials]] as overrides. Materials affect both the shape and appearance of terrain in the world; for example, [[30 Official Roblox Docs/Parts/Environmental terrain#Grass animation|animated grass]] renders only on the [[30 Official Roblox Docs/API Reference/Enums/Material|Grass]] material and the [[30 Official Roblox Docs/API Reference/Enums/Material|Water]] material [[30 Official Roblox Docs/Parts/Environmental terrain#Water appearance|ripples and shimmers]] with a subtle motion.

*(image in the full Top G Vault)*

*Asphalt*

*(image in the full Top G Vault)*

*Basalt*

*(image in the full Top G Vault)*

*Brick*

*(image in the full Top G Vault)*

*Cobblestone*

*(image in the full Top G Vault)*

*Concrete*

*(image in the full Top G Vault)*

*Cracked Lava*

*(image in the full Top G Vault)*

*Glacier*

*(image in the full Top G Vault)*

*Grass*

*(image in the full Top G Vault)*

*Ground*

*(image in the full Top G Vault)*

*Ice*

*(image in the full Top G Vault)*

*Leafy Grass*

*(image in the full Top G Vault)*

*Limestone*

*(image in the full Top G Vault)*

*Mud*

*(image in the full Top G Vault)*

*Pavement*

*(image in the full Top G Vault)*

*Rock*

*(image in the full Top G Vault)*

*Salt*

*(image in the full Top G Vault)*

*Sand*

*(image in the full Top G Vault)*

*Sandstone*

*(image in the full Top G Vault)*

*Slate*

*(image in the full Top G Vault)*

*Snow*

*(image in the full Top G Vault)*

*Water*

*(image in the full Top G Vault)*

*Wood Planks*

*(image in the full Top G Vault)*

*Air*

### Water appearance

By default, terrain water ripples, oscillates, and shimmers with a subtle motion.

[Video: Water-Appearance.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/terrain/Water-Appearance.mp4)

To customize the color and motion of water:

1. In the **Explorer** window, navigate to the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], then select the [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] object.

   *(image in the full Top G Vault)*

1. In the **Properties** window, customize the appearance of water through the following properties:

   | Property | Description |
   | --- | --- |
   | [[30 Official Roblox Docs/API Reference/Classes/Terrain#WaterColor\|WaterColor]] | Adjusts the overall hue of all terrain water in the game. |
   | [[30 Official Roblox Docs/API Reference/Classes/Terrain#WaterReflectance\|WaterReflectance]] | Adjusts how much water surfaces reflect the sky and surrounding objects from a value of 1 (high) to 0 (none). |
   | [[30 Official Roblox Docs/API Reference/Classes/Terrain#WaterTransparency\|WaterTransparency]] | Adjusts how transparent water is from a value of 1 (clear) to 0 (opaque). |
   | [[30 Official Roblox Docs/API Reference/Classes/Terrain#WaterWaveSize\|WaterWaveSize]] | Adjusts the size of waves from a value of 1 (large) to 0 (none). |
   | [[30 Official Roblox Docs/API Reference/Classes/Terrain#WaterWaveSpeed\|WaterWaveSpeed]] | Adjusts the speed of waves from a value of 100 (turbulent) to 0 (still). |

> [!info]
> Some water properties are only visible while playtesting. To preview all properties while editing, open [[30 Official Roblox Docs/Studio/Roblox Studio setup#Customization|Studio Settings]], search for **Editor Quality Level**, and set it to the highest level.

### Grass animation

While most materials are static, you can add animated blades of grass to the [[30 Official Roblox Docs/API Reference/Enums/Material|Grass]] terrain material. By default, grass sways gently in a simulated wind, and you can adjust the direction/strength of its animation through [[30 Official Roblox Docs/Environment/Global wind|global wind]].

[Video: Global-Wind-Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/aero-fluid-dynamics/Global-Wind-Showcase.mp4)

> [!info]
> Note that the speed of animated grass — but not its vector direction — will be reduced if the player has toggled on the **Reduce Motion** [[30 Official Roblox Docs/Production/Publishing/Accessibility guidelines#Reduced motion|accessibility]] setting from the Roblox or in-game **Settings** menu.

To add animated grass to the [[30 Official Roblox Docs/API Reference/Enums/Material|Grass]] material:

1. In the **Explorer** window, navigate to the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], then select the [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] object.

   *(image in the full Top G Vault)*

2. In the **Properties** window, toggle on the [[30 Official Roblox Docs/API Reference/Classes/Terrain#Decoration|Decoration]] property.

   *(image in the full Top G Vault)*

3. Adjust the grass length by entering a value between `0.1` and `1` for the [[30 Official Roblox Docs/API Reference/Classes/Terrain#GrassLength|GrassLength]] property.

   *(image in the full Top G Vault)*

    *(image in the full Top G Vault)*

4. Adjust the direction and strength of its animation through [[30 Official Roblox Docs/Environment/Global wind|global wind]].

### Custom terrain colors

Each terrain material is assigned a default color, but you can customize any material's color to better fit your game.

#### Default

*(image in the full Top G Vault)*

#### Fantasy

*(image in the full Top G Vault)*

#### Tundra

*(image in the full Top G Vault)*

To customize any material color other than water:

1. In the **Explorer** window, navigate to the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], then select the [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] object.

   *(image in the full Top G Vault)*

2. In the **Properties** window, expand [[30 Official Roblox Docs/API Reference/Classes/Terrain#MaterialColors|MaterialColors]]. All materials display with their RGB code.

   *(image in the full Top G Vault)*

3. For any material, either input a new RGB code or click the color box to open the [[30 Official Roblox Docs/Parts/Parts#Color|colors popup]].

## Generate terrain

Using the following tools and methods, you can generate large
areas of terrain procedurally through tooling or scripting, or automatically based on a heightmap and colormap.

### Generate tool

The **Generate** tool allows you to procedurally generate terrain in seconds. This is useful if you want to create a large map and fine-tune [[30 Official Roblox Docs/Parts/Environmental terrain#Detailed editing|terrain details]].

1. In the editor window, navigate to the **Create** tab and select the **Generate** tool.

   *(image in the full Top G Vault)*

2. In the 3D viewport, move/resize the **selection region** in which to generate terrain. Alternatively, expand the tool's **Selection Settings** and enter values into the **X**/**Y**/**Z** inputs to set a specific size and position.

3. In the tool's **Biome Settings** section, choose the following biomes to include in the new terrain:

   - Arctic
   - Dunes
   - Canyons

   - Lavascape
   - Water
   - Mountains

   - Hills
   - Plains
   - Marsh

4. Click the **Generate** button.

   [Video: Generate-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Generate-Tool.mp4)

### Heightmaps and colormaps

A **heightmap** is a 2D representation of a 3D terrain map, as viewed directly from above. Brighter areas of a heightmap result in higher terrain, like mountains, while darker areas result in lower regions, like valleys.

An optional **colormap**, along with a heightmap, converts colors to terrain materials using a **color key**.

*(image in the full Top G Vault)*

*Heightmap*

*(image in the full Top G Vault)*

*Colormap*

*(image in the full Top G Vault)*

*Generated terrain*

1 pixel in a heightmap represents 4 studs in Studio, and Studio supports a maximum of 4096×4096 pixels in either `.jpg` or `.png` format.

To import a heightmap and optional colormap:

1. In the editor window, navigate to the **Create** tab and select the **Import** tool.

   *(image in the full Top G Vault)*

2. In the tool's **Map Settings** section, click the import button and choose the image you want to import as a heightmap.
3. In the tool's **Material Settings** section, select a terrain material or, alternatively, upload a colormap.

   #### Material

   To apply one consistent material across all of the generated terrain, select the **Material** tab and pick a terrain material.

   #### Colormap

    To apply a colormap, click the **Colormap** tab, click its import button, and choose the file to import. Colors on the image should match the following RGB/hex values and use hard edges, since anti‑aliasing or edge smoothing may create pixel colors outside the expected value ranges.

   The following table describes color mapping to a corresponding material. If your colormap contains a color that's not in the table, Studio chooses the closest matching material; for this reason, it is best to download the [[30 Official Roblox Docs/_assets/modeling/terrain/RobloxColorMapIndex.png|RobloxColorMapIndex]] file and directly sample its colors, or type the exact RGB/hex values into the color picker of your image editing application.

   | Material | RGB Value | Hex Value | Color |
   | --- | --- | --- | --- |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Air]] | `[255, 255, 255]` | `FFFFFF` | `rgb(255,255,255)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Asphalt]] | `[115, 123, 107]` | `737B6B` | `rgb(115,123,107)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Basalt]] | `[30, 30, 37]` | `1E1E25` | `rgb(30,30,37)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Brick]] | `[138, 86, 62]` | `8A563E` | `rgb(138,86,62)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Cobblestone]] | `[132, 123, 90]` | `847B5A` | `rgb(132,123,90)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Concrete]] | `[127, 102, 63]` | `7F663F` | `rgb(127,102,63)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|CrackedLava]] | `[232, 156, 74]` | `E89C4A` | `rgb(232,156,74)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Glacier]] | `[101, 176, 234]` | `65B0EA` | `rgb(101,176,234)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Grass]] | `[106, 127, 63]` | `6A7F3F` | `rgb(106,127,63)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Ground]] | `[102, 92, 59]` | `665C3B` | `rgb(102,92,59)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Ice]] | `[129, 194, 224]` | `81C2E0` | `rgb(129,194,224)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|LeafyGrass]] | `[115, 132, 74]` | `73844A` | `rgb(115,132,74)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Limestone]] | `[206, 173, 148]` | `CEAD94` | `rgb(206,173,148)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Mud]] | `[58, 46, 36]` | `3A2E24` | `rgb(58,46,36)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Pavement]] | `[148, 148, 140]` | `94948C` | `rgb(148,148,140)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Rock]] | `[102, 108, 111]` | `666C6F` | `rgb(102,108,111)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Salt]] | `[198, 189, 181]` | `C6BDB5` | `rgb(198,189,181)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Sand]] | `[143, 126, 95]` | `8F7E5F` | `rgb(143,126,95)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Sandstone]] | `[137, 90, 71]` | `895A47` | `rgb(137,90,71)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Slate]] | `[63, 127, 107]` | `3F7F6B` | `rgb(63,127,107)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Snow]] | `[195, 199, 218]` | `C3C7DA` | `rgb(195,199,218)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|WoodPlanks]] | `[139, 109, 79]` | `8B6D4F` | `rgb(139,109,79)` |
   | [[30 Official Roblox Docs/API Reference/Enums/Material\|Water]] | `[12, 84, 92]` | `0C545C` | `rgb(12,84,92)` |

4. In the 3D viewport, move/resize the **selection region** in which to generate terrain. Alternatively, enter values into the **Select** tool fields to set a more specific position and size.

   > [!info]
   > Minimum and maximum terrain heights depend on the darkest and lightest areas of the heightmap image in relation to the **Y** size (height) of the selection region. For instance, if you choose a height of 128, pure black areas are 64 studs below the center position and pure white areas are 64 studs above the center position.

5. Click the **Generate** button.

   [Video: Import-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Import-Tool.mp4)

### Scripting

You can script terrain generation using the [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] class. For example, to create terrain with grass material that fills a volume, you can use methods such as [[30 Official Roblox Docs/API Reference/Classes/Terrain#FillBall|FillBall()]], [[30 Official Roblox Docs/API Reference/Classes/Terrain#FillBlock|FillBlock()]], [[30 Official Roblox Docs/API Reference/Classes/Terrain#FillCylinder|FillCylinder()]], [[30 Official Roblox Docs/API Reference/Classes/Terrain#FillRegion|FillRegion()]], or [[30 Official Roblox Docs/API Reference/Classes/Terrain#FillWedge|FillWedge()]].

```lua title="Fill Block Volume"
local Workspace = game:GetService("Workspace")

Workspace.Terrain:FillBlock(CFrame.new(0, 0, 0), Vector3.new(4, 4, 4), Enum.Material.Grass)
```

## Large-scale editing

The editor's **Edit** tab contains tools for large-scale editing.

### Select regions

The **Select** tool is the universal tool for selecting rectangular regions of terrain.

*(image in the full Top G Vault)*

Select a region by clicking and dragging in the 3D viewport, reposition it with the **move** draggers, and edit its size with the **scale** handles. Alternatively, enter values into the tool's **X**/**Y**/**Z** inputs to set a specific position and size.

*(image in the full Top G Vault)*

*Move draggers and scale handles on a selected region*

Studio also supports the following keyboard and mouse shortcuts, assuming the Select tool is active and nothing is selected in the **Explorer** window.

| Windows | Mac | Action |
| --- | --- | --- |
| <kbd>Ctrl</kbd><kbd>C</kbd> | <kbd>⌘</kbd><kbd>C</kbd> | Copy terrain within the selected region to the clipboard. |
| <kbd>Ctrl</kbd><kbd>V</kbd> | <kbd>⌘</kbd><kbd>V</kbd> | Paste terrain that has been copied to the clipboard and swap to the Transform tool so that the new terrain can be transformed. |
| <kbd>Ctrl</kbd><kbd>X</kbd> | <kbd>⌘</kbd><kbd>X</kbd> | Cut terrain within the selected region to the clipboard. |
| <kbd>Ctrl</kbd><kbd>D</kbd> | <kbd>⌘</kbd><kbd>D</kbd> | Duplicate terrain within the selected region and swap to the Transform tool so that the new terrain can be transformed. |
| <kbd>Delete</kbd> | <kbd>Delete</kbd> | Delete terrain within the selected region. |
| <kbd>Shift</kbd> | <kbd>Shift</kbd> | When held down while dragging any **scale** handle, scales the region proportionally across all other axes. |
| <kbd>Ctrl</kbd> | <kbd>⌘</kbd> | When held down while dragging any **scale** handle, scales the region equally in both the positive and negative direction along that axis. |

### Transform regions

The **Transform** tool lets you manipulate entire selected regions to a new position, size, or orientation.

To transform a region:

1. Select a region and then activate the **Transform** tool. Note that the tool will be automatically activated if you paste or duplicate terrain.

   *(image in the full Top G Vault)*

1. In the 3D viewport, transform the region with the **move** draggers, **rotate** rings, and **scale** handles. Alternatively, enter values into the tool's **X**/**Y**/**Z** inputs to set a specific position, size, and rotation.

   *(image in the full Top G Vault)*

   > [!info]
   > Holding <kbd>Shift</kbd> while dragging any **scale** handle scales the region proportionally across all other axes, and holding <kbd>Ctrl</kbd> or <kbd>⌘</kbd> while dragging scales the region equally in both the positive and negative direction along that axis.
   >
   > Holding <kbd>Shift</kbd> while dragging any **rotate** ring toggles between rotation snapping or free‑form rotation.

   > [!success]
   > By default, this tool uses **Live Edit** mode to constantly update terrain as you transform it. To view only a wireframe preview of the terrain as you transform it, disable live edit mode and then, while transforming, press <kbd>Enter</kbd>/<kbd>Return</kbd> or click the **Apply** button to apply the changes.

### Fill and replace regions

The **Fill** tool lets you fill an entire selected region with a specific material, or replace all material within the region with another material.

1. Select a region, then activate the **Fill** tool.

   *(image in the full Top G Vault)*

1. In the tool's **Material Settings** section:
   - To fill the region with a specific material, select **Fill** and choose the desired material.
   - To replace all terrain of one material with another material, select **Replace**, then choose a **source** material and **target** material.
1. Click the **Apply** button or press <kbd>Enter</kbd>/<kbd>Return</kbd>.

   *(image in the full Top G Vault)*

    *Selected region filled with Salt material*

### Set sea level

The **Sea Level** tool lets you create a consistent water level or remove all water within a region.

1. Activate the **Sea Level** tool.

   *(image in the full Top G Vault)*

1. Select the intended region by clicking and dragging the **move** draggers and **scale** handles in the 3D viewport. Alternatively, enter values into the tool's **X**/**Y**/**Z** inputs to set a specific position and size.

1. Click the **Evaporate** button to remove water inside the selected region, or click the **Create** button to fill the selected region with water.

   [Video: Sea-Level-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Sea-Level-Tool.mp4)

## Detailed editing

The **Edit** tab also contains tools for precision editing using a "brush" tool to draw, sculpt, smooth, flatten, or paint terrain.

*(image in the full Top G Vault)*

Each tool lets you choose from a **sphere**, **box**, or **cylinder** brush shape and a base size between 1–64 studs.

*(image in the full Top G Vault)*

For tools which use the brush, Studio supports the following keyboard and mouse shortcuts.

| Windows | Mac | Action |
| --- | --- | --- |
| <kbd>Ctrl</kbd> | <kbd>⌘</kbd> | When held down while using the [[30 Official Roblox Docs/Studio/Terrain Editor#Draw\|Draw]] and [[30 Official Roblox Docs/Studio/Terrain Editor#Sculpt\|Sculpt]] tools, toggles on the alternate brush mode. For example, toggles on "subtract" mode instead of the default "add" mode. |
| <kbd>Shift</kbd> | <kbd>Shift</kbd> | When held down while using the [[30 Official Roblox Docs/Studio/Terrain Editor#Draw\|Draw]] and [[30 Official Roblox Docs/Studio/Terrain Editor#Sculpt\|Sculpt]] tools, temporarily activates the [[30 Official Roblox Docs/Studio/Terrain Editor#Smooth\|Smooth]] tool. |
| <kbd>B</kbd> | <kbd>B</kbd> | When held down while dragging the mouse or using the scroll wheel, adjusts the brush's **base size**. |
| <kbd>Ctrl</kbd><kbd>B</kbd> | <kbd>⌘</kbd><kbd>B</kbd> | When held down while dragging the mouse or using the scroll wheel, adjusts the brush's **height**. Only applies if the brush's shape is set to **box** or **cylinder**. |
| <kbd>Shift</kbd><kbd>B</kbd> | <kbd>Shift</kbd><kbd>B</kbd> | When held down while dragging the mouse or using the scroll wheel, adjusts the brush's **strength**. Only applies when using the [[30 Official Roblox Docs/Studio/Terrain Editor#Sculpt\|Sculpt]], [[30 Official Roblox Docs/Studio/Terrain Editor#Smooth\|Smooth]], or [[30 Official Roblox Docs/Studio/Terrain Editor#Flatten\|Flatten]] tool. |
| <kbd>Alt</kbd> | <kbd>⌥</kbd> | When held down on mouse click, shows the material picker. |

### Draw

The **Draw** tool **adds** or **subtracts** terrain using the brush. This tool functions in a dual mode where holding down <kbd>Ctrl</kbd> or <kbd>⌘</kbd> toggles on "subtract" mode instead of the default "add" mode. Additionally, holding down <kbd>Shift</kbd> temporarily activates the [[30 Official Roblox Docs/Studio/Terrain Editor#Smooth|Smooth]] tool.

[Video: Draw-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Draw-Tool.mp4)

### Sculpt

The **Sculpt** tool **adds** or **subtracts** terrain using the brush. Unlike the Draw tool, this tool includes a **strength** slider to allow for more gentle manipulation of terrain.

Similar to the Draw tool, the Sculpt tool functions in a dual mode where holding down <kbd>Ctrl</kbd> or <kbd>⌘</kbd> toggles on "subtract" mode instead of the default "add" mode. Additionally, holding down <kbd>Shift</kbd> temporarily activates the Smooth tool.

[Video: Sculpt-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Sculpt-Tool.mp4)

### Smooth

The **Smooth** tool smoothes out abrupt edges in terrain using the brush. This tool can be used in standalone mode, or you can toggle it on by holding <kbd>Shift</kbd> while using the Draw or Sculpt tools.

[Video: Smooth-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Smooth-Tool.mp4)

### Flatten

The **Flatten** tool flattens terrain to a consistent level across a visualized plane. By default, the tool lowers terrain above the plane **and** raises terrain below to the plane, but you can opt to selectively lower **or** raise through the tool's **Flatten Mode** option.

[Video: Flatten-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Flatten-Tool.mp4)

### Paint

The **Paint** tool, using the brush, **paints** a terrain material over an existing material or **replaces** one material with another material.

[Video: Paint-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Paint-Tool.mp4)

---
*Source: [Environmental terrain](https://create.roblox.com/docs/parts/terrain) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
