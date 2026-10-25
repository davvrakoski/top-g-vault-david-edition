---
area: "11 VFX Lighting and Weather"
cluster: "VFX"
title: "Chain Lightning - Target Hopping on the Server, Arcs on the Client"
tags: [roblox, community-knowledge, vfx, abilities, lightning, combat]
cssclasses: [tg-a11]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/datatypes/OverlapParams
  - https://create.roblox.com/docs/effects/beams
  - https://devforum.roblox.com/t/lightning-chaining/2745096
  - https://construct.net/en/forum/construct-3/how-do-i-8/lightning-chain-184432
---
# Chain Lightning - Target Hopping on the Server, Arcs on the Client

Chain lightning (hit one enemy, jump to the next, and the next) is a staple of tower defense and RPG games. The DevForum thread in the sources is a typical question: a tower can hit one target and chain once, but the developer wants it to keep hopping to new unshocked enemies. The answer is a small loop that is the same in every engine: from the last target, pick the nearest enemy you have not hit yet, within range, until you run out of hops. On Roblox the important split is that the server picks targets and applies damage, and every client draws the arcs from a list of positions.

## Server: pick the chain

```lua
local overlap = OverlapParams.new()
overlap.FilterType = Enum.RaycastFilterType.Include
overlap.FilterDescendantsInstances = { workspace.Enemies }

local function buildChain(first: Model, maxHops: number, range: number): { Model }
	local chain, hit = { first }, { [first] = true }
	local current = first
	for _ = 2, maxHops do
		local origin = current:GetPivot().Position
		local best, bestDist = nil, range
		for _, part in workspace:GetPartBoundsInRadius(origin, range, overlap) do
			local enemy = part:FindFirstAncestorOfClass("Model")
			if enemy and not hit[enemy] then
				local d = (enemy:GetPivot().Position - origin).Magnitude
				if d < bestDist then best, bestDist = enemy, d end
			end
		end
		if not best then break end
		hit[best] = true
		table.insert(chain, best)
		current = best
	end
	return chain
end
```

Typical numbers: 3-5 hops, range 12-18 studs, damage multiplied by 0.7 per hop (100%, 70%, 49%...). Check line of sight per hop with a raycast if walls should block arcs.

Then apply damage hop by hop with a small delay (0.05-0.08 s per hop) so the gameplay matches the visual travel, and fire one RemoteEvent to all clients with the list of hit positions and the per-hop delay.

## Client: draw each arc

For each pair of positions, build a jagged line and show it briefly:

1. Split the segment into 6-10 points. Offset every inner point randomly perpendicular to the segment by up to 15% of its length.
2. Join the points with Beams (attachments parented to `workspace.Terrain` work as free-floating world points) or with thin Neon parts.
3. Beam settings: `FaceCamera = true`, `Width0/Width1 = 0.3`, `LightEmission = 1`, colour pale cyan-white, `Segments = 1` (each beam is straight; the jag comes from the points).
4. Show for 0.08-0.12 s, re-randomise the inner points once (the flicker sells electricity), then fade over 0.1 s.
5. At each target: one spark burst (`Emit(10)`, fast, short), a PointLight flash (one frame, `Range = 10`), and a small electric `Highlight` on the enemy for 0.2 s.

The vault already has the MIT Lightning Beams module and a midpoint-displacement bolt note; either can replace step 1-3 with nicer bolts.

## Pitfalls

- **Hitting the same target twice.** Always keep a hit set; the bug report "chain bounces between two enemies forever" is this.
- **Positions vs models.** Send positions captured at hit time, not the models. Enemies can die and be destroyed before the client draws the next arc.
- **Exploit surface.** Never accept a target list from the client. The client may only say "I cast at this first target"; the server validates range and builds the chain.
- **Visual spam.** Towers that chain every 0.3 s across 20 enemies create hundreds of beams. Pool the beams and attachments, cap simultaneous chains per client, and drop the re-randomise flicker on low quality.

## Readability

Keep chain lightning a distinct colour from your single-target lightning (for example cyan-white chain vs yellow single strike) so players can tell which tower or skill fired. Flashes should be small and short; avoid full-screen flashes for an ability that can fire many times per second.

## Related
[[VFX - Hub]] · [[Lightning Beams Module (MIT)]] · [[Sky Lightning Strikes - Midpoint Displacement Bolts and Thunder Delay]] · [[Replicating VFX - Server Signals, Client Renders]] · [[Beams, Trails and Attachments - Production Setups]]
