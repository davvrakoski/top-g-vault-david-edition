---
title: "GetTextBoundsParams"
description: "Use with `TextService:GetTextBoundsAsync()` to measure the size of text."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GetTextBoundsParams"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Use with [[30 Official Roblox Docs/API Reference/Classes/TextService#GetTextBoundsAsync|TextService:GetTextBoundsAsync()]] to measure the size of text.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotReplicated`

## Description

Pass this instance to [[30 Official Roblox Docs/API Reference/Classes/TextService#GetTextBoundsAsync|TextService:GetTextBoundsAsync()]] to measure the size of text.

*Code samples for this API (`TextService-GetTextBoundsAsync-1`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/GetTextBoundsParams); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GetTextBoundsParams#Font\|Font]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] | The [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] of the text being measured. |
| [[30 Official Roblox Docs/API Reference/Classes/GetTextBoundsParams#RichText\|RichText]] | boolean | Determines whether the measured text is interpreted using rich text markup. |
| [[30 Official Roblox Docs/API Reference/Classes/GetTextBoundsParams#Size\|Size]] | float | The size of the text being measured. |
| [[30 Official Roblox Docs/API Reference/Classes/GetTextBoundsParams#Text\|Text]] | string | The text being measured. |
| [[30 Official Roblox Docs/API Reference/Classes/GetTextBoundsParams#Width\|Width]] | float | The width of the container for line breaking. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Font

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]] of the text being measured. Corresponds to the [[30 Official Roblox Docs/API Reference/Classes/TextLabel#FontFace|TextLabel.FontFace]] property on text objects.

Not to be confused with [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]]. This is an object that you can create using [[30 Official Roblox Docs/API Reference/Datatypes/Font#new|Font.new()]].

### RichText

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines whether the text being measured is interpreted using [[30 Official Roblox Docs/UI/Rich text markup|rich text]] markup. Corresponds to the [[30 Official Roblox Docs/API Reference/Classes/TextLabel#RichText|TextLabel.RichText]] property on text objects.

By default, the value is `false`, meaning the [[30 Official Roblox Docs/API Reference/Classes/GetTextBoundsParams#Text|GetTextBoundsParams.Text]] string is measured verbatim. When set to `true`, rich text formatting tags in the string are parsed rather than measured as literal characters, so the returned bounds reflect the styled text.

### Size

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The size of the text that is being measured. Corresponds to the [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextSize|TextLabel.TextSize]] property.

### Text

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The text being measured.

### Width

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

The width of the container for line breaking. By default, the value is 0, which means no line breaking will be performed. You can set it to the width of the container that you'll be putting the text into.

---
*Source: [GetTextBoundsParams](https://create.roblox.com/docs/reference/engine/classes/GetTextBoundsParams) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
