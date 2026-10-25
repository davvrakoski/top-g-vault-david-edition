---
title: "VideoSampler"
description: "An object for sampling frames from video content."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/VideoSampler"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An object for sampling frames from video content.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

This object lets you get image frames from selected timestamps of a video. To create a [[30 Official Roblox Docs/API Reference/Classes/VideoSampler|VideoSampler]], call [[30 Official Roblox Docs/API Reference/Classes/VideoService#CreateVideoSamplerAsync|VideoService:CreateVideoSamplerAsync()]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoSampler#TimeLength\|TimeLength]] | double | The length of the [[30 Official Roblox Docs/API Reference/Classes/VideoSampler#VideoContent\|VideoContent]] in seconds. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoSampler#VideoContent\|VideoContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The asset loaded into the [[30 Official Roblox Docs/API Reference/Classes/VideoSampler\|VideoSampler]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoSampler#GetSamplesAtTimesAsync\|GetSamplesAtTimesAsync()]] | List<VideoSample> | Gets image frames at the specified timestamps. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### TimeLength

**Type:** double

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

The length of the [[30 Official Roblox Docs/API Reference/Classes/VideoSampler#VideoContent|VideoContent]] in seconds.

### VideoContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

The asset loaded into the [[30 Official Roblox Docs/API Reference/Classes/VideoSampler|VideoSampler]].

## Methods

### GetSamplesAtTimesAsync

```lua
VideoSampler:GetSamplesAtTimesAsync(times: Array): List<VideoSample>
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Yields`

This method allows you to get a set of image frames from a video at specified timestamps as image [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] objects.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `times` | Array |  | An array of requested timestamps in seconds for which to retrieve image frames. Each timestamp should be a number between `0` and [[30 Official Roblox Docs/API Reference/Classes/VideoSampler#TimeLength\|TimeLength]]. |

**Returns**

| Type | Description |
| --- | --- |
| List<VideoSample> | An array of dictionary or nil values for each requested timestamp. If a requested timestamp is out of range or the [[30 Official Roblox Docs/API Reference/Classes/VideoSampler\|VideoSampler]] was unable to produce a sample, the corresponding entry in the returned array will be nil.<br><br>Each dictionary contains the following keys:<br><br>- `Time` (number): The timestamp of the returned image frame in seconds. This value may differ slightly from the requested timestamp. - `Image` ([[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]]): A [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] with a [[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType\|SourceType]] of [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType\|Enum.ContentSourceType.Opaque]] containing the image frame at the corresponding timestamp. |

---
*Source: [VideoSampler](https://create.roblox.com/docs/reference/engine/classes/VideoSampler) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
