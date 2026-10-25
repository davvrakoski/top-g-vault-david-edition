---
title: "Team"
description: "The `Team` class represents a faction in a Roblox place. The only valid parent for a Team is in the `Teams` service."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Team"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] class represents a faction in a Roblox place. The only valid parent for a Team is in the [[30 Official Roblox Docs/API Reference/Classes/Teams|Teams]] service.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] class represents a faction in a Roblox place. The only valid parent for a Team is in the [[30 Official Roblox Docs/API Reference/Classes/Teams|Teams]] service. Teams offer a range of features that are useful to developers that can be divided into two rough groups:

- Features that work 'out of the box'
- Features developers can program into their game.

**Built-in Team Behavior**

The following functionality of Teams exists by default and does not require the developer to program any custom behavior.

- When part of a Team, the name above a player's character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] will be colored to the [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor|Team.TeamColor]]
- Changing [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]] will cause [[30 Official Roblox Docs/API Reference/Classes/Player#Team|Player.Team]] to switch to the Team with the corresponding [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor|Team.TeamColor]]
- When using the default player list users will be grouped and displayed together as a team
- Setting [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral|Player.Neutral]] to true will cause the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] to be disassociated with the team, but it will not change [[30 Official Roblox Docs/API Reference/Classes/Player#Team|Player.Team]] or [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]]
- When a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] joins a game, they will be allocated to the team with [[30 Official Roblox Docs/API Reference/Classes/Team#AutoAssignable|Team.AutoAssignable]] set to true that has the fewest players. If no auto assignable team is available, [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral|Player.Neutral]] will be set to true
- When [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Neutral|SpawnLocation.Neutral]] is set to false, only players whose [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]] matches [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]] can spawn on that [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]]
- When [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#AllowTeamChangeOnTouch|SpawnLocation.AllowTeamChangeOnTouch]] is set to true, a player's [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]] will change to [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]] when their character touches the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]]

**Optional Extended Team Behaviors**

Many developers chose to add the following features to teams in their own code.

- Implement checks in weapon code to prevent friendly fire.
- Implement checks in doors or other features that allow only certain teams to use them
- Periodically reassign teams to maintain team balance

*Code samples for this API (`Team-Rebalance`, `Team-Kill-Check`, `Team-Only-Door`, `Party-Team-Integration`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Team); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Team#AutoAssignable\|AutoAssignable]] | boolean | This property determines whether [[30 Official Roblox Docs/API Reference/Classes/Player\|Players]] will be automatically placed onto the [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]] when joining. If multiple teams have this property set to true, Roblox will attempt to even the teams out when [[30 Official Roblox Docs/API Reference/Classes/Player\|Players]] are added. |
| [[30 Official Roblox Docs/API Reference/Classes/Team#AutoColorCharacters\|AutoColorCharacters]] | boolean | **Deprecated.** Deprecated and no longer functional. Historically set whether or not [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] character models on a team would be colored to [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor\|Team.TeamColor]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Team#Score\|Score]] | int | **Deprecated.** This property can be used to store an integer value associated with the team. This property offers no additional functionality and is not used by any game services. |
| [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor\|TeamColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | This property sets the color of the [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]]. Determines the [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor\|Player.TeamColor]] property of players who are a member of the team. Also determines the color displayed on the player list and above player's heads. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Team#GetPlayers\|GetPlayers()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]> | Returns a list of [[30 Official Roblox Docs/API Reference/Classes/Player\|Players]] who are assigned to the [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]]. A [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] is considered assigned if their [[30 Official Roblox Docs/API Reference/Classes/Player#Team\|Player.Team]] property is equal to the [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]] and [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral\|Player.Neutral]] is false. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Team#PlayerAdded\|PlayerAdded]] | `player` | Fires whenever a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] is assigned to the [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]]. A player is considered assigned if their [[30 Official Roblox Docs/API Reference/Classes/Player#Team\|Player.Team]] property is equal to the [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]] and [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral\|Player.Neutral]] is false. |
| [[30 Official Roblox Docs/API Reference/Classes/Team#PlayerRemoved\|PlayerRemoved]] | `player` | Fires whenever a [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] is removed from a [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]]. This can be due to the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] leaving the game, [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral\|Player.Neutral]] being set to true or the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] joining a different team. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AutoAssignable

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Players

This property determines whether [[30 Official Roblox Docs/API Reference/Classes/Player|Players]] will be automatically placed onto the [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] when joining. If multiple teams have this property set to true, Roblox will attempt to even the teams out when [[30 Official Roblox Docs/API Reference/Classes/Player|Players]] are added.

When a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] joins a game they will be assigned to the [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] with [[30 Official Roblox Docs/API Reference/Classes/Team#AutoAssignable|Team.AutoAssignable]] set to true that has the fewest players. If no such team is available, [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral|Player.Neutral]] will be set to true.

Note while using this property will help even out teams when players are added, it will not do anything when players are removed. For this reason developers may wish to implement their own team balancing system.

*Code samples for this member (`Team-Rebalance`) are published on the source page; their code is not part of the open-source repo.*

### AutoColorCharacters

> [!warning] Deprecated
> This property is deprecated and no longer functions, it should not be used
> for new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Players · **Tags:** `NotReplicated`, `Deprecated`

Historically set whether or not [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] character models on a team would be colored to [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor|Team.TeamColor]].

Developers are advised not to use this property as the script which changed the team colors has since been removed from the default character. This property is deprecated and should not be used for new work.

### Score

> [!warning] Deprecated
> This property is deprecated and should not be used in new work. For more
> information on how to handle leaderboards and scoring please see
> [this tutorial](30%20Official%20Roblox%20Docs/Players/Leaderboards.md).

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** Players · **Tags:** `NotReplicated`, `Deprecated`

This property can be used to store an integer value associated with the team. This property offers no additional functionality and is not used by any game services.

This property is deprecated and should not be used by developers for new work.

### TeamColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Players

This property sets the color of the [[30 Official Roblox Docs/API Reference/Classes/Team|Team]]. Determines the [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]] property of players who are a member of the team.

A lot of Roblox's default team functionality is based on the team color, rather than the name or object. For example, [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocations]] can be assigned to a team via [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]]. For this reason it is recommended that developers ensure each [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] has a unique TeamColor.

Any player which is a part of a team will have their name color changed to the team's TeamColor property. They will also be put underneath the team heading on the player list.

*Code samples for this member (`Team-Only-Door`) are published on the source page; their code is not part of the open-source repo.*

## Methods

### GetPlayers

```lua
Team:GetPlayers(): List<Player>
```

**Thread safety:** Safe · **Capabilities:** Players

Returns a list of [[30 Official Roblox Docs/API Reference/Classes/Player|Players]] who are assigned to the [[30 Official Roblox Docs/API Reference/Classes/Team|Team]]. A [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] is considered assigned if their [[30 Official Roblox Docs/API Reference/Classes/Player#Team|Player.Team]] property is equal to the [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] and [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral|Player.Neutral]] is false.

This function has a number of potential uses, including counting the number of players on a [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] or giving every [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] on a [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]].

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Player\|Player]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/Player\|Players]] in the [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]]. |

