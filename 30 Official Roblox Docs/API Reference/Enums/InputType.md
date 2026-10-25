---
title: "InputType"
description: "The InputType Enum controls the SurfaceInputs of `Part`."
api_type: enum
aliases: ["Enum.InputType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/InputType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The InputType Enum controls the SurfaceInputs of [[30 Official Roblox Docs/API Reference/Classes/Part|Part]].*

> [!warning] Deprecated
> This enum is deprecated as it is used by deprecated methods. It should not be
> used in new work.

## Description

The InputType Enum controls the SurfaceInputs of [[30 Official Roblox Docs/API Reference/Classes/Part|Part]]. Several parameters here are left-overs from 2005, before Roblox was a multiplayer game, and are used by [[30 Official Roblox Docs/API Reference/Classes/BasePart#BackSurfaceInput|Part.BackSurfaceInput]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#BottomSurfaceInput|Part.BottomSurfaceInput]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#FrontSurfaceInput|Part.FrontSurfaceInput]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#LeftSurfaceInput|Part.LeftSurfaceInput]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#RightSurfaceInput|Part.RightSurfaceInput]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#TopSurfaceInput|Part.TopSurfaceInput]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `NoInput` | 0 | Behaves like a weld and does nothing. |
| `Constant` | 12 | Rotate at a constant velocity of [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] `ParamB`. |
| `Sin` | 13 | Rotate at a velocity of: `ParamA * math.sin(workspace.DistributedGameTime * ParamB)`, where [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] `ParamA` determines the maximum speed at which the part spins, and [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] `ParamB` determines how frequently it changes direction. |

---
*Source: [InputType](https://create.roblox.com/docs/reference/engine/enums/InputType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
