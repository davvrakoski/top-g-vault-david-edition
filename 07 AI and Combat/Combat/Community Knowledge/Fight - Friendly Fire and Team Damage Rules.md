---
area: "07 AI and Combat"
cluster: "Combat"
title: "Friendly Fire and Team Damage Rules"
tags: [roblox, community-knowledge, combat, teams, friendly-fire, pvp, self-damage]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Team
  - https://create.roblox.com/docs/reference/engine/classes/Player#Neutral
  - https://create.roblox.com/docs/reference/engine/classes/Player#Team
  - https://create.roblox.com/docs/reference/engine/classes/Explosion
---
# Friendly Fire and Team Damage Rules

"Can I hurt my teammate?" sounds like a yes/no checkbox, but every combat game needs a full rule table: teammates, yourself, neutral players, NPC allies, summons, and splash damage all need an answer. Missing rules cause the most common team-game bug reports: grenades that kill your own team, healers that heal enemies, lobby players who can be attacked, and team-killers ruining public servers.

## Roblox team facts to build on

From the API reference:

- `Player.Team` points at a `Team` in the Teams service; `Player.TeamColor` must match `Team.TeamColor`.
- `Player.Neutral = true` means the player is on no team (`Team` is nil). A player joining with no `AutoAssignable` team available becomes neutral.
- `Team:GetPlayers()` only counts players whose `Team` matches **and** `Neutral` is false.

So the reliable team check compares `Team` objects and treats neutral players separately.

## The relation function

Make one function and use it for every damage, heal, buff and debuff:

```lua
type Relation = "Self" | "Ally" | "Enemy" | "Neutral"

local function relation(a: Player?, b: Player?): Relation
	if a == nil or b == nil then return "Enemy" end -- NPCs: use their own faction attribute
	if a == b then return "Self" end
	if a.Neutral or b.Neutral then return "Neutral" end
	return (a.Team == b.Team) and "Ally" or "Enemy"
end
```

For NPCs, give models a `Faction` attribute ("Zombies", "Survivors", "Police") and extend the function to compare factions; this also lets NPC allies stop shooting players.

## The rule table (data, per mode)

| Source to target | Casual mode | Hardcore mode | Lobby |
|---|---|---|---|
| Enemy | 100% | 100% | 0% |
| Ally (direct hit) | 0% | 50% | 0% |
| Ally (splash) | 0% | 25% | 0% |
| Self (splash, rocket jump) | 50% | 100% | 0% |
| Neutral | 0% | 0% | 0% |
| Heals on enemies | 0 | 0 | 0 |

Store it as a table keyed by mode and relation, read inside your single damage function. Explosions are the main reason for a separate "splash" row: a built-in `Explosion` with default settings kills anyone in its blast radius, so for team games set `DestroyJointRadiusPercent = 0` and apply damage yourself through `Explosion.Hit` or your own radius query, filtered by relation.

## Protecting teams from team-killers

When friendly fire is on (hardcore, realism, zombie co-op with friendly fire as a challenge):

- **Reflect** a share of team damage back to the attacker after a threshold (for example after 100 team damage in a round).
- **Team-kill counter**: 2 team kills in a round, warning; 3, no team damage from this player for the rest of the round, or a vote-kick.
- **Spawn protection** (2-3 s of no damage after spawn) and safe zones where relation is forced to "Neutral".
- Never give kill rewards, ult charge or assists for teammate damage.

## Self-damage design

- Rocket or grenade jumping: keep self splash low (or 0) and knockback full.
- Fall damage and environment use the source `nil` (world), which skips team rules but still respects spawn protection.

## Testing

- Two players on each team plus one neutral, with every weapon type: direct, projectile, splash, DoT, heal.
- Team switch mid-round: DoTs and summons from before the switch must re-check relation on each tick.
- A player leaving: their projectiles in flight should still resolve with the stored team, not error.

## Related
[[Combat - Hub]] - [[Explosions - Radius Damage, Falloff and Cover Checks]] - [[Kill Credit, Assists and Damage Attribution]] - [[Combat Tagging and Combat Logging Penalties]]
