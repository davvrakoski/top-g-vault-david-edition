---
title: "SpawnLocation"
description: "`SpawnLocations`, or \"spawns\" determine where a `Player` respawns when they die. They can be configured to allow only certain players to use each spawn, using `Teams`. They also control how `ForceFields` are set up for newly-spawned players."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SpawnLocation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*[[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocations]], or "spawns" determine where a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] respawns when they die. They can be configured to allow only certain players to use each spawn, using [[30 Official Roblox Docs/API Reference/Classes/Team|Teams]]. They also control how [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceFields]] are set up for newly-spawned players.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] → [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart|FormFactorPart]] → [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

SpawnLocations, or "spawns" determine where a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] respawns when they die. They can be configured to allow only certain players to use each spawn, using [[30 Official Roblox Docs/API Reference/Classes/Team|Teams]]. They also control how [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceFields]] are set up for newly-spawned players.

SpawnLocations can be used as checkpoints, such as in an obstacle course, using the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#AllowTeamChangeOnTouch|SpawnLocation.AllowTeamChangeOnTouch]] property, so that when a player touches it, they will change teams to the SpawnLocation's team. In this case, only the first [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] should have [[30 Official Roblox Docs/API Reference/Classes/Team#AutoAssignable|Team.AutoAssignable]] set to true, else players will not start at the first checkpoint.

Note if a SpawnLocation is added to the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] in Studio with [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Neutral|SpawnLocation.Neutral]] set to false a Team will be created corresponding to [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]] if it does not already exist. This behavior does not occur when spawns are created in-game using a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or if the properties of the SpawnLocation are changed after already being added. It is recommended that developers always set up their teams manually and not rely on this behavior.

## Spawning Rules

There are several rules that come into play for a given SpawnLocation when a player respawns:

- When [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Neutral|SpawnLocation.Neutral]] is set to false only [[30 Official Roblox Docs/API Reference/Classes/Player|Players]] with [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]] matching [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]] will respawn above it
- When [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Neutral|SpawnLocation.Neutral]] is set to true any Player can spawn above it regardless of [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]]
- If multiple eligible spawns are available to a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]], a random one will be chosen
- Players will spawn at different points on top of a SpawnLocation, but currently, they may still spawn on top of each other if they spawn right after one and other

See also:

- If you'd like to configure how long it takes for a player to respawn, take a look at the [[30 Official Roblox Docs/API Reference/Classes/Players#RespawnTime|RespawnTime]] property

*Code samples for this API (`SpawnLocation-Checkpoints`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/SpawnLocation); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#AllowTeamChangeOnTouch\|AllowTeamChangeOnTouch]] | boolean | Allows a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] to join the team by touching the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]]. When set to true, if a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] character comes into contact with the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]], the player's [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor\|Player.TeamColor]] will be set to [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor\|SpawnLocation.TeamColor]]. |
| [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Duration\|Duration]] | int | The length of time, in seconds, that a [[30 Official Roblox Docs/API Reference/Classes/ForceField\|ForceField]] will be applied to a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] character spawning at this [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]]. If Duration is zero, the [[30 Official Roblox Docs/API Reference/Classes/ForceField\|ForceField]] is never created, and it will not trigger the [[30 Official Roblox Docs/API Reference/Classes/Instance#DescendantAdded\|Instance.DescendantAdded]] or [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildAdded\|Instance.ChildAdded]] events. |
| [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Enabled\|Enabled]] | boolean | Sets whether or not the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]] is enabled. When disabled players cannot spawn at the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]] and the AllowTeamChangeOnTouch functionality is disabled. |
| [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Neutral\|Neutral]] | boolean | Whether or not a [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]] is affiliated with a specific team. This means that any [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]], of any [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]], can spawn on it if this property is set to true. |
| [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor\|TeamColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | Sets what team the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]] is affiliated to. If [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Neutral\|SpawnLocation.Neutral]] property is false, only [[30 Official Roblox Docs/API Reference/Classes/Player\|Players]] with the same [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor\|Player.TeamColor]] as the spawn's TeamColor will be able to spawn there. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Part|Part]], [[30 Official Roblox Docs/API Reference/Classes/FormFactorPart|FormFactorPart]], [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AllowTeamChangeOnTouch

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Teams · **Loaded/Saved:** true/true · **Capabilities:** Basic, Players

