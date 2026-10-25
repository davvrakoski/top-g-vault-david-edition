---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA - Localization QA - Translation Coverage and Missing Strings"
tags: [roblox, community-knowledge, testing, qa, localization, translation]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/localization/localize-with-scripting
  - https://create.roblox.com/docs/production/localization/translate-dynamic-content
  - https://create.roblox.com/docs/production/localization/add-translations
  - https://create.roblox.com/docs/production/localization/automatic-translations
  - https://create.roblox.com/docs/reference/engine/classes/LocalizationService
---
# QA - Localization QA - Translation Coverage and Missing Strings

Roblox can auto-translate a lot, but text built in scripts, numbers glued into sentences and images with words in them slip through. The visible result is a Spanish player seeing "Wave 3 begins!" in English beside a translated HUD. Pseudolocalization (covered in [[Player Emulator QA - Pseudolocalization, Text Elongation and Region]]) finds layout breaks; this note covers the other half: is every string actually translated, and correctly.

## Where untranslated text comes from

| Source | Why it is missed | Fix |
|---|---|---|
| Strings set by scripts (`label.Text = "Wave " .. n`) | Concatenation creates a new source string per value | Use a localization table key with a parameter and `Translator:FormatByKey()` |
| Text set before the table loads | Shown in source language | Get the translator with `LocalizationService:GetTranslatorForPlayerAsync(player)` (wrap in `pcall`), then set text |
| `AutoLocalize = false` on a GUI | Someone turned it off for a number label and its children | Audit for it |
| Images with baked-in words | Not text | Swap per locale or avoid words in images |
| Server-made strings (kill feed, chat-style notices) | Built on the server in one language | Send keys + args to clients, translate on the client |
| New content after the last translation pass | Table has entries without translations | Coverage check per release |

## Coverage check per release

1. Export the localization table (Creator Hub > Localization) as CSV.
2. For each target language column, count empty cells. Track percent coverage per language in the release notes.
3. Search for entries that are just numbers, player names or IDs: they should not be in the table at all (they waste translator time). Use the docs' guidance on removing content.
4. Look for entries whose source text contains formatting codes (`{1}`, rich-text tags) and confirm the translations keep them intact.

## In-game pass (per target language, 20 minutes)

- Set the test language with the Player Emulator, play the scripted route: menus, shop, tutorial, a full round, death, rewards.
- Screenshot every screen and mark any source-language text.
- Check plurals and word order: "1 coins" or a number in the wrong place shows a sentence was concatenated.
- Check that dynamic text updates when the language changes mid-session if your game supports that.
- Numbers, dates and currency: decide on purpose whether to format per locale.

## Automated guard

Write a test that walks `StarterGui` clones and fails if any `TextLabel`/`TextButton` has `AutoLocalize == false` without an allow-list attribute, and a lint rule (see [[Automated Place Lint with Lune - QA Checks on rbxl Files]]) that flags `.Text = "...` assignments with literal English in scripts.

## Severity guide

- **High:** tutorial, purchase dialogs, or anything legal/safety untranslated in a top-5 language.
- **Medium:** HUD or round messages untranslated.
- **Low:** flavour text, item lore.

## Related
[[Testing - Hub]] · [[Player Emulator QA - Pseudolocalization, Text Elongation and Region]] · [[Automated Place Lint with Lune - QA Checks on rbxl Files]] · [[Bug Triage, Severity and Regression Workflow]]
