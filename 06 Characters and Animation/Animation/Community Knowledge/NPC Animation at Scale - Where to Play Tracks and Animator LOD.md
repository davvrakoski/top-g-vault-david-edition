---
area: "06 Characters and Animation"
cluster: "Animation"
title: "NPC Animation at Scale - Where to Play Tracks and Animator LOD"
tags: [roblox, community-knowledge, animation, npc, performance, replication]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Animator
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/enums/ClientAnimatorThrottlingMode
  - https://create.roblox.com/docs/animation/using
---
# NPC Animation at Scale - Where to Play Tracks and Animator LOD

Wave shooters, zombie games and tower defense games can have 50-200 animated rigs alive at once. Animation is often the hidden cost: every `Animator` evaluates its tracks every frame on every client that can see it. Getting the "who plays the track" rule right, and letting the engine's animator LOD do its job, is the difference between a stable 60 FPS and a slideshow on phones.

## Rule 1: who plays the animation

| Rig | Play tracks on | Why |
| --- | --- | --- |
| Player character | That player's client | The `Animator` under a player's `Humanoid` replicates tracks played by its owner to everyone. |
| Server NPC (simple) | Server | Tracks played on the server's `Animator` replicate to all clients automatically. |
| Many NPCs / crowd | Each client, locally | Server sends only state ("walking", "attacking at t"), each client plays its own tracks. Zero animation replication traffic. |

The client-driven option is the scalable one: the server owns position and state (an attribute such as `State = "Attack"`), and a client-side controller listens with `GetAttributeChangedSignal` and plays the matching track. Hit timing must stay on the server (a timing table, not markers) because clients can be out of sync.

## Rule 2: load once, reuse forever

`Animator:LoadAnimation()` per NPC per state on spawn, cached in a table. Never call it inside an attack function: the docs warn that every call creates a **new** track; use `Animator:GetTrackByAnimationId()` if you need to find one that was already loaded. Also note that an `Animator` created on the client never replicates its tracks, and the `Animator` must be in the Workspace before `LoadAnimation` works. For pooled NPCs, keep the rig (and its loaded tracks) and just reposition it; loading tracks is one of the costs pooling saves.

## Rule 3: let animator LOD work

The engine can lower evaluation frequency for **remotely simulated** characters based on distance, screen coverage and frame budget:

- `Animator.PreferLodEnabled` (default `true`): per-animator opt-out. Set it to `false` only for a boss or a cutscene actor that must stay smooth.
- `Workspace.ClientAnimatorThrottling` (`Enum.ClientAnimatorThrottlingMode`: `Default`, `Disabled`, `Enabled`): place-wide switch.
- `Animator.EvaluationThrottled` (read-only): `true` on frames where the pose was reused. Procedural scripts should skip their offsets on those frames.

Disabling LOD on many animators "can impact performance" in Roblox's own words, so do it per hero, not globally.

## Rule 4: cull your own extras

The engine throttles evaluation, but it does not stop your scripts. For NPCs far away or behind the camera:

- Stop looping idle variations and procedural look-at code beyond ~120 studs.
- Pause footstep sounds and VFX markers beyond hearing range.
- Use fewer tracks per rig: one locomotion track at a time plus at most one action track.

## Rule 5: simpler rigs for crowds

- An `AnimationController` + `Animator` on a non-Humanoid model avoids Humanoid state-machine cost for background NPCs that do not need physics movement.
- A skinned mesh with 15-20 bones is cheaper than a 15-part R15 assembly with many MeshParts and accessories. Each accessory is another part to move every frame.
- Strip accessories and layered clothing from crowd NPCs; layered clothing deformation is per-character work.

## Measuring

Use the MicroProfiler (Ctrl+F6) on a low-end device or emulator. Look at animation-related labels in the frame while 100 NPCs are on screen, then again with half. If cost scales linearly, LOD is not kicking in (check `PreferLodEnabled` and the workspace setting).

## Checklist

- [ ] Crowd NPC tracks played client-side from server state
- [ ] Tracks loaded once and cached
- [ ] `PreferLodEnabled` left on except for heroes
- [ ] Custom procedural code distance-culled and throttle-aware
- [ ] Crowd rigs without accessories

## Related
[[Animation - Hub]] · [[Animator Priorities, Weights and Blending Done Right]] · [[Procedural Lean and Torso Twist with Motor6D.Transform]] · [[Texture Memory and Triangle Budgets for Roblox Scenes]]
