---
title: "LocalizationTable"
description: "A LocalizationTable is a database of translations. It contains source strings and translations for various languages."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/LocalizationTable"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A LocalizationTable is a database of translations. It contains source strings and translations for various languages.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A LocalizationTable is a database of translations. It contains source strings and translations for various languages. It is used with the [[30 Official Roblox Docs/API Reference/Classes/Translator|Translator]] and [[30 Official Roblox Docs/API Reference/Classes/LocalizationService|LocalizationService]] auto-translator system to control text translations in the game. LocalizationTables are designed to be treated as resources, like a texture or a script. They are not optimized to be modified at runtime. Changing the contents of a table will cause the entire contents of the table to be replicated to all players.

## LocalizationTable Entries

Each LocalizationTable contains a set of entries. Each entry contains the translations of the text, along with some special fields:

- **Key** is an optional unique key for fast hash lookups in code. If it is non-empty it must be unique in the table.
- **Source** is the original text in the source language that will be used by the [[30 Official Roblox Docs/API Reference/Classes/LocalizationService|LocalizationService]] automatic text replacement system to match GUI text and render a translation instead. The Source field can be filled by the text capture tools, or can be set manually. For key-based lookups the Source value can be used as a translation for [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SourceLocaleId|LocalizationTable.SourceLocaleId]] if the entry doesn't have a translation for that locale. If Source is empty then the entry will not be used by the automatic replacement system.
- **Context** is the full Instance name for the object that the text appeared on. Context is used for disambiguation by the automatic text replacement system. When multiple matches for the Source are found, the system will pick the best match by matching backwards from the end of the Context string. There are other more robust ways to handle disambiguation available as well, like using multiple tables with [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#RootLocalizationTable|GuiBase2d.RootLocalizationTable]].
- **Example** is whatever you want it to be. If the text capture tool guessed some parameters for a string the Example field will contain an example of them used in context.

All of these fields are optional, but at least either Key or Source must be non-empty. No two entries can have the same Key, Source, and Context.

See [[30 Official Roblox Docs/Production/Localization/Translate dynamic content|Translating Dynamic Content]] for more information.

*Code samples for this API (`LocalizationTable1`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/LocalizationTable); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#DevelopmentLanguage\|DevelopmentLanguage]] | string | **Deprecated.** The default IETF tag to use if the ''languageKey'' parameter is excluded from the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#GetString\|LocalizationTable:GetString()]] method. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#Root\|Root]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** The object that is being targeted for localization by this table. Localization is applied to it and all of it's descendants. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SourceLocaleId\|SourceLocaleId]] | string | The locale of source strings. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#GetContents\|GetContents()]] | string | **Deprecated.** Returns the contents of the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable\|LocalizationTable]] serialized as a JSON string. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#GetEntries\|GetEntries()]] | Array | Returns an array of dictionaries, where each dictionary represents an entry of localization data. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#GetString\|GetString()]] | string | **Deprecated.** Returns a translation based on the specified language and key. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#GetTranslator\|GetTranslator()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns a [[30 Official Roblox Docs/API Reference/Classes/Translator\|Translator]] for entries in this LocalizationTable, in the specified locale. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntry\|RemoveEntry()]] | () | Removes an entry from the LocalizationTable, using the specified `key`, `source`, and `context` to narrow down the specific entry to be removed. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntryValue\|RemoveEntryValue()]] | () | Removes a single language translation from the LocalizationTable, using the provided `key`, `source`, `context`, and `localeId` to narrow down the specific entry to be removed. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveKey\|RemoveKey()]] | () | **Deprecated.** Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntry\|LocalizationTable:RemoveEntry()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveTargetLocale\|RemoveTargetLocale()]] | () | Removes all translations from the LocalizationTable with the specified localeId. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SetContents\|SetContents()]] | () | **Deprecated.** Sets the contents of the LocalizationTable, via the legacy JSON format. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SetEntries\|SetEntries()]] | () | Sets the contents of the LocalizationTable. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SetEntry\|SetEntry()]] | () | **Deprecated.** Sets the translation `text` for the `targetLocaleId` locale on the entry identified by `key`, creating the entry if it doesn't exist. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SetEntryContext\|SetEntryContext()]] | () | Sets the **Context** field of a LocalizationTable entry to `newContext`, using the specified `key`, `source`, and `context` to narrow down the entry that will have this change applied. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SetEntryExample\|SetEntryExample()]] | () | Sets the **Example** field of a LocalizationTable entry to `example`, using the specified `key`, `source`, and `context` to narrow down the entry that will have this change applied. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SetEntryKey\|SetEntryKey()]] | () | Sets the **Key** field of a LocalizationTable entry to `newKey`, using the specified `key`, `source`, and `context` to narrow down the entry that will have this change applied. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SetEntrySource\|SetEntrySource()]] | () | Sets the **Source** field of a LocalizationTable entry to `newSource`, using the specified `key`, `source`, and `context` to narrow down the entry that will have this change applied. |
| [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SetEntryValue\|SetEntryValue()]] | () | Sets the text of the specified localeId in a LocalizationTable entry, using the specified `key`, `source`, and `context` to narrow down the entry that will have this change applied. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### DevelopmentLanguage

