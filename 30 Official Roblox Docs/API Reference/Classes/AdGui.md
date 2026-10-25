---
title: "AdGui"
description: "A surface-based GUI that displays immersive ads on a face of a `Part` in the 3D world."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AdGui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A surface-based GUI that displays immersive ads on a face of a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] in the 3D world.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase|SurfaceGuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Internal

## Description

[[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]] is a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase|SurfaceGuiBase]] that renders immersive display ads onto a face of the [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] it's adorned to. When no ad is available, it shows the creator-supplied [[30 Official Roblox Docs/API Reference/Classes/AdGui#FallbackImage|AdGui.FallbackImage]], or a default Roblox fallback image when that property is empty.

To render ads, the [[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]] must be adorned to a block [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] that's a descendant of [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], must be the only surface GUI on that face, and must be at least the minimum eligible size. When these conditions aren't met, the object displays a placeholder image in Studio's edit view and renders nothing in a running experience.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AdGui#AdShape\|AdShape]] | [[30 Official Roblox Docs/API Reference/Enums/AdShape\|AdShape]] | Determines the shape of the ad displayed by the [[30 Official Roblox Docs/API Reference/Classes/AdGui\|AdGui]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AdGui#EnableVideoAds\|EnableVideoAds]] | boolean | Enables the AdGui to serve video ads. |
| [[30 Official Roblox Docs/API Reference/Classes/AdGui#FallbackImage\|FallbackImage]] | ContentId | The image the [[30 Official Roblox Docs/API Reference/Classes/AdGui\|AdGui]] displays when no ad is available to serve. |
| [[30 Official Roblox Docs/API Reference/Classes/AdGui#FallbackImageContent\|FallbackImageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] equivalent of [[30 Official Roblox Docs/API Reference/Classes/AdGui#FallbackImage\|AdGui.FallbackImage]] that supports asset URIs and [[30 Official Roblox Docs/API Reference/Classes/EditableImage\|EditableImage]] objects. |
| [[30 Official Roblox Docs/API Reference/Classes/AdGui#Status\|Status]] | [[30 Official Roblox Docs/API Reference/Enums/AdUnitStatus\|AdUnitStatus]] | Indicates whether the [[30 Official Roblox Docs/API Reference/Classes/AdGui\|AdGui]] is currently displaying a served ad. |

### Callbacks

| Callback | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AdGui#OnAdEvent\|OnAdEvent()]] | boolean | **Deprecated.** Used to react to the AdGui events. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/SurfaceGuiBase|SurfaceGuiBase]], [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AdShape

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AdShape|AdShape]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines the shape of the ad rendered by the [[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]], including the creative's aspect ratio on the part surface. Defaults to [[30 Official Roblox Docs/API Reference/Enums/AdShape|HorizontalRectangle]], which is the only served shape aside from the sentinel [[30 Official Roblox Docs/API Reference/Enums/AdShape|Undefined]].

### EnableVideoAds

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** UI, Monetization

The property enables the AdGui to serve video ads.

### FallbackImage

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

A creator-supplied image that the [[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]] displays when it has no served ad to render. Defaults to an empty content string; while empty, the [[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]] renders a default Roblox fallback image instead.

### FallbackImageContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** UI

A [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]-typed property that holds the fallback image the [[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]] displays when no served ad is available. It is the content-typed backing for [[30 Official Roblox Docs/API Reference/Classes/AdGui#FallbackImage|AdGui.FallbackImage]] (a legacy `TextureId` string); writing to either property updates the same underlying storage. Unlike `FallbackImage`, this property accepts [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) and references to [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] objects. When empty, the [[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]] renders a default Roblox fallback image instead.

### Status

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AdUnitStatus|AdUnitStatus]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Capabilities:** UI, Monetization · **Tags:** `ReadOnly`, `NotReplicated`

A read-only property that reports whether the [[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]] is actively displaying a served ad. It's [[30 Official Roblox Docs/API Reference/Enums/AdUnitStatus|Active]] when the [[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]] is rendering ad content, and [[30 Official Roblox Docs/API Reference/Enums/AdUnitStatus|Inactive]] otherwise.

## Callbacks

### OnAdEvent

> [!warning] Deprecated
> This callback has been deprecated and will never be called.

```lua
AdGui.OnAdEvent(eventInfo: Dictionary): boolean
```

**Thread safety:** Unsafe · **Capabilities:** UI, Monetization · **Tags:** `Deprecated`

Used to react to the AdGui events.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `eventInfo` | Dictionary |  | Options table for the method:<br><br>- `PlayerId` – The user ID of the player related to the ad event. - `AdEventType` – A [Enum.AdEventType](https://create.roblox.com/docs/reference/engine/enums/AdEventType) enum value describing the AdGui events. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the callback has successfully reacted to the event. |

---
*Source: [AdGui](https://create.roblox.com/docs/reference/engine/classes/AdGui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
