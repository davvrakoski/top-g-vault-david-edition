---
title: "Terrain"
description: "`Terrain` lets you to create dynamically morphable environments."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Terrain"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*`Terrain` lets you to create dynamically morphable environments.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

The `Terrain` class lets you create dynamically morphable environments. It is based on a 4×4×4 grid of cells, where each cell has a number between `0` and `1` representing how much the geometry should occupy the cell, and the material of the cell. The occupancy determines how the cell will morph together with surrounding cells, and the result is the illusion of having no grid constraint.

For more information, see [[30 Official Roblox Docs/Parts/Environmental terrain|Terrain]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#Decoration\|Decoration]] | boolean | Enables or disables terrain decoration. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#GrassLength\|GrassLength]] | float | Specifies the length of animated grass. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#IsSmooth\|IsSmooth]] | boolean | **Deprecated.** Returns `true` if the game is using the smooth terrain system. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#MaterialColors\|MaterialColors]] | BinaryString | Represents the editor for the **Material Color** feature and cannot be edited by scripts. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#MaxExtents\|MaxExtents]] | [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16\|Region3int16]] | Displays the boundaries of the largest possible editable region. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#WaterColor\|WaterColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The tint of `Terrain` water. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#WaterReflectance\|WaterReflectance]] | float | Controls how opaque `Terrain` water reflections are. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#WaterTransparency\|WaterTransparency]] | float | The transparency of `Terrain` water. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#WaterWaveSize\|WaterWaveSize]] | float | Sets the maximum height of `Terrain` water waves in studs. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#WaterWaveSpeed\|WaterWaveSpeed]] | float | Sets how many times `Terrain` water waves will move up and down per minute. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#AutowedgeCell\|AutowedgeCell()]] | boolean | **Deprecated.** Obsolete function which no longer does anything. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#AutowedgeCells\|AutowedgeCells()]] | () | **Deprecated.** Obsolete function which no longer does anything. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#CellCenterToWorld\|CellCenterToWorld()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the world position of the center of the terrain cell. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#CellCornerToWorld\|CellCornerToWorld()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the position of the lower-left-forward corner of the grid cell. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#Clear\|Clear()]] | () | Clears all terrain. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#ConvertToSmooth\|ConvertToSmooth()]] | () | **Deprecated.** Transforms the legacy terrain engine into the new terrain engine. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#CopyRegion\|CopyRegion()]] | [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion\|TerrainRegion]] | Stores a chunk of terrain into a [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion\|TerrainRegion]] object so it can be loaded back later. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#CountCells\|CountCells()]] | int | Returns the number of non-empty cells in the terrain. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#FillBall\|FillBall()]] | () | Fills a ball of smooth terrain in a given space. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#FillBlock\|FillBlock()]] | () | Fills a block of smooth terrain with a given location, rotation, size, and material. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#FillCylinder\|FillCylinder()]] | () | Fills a cylinder of smooth terrain in a given space. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#FillRegion\|FillRegion()]] | () | Fills a [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] space with smooth terrain. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#FillWedge\|FillWedge()]] | () | Fills a wedge-shaped volume of terrain with the given [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#GetCell\|GetCell()]] | Tuple | **Deprecated.** Returns the closest cell material from the legacy terrain engine that matches the smooth terrain voxel specified. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#GetMaterialColor\|GetMaterialColor()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Returns current terrain material color for specified terrain material. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#GetWaterCell\|GetWaterCell()]] | Tuple | **Deprecated.** Returns `true` if the cell is a water cell. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#PasteRegion\|PasteRegion()]] | () | Applies a chunk of terrain to the `Terrain` object. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#ReadVoxelChannels\|ReadVoxelChannels()]] | Dictionary | Returns a region of terrain voxel data in table format based on the channel names. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#ReadVoxels\|ReadVoxels()]] | Tuple | Returns a certain region of smooth terrain in table format. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#ReplaceMaterial\|ReplaceMaterial()]] | () | Replaces the terrain of a material within a region with another material. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#SetCell\|SetCell()]] | () | **Deprecated.** Sets the occupancy and material of a specific terrain voxel. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#SetCells\|SetCells()]] | () | **Deprecated.** Sets the occupancy and material of all terrain voxels in a specific region. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#SetMaterialColor\|SetMaterialColor()]] | () | Sets current terrain material color for specified terrain material. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#SetWaterCell\|SetWaterCell()]] | () | **Deprecated.** Sets the specified terrain voxel's material to water and sets its occupancy to `1`. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#WorldToCell\|WorldToCell()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the grid cell location that contains the position point. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#WorldToCellPreferEmpty\|WorldToCellPreferEmpty()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the grid cell location that contains the position point, preferring empty grid cells when position is on a grid edge. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#WorldToCellPreferSolid\|WorldToCellPreferSolid()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the grid cell location that contains the point position, preferring non-empty grid cells when position is on a grid edge. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#WriteVoxelChannels\|WriteVoxelChannels()]] | () | Sets a region of terrain using a dictionary of voxel channel data. |
| [[30 Official Roblox Docs/API Reference/Classes/Terrain#WriteVoxels\|WriteVoxels()]] | () | Sets a certain region of smooth terrain using table format. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Decoration

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment · **Tags:** `NotScriptable`

Currently enables or disables animated grass on the [[30 Official Roblox Docs/API Reference/Enums/Material|Grass]] terrain material, although future modifications of this property may control additional decorative features.

### GrassLength

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment · **Tags:** `NotScriptable`

Specifies the length of animated grass on the [[30 Official Roblox Docs/API Reference/Enums/Material|Grass]] terrain material, assuming [[30 Official Roblox Docs/API Reference/Classes/Terrain#Decoration|Decoration]] is enabled. Valid values are between `0.1` and `1`.

### IsSmooth

> [!warning] Deprecated
> The legacy terrain engine has been removed, so this property will always
> be `true`.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Environment · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

Returns `true` if the game is using the smooth terrain system.

### MaterialColors

**Type:** BinaryString

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment · **Tags:** `NotScriptable`

`MaterialColors` represents the editor for the **Material Color** feature and cannot be edited by scripts.

To get the color of a material, use [[30 Official Roblox Docs/API Reference/Classes/Terrain#GetMaterialColor|Terrain:GetMaterialColor()]]. To set the color of a material, use [[30 Official Roblox Docs/API Reference/Classes/Terrain#SetMaterialColor|Terrain:SetMaterialColor()]].

### MaxExtents

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16|Region3int16]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Environment · **Tags:** `ReadOnly`, `NotReplicated`

Displays the boundaries of the largest possible editable region as a [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16|Region3int16]]. The returned value spans from `(-32000, -32000, -32000)` to `(32000, 32000, 32000)` in cell coordinates, where each cell is 4 studs wide. This corresponds to a world-space volume of -128,000 to 128,000 studs on each axis. The property is read-only.

### WaterColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The tint color applied to `Terrain` water. This [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] value is blended with the water's base appearance to shift its overall hue. The default value is `[0.05, 0.33, 0.36]` (a dark teal).

### WaterReflectance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

Controls how opaque the reflections on `Terrain` water are, on a scale of `0` (no reflections) to `1` (fully opaque reflections). The default value is `1`.

### WaterTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

The transparency of `Terrain` water, on a scale of `0` (fully opaque) to `1` (fully transparent). The default value is `0.3`.

### WaterWaveSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

Sets the maximum height of `Terrain` water waves in studs. This is currently constrained to between `0` and `1`.

### WaterWaveSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Environment

Sets how many times `Terrain` water waves will move up and down per minute. This is currently constrained to between `0` and `100`.

## Methods

### AutowedgeCell

> [!warning] Deprecated
> This item is a deprecated function of a legacy `Class.Terrain` engine that
> has been removed. Do not use it for new work.

```lua
Terrain:AutowedgeCell(x: int, y: int, z: int): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Environment · **Tags:** `Deprecated`

Obsolete function which no longer does anything.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The X coordinate of the terrain cell. |
| `y` | int |  | The Y coordinate of the terrain cell. |
| `z` | int |  | The Z coordinate of the terrain cell. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Always returns `true`; the function no longer performs any operation. |

### AutowedgeCells

> [!warning] Deprecated
> This item is a deprecated function of a legacy `Class.Terrain` engine that
> has been removed. Do not use it for new work.

```lua
Terrain:AutowedgeCells(region: Region3int16): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment · **Tags:** `Deprecated`

Obsolete function which no longer does anything. It was part of the legacy terrain engine that has since been removed, so calling it on a region has no effect.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16\|Region3int16]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16\|Region3int16]] specifying the region of terrain cells to process. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### CellCenterToWorld

```lua
Terrain:CellCenterToWorld(x: int, y: int, z: int): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Returns the world position of the center of the terrain cell at grid coordinates `(x, y, z)`. Each terrain cell is 4×4×4 studs, so this method returns the position of the lower-left-forward corner of the cell plus an offset of `(2, 2, 2)` studs.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The X coordinate of the terrain cell in grid space. |
| `y` | int |  | The Y coordinate of the terrain cell in grid space. |
| `z` | int |  | The Z coordinate of the terrain cell in grid space. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The world-space [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] position at the center of the specified cell. |

### CellCornerToWorld

```lua
Terrain:CellCornerToWorld(x: int, y: int, z: int): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Returns the world position of the lower-left-forward corner of the terrain cell at grid coordinates `(x, y, z)`. Each terrain cell is 4×4×4 studs, so the corner position is `(x * 4, y * 4, z * 4)`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The X coordinate of the terrain cell in grid space. |
| `y` | int |  | The Y coordinate of the terrain cell in grid space. |
| `z` | int |  | The Z coordinate of the terrain cell in grid space. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The world-space [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] position of the lower-left-forward corner of the specified cell. |

### Clear

```lua
Terrain:Clear(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Clears the entire terrain, removing all material and occupancy data from every voxel. After calling this method, the `Terrain` object contains no geometry until new terrain is written via methods such as [[30 Official Roblox Docs/API Reference/Classes/Terrain#FillBlock|FillBlock()]] or [[30 Official Roblox Docs/API Reference/Classes/Terrain#WriteVoxels|WriteVoxels()]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ConvertToSmooth

> [!warning] Deprecated
> Since all places now automatically use the new terrain engine, this method
> is obsolete.

```lua
Terrain:ConvertToSmooth(): ()
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** Environment · **Tags:** `Deprecated`

Transforms the legacy terrain engine into the new terrain engine. All places now automatically use the new terrain engine, so this method is obsolete.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### CopyRegion

```lua
Terrain:CopyRegion(region: Region3int16): TerrainRegion
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Stores a chunk of terrain into a [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion|TerrainRegion]] object so it can be loaded back later. Note that [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion|TerrainRegion]] data does not replicate between server and client.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16\|Region3int16]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16\|Region3int16]] defining the area of terrain to copy, in cell coordinates. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion\|TerrainRegion]] | A [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion\|TerrainRegion]] containing the copied voxel data from the specified region. |

*Code samples for this member (`Terrain-CopyRegion1`) are published on the source page; their code is not part of the open-source repo.*

### CountCells

```lua
Terrain:CountCells(): int
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Returns the approximate number of non-empty cells in the terrain. A cell is considered non-empty when it has a material other than Air and an occupancy greater than zero. This count is an approximation and can be used to quickly gauge how much terrain geometry exists in the place.

**Returns**

| Type | Description |
| --- | --- |
| int | The approximate number of non-empty terrain cells. |

### FillBall

```lua
Terrain:FillBall(center: Vector3, radius: float, material: Material): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Fills a spherical volume of smooth terrain centered at `center` with the given `radius` (in studs) and [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]]. Voxels within the sphere are set to full occupancy with the specified material. Existing terrain inside the sphere is overwritten.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `center` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The position of the center of the terrain ball. |
| `radius` | float |  | The radius in studs of the terrain ball. |
| `material` | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] of the terrain ball. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### FillBlock

```lua
Terrain:FillBlock(cframe: CFrame, size: Vector3, material: Material): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Fills an oriented rectangular volume of smooth terrain at the position and rotation specified by `cframe`, with the dimensions given by `size` (in studs), using the specified [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]]. Because the block is oriented by a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], it can be rotated to any angle. Existing terrain inside the volume is overwritten.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `cframe` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The position and orientation of the terrain block. |
| `size` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The size in studs of the square block (both the height and width). |
| `material` | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] of the terrain block. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### FillCylinder

