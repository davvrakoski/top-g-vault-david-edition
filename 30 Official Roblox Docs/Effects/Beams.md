---
title: "Beams"
description: "Beams create a visual, animatable effect between two attachments."
area: "30 Official Roblox Docs"
cluster: "Effects"
source: "https://create.roblox.com/docs/effects/beams"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Beams create a visual, animatable effect between two attachments.*

A [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] is an object that renders a [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] between two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects. By setting beam properties, you can:

- Add a [[30 Official Roblox Docs/Effects/Beams#Texture|texture]] and [[30 Official Roblox Docs/Effects/Beams#Color|color gradient]] to create interesting visuals like waterfalls and force fields.
- Modify a beam's [[30 Official Roblox Docs/Effects/Beams#Transparency|transparency]] so that it fades over time.
- Warp its shape by changing the [[30 Official Roblox Docs/Effects/Beams#Width|width]] or [[30 Official Roblox Docs/Effects/Beams#Curve|curve]] of each attachment point.
- Specify the texture's [[30 Official Roblox Docs/Effects/Beams#Texture length/mode|length and mode]] to affect how it repeats across the beam's length.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/beam/Showcase.mp4)

## Create beams

Before you begin to create a beam, it's useful to toggle on visibility of attachments so you can see where the beam starts and ends. You can do so by enabling **Show Constraint Details** from Studio's **View** menu.

To create a beam:

1. Create two parts and position them a short distance from each other. One will act as the start of the beam and the other as the end of the beam. Group the parts into a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].
2. In the **Explorer** window, add an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] object to each part:

   1. Hover over one part and click the ⊕ button. A contextual menu displays.
   2. From the contextual menu, insert an **Attachment**.
   3. Repeat for the other part.

3. In the **Explorer** window, add a [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] object to the model:

   1. Hover over the model and click the ⊕ button. A contextual menu displays.
   2. From the contextual menu, insert a **Beam**.

      *(image in the full Top G Vault)*

4. Select the new **Beam** object and assign its attachments. Ensure you assign each attachment property to a different [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] object.

   1. In the **Properties** window, select the **Attachment0** property. Your cursor changes.
   2. In the **Explorer** window, select the attachment of the part you want to be the start of your beam.
   3. Back in the **Properties** window, select the **Attachment1** property. Your cursor changes.
   4. In the **Explorer** window, select the attachment of the part you want to be the end of your beam.

*(image in the full Top G Vault)*

*Default beam between two attachments*

> [!warning]
> Beams require attachments to function properly. If you remove either attachment object from step 4, the beam stops rendering its texture.

## Customize beams

By experimenting with the following properties, you can customize a beam's visual appearance to make unique gameplay elements like force fields, waterfalls, and pathway obstacles.

[Video: laserTrap_beamExamples.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/laser-traps-with-beams/laserTrap_beamExamples.mp4)

> [!info]
> The visual quality of your beams can change depending on the graphics settings on the player's device. To review your beam across quality levels, it's recommended to open [[30 Official Roblox Docs/Studio/Roblox Studio setup#Customization|Studio Settings]], search for **Editor Quality Level**, and set it to the both the lowest and highest level after you finish customizing your beam.

### Texture

The [[30 Official Roblox Docs/API Reference/Classes/Beam#Texture|Texture]] property renders that texture across the length of the beam. You can set a beam's [[30 Official Roblox Docs/API Reference/Classes/Beam#Texture|Texture]] property to any asset ID. For more information, including how to add or upload your own textures, see [here](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md).

*(image in the full Top G Vault)*

A beam renders its texture using two triangles drawn between [[30 Official Roblox Docs/API Reference/Classes/Beam#Segments|Segments]], and the segments are laid out between the two attachment points' orientation. When you rotate attachment points in different directions, segments also rotate.

*(image in the full Top G Vault)*

### Color

The [[30 Official Roblox Docs/API Reference/Classes/Beam#Color|Color]] property tints the beam's texture to either a specific hue, or to a gradient [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]] across its entire span.

#### Constant Color

1. In the **Explorer** window, select the beam.
2. In the **Properties** window, select the **Color** property. You can either:

   1. Click on the color square to open the **Colors** pop-up window and select a color.
   2. Input three numbers into the RGB color value field.

   *(image in the full Top G Vault)*

#### Color Gradient

1. In the **Explorer** window, select the beam.
1. In the **Properties** window, click inside the **Color** property field, then click the **⋯** button.

   *(image in the full Top G Vault)*

   In the color sequence popup, each triangle on the bottom axis is a
   **keypoint** that determines the color value of the beam at that
   point along its span.

	 *(image in the full Top G Vault)*

1. Click the keypoint at the start of the color sequence, click the
   small square next to **Color**, and select a color from the popup window.

	 *(image in the full Top G Vault)*

1. If you want the beam to change color near the end of its span, click the keypoint at the end of the color sequence, click the small square next to **Color**, and select a color from the popup window.

   *(image in the full Top G Vault)*

1. For more customization, you can:

   - Add another keypoint by clicking anywhere on the graph.
   - Make a color change sooner or later within the gradient by dragging an intermediary keypoint to a new position.
   - Delete an intermediary keypoint by selecting it and clicking the **Delete** button.
   - Reset the entire sequence by clicking the **Reset** button.

   *(image in the full Top G Vault)*

   *(image in the full Top G Vault)*

### Transparency

The [[30 Official Roblox Docs/API Reference/Classes/Beam#Transparency|Transparency]] property sets the transparency of the beam as a consistent value or as a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] with ranges from **0** (totally opaque) to **1** (fully clear).

#### Constant Opacity

1. In the **Explorer** window, select the beam.
1. In the **Properties** window, select the **Transparency** property.
1. Input the desired opacity for the beam.

#### Number Sequence

1. In the **Explorer** window, select the beam.
1. In the **Properties** window, click inside the **Transparency** property field, then click the **⋯** button.

   *(image in the full Top G Vault)*

   In the number sequence popup, each square at the start and end of the graph is a **keypoint** that determines the opacity value of the beam at that
   point along its span. By default, the graph defaults to a straight line and the beam is of consistent opacity.

   *(image in the full Top G Vault)*

1. Perform any of the following actions:

   - To change the opacity at a point, click on a keypoint and either
     drag it up or down, or enter a value in the **Value** field.
   - To insert a new keypoint, click on any point in the graph.
   - To delete a keypoint, select it and click the **Delete** button.
   - Reset the entire sequence by clicking the **Reset** button.

   *(image in the full Top G Vault)*

   *(image in the full Top G Vault)*

### Width

You can set the beam's width in studs at each endpoint by configuring the
[[30 Official Roblox Docs/API Reference/Classes/Beam#Width0|Width0]] and [[30 Official Roblox Docs/API Reference/Classes/Beam#Width1|Width1]] properties. A higher value equates to a larger width and a lower value equates to a smaller width. If you set either value to smaller than 0, Studio sets it back to **0**.

The beam below has a [[30 Official Roblox Docs/API Reference/Classes/Beam#Width0|Width0]] value of **0.5** and a
[[30 Official Roblox Docs/API Reference/Classes/Beam#Width1|Width1]] value of **3**.

*(image in the full Top G Vault)*

### Texture length/mode

A beam's [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureLength|TextureLength]] and [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureMode|TextureMode]] determine how its [[30 Official Roblox Docs/Effects/Beams#Texture|texture]] repeats across its length.

When [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureMode|TextureMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Wrap]] or [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Static]], the texture repetitions will equal the beam's overall length (in studs) divided by its [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureLength|TextureLength]].

*(image in the full Top G Vault)*

When [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureMode|TextureMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Stretch]], the texture will repeat [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureLength|TextureLength]] times across the beam's overall length.

*(image in the full Top G Vault)*

### Facing

A beam is a 2D projection existing in 3D space, meaning that it may not be visible from every angle. The [[30 Official Roblox Docs/API Reference/Classes/Beam#FaceCamera|FaceCamera]] property, when set to `true`, ensures that the beam always faces the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|CurrentCamera]], regardless of its orientation.

[Video: FaceCamera.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/beam/FaceCamera.mp4)

*Default vs. FaceCamera*

### Curve

Beams are configured to use a cubic Bézier curve formed by four control points. This means they are not constrained to straight lines and the curve of the beam can be modified by changing [[30 Official Roblox Docs/API Reference/Classes/Beam#CurveSize0|CurveSize0]], [[30 Official Roblox Docs/API Reference/Classes/Beam#CurveSize1|CurveSize1]], and the orientation of the beam's [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]].

- **P0** — The start of the beam; position of [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]].
- **P1** — [[30 Official Roblox Docs/API Reference/Classes/Beam#CurveSize0|CurveSize0]] studs away from [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]], in the positive **X** direction of [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]].
- **P2** — [[30 Official Roblox Docs/API Reference/Classes/Beam#CurveSize1|CurveSize1]] studs away from [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]], in the negative **X** direction of [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]].
- **P3** — The end of the beam; position of [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]].

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

---
*Source: [Beams](https://create.roblox.com/docs/effects/beams) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
