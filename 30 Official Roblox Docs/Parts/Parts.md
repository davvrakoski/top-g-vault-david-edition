---
title: "Parts"
description: "Parts are Roblox's primary building blocks."
area: "30 Official Roblox Docs"
cluster: "Parts"
source: "https://create.roblox.com/docs/parts"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Parts are Roblox's primary building blocks.*

[[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] are descendants of the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] class and are Roblox's
primitive building blocks with properties like position, size, orientation, and
color. You can use basic parts as is, or you can apply [[30 Official Roblox Docs/Parts/Solid modeling|solid modeling]] operations to combine parts into more complex
shapes.

For advanced and intricate 3D models, you can also import third-party model
files as [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]] as outlined in [[30 Official Roblox Docs/Parts/Meshes|Meshes]].

*(image in the full Top G Vault)*

*Basic sphere part*

*(image in the full Top G Vault)*

*Bowl created with solid modeling*

*(image in the full Top G Vault)*

*Mesh with texture*

By default, parts are rigid bodies that follow real-world physical mechanics,
including gravity, collision, and momentum. You can connect related parts
together as a single [[30 Official Roblox Docs/Physics/Assemblies|assembly]] using a
[[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]], or a joint like [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]]. As an
assembly, the connected parts act as a single rigid entity, referencing a common
position, orientation, and scale.

You can use a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] container to group related parts together and access
the group as a single assembly in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]]. See
[[30 Official Roblox Docs/Parts/Models|Models]] for more information.

## Basic part types

[[30 Official Roblox Docs/API Reference/Classes/Part|Part]] objects can take the shape of blocks, spheres, cylinders, wedges, or corner wedges. In addition, [[30 Official Roblox Docs/API Reference/Classes/TrussPart|TrussPart]] acts as a truss beam that characters can climb like a ladder.

*(image in the full Top G Vault)*

*Block*

*(image in the full Top G Vault)*

*Sphere*

*(image in the full Top G Vault)*

*Cylinder*

*(image in the full Top G Vault)*

*Wedge*

*(image in the full Top G Vault)*

*Corner Wedge*

## Part properties

Each part has a variety of properties that you can customize through the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

*(image in the full Top G Vault)*

The following are commonly utilized properties:

