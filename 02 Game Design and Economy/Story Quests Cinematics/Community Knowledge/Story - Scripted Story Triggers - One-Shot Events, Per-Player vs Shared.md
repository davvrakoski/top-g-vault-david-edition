---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Scripted Story Triggers - One-Shot Events, Per-Player vs Shared"
tags: [roblox, community-knowledge, story, triggers, zones, scripting, events]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/1ForeverHD/ZonePlus
  - https://devforum.roblox.com/t/zone/1017701
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
---
# Scripted Story Triggers - One-Shot Events, Per-Player vs Shared

Almost every story moment in a Roblox level is a **trigger**: walk into the hallway and the lights die; pick up the doll and the music changes; reach the bridge and the cutscene plays. Beginners wire each one with its own `Touched` script, and by chapter two there are 80 scripts, some firing twice, some never, and nobody knows which. A small **trigger system** (tagged volumes, one handler, clear rules for who it fires for and how often) keeps story scripting reliable and lets designers add beats without code. Point-in-volume maths is covered in [[Math - Point-in-Region Tests - Boxes, Spheres, Cylinders and Polygons]]; this note is the story-side design.

## Three questions for every trigger

| Question | Options |
|---|---|
| **Who** does it fire for? | `player` (only whoever entered), `party` (everyone in the run), `server` (the world changes for all) |
| **How often?** | `once` per run, `oncePerPlayer`, `repeat` with a cooldown |
| **What condition?** | none, a story flag, an item held, everyone present |

Write these as attributes on the trigger part so designers can see and change them in Studio:

`TriggerId = "ch1_lights_out"`, `Scope = "server"`, `Repeat = "once"`, `RequiresFlag = "hasFuse"`.

## Detecting entry

Options from simplest to most robust:

- **`BasePart.Touched`** on an invisible, `CanCollide = false`, `CanTouch = true` part. Cheap and fine for many triggers, but it fires many times per entry and can miss fast movers.
- **Polling with spatial queries**: every 0.2-0.5 s, check each character's root position against the trigger box (point-in-box maths), or call `workspace:GetPartsInPart(triggerPart, overlapParams)` filtered to characters. Reliable entered / exited events, easy to debounce.
- **ZonePlus** (by ForeverHD, **MIT**, so bundle-safe): a community module that builds zones from parts and gives player entered/exited events using spatial queries. Its GitHub repo lists open issues and pull requests; check activity before depending on it.

Keep detection on the **server** for anything with consequences. A client-side trigger is fine for pure presentation (a local whisper sound), but the client should never be the one that says "the door opened".

## One handler for every trigger

```lua
-- ServerScriptService/StoryTriggers
local CollectionService = game:GetService("CollectionService")
local Handlers = require(script.Handlers) -- [TriggerId] = function(player, trigger)
local firedServer = {}                   -- [TriggerId] = true
local firedPlayer = {}                   -- [player] = {[TriggerId] = true}

local function canFire(trigger, player)
	local id, scope = trigger:GetAttribute("TriggerId"), trigger:GetAttribute("Scope")
	local flag = trigger:GetAttribute("RequiresFlag")
	if flag and not player:GetAttribute(flag) then return false end
	if scope == "server" then return not firedServer[id] end
	firedPlayer[player] = firedPlayer[player] or {}
	return not firedPlayer[player][id]
end

local function fire(trigger, player)
	if not canFire(trigger, player) then return end
	local id = trigger:GetAttribute("TriggerId")
	if trigger:GetAttribute("Scope") == "server" then firedServer[id] = true
	else firedPlayer[player][id] = true end
	local handler = Handlers[id]
	if handler then task.spawn(handler, player, trigger) else warn("No handler", id) end
end
```

Call `fire()` from whichever detection you chose for parts tagged `StoryTrigger`. Clear `firedPlayer[player]` on `PlayerRemoving`. Handlers are small named functions ("lights out", "start chase") that call your other systems (cutscene, director, audio).

## Story-specific rules

- **Mark progress, not just effects.** A trigger that matters for the story also sets a flag (`reachedBridge`) so late joiners, respawns and save data agree ([[Story - Story State Flags - Saving Chapter Progress Without Breaking Old Saves]]).
- **Ordering.** Use `RequiresFlag` to stop sequence breaks: the "monster appears" trigger needs `foundDiary` first, so a speedrunner who skips the diary does not see the reveal before the setup.
- **Everyone present.** For party beats, the trigger waits until all living players are inside (with a timeout), then fires once for the party.
- **Scares** go through the scare budget rather than firing directly ([[Story - Scare Budgets and Cooldowns - Scripted Scares That Stay Scary]]).

## Debugging

- A Studio-only toggle that makes trigger parts visible and colour-coded (green = not fired, grey = fired).
- A log line per fire: `[Trigger] ch1_lights_out by Player1 (server)`.
- A test that asserts every `TriggerId` in the map has a handler and no handler is unused.

## Pitfalls

- **Double fire** from `Touched` on several limbs. Debounce by player.
- **Triggers inside streamed-out areas** with `StreamingEnabled`: client-side triggers there do not exist yet. Keep logic on the server.
- **Respawn re-trigger:** a respawn point inside a `once` trigger volume re-fires per-player triggers if you forgot the scope.

## Related
[[Story Quests Cinematics - Hub]] · [[Recipe - Healing Zones and Safe Zones]] · [[CollectionService Tag-Driven Architecture]] · [[Quest Objective Framework]]
