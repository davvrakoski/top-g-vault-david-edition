---
area: "07 AI and Combat"
cluster: "AI"
title: "Threat Tables and Target Selection for Enemies"
tags: [roblox, community-knowledge, ai, aggro, threat, target-selection, bosses]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://warcraft.wiki.gg/wiki/threat
  - https://warcraft.wiki.gg/wiki/Aggro_Transfer
  - https://wiki.guildwars2.com/wiki/Aggro
  - https://devforum.roblox.com/t/efficient-aggro-approaches/501394
---
# Threat Tables and Target Selection for Enemies

Most Roblox enemies target "the closest player", which makes co-op combat shallow: the tank cannot protect anyone, ranged players are never punished, and the enemy flips targets every frame when two players stand at similar distances. MMOs solved this long ago with **threat tables**. In World of Warcraft each NPC keeps a list of everyone who has threatened it; damage adds threat (one point per point of damage as the base rule), and the top of the list is the target. Guild Wars 2 mixes in proximity and other conditions. This note adapts those ideas for Roblox bosses, elites and wave enemies.

## The table

Per enemy, server-side: `threat[player] = number`. Add threat on events, decay it over time, and pick the target from the table, not from distance alone.

| Event | Suggested threat |
| --- | --- |
| Damage dealt | `damage x 1.0` |
| Healing an ally in combat with this enemy | `healing x 0.5`, split across enemies |
| Taunt ability | set to `top threat x 1.1` and force target for 3 s |
| Being in "notice" range without attacking | small trickle (`+2/s`) so idle players are not ignored |
| Line of sight lost for 5 s | multiply by 0.5 |

## Switching rules (the part that makes it feel right)

WoW's aggro-transfer rule is the key idea: a new player must **exceed the current target's threat by a margin** to steal aggro, 110% in melee range and 130% at range. The margin is what stops target flip-flopping and gives tanks a real job.

```lua
local MELEE_RANGE = 10

local function chooseTarget(enemy, threat: { [Player]: number }, current: Player?)
	local root = enemy.PrimaryPart
	local best, bestValue = current, current and threat[current] or 0
	for player, value in threat do
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if hrp and player ~= current then
			local dist = (hrp.Position - root.Position).Magnitude
			local need = bestValue * (dist <= MELEE_RANGE and 1.1 or 1.3)
			if value > need then best, bestValue = player, value end
		end
	end
	return best
end
```

Evaluate it 2-4 times per second, not every frame.

## Decay and leashing

- Multiply all threat by about 0.9 every second the player deals nothing, so players who leave the fight fall off.
- Remove entries for players who die, leave, or move outside the leash radius.
- If the table empties, the enemy **leashes**: returns to its spawn, regenerates, and resets. This stops kiting exploits that drag bosses across the map.

## Variations by enemy type

- **Zombies / fodder:** skip threat tables; use nearest-visible with a short commitment timer (keep the target for at least 2 s). Cheap and readable.
- **Elites:** threat table with high proximity weight, so whoever is close matters.
- **Bosses:** threat table plus **scripted overrides**: "every 20 s, target the player with the lowest threat" or "charge the farthest player". These break the tank pattern on purpose and are telegraphed.
- **Assassin enemies:** inverse rule, prefer low-health or isolated players, with a visible mark so it feels fair.

## Show it to players

Threat is invisible unless you show it. A small icon over the targeted player, or the enemy's head turning toward its target, makes the system understandable. For bosses, a short "Boss is targeting you" warning avoids "why did it suddenly kill me" frustration.

## Performance

One table per active enemy, updated on damage events (already server-side) plus a slow decay loop shared by all enemies. Do not run a `while true` loop per NPC scanning all players; the DevForum aggro thread starts from exactly that cost problem. Use a central NPC scheduler and spatial queries.

## Related
[[AI - Hub]] - [[Production NPC State Machine]] - [[NPC Vision and Hearing Model]] - [[Boss Fight Design - Phases, Telegraphs and Arena Rules]]
