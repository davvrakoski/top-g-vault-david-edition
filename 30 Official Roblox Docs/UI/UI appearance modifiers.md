---
title: "UI appearance modifiers"
description: "Explains how to use appearance modifiers to customize basic user interface objects."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/appearance-modifiers"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to use appearance modifiers to customize basic user interface objects.*

By utilizing **appearance modifiers**, you can further customize the appearance of your [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]].

- Apply a [[30 Official Roblox Docs/UI/UI appearance modifiers#Gradient|gradient]] to the background of an object.
- Apply a [[30 Official Roblox Docs/UI/UI appearance modifiers#Stroke|stroke]] to text or a border.
- Set [[30 Official Roblox Docs/UI/UI appearance modifiers#Corners|rounded corners]] for an object.
- Increase [[30 Official Roblox Docs/UI/UI appearance modifiers#Padding|padding]] between the borders of an object.
- Add a [[30 Official Roblox Docs/UI/UI appearance modifiers#Shadow|drop shadow]] behind an object.

## Gradient

The [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] object applies a color and transparency gradient to its parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]].

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

You can configure the gradient by:

- Setting its [[30 Official Roblox Docs/UI/UI appearance modifiers#Color sequence|colors]] through a [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]] in the gradient's [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Color|Color]] property.
- Setting its [[30 Official Roblox Docs/UI/UI appearance modifiers#Transparency|transparency]] through a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] in the gradient's [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Transparency|Transparency]] property.
- Choosing the gradient's [[30 Official Roblox Docs/UI/UI appearance modifiers#Type|type]] through the [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Type|Type]] property.
- Choosing the gradient's [[30 Official Roblox Docs/UI/UI appearance modifiers#Offset and rotation|starting point]] (inside or outside the parent's bounds) through the [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset]] property.
- Choosing the gradient's [[30 Official Roblox Docs/UI/UI appearance modifiers#Offset and rotation|angle]] through the [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]] property.
- Choosing the gradient's [[30 Official Roblox Docs/UI/UI appearance modifiers#Scale|scale]] through the [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale|Scale]] property.
- Choosing the gradient's [[30 Official Roblox Docs/UI/UI appearance modifiers#Tile Mode|edge sampling]] behavior through the [[30 Official Roblox Docs/API Reference/Classes/UIGradient#TileMode|TileMode]] property.

### Color sequence

To set a gradient's color sequence:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, select the [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]].
1. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, click inside the [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Color|Color]] property field, then click the **⋯** button to the right of the input box.

   *(image in the full Top G Vault)*

1. Each triangle on the bottom axis of the color sequence is a **keypoint** that determines the color value at that point.

   *(image in the full Top G Vault)*
   1. Click a keypoint in the color sequence to select or reposition it, or add another keypoint by clicking anywhere on the graph.
   2. Click the small square next to **Color** to open the **Colors** pop-up window, then select the desired color for the keypoint.
   3. If needed, repeat these steps to add/adjust colors across the graph.

### Transparency

To adjust a gradient's transparency across its range:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, select the [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]].
1. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, click inside the [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Transparency|Transparency]] property field, then click the **⋯** button to the right of the input box.

   *(image in the full Top G Vault)*

1. Each square across the number sequence graph is a **keypoint** that determines the transparency value at that point.

   *(image in the full Top G Vault)*
   1. Click a keypoint in the number sequence to select or reposition it, or add another keypoint by clicking anywhere on the graph.
   2. Enter a specific time/value combination through the **Time** and **Value** inputs.
   3. If needed, repeat these steps to add/adjust transparency levels across the graph.

### Type

> [!success]
> **File** ⟩ **Beta Features** ⟩ ****

A gradient's [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Type|Type]] property sets its type from among [[30 Official Roblox Docs/API Reference/Enums/GradientType|Linear]], [[30 Official Roblox Docs/API Reference/Enums/GradientType|Radial]], [[30 Official Roblox Docs/API Reference/Enums/GradientType|Elliptical]], or [[30 Official Roblox Docs/API Reference/Enums/GradientType|Conical]].

- [[30 Official Roblox Docs/API Reference/Enums/GradientType|Linear]] — The color/transparency sequence transitions in a straight line across the element. The direction is controlled by its [[30 Official Roblox Docs/UI/UI appearance modifiers#Offset and rotation|rotation]] and the position by its [[30 Official Roblox Docs/UI/UI appearance modifiers#Offset and rotation|offset]]. This is the default.

- [[30 Official Roblox Docs/API Reference/Enums/GradientType|Radial]] — The color/transparency sequence radiates outward from the element's center, optionally shifted by [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset]]. The radius is defined by the average of the element's width and height divided by two, effectively \$\text\$. [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]] has no effect on a radial gradient.

- [[30 Official Roblox Docs/API Reference/Enums/GradientType|Elliptical]] — The color/transparency sequence radiates outward from the element's center in an ellipse, optionally shifted by [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset]]. The ellipse's horizontal and vertical radii are half the element's width and height, so the ellipse fits the element's bounds. [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]] rotates the ellipse's axes.

- [[30 Official Roblox Docs/API Reference/Enums/GradientType|Conical]] — The color/transparency sequence sweeps clockwise around the center of the element, optionally shifted by [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset]]. [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]] controls the starting and ending angle of the sweep. By default this sweeps from `0` to `360` degrees, but [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale|Scale]] values less than `1` can reduce that angle.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#Type|Type]] = [[30 Official Roblox Docs/API Reference/Enums/GradientType|Linear]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#Type|Type]] = [[30 Official Roblox Docs/API Reference/Enums/GradientType|Radial]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#Type|Type]] = [[30 Official Roblox Docs/API Reference/Enums/GradientType|Elliptical]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#Type|Type]] = [[30 Official Roblox Docs/API Reference/Enums/GradientType|Conical]]*

### Offset and rotation

The [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset]] and [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]] properties let you adjust the gradient's control points and its angle. As illustrated in the following diagrams, [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset]] is based on a **percentage** of the parent's width or height, and both positive or negative values are valid.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset.X]] = `0`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset.X]] = `0.25`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset|Offset.X]] = `-0.25`*

