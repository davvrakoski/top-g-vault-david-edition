---
title: "Teams"
description: "The Teams service holds a game's `Team` objects. `Team` objects must be parented to the Teams service."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Teams"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The Teams service holds a game's [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] objects. [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] objects must be parented to the Teams service.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

The Teams service holds a game's [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] objects. [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] objects must be parented to the Teams service.

Teams offer a range of features that are useful to developers. These can broadly be divided into features that work out-of-the-box and features developers can program into their game.

**Built-in team behavior** The following functionality of Teams exists by default and does not require the developer to program any custom behavior.

- When part of a Team, the name above a player's character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] will be colored to the [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor|Team.TeamColor]]
- Changing [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]] will cause [[30 Official Roblox Docs/API Reference/Classes/Player#Team|Player.Team]] switch to the Team with the corresponding [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor|Team.TeamColor]]
- When using the default player list users will be grouped and displayed by team
- Setting [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral|Player.Neutral]] to true will cause the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] to be dis-associated with the team, but will not change [[30 Official Roblox Docs/API Reference/Classes/Player#Team|Player.Team]] or [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]]
- When a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] joins a game, they will be allocated to the team with [[30 Official Roblox Docs/API Reference/Classes/Team#AutoAssignable|Team.AutoAssignable]] set to true that has the fewest players. If no auto assignable team is available, [[30 Official Roblox Docs/API Reference/Classes/Player#Neutral|Player.Neutral]] will be set to true
- When [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Neutral|SpawnLocation.Neutral]] is set to false, only players whose [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]] matches [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]] can spawn on that [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]]
- When [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#AllowTeamChangeOnTouch|SpawnLocation.AllowTeamChangeOnTouch]] is set to true, a player's [[30 Official Roblox Docs/API Reference/Classes/Player#TeamColor|Player.TeamColor]] will change to [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]] when their character touches the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]]

**Optional extended team behavior** Many developers chose to add the following features to teams in their own code.

- Implement checks for team in weapon code to prevent team killing
- Implement doors or other features that only certain teams can use
- Periodically reassign teams to maintain team balance

*Code samples for this API (`Team-Rebalance`, `Team-Only-Door`, `Team-Kill-Check`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Teams); their code is not part of the open-source repo.*

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Teams#GetTeams\|GetTeams()]] | List<[[30 Official Roblox Docs/API Reference/Classes/Team\|Team]]> | Returns a table containing the game's [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]] objects. Will only return [[30 Official Roblox Docs/API Reference/Classes/Team\|Team]] objects that are parented to the [[30 Official Roblox Docs/API Reference/Classes/Teams\|Teams]] service. |
| [[30 Official Roblox Docs/API Reference/Classes/Teams#RebalanceTeams\|RebalanceTeams()]] | () | **Deprecated.** Evens the number of people on each team. This function does not work correctly and should not be used. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetTeams

```lua
Teams:GetTeams(): List<Team>
```

**Thread safety:** Unsafe · **Capabilities:** Players

The GetTeam function returns a table containing the game's [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] objects.

Note this will only return Team objects that are directly parented to the [[30 Official Roblox Docs/API Reference/Classes/Teams|Teams]] service. For this reason it is recommended developers only parent [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] objects to the [[30 Official Roblox Docs/API Reference/Classes/Teams|Teams]] service and not to other [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] (or to each other).

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/Team\|Team]]> | An array of [[30 Official Roblox Docs/API Reference/Classes/Team\|Teams]] in the game. |

*Code samples for this member (`Teams-GetTeams`) are published on the source page; their code is not part of the open-source repo.*

### RebalanceTeams

> [!warning] Deprecated
> This function has been deprecated and no longer functions correctly. It
> should not be used. Developers should instead implement their own team
> sorting systems.

```lua
Teams:RebalanceTeams(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players · **Tags:** `Deprecated`

Evens the number of people on each team. This function does not work correctly and should not be used.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [Teams](https://create.roblox.com/docs/reference/engine/classes/Teams) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
