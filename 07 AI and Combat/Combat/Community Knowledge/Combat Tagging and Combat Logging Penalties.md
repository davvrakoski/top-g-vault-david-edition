---
area: "07 AI and Combat"
cluster: "Combat"
title: "Combat Tagging and Combat Logging Penalties"
tags: [roblox, community-knowledge, combat, combat-log, pvp, safe-zones]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/how-to-catch-combat-logging/743912
  - https://devforum.roblox.com/t/how-do-you-handle-combat-logging/637409
  - https://devforum.roblox.com/t/how-to-do-an-combat-log-system/690716
  - https://create.roblox.com/docs/reference/engine/classes/Players#PlayerRemoving
---
# Combat Tagging and Combat Logging Penalties

In any game where death costs something (dropped loot, lost bounty, permadeath, rank), players about to lose a fight will simply leave. Their save is untouched and they rejoin elsewhere; the winner gets nothing. The DevForum tutorials on combat logging describe the standard fix in three parts: **tag** players when they fight, decide **when** a tag counts, and **catch** them when they leave while tagged. This note adds the design decisions (penalties, safe zones, UI) that make it fair.

## 1. Tag on the server

Store the last combat time on the server side, not as a value players can see edited:

```lua
local COMBAT_TIME = 15
local lastCombat: { [Player]: number } = {}

local function tag(player: Player)
	lastCombat[player] = os.clock()
	player:SetAttribute("InCombatUntil", workspace:GetServerTimeNow() + COMBAT_TIME) -- UI only
end

local function inCombat(player: Player): boolean
	local t = lastCombat[player]
	return t ~= nil and os.clock() - t < COMBAT_TIME
end
```

Call `tag` for **both** attacker and victim from your central damage function, only for PvP damage (or for NPC damage too, in extraction-style games). A timestamp avoids the per-player `while` loop one thread starts with; a reply suggests exactly this: store the state per player and check it in `PlayerRemoving`.

## 2. Catch the leave

```lua
game:GetService("Players").PlayerRemoving:Connect(function(player)
	if inCombat(player) then
		applyCombatLogPenalty(player) -- runs before the final save
	end
	lastCombat[player] = nil
end)
```

Make sure your save system's leave handler runs **after** the penalty is applied to the session data (same module or explicit ordering), otherwise the save writes the unpenalized state.

## 3. Choose a penalty

| Game type | Penalty when leaving tagged |
| --- | --- |
| Loot-drop PvP / survival | Treat as death: drop inventory at the logout spot, credit the last attacker |
| Bounty games | Transfer the bounty to the last attacker |
| Ranked arenas | Count as a loss, small extra rank penalty for repeat offenders |
| Casual fighting games | No penalty, just credit the kill to the attacker |

Credit the attacker using the damage ledger, so they get their reward even though the victim never "died".

## Fairness details

- **Visible timer.** Show "In combat: 12 s" near the health bar. Players accept rules they can see.
- **Disconnects vs leaves.** The server cannot tell a crash from a deliberate leave. Use a slightly softer penalty than death if crashes are common on your platform mix, or offer a short **rejoin window**: store "pending combat log" in their data and, if they rejoin the same server within 60 s, cancel it (only practical with reserved/private servers or small games).
- **Safe zones end tags.** Entering a safe zone does not clear the tag immediately (otherwise players dash in mid-fight); either block safe-zone entry while tagged or keep the tag running inside.
- **Teleports and menus.** Disable fast travel, server hop and "return to lobby" buttons while tagged.
- **Shutdowns.** `BindToClose` saves are not combat logs; skip penalties during server shutdown.

## Pitfalls

- Tag stored only on the client or in a value the client can edit locally (harmless if the server never reads it, dangerous if it does).
- Tagging on any damage, including fall damage, so players cannot leave after tripping.
- Penalty applied after the save was already queued.
- No message: players who get penalized without knowing the rule feel cheated and leave reviews.

## Related
[[Combat - Hub]] - [[Kill Credit, Assists and Damage Attribution]] - [[BindToClose and Server Shutdown Save Flush]] - [[Data Not Saving on Leave - Help Thread Patterns]]
