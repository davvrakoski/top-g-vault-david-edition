---
area: "07 AI and Combat"
cluster: "Combat"
title: "Downed, Revive and Bleed-Out States"
tags: [roblox, community-knowledge, combat, downed, revive, co-op, humanoid-states]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/help-with-revive-system/2040449
  - https://pubg.wiki.gg/wiki/DBNO
  - https://fortnite.gamepedia.com/Knockout
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid#SetStateEnabled
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
---
# Downed, Revive and Bleed-Out States

Co-op shooters and zombie survival games feel much better when a player at zero health goes **down** instead of dying instantly: teammates get a rescue moment, mistakes are recoverable, and dying alone in a corner becomes a story. Battle royales call it DBNO ("down but not out"); in PUBG the bleed-out timer pauses while a teammate is reviving; in Fortnite teammates hold an interact button near the downed player. Roblox has no built-in downed state, and the default Humanoid dies at 0 health, so you build it yourself.

## Rule 1: never let Health reach 0

When Health is 0 the Humanoid dies and the character breaks apart. Intercept lethal damage in your central damage function:

```lua
local DOWN_HP = 1

local function applyDamage(hum: Humanoid, amount: number, state)
	if state.downed then
		state.bleed -= amount * 0.5 -- damage while down speeds up bleed-out
		return
	end
	if hum.Health - amount <= DOWN_HP and state.canBeDowned then
		hum.Health = DOWN_HP
		enterDowned(hum, state)
		return
	end
	hum:TakeDamage(amount)
end
```

Disable the Dead state as a safety net with `hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)` while the player can be downed, and re-enable it when they bleed out (then set Health to 0). Note `SetStateEnabled` affects the client-owned character's state machine, so call it where the Humanoid is simulated (the owning client) as well; test both sides.

## Rule 2: the downed state

| While downed | Setting |
| --- | --- |
| Movement | `WalkSpeed` 3-4 (crawl), `JumpPower`/`JumpHeight` 0, crawl animation |
| Weapons | Disabled, or pistol only (a common design choice) |
| Bleed-out | 30-45 s timer; damage taken while down reduces it |
| Enemy targeting | Lower priority; zombies may keep attacking for drama, players need executions to be a choice |
| Camera / UI | Desaturate, heartbeat sound, show timer and "Teammate X is coming" |

Second and third downs in a short window should bleed out faster (for example 30 s, 20 s, 10 s), so downed spam is not a free life.

## Rule 3: reviving

A `ProximityPrompt` parented to the downed player's root part, enabled only for teammates:

- `HoldDuration` 3-5 s; the server checks on `Triggered` that the reviver is a teammate, alive, not downed, and within range.
- Track `PromptButtonHoldBegan`/`PromptButtonHoldEnded` on the server to **pause bleed-out while being revived** (the PUBG rule), and cancel if the reviver takes damage or walks away.
- On success: Health to 25-30% of max, short invulnerability (1 s), re-enable movement.
- A server-created prompt is visible to everyone. To hide it from enemies, have each teammate's client set the prompt's `Enabled` locally (local property changes do not replicate) or create the prompt on teammates' clients and send a revive request remote; either way the server still validates the team on every request.

## Solo players

Downed with no living teammate nearby is just a slower death. Options: auto-bleed instantly when solo, consumable self-revive items, or a companion that can revive.

## Bleed-out and real death

When the timer ends, re-enable the Dead state, set Health to 0, and let your normal death flow run (respawn, spectate, loot drop). Kill credit should go to whoever downed the player (store it when entering the downed state), not to whatever ticked last.

## Pitfalls

- Using `Humanoid.Died` to start the downed state: by then the character is already dead.
- Leaving `BreakJointsOnDeath` defaults and letting Health hit 0 by a stray `Health = 0` elsewhere in your code; route everything through one damage function.
- Revive validated only on the client: anyone could revive enemies or revive across the map.
- No team check on executions or revives in free-for-all modes.

## Related
[[Combat - Hub]] - [[Damage and Status Effects Blueprint]] - [[Kill Credit, Assists and Damage Attribution]] - [[Character Damage, Limbs and Status Model]]
