---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Car Meets and Cruising Social Design"
tags: [roblox, community-knowledge, vehicles, social, game-design, hangout]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/reference/engine/classes/TextChatService
  - https://create.roblox.com/docs/reference/engine/classes/CaptureService
---
# Racing - Car Meets and Cruising Social Design

Many of Roblox's biggest driving games are not won on the track: players spend hours **cruising, parking up, showing off and talking**. The car is an avatar. Designing for that social loop (show, notice, react) keeps players around between races and is cheap compared with new tracks. General hangout structure is in [[Social Hangout Starter Architecture]]; this note is the car-specific layer. (Design patterns below are our synthesis from common Roblox driving-game features; no single source covers them.)

## 1. Spaces that create meets

- **Meet spots**: car parks with marked bays near the spawn, a rooftop, a lookout over the city. Each bay is a part with a `ProximityPrompt` "Park here" that snaps the car straight (PivotTo onto the bay CFrame) and locks it while the owner is out.
- **A cruise loop**: one scenic road (coast, mountain, city ring) with no traffic lights, where driving slowly in a group looks good. Wide enough for two cars side by side.
- **Showroom stage**: a turntable bay that slowly rotates a player's car (anchored, CFrame rotation on the client) with spotlights. Queue for it with a prompt.
- **Drag strip / drift pad** right next to the meet, so showing off turns into a challenge naturally.

## 2. Show-off tools

- Rev the engine while parked (key or button): engine audio pitch spike, exhaust pops, small car body shake. Others nearby hear it.
- Horn with a few unlockable tones; lights flash; pop-up headlights or neon underglow toggles.
- Open doors and bonnet, sit on the bonnet (seat on the body).
- Photo mode (see [[Racing - Photo Mode with CaptureService]]).
- Car "spec card": walk up to a parked car, a `ProximityPrompt` "Inspect" shows owner name, car, PI/class, parts, and paint, read from attributes the server set at spawn.

## 3. Reacting to others

- "Like" a car from the spec card (one per player per car per day, stored on the server); top-liked cars of the day shown on a board at the meet.
- Emotes outside the car (lean on the car, sit on the roof).
- Convoy mode: invite friends to follow; the leader's car gets a marker for followers; optional reward for staying in convoy for 5 minutes.
- Chat bubbles above parked cars; keep proximity text chat on (`TextChatService` bubble chat).

## 4. Etiquette systems (protect the meet)

The worst thing in a car meet is one player ramming parked cars.

- **Ghost zones**: inside the meet area, disable car-to-car collision (collision groups, see [[Collision Groups for Vehicles - Wheels, Riders and Traffic]]) and cap speed to ~30 studs/s.
- Parked cars are anchored and immune to damage.
- Honk/rev spam limits (cooldown 1-2 s) and a per-player mute.
- Despawn cars that have been empty and unparked for 3-5 minutes.

## 5. Events

- Scheduled meets: "Sunset meet at the pier in 10 min" banner every hour, with a group photo moment and a small reward for attending.
- Themed days (JDM, classics, off-road) with a showroom contest voted by players.
- Time-of-day: meets look best at night with neon and lights; run a day/night cycle that hits night often.

## 6. Measuring it

Track minutes spent in meet zones, likes given, spec cards opened and convoy joins. If players spend under 10% of session time socially, the spaces are not working: add seats, lighting and reasons to stop.

## Related
[[Vehicles - Hub]] · [[Social Hangout Starter Architecture]] · [[Vehicle Customisation - Paint, Parts and Saved Loadouts]] · [[Vehicle Lights - Headlights, Brake Lights and Indicators]]