> [!warning] Deprecated
> This item has been superseded by `Class.LocalizationTable.SourceLocaleId`
> which should be used in all new work.

**Type:** string

**Thread safety:** ReadSafe · **Category:** Localization · **Loaded/Saved:** true/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

The default IETF tag to use if the ''languageKey'' parameter is excluded from the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#GetString|LocalizationTable:GetString()]] method.

### Root

> [!warning] Deprecated
> This item is deprecated. Do not use it for new work.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

The object that is being targeted for localization by this table. Localization is applied to it and all of it's descendants.

### SourceLocaleId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Localization · **Loaded/Saved:** true/true · **Capabilities:** Basic

The Roblox locale of the input key strings for this table, for example "en-us" or "es-es." This is typically the "development language" of the game. For a Translator that merges multiple LocalizationTable objects, it's the LocaleId of the Default LocalizationTable. Defaults to "en-us".

## Methods

### GetContents

> [!warning] Deprecated
> This item has been superseded by `Class.LocalizationTable:GetEntries()`
> which should be used in all new work.

```lua
LocalizationTable:GetContents(): string
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

Deprecated. Prefer [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#GetEntries|LocalizationTable:GetEntries()]], which returns the same data as a structured array of dictionaries. Returns all entries in the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] encoded as a JSON-formatted string, the legacy serialized representation of the table's contents. Each entry is an object containing its `key`, `context`, `examples`, and `source` fields (each omitted when empty) along with a `values` map of locale IDs to translated strings.

**Returns**

| Type | Description |
| --- | --- |
| string | The table's entries encoded as a JSON-formatted string. |

### GetEntries

```lua
LocalizationTable:GetEntries(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Basic

The GetEntries function returns an array of dictionaries contained in a given [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]], where each dictionary represents an entry of localization data.

To set the entries of a LocalizationTable, you can use [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SetEntries|LocalizationTable:SetEntries()]].

Each dictionary in the array contains the following fields:

| Index | Type | Description |
| --- | --- | --- |
| **Key** | [[30 Official Roblox Docs/API Reference/Libraries/string\|string]] | A lookup key for this specific entry in the LocalizationTable. |
| **Source** | [[30 Official Roblox Docs/API Reference/Libraries/string\|string]] | The string used to format the localized string. Used as a lookup if a key is not provided. |
| **Context** | [[30 Official Roblox Docs/API Reference/Libraries/string\|string]] | An [[30 Official Roblox Docs/API Reference/Classes/Instance#GetFullName\|Instance:GetFullName()]] path to the object that was used to generate the LocalizationTable. Used as a lookup if a key is not provided. |
| **Example** | [[30 Official Roblox Docs/API Reference/Libraries/string\|string]] | The string used to format the localization. Optional. |
| **Values** | `Dictionary` | A dictionary of language translations for this localization entry. The keys of this dictionary are locale ids, and the values are strings that are used to apply localization for the language corresponding to the locale id. |

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of dictionaries, where each dictionary represents an entry of localization data. |

*Code samples for this member (`LocalizationTable-GetEntries`) are published on the source page; their code is not part of the open-source repo.*

### GetString

> [!warning] Deprecated
> This item has been superseded by `Class.LocalizationTable:GetTranslator()`
> which should be used in all new work.

```lua
LocalizationTable:GetString(targetLocaleId: string, key: string): string
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

The GetString function returns a translation based on the specified language and key.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `targetLocaleId` | string |  | Specified language. |
| `key` | string |  | An optional unique key for fast hash lookups in code. If it is non-empty it must be unique in the table. |

**Returns**

| Type | Description |
| --- | --- |
| string | Translated string. |

### GetTranslator

```lua
LocalizationTable:GetTranslator(localeId: string): Instance
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Returns a [[30 Official Roblox Docs/API Reference/Classes/Translator|Translator]] for entries in this LocalizationTable, in the specified language. The translator will first search in this table and then look in ancestor tables.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `localeId` | string |  | A Roblox locale identifier (for example, "en-us" or "es-es") specifying the language the returned Translator should target. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/Translator\|Translator]] instance for the specified locale. |