*Code samples for this member (`Teams-GetTeams`) are published on the source page; their code is not part of the open-source repo.*

## Events

### PlayerAdded

```lua
Team.PlayerAdded(player: Player)
```

**Capabilities:** Players

Fires whenever a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] is assigned to the [[30 Official Roblox Docs/API Reference/Classes/Team|Team]]. A player is considered assigned if their [[30 Official Roblox Docs/API Reference/Classes/Player#Team|Player.Team]] property is equal to the [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] and [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral|Player.Neutral]] is false.

This event is team specific and will only fire when a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] joints the specific [[30 Official Roblox Docs/API Reference/Classes/Team|Team]]. Any function connected to this event will be passed the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object of the player who joined the team. For example:

Team.PlayerAdded:Connect(function(player) print(player.Name.." has joined the team") end)

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] that was added. |

*Code samples for this member (`Team-Rebalance`) are published on the source page; their code is not part of the open-source repo.*

### PlayerRemoved

```lua
Team.PlayerRemoved(player: Player)
```

**Capabilities:** Players

Fires whenever a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] is removed from a [[30 Official Roblox Docs/API Reference/Classes/Team|Team]]. This can be due to the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] leaving the game, [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral|Player.Neutral]] being set to true or the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] joining a different team.

This event is team specific and will only fire when a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] leaves the specific [[30 Official Roblox Docs/API Reference/Classes/Team|Team]]. Any function connected to this event will be passed the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object of the player who left the team. For example:

Team.PlayerRemoved:Connect(function(player) print(player.Name.." has left the team") end)

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `player` | [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] removed. |

*Code samples for this member (`Team-Rebalance`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Team](https://create.roblox.com/docs/reference/engine/classes/Team) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
