---
title: "VideoService"
description: "An internal service that offers no functionality to developers."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/VideoService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An internal service that offers no functionality to developers.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

[[30 Official Roblox Docs/API Reference/Classes/VideoService|VideoService]] creates [[30 Official Roblox Docs/API Reference/Classes/VideoSampler|VideoSampler]] objects used to extract still frames from video content.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoService#CreateVideoSamplerAsync\|CreateVideoSamplerAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/VideoSampler\|VideoSampler]] | Creates a [[30 Official Roblox Docs/API Reference/Classes/VideoSampler\|VideoSampler]] that samples frames from the provided video content. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CreateVideoSamplerAsync

```lua
VideoService:CreateVideoSamplerAsync(content: Content, options: Dictionary?): VideoSampler
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Yields`

Creates a [[30 Official Roblox Docs/API Reference/Classes/VideoSampler|VideoSampler]] that samples frames from the provided video content.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `content` | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |  | The video content to sample from. |
| `options` | Dictionary? |  | Options table for creating the [[30 Official Roblox Docs/API Reference/Classes/VideoSampler\|VideoSampler]]:<br><br>- `Size` – A [[30 Official Roblox Docs/API Reference/Enums/VideoSampleSize\|Enum.VideoSampleSize]] value that determines the resolution of textures produced by the [[30 Official Roblox Docs/API Reference/Classes/VideoSampler\|VideoSampler]]. Defaults to [[30 Official Roblox Docs/API Reference/Enums/VideoSampleSize\|Enum.VideoSampleSize.Small]]. Use the smallest resolution that meets your needs to minimize memory usage and improve sampling performance. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoSampler\|VideoSampler]] | The created [[30 Official Roblox Docs/API Reference/Classes/VideoSampler\|VideoSampler]]. |

---
*Source: [VideoService](https://create.roblox.com/docs/reference/engine/classes/VideoService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
