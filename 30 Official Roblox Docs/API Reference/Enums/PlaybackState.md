---
title: "PlaybackState"
description: "Describes the current state of a `Tween` in its `Tween.PlaybackState` property."
api_type: enum
aliases: ["Enum.PlaybackState"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/PlaybackState"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the current state of a [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] in its [[30 Official Roblox Docs/API Reference/Classes/TweenBase#PlaybackState|Tween.PlaybackState]] property.*

## Description

Describes the current playback state of a [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]], accessible via its [[30 Official Roblox Docs/API Reference/Classes/TweenBase#PlaybackState|TweenBase.PlaybackState]] property. The state advances through a defined lifecycle: a newly created tween begins in `Begin`; calling [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Play|TweenBase:Play()]] moves it to `Delayed` (when [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#DelayTime|TweenInfo.DelayTime]] is greater than `0`) or directly to `Playing`; from `Playing` the tween can be suspended (`Paused`), stopped early (`Cancelled`), or reach its natural end (`Completed`). The [[30 Official Roblox Docs/API Reference/Classes/TweenBase#Completed|TweenBase.Completed]] event fires when the state transitions to either `Completed` or `Cancelled`.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Begin` | 0 | The tween has been created, but has yet to be played. After exiting this state, the tween never enters it again. |
| `Delayed` | 1 | The tween is waiting for the duration specified in its [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo#DelayTime\|TweenInfo.DelayTime]]. After the delay elapses, the tween plays. |
| `Playing` | 2 | The tween is currently in progress. |
| `Paused` | 3 | The tween is paused in the middle of playing. |
| `Completed` | 4 | The tween completed successfully. |
| `Cancelled` | 5 | The tween was cancelled before completion. |

---
*Source: [PlaybackState](https://create.roblox.com/docs/reference/engine/enums/PlaybackState) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
