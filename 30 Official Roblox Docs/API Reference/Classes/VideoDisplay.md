---
title: "VideoDisplay"
description: "A GUI object that displays video content from a connected `VideoPlayer`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/VideoDisplay"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A GUI object that displays video content from a connected [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Gui
- **Tags:** `NotBrowsable`

## Description

A [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay|VideoDisplay]] is a GUI object that displays video content from a [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]] connected via a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]]. It functions similarly to a [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] but is designed for video playback.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#ResampleMode\|ResampleMode]] | [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode\|ResamplerMode]] | Selects the texture resampling mode for the [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay\|VideoDisplay]]. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#ScaleType\|ScaleType]] | [[30 Official Roblox Docs/API Reference/Enums/ScaleType\|ScaleType]] | Determines how a video will scale if displayed in a UI element whose aspect ratio differs from the source video. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#TileSize\|TileSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] | Sets the tiling size of the [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay\|VideoDisplay]]. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#VideoColor3\|VideoColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Determines how a rendered video will be colorized. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#VideoRectOffset\|VideoRectOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The offset in pixels of the sub-area of a video to be displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#VideoRectSize\|VideoRectSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Determines the size in pixels of the sub-area of a video to be displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#VideoTransparency\|VideoTransparency]] | float | Determines the transparency of the rendered video. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#GetConnectedWires\|GetConnectedWires()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] that are connected to the specified pin. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#GetInputPins\|GetInputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|Wire.TargetInstance]] property. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#GetOutputPins\|GetOutputPins()]] | Array | Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|Wire.SourceInstance]] property. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#WiringChanged\|WiringChanged]] | `connected`, `pin`, `wire`, `instance` | Fires when another instance is connected to or disconnected from the [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay\|VideoDisplay]] via a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ResampleMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode|ResamplerMode]]

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines how the video looks when it is scaled. By default, the video smooths out texturing when displayed on the screen larger or smaller than its size in texture memory. When set to [[30 Official Roblox Docs/API Reference/Enums/ResamplerMode|Enum.ResamplerMode.Pixelated]], the video preserves the sharp edges of pixels.

### ScaleType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ScaleType|ScaleType]]

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines how a video texture is rendered when the UI element's aspect ratio differs from the source video's aspect ratio.

By default, this property is [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Stretch]] which will simply stretch/compact the video texture dimensions so it fits the UI element's space exactly.

### TileSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/UDim2|UDim2]]

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** UI

This property sets the tiling size of the [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay|VideoDisplay]] with a default of

`Datatype.UDim2.new(1, 0, 1, 0)`

. Tiling
starts at the top-left corner of the video. This property is only active if the [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#ScaleType|ScaleType]] for the [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay|VideoDisplay]] is set to [[30 Official Roblox Docs/API Reference/Enums/ScaleType|Enum.ScaleType.Tile]].

### VideoColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines how a video is colorized. When set to white, no colorization occurs. This property is useful for reusing video assets.

### VideoRectOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** UI

Allows the partial display of a video in conjunction with [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#VideoRectSize|VideoRectSize]]. This property determines the pixel offset (from the top-left) of the video area to be displayed.

### VideoRectSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** UI

Allows the partial display of a video in conjunction with [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay#VideoRectOffset|VideoRectOffset]]. This property determines the pixel size of the video area to be displayed. If either dimension is set to `0`, the entire video is displayed instead.

### VideoTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Video · **Loaded/Saved:** true/true · **Capabilities:** UI

Determines the alpha of a UI element's rendered video texture. A value of `0` is completely opaque, and a value of `1` is completely transparent (invisible).

## Methods

### GetConnectedWires

```lua
VideoDisplay:GetConnectedWires(pin: string): List<Wire>
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]] that are connected to the specified pin. [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay|VideoDisplay]] has one "Input" pin.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `pin` | string |  | An input or output pin on this instance |

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wires]] |

### GetInputPins

```lua
VideoDisplay:GetInputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** UI

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|Wire.TargetName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|Wire.TargetInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay|VideoDisplay]], this is `Input` only.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

### GetOutputPins

```lua
VideoDisplay:GetOutputPins(): Array
```

**Thread safety:** Unsafe · **Capabilities:** UI

Gets the list of pins that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] can use in [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|Wire.SourceName]] to connect to this instance via its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|Wire.SourceInstance]] property.

For [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay|VideoDisplay]], there are none.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing valid pin names. |

## Events

### WiringChanged

```lua
VideoDisplay.WiringChanged(connected: boolean, pin: string, wire: Wire, instance: Instance)
```

**Capabilities:** UI

Fires after a [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] becomes connected or disconnected, and that [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is now or was previously connected to a pin on the [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay|VideoDisplay]] and to some other wirable instance.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `connected` | boolean |  | Whether the instance got connected or disconnected. |
| `pin` | string |  | The pin on the [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay\|VideoDisplay]] that the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] targets. |
| `wire` | [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] between the [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay\|VideoDisplay]] and the other instance. |
| `instance` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The other instance that is or was connected through the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]]. |

---
*Source: [VideoDisplay](https://create.roblox.com/docs/reference/engine/classes/VideoDisplay) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
