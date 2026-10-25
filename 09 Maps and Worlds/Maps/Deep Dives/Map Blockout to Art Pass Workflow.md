---
area: "09 Maps and Worlds"
cluster: "Maps"
tags: [deep-dive, roblox, level-design, blockout, greybox, art-pass]
verified: 2026-10-25
cssclasses: [tg-a09]
---

# Map Blockout to Art Pass Workflow

## Why this matters
On Roblox the map is usually the game. Players judge it in the first minute, and it decides how far a mobile device can render and stream. Fixing layout after the art pass means rebuilding expensive meshes.
A disciplined blockout, playtest, lock and art pass pipeline lets you change the map cheaply while it is grey, then swap in final art without breaking gameplay, collisions or performance.

---

## 1. Know your metrics before you place a single part

Default character values from the Engine API (StarterPlayer):

| Value | Default | What it means for layout |
|---|---|---|
| `CharacterWalkSpeed` | 16 studs/s | A 160-stud corridor takes about 10 s to cross |
| `CharacterJumpHeight` | 7.2 studs | A ledge above ~7 studs needs a ladder, ramp or double jump |
| `CharacterMaxSlopeAngle` | 89° | Characters climb almost any slope by default; use walls, not slopes, to block |
| `Workspace.Gravity` | 196.2 studs/s² | Used for jump-arc maths |

**Derived jump gap (flat ground, default settings):** time in the air ≈ 2·√(2·7.2 / 196.2) ≈ 0.54 s, so the horizontal reach is ≈ 0.54 × 16 ≈ **8.7 studs**. Treat 6–7 studs as a comfortable gap and 8+ as "skill" jumps. This is arithmetic from the defaults, so **verify it with a test course**, because acceleration, animation and latency all change the feel.

Scale reference: Roblox's units page gives 1 stud = 28 cm (so 1 m ≈ 3.57 studs). The default avatar is stylized and shorter than a real person relative to that scale, so doorways built at "real" metric size often feel cramped or oversized. Build a **metrics gym** first (below) and design from it.

### Build a metrics gym (30 minutes, reused forever)
A separate place or a folder far from spawn containing:
- Doorways at 6, 7, 8 and 10 studs tall; corridors 6, 8, 12 and 16 wide
- Jump gaps 4–10 studs in 1-stud steps; ledges 3–9 studs high
- Stairs at several step heights; ramps at 20°, 30°, 45°
- A 50/100/200/400-stud distance line with labels
- Camera test: a 3-stud and a 5-stud ceiling to check third-person camera clipping

Play it on desktop **and** in the Device Simulator on a phone. Write the comfortable numbers into the map's design note.

---

## 2. Phase plan

| Phase | Output | Exit criteria |
|---|---|---|
| 0. Paper | Top-down sketch: spawn, critical path, landmarks, zones, sightlines | You can explain the first 60 seconds of player movement |
| 1. Greybox | Anchored Parts only, colour-coded, correct scale | A new player can find the objective without help |
| 2. Gameplay pass | Spawns, checkpoints, hazards, prompts, NPC paths | The core loop runs end to end on the greybox |
| 3. Layout lock | Signed-off layout, metrics, streaming zones | Changes after this need a ticket |
| 4. Kit / art swap | Modular meshes and materials replace greybox per zone | Collision and navigation unchanged (re-tested) |
| 5. Lighting and atmosphere | Lighting, Atmosphere, post-processing per zone | Readability check on low graphics quality |
| 6. Set dressing | Props, decals, foliage | Triangle and texture budget respected |
| 7. Optimization | Collision fidelity, CanTouch/CanQuery, streaming, LOD settings | Mobile frame rate and memory targets met |

**Do not skip phase 3.** Most "the art team is behind" problems are really layout changes made during phase 4.

---

## 3. Greybox conventions that save the art pass

Colour code (pick yours, but write it down in the note):

| Colour | Meaning |
|---|---|
| Medium grey | Walkable floor |
| Dark grey | Walls / blockers |
| Yellow | Interactables (doors, prompts, pickups) |
| Red | Hazards / damage |
| Blue | Water / swim volumes |
| Green | Spawn and safe zones |
| Purple | Placeholder for a hero asset |

Use the **Kenney Prototype Kit** in the vault library for grid-textured greybox meshes if you prefer meshes to Parts (see [[Modular Kits from the Kenney FBX Library]]).

### Tag greybox so nothing ships by accident

Run in the Studio **command bar** (edit mode). It records an undo step using `ChangeHistoryService`:

```lua
-- Tag every part under Workspace.Greybox as "Greybox" (command bar, edit mode)
local CollectionService = game:GetService("CollectionService")
local ChangeHistoryService = game:GetService("ChangeHistoryService")

local recording = ChangeHistoryService:TryBeginRecording("TagGreybox")
local count = 0
for _, inst in workspace.Greybox:GetDescendants() do
	if inst:IsA("BasePart") then
		CollectionService:AddTag(inst, "Greybox")
		count += 1
	end
end
if recording then
	ChangeHistoryService:FinishRecording(recording, Enum.FinishRecordingOperation.Commit)
end
print("Tagged", count, "greybox parts")
```

Before every release build, run the audit:

