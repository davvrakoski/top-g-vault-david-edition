---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Collectible Pickups - Idle Glint, Magnet Pull and Collect Pop"
tags: [roblox, community-knowledge, vfx, pickups, coins, simulator, game-feel]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/curriculums/core/scripting/script-game-behavior
  - https://create.roblox.com/docs/reference/engine/classes/Sparkles
  - https://create.roblox.com/docs/reference/engine/classes/ParticleEmitter
  - https://create.roblox.com/docs/reference/engine/classes/RunService
  - https://devforum.roblox.com/t/more-control-over-sparkles/51508
---
# Collectible Pickups - Idle Glint, Magnet Pull and Collect Pop

Coins, gems, orbs and drops are the most-seen effect in simulators, obbies and RPGs, often hundreds at once. They need to do three jobs: be noticed from a distance (idle), feel good to grab (pull and pop), and cost almost nothing. The official coin-collection tutorial covers the gameplay; this note is the presentation layer. Skip the legacy `Sparkles` object: its docs describe it as a quick effect "in a pinch" and recommend `ParticleEmitter` for detailed work, and a DevForum feature thread notes Sparkles cannot be customised.

## Idle: bob, spin, glint

Animate all pickups from **one client loop**, not a script or tween per coin:

```lua
local RunService = game:GetService("RunService")
local active: { [BasePart]: { base: CFrame, phase: number } } = {}

RunService.RenderStepped:Connect(function()
	local t = os.clock()
	for part, data in active do
		local bob = math.sin(t * 2 + data.phase) * 0.3
		part.CFrame = data.base * CFrame.new(0, bob, 0) * CFrame.Angles(0, t * 1.5 + data.phase, 0)
	end
end)
```

Only add pickups within 120-150 studs of the camera to `active`; far ones stay still. With anchored parts and a few hundred entries this is cheap.

Glint: rather than an emitter per coin, use one shared emitter that you move and `Emit(1)` at a random nearby coin every 0.1-0.2 s (a star texture, `Lifetime = 0.25`, `Size` 0 -> 0.8 -> 0, `LightEmission = 1`). The eye sees "everything sparkles", but there is one emitter. For rare drops add a short vertical `Beam` (a "loot beam") in the rarity colour so they are visible across the map.

## Magnet pull

When the player is within the magnet radius, the coin flies to them instead of waiting to be touched. Move it on the client with a fast ease-in curve:

1. Mark the coin as "collecting" locally and remove it from the idle loop.
2. Over 0.15-0.3 s, lerp from its position to the player's root, with an upward arc (add `math.sin(alpha * math.pi) * 2` studs of height).
3. Scale it down in the last 30% of the flight.
4. On arrival: pop (below), then hide or return the coin to a pool.

The server decides that the coin was collected (distance check against the character) and awards the currency. The client flight is presentation only; if the server rejects the pickup, put the coin back.

## Collect pop

All in one frame at the player:

- `Emit(6)` small stars, `Speed = 6`, `Lifetime = 0.3`.
- A tiny flat ring scaling 0.5 -> 3 studs in 0.2 s.
- A "+1" number floating up in a BillboardGui (pool these too), or a counter bump on the HUD.
- A pitch-stepped sound: raise `PlaybackSpeed` by about 5% per pickup in a quick chain (reset after 0.5 s of no pickups). This "combo pitch" is a widely used game-feel trick.

## Mass pickups

Simulators can drop 50 coins at once. Rules that keep it smooth:

- Pool coin parts; never create and destroy per drop.
- Cap the flying coins per frame (for example 20); queue the rest a frame later.
- Merge visual pops: if 10 coins land in 0.1 s, play one bigger pop and one "+10".
- Let the server send the count and position of a drop; each client spawns its own visual coins (the server does not need 50 replicated parts).

## Readability

- Contrast against the floor: give coins a thin outline (`Highlight` on a container model if you have few, or a darker rim in the mesh texture if many).
- Distinct silhouettes per currency (coin disk vs gem vs orb), not just colour.

## Related
[[VFX - Hub]] · [[FX - Level-Up and Reward Bursts - Light Pillars, Confetti and Screen Pops]] · [[UI and Feedback Sound Design - Clicks, Rewards and Errors]] · [[ParticleEmitter Bursts, Flipbooks and Budgets]] · [[VFX Performance, LOD and Pooling]]
