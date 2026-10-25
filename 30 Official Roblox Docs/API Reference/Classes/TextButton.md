---
title: "TextButton"
description: "A 2D user interface element that displays interactive text."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TextButton"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A 2D user interface element that displays interactive text.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]] → [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

A [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] behaves similarly to [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] in regards to rendering, with the additional behaviors of a [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]].

You can disable text rendering by setting [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextTransparency|TextTransparency]] to `1`. This will result in a plain rectangle that can be used as a button.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#ContentText\|ContentText]] | string | A copy of [[30 Official Roblox Docs/API Reference/Classes/TextButton#Text\|TextButton.Text]] that contains exactly what is being rendered by the [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#Font\|Font]] | [[30 Official Roblox Docs/API Reference/Enums/Font\|Enum.Font]] | Determines the font used to render text. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] | Determines the font used to render text. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#FontSize\|FontSize]] | [[30 Official Roblox Docs/API Reference/Enums/FontSize\|FontSize]] | **Deprecated.** Determines the font size to be used. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#LineHeight\|LineHeight]] | float | Scales the spacing between lines of text in the [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#LocalizedText\|LocalizedText]] | string | Sets whether a [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]] should be [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#Localize\|GuiBase2d.Localize]] or not. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#MaxVisibleGraphemes\|MaxVisibleGraphemes]] | int | The maximum number of graphemes the [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]] can show. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#OpenTypeFeatures\|OpenTypeFeatures]] | string | Applies OpenType font features, such as stylistic sets, to the text rendered by the [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#OpenTypeFeaturesError\|OpenTypeFeaturesError]] | string | Read-only property that contains the error message, if any, produced while applying [[30 Official Roblox Docs/API Reference/Classes/TextButton#OpenTypeFeatures\|OpenTypeFeatures]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#RichText\|RichText]] | boolean | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]] renders its text using rich text formatting. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#Text\|Text]] | string | Determines the string rendered by the [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextBounds\|TextBounds]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Read-only property which reflects the absolute size of rendered text in offsets. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextColor\|TextColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | **Deprecated.** Determines the color of text. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextColor3\|TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the color of rendered text. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextDirection\|TextDirection]] | [[30 Official Roblox Docs/API Reference/Enums/TextDirection\|TextDirection]] | Direction in which the text is rendered. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextFits\|TextFits]] | boolean | A boolean representation of whether the button's text fits within the size of it. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextScaled\|TextScaled]] | boolean | Changes whether text is resized to fit within the [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextSize\|TextSize]] | float | Determines the line height of text in offsets. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextStrokeColor3\|TextStrokeColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the color of the text stroke (outline). |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextStrokeTransparency\|TextStrokeTransparency]] | float | Determines the transparency of the text stroke (outline). |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextTransparency\|TextTransparency]] | float | Determines the transparency of rendered text. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextTruncate\|TextTruncate]] | [[30 Official Roblox Docs/API Reference/Enums/TextTruncate\|TextTruncate]] | Controls the truncation of the text displayed in the [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextWrap\|TextWrap]] | boolean | **Deprecated.** Determines whether or not text should wrap at the edges of the [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]] element's space. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextWrapped\|TextWrapped]] | boolean | Determines if text wraps to multiple lines within the [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]] element's space, truncating excess text. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextXAlignment\|TextXAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/TextXAlignment\|TextXAlignment]] | Determines the horizontal alignment of rendered text. |
| [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextYAlignment\|TextYAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/TextYAlignment\|TextYAlignment]] | Determines the vertical alignment of rendered text. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiButton|GuiButton]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ContentText

**Type:** string

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

This property provides a copy of [[30 Official Roblox Docs/API Reference/Classes/TextButton#Text|Text]] that contains exactly what is being rendered by the [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]]. This is useful for eliminating style tags used for [[30 Official Roblox Docs/UI/Rich text markup|rich text]] markup; for example, when [[30 Official Roblox Docs/API Reference/Classes/TextButton#RichText|RichText]] is enabled, the [[30 Official Roblox Docs/API Reference/Classes/TextButton#ContentText|ContentText]] property shows the text as it appears to the user.

| RichText | Text | ContentText |
| --- | --- | --- |
| `false` | &lt;b&gt;Hello,&lt;br/&gt; world!&lt;/b&gt; | &lt;b&gt;Hello,&lt;br/&gt; world!&lt;/b&gt; |
| `true` | &lt;b&gt;Hello,&lt;br/&gt; world!&lt;/b&gt; | Hello,<br> world! |

### Font

**Type:** [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `Hidden`, `NotReplicated`

This property selects one of several pre-defined fonts with which the [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] will render its text. Some fonts have bold, italic and/or light variants.

With the exception of the [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font.Legacy]] font, each font will render text with the line height equal to the [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextSize|TextSize]] property.

The [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font.Code]] font is the only monospace font. It has the unique property that each character has the exact same width and height ratio of 1:2, where the width of each character is approximately half the [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextSize|TextSize]] property.