Allows a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] to join the team by touching the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]]. When set to true, if a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] character comes into contact with the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]], the player's [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]] will be set to [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]]. [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral|Player.Neutral]] will also be set to [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Neutral|SpawnLocation.Neutral]] upon contact, meaning a player can also become neutral by touching a spawn location.

This will not function when [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Enabled|SpawnLocation.Enabled]] is set to false.

#### Making Checkpoints

This feature is often used to make checkpoints in obstacle courses or similar games.

*Code samples for this member (`SpawnLocation-Checkpoints`) are published on the source page; their code is not part of the open-source repo.*

### Duration

**Type:** int

**Thread safety:** ReadSafe · **Category:** Forcefield · **Loaded/Saved:** true/true · **Capabilities:** Basic, Players

The length of time, in seconds, that a [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]] will be applied to a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] character spawning at this [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]]. If Duration is zero, the [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]] is never created, and it will not trigger the [[30 Official Roblox Docs/API Reference/Classes/Instance#DescendantAdded|Instance.DescendantAdded]] or [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildAdded|Instance.ChildAdded]] events.

This default value of this property is 10 seconds.

The duration feature allows developers to easily give [[30 Official Roblox Docs/API Reference/Classes/Player|Players]] protection from 'spawn killing' which can be a frustrating experience for players. Note, [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceFields]] will only protect users from [[30 Official Roblox Docs/API Reference/Classes/Explosion|Explosions]] and weapons that use [[30 Official Roblox Docs/API Reference/Classes/Humanoid#TakeDamage|Humanoid:TakeDamage()]] to deal damage or otherwise check for a [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]].

*Code samples for this member (`SpawnLocation-ForceField`) are published on the source page; their code is not part of the open-source repo.*

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Basic, Players

Sets whether or not the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]] is enabled. When disabled players cannot spawn at the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]] and the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#AllowTeamChangeOnTouch|SpawnLocation.AllowTeamChangeOnTouch]] functionality is disabled.

This property provides the most convenient way of preventing [[30 Official Roblox Docs/API Reference/Classes/Player|Players]] from spawning at a spawn.

Note, although team changing on touch using [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#AllowTeamChangeOnTouch|SpawnLocation.AllowTeamChangeOnTouch]] is disabled when Enabled is set to false, other touched events using [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|BasePart.Touched]] will still fire.

*Code samples for this member (`SpawnLocation-Enabled`) are published on the source page; their code is not part of the open-source repo.*

### Neutral

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Teams · **Loaded/Saved:** true/true · **Capabilities:** Basic, Players

Whether or not a spawn is affiliated with a specific team. This means that any [[30 Official Roblox Docs/API Reference/Classes/Player|Player]], of any [[30 Official Roblox Docs/API Reference/Classes/Team|Team]], can spawn on it if this property is set to true.

If Neutral is set to false, only players whose [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]] is equal to [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]] can use the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]].

If [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#AllowTeamChangeOnTouch|SpawnLocation.AllowTeamChangeOnTouch]] is true [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral|Player.Neutral]] will be set to this property upon contact with the spawn.

*Code samples for this member (`SpawnLocation-Checkpoints`) are published on the source page; their code is not part of the open-source repo.*

### TeamColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Teams · **Loaded/Saved:** true/true · **Capabilities:** Basic, Players

The TeamColor property sets what team the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]] is affiliated to. If [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Neutral|SpawnLocation.Neutral]] property is false, only [[30 Official Roblox Docs/API Reference/Classes/Player|Players]] with the same [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]] as the spawn's TeamColor will be able to spawn there.

If [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#AllowTeamChangeOnTouch|SpawnLocation.AllowTeamChangeOnTouch]] is true [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral|Player.Neutral]] will be set to this property upon contact with the spawn.

*Code samples for this member (`SpawnLocation-Checkpoints`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [SpawnLocation](https://create.roblox.com/docs/reference/engine/classes/SpawnLocation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
