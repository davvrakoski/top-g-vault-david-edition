---
area: "11 VFX Lighting and Weather"
cluster: "Weather"
title: "Weather That Changes Gameplay - Wet Grip, Visibility, Hearing and Wind Drift"
tags: [roblox, community-knowledge, weather, gameplay, physics, ai, fairness]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/MaterialVariant
  - https://create.roblox.com/docs/reference/engine/classes/MaterialService
  - https://create.roblox.com/docs/reference/engine/datatypes/PhysicalProperties
  - https://create.roblox.com/docs/environment/global-wind
  - https://create.roblox.com/docs/reference/engine/classes/Atmosphere
---
# Weather That Changes Gameplay - Wet Grip, Visibility, Hearing and Wind Drift

Weather that only changes the sky is decoration. Weather that changes how the game plays (cars slide in the rain, snipers lose range in fog, storms cover your footsteps from guards, wind bends arrows) creates stories and makes players react to the forecast. The risk is unfairness: a gameplay modifier the player cannot see is a bug from their point of view. The rule for this whole note: **every gameplay effect must have a clear visual and audio cue, and the server owns the weather state.**

## Architecture

- The server holds the current weather as attributes on a shared object, for example `ReplicatedStorage.Weather` with `State = "Rain"`, `Intensity = 0.7`, `Wetness = 0.5`.
- Visual systems (rain, fog, lighting) read the same attributes on the client.
- Gameplay systems read multipliers from one table, so designers tune all effects in one place:

```lua
local Effects = {
	Clear = { grip = 1.00, sight = 1.00, hearing = 1.00, windScale = 0.2 },
	Rain  = { grip = 0.80, sight = 0.85, hearing = 0.70, windScale = 0.5 },
	Storm = { grip = 0.70, sight = 0.60, hearing = 0.45, windScale = 1.0 },
	Fog   = { grip = 0.95, sight = 0.45, hearing = 0.90, windScale = 0.1 },
	Snow  = { grip = 0.60, sight = 0.70, hearing = 0.80, windScale = 0.6 },
}

local function mult(key: string): number
	local w = ReplicatedStorage.Weather
	local e = Effects[w:GetAttribute("State")] or Effects.Clear
	local i = w:GetAttribute("Intensity") or 1
	return 1 + (e[key] - 1) * i -- blend toward the modifier by intensity
end
```

Blending by intensity means a light drizzle barely changes grip and a downpour changes it fully, and transitions are smooth.

## Wet grip (vehicles and surfaces)

Options, from simplest to most physical:

1. **Controller multiplier:** your vehicle script multiplies tyre grip, max cornering force or drift threshold by `mult("grip")`. Predictable and easy to tune; the recommended start.
2. **Material swap:** `MaterialVariant` has a `CustomPhysicalProperties` property, so a "WetAsphalt" variant can have lower friction (`PhysicalProperties.new(density, friction, elasticity, frictionWeight, elasticityWeight)`) as well as a glossier look. Switching roads to it with `MaterialService:SetBaseMaterialOverride` changes look and grip together; whether the override also applies the variant's physics to every part in your setup is (unverified) here, so measure stopping distance before and after.
3. **Wetness ramp:** roads get wet over 30-60 s after rain starts and dry over a few minutes after it ends. Store `Wetness` separately from rain intensity; that delay feels natural.

Characters: Humanoid walking is not strongly friction-driven, so for "slippery ice" use your movement code (lower acceleration, longer stopping) rather than friction alone.

Cue: glossy roads, spray from tyres, squealing earlier. Never reduce grip without a visible wet road.

## Visibility

- Visuals: raise `Atmosphere.Density` with fog or storm intensity.
- Gameplay: multiply NPC sight range, auto-aim range and sniper scope max range by `mult("sight")`.
- Fairness: if the fog hides players from NPCs, it must hide NPCs from players by about the same amount. Keep minimap markers and objective beacons visible in any weather.

## Hearing

- Rain and wind cover sound. Multiply NPC hearing radius for footsteps by `mult("hearing")` so stealth is easier in storms.
- Players get the same benefit and cost: lower footstep volumes of others slightly in storms, and say it in the loading tips ("Storms hide your footsteps").

## Wind drift

- Projectiles: add `workspace.GlobalWind * mult("windScale") * k` to slow projectiles' velocity each step (arrows, thrown items, grenades); hitscan is unaffected.
- Show it: particles, flags, grass and clouds already follow `GlobalWind`; add a wind indicator on the HUD for bow or sniper games.
- Keep `k` small (wind should bend a long shot, not ruin a short one).

## Hazards

- Lightning strikes in storms (server-chosen positions with a telegraph flash or a 1-2 s warning) can hit tall metal objects or players in open areas. The sky lightning note covers visuals.
- Blizzard cold meter, sandstorm damage outdoors: always give shelter areas and show the meter.

## Communicating the forecast

- A small forecast UI ("Rain in 2 min") lets players plan: race strategy, stealth runs, fishing.
- Announce changes with a short sound sting and a sky change 20-40 s before gameplay modifiers fully apply.

## Related
[[Weather - Hub]] · [[Tyre Friction with CustomPhysicalProperties]] · [[NPC Vision and Hearing Model]] · [[GlobalWind - Grass, Clouds, Particles and Gusts]] · [[Production Weather State Machine]]