```lua
Terrain:FillCylinder(cframe: CFrame, height: float, radius: float, material: Material): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Fills a cylinder of smooth terrain in a given space. The space is defined using a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], height, and radius.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `cframe` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The position and orientation of the terrain cylinder. |
| `height` | float |  | The height in studs of the terrain cylinder. |
| `radius` | float |  | The radius in studs of the terrain cylinder. |
| `material` | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] of the terrain cylinder. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### FillRegion

```lua
Terrain:FillRegion(region: Region3, resolution: float, material: Material): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Fills an axis-aligned [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] volume of smooth terrain with the specified [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]] at full occupancy. The `resolution` parameter must be exactly `4`. The region must be aligned to the voxel grid; use [[30 Official Roblox Docs/API Reference/Datatypes/Region3#ExpandToGrid|Region3:ExpandToGrid()]] to align a region before calling.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] to fill, which must be aligned to the voxel grid. |
| `resolution` | float |  | The voxel resolution; must be exactly `4`. |
| `material` | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] to fill the region with. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### FillWedge

```lua
Terrain:FillWedge(cframe: CFrame, size: Vector3, material: Material): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment

This method fills a wedge-shaped volume of [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] with the given [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]] and the area's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] and size. The orientation of the wedge is the same as an equivalent [[30 Official Roblox Docs/API Reference/Classes/WedgePart|WedgePart]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `cframe` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] |  | The position and orientation of the wedge to fill. |
| `size` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The size of the wedge to fill. |
| `material` | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] |  | The material with which the wedge will be filled. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetCell

> [!warning] Deprecated
> This item is a deprecated function of a legacy `Class.Terrain` engine that
> has been removed. Do not use it for new work.

```lua
Terrain:GetCell(x: int, y: int, z: int): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Environment · **Tags:** `Deprecated`

Returns the closest cell material from the legacy terrain engine that matches the smooth terrain voxel specified.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The X coordinate of the terrain cell. |
| `y` | int |  | The Y coordinate of the terrain cell. |
| `z` | int |  | The Z coordinate of the terrain cell. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing the legacy cell material, block type, and orientation of the specified cell. |

### GetMaterialColor

```lua
Terrain:GetMaterialColor(material: Material): Color3
```

**Thread safety:** Safe · **Capabilities:** Environment

Returns the current [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] color for the specified terrain [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]]. This color represents the tint applied to the material's base texture. Passing [[30 Official Roblox Docs/API Reference/Enums/Material|Air]] or [[30 Official Roblox Docs/API Reference/Enums/Material|Water]] throws an error because those materials do not support custom colors.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] whose terrain color to retrieve. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | The [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] representing the current color tint of the specified material. |

