---
area: "07 AI and Combat"
cluster: "Combat"
title: "Data-Driven Abilities - Cooldowns, Charges, Costs and Blocking Tags"
tags: [roblox, community-knowledge, combat, abilities, cooldowns, charges, mana, architecture]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/tranek/GASDocumentation
  - https://create.roblox.com/docs/reference/engine/classes/Workspace#GetServerTimeNow
  - https://create.roblox.com/docs/reference/engine/classes/Instance#SetAttribute
  - https://wiki.leagueoflegends.com/en-us/Skillshot
---
# Data-Driven Abilities - Cooldowns, Charges, Costs and Blocking Tags

A battlegrounds or MOBA-style game ships 40+ abilities. If each one is a hand-written script with its own `debounce` and `wait(5)`, you get exploitable cooldowns, abilities that can be cast while stunned, and no way to balance them in one place. Unreal's Gameplay Ability System (documented by the community in tranek's GASDocumentation, MIT) shows a cleaner split that ports well to Luau: **abilities are data, cooldowns and costs are effects, and permission to cast is decided by tags.**

## 1. One definition per ability

```lua
-- Abilities/Dash.lua
return {
	id = "Dash",
	cost = { resource = "Stamina", amount = 20 },
	cooldown = 4,
	charges = 2,          -- 1 = normal cooldown
	castTime = 0,
	targeting = "Direction", -- Direction | Unit | Ground | Self
	range = 24,
	blockedBy = { "Stunned", "Grabbed", "Casting" },
	grantsWhileActive = { "Dashing" },
	cancels = { "Reload" },
}
```

A runner module executes any definition. Designers tune numbers without touching logic, and the same file is read by the client for UI.

## 2. Cooldowns are timestamps, not waits

Store `readyAt = workspace:GetServerTimeNow() + cooldown` on the server. `GetServerTimeNow` is synchronized between server and clients, so the client can draw an accurate radial timer from a replicated attribute (`Ability_Dash_ReadyAt`) without any remote. Never trust a client "ready" flag.

## 3. Charges (ammo-style abilities)

Charges give burst plus long-term limits. The usual rule (League, Overwatch-style blinks):

- Up to `charges` stored; casting uses one.
- **One charge recharges at a time**; the timer starts when you drop below max.
- A short **recast lockout** (0.25-0.5 s) stops all charges from being dumped in one frame.

```lua
function Charges.tick(st, def, now)
	while st.count < def.charges and now >= st.nextAt do
		st.count += 1
		st.nextAt = (st.count < def.charges) and (st.nextAt + def.cooldown) or math.huge
	end
end

function Charges.use(st, def, now)
	Charges.tick(st, def, now)
	if st.count == 0 or now < st.lockUntil then return false end
	if st.count == def.charges then st.nextAt = now + def.cooldown end
	st.count -= 1
	st.lockUntil = now + 0.3
	return true
end
```

## 4. Costs and resources

- Check **and** spend cost in the same server step so two quick casts cannot both pass the check.
- Common resource models: mana (regen per second), stamina (regen after a delay), rage/heat (built by hitting, decays out of combat), ammo per ability. Pick one per class so players can read it.
- Refund policy: refund the cost if the cast is interrupted before the "commit" frame; never after.

## 5. Tags decide what can run

GAS's idea: an ability lists tags that **block** it, tags it **grants** while active and abilities it **cancels**. On Roblox keep a set of string tags per character on the server (`Stunned`, `Casting`, `Airborne`, `Grabbed`), mirrored to attributes for UI. The runner's check becomes one generic function instead of dozens of `if stunned then` lines.

## 6. Input buffering and prediction

- Clients play the animation and VFX immediately (prediction) and send `UseAbility(id, aim)`.
- The server validates cooldown, cost, tags, range and line of sight, then broadcasts. On rejection, tell the caster so the client can cancel its VFX and resync the timer.
- Buffer one input for ~0.2 s if pressed during the end of another cast; see the combo note for the buffer pattern.
- GASDocumentation notes GAS itself cannot predict cooldowns under latency, so high-ping players can feel a slightly slower rate on short cooldowns. Give a small server tolerance (for example 0.1 s) instead of rejecting borderline casts.

## 7. Targeting types (MOBA vocabulary)

League's wiki splits abilities into direction-targeted (skillshots), unit-targeted, location-targeted and auto-targeted. Store this in `targeting` so your input layer knows whether to show an arrow, a ground circle or a target highlight, and so the server knows what to validate.

## Checklist

- [ ] No `wait()` cooldowns; all timers are server timestamps.
- [ ] Every ability has `blockedBy` tags including stun and grab.
- [ ] Cost check and spend are atomic.
- [ ] Charges have a recast lockout.
- [ ] Client UI reads the same definition file.

## Related
[[Combat - Hub]] - [[Ability and Status Framework]] - [[Combo Systems and Input Buffering]] - [[Config-Driven Weapons]]
