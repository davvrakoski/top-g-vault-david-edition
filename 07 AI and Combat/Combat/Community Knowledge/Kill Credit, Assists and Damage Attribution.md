---
area: "07 AI and Combat"
cluster: "Combat"
title: "Kill Credit, Assists and Damage Attribution"
tags: [roblox, community-knowledge, combat, kill-credit, assists, leaderstats, damage]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/why-doesnt-the-creator-tag-work/2749157
  - https://devforum.roblox.com/t/creator-value-in-a-humanoid/1077705
  - https://devforum.roblox.com/t/npcsplayers-give-money-on-kill/1191336
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid#Died
---
# Kill Credit, Assists and Damage Attribution

Roblox does not track who killed whom; the DevForum answer is always "you have to record it yourself". The classic method from old Roblox gear is the **creator tag**: an `ObjectValue` named `creator` parented into the victim's Humanoid with `Value = attackerPlayer`, removed after a couple of seconds by Debris, and read in `Humanoid.Died`. It works for simple games, but it only remembers the last hitter, breaks when the tag expires before death (bleed, fall, fire), and is the source of many "kill for cash not working" threads. A damage ledger fixes all of that.

## The ledger

Every damage application goes through **one server function** that records the source:

```lua
local Ledger = {}
local records: { [Humanoid]: { [Player]: { damage: number, last: number } } } = {}
local ASSIST_WINDOW = 10 -- seconds

function Ledger.apply(victim: Humanoid, attacker: Player?, amount: number, source: string)
	if victim.Health <= 0 then return end
	if attacker then -- record BEFORE damaging, so a Died handler always sees this hit
		local r = records[victim] or {}
		local entry = r[attacker] or { damage = 0, last = 0 }
		entry.damage += amount
		entry.last = os.clock()
		r[attacker] = entry
		records[victim] = r
	end
	victim:TakeDamage(amount)
end

function Ledger.resolve(victim: Humanoid)
	local r = records[victim]
	records[victim] = nil
	if not r then return nil, {} end
	local now, killer, latest = os.clock(), nil, -1
	local assists = {}
	for player, e in r do
		if now - e.last <= ASSIST_WINDOW then
			if e.last > latest then
				if killer then table.insert(assists, killer) end
				killer, latest = player, e.last
			else
				table.insert(assists, player)
			end
		end
	end
	return killer, assists
end

return Ledger
```

Connect `victim.Died` once when the character or NPC spawns, call `Ledger.resolve`, then award the killer and assisters. Clear records when the Humanoid is destroyed.

## Attribution rules to decide

| Rule | Common choice |
| --- | --- |
| Killer | Last player to deal damage within the window |
| Assist | Anyone else who dealt damage in the window (some games require at least 20-25% of max health) |
| Environmental kill (fall, lava) after a hit | Credit the last attacker if within 5-10 s (a "knocked off the map" kill) |
| Damage over time (burn, poison) | Credit whoever applied the effect; store attacker on the status effect |
| Projectiles / explosions | Credit the shooter even if they died before impact |
| Companion or turret damage | Credit the owner |
| Self-inflicted | No kill credit; maybe a "suicide" stat |
| Team damage | Usually ignored for credit |

## Rewards

- Pay kill rewards from the server only, after `Died`, once per death (guard with a `rewarded` flag; `Died` can be connected twice by accident).
- Split NPC bounty by damage share for co-op games, so the last-hitter is not the only one paid.
- Feed kills and assists into the same session data that saves, not into leaderstats only; leaderstats are display.

## Exploit notes

- Never let the client tell the server who it killed; the killer comes from the server ledger.
- Farming: two alts killing each other. Rate-limit kill rewards per killer-victim pair (for example, no reward for the same victim more than 3 times in 5 minutes).

## Pitfalls

- Reading `creator.Value` without nil checks (the most common thread error).
- Tags removed after 2 s while death came later from bleed.
- Recording damage in multiple scripts (weapon scripts each doing their own `TakeDamage`), so the ledger misses some sources. Route everything through one damage module.

## Related
[[Combat - Hub]] - [[Damage and Status Effects Blueprint]] - [[Status Effect Container]] - [[Combat Tagging and Combat Logging Penalties]]
