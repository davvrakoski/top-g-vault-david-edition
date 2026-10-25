---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Animation Graph Editor vs Scripted Tracks - Choosing Your Animation Logic"
tags: [roblox, community-knowledge, animation, graph-editor, state-machine, architecture]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/animation/graph-editor
  - https://create.roblox.com/docs/animation/graph-editor-state-machine
  - https://create.roblox.com/docs/animation/expressions
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/reference/engine/classes/Animator
---
# Animation Graph Editor vs Scripted Tracks - Choosing Your Animation Logic

Until recently every Roblox game built its animation logic in Luau: load tracks, play and stop them, adjust weights by speed. Studio now has an **Animation Graph Editor** (Avatar tab > Graph Editor): a node-based tool that builds blend trees and state machines into a published `AnimationGraphDefinition` asset, loaded onto an `Animator` like a normal animation and driven by parameters. This note helps you decide which approach a project should use, and how to mix them. Details are from the official Graph Editor pages read on 2026-10-25; the feature is new, so re-check the docs for changes.

## How the graph is driven

```lua
local graph = Instance.new("Animation")
graph.AnimationId = "rbxassetid://<published graph id>"
local track = animator:LoadAnimation(graph)
track:Play()
RunService.PreAnimation:Connect(function()
	track:SetParameter("speed", root.AssemblyLinearVelocity.Magnitude)
end)
```

- Parameters are read back with `AnimationTrack:GetParameter()`; defaults via `GetParameterDefaults()`.
- Replication is automatic. With `Workspace.AuthorityMode` set to `Automatic`, the owning client calls `SetParameter` and the values replicate (several calls in one frame are coalesced, last write wins). With `Server` authority, the server simulates the graph, and for player characters you set parameters from both server and client scripts.
- NPC graphs are driven from the server.
- During Studio testing, a `PreviewInStudio` option loads the unpublished graph so you can iterate without publishing.

## Decision table

| Situation | Prefer |
| --- | --- |
| Locomotion blend by speed and direction (idle/walk/run/strafe) | **Graph**: blend nodes replace a page of weight math |
| Animators iterate on feel without a scripter | **Graph** |
| You must debug "what is playing and why" visually | **Graph** (the editor shows live state) |
| Combat combos with server-validated timing tables | **Scripted tracks** (logic must live with the hit code) |
| Very many NPCs with only 2-3 clips each | **Scripted tracks** (simplest, cheapest to reason about) |
| Existing game with a working Animate script | Keep scripted; migrate locomotion only if it is causing bugs |
| Shared logic across custom rigs | Either; pair with Adaptive Animation for rig remapping |

## A good hybrid

Use the **graph for locomotion and idle layers** (the part that is pure blending), and keep **one-shot actions as scripted tracks** at `Action` priority on top. This mirrors how many engines split a locomotion state machine from montage-style actions. Your combat code keeps full control of attack start, cancel and markers, while locomotion stops being hand-tuned weight code.

## Migration checklist (from the default Animate script)

- [ ] List every state the old script handled (idle, walk, run, jump, fall, climb, swim, sit, tool hold)
- [ ] Rebuild the blends in the graph; expose `speed`, `grounded`, `climbing`, `swimming` as parameters
- [ ] Replace the Animate script with one that only sets parameters each frame
- [ ] Keep emotes and tool actions as separate tracks; verify priorities still win
- [ ] Test with animator LOD (distant players) and on R6 if supported
- [ ] Publish the graph asset under the same owner as the game (user or group)

## Pitfalls

- Parameter names are strings; a typo just does nothing. Keep names in one shared constants module.
- Setting a parameter every frame from several scripts creates last-write-wins confusion; one owner script per character.
- Treat the feature as young: keep a fallback branch until it has run in a live game for a while.

## Related
[[Animation - Hub]] · [[Animator Priorities, Weights and Blending Done Right]] · [[Directional Locomotion Blending - Strafe, Speed-Matched Gaits]] · [[Character Animation Framework]]
