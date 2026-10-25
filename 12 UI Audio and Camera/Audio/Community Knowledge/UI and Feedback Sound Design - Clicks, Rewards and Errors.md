---
area: "12 UI Audio and Camera"
cluster: "Audio"
title: "UI and Feedback Sound Design - Clicks, Rewards and Errors"
tags: [roblox, community-knowledge, audio, ui-sound, game-feel, feedback]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/SoundService
  - https://create.roblox.com/docs/reference/engine/classes/Sound
  - https://create.roblox.com/docs/sound/groups
  - https://create.roblox.com/docs/audio/objects
---
# UI and Feedback Sound Design - Clicks, Rewards and Errors

Players judge a game's polish within seconds, and much of that judgement is sound: a soft tick on hover, a solid click on confirm, a rising chime when coins land. UI sounds also carry information (success, failure, rarity) faster than text. The usual Roblox mistakes are the opposite: no UI sounds at all, one loud click for everything, or reward sounds that stack into a wall of noise when 30 coins pop at once.

## A small, consistent sound vocabulary

| Event | Character | Length | Notes |
|---|---|---|---|
| Hover / selection move | Very soft tick | < 50 ms | Quiet enough to hear 20 times a minute |
| Click / confirm | Short, mid-pitched, solid | 50-120 ms | Same family as hover, louder |
| Back / close | Lower pitch than confirm | 50-120 ms | "Going down" feel |
| Error / not enough money | Dull, low, two-note down | 150-250 ms | Never harsh; players hit it often |
| Purchase success | Bright, rising | 300-600 ms | Should feel worth the Robux |
| Currency tick | Tiny, high | < 80 ms | Pitch steps up as a counter runs |
| Rare drop / level up | Layered sting | 1-2 s | Rarer = longer and fuller |
| Notification / toast | Gentle two-tone | 200-300 ms | Distinct from errors |

Pick one sonic family (wooden, metallic, synth, magical) that matches the game's style and stick to it.

## Playing UI sounds locally

UI sounds are client-only and non-spatial.

- **Legacy Sound:** keep templates in `SoundService` (not in a 3D part) assigned to a `UI` SoundGroup, and call `SoundService:PlayLocalSound(sound)`. The docs say it plays a local copy heard only by that client and keeps volume, playback speed and SoundGroup effects (but not `Looped`).
- **Audio API:** an `AudioPlayer` wired to a UI `AudioFader` bus and then to the `AudioDeviceOutput`, with no emitter, so it isn't positioned in 3D.

Either way, route UI through its own bus so players can turn it down in settings.

## Variation and stacking control

```lua
local SoundService = game:GetService("SoundService")
local lastPlayed: { [string]: number } = {}

local function playUI(name: string, minGap: number?, pitchJitter: number?)
	local now = os.clock()
	if lastPlayed[name] and now - lastPlayed[name] < (minGap or 0.03) then
		return -- rate limit: avoid 30 overlapping copies in one frame
	end
	lastPlayed[name] = now
	local template = SoundService.UISounds[name]
	local base = template:GetAttribute("BaseSpeed") or 1
	local jitter = pitchJitter or 0.04
	template.PlaybackSpeed = base * (1 + (math.random() * 2 - 1) * jitter)
	SoundService:PlayLocalSound(template)
end
```

- Small random pitch (2-5%) keeps repeated clicks from sounding robotic.
- A **minimum gap** per sound (30-60 ms) stops coin bursts from clipping.
- For counters, **step the pitch up** each tick (for example +1 semitone, about x1.059, per tick up to an octave) and reset after a pause. This is the classic "satisfying" collection sound.

## Mixing rules

- UI bus about -6 to -10 dB under gameplay effects by default; players notice loud UI before anything else.
- Reward stings may briefly duck music (see sidechain ducking in the Audio API deep dive) but should not duck gameplay-critical sounds in combat.
- Avoid very high frequencies (> 8 kHz) in frequent sounds; they are tiring on phone speakers and earbuds.
- Check on a phone speaker: bass-only "thumps" disappear there.

## Accessibility

- Never use sound as the only feedback; every sound has a visual partner (flash, shake, icon).
- Keep a separate UI volume slider, and remember some players play muted. Errors must read visually too.
- Don't use sudden loud stingers for common events; save intensity for rare moments.

## Checklist

- [ ] One sound family; 6-8 core UI sounds cover 90% of interactions
- [ ] All UI sounds on a UI bus or SoundGroup with its own slider
- [ ] Pitch jitter and per-sound rate limit in one helper
- [ ] Reward ladder: common < rare < legendary in length and richness
- [ ] Tested on phone speakers and with sound off

## Related
[[Audio - Hub]] · [[Audio Mixing Playbook]] · [[Audio Mixing and Dynamic Music with the Audio API]] · [[TweenService UI Animation Recipes]] · [[Free SFX Generators - ChipTone and jsfxr]]
