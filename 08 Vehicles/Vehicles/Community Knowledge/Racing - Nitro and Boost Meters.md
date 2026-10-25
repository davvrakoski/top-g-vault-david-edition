---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Nitro and Boost Meters"
tags: [roblox, community-knowledge, vehicles, racing, nitro, boost]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/VectorForce
  - https://create.roblox.com/docs/reference/engine/classes/BasePart
  - https://create.roblox.com/docs/scripting/attributes
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
---
# Racing - Nitro and Boost Meters

Boost pads and drift mini-turbos are one-shot impulses (see [[Arcade Handling and Drifting Without Fighting Physics]]). A **nitro meter** is a resource the player manages: it fills from good driving and drains while held. It adds a decision ("use it now on the straight or save it for the overtake?") and is the main reason players learn a track. This note covers meter rules, applying the force and keeping it exploit-proof.

## Meter design choices

| Model | How it works | Feels like |
|---|---|---|
| Hold-to-drain | Hold the button, meter drains ~25-35% per second | NFS / Forza Horizon style |
| Charges | Meter split into 3 segments; tap spends one for a 1.5 s burst | Burnout / kart style, easier on mobile |
| Overboost | Using it when full gives a stronger longer burst | Rewards patience |

Pick charges for mobile-heavy audiences: one tap is easier than holding a button while steering.

## What fills the meter

- Drifting (per second of valid drift, see [[Racing - Drift Scoring - Angle, Speed and Combo Chains]])
- Slipstreaming behind another car
- Near misses with traffic, airtime off jumps
- Clean sections (no wall hits between two gates)
- Slow trickle over time (so newer players always get some)

Give fill rates per source in one table so balancing is a single edit. Typical target: a full meter roughly once per lap for a good driver.

## Applying the boost

Use a `VectorForce` on the chassis attachment, relative to the car, enabled only while boosting. A force (not setting velocity) keeps physics and collisions sane:

```lua
-- client (driver owns the car)
local force = chassis:WaitForChild("NitroForce") :: VectorForce
force.RelativeTo = Enum.ActuatorRelativeTo.Attachment0
local NITRO_ACCEL = 40 -- studs/s^2 extra

local function setBoost(on: boolean)
	force.Force = on and Vector3.new(0, 0, -chassis.AssemblyMass * NITRO_ACCEL) or Vector3.zero
	force.Enabled = on
end
```

Also raise the car's top-speed cap by a fixed amount while boosting (e.g. +15%), and taper the force near that cap, otherwise boost just slams into the limiter.

## Server authority

The meter value lives on the **server** as an attribute (`chassis:SetAttribute("Nitro", 0.62)`), so the HUD can read it and exploiters cannot set it:

1. Client sends `NitroRequest(true/false)` (rate-limit it, see [[Remote Rate Limiting Pattern]]).
2. Server drains the attribute each Heartbeat while active and rejects requests when empty.
3. Fill sources that the server can see (time, gates, slipstream distance) are computed on the server; client-only sources (drift) are capped per second.
4. The speed sanity check allows `topSpeed * 1.15` only while the server thinks boost is active, plus a 1 s grace.

Client prediction: start the VFX and force instantly on press; if the server replies "denied", stop within one round trip. The tiny mismatch is invisible.

## Feedback that sells it

- FOV kick + speed lines (see [[Racing - Chase Camera and Speed Effects - FOV, Shake and Speed Lines]]).
- Exhaust flame `ParticleEmitter` and a blue light, enabled with the force.
- A whoosh sound plus engine pitch up; meter bar pulses when full.
- Meter colour: blue filling, white flash at full, red when empty and pressed.

## Pitfalls

- Using `AssemblyLinearVelocity +=` every frame: fights the physics and breaks on low frame rates.
- Meter stored only on the client.
- No top-speed cap increase, so boost does nothing at max speed.

## Related
[[Vehicles - Hub]] · [[Arcade Handling and Drifting Without Fighting Physics]] · [[Vehicle Anti-Exploit - Server Sanity Checks for Client-Owned Cars]] · [[Remote Rate Limiting Pattern]]
