---
area: "07 AI and Combat"
cluster: "AI"
title: "Ranged Enemy Tactics - Cover Points, Line of Sight and Peeking"
tags: [roblox, community-knowledge, ai, cover, line-of-sight, ranged-enemies, tactics]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.oreilly.com/library/view/game-ai-pro/9781351647748/xhtml/40_Chapter26.xhtml
  - https://pages.cs.wisc.edu/~dyer/cs540/handouts/gdc2006_orkin_jeff_fear.pdf
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot#Raycast
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
---
# Ranged Enemy Tactics - Cover Points, Line of Sight and Peeking

A ranged enemy that stands still in the open and shoots is a target dummy; one that hides permanently is just annoying. Good shooter AI picks **positions**: somewhere it is protected from the player but can still shoot, moves between such positions, and peeks out on a rhythm the player can learn. Commercial engines do this with position queries (CryENGINE's Tactical Point System, Unreal's Environment Query System, discussed in Game AI Pro), and F.E.A.R.'s planner made "take cover then fire" look intelligent. On Roblox you can build a lightweight version with tagged cover points and a few raycasts.

## 1. Author cover points

Place small invisible parts tagged `CoverPoint` (CollectionService) behind walls, crates and pillars, oriented so their LookVector faces **away from the wall** (toward where enemies would shoot). Store attributes:

- `Height`: `"Low"` (crouch, peek over) or `"High"` (peek around a side).
- `PeekOffset`: Vector3 relative position the NPC steps to when firing.

Hand-placing 10-30 points per arena is fast and gives designers control. Automatic generation (raycasting from a grid against walls) is possible but harder to tune.

## 2. Score candidate points

Every 1-2 s, or when the current cover is compromised, score points within 40 studs of the NPC:

```lua
local function scoreCover(npcPos: Vector3, threatPos: Vector3, point: BasePart, params: RaycastParams)
	local p = point.Position
	-- protected: wall between threat and the hiding spot
	local hidden = workspace:Raycast(threatPos, p - threatPos, params) ~= nil
	if not hidden then return -math.huge end
	-- can fire: clear line from the peek spot to the threat
	local peek = point.CFrame:PointToWorldSpace(point:GetAttribute("PeekOffset") or Vector3.zero)
	local canFire = workspace:Raycast(peek, threatPos - peek, params) == nil
	local travel = (p - npcPos).Magnitude
	local range = (p - threatPos).Magnitude
	local score = (canFire and 50 or 0) - travel * 0.8 - math.abs(range - 35) * 0.5
	if point:GetAttribute("ClaimedBy") then score -= 100 end
	return score
end
```

`params` should exclude characters and NPCs so only level geometry counts as cover, and the cover-point parts themselves need `CanQuery = false` (plus `CanCollide = false`, `Transparency = 1`) or the rays will hit them. Only fully score the 5-8 nearest points; raycasts add up across many NPCs.

## 3. The cover loop

| State | Behavior |
| --- | --- |
| MoveToCover | Path to the chosen point; claim it (`ClaimedBy` attribute) so squadmates pick others |
| InCover | Crouch/hide animation, wait 1.5-3 s (random) |
| Peek | Step to `PeekOffset`, aim, fire a burst (2-4 shots), return |
| Reposition | Every 2-3 peeks, or if the player flanks (cover no longer hides from them), pick a new point |
| Flee/Push | Low health: pick a point farther from the player; player reloading: push forward |

The rhythm (hide, peek, burst, hide) is what makes ranged enemies readable and fair. Players learn to wait for the peek.

## 4. Fairness and feel

- **Telegraph shots:** a short laser sight or muzzle glint 0.3-0.5 s before the burst.
- **Accuracy ramps:** first shots after peeking have more spread; accuracy improves over the burst. Players who move are harder to hit.
- **Limit simultaneous shooters:** an encounter director allows only 2-3 enemies to fire at one player at a time ("attack tokens"); others hold cover. This is how many shooters avoid instant deaths from crowds.
- **Flanking:** when one NPC suppresses (fires while others move), choose a flanker's cover point with an angle to the player at least 60 degrees from the suppressor's angle.

## 5. Server cost

- Use the NPC scheduler: cover decisions are low-frequency (1-2 Hz), aiming can be 10 Hz.
- Cache "hidden from player X" results per point for 0.5 s; many NPCs ask the same question.
- Do hit detection for NPC shots on the server with the same rules as player weapons.

## Pitfalls

- Cover points facing the wrong way: NPCs crouch in front of the wall. Visualize LookVector with a debug arrow.
- Using the player's head position only for "hidden" checks: low cover then hides nothing. Raycast to the torso and head.
- Every NPC choosing the same best point: always claim points.

## Related
[[AI - Hub]] - [[NPC Vision and Hearing Model]] - [[Influence Maps for Tactical NPC Positioning]] - [[Crowd and Encounter Director]]
