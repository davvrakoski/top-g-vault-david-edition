---
title: "CompositeValueCurveType"
description: "Describes the type of value animated by a `CompositeValueCurve`."
api_type: enum
aliases: ["Enum.CompositeValueCurveType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CompositeValueCurveType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the type of value animated by a [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve|CompositeValueCurve]].*

## Description

Describes the type of value animated by a [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve|CompositeValueCurve]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `ColorRGB` | 0 | The [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve\|CompositeValueCurve]] will animate children of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] named `"R"`, `"G"`, and `"B"` to animate the corresponding components of the [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] value returned by the method [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#GetValueAtTime\|CompositeValueCurve:GetValueAtTime()]]. |
| `ColorHSV` | 1 | The [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve\|CompositeValueCurve]] will animate children of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] named `"H"`, `"S"`, and `"V"` to animate hue, saturation, and value of a color that will be converted to RGB before returning a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] value from the method [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#GetValueAtTime\|CompositeValueCurve:GetValueAtTime()]]. |
| `NumberRange` | 2 | The [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve\|CompositeValueCurve]] will animate children of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] named `"Min"` and `"Max"` to animate the corresponding components of the [[30 Official Roblox Docs/API Reference/Datatypes/NumberRange\|NumberRange]] value returned by the method [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#GetValueAtTime\|CompositeValueCurve:GetValueAtTime()]]. |
| `Rect` | 3 | The [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve\|CompositeValueCurve]] will animate children of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] named `"MinX"`, `"MaxX"`, `"MinY"`, and `"MaxY"` to animate the corresponding components of the [[30 Official Roblox Docs/API Reference/Datatypes/Rect\|Rect]] value returned by the method [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#GetValueAtTime\|CompositeValueCurve:GetValueAtTime()]]. |
| `UDim` | 4 | The [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve\|CompositeValueCurve]] will animate children of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] named `"Scale"` and `"Offset"` to animate the corresponding components of the [[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]] value returned by the method [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#GetValueAtTime\|CompositeValueCurve:GetValueAtTime()]]. |
| `UDim2` | 5 | The [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve\|CompositeValueCurve]] will animate children of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] named `"ScaleX"`, `"OffsetX"`, `"ScaleY"`, and `"OffsetY"` to animate the corresponding components of the [[30 Official Roblox Docs/API Reference/Datatypes/UDim2\|UDim2]] value returned by the method [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#GetValueAtTime\|CompositeValueCurve:GetValueAtTime()]]. |
| `Vector2` | 6 | The [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve\|CompositeValueCurve]] will animate children of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] named `"X"` and `"Y"` to animate the corresponding components of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] value returned by the method [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#GetValueAtTime\|CompositeValueCurve:GetValueAtTime()]]. |
| `Vector3` | 7 | The [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve\|CompositeValueCurve]] will animate children of type [[30 Official Roblox Docs/API Reference/Classes/FloatCurve\|FloatCurve]] named `"X"`, `"Y"`, and `"Z"` to animate the corresponding components of the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] value returned by the method [[30 Official Roblox Docs/API Reference/Classes/CompositeValueCurve#GetValueAtTime\|CompositeValueCurve:GetValueAtTime()]]. |

---
*Source: [CompositeValueCurveType](https://create.roblox.com/docs/reference/engine/enums/CompositeValueCurveType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
