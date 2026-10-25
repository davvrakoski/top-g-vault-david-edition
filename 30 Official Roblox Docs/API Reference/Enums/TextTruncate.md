---
title: "TextTruncate"
description: "Controls the truncation of text when using the `TextTruncate` property."
api_type: enum
aliases: ["Enum.TextTruncate"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TextTruncate"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls the truncation of text when using the `TextTruncate` property.*

## Description

Controls the truncation of text when using the `TextTruncate` property.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | Text is not truncated. |
| `AtEnd` | 1 | Text is truncated at the end of the text; extra graphemes that cannot fit into the space are replaced with `...`. Word boundaries are respected if possible.<br><br>For example, if the control is between -> and <- like so:<br><br>`->Long text is truncated at the en<-d of the last complete word`<br><br>The text will be:<br><br>`Long text is truncated at the...` |
| `SplitWord` | 2 | If the end of the line occurs in the middle of a word, the text is truncated inside of that word. Extra graphemes that cannot fit into the space are replaced with `...`.<br><br>For example, if the control is between -> and <- like so:<br><br>`->Long text is truncated at the en<-d of the last complete word`<br><br>The text will be:<br><br>`Long text is truncated at the en...` |

---
*Source: [TextTruncate](https://create.roblox.com/docs/reference/engine/enums/TextTruncate) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
