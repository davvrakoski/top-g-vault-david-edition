---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Anim - Lip Sync Basics - Driving FaceControls from AudioAnalyzer and Text"
tags: [roblox, community-knowledge, animation, facial-animation, lip-sync, dialogue, npc]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/FaceControls
  - https://create.roblox.com/docs/reference/engine/classes/AudioAnalyzer
  - https://create.roblox.com/docs/reference/engine/classes/AudioPlayer
  - https://create.roblox.com/docs/reference/engine/classes/Wire
  - https://create.roblox.com/docs/reference/engine/classes/AudioTextToSpeech
  - https://devforum.roblox.com/t/allowing-to-control-facial-animations-outside-of-studio/4732600
  - https://developers.meta.com/horizon/documentation/unreal/audio-ovrlipsync/
---
# Anim - Lip Sync Basics - Driving FaceControls from AudioAnalyzer and Text

An NPC that talks with a frozen mouth looks like a statue with a speaker inside. Full phoneme lip sync is hard, but "jaw flap" lip sync (mouth opens with loudness, closes on silence, with a little shape variety) is cheap on Roblox and good enough at gameplay distance. You need a dynamic head (a head `MeshPart` with a `FaceControls` child) and either voiced audio or text.

## Facts that shape the design

- `FaceControls` properties (the mouth set includes `JawDrop`, `LipsTogether`, `Pucker`, `Funneler`, `LipPresser`, `LeftLipStretcher` / `RightLipStretcher`; blinks are `LeftEyeClosed` / `RightEyeClosed`, brows `LeftInnerBrowRaiser` and friends) take values from 0 to 1 and are tagged **NotReplicated**. Writes made on the server do not reach clients. Drive faces in a **LocalScript**, per client.
- `AudioAnalyzer.RmsLevel` and `PeakLevel` report loudness of whatever is wired into the analyzer. They are **always 0 on the server**, which matches the client-only plan.
- `AudioPlayer:GetWaveformAsync(timeRange, samples)` reads loudness of an asset ahead of time without playing it, if you prefer precomputed curves.
- A July 2026 DevForum feature request says runtime control of NPC faces is still limited compared with body joints, without naming the exact limit. Test script-driven `FaceControls` in a **published live server**, not only in Studio, before you build a dialogue system on it. (unverified for your setup)

## Method 1: loudness-driven jaw (voiced lines)

Wire the voice: `AudioPlayer` -> `AudioEmitter` (on the NPC head, so it is 3D) and the same `AudioPlayer` -> `AudioAnalyzer`. A `Wire` connects them with `SourceInstance` and `TargetInstance`.

```lua
-- LocalScript. npcHead has FaceControls; player is the NPC's AudioPlayer.
local face = npcHead:FindFirstChildWhichIsA("FaceControls")
local analyzer = Instance.new("AudioAnalyzer")
analyzer.Parent = npcHead
local wire = Instance.new("Wire")
wire.SourceInstance = player
wire.TargetInstance = analyzer
wire.Parent = analyzer

local jaw = 0
RunService.RenderStepped:Connect(function(dt)
	if not face then return end
	local level = analyzer.RmsLevel            -- roughly 0..1
	local target = math.clamp((level - 0.02) * 6, 0, 0.7) -- gate + gain + cap
	-- open fast, close a bit slower
	local speed = target > jaw and 25 or 12
	jaw += (target - jaw) * math.min(1, dt * speed)
	face.JawDrop = jaw
	face.LipsTogether = jaw < 0.05 and 0.4 or 0 -- closed lips on silence
end)
```

Tune the gate (ignore breath noise), gain and cap per voice actor. Capping `JawDrop` near 0.6-0.7 avoids the "yawning" look.

## Method 2: text-driven flap (no audio, or TTS)

For typewriter dialogue or `AudioTextToSpeech`, drive the mouth from characters as they appear:

- Vowels (`a`, `e`, `i`, `o`, `u`) open the jaw (`a`/`o` wide, `e`/`i` small).
- `o`, `u`, `w` add `Pucker` / `Funneler`.
- `m`, `b`, `p` close with `LipsTogether`.
- Spaces and punctuation close the mouth; `.`, `!`, `?` hold closed a little longer.

Step through the visible text at the same rate as your typewriter (`MaxVisibleGraphemes`), so the mouth stops exactly when text stops. This is the classic "viseme" idea used by engines with real lip sync (Meta's Oculus Lipsync maps speech to a fixed set of 15 visemes) reduced to a handful of shapes.

## Make it look alive

- **Blink and eye darts** on a random timer (2-5 s) during dialogue.
- **Brow lift** on question marks and exclamations.
- **Head nod**: a tiny upper-body/head additive track at low weight while speaking.
- **Distance LOD**: skip lip sync for NPCs more than about 30-40 studs away or off screen.

## Pitfalls

- A playing facial **animation** on the same head can overwrite script writes each frame; stop it, or test which wins.
- Classic (decal) faces have no `FaceControls`: fall back to swapping face decals or showing a speech bubble.
- Players with dynamic heads: do not drive another player's face without a reason; it reads as puppeting.

## Related
[[Animation - Hub]] · [[Dynamic Heads for Game Developers - FACS, FaceControls and Moods]] · [[AudioAnalyzer - Visualizers and Loudness-Driven Effects]] · [[Rich Text and Typewriter Dialogue - MaxVisibleGraphemes]]
