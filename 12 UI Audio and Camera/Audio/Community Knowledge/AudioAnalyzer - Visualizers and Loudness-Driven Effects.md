---
area: "12 UI Audio and Camera"
cluster: "Audio"
title: "AudioAnalyzer - Visualizers and Loudness-Driven Effects"
tags: [roblox, community-knowledge, audio, audio-api, audioanalyzer, visualizer]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/AudioAnalyzer
  - https://create.roblox.com/docs/reference/engine/enums/AudioWindowSize
  - https://create.roblox.com/docs/audio/objects
---
# AudioAnalyzer - Visualizers and Loudness-Driven Effects

Club and concert games, rhythm minigames, "speaker bass shakes the room" moments, and lights that pulse with the music all need to know how loud the audio is right now. The legacy `Sound.PlaybackLoudness` gave one number. In the new Audio API, an `AudioAnalyzer` wired into any stream gives peak and RMS level and an optional frequency spectrum, so bass and treble can drive different effects.

## What the analyzer gives you

| Member | Meaning |
|---|---|
| `RmsLevel` | Average loudness of the last audio buffer; stable, good for pulsing |
| `PeakLevel` | Loudest sample in the last buffer; spiky, good for beat flashes |
| `GetSpectrum()` | Array of RMS levels evenly spaced from 0 Hz to 24,000 Hz |
| `SpectrumEnabled` | Turn off if you only need levels; the docs say CPU cost drops dramatically |
| `WindowSize` | `Small` (low latency, coarse frequency), `Medium`, `Large` (fine frequency, more latency) |

Rules from the reference:

- All audio processing is disabled on the **server**: levels are 0 and the spectrum is empty there. Analyse on the client.
- `GetSpectrum()` returns an **empty array** if any input comes from an `AudioDeviceInput` (voice chat). You can't build voice spectrum visualizers.
- `RmsLevel` and `PeakLevel` update faster than the frame rate and don't fire Changed events. Poll them in `RenderStepped`/`Heartbeat`.

## Wiring

An analyzer only has an Input pin, so it is a side branch. It doesn't need to sit in the playback path:

```lua
local function wire(src: Instance, dst: Instance)
	local w = Instance.new("Wire")
	w.SourceInstance, w.TargetInstance = src, dst
	w.Parent = dst
end

local analyzer = Instance.new("AudioAnalyzer")
analyzer.SpectrumEnabled = true
analyzer.WindowSize = Enum.AudioWindowSize.Medium
analyzer.Parent = musicPlayer
wire(musicPlayer, analyzer)  -- branch: music also keeps its normal path to the mix
```

Analyse the music player or the music bus fader, not the master output. Otherwise footsteps and explosions also make the lights pulse.

## Turning numbers into motion

Raw levels jitter. Smooth with a fast-attack, slow-release follower so effects jump on beats and relax gently:

```lua
local RunService = game:GetService("RunService")
local level = 0
local ATTACK, RELEASE = 30, 6 -- per second

RunService.RenderStepped:Connect(function(dt)
	local target = analyzer.RmsLevel
	local rate = if target > level then ATTACK else RELEASE
	level += (target - level) * (1 - math.exp(-rate * dt))
	local pulse = math.clamp(level * 4, 0, 1) -- scale to taste after measuring your track
	speakerCone.Size = baseSize * (1 + pulse * 0.15)
	stageLight.Brightness = 1 + pulse * 4
end)
```

### Bass vs treble bands

Sum spectrum bins into bands. With N bins spread from 0 to 24,000 Hz, bin `i` (1-based) is about `(i - 1) * 24000 / N` Hz:

```lua
local function band(spectrum: { number }, lowHz: number, highHz: number): number
	local n = #spectrum
	if n == 0 then return 0 end
	local hzPerBin = 24000 / n
	local a = math.max(1, math.floor(lowHz / hzPerBin) + 1)
	local b = math.min(n, math.floor(highHz / hzPerBin) + 1)
	local sum = 0
	for i = a, b do sum += spectrum[i] end
	return sum / (b - a + 1)
end
-- bass = band(spec, 20, 150); mids = band(spec, 150, 2000); highs = band(spec, 2000, 8000)
```

Bass drives camera bounce or floor lights; highs drive sparkle particles.

## Visualizer bars

- 16-32 bars is plenty; group bins logarithmically (more bins per bar at high frequencies), since human hearing is roughly logarithmic.
- Update bar `Size` directly each frame; tweens add lag.
- Cap updates to visible UI only, and disconnect when the visualizer closes.

## Pitfalls and comfort

- Calibrate per track: measure peak RMS of your music once and normalise, or quiet songs won't animate.
- Strong light flashing synced to music can trigger photosensitivity issues. Cap flash frequency, avoid full-screen white flashes, and respect a "reduce flashing" or Reduce Motion setting.
- Don't drive gameplay from analyzer values (they differ per client buffer timing). Use them for presentation only.

## Related
[[Audio - Hub]] · [[Audio Mixing and Dynamic Music with the Audio API]] · [[Thunder, Lightning and Accessibility]] · [[Audio Framework]]
