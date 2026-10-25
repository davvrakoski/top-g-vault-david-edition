---
title: "AudioSearchParams"
description: "Instance to be passed to `AssetService:SearchAudioAsync()` to search for audio assets."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AudioSearchParams"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Instance to be passed to [[30 Official Roblox Docs/API Reference/Classes/AssetService#SearchAudioAsync|AssetService:SearchAudioAsync()]] to search for audio assets.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotReplicated`

## Description

Instance to be passed to [[30 Official Roblox Docs/API Reference/Classes/AssetService#SearchAudioAsync|AssetService:SearchAudioAsync()]] to search for audio assets.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams#Album\|Album]] | string | The album the audio asset belongs to. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams#Artist\|Artist]] | string | The artist that created the audio asset. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams#AudioSubType\|AudioSubType]] | [[30 Official Roblox Docs/API Reference/Enums/AudioSubType\|AudioSubType]] | The subtype of the audio asset. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams#AudioSubtype\|AudioSubtype]] | [[30 Official Roblox Docs/API Reference/Enums/AudioSubType\|AudioSubType]] | **Deprecated.** The subtype of the audio asset. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams#MaxDuration\|MaxDuration]] | int | The maximum duration of the audio asset. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams#MaxPageSize\|MaxPageSize]] | int | The maximum number of results to return per page. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams#MinDuration\|MinDuration]] | int | The minimum duration of the audio asset. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams#SearchKeyword\|SearchKeyword]] | string | The keyword to search for. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams#SortType\|SortType]] | [[30 Official Roblox Docs/API Reference/Enums/AudioSortType\|AudioSortType]] | How results are ordered. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams#Tag\|Tag]] | string | The tag of the audio asset. |
| [[30 Official Roblox Docs/API Reference/Classes/AudioSearchParams#Title\|Title]] | string | The title of the audio asset. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Album

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AssetRead

Searches for audio which belongs to this album. Needs to be an exact match.

### Artist

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AssetRead

Searches for audio which was created by this artist. Needs to be an exact match.

### AudioSubType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AudioSubType|AudioSubType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AssetRead

Searches for audio with this subtype, corresponding to the [[30 Official Roblox Docs/API Reference/Enums/AudioSubType|Enum.AudioSubType]] enum. Defaults to [[30 Official Roblox Docs/API Reference/Enums/AudioSubType|Enum.AudioSubType.Music]].

### AudioSubtype

> [!warning] Deprecated
> Use `Class.AudioSearchParams.AudioSubType|AudioSubType` instead.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AudioSubType|AudioSubType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** AssetRead · **Tags:** `NotReplicated`, `Deprecated`

Searches for audio with this subtype, corresponding to the [[30 Official Roblox Docs/API Reference/Enums/AudioSubType|Enum.AudioSubType]] enum. Defaults to [[30 Official Roblox Docs/API Reference/Enums/AudioSubType|Enum.AudioSubType.Music]].

### MaxDuration

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AssetRead

Searches for audio with a duration less than or equal to this value.

### MaxPageSize

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AssetRead

The maximum number of results returned per page, up to `100`; larger values are treated as `100`. When left at the default of `0` the service chooses the page size.

### MinDuration

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AssetRead

Searches for audio with a duration greater than or equal to this value.

### SearchKeyword

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AssetRead

Searches for audio relevant to this keyword.

### SortType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AudioSortType|AudioSortType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AssetRead

Controls how results are ordered, corresponding to the [[30 Official Roblox Docs/API Reference/Enums/AudioSortType|Enum.AudioSortType]] enum. Defaults to [[30 Official Roblox Docs/API Reference/Enums/AudioSortType|Enum.AudioSortType.Relevance]].

### Tag

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AssetRead

Searches for audio which has this tag. Needs to be an exact match.

### Title

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AssetRead

Searches for audio with this title. Needs to be an exact match.

---
*Source: [AudioSearchParams](https://create.roblox.com/docs/reference/engine/classes/AudioSearchParams) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
