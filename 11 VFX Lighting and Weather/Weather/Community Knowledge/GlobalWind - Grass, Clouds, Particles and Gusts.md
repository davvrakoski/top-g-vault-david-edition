---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
title: "GlobalWind - Grass, Clouds, Particles and Gusts"
tags: [roblox, community-knowledge, weather, wind, particles, environment]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/environment/global-wind
  - https://devforum.roblox.com/t/breeze-into-wind-fully-released/2400083
  - https://devforum.roblox.com/t/math-behind-particleemitterwindaffectsdrag/4051684
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
  - https://create.roblox.com/docs/reference/engine/classes/AtmosphereSensor
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
---
# GlobalWind - Grass, Clouds, Particles and Gusts

Wind ties a weather system together: rain slants, smoke drifts the same way the grass bends, clouds move, and a storm visibly picks up. Roblox has one engine-level value for this, `Workspace.GlobalWind`, released in late 2023 ("Breeze into Wind!" announcement). Terrain grass and dynamic clouds follow it automatically; particles follow it when you opt in. Setting it from one weather owner keeps every system consistent.

## What responds

| System | Responds? | Condition |
|---|---|---|
| Terrain grass | Yes | Automatic; Reduce Motion slows grass animation speed (not direction) |
| Dynamic `Clouds` | Yes | Automatic drift |
| `ParticleEmitter` | Yes, opt-in | `WindAffectsDrag = true` **and** `Drag > 0` |
| `Fire`, `Smoke` instances | Yes | By default |
| Parts / physics | Only with aerodynamics | Normal parts ignore wind; parts with `BasePart.EnableFluidForces` in a place with `Workspace.FluidForces` enabled (Studio-only setting) get aerodynamic forces, and `Workspace.AirTurbulenceIntensity` fluctuations scale with the global wind (see below) |
| Trails, Beams | No | Animate them yourself if needed |

`GlobalWind` is a Vector3: direction and strength (studs per second). The **Wind Direction** widget (Studio View menu) shows a wind sock and sets speed, yaw and pitch visually.

## Particles that follow wind

Rain, snow, embers, leaves, dust and smoke should use `WindAffectsDrag = true` with `Drag` around 0.5-3. Drag is what couples a particle to the wind: higher drag means particles reach the wind speed faster. A DevForum thread digs into the exact maths behind `WindAffectsDrag`; for tuning, judge by eye.

Things that should **not** follow wind: magic aura, UI-like markers, sparks that must read as directional, and often torch fire. A DevForum user found their fire leaning whenever GlobalWind was non-zero; legacy `Fire`/`Smoke` instances follow wind by default, so use a ParticleEmitter with `WindAffectsDrag = false` for fire that should rise straight.

## Strength guide (starting points)

| Weather | GlobalWind magnitude | Notes |
|---|---|---|
| Calm | 0-3 | Grass barely moves |
| Breeze | 5-10 | Good default outdoors |
| Windy | 15-25 | Rain clearly slanted |
| Storm | 30-50 | Pair with gusts and louder wind audio |
| Sandstorm / blizzard | 40-70 | Plus dense Atmosphere |

A small upward or downward Y component changes how particles drift; keep Y near 0 for most weather.

## Gusts

The official doc sample adds a sine-ramped gust on top of a base wind every few seconds. Two practical changes:

1. **Run gusts on the client.** `GlobalWind` set by a server script replicates; a gust loop updating it 30 times per second sends constant property changes. Let the server set the **base** wind (weather state), and each client animate gusts locally.
2. **Use frame-based updates** rather than many `task.wait` steps:

```lua
local RunService = game:GetService("RunService")
local baseWind = workspace:GetAttribute("BaseWind") or Vector3.new(6, 0, 2)
local gustDir = Vector3.new(1, 0, 0.4).Unit
local gustStart, gustLen, gustPower = 0, 3.5, 20

RunService.Heartbeat:Connect(function()
	local now = os.clock()
	local t = (now - gustStart) / gustLen
	local gust = if t >= 0 and t <= 1 then math.sin(math.pi * t) * gustPower else 0
	workspace.GlobalWind = baseWind + gustDir * gust
	if t > 1 and math.random() < 0.004 then -- roughly one new gust every few seconds
		gustStart, gustPower = now, 12 + math.random() * 18
	end
end)

workspace:GetAttributeChangedSignal("BaseWind"):Connect(function()
	baseWind = workspace:GetAttribute("BaseWind")
end)
```

Here the server only changes the `BaseWind` attribute on weather transitions. Gust timing differs per client, which is fine for cosmetics.

## Wind for gameplay

By default wind is visual only. Two ways to make it matter:

- **Aerodynamics:** with `Workspace.FluidForces` enabled in Studio and `EnableFluidForces` on chosen parts, the physics engine computes aerodynamic forces, and the Workspace reference ties turbulence (`AirTurbulenceIntensity`, 0-1) to the global wind magnitude. Whether the base wind vector itself pushes fluid-force parts is implied but not spelled out in the reference I checked (unverified); test with a light part before building on it. If you use this, change wind on the **server** so physics agrees for everyone, and keep client gusts cosmetic.
- **Read it yourself:** `AtmosphereSensor` (a SensorBase) reports `AirDensity` and `RelativeWindVelocity` at its position, handy for sails, kites, gliders or flags. Or apply your own `VectorForce` from the server's base wind (not the client gusts) so all players agree.

## Audio and visuals together

- Scale wind ambience volume and a high-pass "whistle" layer with wind magnitude.
- Tilt rain emitters' direction, or rely on `WindAffectsDrag`, so rain angle matches grass.
- Flags and cloth: drive animation speed from wind magnitude on the client.

## Related
[[Weather - Hub]] · [[Day-Night Cycle and Weather Transitions in Practice]] · [[Fog, Snow, Wind and Layered Weather]] · [[ParticleEmitter Bursts, Flipbooks and Budgets]]
