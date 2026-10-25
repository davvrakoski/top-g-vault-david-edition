---
area: "07 AI and Combat"
cluster: "AI"
title: "Adaptive Pacing with Player Intensity - Build Up, Peak, Fade and Relax"
tags: [roblox, community-knowledge, ai, director, pacing, intensity, left-4-dead]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.readkong.com/page/the-ai-systems-of-left-4-dead-michael-booth-valve-9664541
  - https://steamcdn-a.akamaihd.net/apps/valve/2009/ai_systems_of_l4d_mike_booth.pdf
  - https://arxiv.org/pdf/2408.15001
  - https://shacknews.com/article/82787/how-evolve-assures-action-peaks-and-valleys
---
# Adaptive Pacing with Player Intensity - Build Up, Peak, Fade and Relax

A spawn director decides how many enemies a game can afford; a **pacing director** decides **when** to send them. Michael Booth's GDC 2009 talk "The AI Systems of Left 4 Dead" describes the classic algorithm: track how stressed each player is, push threats until stress peaks, then deliberately back off. The result is the rhythm Evolve's designers later described as quiet stretches followed by chaos. This note turns the published slide content into a Roblox-ready state machine.

## Step 1: an intensity value per player

From the slides, each survivor's intensity:

- **Rises** in proportion to damage taken, when incapacitated, when pushed off a ledge, and when nearby enemies die (more for closer kills).
- **Decays** toward zero over time, but **not while enemies are actively attacking** that player.

Roblox version (0-100 scale):

```lua
local function onDamaged(st, amount, maxHp) st.intensity = math.min(100, st.intensity + amount / maxHp * 60) end
local function onNearbyKill(st, dist) st.intensity = math.min(100, st.intensity + math.max(0, 10 - dist / 3)) end
local function decay(st, dt, beingAttacked)
	if not beingAttacked then st.intensity = math.max(0, st.intensity - 8 * dt) end
end
```

The weights (60, 10, 8/s) are starting values; tune so a normal fight reaches the peak threshold after 30-60 s.

## Step 2: the director uses the **maximum** intensity

L4D tracks the highest intensity among the survivors. If anyone is overwhelmed, the whole team gets a break. That protects the weakest player, which matters on Roblox where skill levels in one server vary wildly.

## Step 3: four phases

| Phase | Population | Exit condition (L4D values) |
|---|---|---|
| **Build Up** | Full: wanderers, mobs, specials | Max intensity crosses the peak threshold |
| **Sustain Peak** | Full | 3-5 s after the peak |
| **Peak Fade** | Minimal: no new mobs or specials | Intensity drops out of the peak range and there is a natural break in combat |
| **Relax** | Minimal | 30-45 s, or the team has advanced far toward the next safe area |

Then back to Build Up. Key detail: the director changes **frequency** of threats (how many spawn), not their **strength**. Enemies do not get weaker when you are struggling; there are just fewer of them for a while, which players do not notice as "cheating".

"Minimal" in L4D means no mobs and no new specials; specials already alive may still attack. Bosses are outside the pacing system.

## Step 4: other L4D rules worth copying

- **Mobs** of 20-30 every 90-180 s on Normal, with 75% coming from behind; a Boomer's vomit forces a mob and resets the timer.
- **Wanderers** are only populated in areas around the team (the Active Area Set) and are cleared when an area becomes visible or during Relax, so the team never sees enemies pop in.
- **Specials** spawn in valid areas out of sight that suit their class.

## Roblox implementation notes

- Run the director on the server at 2-4 Hz; intensity events come from your damage and kill functions.
- For big servers, run one director per **group** of nearby players (cluster by distance) so a quiet group in one area is not hammered because another group is fighting.
- Show nothing about the director to players. Expose a debug overlay for you: per-player intensity bars and the current phase (see the AI debugging note).
- Log phase changes with timestamps in playtests; a healthy 10-minute session shows 4-8 peaks.

## Pitfalls

- Relax that is too long: players get bored and wander off. Shorten Relax if nobody is hurt.
- Intensity rising from friendly-fire or fall damage the same way as enemy damage; decide whether that counts.
- Using average intensity instead of maximum: the strongest player hides the weakest.

## Related
[[AI - Hub]] - [[Encounter Director and Pacing]] - [[Zombie Crowd Director Blueprint]] - [[Crowd and Encounter Director]] - [[Dynamic Music and Combat States]]