### RemoveEntry

```lua
LocalizationTable:RemoveEntry(key: string, source: string, context: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Removes an entry from the LocalizationTable, using the specified `key`, `source`, and `context` to narrow down the specific entry to be removed.

The entry is identified by the (`key`, `source`, `context`) triple. If `key` is non-empty it alone identifies the entry because keys are unique within the table. If `key` is empty the entry is matched by the (`source`, `context`) pair. When no matching entry exists the call is a silent no-op.

Removing an entry deletes all of its translations and metadata. To remove only a single locale's translation from an entry while keeping the entry itself, use [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntryValue|LocalizationTable:RemoveEntryValue()]] instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The unique key of the entry to remove. If non-empty, identifies the entry by itself. |
| `source` | string |  | The source text of the entry. Used with context to identify the entry when key is empty. |
| `context` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance#GetFullName\|Instance:GetFullName()]] path used for disambiguation. Used with source to identify the entry when key is empty. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RemoveEntryValue

```lua
LocalizationTable:RemoveEntryValue(key: string, source: string, context: string, localeId: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Removes a single language translation from the LocalizationTable, using the provided `key`, `source`, `context`, and `localeId` to narrow down the specific entry to be modified.

The entry is identified by the (`key`, `source`, `context`) triple (see [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntry|LocalizationTable:RemoveEntry()]] for lookup rules). Once the entry is found, only the translation for `localeId` is erased; the entry itself and all other locale translations remain intact. The `localeId` is case-insensitive (it is canonicalized internally). If no matching entry exists, or the entry has no translation for `localeId`, the call is a silent no-op.