### GetWaterCell

> [!warning] Deprecated
> This item is a deprecated function of a legacy `Class.Terrain` engine that
> has been removed. Do not use it for new work.

```lua
Terrain:GetWaterCell(x: int, y: int, z: int): Tuple
```

**Thread safety:** Unsafe · **Capabilities:** Environment · **Tags:** `Deprecated`

Returns `true` if the cell is a water cell.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The X coordinate of the terrain cell. |
| `y` | int |  | The Y coordinate of the terrain cell. |
| `z` | int |  | The Z coordinate of the terrain cell. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | A tuple containing whether the cell has water, the water force, and the water direction. |

### PasteRegion

```lua
Terrain:PasteRegion(region: TerrainRegion, corner: Vector3int16, pasteEmptyCells: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Applies a chunk of terrain to the `Terrain` object. Note that [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion|TerrainRegion]] data does not replicate between server and client.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion\|TerrainRegion]] |  | The [[30 Official Roblox Docs/API Reference/Classes/TerrainRegion\|TerrainRegion]] to paste, previously obtained from [[30 Official Roblox Docs/API Reference/Classes/Terrain#CopyRegion\|Terrain:CopyRegion()]]. |
| `corner` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Vector3int16\|Vector3int16]] cell coordinate at which to place the lower-left-forward corner of the region. |
| `pasteEmptyCells` | boolean |  | Whether to overwrite existing terrain with empty (air) cells from the region. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Terrain-PasteRegion1`) are published on the source page; their code is not part of the open-source repo.*

