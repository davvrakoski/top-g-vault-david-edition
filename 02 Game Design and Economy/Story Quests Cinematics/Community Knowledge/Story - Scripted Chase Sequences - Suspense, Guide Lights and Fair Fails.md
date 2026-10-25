---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Scripted Chase Sequences - Suspense, Guide Lights and Fair Fails"
tags: [roblox, community-knowledge, story, horror, chase, level-design, set-piece]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://nofilmschool.com/how-to-craft-slasher-chase-scene
  - https://www.gamedeveloper.com/design/the-perfect-organism-the-ai-of-alien-isolation
  - https://cdn.fastly.steamstatic.com/apps/valve/2009/ai_systems_of_l4d_mike_booth.pdf
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
---
# Scripted Chase Sequences - Suspense, Guide Lights and Fair Fails

A scripted chase (the monster bursts out and you run down a corridor, through a collapsing room, to a door that slams just in time) is the set piece players remember and clip for videos. It is different from a free-roaming stalker ([[Story - Stalker Monster AI Feel - Director Leash, Senses and Fair Kills]]): the route is fixed, the monster is choreographed, and the whole thing lasts 20-60 seconds. Done well it is pure adrenaline; done badly it is a trial-and-error wall where players die five times learning which way to turn. The aim is a chase that **feels** like a near miss on the first try for most players.

## Suspense first, then the run

Film writing on slasher chases (No Film School) leans on Hitchcock's distinction: surprise is a short jolt, suspense is drawn out. In games, the chase lands harder when players **know it is coming** for a few seconds: the hallway goes quiet, a distant roar, lights flicker down the corridor, the monster's silhouette at the far end. Then the run. Left 4 Dead's pacing talk makes the same point from the systems side: constant intensity is fatiguing, so peaks need valleys around them ([[Story - Horror Tension Director - Intensity, Build Up, Peak and Relax]]).

Shape: **warning (3-6 s) -> run (20-60 s) -> escape beat (door slams, monster blocked) -> quiet relief room.**

## Make the route readable at a sprint

Players running in a panic do not read the map. The route must read itself:

- **Guide lights:** the correct path is lit (warm or flickering lamps turn on ahead, or the exit sign glows). Wrong turns are dark.
- **Motion leads:** debris falling, a door swinging open, a fleeing NPC show the way.
- **One decision at a time,** and never a 50/50 guess. Each choice has a clear tell (light, sound, opening).
- **Wide corridors** (at least 8-10 studs) so party members do not block each other, and no small obstacles that snag on R15 collisions.
- **Cameras:** no forced camera turns mid-sprint. If the player needs to see the monster behind, use sound and a brief shoulder glance option.

## Monster speed and rubber-banding

A choreographed chaser should threaten, not out-run a player who runs correctly.

- Base chase speed **slightly below** the player's sprint `WalkSpeed` (for example sprint 24, monster 22). Players who move well pull ahead.
- **Catch-up:** if the monster falls more than ~40 studs behind, raise its speed so it stays visible and loud. If it is right on a player's heels for more than ~3 s, slow it slightly. This is rubber-banding; keep it subtle.
- **Kill only on real failure:** stopping, taking a dead-end, walking. Use a short wind-up before a catch so a last-second dodge or door slam still saves you.
- Alien: Isolation's developers avoided teleporting the alien except twice in the whole campaign; likewise, never teleport a chaser where players can see it.

## Multiplayer chases

- Target the **closest** player, but give the slowest one rubber-band help so a lagging teammate is not doomed.
- The escape door closes when the **last living player** passes, or after a short grace timer, then any stragglers are caught or teleported depending on your death model ([[Story - Co-op Story Checkpoints - Respawn, Catch-Up and Party Wipes]]).
- Network: a server-driven monster can look a few studs behind or ahead on each client. Use generous catch distances (a few studs more than visual contact) on the server, and play the "caught" moment only after the server confirms.

## Fair failure and fast retry

- **Checkpoint right before** the warning, not before the previous puzzle.
- **Instant retry:** under 5 s from death to running again. A long reload turns tension into irritation.
- **Change one thing on retry:** an extra guide light on the turn where the player died. After two deaths in the same spot, make the tell obvious.
- Show *why* they died ("It caught you at the stairs"), so they know what to change.

## Building it in Studio

1. Lay the route as numbered waypoint parts; the chaser follows them in order (no pathfinding needed for a fixed route).
2. A start trigger (once, party scope) runs the warning, then releases the monster ([[Story - Scripted Story Triggers - One-Shot Events, Per-Player vs Shared]]).
3. Guide lights and collapses fire from progress markers along the route.
4. An end trigger slams the door, freezes the monster and starts the relief music.

## Checklist

- [ ] Warning beat before every chase.
- [ ] Correct path readable with no prior knowledge.
- [ ] A clean run never gets caught.
- [ ] Retry under 5 s, checkpoint at the warning.
- [ ] Tested with 1 player and with a full party.

## Related
[[Story Quests Cinematics - Hub]] · [[Horror Map Design - Pacing, Loops and Readable Darkness]] · [[Case Study - DOORS]] · [[Enemy AI Pathing Loop with PathfindingService]]
