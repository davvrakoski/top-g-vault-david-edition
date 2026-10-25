---
title: "GradientType"
description: "Used alongside `UIGradient.Type` to set the shape of the gradient."
api_type: enum
aliases: ["Enum.GradientType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/GradientType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used alongside [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Type|UIGradient.Type]] to set the shape of the gradient.*

## Description

Used alongside [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Type|UIGradient.Type]] to set the shape of the gradient as linear, radial, elliptical, or conical.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Linear` | 0 | The color/transparency sequence transitions in a straight line across the element. The direction is controlled by [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation\|Rotation]] and the position by [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset\|Offset]]. |
| `Radial` | 1 | The color/transparency sequence radiates outward from the element's center, optionally shifted by [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset\|Offset]]. The radius is defined by the average of the element's width and height divided by two, effectively `(width+height)/4`. [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation\|Rotation]] has no effect on a radial gradient. |
| `Conical` | 2 | The color/transparency sequence sweeps clockwise around the center of the element, optionally shifted by [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset\|Offset]]. [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation\|Rotation]] controls the starting angle of the sweep. |
| `Elliptical` | 3 | The color/transparency sequence radiates outward from the element's center in an ellipse, optionally shifted by [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset\|Offset]]. The ellipse's horizontal and vertical radii are half the element's width and height, respectively, so the ellipse fits the element's bounds. [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation\|Rotation]] rotates the ellipse's axes. |

---
*Source: [GradientType](https://create.roblox.com/docs/reference/engine/enums/GradientType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
