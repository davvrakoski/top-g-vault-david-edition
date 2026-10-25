---
title: "TextFilterContext"
description: "Indicates whether text submitted to `TextService:FilterStringAsync()` or `TextService:FilterAndTranslateStringAsync()` is intended for a public or private audience, controlling the strictness of the text filtering backend."
api_type: enum
aliases: ["Enum.TextFilterContext"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/TextFilterContext"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates whether text submitted to [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterStringAsync|TextService:FilterStringAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterAndTranslateStringAsync|TextService:FilterAndTranslateStringAsync()]] is intended for a public or private audience, controlling the strictness of the text filtering backend.*

## Description

Indicates whether text submitted to [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterStringAsync|TextService:FilterStringAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterAndTranslateStringAsync|TextService:FilterAndTranslateStringAsync()]] is intended for a public or private audience, controlling the strictness of the text filtering backend.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `PublicChat` | 1 | Indicates the string will be visible to all players or a broad public audience, applying the strictest level of text filtering. |
| `PrivateChat` | 2 | Indicates the string is part of a private conversation between specific users, applying filtering appropriate for one-to-one or small-group exchanges. |

---
*Source: [TextFilterContext](https://create.roblox.com/docs/reference/engine/enums/TextFilterContext) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
