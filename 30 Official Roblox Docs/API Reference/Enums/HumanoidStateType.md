---
title: "HumanoidStateType"
description: "Describes the physics control states within the Humanoid."
api_type: enum
aliases: ["Enum.HumanoidStateType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/HumanoidStateType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the physics control states within the Humanoid.*

## Description

Identifies, reads and sets the physics control state of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState|Humanoid:GetState()]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ChangeState|Humanoid:ChangeState()]] methods, as well as the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StateChanged|Humanoid.StateChanged]] event currently use this Enum.

Some states only allow manual setting, and allow a developer to make the Humanoid relinquish control of its character.

When altering the Humanoid of a player, this should be done from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] ran by that player on their local client. Certain states only work when set by the owner process (client or server). (Dead for example)

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `FallingDown` | 0 | The Humanoid has been tripped, and will attempt to get up in a few moments. |
| `Ragdoll` | 1 | (Deprecated) The Humanoid has been hit by a fast moving object (uncontrolled falling). _The Humanoid can recover from this._ This state has to be set and unset manually using [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ChangeState\|Humanoid:ChangeState()]]. |
| `GettingUp` | 2 | The Humanoid is getting back on their feet after FallingDown or Ragdoll. |
| `Jumping` | 3 | The Humanoid just jumped. (Check [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Jump\|Humanoid.Jump]]). This state lasts only briefly. This state normally transitions into either Landed, if on the ground, or Freefall, if still in the air. |
| `Swimming` | 4 | The Humanoid is currently swimming in [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] water. |
| `Freefall` | 5 | The Humanoid is currently freefalling (jumped from a height or fell off a ledge). |
| `Flying` | 6 | When set, the Humanoid won't be animated, as with the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#PlatformStand\|Humanoid.PlatformStand]] property. This state lasts as long as the player flies. |
| `Landed` | 7 | The Humanoid touched the ground after a Freefall. This state lasts only briefly. |
| `Running` | 8 | Currently running while on the ground. |
| `RunningNoPhysics` | 10 | (Deprecated) Currently running and not near other physical objects. |
| `StrafingNoPhysics` | 11 | Not currently used with default Humanoid. Cannot be set with [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ChangeState\|Humanoid:ChangeState()]]. |
| `Climbing` | 12 | The Humanoid is climbing (e.g. up a [[30 Official Roblox Docs/API Reference/Classes/TrussPart\|TrussPart]] or ladder). |
| `Seated` | 13 | The Humanoid is currently sitting in a Seat or VehicleSeat. Check the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Sit\|Humanoid.Sit]] property. |
| `PlatformStanding` | 14 | The Humanoid is platformstanding. Check the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#PlatformStand\|Humanoid.PlatformStand]] property. |
| `Dead` | 15 | The Humanoid died. Changing a Humanoid's state to this state will kill it. |
| `Physics` | 16 | The Humanoid doesn't apply any force on its own and will not automatically transition to any other state. This state has to be set and unset manually using [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ChangeState\|Humanoid:ChangeState()]]. |
| `None` | 18 | Unusable placeholder in case an unknown state gets triggered internally. |

---
*Source: [HumanoidStateType](https://create.roblox.com/docs/reference/engine/enums/HumanoidStateType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
