---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Horror Tension Director - Intensity, Build Up, Peak and Relax"
tags: [roblox, community-knowledge, story, horror, pacing, ai-director]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://cdn.fastly.steamstatic.com/apps/valve/2009/ai_systems_of_l4d_mike_booth.pdf
  - https://www.gamedeveloper.com/design/the-perfect-organism-the-ai-of-alien-isolation
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
---
# Horror Tension Director - Intensity, Build Up, Peak and Relax

A horror game that is scary all the time stops being scary. Players go numb, then bored, then they leave. The fix most big horror and co-op games use is a small **director** script that watches how stressed players are and turns the threat up or down. Valve's Left 4 Dead director (Michael Booth, "The AI Systems of Left 4 Dead", 2009) is the best documented version, and its rules fit a Roblox horror game in about 100 lines of server Luau. Map pacing (where the calm and scary rooms are) is covered in [[Horror Map Design - Pacing, Loops and Readable Darkness]]. This note is the *runtime* half: pacing that reacts to what actually happens.

## The L4D model in four rules

Booth's slides describe "Adaptive Dramatic Pacing":

1. **Estimate each player's intensity** as one number.
   - It rises when the player takes damage (in proportion to the damage), is knocked down, or is pulled off a ledge.
   - It rises when an enemy dies near them (more when closer).
   - It **decays toward zero over time**, but **not while an enemy is actively engaging** that player.
2. **Track the maximum intensity across the team**, not the average. One terrified player is enough.
3. **If intensity is too high, remove major threats for a while.**
4. **Otherwise, spawn an interesting population of threats.**

The talk stresses that this adjusts **pacing, not difficulty**. The game is not easier when you are struggling; it just gives you a breather at the right moment.

## The four-state cycle

| State | What the director does | L4D timing |
|---|---|---|
| Build Up | Full threat population until intensity crosses the peak threshold | until peak |
| Sustain Peak | Keep full threats a little longer so the peak is not cut short | 3-5 s after the peak |
| Peak Fade | Switch to minimal threats; wait until the current fight ends naturally and intensity drops out of the peak range | variable |
| Relax | Keep minimal threats | 30-45 s, or until players travel far enough toward the next safe room |

In Relax, L4D spawned no wandering zombies, no mobs and no special infected (existing ones could still attack). **Boss encounters ignored the director** on purpose, because missing bosses hurt pacing more than an occasional overlap.

## A Roblox version

```lua
-- ServerScriptService/TensionDirector (sketch)
local PEAK, CALM = 70, 25
local DECAY_PER_SEC = 4
local state, stateTime = "BuildUp", 0
local intensity = {} -- [Player] = number

local function bump(player, amount)
	intensity[player] = math.min(100, (intensity[player] or 0) + amount)
end

local function teamMax()
	local m = 0
	for _, v in intensity do m = math.max(m, v) end
	return m
end

game:GetService("RunService").Heartbeat:Connect(function(dt)
	for p, v in intensity do
		if not p:GetAttribute("Engaged") then
			intensity[p] = math.max(0, v - DECAY_PER_SEC * dt)
		end
	end
	stateTime += dt
	local m = teamMax()
	if state == "BuildUp" and m >= PEAK then state, stateTime = "Sustain", 0
	elseif state == "Sustain" and stateTime > 4 then state, stateTime = "Fade", 0
	elseif state == "Fade" and m < CALM then state, stateTime = "Relax", 0
	elseif state == "Relax" and stateTime > 35 then state, stateTime = "BuildUp", 0 end
	workspace:SetAttribute("DirectorState", state)
end)
```

Hook `bump()` into your damage handler (damage taken x 0.5), knock-down events (+30), monster sightings (+10 when the monster is in a player's view cone) and near-miss scares (+15). Set the `Engaged` attribute while a monster is chasing that player. Spawners, ambient scare scripts and music all read `DirectorState`.

## What each state should drive

- **Spawning:** only Build Up spawns new roaming threats. Fade and Relax allow existing chases to finish but start nothing new.
- **Scripted scares:** fire small scares (a door slam, a shadow) in Build Up; never in Relax. See [[Story - Scare Budgets and Cooldowns - Scripted Scares That Stay Scary]].
- **Music:** Relax gets a calm bed or silence; Build Up adds low drones; Sustain is the only state with the full chase stinger.
- **Stalker monsters:** in Relax, send the monster "backstage". Alien: Isolation did the same thing with its menace gauge, pulling the alien into vents when pressure peaked ([[Story - Stalker Monster AI Feel - Director Leash, Senses and Fair Kills]]).

## Pitfalls

- **Average intensity hides the scared player.** Use max, as L4D did.
- **Decaying during a chase** makes Relax start while a player is still running. Freeze decay while `Engaged`.
- **Relax with no exit condition.** L4D also ended Relax when players moved far enough forward. Add a distance or room-count check so fast teams are not bored.
- **Crude is fine.** Booth's own conclusion: the intensity estimate was rough, and the pacing still worked. Tune with playtests, not maths.

## Tuning checklist

- [ ] Plot `DirectorState` over a 10-minute test (print to output or log to a graph). You want 2-4 peaks, never a flat line.
- [ ] Relax lasts long enough to explore a room (30 s minimum).
- [ ] Bosses and story set pieces bypass the director.
- [ ] Solo and 4-player runs both reach peaks (scale bumps by team size if not).

## Related
[[Story Quests Cinematics - Hub]] · [[Encounter Director and Pacing]] · [[Horror Starter Architecture]] · [[Horror Map Design - Pacing, Loops and Readable Darkness]]
