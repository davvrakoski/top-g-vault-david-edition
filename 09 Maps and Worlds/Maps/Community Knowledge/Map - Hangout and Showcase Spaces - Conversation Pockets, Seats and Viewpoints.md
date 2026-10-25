---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Map - Hangout and Showcase Spaces - Conversation Pockets, Seats and Viewpoints"
tags: [roblox, community-knowledge, maps, hangout, showcase, social]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.raphkoster.com/?p=2597
  - https://en.wikipedia.org/wiki/Proxemics
  - https://create.roblox.com/docs/reference/engine/classes/Seat
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/workspace/streaming/slim
---
# Map - Hangout and Showcase Spaces - Conversation Pockets, Seats and Viewpoints

Hangouts and showcases have no win condition, so the map is the whole product. A hangout succeeds when strangers end up near each other with something to talk about; a showcase succeeds when players walk a route that shows the best views in the right order. Both are level design problems, and both differ from a lobby, which mainly routes players into a game.

## Hangouts: build pockets, not plazas
Raph Koster's zone design lessons (raphkoster.com) give the core ideas:
- **Keep the central space open**, with one simple landmark (a fountain, a tree). An empty, bright plaza invites crowds; a cluttered one splits them.
- **Fractal pockets.** A town has several centres, a cafe is a pocket inside it, and each table is a smaller pocket. Hangouts need the same nesting: big open area, medium zones (stage, pool, campfire), small pockets (a bench pair, a booth).
- **Each spot needs a defining activity** (a pool, a dance floor, a quiz board) so players self-select into spots they like.
- **Bright, welcoming colours** in social spaces, never dingy ones.

### Conversation distance
Proxemics (Edward T. Hall) puts "social distance" for people talking at about 1.2-3.6 m. With Roblox's 1 stud = 0.28 m, that is roughly **4-13 studs**. Practical numbers:
- Seats facing each other **4-8 studs apart** around a table or fire, angled inward.
- Groups of **3-6 seats**, not long rows. Rows face nobody.
- Pockets **20-40 studs apart**, so neighbouring groups are visible but not in the conversation.
- Chat bubbles show above heads; avoid low ceilings or overhanging props right above seating.

### Seats and props
- `Seat` parts sit any humanoid that touches them, which causes accidental sits in busy spaces. Use a `ProximityPrompt` and `Seat:Sit(humanoid)` instead (see the seat entry note), with `Seat.Occupant` to check if it's taken.
- **Low-effort activities** keep groups together while they talk: swings, a basketball hoop, a piano, a fishing spot, emote stages.
- Add **one spectacle** visible from every pocket (a fireworks show on a timer, a moving train, a day-night sky) so the whole server shares a moment.

### Capacity
Avatars cluster around anything new. Make the busiest spots twice as wide as you think, and check the server at max players in a test with bots or friends.

## Showcases: a walk with chapters
A showcase is a guided tour. Plan it like a short film:
1. **Arrival frame.** The spawn looks at the best view in the map, framed by something close (an arch, trees). First impressions are the thumbnail moment.
2. **A loop path** that returns to spawn, 2-5 minutes long at walk speed (16 studs/s: about 2,000-5,000 studs of path). No dead ends unless there's a reward.
3. **Chapters.** Alternate tight spaces and big reveals: a narrow canyon opening onto a lake works better than a constant wide view.
4. **Viewpoints.** Mark 4-8 spots where the composition is best: a bench, a platform, a sign. Players screenshot there.
5. **Light the path** subtly so the route reads in any time of day.

### Showcase tech
- Distant scenery: give big background models `LevelOfDetail = SLIM` so they stay visible when streamed out (SLIM docs).
- Optional photo mode: hide UI and let the camera move freely (see the photo mode note).
- Keep a lighting preset per chapter and blend between them with zone detection on the client.
- Test on a phone. A showcase that runs at 20 FPS is not a showcase.

## Checklist
- [ ] Central open space with one landmark
- [ ] 4-8 pockets with seats in small facing groups, each with an activity
- [ ] No touch-to-sit seats in busy paths
- [ ] Showcase loop timed, with an arrival frame and marked viewpoints
- [ ] Tested at full server size and on a phone

## Related
[[Maps - Hub]] - [[Social Hub and Lobby Layout]] - [[Seat Entry with ProximityPrompt - No More Accidental Sits]] - [[Racing - Photo Mode with CaptureService]] - [[Social Hangout Starter Architecture]]