Similarly, when you rotate the gradient, the control points also rotate:

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]] = `0`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]] = `45`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation|Rotation]] = `-90`*

### Scale

> [!success]
> **File** ⟩ **Beta Features** ⟩ ****

A gradient's [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale|Scale]] multiplies the extent of the gradient, controlling how much of the color/transparency sequence is visible within the element.

- When [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale|Scale]] is less than `1`, the gradient spans less than the full extent. The remaining color/transparency is filled in according to the [[30 Official Roblox Docs/API Reference/Classes/UIGradient#TileMode|TileMode]] property.

- When [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale|Scale]] is greater than `1`, the gradient spans more than the full extent and only a part of the color/transparency is visible.

- For [[30 Official Roblox Docs/API Reference/Enums/GradientType|Elliptical]] gradients, [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale|Scale]] affects both radii of the ellipse.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale|Scale]] = `1`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale|Scale]] = `0.25`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#Scale|Scale]] = `1.8`*

### Tile Mode

> [!success]
> **File** ⟩ **Beta Features** ⟩ ****

The [[30 Official Roblox Docs/API Reference/Classes/UIGradient#TileMode|TileMode]] property sets how the gradient repeats when the full sequence does not fully cover the parent element.

- [[30 Official Roblox Docs/API Reference/Enums/GradientTileMode|Clamp]] — Default mode where the color/transparency values at the start and end of the sequence extend infinitely, so the start values fill any area before the gradient and the end values fill any area after it.

- [[30 Official Roblox Docs/API Reference/Enums/GradientTileMode|Repeat]] — The gradient repeats by wrapping the color/transparency sequence tiles seamlessly from end back to start. This can produce a visible seam if the first and last color/transparency values in the sequence differ.

- [[30 Official Roblox Docs/API Reference/Enums/GradientTileMode|Mirror]] — The gradient reflects at each boundary so the color/transparency sequence ping‑pongs. This produces a smooth repetition with no seam, since the direction reverses at each tile edge.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#TileMode|TileMode]] = [[30 Official Roblox Docs/API Reference/Enums/GradientTileMode|Clamp]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#TileMode|TileMode]] = [[30 Official Roblox Docs/API Reference/Enums/GradientTileMode|Repeat]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIGradient#TileMode|TileMode]] = [[30 Official Roblox Docs/API Reference/Enums/GradientTileMode|Mirror]]*

## Stroke

The [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] instance applies an outline to text or a border. Key features include:

- Adjustable [[30 Official Roblox Docs/UI/UI appearance modifiers#Color or gradient|color]] and [[30 Official Roblox Docs/UI/UI appearance modifiers#Thickness|thickness]] of the stroke outline.
- Ability to set the stroke [[30 Official Roblox Docs/UI/UI appearance modifiers#Transparency|transparency]] independently of the parent's transparency.
- Customizable [[30 Official Roblox Docs/UI/UI appearance modifiers#Border position/offset|position and/or offset]] relative to the parent's border.
- Three [[30 Official Roblox Docs/UI/UI appearance modifiers#Corner style|corner styles]] (round, bevel, or miter).
- Stroke [[30 Official Roblox Docs/UI/UI appearance modifiers#Color or gradient|gradient]] support through the [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] instance.

### Thickness

You can set the stroke width through the [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness|Thickness]] property which is measured in pixels (default) or scaled relative to the parent, depending on the modifier's [[30 Official Roblox Docs/API Reference/Classes/UIStroke#StrokeSizingMode|StrokeSizingMode]]. If stroke is on text and [[30 Official Roblox Docs/API Reference/Classes/UIStroke#StrokeSizingMode|StrokeSizingMode]] is set to [[30 Official Roblox Docs/API Reference/Enums/StrokeSizingMode|ScaledSize]], thickness is relative to the font size.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness|UIStroke.Thickness]] = `4`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness|UIStroke.Thickness]] = `12`*

> [!warning]
> Avoid [[30 Official Roblox Docs/UI/UI animation-tweens|tweening]] the [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Thickness|Thickness]] property of a [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] instance applied to **text** objects. This renders and stores many glyph sizes each frame, potentially causing performance issues or text flickering.

### Color or gradient

You can set the stroke color through the [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Color|Color]] property, as well as insert a child [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] instance to create gradient strokes.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke#Color|UIStroke.Color]] = `(0, 95, 225)`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] with [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] child*

> [!info]
> Both the parent object and [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] can have child [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] instances, letting you set gradients on the **stroke** and **fill** independently.

### Text outline or border

Depending on its parent type, [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] operates as either a **text outline** or as a **border**. When you parent [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] to a text object like [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]], it applies to the text's outline; when you parent [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] to other [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]], it applies to the border.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] with [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] child*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] with [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] and [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] children*

When applied to a text object, you can override the default stroke behavior by the [[30 Official Roblox Docs/API Reference/Classes/UIStroke#ApplyStrokeMode|ApplyStrokeMode]] property, letting you apply the stroke to the object's bounds instead of the text itself. You can even control the text outline and border independently by parenting two [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] instances to a text object, one set to **Contextual** and the other to **Border**.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke#ApplyStrokeMode|UIStroke.ApplyStrokeMode]] = [[30 Official Roblox Docs/API Reference/Enums/ApplyStrokeMode|Contextual]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke#ApplyStrokeMode|UIStroke.ApplyStrokeMode]] = [[30 Official Roblox Docs/API Reference/Enums/ApplyStrokeMode|Border]]*

### Border position/offset

[[30 Official Roblox Docs/API Reference/Classes/UIStroke#BorderStrokePosition|BorderStrokePosition]] sets the stroke's position relative to its parent's border and [[30 Official Roblox Docs/API Reference/Classes/UIStroke#BorderOffset|BorderOffset]] lets you specify an additional offset to the stroke's position.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke#BorderStrokePosition|BorderStrokePosition]] = [[30 Official Roblox Docs/API Reference/Enums/BorderStrokePosition|Center]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke#BorderStrokePosition|BorderStrokePosition]] = [[30 Official Roblox Docs/API Reference/Enums/BorderStrokePosition|Inner]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke#BorderStrokePosition|BorderStrokePosition]] = [[30 Official Roblox Docs/API Reference/Enums/BorderStrokePosition|Outer]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke#BorderOffset|BorderOffset]] = `(0.15, 0)`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke#BorderOffset|BorderOffset]] = `(0, -16)`*

### Transparency

The [[30 Official Roblox Docs/API Reference/Classes/UIStroke#Transparency|Transparency]] property sets the stroke transparency independently of the parent object's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#BackgroundTransparency|BackgroundTransparency]] or [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTransparency|TextTransparency]]. This allows you to render text and borders that are "hollow" (consisting of only an outline).

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTransparency|TextLabel.TextTransparency]] = `0`<br>[[30 Official Roblox Docs/API Reference/Classes/UIStroke#Transparency|UIStroke.Transparency]] = `0.5`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextTransparency|TextLabel.TextTransparency]] = `1`<br>[[30 Official Roblox Docs/API Reference/Classes/UIStroke#Transparency|UIStroke.Transparency]] = `0`*

### Corner style

The [[30 Official Roblox Docs/API Reference/Classes/UIStroke#LineJoinMode|LineJoinMode]] property lets you control how corners are interpreted. It accepts a value of either [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|Round]], [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|Bevel]], or [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|Miter]].

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke#LineJoinMode|LineJoinMode]] = [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|Round]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke#LineJoinMode|LineJoinMode]] = [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|Bevel]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIStroke#LineJoinMode|LineJoinMode]] = [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode|Miter]]*

### Layering

To layer multiple sibling [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] instances on a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] from front to back, you can utilize the [[30 Official Roblox Docs/API Reference/Classes/UIStroke#ZIndex|ZIndex]] property. Those with a lower [[30 Official Roblox Docs/API Reference/Classes/UIStroke#ZIndex|ZIndex]] render under (behind) those with a higher [[30 Official Roblox Docs/API Reference/Classes/UIStroke#ZIndex|ZIndex]].

Note that the rendering order for [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] instances with the same [[30 Official Roblox Docs/API Reference/Classes/UIStroke#ZIndex|ZIndex]] is undefined. Do not apply multiple [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] instances with the same index if their rendering order matters.

## Corners

The [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] instance applies deformation to the corners of its parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. You can control the applied radius through the [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius|CornerRadius]] property using either [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] or [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]].

[[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] rounds the corners to a **percentage** based on the total length of the **shortest** edge of the parent, meaning that a scale of `0.5` or higher deforms the parent into a "pill" shape, regardless of its width or height. [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] rounds the corners to a specific number of **pixels**, regardless of the width/height of the parent.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] = `0.25`  ·  [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] = `0`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] = `0.5`  ·  [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] = `0`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] = `0`  ·  [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] = `32`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] = `0`  ·  [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Offset|Offset]] = `64`*

You can also control **individual corners** through the [[30 Official Roblox Docs/API Reference/Classes/UICorner#TopLeftRadius|TopLeftRadius]], [[30 Official Roblox Docs/API Reference/Classes/UICorner#TopRightRadius|TopRightRadius]], [[30 Official Roblox Docs/API Reference/Classes/UICorner#BottomRightRadius|BottomRightRadius]], and [[30 Official Roblox Docs/API Reference/Classes/UICorner#BottomLeftRadius|BottomLeftRadius]] properties.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UICorner#TopLeftRadius|TopLeftRadius]] = `(0, 0)`<br>[[30 Official Roblox Docs/API Reference/Classes/UICorner#TopRightRadius|TopRightRadius]] = `(0, 48)`<br>[[30 Official Roblox Docs/API Reference/Classes/UICorner#BottomRightRadius|BottomRightRadius]] = `(0, 48)`<br>[[30 Official Roblox Docs/API Reference/Classes/UICorner#BottomLeftRadius|BottomLeftRadius]] = `(0, 0)`*

## Padding

A [[30 Official Roblox Docs/API Reference/Classes/UIPadding|UIPadding]] object applies top, bottom, left, and/or right padding to the contents of the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. For example, you can move the text inside a text label downward or upward by applying an offset to the modifier's [[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingBottom|PaddingBottom]] property.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] without [[30 Official Roblox Docs/API Reference/Classes/UIPadding|UIPadding]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingBottom|PaddingBottom]] = `(0, -20)`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingBottom|PaddingBottom]] = `(0, 30)`*

## Shadow

A [[30 Official Roblox Docs/API Reference/Classes/UIShadow|UIShadow]] object renders a shadow for its parent UI instance. A shadow can follow the parent's rectangular shape or the glyphs of a text object. Shape shadows can appear outside or inside the parent, and mask the area directly behind the parent. Both shape and text shadows can use a color gradient.

If the parent has a [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] or a nonzero [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Rotation|GuiObject.Rotation]], its shape shadow follows the same corners or rotation. [[30 Official Roblox Docs/API Reference/Classes/UIShadow|UIShadow]] doesn't support [[30 Official Roblox Docs/API Reference/Classes/Path2D|Path2D]] or textures.

> [!success]
> **File** ⟩ **Beta Features** ⟩ ****

### Shape and text shadows

The [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Mode|Mode]] property determines what casts the shadow, and both modes can coexist under the same parent.

- [[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|Shape]] is the default. The shadow follows the rectangular area of any [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]].
- [[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|Text]] follows the text glyphs of a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], or [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]]. Other UI objects don't render a shadow in this mode.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#Mode|Mode]] = [[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|Shape]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#Mode|Mode]] = [[30 Official Roblox Docs/API Reference/Enums/ApplyShadowMode|Text]]*

[[30 Official Roblox Docs/API Reference/Classes/UIShadow#Spread|Spread]], [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Inset|Inset]], and [[30 Official Roblox Docs/API Reference/Classes/UIShadow#ShowBehindParent|ShowBehindParent]] have no effect in text mode.

### Blur

The [[30 Official Roblox Docs/API Reference/Classes/UIShadow#BlurRadius|BlurRadius]] property determines the shadow's blurriness. A larger value makes the shadow's edges appear softer. Note that the **scale** factor of this [[30 Official Roblox Docs/API Reference/Datatypes/UDim|UDim]] property is relative to the parent's width or height, whichever is shorter.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#BlurRadius|BlurRadius]] = `(0, 0)`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#BlurRadius|BlurRadius]] = `(0.75, 0)`*

### Color and transparency

The [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Color|Color]] property determines the shadow's color, while [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Transparency|Transparency]] sets the shadow's transparency with `0` being fully opaque and `1` being fully transparent.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#Color|Color]] = `(255, 255, 255)`  ·  [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Transparency|Transparency]] = `0.6`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#Color|Color]] = `(50, 0, 35)`  ·  [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Transparency|Transparency]] = `0`*

For a multicolor shadow, insert a [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] as a child of the [[30 Official Roblox Docs/API Reference/Classes/UIShadow|UIShadow]]. The gradient affects the shadow without changing the parent's fill.

*(image in the full Top G Vault)*

*A [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] applies a cyan-to-purple gradient to the shape shadow.*

### Offset and spread

The [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Offset|Offset]] property moves the shadow relative to the parent's position, while [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Spread|Spread]] expands or shrinks the shadow relative to the parent's size.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#Offset|Offset]] = `{0, -14}, {0, 6}`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#Offset|Offset]] = `{0.1, 0}, {-0.15, 0}`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#Spread|Spread]] = `{0, 10}, {0, 10}`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#Spread|Spread]] = `{0.3, 0}, {0.3, 0}`*

### Inset shadows

Set [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Inset|Inset]] to `true` to render the shadow on top of and inside the parent instead of behind it. Positive [[30 Official Roblox Docs/API Reference/Classes/UIShadow#Spread|Spread]] values expand an inset shadow toward the center of the parent.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#Inset|Inset]] = `false`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#Inset|Inset]] = `true`*

### Reveal content behind a transparent parent

By default, [[30 Official Roblox Docs/API Reference/Classes/UIShadow#ShowBehindParent|ShowBehindParent]] is `true`, so the entire shape shadow renders, including the portion directly behind the parent. Set it to `false` to mask that portion of the shadow. This prevents the shadow from darkening content visible through a transparent parent.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#ShowBehindParent|ShowBehindParent]] = `true`*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/UIShadow#ShowBehindParent|ShowBehindParent]] = `false`*

This property has no effect on inset or text shadows.

### Layer shadows

Add multiple [[30 Official Roblox Docs/API Reference/Classes/UIShadow|UIShadow]] instances to the same parent to combine effects. The [[30 Official Roblox Docs/API Reference/Classes/UIShadow#ZIndex|ZIndex]] property controls their render order. Shadows with lower values render behind shadows with higher values.

The render order of shadows that share the same [[30 Official Roblox Docs/API Reference/Classes/UIShadow#ZIndex|ZIndex]] is undefined. Assign each sibling shadow a different value when their order matters.

---
*Source: [UI appearance modifiers](https://create.roblox.com/docs/ui/appearance-modifiers) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
