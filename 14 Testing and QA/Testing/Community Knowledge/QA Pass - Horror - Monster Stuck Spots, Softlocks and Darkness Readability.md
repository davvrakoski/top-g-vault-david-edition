---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Horror - Monster Stuck Spots, Softlocks and Darkness Readability"
tags: [roblox, community-knowledge, testing, qa, genre-qa, horror, pathfinding, lighting]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/characters/pathfinding
  - https://create.roblox.com/docs/reference/engine/classes/Path
  - https://create.roblox.com/docs/environment/lighting
  - https://create.roblox.com/docs/reference/engine/classes/Lighting
  - https://create.roblox.com/docs/production/promotion/content-maturity
---
# QA Pass - Horror - Monster Stuck Spots, Softlocks and Darkness Readability

Horror is the genre where one bug kills the whole mood: a monster stuck humming against a doorframe is funny, a key that fell through the floor ends the run, and a corridor that is "atmospheric" on your monitor is pure black on a phone. This pass targets the three things horror players complain about most: the monster, the softlock and the dark.

## Bugs this genre always ships with
- **Monster stuck on geometry.** The path is computed for a default-size agent, but the monster model is wider or taller, so it wedges in doors and under beams. Pathfinding agent parameters (`AgentRadius`, `AgentHeight`, `AgentCanJump`, `AgentCanClimb`) must match the real model.
- **Path never recomputed.** Doors close, furniture moves, and the path's `Blocked` event fires but nothing listens, so the monster walks into a closed door forever. `ComputeAsync` can also return a non-success `Status` (no path), which needs a fallback.
- **Hiding spot dead end.** The monster loses the player inside a locker and never returns to patrol, or keeps "seeing" through the locker.
- **Softlocks.** The key item falls into the void, the only holder leaves, a door locks behind the team before the objective spawns, or a cutscene leaves the camera `Scriptable` after the player dies mid-scene.
- **Scripted triggers that only fire once per server.** A chase trigger fires for the first player and never re-arms, so later players walk through an empty set piece.
- **Unreadable darkness.** Fine at max graphics, black at low quality or on a phone outdoors.

## Test checklist
1. Run the monster on an empty server with debug waypoints drawn (small neon parts at each `PathWaypoint`) for 20 minutes. Note every spot it stops.
2. Close every door and block every corridor one at a time while the monster chases. It must re-path or give up gracefully.
3. Hide in each hiding spot during a chase. Monster must lose you, search, and go back to patrol.
4. Softlock matrix: for every key item, test (a) holder dies, (b) holder leaves, (c) item dropped off a ledge, (d) item dropped inside a closing door. Each case needs a respawn or recovery rule.
5. Die during every cutscene and every chase. Camera and controls must return.
6. Join late into a server where the chase already happened. Is the game still finishable?
7. Graphics quality 1 on a low-end phone, screen brightness at about half. Can you find the objective, the door, the key and the monster?

## Exploit angles
- Players squeeze into props or out of the map to sit somewhere the monster cannot reach and farm survival time. Add kill volumes or path-reachable checks for those spots.
- Interaction remotes (pick up key, open door) need a server distance check, or one player opens the whole map from spawn.

## Balance checks
- Log time-to-first-catch across playtests. If most runs end in the first minute or never end, the monster's speed, sense range or leash needs tuning.
- Count scares per minute in a recorded run. Back-to-back scares stop working (see the scare budgets note).

## Darkness readability
- Use `Lighting.Ambient`, `OutdoorAmbient`, `Brightness` and `ExposureCompensation` to set a floor, then darken with fog or atmosphere instead of crushing everything to black.
- Interactable objects get a contrast cue that survives low graphics: a faint emissive part, a highlight on approach, or a sound.
- Take a screenshot of each room at graphics level 1 and at the top level. If the objective disappears in the low shot, fix the lighting, not the player's settings.
- Fear-based content level affects your maturity label; answer the Maturity & Compliance Questionnaire honestly after scares change.

## Data and save checks
- Saved progress (chapter, items, unlocked doors) must never save a state where a required item is gone. Save after the recovery rule runs.
- Lobby rewards granted for escaping are granted server-side when the escape trigger fires, not from a client "I won".

## Debug helper: monster stuck logger
```lua
-- Server: call once per monster. Logs places where it barely moves while chasing.
local STUCK_SPEED, STUCK_TIME = 0.5, 4 -- studs per second, seconds

local function watchStuck(monster: Model, isChasing: () -> boolean)
	local root = monster:WaitForChild("HumanoidRootPart") :: BasePart
	local last, stillFor = root.Position, 0
	while monster.Parent do
		task.wait(1)
		local moved = (root.Position - last).Magnitude
		last = root.Position
		if isChasing() and moved < STUCK_SPEED then
			stillFor += 1
			if stillFor == STUCK_TIME then
				warn(("STUCK %s at %s"):format(monster.Name, tostring(root.Position)))
			end
		else
			stillFor = 0
		end
	end
end
```
Paste the logged positions into a list and fix them one by one; most turn out to be the same three doorframes.

## Related
[[Testing - Hub]] - [[Horror Starter Architecture]] - [[Story - Stalker Monster AI Feel - Director Leash, Senses and Fair Kills]] - [[Story - Hiding Spots - Closets, Lockers and Monster Checks]] - [[Story - Jump Scares, Flashing and Maturity Labels - Ethical Horror on Roblox]]
