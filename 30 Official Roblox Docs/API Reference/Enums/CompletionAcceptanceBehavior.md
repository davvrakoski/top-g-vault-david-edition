---
title: "CompletionAcceptanceBehavior"
description: "Controls how the Script Editor inserts or replaces text when an autocomplete suggestion is accepted with Enter or Tab."
api_type: enum
aliases: ["Enum.CompletionAcceptanceBehavior"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CompletionAcceptanceBehavior"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls how the Script Editor inserts or replaces text when an autocomplete suggestion is accepted with Enter or Tab.*

## Description

Controls how the Script Editor treats existing text **after** the cursor when you accept an autocomplete suggestion with Enter or Tab. Accepting a completion always replaces the typed prefix **before** the cursor. The active value is stored in [[30 Official Roblox Docs/API Reference/Classes/Studio#AutocompleteAcceptanceBehavior|Studio.AutocompleteAcceptanceBehavior]], which defaults to [[30 Official Roblox Docs/API Reference/Enums/CompletionAcceptanceBehavior|Enum.CompletionAcceptanceBehavior.InsertOnEnterReplaceOnTab]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Insert` | 0 | Accepting a completion with either Enter or Tab inserts the suggestion without replacing existing text after the cursor. |
| `Replace` | 1 | Accepting a completion with either Enter or Tab replaces existing text after the cursor with the full suggestion text. |
| `ReplaceOnEnterInsertOnTab` | 2 | Pressing Enter replaces existing text after the cursor; pressing Tab inserts without replacing text after the cursor. |
| `InsertOnEnterReplaceOnTab` | 3 | Pressing Enter inserts without replacing text after the cursor; pressing Tab replaces text after the cursor. This is the default of [[30 Official Roblox Docs/API Reference/Classes/Studio#AutocompleteAcceptanceBehavior\|Studio.AutocompleteAcceptanceBehavior]]. |

---
*Source: [CompletionAcceptanceBehavior](https://create.roblox.com/docs/reference/engine/enums/CompletionAcceptanceBehavior) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
