---
title: "Trails"
description: "Trails create visual motion effects as an object moves through space."
area: "30 Official Roblox Docs"
cluster: "Effects"
source: "https://create.roblox.com/docs/effects/trails"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Trails create visual motion effects as an object moves through space.*

A [[30 Official Roblox Docs/API Reference/Classes/Trail|Trail]] is an object that creates a trail between and behind two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects as they move through space. Trails are useful to help players visualize movement, such as a sword slashing through the air, projectiles flying to their target, or footprints walking away.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/trail/Showcase.mp4)

After you [[30 Official Roblox Docs/Effects/Trails#Create trails|create a trail]], you can:

- Add a [[30 Official Roblox Docs/Effects/Trails#Texture|texture]] to create interesting visuals.
- Set a constant or gradient [[30 Official Roblox Docs/Effects/Trails#Color|color]] and/or [[30 Official Roblox Docs/Effects/Trails#Transparency|transparency]].
- Modify a trail's [[30 Official Roblox Docs/Effects/Trails#Lifetime|lifetime]].
- Specify the texture's [[30 Official Roblox Docs/Effects/Trails#Texture length/mode|length and mode]] to affect how it scales, repeats, and moves along with the trail's attachments.

## Create trails

Before you begin to create a trail, it's useful to toggle on visibility of attachments so you can more easily discern how their spacing affects the trail's width. You can do so by enabling **Show Constraint Details** from Studio's **View** menu.

The following video demonstrates how attachments that are closer to each other create a trail with a smaller width:

[Video: Attachment-Width-Between.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/trail/Attachment-Width-Between.mp4)

To create a trail on a part:

1. In the **Explorer** window, insert two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] and a [[30 Official Roblox Docs/API Reference/Classes/Trail|Trail]] object into the part.

   1. Hover over the part and click the **⊕** button. A contextual menu displays.
   2. From the menu, insert two **Attachments** and one **Trail**.

      *(image in the full Top G Vault)*

2. Select the new **Trail** object and assign its attachments. Ensure you assign each attachment property to a different [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] object.

   1. In the **Properties** window, select the **Attachment0** property. Your cursor changes.
   2. In the **Explorer** window, select the first attachment you created.
   3. Back in the **Properties** window, select the **Attachment1** property. Your cursor changes.
   4. In the **Explorer** window, select the second attachment you created.

3. Using the [[30 Official Roblox Docs/Parts/Parts#Move|Move]] tool, position both attachments within the part according to how wide you want the trail to be.
4. To see the trail, move the part in any direction and the trail follows.

> [!warning]
> Trails require attachments to function properly. If you remove either [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] object from step 2, the trail stops rendering its texture.

## Customize trails

By experimenting with the following properties, you can customize a trail's visual appearance to make unique gameplay elements like wind gusts, sword slashes, and tire marks from fast cars.

> [!info]
> The visual quality of your trails can change depending on the graphics settings on the player's device. To review your trail across quality levels, it's recommended to open [[30 Official Roblox Docs/Studio/Roblox Studio setup#Customization|Studio Settings]], search for **Editor Quality Level**, and set it to the both the lowest and highest level after you finish customizing your trail.

### Texture

The [[30 Official Roblox Docs/API Reference/Classes/Trail#Texture|Texture]] property renders a texture across the length of the trail. You can set a trail's [[30 Official Roblox Docs/API Reference/Classes/Trail#Texture|Texture]] property to any asset ID. For more information, including how to add or import your own textures, see [here](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md).

[Video: Textures.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/trail/Textures.mp4)

### Color

The [[30 Official Roblox Docs/API Reference/Classes/Trail#Color|Color]] property tints the trail's texture to either a specific hue or a [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]]. The video below shows how a constant color compares with a gradient color across the trail's [[30 Official Roblox Docs/Effects/Trails#Lifetime|lifetime]].

[Video: Color-Static-Gradient.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/trail/Color-Static-Gradient.mp4)

#### Constant Color

1. In the **Explorer** window, select the trail.
2. In the **Properties** window, select the **Color** property. You can either:

   1. Click on the color square to open the **Colors** pop-up window and select a color.
   2. Input three numbers into the RGB color value field.

   *(image in the full Top G Vault)*

#### Color Gradient

1. In the **Explorer** window, select the trail.
1. In the **Properties** window, click inside the **Color** property field, then click the **⋯** button.

   *(image in the full Top G Vault)*

   In the color sequence popup, each triangle on the bottom axis is a
   **keypoint** that determines the color value of the trail at that
   point in its lifetime.

	 *(image in the full Top G Vault)*

1. Click the keypoint at the start of the color sequence, click the
   small square next to **Color**, and select a color from the popup window.

	 *(image in the full Top G Vault)*

1. If you want the trail to change color near the end of its lifetime, click the keypoint at the end of the color sequence, click the small square next to **Color**, and select a color from the popup window.

   *(image in the full Top G Vault)*

1. For more customization, you can:

   - Add another keypoint by clicking anywhere on the graph.
   - Make a color change sooner or later within the gradient by dragging an intermediary keypoint to a new position.
   - Delete an intermediary keypoint by selecting it and clicking the **Delete** button.
   - Reset the entire sequence by clicking the **Reset** button.

### Transparency

The [[30 Official Roblox Docs/API Reference/Classes/Trail#Transparency|Transparency]] property sets the transparency of the trail's segments over its [[30 Official Roblox Docs/API Reference/Classes/Trail#Lifetime|Lifetime]]. It can be a consistent value or a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] with ranges from **0** (totally opaque) to **1** (fully clear).

#### Constant Opacity

1. In the **Explorer** window, select the trail.
2. In the **Properties** window, select the **Transparency** property.
3. Input the desired opacity for the trail.

#### Number Sequence

1. In the **Explorer** window, select the trail.
1. In the **Properties** window, click inside the **Transparency** property field, then click the **⋯** button.

   *(image in the full Top G Vault)*

   In the number sequence popup, each square at the start and end of the graph is a **keypoint** that determines the opacity value of the trail at that
   point along its span. By default, the graph defaults to a straight line and the trail is of consistent opacity.

   *(image in the full Top G Vault)*

1. Perform any of the following actions:

   - To change the opacity at a point, click on a keypoint and either
     drag it up or down, or enter a value in the **Value** field.
   - To insert a new keypoint, click on any point in the graph.
   - To delete a keypoint, select it and click the **Delete** button.
   - Reset the entire sequence by clicking the **Reset** button.

   *(image in the full Top G Vault)*

### Lifetime

The [[30 Official Roblox Docs/API Reference/Classes/Trail#Lifetime|Lifetime]] property allows you to set the duration of the trail in seconds. When you decrease the value of this property, the trail moves through the space more quickly and consequently cuts down the length of the trail. This can provide the object with a faster, more animated visual
appearance.

[Video: Lifetime.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/trail/Lifetime.mp4)

*Trail with lifetime of 0.5 (left) vs. trail with lifetime of 3.0 (right)*

### Texture length/mode

A trail's [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureLength|TextureLength]] and [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureMode|TextureMode]] determine how its [[30 Official Roblox Docs/Effects/Trails#Texture|texture]] scales, repeats, and moves along with the trail's attachments.

#### Scaling and Repetition

When [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureMode|TextureMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Wrap]] or [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Static]], the [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureLength|TextureLength]] property sets the length of the texture as it repeats across the trail's length.

*(image in the full Top G Vault)*

When [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureMode|TextureMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Stretch]], the texture will repeat [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureLength|TextureLength]] times across the trail's overall length.

*(image in the full Top G Vault)*

#### Movement

The [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureMode|TextureMode]] property also affects the **movement** of the trail's texture as follows:

- If set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Stretch]], the texture will stretch out based on the lifetime of the trail, and shrink inwards if the trail's attachments stop moving.

- If set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Wrap]], the texture will be tiled as the length of the trail changes, but the textures will remain stationary relative to their attachments.

- If set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Static]], the texture will be rolled out as the attachments move, and they will remain in place until their lifetime is met. This setting is ideal for trail textures that should appear "stamped" where rendered, such as paw prints or tire tracks.

### Facing

A trail is a 2D projection existing in 3D space, meaning that it may not be visible from every angle. The [[30 Official Roblox Docs/API Reference/Classes/Trail#FaceCamera|FaceCamera]] property, when set to `true`, ensures that the trail always faces the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|CurrentCamera]], regardless of its orientation.

---
*Source: [Trails](https://create.roblox.com/docs/effects/trails) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
