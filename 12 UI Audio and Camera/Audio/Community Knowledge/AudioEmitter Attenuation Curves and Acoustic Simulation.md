---
area: "12 UI Audio and Camera"
cluster: "Audio"
title: "AudioEmitter Attenuation Curves and Acoustic Simulation"
tags: [roblox, community-knowledge, audio, audio-api, 3d-audio, attenuation]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/audio/objects
  - https://create.roblox.com/docs/reference/engine/classes/AudioEmitter
  - https://create.roblox.com/docs/reference/engine/classes/AudioListener
  - https://create.roblox.com/docs/reference/engine/enums/DistanceAttenuationMode
  - https://devforum.roblox.com/t/a-simple-guide-to-the-audio-api/3132049
---
# AudioEmitter Attenuation Curves and Acoustic Simulation

In the new Audio API, a sound is positioned by wiring an `AudioPlayer` into an `AudioEmitter`; whoever has an `AudioListener` hears it based on distance, angle and (optionally) the walls between them. The defaults follow real-world inverse-square falloff, which sounds natural but often wrong for games: a zombie groan stays faintly audible across the whole map, and a shop jingle doesn't cut off at the door. Shaping the curves per sound category is the single biggest step from "noisy" to "readable" 3D audio.

## The chain

```
AudioPlayer --Wire--> AudioEmitter  ~~~ (air) ~~~  AudioListener --Wire--> AudioDeviceOutput
```

- `AudioEmitter.PositionType`: `Parent` (follow the parent part/attachment) or `Instance` (follow `PositionInstance`).
- The listener usually sits on the camera (the default voice setup puts one under the current camera). Put it on the character head instead for third-person games where you want sounds placed relative to the body, not the camera.
- `AudioInteractionGroup` (string) on emitters and listeners: a listener hears an emitter only if they share a group. Use it for "radio channel" or "ghost world" sounds that only some listeners hear.

## Distance attenuation modes

`DistanceAttenuationMode` defaults to `Custom`. Other modes use `DistanceAttenuationBounds` (a NumberRange, default 4 to 10000 studs):

| Mode | Shape | Good for |
|---|---|---|
| `Custom` | Your own curve via `SetDistanceAttenuation` (inverse-square if no curve set) | Designed falloff per category |
| `Inverse` | Real-world falloff from the lower bound | Ambience, big explosions |
| `InverseTapered` | Inverse near the lower bound, tapering to silence at the upper bound | Realistic but with a hard cut-off |
| `Linear` | Straight line from min to max | UI-like world sounds, pickups |
| `LinearSquared` | Steeper falloff near the max | Footsteps, close-range detail |

## Custom curves

`SetDistanceAttenuation(curve)` takes a table of `distance -> volume (0..1)`, up to 400 points, linearly interpolated, held flat beyond the ends. The emitter curve is multiplied by the listener's own curves.

```lua
local CURVES = {
	Footstep = { [0] = 1, [8] = 0.8, [30] = 0.2, [45] = 0 },
	Gunshot  = { [0] = 1, [40] = 0.6, [200] = 0.15, [400] = 0 },
	Enemy    = { [0] = 1, [15] = 0.7, [60] = 0.15, [90] = 0 },
	Shop     = { [0] = 1, [12] = 1, [20] = 0 }, -- loud inside, gone at the door
}

local function makeEmitter(parent: Instance, category: string): AudioEmitter
	local emitter = Instance.new("AudioEmitter")
	emitter:SetDistanceAttenuation(CURVES[category])
	emitter.Parent = parent
	return emitter
end
```

Always end a curve at 0. A curve that ends at 0.05 keeps hundreds of distant emitters audible and costing mix time.

## Angle attenuation

`SetAngleAttenuation` maps angle (from the emitter's LookVector) to volume. Use it for directional sources: a loudspeaker, a car exhaust, an NPC voice that is quieter behind the speaker's back. Listeners have angle curves too, which can fake "ear" direction or a narrow focus mic.

## Acoustic simulation

`AcousticSimulationEnabled` on an emitter **and** the listener turns on occlusion (muffled through walls), diffraction (bending round corners) and reverb from surroundings. The older `SimulationFidelity` property is deprecated. Practical notes:

- Turn it on for gameplay-critical sounds (enemy footsteps, gunfire, doors) where "is it behind the wall?" matters.
- Leave it off for music, UI and wide ambience beds; it adds cost and nothing useful there.
- Test in tight interiors and big open areas; tune reverb by space with `AudioReverb` on zone buses rather than relying on simulation alone.

## Debugging

- `AudioEmitter:GetAudibilityFor(listener)` returns how audible this emitter is for that listener; print it while walking away to check your curve.
- `GetInteractingListeners()` / `GetInteractingEmitters()` show who hears whom (useful for interaction-group bugs).
- Remember audio processing is client-side; analysers and audibility queries on the server return nothing useful.

## Checklist

- [ ] Every category has its own curve ending at volume 0
- [ ] Listener placement chosen (camera vs head) and consistent
- [ ] Acoustic simulation only on gameplay-critical emitters
- [ ] Interaction groups used for special channels instead of scripting volume hacks

## Related
[[Audio - Hub]] · [[Audio Mixing and Dynamic Music with the Audio API]] · [[Audio Zones, Occlusion and Mixing]] · [[Audio Mixing Playbook]]
