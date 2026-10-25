---
title: "Align tool"
description: "The Align tool lets you align objects or groups of objects along the X, Y, or Z axes."
area: "30 Official Roblox Docs"
cluster: "Studio"
source: "https://create.roblox.com/docs/studio/align-tool"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Align tool lets you align objects or groups of objects along the X, Y, or Z axes.*

The **Align** tool, accessible from Studio's **Model** tab toolbar or the **Window** ⟩ **3D** menu,  lets you align objects or groups of objects along the **X**, **Y**, or **Z** axes.

*(image in the full Top G Vault)*

Primary benefits include:

- Aligning the center or edge of multiple objects in one action.
- Aligning entire [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] or parts within them relative to other parts, all while keeping the model intact.
- Dynamically previewing the point of alignment before confirming.

## Mode

You can set the alignment mode to either **Min**, **Center**, or **Max**.

*(image in the full Top G Vault)*

*Min*

*(image in the full Top G Vault)*

*Center*

*(image in the full Top G Vault)*

*Max*

### Min

*(image in the full Top G Vault)*

### Center

*(image in the full Top G Vault)*

### Max

*(image in the full Top G Vault)*

## Align In

The **World** or **Local** option specifies which relative coordinates to align on. This is especially useful for aligning parts which don't share the same orientation or rotation.

The **X**, **Y**, and **Z** checkboxes let you select which axes to align on. Note that you can select multiple axes in a single alignment operation.

### Before Alignment

*(image in the full Top G Vault)*

### Max / World Z

*(image in the full Top G Vault)*

### Max / Local Z

*(image in the full Top G Vault)*

## Relative To

An alignment operation can be relative to either the **Selection Bounds** or the **Active Object**.

### Selection Bounds

**Selection Bounds** aligns the selected objects relative to the bounding box around them.

#### Before Alignment

*(image in the full Top G Vault)*

#### Min / World X

*(image in the full Top G Vault)*

#### Max / World X

*(image in the full Top G Vault)*

### Active Object

**Active Object** aligns the objects relative to the **last selected object**. This object is outlined in orange and it will not move during the operation. While parts are selected, you can switch the active object by clicking on a different object.

#### Before Alignment

*(image in the full Top G Vault)*

#### Min / World X

*(image in the full Top G Vault)*

#### Max / World X

*(image in the full Top G Vault)*

---
*Source: [Align tool](https://create.roblox.com/docs/studio/align-tool) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
