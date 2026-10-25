---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Hiding Spots - Closets, Lockers and Monster Checks"
tags: [roblox, community-knowledge, story, horror, hiding, proximityprompt]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/closet-hiding-system-inspired-by-doors-open-sourced/2304868
  - https://coddy.tech/learn/courses/roblox_game_escape_the_dark/hide
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://www.gamedeveloper.com/design/the-perfect-organism-the-ai-of-alien-isolation
---
# Hiding Spots - Closets, Lockers and Monster Checks

Hiding is the main verb of chase horror on Roblox: DOORS closets, Piggy-style houses, locker rooms in school horror games. A hiding system is small (a prompt, a seat-like position, a flag the monster reads) but it decides whether the game is tense or trivial. If hiding is perfectly safe, players camp in the closet. If it is random, they feel cheated. The goal is **safe if you chose well and timed it well, risky if you got greedy**.

## Core data

A DevForum community resource (lilsquish08, April 2023, "Closet Hiding System inspired by DOORS", no license stated, so **link only**) uses a simple idea worth copying: each closet has an **`Occupant`** value holding the hidden player's name, cleared on exit. Monster AI reads it; other scripts use it to block a second player from entering.

A cleaner modern version uses attributes and tags:

- Tag each hiding spot `HideSpot` with CollectionService.
- Attributes: `Occupant` (UserId, 0 = empty), `Risk` (0-1), `LastChecked` (time).
- The **server** owns the state. The client only plays the camera and animation.

```lua
-- Server: enter / exit a hiding spot
local function enter(player, spot)
	if spot:GetAttribute("Occupant") ~= 0 then return end
	local char = player.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if not hum or hum.Health <= 0 then return end
	spot:SetAttribute("Occupant", player.UserId)
	player:SetAttribute("HiddenIn", spot:GetFullName())
	char:PivotTo(spot.InsidePoint.WorldCFrame)
	hum.WalkSpeed, hum.JumpHeight = 0, 0 -- the DOORS-inspired thread missed blocking jumps at first
end

local function exit(player, spot)
	if spot:GetAttribute("Occupant") ~= player.UserId then return end
	spot:SetAttribute("Occupant", 0)
	player:SetAttribute("HiddenIn", nil)
	player.Character:PivotTo(spot.ExitPoint.WorldCFrame)
	-- restore WalkSpeed / JumpHeight from saved values
end
```

Use a `ProximityPrompt` on the door ("Hide", `HoldDuration` 0, `MaxActivationDistance` about 6). While hidden, swap it for an "Exit" prompt, or bind exit to the same key.

## Clean-up rules (where most bugs live)

- Clear `Occupant` on **death**, **character removal** and **PlayerRemoving**. Otherwise the closet stays "full" forever.
- The Coddy course lesson on hiding clears the hidden state if the player ends up far from the closet. Add the same safety check each second (distance > 8 studs = not hidden).
- Block entering while the monster is already **in the attack wind-up** on that player, or hiding becomes an invincibility button.

## Camera and feel (client)

- First-person view through the slats; narrow the FOV slightly (from 70 to 60) to feel cramped.
- Darken the screen edges with a vignette and lower ambient sound; let the monster's footsteps carry.
- Optional **breath-hold** minigame when the monster is close (hold a key, release when the meter fills). It turns waiting into play.

## Monster checks: risk you can read

Alien: Isolation unlocked locker-checking only later in the game and never as a reaction to the player dying, so it felt like the creature learning. Apply the same:

1. When the monster loses a player near hiding spots, it may **check** one spot.
2. Chance to check = `spot.Risk` x (1 if the player was **seen entering**, else 0.2).
3. Recently checked spots are skipped (`LastChecked` within 60 s), so hiding spots rotate in value.
4. A check is **telegraphed**: footsteps stop outside, a 1-2 s pause, then the door opens. If the breath-hold succeeds, the monster leaves.

Design the map so spots differ: a closet in a dead-end room is risky, one next to a loop is safe but far from objectives.

## Anti-camping

- Hiding drains a **calm meter** or a light source, so players must come out.
- Objectives (keys, generators) are never inside hiding rooms.
- A director in Relax sends the monster away, which naturally pulls players out ([[Story - Horror Tension Director - Intensity, Build Up, Peak and Relax]]).

## Checklist

- [ ] Server owns occupancy; client cannot claim a spot.
- [ ] State clears on death, leave and distance.
- [ ] Jumping and moving disabled while hidden.
- [ ] Monster check is telegraphed and has a counterplay.

## Related
[[Story Quests Cinematics - Hub]] · [[Story - Stalker Monster AI Feel - Director Leash, Senses and Fair Kills]] · [[Horror Map Design - Pacing, Loops and Readable Darkness]] · [[Case Study - DOORS]]
