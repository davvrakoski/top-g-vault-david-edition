---
area: "01 Start Here"
cluster: "Start Here"
title: "First Team Game - Teams and SpawnLocations"
tags: [roblox, community-knowledge, start-here, teams, spawns, pvp]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/players/teams
  - https://create.roblox.com/docs/reference/engine/classes/SpawnLocation
  - https://create.roblox.com/docs/reference/engine/classes/Team
  - https://create.roblox.com/docs/tutorials/curriculums/gameplay-scripting/create-teams
---
# First Team Game - Teams and SpawnLocations

Red vs Blue, Cops vs Robbers, Survivors vs Zombie: teams are built into Roblox. The **Teams** service colours names in the player list and chat, groups players, and links to SpawnLocations so each team spawns in its own base. You can set up a working two-team game with zero code, then add a few lines for balanced auto-assignment and friendly fire.

## Zero-code setup (5 minutes)

1. In Explorer, hover the **Teams** service and click **(+)**. (No teams exist by default.)
2. Insert two **Team** objects under Teams. Name them `Red` and `Blue`.
3. Give each a unique `TeamColor` (for example `Bright red`, `Bright blue`). The name and colour appear in the player list.
4. Place one **SpawnLocation** per base. On each:
   - untick **Neutral** (neutral spawns accept everyone),
   - set **TeamColor** to its team's TeamColor.
5. Leave `AutoAssignable` on for both teams: Roblox spreads joining players across auto-assignable teams.

`SpawnLocation.TeamColor` is the team link; `BrickColor`/`Color` is just how the pad looks. Match both for readability.

Optional: `AllowTeamChangeOnTouch = true` on a spawn makes stepping on it switch you to its team (handy for a team-select lobby or classic obby checkpoints).

## Assign teams from a script

```lua
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local red, blue = Teams.Red, Teams.Blue

local function smallerTeam()
	return (#red:GetPlayers() <= #blue:GetPlayers()) and red or blue
end

Players.PlayerAdded:Connect(function(player)
	player.Team = smallerTeam()
end)
```

Untick `AutoAssignable` on teams you assign manually (spectators, admins, a zombie team chosen at round start). Changing `player.Team` does not move the character; call `player:LoadCharacter()` to respawn them at the new team's spawn.

## Friendly fire check

Wherever you deal damage on the server:

```lua
local function canDamage(attacker, victimCharacter)
	local victim = game:GetService("Players"):GetPlayerFromCharacter(victimCharacter)
	if not victim then return true end -- NPCs
	return attacker.Team ~= victim.Team or attacker.Neutral
end
```

## Team-only doors

```lua
door.Touched:Connect(function(hit)
	local player = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
	if player and player.Team == game:GetService("Teams").Blue then
		door.CanCollide = false
		task.wait(1)
		door.CanCollide = true
	end
end)
```

A sturdier version uses collision groups so only that team's characters pass through (see [[Part Properties Every Beginner Must Know]]).

## Round-based team games

Typical loop: lobby (neutral spawn) > intermission timer > assign teams > `LoadCharacter()` everyone > play > back to lobby. The structure is laid out in [[Lobby and Round System Blueprint]]; the official gameplay scripting curriculum builds a full team laser-tag game.

## Spawn safety

- `SpawnLocation.Duration` sets the spawn ForceField time (seconds); `0` disables it. Keep a couple of seconds in PvP to stop spawn killing.
- Give each base two exits and cover; see [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]].

## Pitfalls

- Everyone spawns at one base: spawns still marked `Neutral`, or TeamColor values do not match exactly.
- Teams show but nobody is on them: no team is `AutoAssignable` and no script assigns.
- Two teams with the same TeamColor: Roblox treats team identity by colour, so give each a unique colour.
- Changing teams on the client: it only changes locally. Assign teams on the server.

## Related
[[00 START HERE - Top G Vault]] · [[Lobby and Round System Blueprint]] · [[Round PvP Starter Architecture]] · [[Spawn Area Design - SpawnLocation Rules, Protection and Exits]] · [[30 Official Roblox Docs/Players/Implement teams|Implement teams (official)]]
