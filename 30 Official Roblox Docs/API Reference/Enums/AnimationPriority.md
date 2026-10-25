---
title: "AnimationPriority"
description: "The AnimationPriority Enum determines how concurrently-playing AnimationTracks contribute to the final animation."
api_type: enum
aliases: ["Enum.AnimationPriority"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AnimationPriority"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*The AnimationPriority Enum determines how concurrently-playing AnimationTracks contribute to the final animation.*

## Description

When multiple [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] are played concurrently by the same [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] and affect the same animated joints, the tracks are evaluated in order from high to low priority, per joint, while the total track weight sum remains less than 1.0. When the track weight sum reaches or exceeds 1.0 for a joint, evaluation stops and no lower-priority tracks will be evaluated for that joint. [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] with the same priority that are playing concurrently will blend proportional to their track weights (normalized if the sum exceeds 1).

Higher priority animation will override lower priority ones per joint. The priority order is:

1. **Action4**
2. **Action3**
3. **Action2**
4. **Action**
5. **Movement**
6. **Idle**
7. **Core**

Roblox's default character animations, including catalog animation bundles, play at **Core** priority. **Idle** through **Action4** priority are for developer use.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Idle` | 0 | (6) - Recommended priority for character idle animations. |
| `Movement` | 1 | (5) - Recommended priority for walk, run, swim, climb, and other locomotion animations. |
| `Action` | 2 | (4) - Recommended priority for character actions that must override idle and locomotion animations. |
| `Action2` | 3 | (3) - Action2 will override Action. |
| `Action3` | 4 | (2) - Action3 will override Action2. |
| `Action4` | 5 | (1) - Action4 is the highest priority available, overriding all other priority values. |
| `Core` | 1000 | (7) - Lowest priority, intended for use by Roblox default animations and catalog animation bundles. |

---
*Source: [AnimationPriority](https://create.roblox.com/docs/reference/engine/enums/AnimationPriority) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
