---
title: "Implement teams"
description: "The Teams service allows you assign players to different teams within your game."
area: "30 Official Roblox Docs"
cluster: "Players"
source: "https://create.roblox.com/docs/players/teams"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Teams service allows you assign players to different teams within your game.*

You can divide players in your game into multiple teams using the [[30 Official Roblox Docs/API Reference/Classes/Teams|Teams]] service. By [[30 Official Roblox Docs/Players/Implement teams#Add teams|configuring]] the [[30 Official Roblox Docs/API Reference/Classes/Teams|Teams]] service and [[30 Official Roblox Docs/Players/Implement teams#Assign players to teams|assigning teams]], players are automatically differentiated by their [[30 Official Roblox Docs/Characters/Character name-health display|display name]] color, as well as their name in the default player list.

## Add teams

By default, no teams are configured. To add teams:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy, hover over the [[30 Official Roblox Docs/API Reference/Classes/Teams|Teams]] object and click the **⊕** icon to show a list of objects.
2. Insert a new [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] object under the [[30 Official Roblox Docs/API Reference/Classes/Teams|Teams]] service.

   *(image in the full Top G Vault)*

3. Select the new [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] object and, in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, change the team [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Name]] and assign a unique matching [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor|TeamColor]]. A team's name and color both appear in the game's player list.

   *(image in the full Top G Vault)*

4. Repeat these steps to add more teams.

## Assign players to teams

By default, Roblox **auto-assigns** new players joining the game to the team with the fewest members, and you can still use the following steps to assign players to a specific team.

1. Select each [[30 Official Roblox Docs/API Reference/Classes/Team|Team]] object in the [[30 Official Roblox Docs/API Reference/Classes/Teams|Teams]] service to display its properties.

2. Uncheck the [[30 Official Roblox Docs/API Reference/Classes/Team#AutoAssignable|AutoAssignable]] checkbox.

   *(image in the full Top G Vault)*

3. Assign a player to a specific team by changing their [[30 Official Roblox Docs/API Reference/Classes/Player#Team|Player.Team]] property to the team name in the format of `Teams[TEAM_NAME]`, such as

`Teams["Blue Team"]`

.

## Team spawn locations

You can use [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]] objects to spawn players of different teams at specific locations when they join or respawn. By default, [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocations]] are **neutral** and any player can spawn upon them, so you need to lock each one to the team that can occupy it using the following steps:

1. Using the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]], insert a new [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]] into the workspace.
2. With the new [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation|SpawnLocation]] selected, uncheck its [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#Neutral|Neutral]] checkbox in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.
3. Set the spawn's [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|TeamColor]] property to the [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor|TeamColor]] of an existing [[30 Official Roblox Docs/Players/Implement teams#Add teams|team]]. For example, if the intended team's [[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor|Team.TeamColor]] is `Lapis`, set the spawn's [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]] to `Lapis` as well.

   *(image in the full Top G Vault)*

   *[[30 Official Roblox Docs/API Reference/Classes/Team#TeamColor|Team.TeamColor]]*

   	 *(image in the full Top G Vault)*

      *[[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]]*

> [!warning]
> Note that the [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation#TeamColor|SpawnLocation.TeamColor]] property is different from [[30 Official Roblox Docs/API Reference/Classes/BasePart#BrickColor|SpawnLocation.BrickColor]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#Color|SpawnLocation.Color]] which represent the **visual** color of the spawn object and are not related to team functionality.

---
*Source: [Implement teams](https://create.roblox.com/docs/players/teams) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
