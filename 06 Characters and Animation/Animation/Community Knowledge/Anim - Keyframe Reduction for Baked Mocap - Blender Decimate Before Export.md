---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Keyframe Reduction for Baked Mocap - Blender Decimate Before Export"
tags: [roblox, community-knowledge, animation, blender, mocap, keyframes, pipeline]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://docs.blender.org/manual/en/4.0/editors/graph_editor/fcurves/editing.html
  - https://create.roblox.com/docs/animation/editor
  - https://create.roblox.com/docs/reference/engine/classes/KeyframeSequence
  - https://create.roblox.com/docs/reference/engine/classes/CurveAnimation
---
# Anim - Keyframe Reduction for Baked Mocap - Blender Decimate Before Export

Mocap, video capture and retargeted clips arrive with a key on **every frame for every bone**. They play fine, but they are miserable to edit in the Roblox Animation Editor: moving one arm means dragging 60 keys, a timing change means re-baking, and the dope sheet is a solid wall. Reducing keys before export turns a capture into something you can actually polish. This note is the Blender side of that step; the settings that must stay fixed at export are in the import-settings note.

## When to reduce, when not to

| Clip | Reduce? | Why |
|---|---|---|
| Mocap / video capture you will edit by hand | Yes | Editability is the whole point |
| Long ambient loops (crowd walk, idle) | Yes, gently | Easier to fix loop seams |
| Fast combat hits, impacts | Carefully | Reduction smooths sharp snaps unless you lock contact keys |
| Already hand-keyed clips | No | They are already sparse |

## Workflow in Blender

1. **Resample first.** Set the scene to 30 fps and bake the action (Pose > Animation > Bake Action, every frame, visual keying). Reducing a 120 Hz take wastes time.
2. **Open the Graph Editor**, select the armature, show only the bones you want to reduce.
3. **Key > Density > Decimate.** Blender offers two modes:
   - **Ratio**: removes a set percentage of keys (the `Remove` value). Quick, but blind to where detail is.
   - **Allowed Change / Error Margin**: removes keys as long as the curve stays within `Max Error Margin` of the original. Prefer this one: it keeps keys where motion is busy and drops them where it is smooth.
4. **Go channel group by channel group.** Torso and hips tolerate a larger error than hands and feet. Start small (for example 0.001-0.005 for rotations) and raise it until you see drift, then step back.
5. **Protect contacts.** Before decimating feet and the weapon hand, note the contact frames (foot plant, hit frame). After decimating, re-insert keys on those frames if they moved; a foot that drifts 1 cm in Blender becomes visible sliding in game.
6. **Clean the extremes.** The Clean Keyframes / Clean Channels operators in the Graph Editor's Key menu (inside Density in Blender 4.x) remove redundant flat keys; run it on channels that should be still (for example a hand holding a pose).
7. **Compare.** Keep the original action, duplicate it, decimate the copy, and scrub both side by side or overlay with a ghost/onion view.

## Export

Export the reduced action with your normal Roblox FBX settings. Roblox's documented setup uses the exporter's **Simplify** at 0: do your reduction deliberately with Decimate, not with the exporter's automatic simplify, so you control what is lost.

## After import into Roblox

- The Animation Editor imports the keys you exported. A reduced clip shows a readable dope sheet you can retime by dragging keyframes.
- If you need hand-tuned curves on a few joints, the Curve Editor works on the reduced keys, and saving can produce a `CurveAnimation` instead of a `KeyframeSequence` (see the export paths note).
- Re-check loop seams: decimation can remove the last-frame key that matched frame 0. Copy the first pose onto the last frame of a loop.

## Rough targets

For a 1 s, 30 fps walk loop, a clean hand-editable result usually keeps a key every 2-5 frames on the body and more on the feet. Treat this as a feel guide, not a rule (unverified as a measured standard).

## Pitfalls

- Decimating before retargeting: errors multiply through the retarget. Retarget, bake, then reduce.
- One global error margin for everything: feet slide and hands float. Reduce per bone group.
- Reducing an additive or overlay clip until it is flat: low-amplitude motion (breathing) disappears first; use a smaller margin there.

## Related
[[Animation - Hub]] · [[Mocap Cleanup for Roblox - In-Place, Loops and Foot Slide]] · [[Clip Editor Import Settings - August 2026 Update]] · [[KeyframeSequence vs CurveAnimation - Export Paths]]
