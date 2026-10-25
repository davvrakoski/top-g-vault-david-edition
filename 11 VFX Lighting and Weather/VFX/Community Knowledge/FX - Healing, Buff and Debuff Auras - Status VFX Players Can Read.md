---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Healing, Buff and Debuff Auras - Status VFX Players Can Read"
tags: [roblox, community-knowledge, vfx, status-effects, healing, buffs, readability]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/effects/particle-emitters
  - https://create.roblox.com/docs/reference/engine/classes/Instance
  - https://create.roblox.com/docs/reference/engine/classes/Highlight
  - https://www.vfxapprentice.com/blog/the-soul-of-effects-what-is-timing-in-vfx
---
# Healing, Buff and Debuff Auras - Status VFX Players Can Read

Status effects (healing, attack up, shield, poison, burn, stun, slow) are only useful if players can tell them apart at a glance in a fight. The usual failure is ten statuses that are all "glowy particles in a different colour". Readable status VFX use **shape and motion** first and colour second, keep each one cheap because many can stack, and are driven by replicated state rather than one-off remote calls.

## Shape and motion language

| Status | Motion | Shape | Colour | Where |
|---|---|---|---|---|
| Heal (over time) | Slow rise | Soft plus signs or orbs | Green / gold | From feet up |
| Attack up | Fast rise | Sharp sparks, upward chevrons | Red-orange | Hands / weapon |
| Defense / shield | Static shell | Dome or hex shell, `ForceField` | Blue | Around body |
| Speed up | Streaks backward | Thin lines at the feet | Cyan / white | Feet trail |
| Poison | Bubbles rise and pop | Round bubbles | Sickly green-purple | Torso |
| Burn | Flicker | Small flames | Orange | Limbs |
| Slow / frozen | Downward drift | Frost flakes, ice decal | Pale blue | Feet, ground |
| Stun | Circle above head | Stars or birds orbiting | Yellow | Above head |
| Weakened / curse | Downward drips | Dark wisps | Purple-black | Head and shoulders |

Rule of thumb: **good things rise, bad things sink or drip, control effects circle.** Players learn this without a tutorial.

The VFX Apprentice timing article gives a useful pacing rule: motion slower than a heartbeat feels calm and inviting, faster feels aggressive. Heal pulses around 0.8-1 per second; burn and attack-up flicker faster.

## Cheap setups

- **Heal:** emitter at a feet attachment, `Shape = Disc`, `EmissionDirection = Top`, `Speed = 2`, `Rate = 6`, `Lifetime = 1.2`, `Transparency` 0.2 -> 1. Plus a one-shot `Emit(8)` every time a heal tick lands, so ticks feel like events.
- **Shield:** a sphere mesh with `Material = ForceField`, blue, slightly larger than the character, welded to the root. One part, almost no cost, very readable.
- **Stun:** three small star parts (or a ring mesh with star texture) on an attachment above the head, spun by one client loop that updates every stunned character.
- **Poison:** emitter at torso, `Rate = 4`, round bubble flipbook, `Acceleration = (0, 3, 0)`.

## Drive it from attributes, not remotes

Store status on the character so late joiners and respawns are correct automatically:

```lua
-- server
character:SetAttribute("Status_Poison", workspace:GetServerTimeNow() + 6)

-- client
local function refresh(character: Model, name: string)
	local untilTime = character:GetAttribute("Status_" .. name)
	local active = untilTime ~= nil and untilTime > workspace:GetServerTimeNow()
	StatusVFX.set(character, name, active) -- enables/disables a pooled emitter set
end

character:GetAttributeChangedSignal("Status_Poison"):Connect(function()
	refresh(character, "Poison")
end)
```

A client loop (every 0.25 s is plenty) turns effects off when their end time passes, so the server never has to send "status ended".

## Stacking rules

- Cap visible status VFX per character to the 2-3 highest priority (control > damage-over-time > buffs). Show the rest as icons only, for example a small BillboardGui row above the head.
- Never let a status hide the character silhouette. If a shield shell and a burn overlap, the shell stays, flames shrink.
- Local player: you may tone down your own status particles (they sit in front of the camera) and show them on the HUD instead.
- Colour-blind safety: every status must differ in shape or motion, not only hue. Red attack-up and green heal look alike to many players; their motion (fast sparks vs slow plus signs) keeps them distinct.

## Budget

A status effect should cost under 20 live particles. With 30 characters and 3 statuses each, that is still under 2,000 particles. Distance LOD: beyond 80 studs show only shield shells and stun stars (the statuses that change how you fight that target).

## Related
[[VFX - Hub]] · [[VFX Color Language and Readability]] · [[Recipe - Healing Zones and Safe Zones]] · [[ForceField Material and Neon Glow Tricks]] · [[VFX Budget and Readability]]
