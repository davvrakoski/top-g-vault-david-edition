---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Map - Parkour Flow Maps - Jump Metrics, Movement Lines and Skill Shortcuts"
tags: [roblox, community-knowledge, maps, parkour, movement, speedrun]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/StarterPlayer
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://book.leveldesignbook.com/process/layout/flow/verticality
---
# Map - Parkour Flow Maps - Jump Metrics, Movement Lines and Skill Shortcuts

Parkour maps differ from obbies. An obby is a list of stages you pass or fail; a parkour map is a space you move through fast, where the fun is chaining moves without stopping and finding a better line each run. That means the map is built around **lines** (routes with rhythm), exact jump metrics, and shortcuts that reward skill instead of punishing beginners.

## Know your jump (default avatar)
Derived from Roblox defaults (`StarterPlayer.CharacterJumpHeight` 7.2, `Workspace.Gravity` 196.2, `CharacterWalkSpeed` 16):
- Take-off speed: `sqrt(2 * 196.2 * 7.2)` = about 53 studs/s upward.
- Air time on flat ground: `2 * 53 / 196.2` = about 0.54 s.
- Flat gap at 16 studs/s: 0.54 * 16 = **about 8.7 studs** at the absolute limit.

Build with margins, because lag, slopes and late presses eat distance:
| Jump type | Design value |
|---|---|
| Easy gap (beginner line) | 5-6 studs |
| Normal gap | 6-7 studs |
| Hard gap (skill line) | 7.5-8 studs |
| Max step-up onto a ledge | 5-6 studs high (jump is 7.2) |
| Drop that should not hurt | Whatever your fall damage allows; mark bigger drops clearly |

If your game changes `WalkSpeed` (sprint, momentum) or `JumpHeight`, recompute: gap scales with speed x air time. Build a **metrics gym** (a test room with gaps at every 0.5 stud) before building the map, and rebuild it whenever movement changes.

## Lines, not stages
A **line** is a route that can be run without stopping. Design each area with:
1. **A safe line**: wide platforms, easy gaps, some stops. Anyone can get through.
2. **A fast line**: fewer, harder jumps, wall kicks or a long drop that skips a section. Saves seconds.
3. **Crossovers** where the lines touch, so a player who misses a hard jump lands on the safe line instead of dying.
Players learn the safe line, then discover the fast one. That is the replay loop for speedrun-style parkour.

## Rhythm
- Keep a steady beat: jump, jump, run, jump. Long irregular gaps between moves break flow.
- Put **landing zones bigger than take-off zones**. Players land with momentum and need space to turn.
- Avoid sharp turns right after a landing; turn before a jump, not after.
- Vary heights in waves (up, up, drop) rather than constant climbing. The Level Design Book's verticality page notes dropping is easier than climbing, so drops are where you give speed back.

## Readability at speed
- One material or colour language for "parkour surfaces" (ledges, wall-kick walls, vault boxes), used everywhere and nowhere else.
- Lines should be visible from 2-3 moves ahead. Put the next target at eye level or below; jumps to targets above the camera are blind.
- Use lights, coloured trims or arrows to hint at the fast line without spelling it out.

## Movement mechanics and the map
Custom moves (wall run, slide, vault, double jump) change every metric. Rules:
- Tag surfaces that allow a move (`WallRun`, `Vault`) instead of allowing it on every wall; the map then controls where it happens.
- Add the move to the metrics gym and measure its reach on PC and phone.
- Check the move with the smallest and largest avatar scales; collision box size differs.

## Fail states
- Falling should **cost time, not progress**. Respawn at the last checkpoint on the safe line within 1-2 seconds.
- Make kill zones obvious (water, lava, a void with fog) and put a checkpoint before every hard section.
- For server-validated times, use checkpoint gates and server timestamps (see the speedrun timer note).

## Testing
- Run the map yourself with a timer; your best time should be clearly faster than a first run.
- Watch new players: if they stop and look around for more than ~3 seconds, the next move is not readable.
- Death heatmaps show which jumps are too hard.

## Related
[[Maps - Hub]] - [[Obby Stage Design - Difficulty Ramp, Checkpoints and Readable Hazards]] - [[Recipe - Speedrun Timer with Checkpoint Validation]] - [[Map Blockout to Art Pass Workflow]] - [[Position and Death Heatmaps for Map Playtests]]
