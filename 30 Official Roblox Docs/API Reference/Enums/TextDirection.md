---
title: "TextDirection"
description: "Controls the base text rendering direction for `TextLabel`, `TextButton`, and `TextBox` instances."
api_type: enum
aliases: ["Enum.TextDirection"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TextDirection"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls the base text rendering direction for [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]], [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]], and [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] instances.*

## Description

Controls the base paragraph direction used when laying out text. Used by [[30 Official Roblox Docs/API Reference/Classes/TextLabel#TextDirection|TextLabel.TextDirection]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#TextDirection|TextButton.TextDirection]], and [[30 Official Roblox Docs/API Reference/Classes/TextBox#TextDirection|TextBox.TextDirection]], which default to [[30 Official Roblox Docs/API Reference/Enums/TextDirection|Enum.TextDirection.Auto]].

[[30 Official Roblox Docs/API Reference/Enums/TextDirection|Enum.TextDirection.Auto]] lets the Unicode Bidirectional Algorithm determine the paragraph's base direction from the first strong directional character. [[30 Official Roblox Docs/API Reference/Enums/TextDirection|Enum.TextDirection.LeftToRight]] or [[30 Official Roblox Docs/API Reference/Enums/TextDirection|Enum.TextDirection.RightToLeft]] pins the base direction regardless of content, which is useful for mixed-script strings where automatic detection would choose the wrong base.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Auto` | 0 | Automatically determines text direction from the first strong directional character using the Unicode Bidirectional Algorithm. |
| `LeftToRight` | 1 | Forces the paragraph base direction to left-to-right regardless of the text content. |
| `RightToLeft` | 2 | Forces the paragraph base direction to right-to-left regardless of the text content. |

---
*Source: [TextDirection](https://create.roblox.com/docs/reference/engine/enums/TextDirection) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
