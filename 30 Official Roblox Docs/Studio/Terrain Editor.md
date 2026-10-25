---
title: "Terrain Editor"
description: "The Terrain Editor tools generate and sculpt realistic terrain environments such as mountains, bodies of water, grass-covered hills, or a flat desert."
area: "30 Official Roblox Docs"
cluster: "Studio"
source: "https://create.roblox.com/docs/studio/terrain-editor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Terrain Editor tools generate and sculpt realistic terrain environments such as mountains, bodies of water, grass-covered hills, or a flat desert.*

The **Terrain Editor**, accessible from Studio's **Home** tab or **Window** ⟩ **3D** menu, lets you generate and manipulate [[30 Official Roblox Docs/Parts/Environmental terrain|environmental terrain]] through its [[30 Official Roblox Docs/Studio/Terrain Editor#Create tab|Create]] and [[30 Official Roblox Docs/Studio/Terrain Editor#Edit tab|Edit]] toolsets.

*(image in the full Top G Vault)*

> [!success]
> For detailed instructions on working with terrain, see the [[30 Official Roblox Docs/Parts/Environmental terrain|environmental terrain]] guide. To paint up to 62 custom materials onto terrain, see [[30 Official Roblox Docs/Parts/Custom terrain materials|Custom terrain materials]].

## Create tab