To remove the entire entry including all translations, use [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntry|LocalizationTable:RemoveEntry()]]. To remove every translation of a given locale across all entries, use [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveTargetLocale|LocalizationTable:RemoveTargetLocale()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The unique key of the entry. If non-empty, identifies the entry by itself. |
| `source` | string |  | The source text of the entry. Used with context to identify the entry when key is empty. |
| `context` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance#GetFullName\|Instance:GetFullName()]] path used for disambiguation. Used with source to identify the entry when key is empty. |
| `localeId` | string |  | The locale identifier (for example, "fr-fr") whose translation should be removed from the entry. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### RemoveKey

> [!warning] Deprecated
> This item has been superseded by `Class.LocalizationTable:RemoveEntry()`
> which should be used in all new work

```lua
LocalizationTable:RemoveKey(key: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

Deprecated in favor of [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntry|LocalizationTable:RemoveEntry()]]. Calling RemoveKey is the same as making the following call to RemoveEntry:

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The unique key of the entry to remove. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`LocalizationTable-RemoveKey`) are published on the source page; their code is not part of the open-source repo.*

### RemoveTargetLocale

```lua
LocalizationTable:RemoveTargetLocale(localeId: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Removes all translations from the LocalizationTable with the specified `localeId`.

This is a bulk operation that iterates every entry in the table and erases the translation for `localeId` from each one. Entries themselves are not removed even if they have no remaining translations after this call. To remove a single translation from one specific entry, use [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntryValue|LocalizationTable:RemoveEntryValue()]] instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `localeId` | string |  | A Roblox locale identifier (for example, "fr-fr") specifying which language's translations to remove from all entries. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetContents

> [!warning] Deprecated
> This item has been superseded by `Class.LocalizationTable:SetEntries()`
> which should be used in all new work

```lua
LocalizationTable:SetContents(contents: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

The SetContents function sets the contents of the LocalizationTable, via the legacy JSON format.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `contents` | string |  | A JSON-formatted string encoding the table's entries, in the same format returned by [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#GetContents\|LocalizationTable:GetContents()]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetEntries

```lua
LocalizationTable:SetEntries(entries: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Sets the contents of the LocalizationTable.

The entries parameter should be an array of dictionaries in the same format as the one returned from the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#GetEntries|LocalizationTable:GetEntries()]] function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `entries` | Variant |  | An array of dictionaries in the same format returned by [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#GetEntries\|LocalizationTable:GetEntries()]], each containing Key, Source, Context, Example, and Values fields. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetEntry

> [!warning] Deprecated
> This item has been superseded by `Class.LocalizationTable:SetEntries()`
> which should be used in all new work.

```lua
LocalizationTable:SetEntry(key: string, targetLocaleId: string, text: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Deprecated`

Deprecated. Prefer [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SetEntryValue|LocalizationTable:SetEntryValue()]] for matching an entry by key, source, and context, or [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SetEntries|LocalizationTable:SetEntries()]] to set many entries at once. Sets the translation `text` for the locale `targetLocaleId` on the [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] entry identified by `key`, creating a new entry with an empty source and context if no entry with that key exists. When `targetLocaleId` matches the table's [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SourceLocaleId|LocalizationTable.SourceLocaleId]], the entry's **Source** field is also set to `text`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The unique key identifying the entry. If no entry with this key exists, a new entry is created. |
| `targetLocaleId` | string |  | The Roblox locale identifier (for example, "en-us" or "fr-fr") for the translation to set. |
| `text` | string |  | The translation text to store for the specified locale. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetEntryContext

```lua
LocalizationTable:SetEntryContext(key: string, source: string, context: string, newContext: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Sets the **Context** field of a LocalizationTable entry to `newContext`, using the specified `key`, `source`, and `context` to narrow down the entry that will have this change applied.

The entry is identified by the (`key`, `source`, `context`) triple (see [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntry|LocalizationTable:RemoveEntry()]] for lookup rules). If no matching entry exists, a new entry is created with the provided `key`, `source`, and `newContext`. The method throws an error if setting the new context would cause the entry to conflict with another existing entry that shares the same key, source, and context combination.

The **Context** field stores an [[30 Official Roblox Docs/API Reference/Classes/Instance#GetFullName|Instance:GetFullName()]] path that the automatic text replacement system uses for disambiguation when multiple entries share the same **Source** string.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The unique key of the entry. If non-empty, identifies the entry by itself. |
| `source` | string |  | The source text of the entry. Used with context to identify the entry when key is empty. |
| `context` | string |  | The current [[30 Official Roblox Docs/API Reference/Classes/Instance#GetFullName\|Instance:GetFullName()]] path of the entry. Used with source to identify the entry when key is empty. |
| `newContext` | string |  | The new context string to assign to the entry. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetEntryExample

```lua
LocalizationTable:SetEntryExample(key: string, source: string, context: string, example: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Sets the **Example** field of a LocalizationTable entry to `example`, using the specified `key`, `source`, and `context` to narrow down the entry that will have this change applied.

The entry is identified by the (`key`, `source`, `context`) triple (see [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntry|LocalizationTable:RemoveEntry()]] for lookup rules). If no matching entry exists, a new entry is created with the provided `key`, `source`, and `context`. The new `example` value always overwrites any existing example text on the entry.

The **Example** field is an arbitrary metadata string. The text-capture tools use it to store a sample of parameterized content in context, but developers may store any helpful annotation.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The unique key of the entry. If non-empty, identifies the entry by itself. |
| `source` | string |  | The source text of the entry. Used with context to identify the entry when key is empty. |
| `context` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance#GetFullName\|Instance:GetFullName()]] path of the entry. Used with source to identify the entry when key is empty. |
| `example` | string |  | The new example text to assign to the entry, typically a sample of parameterized content in context. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetEntryKey

