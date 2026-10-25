---
title: "Size modifiers and constraints"
description: "Explains how use size modifiers and size constraints with user interface objects."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/size-modifiers"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how use size modifiers and size constraints with user interface objects.*

Alongside basic [[30 Official Roblox Docs/UI/Position and size UI objects|sizing]] of UI objects, you can utilize size modifiers to [[30 Official Roblox Docs/UI/Size modifiers and constraints#Scale|scale]] an object proportionally or [[30 Official Roblox Docs/UI/Size modifiers and constraints#Automatic sizing|automatically resize]] it. You can also insert [[30 Official Roblox Docs/UI/Size modifiers and constraints#Constraints|size constraints]] to control **aspect ratio**, or set a minimum and maximum **size** or **text size**.

## Scale

A [[30 Official Roblox Docs/API Reference/Classes/UIScale|UIScale]] object stores a numerical value that multiplies the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|AbsoluteSize]] property of the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. For example, if you want an object to be twice as large as it currently is, you can insert a [[30 Official Roblox Docs/API Reference/Classes/UIScale|UIScale]] object with a [[30 Official Roblox Docs/API Reference/Classes/UIScale#Scale|Scale]] property of `2`.

This modifier is useful for "zooming in" while designing a detailed user interface in Studio, since it proportionally scales the object and all of its children, including any applied [[30 Official Roblox Docs/UI/UI appearance modifiers|appearance modifiers]] like [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]] or [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]]. It's also useful to [[30 Official Roblox Docs/UI/UI animation-tweens|tween]] the size of an object, for example to slightly increase the size of a button when a player hovers their mouse over it.

*(image in the full Top G Vault)*

## Automatic sizing

The [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] property automatically resizes a parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] to the size of its descendants. You can use this property in a variety of cases, including:

- Expanding a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] to fit text that has been [[30 Official Roblox Docs/Production/Localization/Localization|localized]] in many languages.
- Allowing users to [[30 Official Roblox Docs/UI/Text input fields|input text]] within a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]], automatically adjusting its size based on the amount of text entered.
- Automatically adjusting the size of text objects using [[30 Official Roblox Docs/UI/Rich text markup|rich text markup]], including font type and size.

[Video: Intro-Frame.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/automatic-sizing/Intro-Frame.mp4)

You can enable the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] property for any [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. By default, it is set to [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|None]], but you can change its value to have specific control over which direction(s) the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] resizes to fit its content.

> [!info]
> [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrame]] uses the [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#AutomaticCanvasSize|AutomaticCanvasSize]] property instead of [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]]. It behaves the same but resizes the frame's [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#CanvasSize|CanvasSize]], not its base [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]].

To enable automatic sizing:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, click any [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], such as a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]], [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]], or [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]].
2. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, navigate to the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] property ([[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame#AutomaticCanvasSize|AutomaticCanvasSize]] for [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrame]]) and set it to one of the following options:

   - [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|X]] — Resizes content horizontally.
   - [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|Y]] — Resizes content vertically.
   - [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|XY]] — Resizes content both horizontally and vertically.

   *(image in the full Top G Vault)*

Once automatic sizing is set, note that other object properties behave as follows:

### AnchorPoint

Similar to the concept of [[30 Official Roblox Docs/UI/Position and size UI objects#Size|sizing]] an object, [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] takes the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] property into consideration when resizing content. For example, the following video displays three [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabels]] that automatically resize from their anchor point.

[Video: customizing-anchorpoint.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/automatic-sizing/customizing-anchorpoint.mp4)

- The top label has an [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] value of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#new|(0, 0.5)]] which anchors it to the middle of the left side.
- The middle label has an [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] value of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#new|(0.5, 0.5)]] which anchors it to the center.
- The bottom label has an [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] value of [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#new|(1, 0.5)]] which anchors it to the middle of the right side.

### Size

When you enable [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]], the object's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] property controls its **minimum size**. This means that the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] cannot resize smaller than its core size along any axis.

For example, the following white [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] has a [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size]] of `0` for both axes, meaning it doesn't have a minimum width/height and can resize according to its child objects.

[Video: customizing-size-0.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/automatic-sizing/customizing-size-0.mp4)

In comparison, the following white [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] has a [[30 Official Roblox Docs/API Reference/Classes/GuiObject#Size|Size.X]] of `100`, so it cannot resize to a width less than 100 pixels.

[Video: customizing-size-100.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/automatic-sizing/customizing-size-100.mp4)

### TextWrapped

When you enable **text wrapping** for a UI text object ([[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextWrapped|TextLabel]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextWrapped|TextButton]], or [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextWrapped|TextBox]]) and set the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] property to either [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|Y]] or [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|XY]], the label resizes to accommodate any text that wraps across multiple lines. For example, the following [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] has [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextWrapped|TextWrapped]] enabled and an [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] of [[30 Official Roblox Docs/API Reference/Enums/AutomaticSize|Y]], so when text overflows the width and wraps, the label expands vertically.

