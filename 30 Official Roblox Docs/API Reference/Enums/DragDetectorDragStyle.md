---
title: "DragDetectorDragStyle"
description: "Used with `DragDetector` as the paradigm to generate proposed motion, given a stream of cursor rays."
api_type: enum
aliases: ["Enum.DragDetectorDragStyle"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DragDetectorDragStyle"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used with [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] as the paradigm to generate proposed motion, given a stream of cursor rays.*

## Description

Used with [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetector]] as the paradigm to generate proposed motion, given a stream of cursor rays.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `TranslateLine` | 0 | 1D motion along the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]], by default the world **Y** axis. |
| `TranslatePlane` | 1 | 2D motion in the plane **perpendicular** to the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]], by default the world **XZ** plane. |
| `TranslatePlaneOrLine` | 2 | 2D motion in the plane **perpendicular** to the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]] and, when the modifier is active, 1D motion along the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]]. |
| `TranslateLineOrPlane` | 3 | 1D motion along the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]] and, when the modifier is active, 2D motion in the plane **perpendicular** to the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]]. |
| `TranslateViewPlane` | 4 | 2D motion in the plane perpendicular to the camera's view. In this mode, the plane is constantly updated, even while dragging, and will always face the camera's current view. |
| `RotateAxis` | 5 | Rotation about the detector's [[30 Official Roblox Docs/API Reference/Classes/DragDetector#Axis\|Axis]], by default the world **Y** axis. |
| `RotateTrackball` | 6 | Trackball rotation, further customized through the [[30 Official Roblox Docs/API Reference/Classes/DragDetector#TrackballRadialPullFactor\|TrackballRadialPullFactor]] and [[30 Official Roblox Docs/API Reference/Classes/DragDetector#TrackballRollFactor\|TrackballRollFactor]] properties. |
| `Scriptable` | 7 | Calculates desired motion via a custom function provided through [[30 Official Roblox Docs/API Reference/Classes/DragDetector#SetDragStyleFunction\|SetDragStyleFunction()]]. |
| `BestForDevice` | 8 | **TranslatePlaneOrLine** for mouse and gamepad; **TranslatePlane** for touch; **6DOF** for VR. |

---
*Source: [DragDetectorDragStyle](https://create.roblox.com/docs/reference/engine/enums/DragDetectorDragStyle) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
