---
area: "12 UI Audio and Camera"
cluster: "Audio"
title: "Voice Chat with the Audio API - Teams, Radios and Effects"
tags: [roblox, community-knowledge, audio, voice-chat, audio-api, social]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/chat/voice-chat
  - https://create.roblox.com/docs/reference/engine/classes/VoiceChatService
  - https://create.roblox.com/docs/reference/engine/classes/AudioDeviceInput
  - https://create.roblox.com/docs/reference/engine/enums/VoiceChatDistanceAttenuationType
  - https://devforum.roblox.com/t/a-simple-guide-to-the-audio-api/3132049
  - https://devforum.roblox.com/t/voice-chat-callingradios/3878438
  - https://devforum.roblox.com/t/test-voice-chat-in-studio/2441552
---
# Voice Chat with the Audio API - Teams, Radios and Effects

Voice chat is a strong retention feature for social, horror and squad games, and with `VoiceChatService.UseAudioApi` enabled, each player's microphone becomes an ordinary audio source you can route, filter and restrict. That enables team-only voice, walkie-talkies with static, monster voices, and megaphones, all without custom networking. It also carries responsibility: you decide who hears whom, so mistakes can leak voice to the wrong players.

## Who can use it

From the voice chat docs: voice is available to age-verified 13+ users in supported countries, only in places with a **max of 100 players**, and is on by default for new eligible games (File > Experience Settings > Communication). Design voice as an extra, never required: many players can't use it.

## The default setup with UseAudioApi

When `UseAudioApi` is enabled and `EnableDefaultVoice` is on, Roblox creates for you:

- an `AudioDeviceInput` per voice-eligible player (parented to the Player),
- an `AudioEmitter` in each voice-eligible character,
- an `AudioListener` under the current camera.

`VoiceChatService.DefaultDistanceAttenuation` picks the curve for those generated emitters: `Inverse` (inverse-square, same as a plain AudioEmitter) or `Legacy` (linear-squared from 7 to 80 studs, the old proximity voice behaviour). Turn `EnableDefaultVoice` off to build everything yourself; `AudioDeviceInput` still works.

## AudioDeviceInput controls

| Member | Use |
|---|---|
| `Player` | Whose microphone this is |
| `Muted` | Server-side mute (e.g. dead players, spectators) |
| `Volume` | Per-speaker gain |
| `AccessType` + `SetUserIdAccessList` | Allow-list or deny-list of user IDs who can hear this mic |
| `Active` | Whether the device is currently streaming |

The docs say `AccessType` should be set **from the server** so it replicates.

## Pattern 1: team-only voice

The official sample: on team change, set the speaker's `AccessType = Allow` and pass teammates' UserIds to `SetUserIdAccessList`. Re-run it when anyone joins or leaves a team, and on `PlayerRemoving`. Combine with proximity (keep the emitter) for "nearby teammates only", or use non-spatial wiring for squad radio.

## Pattern 2: walkie-talkie / phone call

Keep normal proximity voice, and add a second path for players holding a radio:

```
AudioDeviceInput (speaker) --> AudioFilter (FilterType Highpass24dB, Frequency ~300)
   --> AudioFilter (FilterType Lowpass24dB, Frequency ~3400) --> AudioDistortion (Level 0.2)
   --> AudioFader --> Wire --> listener's AudioDeviceOutput (non-spatial)
```

- Build the chain on the **listening client** for each other radio holder, wiring that speaker's `AudioDeviceInput` into the filters and on to the local `AudioDeviceOutput`.
- The band-pass range (roughly 300 to 3400 Hz) is the classic "telephone" band; tune by ear.
- Add a short static `AudioPlayer` burst on press/release for the radio feel.
- When the radio is put away, `Destroy()` the chain; don't just set volume to 0.

DevForum threads on radios and wall speakers report this kind of routing works but is easy to get wrong (wires pointing at the wrong pins, chains built on the server where audio processing doesn't run). Test with two real accounts.

## Pattern 3: voice effects

- **Monster / possessed:** `AudioPitchShifter` down, plus `AudioReverb`.
- **Cave or hall:** route voices through a zone reverb bus.
- **Muffled behind doors:** enable `AcousticSimulationEnabled` on the voice emitters and the listener.

Keep effects readable. Heavy distortion makes speech unintelligible and frustrates players.

## Safety and UX checklist

- [ ] Voice never required to progress
- [ ] Server sets access lists and mutes; clients only decide local effects
- [ ] Dead / spectator players can't speak to the living if that breaks the game (`Muted` or access lists)
- [ ] Visual "speaking" indicator for accessibility (an `AudioAnalyzer` level on the client is the usual idea; note that `GetSpectrum()` is blocked for voice inputs, and whether `RmsLevel` reads voice is not stated in the docs, so test it (unverified))
- [ ] Player-facing toggle to disable voice effects
- [ ] Tested with real voice-enabled accounts; Studio voice testing still goes through moderation, per a DevForum thread

## Related
[[Audio - Hub]] · [[AudioEmitter Attenuation Curves and Acoustic Simulation]] · [[Dialogue, Voice, Subtitles and Ducking]] · [[Audio Mixing and Dynamic Music with the Audio API]]