### ReadVoxelChannels

```lua
Terrain:ReadVoxelChannels(region: Region3, resolution: float, channelIds: Array): Dictionary
```

**Thread safety:** Safe · **Capabilities:** Environment · **Tags:** `CustomLuaState`

Returns voxel data from a region of terrain, separated by channel. Unlike [[30 Official Roblox Docs/API Reference/Classes/Terrain#ReadVoxels|ReadVoxels()]], this method lets you specify exactly which channels to read (`SolidMaterial`, `SolidOccupancy`, and/or `LiquidOccupancy`), and returns a dictionary keyed by channel ID. The `region` must be aligned to the voxel grid, `resolution` must be `4`, and the region cannot exceed 4,194,304 voxels.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] |  | Target region to read from. Must be aligned to the voxel grid. Will throw an error if region is too large; limit is currently 4194304 voxels³. |
| `resolution` | float |  | Voxel resolution. Must be 4. |
| `channelIds` | Array |  | Array of channel IDs (strings) that need to be accessed from the voxel data. Each channel ID represents a type of data that's stored in voxel. Current supported IDs are `{"SolidMaterial", "SolidOccupancy", "LiquidOccupancy"}`. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | Returns voxel data as a dictionary based on the `channelIds` input. Keys represent each channel ID with their respective value as an array of 3D data.<br><br>- `SolidMaterial` — The [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] material of the voxel. Note that [[30 Official Roblox Docs/API Reference/Enums/Material\|Water]] is not supported anymore; instead, a voxel that contains water will have a value of `LiquidOccupancy`. - `SolidOccupancy` — The occupancy of the voxel's material as specified in the `SolidMaterial` channel. This is a value between 0 (empty) and 1 (full). - `LiquidOccupancy` — Specifies the occupancy of the [[30 Official Roblox Docs/API Reference/Enums/Material\|Water]] material in a voxel as a value between 0 (no water) and 1 (full of water). If the `SolidOccupancy` is 1 and the `SolidMaterial` is not [[30 Official Roblox Docs/API Reference/Enums/Material\|Air]], this will be 0.<br><br>The dictionary also contains a `Size` key with a value representing the 3D array size of each channel data. |

*Code samples for this member (`terrain-readvoxelchannels-code-example`) are published on the source page; their code is not part of the open-source repo.*

### ReadVoxels

```lua
Terrain:ReadVoxels(region: Region3, resolution: float): Tuple
```

**Thread safety:** Safe · **Capabilities:** Environment · **Tags:** `CustomLuaState`

Returns the voxel data for a region of smooth terrain as two 3D arrays: `materials` (an array of [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]] values) and `occupancies` (an array of numbers between `0` and `1`). The `region` must be aligned to the voxel grid, `resolution` must be `4`, and the region cannot exceed 4,194,304 voxels. For more granular channel control, see [[30 Official Roblox Docs/API Reference/Classes/Terrain#ReadVoxelChannels|ReadVoxelChannels()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] |  | Target region to read from. Must be aligned to the voxel grid. Will throw an error if region is too large. The limit is currently 4194304 voxels³. |
| `resolution` | float |  | Voxel resolution. Must be `4`. |

**Returns**

| Type | Description |
| --- | --- |
| Tuple | Returns raw voxel data as two 3D arrays.<br><br>- `materials` - 3D array of [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] from the target area. Also contains a Size field, equal to the dimensions of the nested arrays. - `occupancies` - 3D array of occupancy values from the target area. Also contains a Size field, equal to the dimensions of the nested arrays. |

*Code samples for this member (`terrain-readvoxels-code-example`) are published on the source page; their code is not part of the open-source repo.*

### ReplaceMaterial

```lua
Terrain:ReplaceMaterial(region: Region3, resolution: float, sourceMaterial: Material, targetMaterial: Material): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment

ReplaceMaterial replaces terrain of a certain [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]] within a [[30 Official Roblox Docs/API Reference/Datatypes/Region3|Region3]] with another material. Essentially, it is a find-and-replace operation on [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] materials.

When calling this method, the `resolution` parameter must be exactly `4`. Additionally, `region` must be aligned to the terrain materials grid, such that the components of the region's minimum and maximum points must be divisible by `4`. Use [[30 Official Roblox Docs/API Reference/Datatypes/Region3#ExpandToGrid|Region3:ExpandToGrid()]] to make a region compatible with this function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] |  | The region in which the replacement operation will occur. |
| `resolution` | float |  | The resolution at which the replacement operation will take place; at the moment this must be exactly `4`. |
| `sourceMaterial` | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] |  | The old material that shall be replaced. |
| `targetMaterial` | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] |  | The new material. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`terrain-replacematerial`) are published on the source page; their code is not part of the open-source repo.*

### SetCell

> [!warning] Deprecated
> This item is a deprecated function of a legacy `Class.Terrain` engine that
> has been removed. Do not use it for new work.

```lua
Terrain:SetCell(x: int, y: int, z: int, material: CellMaterial, block: CellBlock, orientation: CellOrientation): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment · **Tags:** `Deprecated`

Sets the occupancy of the specified terrain voxel to `1` and sets its material to the closest smooth terrain material that matches the cell material.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The X coordinate of the terrain cell. |
| `y` | int |  | The Y coordinate of the terrain cell. |
| `z` | int |  | The Z coordinate of the terrain cell. |
| `material` | [[30 Official Roblox Docs/API Reference/Enums/CellMaterial\|CellMaterial]] |  | The [[30 Official Roblox Docs/API Reference/Enums/CellMaterial\|Enum.CellMaterial]] to set for the cell. |
| `block` | [[30 Official Roblox Docs/API Reference/Enums/CellBlock\|CellBlock]] |  | The [[30 Official Roblox Docs/API Reference/Enums/CellBlock\|Enum.CellBlock]] shape type for the cell. |
| `orientation` | [[30 Official Roblox Docs/API Reference/Enums/CellOrientation\|CellOrientation]] |  | The [[30 Official Roblox Docs/API Reference/Enums/CellOrientation\|Enum.CellOrientation]] rotation for the cell. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetCells

> [!warning] Deprecated
> This item is a deprecated function of a legacy `Class.Terrain` engine that
> has been removed. Do not use it for new work.

```lua
Terrain:SetCells(region: Region3int16, material: CellMaterial, block: CellBlock, orientation: CellOrientation): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment · **Tags:** `Deprecated`

Sets the occupancy of all terrain voxels in the specified region to `1` and sets their materials to the closest smooth terrain material that matches the cell material.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16\|Region3int16]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Region3int16\|Region3int16]] specifying the area of terrain cells to set. |
| `material` | [[30 Official Roblox Docs/API Reference/Enums/CellMaterial\|CellMaterial]] |  | The [[30 Official Roblox Docs/API Reference/Enums/CellMaterial\|Enum.CellMaterial]] to apply to all cells in the region. |
| `block` | [[30 Official Roblox Docs/API Reference/Enums/CellBlock\|CellBlock]] |  | The [[30 Official Roblox Docs/API Reference/Enums/CellBlock\|Enum.CellBlock]] shape type to apply to all cells in the region. |
| `orientation` | [[30 Official Roblox Docs/API Reference/Enums/CellOrientation\|CellOrientation]] |  | The [[30 Official Roblox Docs/API Reference/Enums/CellOrientation\|Enum.CellOrientation]] rotation to apply to all cells in the region. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetMaterialColor

```lua
Terrain:SetMaterialColor(material: Material, value: Color3): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Sets current terrain material color for specified terrain material. Terrain material will shift its base color toward specified color.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] |  | The [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] whose terrain color to change. |
| `value` | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] |  | The [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] to apply as the new color tint for the material. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetWaterCell

> [!warning] Deprecated
> This item is a deprecated function of a legacy `Class.Terrain` engine that
> has been removed. Do not use it for new work.

```lua
Terrain:SetWaterCell(x: int, y: int, z: int, force: WaterForce, direction: WaterDirection): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment · **Tags:** `Deprecated`

Sets the specified terrain voxel's material to water and sets its occupancy to `1`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `x` | int |  | The X coordinate of the terrain cell. |
| `y` | int |  | The Y coordinate of the terrain cell. |
| `z` | int |  | The Z coordinate of the terrain cell. |
| `force` | [[30 Official Roblox Docs/API Reference/Enums/WaterForce\|WaterForce]] |  | The [[30 Official Roblox Docs/API Reference/Enums/WaterForce\|Enum.WaterForce]] value representing the water force in the cell. |
| `direction` | [[30 Official Roblox Docs/API Reference/Enums/WaterDirection\|WaterDirection]] |  | The [[30 Official Roblox Docs/API Reference/Enums/WaterDirection\|Enum.WaterDirection]] value representing the water flow direction. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### WorldToCell

```lua
Terrain:WorldToCell(position: Vector3): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Returns the grid cell location that contains the point `position`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The world-space [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to convert to a cell coordinate. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the grid cell coordinates containing the given position. |

### WorldToCellPreferEmpty

```lua
Terrain:WorldToCellPreferEmpty(position: Vector3): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Returns the grid cell location that contains the point `position`, preferring empty grid cells when position is on a grid edge.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The world-space [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to convert to a cell coordinate. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the grid cell coordinates, biased toward an empty (air) neighbor when the position lies on a cell boundary. |

### WorldToCellPreferSolid

```lua
Terrain:WorldToCellPreferSolid(position: Vector3): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** Environment

Returns the grid cell location that contains the point position, preferring non-empty grid cells when position is on a grid edge.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `position` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The world-space [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] to convert to a cell coordinate. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the grid cell coordinates, biased toward a non-empty (solid) neighbor when the position lies on a cell boundary. |

### WriteVoxelChannels

```lua
Terrain:WriteVoxelChannels(region: Region3, resolution: float, channels: Dictionary): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment · **Tags:** `CustomLuaState`

Sets a region of terrain using a dictionary of per-channel voxel data, the inverse of [[30 Official Roblox Docs/API Reference/Classes/Terrain#ReadVoxelChannels|ReadVoxelChannels()]]. The `channels` dictionary maps channel ID strings (`SolidMaterial`, `SolidOccupancy`, and/or `LiquidOccupancy`) to their respective 3D data arrays. You may write one or more channels in a single call. The `region` must be aligned to the voxel grid, `resolution` must be `4`, and the region cannot exceed 4,194,304 voxels.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] |  | Target region to write to. Must be aligned to the voxel grid. Will throw an error if region is too large; limit is currently 4194304 voxels³. |
| `resolution` | float |  | Voxel resolution. Must be `4`. |
| `channels` | Dictionary |  | Dictionary of voxel data similar to the return value of [[30 Official Roblox Docs/API Reference/Classes/Terrain#ReadVoxelChannels\|ReadVoxelChannels()]]. Keys represent each channel ID with their respective value as an array of 3D data. The dictionary can support single or multiple channel inputs.<br><br>- `SolidMaterial` — The [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] material of the voxel. Note that [[30 Official Roblox Docs/API Reference/Enums/Material\|Water]] is not supported anymore; instead, a voxel that contains only water should be entered as `SolidMaterial = Enum.Material.Air, LiquidOccupancy = x`, where `x` is a number between `0` (exclusive) and `1` (inclusive). - `SolidOccupancy` — The occupancy of the voxel's material as specified in the `SolidMaterial` channel. This should be a value between `0` (empty) and `1` (full). - `LiquidOccupancy` — Specifies the occupancy of the [[30 Official Roblox Docs/API Reference/Enums/Material\|Water]] material in a voxel as a value between `0` (no water) and `1` (full of water). If the `SolidOccupancy` is 1 and the `SolidMaterial` is not [[30 Official Roblox Docs/API Reference/Enums/Material\|Air]], this will be `0`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`terrain-writevoxelchannels-example`) are published on the source page; their code is not part of the open-source repo.*

### WriteVoxels

```lua
Terrain:WriteVoxels(region: Region3, resolution: float, materials: Array, occupancy: Array): ()
```

**Thread safety:** Unsafe · **Capabilities:** Environment · **Tags:** `CustomLuaState`

Sets a region of smooth terrain from two 3D arrays: `materials` (an array of [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]] values) and `occupancy` (an array of numbers between `0` and `1`). Both arrays must have dimensions that exactly match the target region in voxels. The `region` must be aligned to the voxel grid, `resolution` must be `4`, and the region cannot exceed 4,194,304 voxels. For more granular channel control, see [[30 Official Roblox Docs/API Reference/Classes/Terrain#WriteVoxelChannels|WriteVoxelChannels()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `region` | [[30 Official Roblox Docs/API Reference/Datatypes/Region3\|Region3]] |  | Target region to write to. Must be aligned to the voxel grid. Will throw an error if region is too large. |
| `resolution` | float |  | Voxel resolution. Must be `4`. |
| `materials` | Array |  | 3D array of [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]]. Dimensions must exactly match the size of the target region in voxels. |
| `occupancy` | Array |  | 3D array of voxel occupancies (number between `0` and `1`). Dimensions must exactly match the size of the target region in voxels. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`terrain-writevoxels-example`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Terrain](https://create.roblox.com/docs/reference/engine/classes/Terrain) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
