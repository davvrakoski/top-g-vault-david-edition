---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Car Radios and Horns - Synced Stations, Spatial Audio and Spam Limits"
tags: [roblox, community-knowledge, vehicles, audio, radio, horn]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/audio/assets
  - https://create.roblox.com/docs/audio/objects
  - https://create.roblox.com/docs/reference/engine/classes/AudioPlayer
  - https://create.roblox.com/docs/reference/engine/classes/AudioEmitter
  - https://create.roblox.com/docs/reference/engine/classes/Sound
  - https://devforum.roblox.com/t/help-on-making-a-car-radio/919563
---
# Ride - Car Radios and Horns - Synced Stations, Spatial Audio and Spam Limits

A radio turns a car into a social space, and a horn is the most-used button in any roleplay city. Both are also the fastest way to annoy everyone on the server. Build them so the music is **in the car** (spatial, quiet from outside), stations are **synced** (everyone in the car hears the same second), and horns are **rate limited** and mutable.

## What can be played
The audio assets docs: imported audio starts private to the uploader, and the asset privacy system lets you grant use to specific experiences. Free audio from the Creator Store is the other source. In practice:
- Ship a fixed list of **stations** made of audio your experience is allowed to use. Do not let players paste any audio ID; private or unlicensed IDs fail to play, and a free-text ID box invites rule-breaking content.
- Store stations as data: `{name = "Lo-fi", tracks = {asset ids...}, lengths = {...}}`.

## Spatial setup (new Audio API)
Per car (build the objects once, from a client script for each listener, or in the car model; the server only stores the station choice as an attribute such as `RadioStation`):
1. `AudioPlayer` (with `Asset` set to the track, `Looping` false) parented to the car.
2. `AudioEmitter` parented to a part near the dashboard.
3. A `Wire` with `SourceInstance = player`, `TargetInstance = emitter`.
4. Players hear it through their `AudioListener` (camera or character, set by `ListenerLocation` in SoundService for the default setup).

Use the emitter's distance attenuation (`SetDistanceAttenuation`) so the radio is clear inside and fades out by about 30-40 studs. Insert an `AudioEqualizer` between player and emitter and drop the high band (`HighGain`) for listeners outside the car to fake "music through the windows" (switch the curve on the client by whether the local player is seated in that car).

With the legacy `Sound` object the same idea is `RollOffMinDistance` and `RollOffMaxDistance` on a Sound inside a part.

## Station sync
A station is a timeline, not a play button. Everyone computes the same position:
```lua
local function stationPosition(station, now)
	local total = 0
	for _, len in station.lengths do total += len end
	local t = (now - station.epoch) % total
	for i, len in station.lengths do
		if t < len then return i, t end
		t -= len
	end
end
-- client: index, offset = stationPosition(st, workspace:GetServerTimeNow())
-- set AudioPlayer.Asset, TimePosition = offset, then Play()
```
Switching stations in one car then sounds like real radio: you join mid-song. Play radio audio from the client side of each listener for nearby cars only, which saves server work and avoids replication lag.

## Horns
- Horn is a short looped sound while held (or a single honk on press). Pitch varies per vehicle class.
- Server rate limit: max about 5 honk starts per 10 s per player; extra presses are ignored.
- Max hold 3 s, then auto-stop.
- NPC traffic and pedestrians can react to horns (move aside, look), which makes the horn useful, not just noise.

## Player settings (important)
- "Other cars' radios" volume slider and a "mute horns" toggle in settings. Store per player.
- Passengers hear the driver's station by default; each listener can still mute it locally.

## Pitfalls
- Server-side `Sound:Play()` on hundreds of cars floods replication; drive radio playback on clients from the station state.
- Forgetting to stop the radio when the car despawns or the driver leaves.
- No surprise loud audio: clamp `Volume` and normalise tracks.

## Related
[[Vehicles - Hub]] - [[Engine and Tyre Audio Driven by RPM and Slip]] - [[Voice Chat with the Audio API - Teams, Radios and Effects]] - [[Racing - Car Meets and Cruising Social Design]]
