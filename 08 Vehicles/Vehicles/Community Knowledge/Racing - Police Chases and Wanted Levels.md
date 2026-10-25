---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Police Chases and Wanted Levels"
tags: [roblox, community-knowledge, vehicles, police, wanted-level, ai, game-design]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/wanted-system-gta/2198952
  - https://devforum.roblox.com/t/anyone-know-how-to-create-a-dont-get-spotted-system/276159
  - https://devforum.roblox.com/t/hello-iooking-how-to-make-an-cuff-system-that-only-arrests-people-that-are-wanted/1570004
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
---
# Racing - Police Chases and Wanted Levels

Cops-and-robbers driving games (Jailbreak, Emergency Response, driving roleplay games) and street-racing games both run on a **heat loop**: break a rule, get noticed, escalate, escape or get busted. The loop needs three server systems: a heat value, a "who can see you" check, and a pursuit director that spawns or assigns chasers. Police vehicles themselves can reuse the AI driver from [[Racing - AI Racers on a Racing Line Spline]] with a moving target instead of a racing line.

## 1. Heat as a number, stars as display

DevForum wanted-system threads store a numeric `WantedLevel` on each player (and some keep a boolean "Wanted" that gates arrest tools). Use a continuous **heat** value on the server and derive stars from it:

```lua
local STAR_THRESHOLDS = { 10, 30, 70, 140, 250 } -- heat needed for 1..5 stars

local function starsFor(heat: number): number
	local s = 0
	for i, need in STAR_THRESHOLDS do
		if heat >= need then s = i end
	end
	return s
end
-- server: player:SetAttribute("Heat", heat); player:SetAttribute("Stars", starsFor(heat))
```

Heat sources (only counted when **witnessed**): speeding past a camera, hitting a civilian car, ramming police, running a roadblock, finishing an illegal race. Each adds a fixed amount; repeat offences within 10 s add a multiplier.

## 2. Witnesses: line of sight, not magic

A DevForum answer suggests raycasting from the officer only while a crime is happening, which keeps the cost low. Practical version:

- Every 0.2-0.5 s, for each police unit within range (e.g. 250 studs), `workspace:Raycast(copEye, target - copEye, params)` with `RaycastParams` excluding both vehicles.
- A clear ray plus a field-of-view check (`copLook:Dot(dirToTarget) > 0.3`) = "seen".
- Static speed cameras: a zone part plus speed threshold, no raycast needed.

## 3. Escape (cooldown) rules

- While **seen**, heat decay is zero and the "last seen position" updates.
- When no unit has seen you for N seconds (N grows with stars, e.g. 8 s at 1 star, 30 s at 5 stars), the search phase begins: units drive to the last seen position and search nearby.
- If still unseen when the search timer ends, heat drops to zero ("Escaped") and the player gets a reward for high-star escapes.
- Show the state clearly on the HUD: stars flashing = searching, solid = seen.

## 4. Pursuit director

The director decides how many units chase and what they do, by stars:

| Stars | Units | Behaviour |
|---|---|---|
| 1 | 1-2 patrol cars | Follow, siren |
| 2 | 3 | Try to box in, PIT from the side |
| 3 | 4 + roadblock ahead | Spawn barricades on predicted route |
| 4 | 5 + spike strip | Tyre damage on contact |
| 5 | 6 + helicopter spotlight | Heli keeps "seen" active unless under cover |

Spawn new units **out of the player's view** (behind them or around a corner) and despawn units that fall 600+ studs behind. Cap total AI cars per server (e.g. 12) and share units when two wanted players are close.

## 5. Busted

Bust when the player's speed is under ~5 studs/s for 3 s while a unit is within ~20 studs; show a fill ring so the player can fight free. In player-vs-player cop games, only let a **cop team** player arrest someone whose `Stars > 0` (the cuff-tool thread uses exactly this gate).

## 6. Exploit and fairness checks

- Heat changes only on the server, from server-visible events.
- Teleporting out of a chase: if the car moves more than possible between ticks while wanted, keep the heat and the last seen position.
- Leaving the game while wanted: optional penalty on rejoin, but say so in the rules.

## Related
[[Vehicles - Hub]] · [[Racing - AI Racers on a Racing Line Spline]] · [[NPC Traffic - Community Approaches and the City People Cars Demo]] · [[Emergency Vehicle Creator - MIT Light and Siren Plugin]]
