---
title: "Translator"
description: "The role of a Translator is to manufacture/return strings localized for the viewing player."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Translator"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The role of a Translator is to manufacture/return strings localized for the viewing player.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

The role of a Translator is to manufacture/return strings localized for the viewing player. It can be used to retrieve display-ready localized text from a [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]]. The source of the [[30 Official Roblox Docs/API Reference/Classes/Translator#LocaleId|Translator.LocaleId]] property, the set of tables it will search, and the order it will search them in depends on which method was used to create the Translator instance.

The input for a Translator is the original development language string and a context, where all or part of the context can be used to find a more precise/situational translation for the source string.

The Translator can also be used to manufacture translated strings with inserts (data replacements) which may change order based on the target language.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Translator#LocaleId\|LocaleId]] | string | The locale of translated strings. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Translator#FormatByKey\|FormatByKey()]] | string | Returns the localized text string in a [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable\|LocalizationTable]] based on its [[30 Official Roblox Docs/API Reference/Classes/Translator\|Translator]] locale, by key. |
| [[30 Official Roblox Docs/API Reference/Classes/Translator#Translate\|Translate()]] | string | Returns the localized text string in a [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable\|LocalizationTable]] based on its [[30 Official Roblox Docs/API Reference/Classes/Translator\|Translator]] locale, by source lookup. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### LocaleId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

The Roblox locale of the output translated strings from this table, for example "en-us" or "es-es." Defaults to "en-us".

## Methods

### FormatByKey

```lua
Translator:FormatByKey(key: string, args: Variant): string
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns the localized text string in a [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] based on its [[30 Official Roblox Docs/API Reference/Classes/Translator|Translator]] locale, by key. The optional **args** table is used for filling format parameters in the matching text entry.

Note that this method will throw an error in the following cases:

- If none of the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTables]] available to this [[30 Official Roblox Docs/API Reference/Classes/Translator|Translator]] include a value for the given key.
- If the [[30 Official Roblox Docs/Production/Localization/Translate dynamic content|format string]] for the key uses numbered parameters and **args** is not an array.
- If the [[30 Official Roblox Docs/Production/Localization/Translate dynamic content|format string]] uses named parameters and **args** is not a table of key-value pairs.
- If **args** is missing values for parameters that are used in the matching [[30 Official Roblox Docs/Production/Localization/Translate dynamic content|format string]].

See [[30 Official Roblox Docs/Production/Localization/Localize with scripting|Localize with scripting]] for more details and usage examples of this function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The **Key** value to look up and translate. |
| `args` | Variant |  | To be provided if the **Source** text and translations contain format strings. Will be a Luau table of values **or** key-value pairs, depending on whether the format strings are numbered or named. |

**Returns**

| Type | Description |
| --- | --- |
| string | The localized text string associated with the given **key**, with any format parameters filled in from **args**. |

### Translate

```lua
Translator:Translate(context: Instance, text: string): string
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns the localized text string in a [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] based on its [[30 Official Roblox Docs/API Reference/Classes/Translator|Translator]] locale. This string will be in the context of the provided object, given the provided **Source** text.

See [[30 Official Roblox Docs/Production/Localization/Localize with scripting|Localize with scripting]] for more details and usage examples of this function.

#### Context Overrides

In some cases, duplicate **Source** strings may have completely different translations in other languages. For example, the English noun "Screen" can indicate both a computer screen and a window screen, but the Spanish translations are completely different:

| | | | | |
| --- | --- | --- | --- | --- |
| A | B | C | D | E |
| Key | Context | **Source** | Example | **es** |
|  |  | Screen |  | Pantalla |
|  |  | Screen |  | Mosquitero |
|  |  |  |  |  |

In these cases, the first argument to this function — a valid in-game [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] — can be used as a "tie breaker" when multiple GUI objects use the same source string. To implement this, specify the "path" to the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] you'd like to override as the **Context** value of the translation data:

| | | | | |
| --- | --- | --- | --- | --- |
| A | B | C | D | E |
| Key | **Context** | Source | Example | es |
|  | workspace.ComputerScreen.SurfaceGui.TextLabel | Screen |  | Pantalla |
|  |  | Screen |  | Mosquitero |
|  |  |  |  |  |

Then, when calling this function in a script, pass the same [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] as the first argument, followed by the **Source** lookup text as the second argument:

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `context` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | A valid in-game [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] to use for context override as outlined above. Note that this argument can be arbitrary, for example `game`, if you don't require a context override. |
| `text` | string |  | The **Source** text to look up and translate. |

**Returns**

| Type | Description |
| --- | --- |
| string | The translated text. |

*Code samples for this member (`Translator-Translate`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Translator](https://create.roblox.com/docs/reference/engine/classes/Translator) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