- [[30 Official Roblox Docs/API Reference/Classes/BasePart|Anchored]] controls if physics affects the position of the part. When this property is set to true, the part never changes position due to gravity or any other force. You should anchor most parts in your game or gravity and physics will affect your parts as soon as the game runs.

  > [!success]
  > To view lighted outlines around the base of anchored parts in order to visualize which parts cannot move under gravity or physics, toggle on **Anchored parts** from the [[30 Official Roblox Docs/Studio/Studio interface#Visualization options|Visualization Options]] widget in the upper‑right corner of the 3D viewport.

- [[30 Official Roblox Docs/API Reference/Classes/BasePart|CanCollide]] controls whether or not a part can collide with other parts. When this property is set to true, the part is impenetrable and the physics engine accounts for it within your game. Conversely, when this property is set to false, the part can pass through anything, and the physics engine does **not** account for it.
- [[30 Official Roblox Docs/API Reference/Classes/BasePart|Transparency]] sets a part's visibility to any value between the default value of 0 (fully visible) and 1 (fully transparent). If you have many partially transparent parts, they can slow down performance. To alleviate this, merge them using [[30 Official Roblox Docs/Parts/Solid modeling|solid modeling]].

## Insert parts

The **Part** insertion button, accessible from the **Home** and **Model** tab toolbars, inserts a new part into the workspace. Click‑holding over the small corner arrow on the button lets you select either **Block**, **Sphere**, **Wedge**, **Corner Wedge**, or **Cylinder**.

*(image in the full Top G Vault)*

> [!info]
> To insert a [[30 Official Roblox Docs/API Reference/Classes/TrussPart|TrussPart]] (not available on the insertion menu), use the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] as outlined [[30 Official Roblox Docs/Studio/Explorer window|here]].

## Select parts

As you hover over parts in the 3D viewport, they are outlined to indicate their potential selection. You can select an outlined part by clicking it, or you can select multiple parts by holding <kbd>Shift</kbd>, <kbd>Ctrl</kbd>, or <kbd>⌘</kbd> as you hover over and click them. For advanced methods of selecting parts in the viewport, see [[30 Official Roblox Docs/Studio/Studio interface#Object selection|object selection]].

*(image in the full Top G Vault)*

## Transform parts

You can move, scale, and rotate selected parts either through modeling tools or by setting a new position, size, or orientation in the [[30 Official Roblox Docs/Parts/Parts#Part properties|Properties]] window.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*Move*

*(image in the full Top G Vault)*

*Scale*

*(image in the full Top G Vault)*

*Rotate*

When using the tools, you can move, scale, or rotate parts in either **world** orientation or **local** orientation by pressing <kbd>Ctrl</kbd><kbd>L</kbd> on Windows or <kbd>⌘</kbd><kbd>L</kbd> on Mac. When you enable local orientation,
the arrow axis indicators change to a part's local orientation, and an **L** indicator displays.

### World

*(image in the full Top G Vault)*

### Local

*(image in the full Top G Vault)*

<br>

Tool transform **snapping** increments are based on **studs** for moving/scaling or **degrees** for rotating, each adjustable in the toolbar. While transforming, you can temporarily toggle snapping by holding the <kbd>Shift</kbd> key.

*(image in the full Top G Vault)*

> [!info]
> To quickly jump to the **move/scale** increment input, press <kbd>Shift</kbd><kbd>2</kbd>. To quickly jump to the **rotate** increment input, press <kbd>Alt</kbd><kbd>R</kbd> (Windows) or <kbd>⌥</kbd><kbd>R</kbd> (Mac).

### Move

You can move a selected part to a new position using the **Move** tool (default shortcut <kbd>2</kbd>) or by **cursor dragging**. While moving a part, you can temporarily toggle snapping by holding <kbd>Shift</kbd>.

#### Move Tool

To move a part by an axis dragger along the **X**, **Y**, or **Z** axis, click/drag an arrow pointing along the desired axis of movement.

*(image in the full Top G Vault)*

After releasing the drag, the numerical **distance indicator** remains visible. If desired, fine‑tune the distance that was moved by clicking inside the indicator and entering any number.

*(image in the full Top G Vault)*

If you drag a part by its [[30 Official Roblox Docs/Studio/Pivot tools|pivot]] point while the **Move** tool is selected, the pivot will "soft snap" to surfaces and edges of nearby parts.

*(image in the full Top G Vault)*

#### Cursor Drag

To move a part by cursor dragging, click anywhere on the part to grab it. If snapping is **enabled**, a ruler will appear as you hover, showing what point you'll grab the part by. As you drag the part around, another ruler will appear on the surface/edge of nearby parts, indicating alignment of the grab point.

*(image in the full Top G Vault)*

If snapping is **disabled**, the part will "soft snap" to surfaces and edges of nearby parts.

*(image in the full Top G Vault)*

While cursor dragging, <kbd>T</kbd> and <kbd>R</kbd> can be used to quickly rotate the part in 90° increments around the point you picked it up by. <kbd>T</kbd> tilts the part 90° towards the camera, while <kbd>R</kbd> rotates the part 90° around the normal of the hovered surface.

*(image in the full Top G Vault)*

### Scale

To scale (resize) a selected part along the **X**, **Y**, or **Z** axis, use the **Scale** tool (default shortcut <kbd>3</kbd>) and click/drag a handle. While dragging, you can temporarily toggle snapping by holding <kbd>Shift</kbd>.

*(image in the full Top G Vault)*

### Rotate

To rotate a selected part around the **X**, **Y**, or **Z** axis, use the **Rotate** tool (default shortcut <kbd>4</kbd>) and click/drag a rotation ring. While dragging, you can temporarily toggle snapping by holding <kbd>Shift</kbd>.

*(image in the full Top G Vault)*

> [!info]
> In addition to using the **Rotate** tool, you can quickly rotate selected objects 90° about their **X** axis by pressing <kbd>Ctrl</kbd><kbd>T</kbd> (<kbd>⌘</kbd><kbd>T</kbd>) or 90° about their **Y** axis by pressing <kbd>Ctrl</kbd><kbd>R</kbd> (<kbd>⌘</kbd><kbd>R</kbd>).

## Other actions

### Group

You can group objects into a [[30 Official Roblox Docs/Parts/Models|model]] by selecting them and clicking the **Group** button. This action has a default shortcut of <kbd>Ctrl</kbd><kbd>G</kbd> (Windows) or <kbd>⌘</kbd><kbd>G</kbd> (Mac).

Alternatively, you can group objects into a [[30 Official Roblox Docs/Studio/Explorer window|folder]] by click‑holding over the small corner arrow on the button and selecting **Group as Folder** (default shortcut of <kbd>Alt</kbd><kbd>Ctrl</kbd><kbd>G</kbd> or <kbd>⌥</kbd><kbd>⌘</kbd><kbd>G</kbd>).

*(image in the full Top G Vault)*

To **ungroup** an existing model or folder, select **Ungroup** from the **Edit** menu (default shortcut of <kbd>Ctrl</kbd><kbd>U</kbd> or <kbd>⌘</kbd><kbd>U</kbd>).

### Anchor

The **Anchor** toggle controls whether the part will be **immovable** by physics. When [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]], a part will never change position due to gravity, other parts collisions, overlapping other parts, or any other physics-related causes. This action has a default shortcut of <kbd>Alt</kbd><kbd>A</kbd> (Windows) or <kbd>⌥</kbd><kbd>A</kbd> (Mac).

*(image in the full Top G Vault)*

> [!info]
> If you prefer a click-to-toggle workflow in the 3D viewport, click‑hold over the small corner arrow on the **Anchor** button and enable **Click object to anchor**. Once enabled, the tool operates as a "key" for both states — clicking on an unanchored object in the viewport anchors it, while clicking on an anchored object unanchors it.

### Color

While a part is gray by default, you can change it to any color through the following methods.

#### Color Button

Clicking the **Color** button applies the selected color to all selected parts. You can choose a color by click‑holding over the small corner arrow on the **Color** button to reveal a hexagonal picker.

*(image in the full Top G Vault)*

> [!info]
> If you prefer a fill/paint workflow in the 3D viewport, enable **Click object to apply color** at the bottom of the hexagonal picker popup and then click parts in the viewport to apply the chosen color.

#### Color Popup

The **Color** popup allows you to set a color through your operating system's color picker widget. To access it, navigate to the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window and click the small box to the left of the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|Color]] property.

*(image in the full Top G Vault)*

#### RGB Value

To define a specific RGB color value for a part, enter an RGB value into the
[[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|Color]] property field.

*(image in the full Top G Vault)*

### Material

Similar to [[30 Official Roblox Docs/Parts/Parts#Color|color]], you can customize a part's [[30 Official Roblox Docs/Parts/Materials|material]] to simulate real‑world materials such as wood, glass, or fabric. Click‑holding over the small corner arrow on the **Material** button reveals the [[30 Official Roblox Docs/Parts/Materials|material]] picker.

*(image in the full Top G Vault)*

When selecting a material, consider the following:

- **Material affects the physical traits of a part, not just its appearance**. For example, the [[30 Official Roblox Docs/API Reference/Enums/Material|Concrete]] material is heavier than the [[30 Official Roblox Docs/API Reference/Enums/Material|Plastic]] material, so a concrete brick will have higher density than a plastic brick and sink in water faster.

- Some materials have special physical effects. For example, parts will appear to glow if they are set to the [[30 Official Roblox Docs/API Reference/Enums/Material|Neon]] material.

  *(image in the full Top G Vault)*

  *SmoothPlastic*

  *(image in the full Top G Vault)*

  *Neon*

See [[30 Official Roblox Docs/Parts/Materials|Materials]] for more information on how to apply both
default and custom materials to parts.

### Lock

The **Lock** toggle controls whether the part can be selected from the 3D viewport. This action has a default shortcut of <kbd>Alt</kbd><kbd>L</kbd> (Windows) or <kbd>⌥</kbd><kbd>L</kbd> (Mac).

*(image in the full Top G Vault)*

> [!info]
> If you prefer a click-to-toggle workflow in the 3D viewport, click‑hold over the small corner arrow on the **Lock** button and enable **Click object to lock**. Once enabled, the tool operates as a "key" for both states — clicking on an unlocked object in the viewport locks it, while clicking on a locked object unlocks it.

To unlock all objects, select **Unlock All** from the **Edit** menu.

---
*Source: [Parts](https://create.roblox.com/docs/parts) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
