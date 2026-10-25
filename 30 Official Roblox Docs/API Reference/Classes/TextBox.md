---
title: "TextBox"
description: "A 2D user interface element that displays player-editable text."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TextBox"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A 2D user interface element that displays player-editable text.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui

## Description

A `TextBox` allows the player to provide text input. It behaves similarly to a [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], except that a single `TextBox` can be put in focus by clicking, tapping, or gamepad selection. While in focus, the player can use a keyboard to change the [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text|Text]] property.

- If there is no text, the [[30 Official Roblox Docs/API Reference/Classes/TextBox#PlaceholderText|PlaceholderText]] will be visible. This is useful prompting players of the kind or format of data they should input.
- By default, the [[30 Official Roblox Docs/API Reference/Classes/TextBox#ClearTextOnFocus|ClearTextOnFocus]] property is enabled and ensures there is no existing text when a `TextBox` is focused. This may not be desirable for text that should be editable by the player.
- The [[30 Official Roblox Docs/API Reference/Classes/TextBox#MultiLine|MultiLine]] property allows players to enter multiple lines of text with newline characters (`\n`).

#### Focus State

It is possible to detect and change the focus state of a `TextBox`:

- You can use [[30 Official Roblox Docs/API Reference/Classes/TextBox#CaptureFocus|CaptureFocus]] when a dialogue appears so that the player doesn't have to click on a `TextBox` when it becomes available; you can use [[30 Official Roblox Docs/API Reference/Classes/ContextActionService#BindAction|ContextActionService:BindAction()]] to bind a certain key to focus a `TextBox` using this function. When a `TextBox` comes into focus, the [[30 Official Roblox Docs/API Reference/Classes/TextBox#Focused|Focused]] event fires.
- You can detect if a certain `TextBox` is in focus by using [[30 Official Roblox Docs/API Reference/Classes/TextBox#IsFocused|IsFocused]]. Alternatively, [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetFocusedTextBox|UserInputService:GetFocusedTextBox()]] can be used to check if any `TextBox` is in focus.
- When the player is done inputting text, the [[30 Official Roblox Docs/API Reference/Classes/TextBox#FocusLost|FocusLost]] event fires, indicating if the player pressed <kbd>Enter</kbd> to submit text along with the [[30 Official Roblox Docs/API Reference/Classes/InputObject|InputObject]] that caused the loss of focus. When using on-screen keyboards on mobile and console, [[30 Official Roblox Docs/API Reference/Classes/TextBox#ReturnPressedFromOnScreenKeyboard|ReturnPressedFromOnScreenKeyboard]] may also fire.
- If some more important matter comes up during gameplay, you can [[30 Official Roblox Docs/API Reference/Classes/TextBox#ReleaseFocus|ReleaseFocus]] of the `TextBox` so that a player's keyboard input returns to your game.

#### Text Editing

A `TextBox` supports text selection through its [[30 Official Roblox Docs/API Reference/Classes/TextBox#CursorPosition|CursorPosition]] and [[30 Official Roblox Docs/API Reference/Classes/TextBox#SelectionStart|SelectionStart]] properties. Using [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|GetPropertyChangedSignal]], you can detect when a selection changes. Additionally, it is possible for players to copy and paste text within a TextBox, enabling basic clipboard support. When the cursor moves outside the visible area while typing or navigating, the `TextBox` automatically scrolls its viewport to keep the cursor in view.

**Text Filtering Notice** Games that facilitate player-to-player communication using text, such as custom chat or nametags, must properly filter such text using [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterStringAsync|TextService:FilterStringAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/Chat#FilterStringAsync|Chat:FilterStringAsync()]]. If this is not properly done, your game may receive moderation action.

*Code samples for this API (`TextBox-Secret-Word`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/TextBox); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#ClearTextOnFocus\|ClearTextOnFocus]] | boolean | Determines whether clicking on the `TextBox` will clear its [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text\|TextBox.Text]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#ContentText\|ContentText]] | string | A copy of [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text\|TextBox.Text]] that contains exactly what is being rendered by the [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#CursorPosition\|CursorPosition]] | int | Determines the offset of the text cursor in bytes, or `-1` if there is no cursor. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#Font\|Font]] | [[30 Official Roblox Docs/API Reference/Enums/Font\|Enum.Font]] | Determines the font used to render text. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] | Determines the font face used to render text. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#FontSize\|FontSize]] | [[30 Official Roblox Docs/API Reference/Enums/FontSize\|FontSize]] | **Deprecated.** Determines the font size of a `TextBox` object. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#LineHeight\|LineHeight]] | float | Scales the spacing between lines of text in the `TextBox`. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#MaxVisibleGraphemes\|MaxVisibleGraphemes]] | int | The maximum number of graphemes the `TextBox` can show. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#MultiLine\|MultiLine]] | boolean | When set to `true`, text inside a `TextBox` is able to move onto multiple lines. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#OpenTypeFeatures\|OpenTypeFeatures]] | string | Applies OpenType typographic features to the text rendered by the [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#OpenTypeFeaturesError\|OpenTypeFeaturesError]] | string | Read-only property that describes why the [[30 Official Roblox Docs/API Reference/Classes/TextBox#OpenTypeFeatures\|TextBox.OpenTypeFeatures]] string could not be applied. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#PlaceholderColor3\|PlaceholderColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the text color that gets used when no text has been entered into the `TextBox`. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#PlaceholderText\|PlaceholderText]] | string | Sets the text that gets displayed when no text has been entered into the `TextBox`. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#RichText\|RichText]] | boolean | Determines whether the `TextBox` renders the [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text\|Text]] string using rich text formatting. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#SelectionStart\|SelectionStart]] | int | Determines the starting position of a text selection. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#ShowNativeInput\|ShowNativeInput]] | boolean | If set to `true`, input native to the platform is used instead of Roblox's built-in keyboard. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text\|Text]] | string | Determines the string rendered by the `TextBox` element. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextBounds\|TextBounds]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The size of a `TextBox` element's text in offsets. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextColor\|TextColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextColor3\|TextColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the color of non-placeholder rendered text. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextDirection\|TextDirection]] | [[30 Official Roblox Docs/API Reference/Enums/TextDirection\|TextDirection]] | Direction in which the text is rendered. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextEditable\|TextEditable]] | boolean | Determines whether the player can change the [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text\|Text]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextFits\|TextFits]] | boolean | Whether the text fits within the constraints of the `TextBox`. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextScaled\|TextScaled]] | boolean | Changes whether text is resized to fit within the `TextBox`. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextSize\|TextSize]] | float | Determine the line height of text in offsets. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextStrokeColor3\|TextStrokeColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines the color of the text stroke (outline). |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextStrokeTransparency\|TextStrokeTransparency]] | float | Determines the transparency of the text stroke (outline). |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextTransparency\|TextTransparency]] | float | Determines the transparency of the rendered text. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextTruncate\|TextTruncate]] | [[30 Official Roblox Docs/API Reference/Enums/TextTruncate\|TextTruncate]] | Controls the truncation of the text displayed in the `TextBox`. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextWrap\|TextWrap]] | boolean | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextWrapped\|TextWrapped]] | boolean | Determines if text wraps to multiple lines within the `TextBox` element space, truncating excess text. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextXAlignment\|TextXAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/TextXAlignment\|TextXAlignment]] | Determines the horizontal alignment of the rendered text. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextYAlignment\|TextYAlignment]] | [[30 Official Roblox Docs/API Reference/Enums/TextYAlignment\|TextYAlignment]] | Determines the vertical alignment of the rendered text. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#CaptureFocus\|CaptureFocus()]] | () | Forces the client to focus on the `TextBox`. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#IsFocused\|IsFocused()]] | boolean | Whether the TextBox currently has focus. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#ReleaseFocus\|ReleaseFocus()]] | () | Forces the client to unfocus the TextBox. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#Focused\|Focused]] |  | Fires when the `TextBox` gains focus. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#FocusLost\|FocusLost]] | `enterPressed`, `inputThatCausedFocusLoss` | Fires when the `TextBox` loses its focus. |
| [[30 Official Roblox Docs/API Reference/Classes/TextBox#ReturnPressedFromOnScreenKeyboard\|ReturnPressedFromOnScreenKeyboard]] |  | Fires when the `TextBox` is focused and the player presses the on-screen keyboard's return/enter button. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ClearTextOnFocus

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines whether clicking on the `TextBox` will clear its [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text|TextBox.Text]] property

### ContentText

**Type:** string

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

This property provides a copy of [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text|Text]] that contains exactly what is being rendered by the [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]]. This is useful for eliminating style tags used for [[30 Official Roblox Docs/UI/Rich text markup|rich text]] markup; for example, when [[30 Official Roblox Docs/API Reference/Classes/TextBox#RichText|RichText]] is enabled, the [[30 Official Roblox Docs/API Reference/Classes/TextBox#ContentText|ContentText]] property shows the text as it appears to the user.

| RichText | Text | ContentText |
| --- | --- | --- |
| `false` | &lt;b&gt;Hello,&lt;br/&gt; world!&lt;/b&gt; | &lt;b&gt;Hello,&lt;br/&gt; world!&lt;/b&gt; |
| `true` | &lt;b&gt;Hello,&lt;br/&gt; world!&lt;/b&gt; | Hello,<br> world! |

### CursorPosition

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI

This property determines the offset of the text cursor in bytes, or `-1` if the `TextBox` is not currently being edited. A value of `1` represents the position before the first byte in the [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text|Text]] property. When used in conjunction with the [[30 Official Roblox Docs/API Reference/Classes/TextBox#SelectionStart|SelectionStart]] property, it is possible to both get and set selected text within a `TextBox`.

Note that the units of this property are **bytes** and that many unicode characters such as emoji are longer than 1 byte. For instance, if a player types in "Hello👋" ("Hello" immediately followed by the waving hand sign), the cursor position would be `10`, not `7`, since the emoji uses 4 bytes.

*Code samples for this member (`textbox-selections`) are published on the source page; their code is not part of the open-source repo.*

### Font

**Type:** [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `Hidden`, `NotReplicated`

This property selects one of several pre-defined [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]] fonts with which the UI element will render its text. Some fonts have bold, italic, and/or light variants.

This property is kept in sync with the [[30 Official Roblox Docs/API Reference/Classes/TextBox#FontFace|TextBox.FontFace]] property. When setting `Font`, the [[30 Official Roblox Docs/API Reference/Classes/TextBox#FontFace|FontFace]] property will be set to `Datatype.Font.fromEnum(value)`.

### FontFace

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property is similar to the [[30 Official Roblox Docs/API Reference/Classes/TextBox#Font|Font]] property but allows setting fonts that don't exist in [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]].

This property is kept in sync with the [[30 Official Roblox Docs/API Reference/Classes/TextBox#Font|TextBox.Font]] property. When setting `FontFace`, the [[30 Official Roblox Docs/API Reference/Classes/TextBox#Font|Font]] property is set to the corresponding enum value, or to [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font.Unknown]] if there are no matches.

### FontSize

> [!warning] Deprecated
> This item has been superseded by `Class.TextBox.TextSize` which should be
> used in all new work.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/FontSize|FontSize]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `NotReplicated`, `Deprecated`

This property determines the font size of a `TextBox` object.

### LineHeight

**Type:** float

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

Controls the height of lines, as a multiple of the font's em square size, by scaling the spacing between lines of text in the `TextBox`. Valid values range from `1.0` (default) to `3.0`.

### MaxVisibleGraphemes

**Type:** int

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property controls the maximum number of graphemes (or units of text) that are shown on the `TextBox`, regardless of whether it's showing the [[30 Official Roblox Docs/API Reference/Classes/TextBox#PlaceholderText|PlaceholderText]] or [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text|Text]].

Changing the property does not change the position or size of the visible graphemes; the layout will be calculated as if all graphemes are visible.

Setting the property to `-1` disables the limit and shows the entirety of the [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text|Text]].

### MultiLine

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

When set to `true`, text inside a `TextBox` is able to move onto multiple lines. This also enables players to use the <kbd>Enter</kbd> key to move onto a new line.

### OpenTypeFeatures

**Type:** string

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

Comma-separated list of OpenType feature tags applied when the [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] shapes and renders its text, such as `zero` for slashed zeros or `ss03` for a stylistic set. Defaults to an empty string (no additional features).

Each entry uses standard OpenType feature-string syntax (for example, `zero` or `ss03`). Only a supported subset is applied; an unsupported feature, malformed string, or bracketed partial-enabling syntax (for example, `zero[1:3]`) is rejected, with the reason in [[30 Official Roblox Docs/API Reference/Classes/TextBox#OpenTypeFeaturesError|OpenTypeFeaturesError]].

Supports [[30 Official Roblox Docs/UI/Styling/UI styling|styling]].

### OpenTypeFeaturesError

**Type:** string

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** false/true · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

Read-only error, if any, from parsing and applying [[30 Official Roblox Docs/API Reference/Classes/TextBox#OpenTypeFeatures|OpenTypeFeatures]]. Defaults to an empty string when the requested features applied successfully.

An error is produced when:

- The feature string is malformed and cannot be parsed.
- A requested feature is not in the supported set.
- A bracketed range syntax is used (partial feature enabling is not supported).

### PlaceholderColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the text color that gets used when no text has been entered into the `TextBox`.

### PlaceholderText

**Type:** string

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

Sets the text that gets displayed when no text has been entered into the `TextBox`.

### RichText

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether the `TextBox` renders the [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text|Text]] string using [[30 Official Roblox Docs/UI/Rich text markup|rich text]] formatting. Rich text uses simple markup tags to style sections of the string in bold, italics, specific colors, and more.

Note that when the `TextBox` has this property enabled and the box gains focus, the player will be able to edit and interact with the complete XML string, including all of the formatting tags. When focus is lost, the text will automatically parse and render the tags as rich text.

### SelectionStart

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI

Determines the starting position of a text selection, or `-1` if the `TextBox` has no range of selected text. This property uses the same positioning logic as [[30 Official Roblox Docs/API Reference/Classes/TextBox#CursorPosition|CursorPosition]]. `SelectionStart` will be greater than [[30 Official Roblox Docs/API Reference/Classes/TextBox#CursorPosition|CursorPosition]] if the cursor is at the beginning of a selection, and less than [[30 Official Roblox Docs/API Reference/Classes/TextBox#CursorPosition|CursorPosition]] if the cursor is at the end.

*Code samples for this member (`textbox-selections`) are published on the source page; their code is not part of the open-source repo.*

### ShowNativeInput

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

If set to `true`, input native to the platform is used instead of Roblox's built-in keyboard.

### Text

**Type:** string

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the text content rendered by the `TextBox` element. The visual properties of the string rendered to the screen is determined by [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextColor3|TextColor3]], [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextTransparency|TextTransparency]], [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextSize|TextSize]], [[30 Official Roblox Docs/API Reference/Classes/TextBox#FontFace|FontFace]], and other properties.

It is possible to render emoji such as 👋 and other symbols. These special symbols aren't affected by the [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextColor3|TextColor3]] property.

This property may contain newline characters, but it is not possible to type newline characters within the **Properties** window. Similarly, this property may contain a tab character, but it will render as a space instead.

### TextBounds

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

This read-only property reflects the absolute size of rendered text in offsets. In other words, if you were to try to fit text into a rectangle, this property would reflect the minimum dimensions of the rectangle you would need in order to fit the text.

Using [[30 Official Roblox Docs/API Reference/Classes/TextService#GetTextSize|TextService:GetTextSize()]], you can predict what `TextBounds` will be on a `TextLabel` given a string, [[30 Official Roblox Docs/API Reference/Classes/TextBox#Font|Font]], [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextSize|TextSize]] and frame size.

### TextColor

> [!warning] Deprecated
> This item has been superseded by `Class.TextBox.TextColor3` which should
> be used in all new work.

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

### TextColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the color of non-placeholder text rendered by the `TextBox`. Text is rendered after the text stroke.

*Code samples for this member (`Vowel-Detector`) are published on the source page; their code is not part of the open-source repo.*

### TextDirection

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TextDirection|TextDirection]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

[[30 Official Roblox Docs/API Reference/Enums/TextDirection|Enum.TextDirection]] in which the [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] renders its text. Defaults to [[30 Official Roblox Docs/API Reference/Enums/TextDirection|Enum.TextDirection.Auto]], which picks direction from the text content so right-to-left scripts render right-to-left. [[30 Official Roblox Docs/API Reference/Enums/TextDirection|Enum.TextDirection.LeftToRight]] and [[30 Official Roblox Docs/API Reference/Enums/TextDirection|Enum.TextDirection.RightToLeft]] force left-to-right or right-to-left rendering.

Supports [[30 Official Roblox Docs/UI/Styling/UI styling|styling]].

### TextEditable

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether the player can change the [[30 Official Roblox Docs/API Reference/Classes/TextBox#Text|Text]] through input. It is recommended to disable [[30 Official Roblox Docs/API Reference/Classes/TextBox#ClearTextOnFocus|ClearTextOnFocus]] when this property is disabled, otherwise the text can be cleared on-focus.

### TextFits

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

Whether the text fits within the constraints of the `TextBox`.

### TextScaled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines whether text is scaled so that it fills the box's entire space. When enabled, [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextSize|TextSize]] is ignored and [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextWrapped|TextWrapped]] is automatically enabled. When this property is used for on-screen UI, it may be helpful to use a [[30 Official Roblox Docs/API Reference/Classes/UITextSizeConstraint|UITextSizeConstraint]] to restrict the range of possible text sizes.

See [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextScaled|TextLabel.TextScaled]] for additional recommendations when using this property.

### TextSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the height in offsets of one line of rendered text. The unit is in offsets, not points as in many document editing programs.

### TextStrokeColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the color of the stroke (outline) of the rendered text. This property and [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextStrokeTransparency|TextStrokeTransparency]] determine the visual appearance of the text stroke.

### TextStrokeTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the transparency of the stroke (outline) of the rendered text. This property and [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextStrokeColor3|TextStrokeColor3]] determine the visual appearance of the text stroke.

Since text stroke is simply multiple renderings of the same transparency, this property is essentially multiplicative on itself four times over; for example a `TextStrokeTransparency` of `0.5` appears about the same as [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextTransparency|TextTransparency]] of `0.0625`, or `0.5^4`.

### TextTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the transparency of all the text rendered by the `TextBox`.

### TextTruncate

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TextTruncate|TextTruncate]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

Controls the truncation of the text displayed in the `TextBox`.

### TextWrap

> [!warning] Deprecated
> This item has been superseded by `Class.TextBox.TextWrapped` which should
> be used in all new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `NotReplicated`, `Deprecated`

### TextWrapped

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

When enabled, this property will render text on multiple lines within a `TextBox` element's space so that [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextBounds|TextBounds]] will never exceed the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|GuiBase2d.AbsoluteSize]] of the element.

This is achieved by breaking long lines of text into multiple lines. Line breaks will prefer whitespace; should a long unbroken word exceed the width of the element, that word will be broken into multiple lines.

If further line breaks would cause the vertical height of the text (the **Y** component of [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextBounds|TextBox.TextBounds]]) to exceed the vertical height of the element (the **Y** component of [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|GuiBase2d.AbsoluteSize]]), then that line will not be rendered at all.

### TextXAlignment

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TextXAlignment|TextXAlignment]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the horizontal alignment of text rendered within the `TextBox` element's space. It can be used in conjunction with [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextYAlignment|TextYAlignment]] to fully determine text alignment on both axes.

This property does not affect the read-only properties [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextBounds|TextBounds]] and [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextFits|TextFits]].

### TextYAlignment

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TextYAlignment|TextYAlignment]]

**Thread safety:** ReadSafe · **Category:** Text · **Loaded/Saved:** true/true · **Capabilities:** UI

This property determines the vertical alignment of text rendered within the `TextBox` element's space. It can be used in conjunction with [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextXAlignment|TextXAlignment]] to fully determine text alignment on both axes.

This property does not affect the read-only properties [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextBounds|TextBounds]] and [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextFits|TextFits]].

## Methods

### CaptureFocus

```lua
TextBox:CaptureFocus(): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Forces the client to focus on the `TextBox`.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`TextBox-CaptureFocus1`) are published on the source page; their code is not part of the open-source repo.*

### IsFocused

```lua
TextBox:IsFocused(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns `true` if the `TextBox` is focused or `false` if it is not.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Returns `true` if the `TextBox` is focused or `false` if it is not. |

### ReleaseFocus

```lua
TextBox:ReleaseFocus(submitted: boolean = False): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Forces the client to unfocus the `TextBox`. The `submitted` parameter lets you override the `enterPressed` parameter in the [[30 Official Roblox Docs/API Reference/Classes/TextBox#FocusLost|TextBox.FocusLost]] event.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `submitted` | boolean | `False` | Whether the [[30 Official Roblox Docs/API Reference/Classes/TextBox#FocusLost\|TextBox.FocusLost]] event's `enterPressed` parameter reports `true`, as if the player pressed Enter to submit text. Defaults to `false`. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`TextBox-ReleaseFocus1`) are published on the source page; their code is not part of the open-source repo.*

## Events

### Focused

```lua
TextBox.Focused()
```

**Capabilities:** UI

This event fires when the `TextBox` gains focus, typically when a player clicks/taps on the `TextBox` to begin text entry. Also fires if `TextBox` focus is forced through [[30 Official Roblox Docs/API Reference/Classes/TextBox#CaptureFocus|CaptureFocus()]].

This event can be used alongside [[30 Official Roblox Docs/API Reference/Classes/TextBox#FocusLost|FocusLost]] to track when a `TextBox` both gains and loses focus.

*Code samples for this member (`TextBox-Focus`) are published on the source page; their code is not part of the open-source repo.*

### FocusLost

```lua
TextBox.FocusLost(enterPressed: boolean, inputThatCausedFocusLoss: InputObject)
```

**Capabilities:** UI

This event fires when the `TextBox` loses its focus, typically when a player clicks/taps outside of it or presses <kbd>Enter</kbd>. Also fires if `TextBox` focus release is forced through [[30 Official Roblox Docs/API Reference/Classes/TextBox#ReleaseFocus|ReleaseFocus()]].

This event can be used alongside [[30 Official Roblox Docs/API Reference/Classes/TextBox#FocusLost|FocusLost]] to track when a `TextBox` both gains and loses focus.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `enterPressed` | boolean |  | A boolean indicating whether the client pressed <kbd>Enter</kbd> to lose focus (`true`) or not (`false`). |
| `inputThatCausedFocusLoss` | [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] |  | An [[30 Official Roblox Docs/API Reference/Classes/InputObject\|InputObject]] instance indicating the type of input that caused the `TextBox` to lose focus. |

*Code samples for this member (`TextBox-Focus`, `TextBox-FocusLost`, `TextBox-FocusLost1`) are published on the source page; their code is not part of the open-source repo.*

### ReturnPressedFromOnScreenKeyboard

```lua
TextBox.ReturnPressedFromOnScreenKeyboard()
```

**Capabilities:** UI

On mobile and console, this event fires when the `TextBox` is focused and the player presses the on-screen keyboard's return/enter button.

---
*Source: [TextBox](https://create.roblox.com/docs/reference/engine/classes/TextBox) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
