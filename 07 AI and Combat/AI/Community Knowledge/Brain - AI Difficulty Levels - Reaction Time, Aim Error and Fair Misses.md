---
area: "07 AI and Combat"
cluster: "AI"
title: "AI Difficulty Levels - Reaction Time, Aim Error and Fair Misses"
tags: [roblox, community-knowledge, ai, difficulty, aim, fairness, bots]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://web.eecs.umich.edu/~sugih/courses/eecs494/fall06/lectures/lecture14-planning+movement.pdf
  - https://www.gamedeveloper.com/design/cyber-demons-the-ai-of-doom-2016-
  - https://gamedev.stackexchange.com/a/149747
  - https://bugnet.io/blog/how-to-fix-ai-difficulty-scaling-breaking-reaction-and-aim
---
# AI Difficulty Levels - Reaction Time, Aim Error and Fair Misses

On Roblox, server-side NPCs can aim perfectly: they know every player's position exactly and can raycast in the same frame. A shooter enemy with perfect aim is not hard, it is unfair, and players feel it immediately. Difficulty should come from **human-like limits** that you dial up and down, not from more HP and damage. The sources below agree on a short list of knobs.

## The knobs

| Knob | Easy | Normal | Hard | Notes |
|---|---|---|---|---|
| Reaction time (first sight to first shot) | 0.9 s | 0.6 s | 0.35 s | Never below ~0.25 s: keep a human-like floor |
| Aim error cone (degrees) | 6 | 3.5 | 2 | Never 0 |
| Error growth with target speed | High | Medium | Low | DOOM lowered demon accuracy as the player moved faster |
| Burst length / pause | 3 / 1.2 s | 4 / 0.9 s | 5 / 0.6 s | "Burst discipline" |
| First-shot miss | Always | Always | 50% | Gives the player a moment to react |
| Simultaneous attackers (tokens) | 1 | 2 | 3 | See the attack token note |
| Tracking delay (aim lags target) | 0.3 s | 0.2 s | 0.1 s | Aim at where the player was |

Starter values only; the sources describe the knobs, not these exact numbers. A Bugnet guide (vendor blog) makes the point that pushing one knob to the limit gives either a harmless or an unbeatable enemy, so spread difficulty across several.

## Fair misses

- A University of Michigan game AI lecture on "artificial stupidity" recommends that enemies **miss the first time**, giving the player a second to react while keeping tension.
- Make misses **near-misses**: aim a little left or right of the player so bullets crack past and hit nearby walls (pressure without damage). Random misses at the feet look broken.
- A Game Development Stack Exchange answer notes some games quietly give the first shot a 0% chance to hit when the player appears; it is common and widely accepted, as long as it is consistent.

## Implementation on Roblox

```lua
local function aimDirection(npcPos: Vector3, target: BasePart, cfg, firstShot: boolean)
	-- aim at a delayed position, not the live one
	local lagPos = target.Position - target.AssemblyLinearVelocity * cfg.trackingDelay
	local dir = (lagPos - npcPos).Unit
	local err = math.rad(cfg.errorDeg + target.AssemblyLinearVelocity.Magnitude * cfg.speedError)
	if firstShot then err = math.max(err, math.rad(4)) end -- guaranteed miss band
	local rnd = Random.new()
	local axis = dir:Cross(Vector3.yAxis)
	if axis.Magnitude < 1e-3 then axis = Vector3.xAxis end
	local spin = CFrame.fromAxisAngle(dir, rnd:NextNumber(0, 2 * math.pi))
	local tilt = CFrame.fromAxisAngle(axis.Unit, rnd:NextNumber(0, err))
	return (spin * tilt):VectorToWorldSpace(dir)
end
```

For a guaranteed miss, offset the ray sideways by more than the target's width instead of relying on randomness.

## Reaction time done right

- Start a timer when the NPC first **perceives** the player (vision check passes), not when the player enters range.
- Reset or partly reset it when the player breaks line of sight for more than 2 s, so peeking matters.
- Shorten reaction time if the player has been shooting the NPC (it is "alert").

## Melee and boss difficulty

- Longer telegraphs on easy, shorter on hard; never remove them.
- Fewer combo follow-ups on easy (a 3-hit string becomes 1-2).
- Same attack patterns on all difficulties so players learn one fight.

## Pick difficulty without menus

Roblox players rarely choose difficulty. Options: scale knobs with **zone** (later areas are harder), with **party size**, or adapt slowly to deaths (a small reaction-time increase after each death, reset on success). Keep the adaptation small and hidden; obvious rubber-banding feels patronizing.

## Pitfalls

- NPCs seeing through walls because the vision check skipped a raycast.
- Perfect leading of projectiles on hard (still unfair).
- Difficulty implemented as damage ×3 only: one-shot deaths with no counterplay.

## Related
[[AI - Hub]] - [[NPC Vision and Hearing Model]] - [[Ranged Enemy Tactics - Cover Points, Line of Sight and Peeking]] - [[Brain - Attack Tokens and Squad Roles - Limiting Attackers, Flanking and Suppression]]