The **Create** tab includes the [[30 Official Roblox Docs/Studio/Terrain Editor#Import|Import]], [[30 Official Roblox Docs/Studio/Terrain Editor#Generate|Generate]], and [[30 Official Roblox Docs/Studio/Terrain Editor#Clear|Clear]] tools.

### Import

The **Import** tool imports a [[30 Official Roblox Docs/Parts/Environmental terrain#Heightmaps and colormaps|heightmap]] and optional [[30 Official Roblox Docs/Parts/Environmental terrain#Heightmaps and colormaps|colormap]] and applies them to a selected region.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*Heightmap*

*(image in the full Top G Vault)*

*Colormap*

*(image in the full Top G Vault)*

*Generated terrain*

[Video: Import-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Import-Tool.mp4)

| Selection settings |  |
| --- | --- |
| Size, position, and snapping options as outlined for the [[30 Official Roblox Docs/Studio/Terrain Editor#Select\|Select]] tool. |  |
| **Heightmap settings** |  |
| **Heightmap** | Imports a heightmap from a local image file. |
| **Colormap** | Imports a colormap from a local image file to use alongside a heightmap. |
| **Default Material** | Specifies one consistent material to apply across all of the generated terrain. This is overridden by materials based on the colormap, if imported. |

### Generate

The **Generate** tool procedurally generates terrain within a selected region. This is useful if you want to create a large map and then fine-tune terrain details using the [[30 Official Roblox Docs/Studio/Terrain Editor#Edit tab|Edit]] tab tools.

*(image in the full Top G Vault)*

[Video: Generate-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Generate-Tool.mp4)

| Selection settings |  |
| --- | --- |
| Size, position, and snapping options as outlined for the [[30 Official Roblox Docs/Studio/Terrain Editor#Select\|Select]] tool. |  |
| **Biome settings** |  |
| **Biomes** | Includes the selected biomes in the generated terrain. |
| **Blending** | Adjusts how the biomes blend into one another, with higher values a bit smoother. |
| **Caves** | Includes caves in the generated terrain. |
| **Biome Size** | Sets the size of the biomes within the overall terrain size. |
| **Seed** | A number that Studio generates to determine the shape of the terrain. When you change this number, Studio generates a new terrain with the same settings. |

### Clear

The **Clear** tool reveals a button that clears all terrain within the entire place.

*(image in the full Top G Vault)*

## Edit tab

The **Edit** tab includes the [[30 Official Roblox Docs/Studio/Terrain Editor#Select|Select]], [[30 Official Roblox Docs/Studio/Terrain Editor#Transform|Transform]], [[30 Official Roblox Docs/Studio/Terrain Editor#Fill|Fill]], [[30 Official Roblox Docs/Studio/Terrain Editor#Sea Level|Sea Level]], [[30 Official Roblox Docs/Studio/Terrain Editor#Draw|Draw]], [[30 Official Roblox Docs/Studio/Terrain Editor#Sculpt|Sculpt]], [[30 Official Roblox Docs/Studio/Terrain Editor#Smooth|Smooth]], [[30 Official Roblox Docs/Studio/Terrain Editor#Paint|Paint]], and [[30 Official Roblox Docs/Studio/Terrain Editor#Flatten|Flatten]] tools.

### Select

The **Select** tool is a universal tool for selecting rectangular regions of terrain. With the tool enabled, select a region by clicking and dragging in the 3D viewport, reposition it with the **move** draggers, and edit its size with the **scale** handles. Alternatively, enter values into the tool's **X**/**Y**/**Z** inputs to set a specific position and size.

*(image in the full Top G Vault)*

| Selection settings |  |
| --- | --- |
| **Size** | Sets specific **X**/**Y**/**Z** values for the selection's size, in studs. |
| **Position** | Sets specific **X**/**Y**/**Z** values for the selection's position. |
| **Snap to Voxels** | Snaps the selection bounds to the nearest voxel. |

*(image in the full Top G Vault)*

*Move draggers and scale handles on a selected region*

Studio also supports the following keyboard and mouse shortcuts, assuming the **Select** tool is active and nothing is selected in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy.

| Windows | Mac | Action |
| --- | --- | --- |
| <kbd>Ctrl</kbd><kbd>C</kbd> | <kbd>⌘</kbd><kbd>C</kbd> | Copy terrain within the selected region to the clipboard. |
| <kbd>Ctrl</kbd><kbd>V</kbd> | <kbd>⌘</kbd><kbd>V</kbd> | Paste terrain that has been copied to the clipboard and swap to the [[30 Official Roblox Docs/Studio/Terrain Editor#Transform\|Transform]] tool so that the new terrain can be transformed. |
| <kbd>Ctrl</kbd><kbd>X</kbd> | <kbd>⌘</kbd><kbd>X</kbd> | Cut terrain within the selected region to the clipboard. |
| <kbd>Ctrl</kbd><kbd>D</kbd> | <kbd>⌘</kbd><kbd>D</kbd> | Duplicate terrain within the selected region and swap to the [[30 Official Roblox Docs/Studio/Terrain Editor#Transform\|Transform]] tool so that the new terrain can be transformed. |
| <kbd>Delete</kbd> | <kbd>Delete</kbd> | Delete terrain within the selected region. |
| <kbd>Shift</kbd> | <kbd>Shift</kbd> | When held down while dragging any **scale** handle, scales the region proportionally across all other axes. |
| <kbd>Ctrl</kbd> | <kbd>⌘</kbd> | When held down while dragging any **scale** handle, scales the region equally in both the positive and negative direction along that axis. |

### Transform

The **Transform** tool manipulates entire [[30 Official Roblox Docs/Studio/Terrain Editor#Select|selected]] regions to a new position, size, or orientation. With the tool enabled, transform a selected region with the **move** draggers, **rotate** rings, and **scale** handles. Alternatively, enter values into the tool's **X**/**Y**/**Z** inputs to set a specific position, size, and rotation.

*(image in the full Top G Vault)*

| Transform settings |  |
| --- | --- |
| **Size** | Sets specific **X**/**Y**/**Z** values for the selection's size in studs. |
| **Position** | Sets specific **X**/**Y**/**Z** values for the selection's position. |
| **Rotation** | Sets specific **X**/**Y**/**Z** values for the selection's rotation in degrees. |
| **Merge Empty** | When enabled, air voxels in the selection will overwrite existing voxels at the destination. |
| **Live Edit** | When enabled, terrain is constantly updated while being transformed. To view only a wireframe preview of the transformation, disable live edit mode and then, while transforming, press <kbd>Enter</kbd>/<kbd>Return</kbd> or click the **Apply** button to apply the changes. |
| **Snap to Voxels** | Snaps the selection bounds to the nearest voxel. |

*(image in the full Top G Vault)*

*Move draggers, rotate rings, and scale handles on a selected region*

> [!warning]
> Before rotating a region with the visual **rotate** rings, check the rotation snapping setting in Studio's toolbar. Disable rotation snapping entirely for free-form rotation.

> [!info]
> Similar to [[30 Official Roblox Docs/Studio/Terrain Editor#Select|selecting]] a region, holding <kbd>Shift</kbd> while dragging any **scale** handle scales the region proportionally across all other axes, and holding <kbd>Ctrl</kbd> or <kbd>⌘</kbd> while dragging scales the region equally in both the positive and negative direction along that axis.

### Fill

The **Fill** tool fills an entire [[30 Official Roblox Docs/Studio/Terrain Editor#Select|selected]] region with a specific material, or replaces all material within the region with another material.

*(image in the full Top G Vault)*

| Selection settings |  |
| --- | --- |
| Size, position, and snapping options as outlined for the [[30 Official Roblox Docs/Studio/Terrain Editor#Select\|Select]] tool. |  |
| **Material settings** |  |
| **Fill Mode** | Toggles the tool between **Fill** and **Replace** mode. |
| **Source Material** | In **Fill** mode, the desired fill material. In **Replace** mode, the material to replace. |
| **Target Material** | In **Replace** mode, the material to replace the source material with. |

*(image in the full Top G Vault)*

*Selected region filled with Salt material*

### Sea Level

The **Sea Level** tool lets you create a consistent water level or remove all water within a region.

*(image in the full Top G Vault)*

[Video: Sea-Level-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Sea-Level-Tool.mp4)

| Sea level settings |  |
| --- | --- |
| **Size** | Sets specific **X**/**Y**/**Z** values for the selection's size in studs. |
| **Position** | Sets specific **X**/**Y**/**Z** values for the selection's position. |
| **Snap to Voxels** | Snaps the selection bounds to the nearest voxel. |

### Draw

The **Draw** tool **adds** or **subtracts** terrain using the brush. This tool functions in a dual mode where holding down <kbd>Ctrl</kbd> or <kbd>⌘</kbd> toggles on "subtract" mode instead of the default "add" mode. Additionally, holding down <kbd>Shift</kbd> temporarily activates the [[30 Official Roblox Docs/Studio/Terrain Editor#Smooth|Smooth]] tool.

*(image in the full Top G Vault)*

[Video: Draw-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Draw-Tool.mp4)

| Brush settings |  |
| --- | --- |
| **Brush Mode** | Toggles the tool between **Add** and **Subtract** mode. Also toggled by holding down <kbd>Ctrl</kbd> or <kbd>⌘</kbd>. |
| **Brush Shape** | Sets the brush shape to either a **sphere**, **box**, or **cylinder**.<br>*(image in the full Top G Vault)* |
| **Brush Size** | Sets the brush size from 1 to 64. If you choose a brush shape of **box** or **cylinder**, a **Height** slider/input also appears to adjust the brush height proportionally or independently of the base size. |
| **Pivot Position** | Sets the vertical pivot point of the brush to either the bottom, center, or top of where the brush connects with existing terrain. |
| **Snapping** | Whether snapping is off or to the nearest voxel. |
| **Plane Lock** | Toggles whether to enable a visual plane which the brush locks to. In **Auto** mode, the plane tilts and rotates with the camera. In **Manual** mode, the **Edit Plane** option appears, letting you set a specific position/orientation through the visual draggers or **X**/**Y**/**Z** inputs. |
| **Ignore Water** | Ignores water when adding or subtracting terrain. |
| **Ignore Parts** | Ignores [[30 Official Roblox Docs/Parts/Parts\|parts]] in regards to brush placement while moving the mouse pointer across part surfaces. |
| **Material settings** |  |
| **Auto Material** | Uses the same terrain material in the brush's vicinity when adding new terrain. |
| **Source Material** | Sets the [[30 Official Roblox Docs/Parts/Environmental terrain#Terrain materials\|material]] for **Add** mode. |

### Sculpt

The **Sculpt** tool **adds** or **subtracts** terrain using the brush. Unlike the [[30 Official Roblox Docs/Studio/Terrain Editor#Draw|Draw]] tool, this tool includes a **strength** slider/input to allow for more gentle manipulation of terrain. This tool functions in a dual mode where holding down <kbd>Ctrl</kbd> or <kbd>⌘</kbd> toggles on "subtract" mode instead of the default "add" mode, and holding down <kbd>Shift</kbd> temporarily activates the [[30 Official Roblox Docs/Studio/Terrain Editor#Smooth|Smooth]] tool.

*(image in the full Top G Vault)*

[Video: Sculpt-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Sculpt-Tool.mp4)

| Option | Description |
| --- | --- |
| **Brush Mode** | Toggles the tool between **Add** and **Subtract** mode. Also toggled by holding down <kbd>Ctrl</kbd> or <kbd>⌘</kbd>. |
| **Brush Shape** | Sets the brush shape to either a **sphere**, **box**, or **cylinder**.<br>*(image in the full Top G Vault)* |
| **Brush Size** | Sets the brush size from 1 to 64. If you choose a brush shape of **box** or **cylinder**, a **Height** slider/input also appears to adjust the brush height proportionally or independently of the base size. |
| **Strength** | Sets the brush strength from 0.1 to 1. |
| **Plane Lock** | Toggles whether to enable a visual plane which the brush locks to. In **Auto** mode, the plane tilts and rotates with the camera. In **Manual** mode, the **Edit Plane** option appears, letting you set a specific position/orientation through the visual draggers or **X**/**Y**/**Z** inputs. |
| **Ignore Water** | Ignores water when adding or subtracting terrain. |
| **Ignore Parts** | Ignores [[30 Official Roblox Docs/Parts/Parts\|parts]] in regards to brush placement while moving the mouse pointer across part surfaces. |
| **Auto Material** | Uses the same terrain material in the brush's vicinity when adding new terrain. |
| **Source Material** | Sets the [[30 Official Roblox Docs/Parts/Environmental terrain#Terrain materials\|material]] for **Add** mode. |

### Smooth

The **Smooth** tool smoothes out abrupt edges in terrain using the brush. This tool can be used in standalone mode, or you can toggle it on by holding <kbd>Shift</kbd> while using the [[30 Official Roblox Docs/Studio/Terrain Editor#Draw|Draw]] or [[30 Official Roblox Docs/Studio/Terrain Editor#Sculpt|Sculpt]] tools.

*(image in the full Top G Vault)*

[Video: Smooth-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Smooth-Tool.mp4)

| Option | Description |
| --- | --- |
| **Brush Shape** | Sets the brush shape to either a **sphere**, **box**, or **cylinder**.<br>*(image in the full Top G Vault)* |
| **Brush Size** | Sets the brush size from 1 to 64. If you choose a brush shape of **box** or **cylinder**, a **Height** slider/input also appears to adjust the brush height proportionally or independently of the base size. |
| **Strength** | Sets the brush strength from 0.1 to 1. |
| **Pivot Position** | Sets the vertical pivot point of the brush to either the bottom, center, or top of where the brush connects with existing terrain. |
| **Snapping** | Whether snapping is off or to the nearest voxel. |
| **Plane Lock** | Toggles whether to enable a visual plane which the brush locks to. In **Auto** mode, the plane tilts and rotates with the camera. In **Manual** mode, the **Edit Plane** option appears, letting you set a specific position/orientation through the visual draggers or **X**/**Y**/**Z** inputs. |
| **Ignore Water** | Ignores water when smoothing terrain. |
| **Ignore Parts** | Ignores [[30 Official Roblox Docs/Parts/Parts\|parts]] in regards to brush placement while moving the mouse pointer across part surfaces. |

### Paint

The **Paint** tool, using the brush, **paints** a terrain [[30 Official Roblox Docs/Parts/Environmental terrain#Terrain materials|material]] over an existing material or **replaces** one material with another material.

*(image in the full Top G Vault)*

[Video: Paint-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Paint-Tool.mp4)

| Option | Description |
| --- | --- |
| **Brush Shape** | Sets the brush shape to either a **sphere**, **box**, or **cylinder**.<br>*(image in the full Top G Vault)* |
| **Brush Size** | Sets the brush size from 1 to 64. If you choose a brush shape of **box** or **cylinder**, a **Height** slider/input also appears to adjust the brush height proportionally or independently of the base size. |
| **Pivot Position** | Sets the vertical pivot point of the brush to either the bottom, center, or top of where the brush connects with existing terrain. |
| **Snapping** | Whether snapping is off or to the nearest voxel. |
| **Plane Lock** | Toggles whether to enable a visual plane which the brush locks to. In **Auto** mode, the plane tilts and rotates with the camera. In **Manual** mode, the **Edit Plane** option appears, letting you set a specific position/orientation through the visual draggers or **X**/**Y**/**Z** inputs. |
| **Ignore Water** | Ignores water when flattening terrain. |
| **Ignore Parts** | Ignores [[30 Official Roblox Docs/Parts/Parts\|parts]] in regards to brush placement while moving the mouse pointer across part surfaces. |
| **Material Mode** | Toggles the tool between **Paint** and **Replace** mode. In **Paint** mode, choose the desired painting material from the tool's picker tiles. In **Replace** mode, choose both the **source** material to replace and the **target** material to replace it with. |

### Flatten

The **Flatten** tool flattens terrain to a consistent level across a visualized plane. By default, the tool lowers terrain above the plane **and** raises terrain below to the plane, but you can opt to selectively lower **or** raise through the tool's **Flatten Mode** option.

*(image in the full Top G Vault)*

[Video: Flatten-Tool.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/terrain-editor/Flatten-Tool.mp4)

| Option | Description |
| --- | --- |
| **Brush Shape** | Sets the brush shape to either a **sphere**, **box**, or **cylinder**.<br>*(image in the full Top G Vault)* |
| **Flatten Mode** | **Erode to Flat**¹ flattens terrain above the plane. **Grow to Flat**² fills in terrain below the plane. **Flatten All**³ removes terrain above the plane and fills in terrain below the plane.<br>*(image in the full Top G Vault)* |
| **Brush Size** | Sets the brush size from 1 to 64. If you choose a brush shape of **box** or **cylinder**, a **Height** slider/input also appears to adjust the brush height proportionally or independently of the base size. |
| **Strength** | Sets the brush strength from 0.1 to 1. |
| **Pivot Position** | Sets the vertical pivot point of the brush to either the bottom, center, or top of where the brush connects with existing terrain. |
| **Snapping** | Whether snapping is off or to the nearest voxel. |
| **Flatten Plane** | If set to **Fixed**, flattens terrain to a fixed visual plane in **Y** world space. |
| **Ignore Water** | Ignores water when flattening terrain. |
| **Ignore Parts** | Ignores [[30 Official Roblox Docs/Parts/Parts\|parts]] in regards to brush placement while moving the mouse pointer across part surfaces. |

## Studio shortcuts

For tools which use the **brush** ([[30 Official Roblox Docs/Studio/Terrain Editor#Draw|Draw]], [[30 Official Roblox Docs/Studio/Terrain Editor#Sculpt|Sculpt]], [[30 Official Roblox Docs/Studio/Terrain Editor#Smooth|Smooth]], [[30 Official Roblox Docs/Studio/Terrain Editor#Flatten|Flatten]], [[30 Official Roblox Docs/Studio/Terrain Editor#Paint|Paint]]), Studio supports the following keyboard and mouse shortcuts.

| Windows | Mac | Action |
| --- | --- | --- |
| <kbd>Ctrl</kbd> | <kbd>⌘</kbd> | When held down while using the [[30 Official Roblox Docs/Studio/Terrain Editor#Draw\|Draw]] and [[30 Official Roblox Docs/Studio/Terrain Editor#Sculpt\|Sculpt]] tools, toggles on the alternate brush mode. For example, toggles on "subtract" mode instead of the default "add" mode. |
| <kbd>Shift</kbd> | <kbd>Shift</kbd> | When held down while using the [[30 Official Roblox Docs/Studio/Terrain Editor#Draw\|Draw]] and [[30 Official Roblox Docs/Studio/Terrain Editor#Sculpt\|Sculpt]] tools, temporarily activates the [[30 Official Roblox Docs/Studio/Terrain Editor#Smooth\|Smooth]] tool. |
| <kbd>B</kbd> | <kbd>B</kbd> | When held down while dragging the mouse or using the scroll wheel, adjusts the brush's **base size**. |
| <kbd>Ctrl</kbd><kbd>B</kbd> | <kbd>⌘</kbd><kbd>B</kbd> | When held down while dragging the mouse or using the scroll wheel, adjusts the brush's **height**. Only applies if the brush's shape is set to **box** or **cylinder**. |
| <kbd>Shift</kbd><kbd>B</kbd> | <kbd>Shift</kbd><kbd>B</kbd> | When held down while dragging the mouse or using the scroll wheel, adjusts the brush's **strength**. Only applies when using the [[30 Official Roblox Docs/Studio/Terrain Editor#Sculpt\|Sculpt]], [[30 Official Roblox Docs/Studio/Terrain Editor#Smooth\|Smooth]], or [[30 Official Roblox Docs/Studio/Terrain Editor#Flatten\|Flatten]] tool. |
| <kbd>Alt</kbd> | <kbd>⌥</kbd> | When held down on mouse click, shows the material picker. |

---
*Source: [Terrain Editor](https://create.roblox.com/docs/studio/terrain-editor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
