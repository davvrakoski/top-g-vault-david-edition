---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Char - Animation Capture - Face and Body from Video"
tags: [roblox, community-knowledge, animation, mocap, animation-capture, studio]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/animation/capture
  - https://create.roblox.com/docs/animation/editor
  - https://create.roblox.com/docs/art/characters/facial-animation/animate-heads
---
# Char - Animation Capture - Face and Body from Video

Roblox Studio's **Animation Capture** turns video into keyframes inside the Animation Editor, with no mocap suit and no external tool. For small teams this is the fastest route to believable emotes, cutscene acting, NPC idles and reaction clips. It is not a replacement for hand-keyed combat animation, but it is an excellent first pass you then clean up.

## Two tools

| Tool | Input | Limit (docs, Oct 2026) | Target rig |
|---|---|---|---|
| **Animation Capture - Face** | Live webcam | Up to 60 s per recording | Rigs with an animation-compatible (FACS) head |
| **Animation Capture - Body** (menu item **Live Animation Creator**) | Uploaded `.mp4` or `.mov` | Under 15 s, one continuous shot | R15 rigs |

The docs list both behind **File > Beta Features**, so check that toggle first if the buttons are missing.

## Face capture workflow

1. Avatar tab > **Clip Editor** (opens the Animation Editor). Select a rig with a dynamic head, name the clip, **Create**.
2. In the track list click **Face Capture**, accept the camera consent prompt, pick a camera if you have several.
3. Press the red record button, act, stop. Keyframes for the face controls appear on the timeline.
4. Use **Re-Record** freely; takes are cheap.

Tips: even front light, face centred and close, plain background. Exaggerate slightly: game cameras are far away and small expressions vanish.

## Body capture workflow

1. Open the Clip Editor on an R15 rig and create a clip.
2. In the media/playback controls click **...** > **Import** > **Live Animation Creator** > **Choose Video**.
3. After roughly a minute, body keyframes land on the timeline.

Recording rules that decide quality:
- **One person**, fully in frame head to toe the whole time, well lit.
- **Locked-off camera** (tripod or propped phone), single continuous shot, under 15 s.
- Tight-ish clothing that shows knees and elbows; avoid long coats and dresses that hide joints.
- Side-on or three-quarter view for moves with depth (lunges); front view for waves and emotes.

## Cleanup pass (budget 10-20 minutes per clip)

- **Foot slide and floor contact:** captured feet drift. Key the feet flat on contact frames, or add IK foot planting in game.
- **Root motion:** the capture may move the root across the floor. For gameplay loops make it in-place (see [[Root Motion on Roblox - Faking It with In-Place Clips]]).
- **Jitter:** delete every second key on noisy joints, then smooth the curves.
- **Loops:** match first and last pose if the clip will loop (idles).
- **Priority and markers:** set `Priority` and add markers (`Footstep`, `Hit`) before publishing.

## When to use it

Good fit: emotes, idle variations, cutscene acting, NPC talk gestures, lip and brow reactions. Poor fit: fast combat swings (motion blur breaks tracking), anything with the hands near the body, non-human rigs. Retargeting the result to a custom non-R15 rig is not supported directly; export and retarget in Blender instead.

## Related
[[Animation - Hub]] · [[Dynamic Heads for Game Developers - FACS, FaceControls and Moods]] · [[Root Motion on Roblox - Faking It with In-Place Clips]] · [[Custom Emotes in Your Game - Own Wheel, PlayEmoteAsync and Validation]]