```lua
LocalizationTable:SetEntryKey(key: string, source: string, context: string, newKey: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Sets the **Key** field of a LocalizationTable entry to `newKey`, using the specified `key`, `source`, and `context` to narrow down the entry that will have this change applied.

The entry is identified by the (`key`, `source`, `context`) triple (see [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntry|LocalizationTable:RemoveEntry()]] for lookup rules). If no matching entry exists, a new entry is created with `newKey`, the provided `source`, and `context`. The method throws an error if `newKey` would conflict with an existing entry's key, because keys must be unique within the table. If `newKey` equals the entry's current key the call is a no-op.

The **Key** field is an optional unique identifier for fast hash lookups via [[30 Official Roblox Docs/API Reference/Classes/Translator#FormatByKey|Translator:FormatByKey()]]. When non-empty it must be unique across the entire table.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The current unique key of the entry. If non-empty, identifies the entry by itself. |
| `source` | string |  | The source text of the entry. Used with context to identify the entry when key is empty. |
| `context` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance#GetFullName\|Instance:GetFullName()]] path of the entry. Used with source to identify the entry when key is empty. |
| `newKey` | string |  | The new key string to assign to the entry. Must be unique within the table if non-empty. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetEntrySource

```lua
LocalizationTable:SetEntrySource(key: string, source: string, context: string, newSource: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Sets the **Source** field of a LocalizationTable entry to `newSource`, using the specified `key`, `source`, and `context` to narrow down the entry that will have this change applied.

The entry is identified by the (`key`, `source`, `context`) triple (see [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntry|LocalizationTable:RemoveEntry()]] for lookup rules). If no matching entry exists, a new entry is created with the provided `key`, `newSource`, and `context`. The method throws an error if the resulting (`key`, `newSource`, `context`) combination would conflict with an existing entry. If `newSource` equals the entry's current source the call is a no-op.

The **Source** field is the original text in the source language used by the [[30 Official Roblox Docs/API Reference/Classes/LocalizationService|LocalizationService]] automatic text replacement system to match GUI text at runtime. Changing the source also recomputes the internal expression matcher, so parameterized format strings (e.g. `{1:translate}`) are re-parsed immediately.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The unique key of the entry. If non-empty, identifies the entry by itself. |
| `source` | string |  | The current source text of the entry. Used with context to identify the entry when key is empty. |
| `context` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance#GetFullName\|Instance:GetFullName()]] path of the entry. Used with source to identify the entry when key is empty. |
| `newSource` | string |  | The new source text to assign to the entry. Used by the automatic text replacement system for matching GUI text at runtime. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetEntryValue

```lua
LocalizationTable:SetEntryValue(key: string, source: string, context: string, localeId: string, text: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Sets the text of the specified `localeId` in a LocalizationTable entry, using the specified `key`, `source`, and `context` to narrow down the entry that will have this change applied.

The entry is identified by the (`key`, `source`, `context`) triple (see [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntry|LocalizationTable:RemoveEntry()]] for lookup rules). If no matching entry exists, a new entry is created with the provided `key`, `source`, and `context` — this throws an error if both `key` and `source` are empty. The `localeId` is case-insensitive (it is canonicalized internally).

If `text` is non-empty the translation is stored (or replaced) for `localeId` on that entry. The text must be a valid format string (parameters like `{1:translate}` must be well-formed or the call throws). If `text` is an empty string the translation for `localeId` is removed from the entry, equivalent to calling [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#RemoveEntryValue|LocalizationTable:RemoveEntryValue()]].

To set multiple entries at once, use [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#SetEntries|LocalizationTable:SetEntries()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `key` | string |  | The unique key of the entry. If non-empty, identifies the entry by itself. |
| `source` | string |  | The source text of the entry. Used with context to identify the entry when key is empty. |
| `context` | string |  | The [[30 Official Roblox Docs/API Reference/Classes/Instance#GetFullName\|Instance:GetFullName()]] path of the entry. Used with source to identify the entry when key is empty. |
| `localeId` | string |  | The Roblox locale identifier (for example, "fr-fr") for the translation to set or remove. |
| `text` | string |  | The translation text to store. If empty, the translation for the specified locale is removed from the entry. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [LocalizationTable](https://create.roblox.com/docs/reference/engine/classes/LocalizationTable) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
