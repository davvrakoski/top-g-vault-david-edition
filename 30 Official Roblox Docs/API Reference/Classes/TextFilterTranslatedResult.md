---
title: "TextFilterTranslatedResult"
description: "Holds the filtered source text and its filtered translations produced by `TextService:FilterAndTranslateStringAsync()`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TextFilterTranslatedResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Holds the filtered source text and its filtered translations produced by [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterAndTranslateStringAsync|TextService:FilterAndTranslateStringAsync()]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

A [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult|TextFilterTranslatedResult]] is the object returned by [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterAndTranslateStringAsync|TextService:FilterAndTranslateStringAsync()]]. It bundles the filtered source text together with filtered translations of that text into each requested target locale.

Read [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult#SourceText|TextFilterTranslatedResult.SourceText]] and [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult#SourceLanguage|TextFilterTranslatedResult.SourceLanguage]] for the filtered original text and its language, call [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult#GetTranslationForLocale|TextFilterTranslatedResult:GetTranslationForLocale()]] to retrieve the filtered translation for a single locale, or call [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult#GetTranslations|TextFilterTranslatedResult:GetTranslations()]] to retrieve all of them at once.

Instances of this class cannot be created, parented, or replicated; they are only produced by the engine as the return value of the filtering call. That call, [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterAndTranslateStringAsync|TextService:FilterAndTranslateStringAsync()]], is deprecated, so new work should filter and translate chat through [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] instead.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult#SourceLanguage\|SourceLanguage]] | string | The language of the original text that was filtered. |
| [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult#SourceText\|SourceText]] | [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult\|TextFilterResult]] | The filtered form of the original, untranslated text. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult#GetTranslationForLocale\|GetTranslationForLocale()]] | [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult\|TextFilterResult]] | Returns the filtered translation of the source text for the given locale. |
| [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult#GetTranslations\|GetTranslations()]] | Dictionary | Returns all filtered translations of the source text, keyed by language. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### SourceLanguage

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

The language string of the original text that was submitted to [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterAndTranslateStringAsync|TextService:FilterAndTranslateStringAsync()]]. This is the source language that the translations returned by [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult#GetTranslations|TextFilterTranslatedResult:GetTranslations()]] were translated from. This property is read-only.

### SourceText

**Type:** [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult|TextFilterResult]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

A [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult|TextFilterResult]] representing the filtered form of the original text that was submitted to [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterAndTranslateStringAsync|TextService:FilterAndTranslateStringAsync()]], in its [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult#SourceLanguage|TextFilterTranslatedResult.SourceLanguage]]. Use the returned [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult|TextFilterResult]] to obtain the correctly filtered string for each recipient before displaying the untranslated text. This property is read-only.

## Methods

### GetTranslationForLocale

```lua
TextFilterTranslatedResult:GetTranslationForLocale(locale: string): TextFilterResult
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns the filtered [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult|TextFilterResult]] for the translation of the source text into `locale`, or `nil` if the result contains no translation for that locale. The `locale` argument is normalized to its language before lookup, so locale variants that share a language resolve to the same translation.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `locale` | string |  | The locale identifier of the translation to retrieve. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult\|TextFilterResult]] | The filtered [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult\|TextFilterResult]] for the requested locale, or `nil` if the result contains no translation for it. |

### GetTranslations

```lua
TextFilterTranslatedResult:GetTranslations(): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns a dictionary that maps each translation's language string to its filtered [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult|TextFilterResult]]. The keys are the languages that the source text was translated into for the requested target locales; use [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult#GetTranslationForLocale|TextFilterTranslatedResult:GetTranslationForLocale()]] to look up a single locale directly.

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary mapping each translation's language string to its filtered [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult\|TextFilterResult]]. |

---
*Source: [TextFilterTranslatedResult](https://create.roblox.com/docs/reference/engine/classes/TextFilterTranslatedResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
