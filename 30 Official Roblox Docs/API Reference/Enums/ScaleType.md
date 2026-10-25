---
title: "ScaleType"
description: "Determines how an image (of a `ImageLabel` or `ImageButton`) is scaled."
api_type: enum
aliases: ["Enum.ScaleType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ScaleType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines how an image (of a [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] or [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]]) is scaled.*

## Description

Controls the method by which an image is scaled to fill a [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]], [[30 Official Roblox Docs/API Reference/Classes/ImageButton|ImageButton]], or [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay|VideoDisplay]] element. When the source image's dimensions differ from the element's rendered size, each `ScaleType` value determines whether the image is stretched uniformly to fill, tiled in a repeating grid, cropped to cover the element, letterboxed to fit without cropping, or divided into independently scalable 9-slice regions that preserve border details at any element size.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Stretch` | 0 | The image is stretched to fit within the element. |
| `Slice` | 1 | 9-Slice scaling: slice the image into 9 regions and apply different scaling rules to each region. The slice boundaries are determined by [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#SliceCenter\|ImageLabel.SliceCenter]] or [[30 Official Roblox Docs/API Reference/Classes/ImageButton#SliceCenter\|ImageButton.SliceCenter]]. See [[30 Official Roblox Docs/UI/UI 9-slice design\|UI 9-Slice Design]] for more information. |
| `Tile` | 2 | The image is tiled to fit within the element. For example, if the element is twice the X dimension of the image, the image will appear twice (2 tiles). |
| `Fit` | 3 | The image is scaled fit within the element X or Y dimension (whichever fits first). |
| `Crop` | 4 | The image is cropped to fit within the element. |

---
*Source: [ScaleType](https://create.roblox.com/docs/reference/engine/enums/ScaleType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
