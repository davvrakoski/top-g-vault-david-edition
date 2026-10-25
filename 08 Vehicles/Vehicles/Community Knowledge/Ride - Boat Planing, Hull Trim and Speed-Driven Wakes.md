---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Boat Planing, Hull Trim and Speed-Driven Wakes"
tags: [roblox, community-knowledge, vehicles, boats, vfx, water]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/help-improving-boat-wake-system/573637
  - https://devforum.roblox.com/t/water-splash-particles-breaking-script/2803545
  - https://devforum.roblox.com/t/boat-chassis-how-to-set-it-up/1393347
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
  - https://create.roblox.com/docs/reference/engine/classes/Beam
  - https://vortexstudio.atlassian.net/wiki/spaces/VSD236/pages/3317371148/Adding+a+Hull+Wake
---
# Ride - Boat Planing, Hull Trim and Speed-Driven Wakes

Most Roblox boats float and move, but they feel like a bathtub toy: same posture at 5 and 50 studs per second, and a wake that never changes. Real speedboats go through two clear phases. Slow, the hull sits deep and pushes water (displacement). Fast, the bow lifts, then the boat climbs up and skims on the surface (planing). Faking that change with a few numbers is the biggest "feel" upgrade a boat game can get, and it costs almost nothing.

## The three speed bands
| Band | Speed (tune) | Hull | Wake |
|---|---|---|---|
| Displacement | 0 to 30% of max | Level, sits low | Small bow ripple, few particles |
| Hump | 30 to 55% | Bow pitched up 6-10 degrees, slower acceleration | Big spray, loud engine |
| Planing | 55% and up | Bow drops to 2-4 degrees, hull rises | Long flat wake, rooster tail at the back |

The "hump" is the key: briefly slower acceleration and nose up, then a release when the boat gets on plane. Players read that as power.

## Driving the posture
Keep the physics simple (buoyancy plus a thrust mover, as in the hover/boat deep dive), then add two script outputs from `speedRatio = speed / maxSpeed`:

1. **Trim angle** for `AlignOrientation` pitch: a curve that rises to about 8 degrees at 0.45 and falls to 3 degrees at 0.7.
2. **Extra lift** as a `VectorForce` up: 0 at low speed, ramping to about 15% of weight when planing. This lifts the hull so less of it is in the water.

A `FloatCurve` or a small table with linear interpolation works well for the curves and lets a designer tune without code.

```lua
local function trimFor(r)
	if r < 0.3 then return r / 0.3 * 2 end
	if r < 0.45 then return 2 + (r - 0.3) / 0.15 * 6 end
	return math.max(3, 8 - (r - 0.45) / 0.25 * 5)
end
```

Also cut thrust by around 20% in the hump band so the boat lingers there for half a second.

## Wakes that react to speed
The DevForum wake thread shows the classic dead ends: tweened parts with decals overlap and break, particles always face the camera, and the poster ended on Beams. A layered setup works best:

- **Wake trail:** two `Beam`s or a `Trail` from stern attachments, flat on the water (set `FaceCamera` false). Width and transparency driven by speed.
- **Bow spray:** `ParticleEmitter` at the bow; `Rate` scales with speed, `Speed` with speed, `EmissionDirection` up and forward.
- **Rooster tail:** a second emitter at the stern, only on while planing.
- **Turn spray:** boost the outer-side emitter when the steer input is high.

Vortex Studio's hull wake docs (a different engine) list the same three knobs worth exposing: particle initial speed, how far they travel, and lifetime, all depending on the vessel's speed and size.

Remember `ParticleEmitter.Transparency` and `Size` are `NumberSequence`s; setting a plain number errors, which is exactly the bug in the splash particle thread.

## Pitfalls
- Only emit while `BuoyancySensor.TouchingSurface` is true, otherwise a jumping boat sprays in mid-air.
- Update emitter rates on the client for every visible boat, not from the server.
- Do not trim with a big `MaxTorque`; let waves still rock the hull.

## Checklist
- [ ] Clear posture change between slow, hump and planing
- [ ] Wake width and spray scale with speed and stop out of water
- [ ] No server-side particle updates

## Related
[[Vehicles - Hub]] - [[Hover, Boat and Flying Vehicles with Mover Constraints]] - [[Boats and Ocean Resources - BuoyancySensor, Gerstner Waves and FFT Ocean]] - [[Vehicle Dust, Mud and Tire Trail VFX]]