```lua
local CollectionService = game:GetService("CollectionService")
local left = CollectionService:GetTagged("Greybox")
print(#left, "greybox parts still in the place")
for i = 1, math.min(#left, 20) do
	print(left[i]:GetFullName())
end
```

Add "greybox count = 0 (or only intentional)" to your [[Release Readiness Runbook 2026]].

---

## 4. Layout rules that make or break Roblox maps

- **Spawn faces the first objective.** Players who spawn facing a wall bounce in the first 60 seconds, which is a documented negative discovery signal.
- **One landmark per zone**, visible from the zone's entrance. This matters even more on mobile, where players rotate the camera less.
- **Critical path width:** at least 2–3 character widths, wider in social hubs where avatars cluster.
- **Loops, not dead ends,** for anything players revisit. Dead ends double the travel time.
- **Sightline breaks** every 150–250 studs in big outdoor maps. This helps readability and streaming, because content behind a ridge can stream out.
- **Interactable density:** cluster interactables near paths. A proximity prompt 40 studs off the path is effectively invisible on a phone.
- **Server authority on boundaries:** kill bricks and out-of-bounds checks belong on the server; the client only shows effects.

### Streaming-aware layout

If `Workspace.StreamingEnabled` is on (the default for new places), plan zones as `Model`s with an explicit `ModelStreamingMode` (`Default`, `Atomic`, `Persistent`, `PersistentPerPlayer`, `Nonatomic`):
- `Atomic` for things that must arrive whole (a puzzle, a vehicle).
- `Persistent` only for small, always-needed models; it defeats streaming if overused.
- Keep gameplay-critical server references robust to parts not being present on the client (see [[Large Maps, Streaming and World Design]]).

---

## 5. The art swap without breaking gameplay

1. **Swap per zone, not per asset type.** One zone fully finished is a better playtest than ten half-finished zones.
2. **Keep the greybox collider when possible.** For complex art meshes, set the mesh to `CanCollide = false` and keep a simple invisible collider part (the old greybox wall). This gives you exact, cheap collision.
3. Otherwise set `CollisionFidelity` deliberately: `Box` or `Hull` for props, `PreciseConvexDecomposition` only where players touch detailed shapes (see [[FBX Import Settings, Scale and Collision Fidelity]]).
4. **Turn off what you don't need:** `CanTouch = false` and `CanQuery = false` on decorative meshes reduce physics and raycast work; `CastShadow = false` on small props.
5. **Re-run the metrics gym walk** through the zone: same jumps, same door widths, same sightlines.
6. **Pathfinding check** if NPCs use `PathfindingService`; new meshes can change the walkable surface.

### Measuring art against the greybox

```lua
-- Command bar: compare a selected art model's bounding box to its greybox stand-in
local Selection = game:GetService("Selection")
local sel = Selection:Get()
for _, m in sel do
	if m:IsA("Model") then
		local size = m:GetExtentsSize()
		print(m.Name, string.format("%.1f x %.1f x %.1f studs", size.X, size.Y, size.Z))
	elseif m:IsA("BasePart") then
		print(m.Name, m.Size)
	end
end
```

---

## 6. Lighting and readability pass

- Do it **after** the art swap and **before** set dressing; props hide lighting problems.
- Check every zone at the lowest graphics quality on a phone in the Device Simulator; that is where most Roblox players will see it.
- Keep objectives readable by **value contrast** (light against dark), not just hue. Colour-blind players and small screens depend on it.
- See [[Lighting - Hub]] for technology and post-processing choices.

---

## Common mistakes
- Greyboxing at "real-world" metric sizes without a metrics gym, so everything feels off once avatars walk through it.
- Art passing before the layout is locked, then rebuilding meshes.
- Using detailed art meshes as their own colliders with `PreciseConvexDecomposition` everywhere.
- Leaving forgotten greybox parts in the shipped place (invisible blockers, z-fighting floors).
- Spawn areas that load last because they are streamed like everything else; prioritize the spawn region.
- Judging the map only on a high-end PC at max quality.
- Long dead-end corridors in a revisit-heavy game.

## Checklist
- [ ] Metrics gym built and comfortable numbers recorded
- [ ] Paper map with critical path, landmarks and sightline breaks
- [ ] Greybox colour code documented; greybox parts tagged
- [ ] Core loop playable end to end on greybox; 3+ new-player playtests done
- [ ] Layout locked and signed off before the art swap
- [ ] Art swapped per zone; colliders simplified; CanTouch/CanQuery/CastShadow reviewed
- [ ] Jumps and doors re-tested after the swap
- [ ] Lighting pass checked on low quality on a phone profile
- [ ] Greybox audit returns zero unintended parts before release

---

**Sources checked (2026-10-25):** Engine API: StarterPlayer (CharacterWalkSpeed, CharacterJumpHeight, CharacterMaxSlopeAngle), Workspace (Gravity, StreamingEnabled), ModelStreamingMode, CollisionFidelity, ChangeHistoryService; Creator Docs: Physics › Roblox units.

**Related:** [[Maps - Hub]] · [[Advanced Map Readability and Navigation]] · [[Roblox Studio Basics]] · [[Large Maps, Streaming and World Design]] · [[Buildings, Interiors and Modular Streaming]] · [[Polish Checklist]]