[Video: customizing-textwrapping.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/automatic-sizing/customizing-textwrapping.mp4)

## Constraints

There are three types of **constraints** you can use for a user interface object: [[30 Official Roblox Docs/UI/Size modifiers and constraints#Size|size]], [[30 Official Roblox Docs/UI/Size modifiers and constraints#Text size|text size]], and [[30 Official Roblox Docs/UI/Size modifiers and constraints#Aspect ratio|aspect ratio]]. To use a constraint, you must set it as a **child** of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] you want to constrain.

### Size

The [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] specifies a minimum and maximum size for a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]]. This constraint ensures that the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] doesn't become too small or large on different screen sizes.

For example, if you set the [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MinSize|MinSize]] property to

`(200, 200)`

 and the [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint#MaxSize|MaxSize]] property to

`(400, 400)`

, the [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] cannot scale smaller than 200×200 pixels or larger than 400×400 pixels.

> [!warning]
> When a UI object is under control of both a layout structure such as [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] and a [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]], the constraint will **override** the layout and control the object's size.

### Text size

The [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint|UITextSizeConstraint]] specifies a minimum and maximum font size for a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] with text, such as a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], or [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]]. This constraint ensures that the **text** within a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] doesn't become illegible or too large.

If you enable the [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextScaled|TextScaled]] property of the parent [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], the text size scales with the container's size and respects constraints even if the object becomes smaller or larger than the [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MinTextSize|MinTextSize]] and [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MaxTextSize|MaxTextSize]] values.

For example, the following [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] object has a [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint|UITextSizeConstraint]] with a [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MinTextSize|MinTextSize]] value of `50` and a MaxTextSize value of `80`. Even when the [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] becomes smaller, the font never becomes smaller than 50 pixels, and when the object becomes large, the font next exceeds 80 pixels.

[Video: UITextSizeConstraint.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/ui-objects/UITextSizeConstraint.mp4)

> [!danger]
> Do not use [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint#MinTextSize|MinTextSize]] property values lower than `9` or the text will be difficult to read for many viewers.

### Aspect ratio

The [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]] enforces a **width‑to‑height** aspect ratio on a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] regardless of its core size, even if that size is set as a percentage of its parent. For example, inserting this constraint as a child of a [[30 Official Roblox Docs/API Reference/Classes/Frame|Frame]] and setting the constraint's [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint#AspectRatio|AspectRatio]] property to `2` (`2:1`) keeps the frame's width at twice that of its height. Similarly, setting this constraint's [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint#AspectRatio|AspectRatio]] property to `0.5` (`0.5:1`) keeps the frame's width at half that of its height.

Setting this constraint's [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint#AspectRatio|AspectRatio]] to the default of `1` (`1:1`) is a convenient way to prevent non‑proportional scaling/stretching of an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] with a square image asset, such as an [avatar thumbnail](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md).

> [!warning]
> When a UI object is under control of both a layout structure such as [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] and a [[30 Official Roblox Docs/API Reference/Classes/UIAspectRatioConstraint|UIAspectRatioConstraint]], the constraint will **override** the layout and control the object's size.

---
*Source: [Size modifiers and constraints](https://create.roblox.com/docs/ui/size-modifiers) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
