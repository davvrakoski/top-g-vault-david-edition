---
title: "Pivot tools"
description: "Pivot tools and properties give you full control over the points around which objects rotate and translate."
area: "30 Official Roblox Docs"
cluster: "Studio"
source: "https://create.roblox.com/docs/studio/pivot-tools"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Pivot tools and properties give you full control over the points around which objects rotate and translate.*

The **pivot** tools and related properties give you full control over the points around which objects rotate and translate.

## Interactive Studio tools

The interactive Studio tools are located in the **Model** tab toolbar.

*(image in the full Top G Vault)*

When **Pivot** is toggled on, you can move or rotate the pivot point of a [[30 Official Roblox Docs/Parts/Parts|part]] or [[30 Official Roblox Docs/Parts/Models|model]]. Once set, rotation and scaling occur around the pivot point. For more information, see [[30 Official Roblox Docs/Parts/Models#Set a primary part|setting a primary part]].

The following diagrams show example pivot locations in relation to object bounds.

### Center

*(image in the full Top G Vault)*

### Corner

*(image in the full Top G Vault)*

### Outside Object Bounds

*(image in the full Top G Vault)*

When you rotate the pivot of a [[30 Official Roblox Docs/Parts/Models|model]], the bounding box of the model also rotates.

### Orientation = (0, 90, 0)

*(image in the full Top G Vault)*

### Orientation = (0, 135, 0)

*(image in the full Top G Vault)*

### Orientation = (0, 180, 0)

*(image in the full Top G Vault)*

You can specify a [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]] for models, which is a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] within the model that you can use as a positional basis. In terms of pivot points:

1. When you assign a [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]] to a model, the existing pivot changes to the pivot point of the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]]. If you later unassign/clear the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]], the pivot point resets to the **center** of the model's bounding box.
2. If you **delete** the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]] from a model, the pivot point remains in the same location and does **not** revert to its previous position. This prevents a sudden "jump" if you delete any parts from the model.

### Initial Pivot Point

*(image in the full Top G Vault)*

### A. PrimaryPart Assigned

*(image in the full Top G Vault)*

### B. PrimaryPart Deleted

*(image in the full Top G Vault)*

### Snap

The **Snap** checkbox, available by click‑holding the small corner arrow on the **Pivot** button, toggles whether the pivot point snaps to **hotspots** such as corners, edges, or centers when you move it with the **Edit Pivot** tool. When snapping is enabled, hotspots display as small magenta points.

*(image in the full Top G Vault)*

*Hotspots on a part*

*(image in the full Top G Vault)*

*Hotspots on a model*

### Reset

The **Reset** button moves the pivot point to the **center** of an object or model's bounding box. This operation is useful after you've changed the composition of a model and wish to place its pivot point at the center of its new bounding box.

*(image in the full Top G Vault)*

## Pivot properties

In addition to the interactive tools, pivot values can be directly set in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

| Property | Description |
| --- | --- |
| **Origin Position** | Current world location of the object based on its pivot point rather than its bounding box. Useful for setting the precise location of a [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]. |
| **Origin Orientation** | Current orientation of the object based around its pivot point rather than its bounding box. |
| **Pivot Offset Position** | Precise location of the pivot relative to the object.¹ |
| **Pivot Offset Orientation** | Precise pivot orientation.¹ |
| **World Pivot Position** | The precise world location of the pivot for [[30 Official Roblox Docs/API Reference/Classes/Model\|Models]] without a [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|PrimaryPart]]. If a [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|PrimaryPart]] is set, the model will use **Pivot Offset Position** since the pivot becomes relative to that part.¹ |
| **World Pivot Orientation** | The precise world orientation for [[30 Official Roblox Docs/API Reference/Classes/Model\|Models]] without a [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|PrimaryPart]]. If a [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|PrimaryPart]] is set, the model will use **Pivot Offset Orientation** since the pivot becomes relative to that part.¹ |

*<sup>1</sup> Changing this property will not move or rotate the object.*

## Manipulate pivots in scripts

Beyond the Studio tools, pivot points can be accessed and manipulated in scripts.

| Function or Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PVInstance#GetPivot\|GetPivot()]] | Queries the current world location of an object's pivot as a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. This returns an object's position in 3D space regardless of whether it's an individual part or a [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]. |
| [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo\|PivotTo()]] | Moves the object such that its pivot will be located at the specified [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. This allows for uniform object movement of both individual parts and models. |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#PivotOffset\|BasePart.PivotOffset]] | The [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] which specifies the pivot offset; effectively the offset of the pivot from the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]].² |
| [[30 Official Roblox Docs/API Reference/Classes/BasePart#PivotOffset\|Model.WorldPivot]] | For [[30 Official Roblox Docs/API Reference/Classes/Model\|Models]] without a [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|PrimaryPart]], the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] which specifies the model's pivot in world space. If a [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|PrimaryPart]] is set, the model will use [[30 Official Roblox Docs/API Reference/Classes/BasePart#PivotOffset\|BasePart.PivotOffset]] since the pivot becomes relative to that part.² |

*<sup>2</sup> Changing this property will not move or rotate the object.*

---
*Source: [Pivot tools](https://create.roblox.com/docs/studio/pivot-tools) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