This property is kept in sync with the [[30 Official Roblox Docs/API Reference/Classes/TextButton#FontFace|FontFace]] property.

*Code samples for this member (`Show-All-Fonts`) are published on the source page; their code is not part of the open-source repo.*

### FontFace

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property is similar to the [[30 Official Roblox Docs/API Reference/Classes/TextButton#Font|Font]] property but allows setting fonts that don't exist in [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]].

This property is kept in sync with the [[30 Official Roblox Docs/API Reference/Classes/TextButton#Font|Font]] property, such that when setting [[30 Official Roblox Docs/API Reference/Classes/TextButton#FontFace|FontFace]], the font is set to the corresponding [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]] value or to [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font.Unknown]] if there are no matches.

### FontSize

> [!warning] Deprecated
> This property is deprecated in favor of `Class.TextButton|TextSize` which
> is an integer and not an enum and thus offers far more options for sizes.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/FontSize|FontSize]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `NotReplicated`, `Deprecated`

This property determines the font size to be used.

### LineHeight

**Type:** float

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

Controls the height of lines as a multiple of the font's `em` square size by scaling the spacing between lines of text in the [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]]. Valid values range from `1.0` to `3.0`, defaulting to `1.0`.

### LocalizedText

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** UI · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`

This property sets whether a [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] should regard [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#Localize|GuiBase2d.Localize]] or not.

### MaxVisibleGraphemes

**Type:** int

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property controls the maximum number of graphemes (or units of text) that are shown on the [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]]. It is primarily provided as an easy way to create a [[30 Official Roblox Docs/UI/UI animation-tweens#Typewriter effect on text|typewriter effect]] where the characters appear one at a time.

Changing the property does not change the position or size of the visible graphemes; the layout will be calculated as if all graphemes are visible.

Setting the property to `-1` disables the limit and shows the entirety of the [[30 Official Roblox Docs/API Reference/Classes/TextButton#Text|Text]].

### OpenTypeFeatures

**Type:** string

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

A comma-separated list of [OpenType](https://learn.microsoft.com/typography/opentype/spec/featuretags) feature tags applied to text rendered by the [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] (for example, `zero` for slashed zeros). Whitespace around each tag is ignored. Defaults to an empty string, which applies no additional features.

Only a supported subset of tags is applied. If a tag can't be parsed, isn't supported, or uses unsupported partial enabling with brackets, all tags are discarded. [[30 Official Roblox Docs/API Reference/Classes/TextButton#OpenTypeFeaturesError|OpenTypeFeaturesError]].

### OpenTypeFeaturesError

**Type:** string

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** false/true · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

Read-only message produced when a tag in [[30 Official Roblox Docs/API Reference/Classes/TextButton#OpenTypeFeatures|OpenTypeFeatures]] can't be applied — for example, when a tag fails to parse, isn't supported, or uses unsupported partial (bracketed) enabling. Empty while the current [[30 Official Roblox Docs/API Reference/Classes/TextButton#OpenTypeFeatures|OpenTypeFeatures]] value applies successfully.

### RichText

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether the [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] renders its text using [[30 Official Roblox Docs/UI/Rich text markup|rich text]] markup to style sections of the string in bold, italics, specific colors, and more.

To use rich text, simply include rich text formatting tags in the [[30 Official Roblox Docs/API Reference/Classes/TextButton#Text|Text]] string.

### Text

**Type:** string

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the text content rendered by the [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]]. The visual properties of the string rendered to the screen is determined by [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextColor3|TextColor3]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextTransparency|TextTransparency]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextSize|TextSize]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#Font|Font]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextScaled|TextScaled]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextWrapped|TextWrapped]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextXAlignment|TextXAlignment]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextYAlignment|TextYAlignment]].

It is possible to render emoji such as 🔒 and other symbols which aren't affected by the [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextColor3|TextColor3]] property. These can be pasted into [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] and [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] objects, as well as the field within the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

This property may contain newline characters. Similarly, this property may contain a tab character, but it will render as a space instead.

*Code samples for this member (`Fading-Banner`, `Emoji-in-Text`) are published on the source page; their code is not part of the open-source repo.*

### TextBounds

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

This read-only property reflects the absolute size of rendered text in offsets, meaning that if you try to fit text into a rectangle, this property would reflect the minimum dimensions of the rectangle you'd need in order to fit the text.

Using [[30 Official Roblox Docs/API Reference/Classes/TextService#GetTextSize|TextService:GetTextSize()]], you can predict what [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextBounds|TextBounds]] will be given a string, [[30 Official Roblox Docs/API Reference/Classes/TextButton#Font|Font]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextSize|TextSize]], and frame size.

### TextColor

> [!warning] Deprecated
> This item has been superseded by `Class.TextButton.TextColor3` which
> should be used in all new work.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

This property determines the color of text.

### TextColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the color of all the text rendered by the [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] element.

*Code samples for this member (`Countdown-Text`) are published on the source page; their code is not part of the open-source repo.*

### TextDirection

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TextDirection|TextDirection]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

[[30 Official Roblox Docs/API Reference/Enums/TextDirection|Enum.TextDirection]] in which the text is rendered.

### TextFits

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

A boolean representation of whether the button's text fits within the size of it.

### TextScaled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether text is scaled so that it fills the button's entire space. When enabled, [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextSize|TextSize]] is ignored and [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextWrapped|TextWrapped]] is automatically enabled. This property is useful for rendering text elements within [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGuis]]. When this property is used for [[30 Official Roblox Docs/UI/On-screen UI containers|on-screen UI]], it may be helpful to use a [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint|UITextSizeConstraint]] to restrict the range of possible text sizes.

##### Automatic Sizing

It's recommended that you avoid usage of [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextScaled|TextScaled]] and adjust UI to take advantage of the [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] property instead. Here are the core differences between the two properties:

- [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextScaled|TextScaled]] scales the content (text) to accommodate the UI. Without careful consideration, some text may become unreadable if scaled too small.

- [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] resizes the UI to accommodate content while maintaining a consistent font size. For more information, see [[30 Official Roblox Docs/UI/Size modifiers and constraints#Automatic sizing|here]].

Additionally, it's recommended that you avoid applying both [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextScaled|TextScaled]] and to the same [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]]. [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] determines the maximum amount of available space that a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] can use (in this case, text), while [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextScaled|TextScaled]] uses the available space determined by [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AutomaticSize|AutomaticSize]] to scale the font size up to the maximum font size (100) if there are no size constraints.

### TextSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the height of one line of rendered text. The unit is in offsets, not points (which is used in most document editing programs). The [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font.Legacy]] font does not hold this property.

### TextStrokeColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the color of the stroke, or outline, of rendered text. Along with [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextStrokeTransparency|TextStrokeTransparency]], it determines the final visual appearance of the text stroke.

As a powerful alternative which supports color gradients, see [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]].

### TextStrokeTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the transparency of the stroke, or outline, of rendered text. Along with [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextStrokeColor3|TextStrokeColor3]], it determines the final visual appearance of the text stroke.

Note that text stroke is multiple renderings of the same transparency, so this property is essentially multiplicative on itself four times over. Therefore, it's recommended to set [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextStrokeTransparency|TextStrokeTransparency]] to a value in the range of `0.75` to `1` for more a more subtle effect.

As a powerful alternative which supports color gradients, see [[30 Official Roblox Docs/API Reference/Classes/UIStroke|UIStroke]].

### TextTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the transparency of all the text rendered by the [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]].

### TextTruncate

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TextTruncate|TextTruncate]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

Controls the truncation of the text displayed in the [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]].

### TextWrap

> [!warning] Deprecated
> This item has been superseded by `Class.TextButton.TextWrapped` which
> should be used in all new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `NotReplicated`, `Deprecated`

This property determines whether or not text should wrap at the edges of the [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] element's space.

### TextWrapped

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

When enabled, this property will render text on multiple lines within a [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] element's space so that [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextBounds|TextBounds]] will never exceed the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|GuiBase2d.AbsoluteSize]] of the element. This is achieved by breaking long lines of text into multiple lines.

Line breaks will prefer whitespace; should a long unbroken word exceed the width of the element, that word will be broken into multiple lines.

If further line breaks would cause the vertical height of the text (the **Y** component of [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextBounds|TextBounds]]) to exceed the vertical height of the element (the **Y** component of [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|GuiBase2d.AbsoluteSize]]), then that line will not be rendered at all.

### TextXAlignment

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TextXAlignment|TextXAlignment]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the horizontal alignment of text rendered within the object's space. It is used in conjunction with [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextYAlignment|TextYAlignment]] to fully determine text alignment on both axes.

Note that this property won't affect the read-only properties [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextBounds|TextBounds]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextFits|TextFits]].

### TextYAlignment

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TextYAlignment|TextYAlignment]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the vertical alignment of text rendered within the object's space. It is used in conjunction with [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextXAlignment|TextXAlignment]] to fully determine text alignment on both axes.

Note that this property won't affect the read-only properties [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextBounds|TextBounds]] and [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextFits|TextFits]].

---
*Source: [TextButton](https://create.roblox.com/docs/reference/engine/classes/TextButton) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
