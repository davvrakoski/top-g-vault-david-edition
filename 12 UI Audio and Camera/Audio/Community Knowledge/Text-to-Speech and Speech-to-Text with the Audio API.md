---
area: "12 UI Audio and Camera"
cluster: "Audio"
title: "Text-to-Speech and Speech-to-Text with the Audio API"
tags: [roblox, community-knowledge, audio, text-to-speech, speech-to-text, accessibility]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/AudioTextToSpeech
  - https://create.roblox.com/docs/reference/engine/classes/AudioSpeechToText
  - https://create.roblox.com/docs/chat/voice-chat
---
# Text-to-Speech and Speech-to-Text with the Audio API

Roblox's Audio API includes two AI audio objects: `AudioTextToSpeech` turns a string into spoken audio, and `AudioSpeechToText` turns microphone audio into text. They open up voiced NPC barks without recording sessions, a "read menus aloud" accessibility option, auto-translated narration, and voice-command minigames. Both are rate-limited per experience, so design around the budget instead of calling them for every line.

## AudioTextToSpeech

It behaves like an `AudioPlayer`: one **Output** pin you wire to an emitter (3D voice) or straight to an `AudioDeviceOutput` (narrator).

| Member | Notes |
|---|---|
| `Text` | What to say |
| `VoiceId` | Voice style; IDs come from Roblox's list of artificial voices |
| `Speed` | 0.5 to 2.0 multiplier |
| `Pitch` | -12 to +12 semitones |
| `AutoLocalize` | Translate `Text` into the player's language and route to a matching voice |
| `Volume`, `Looping`, `PlaybackSpeed`, `TimePosition` | Playback controls |
| `LoadAsync()`, `Play()`, `Pause()`, `Unload()` | Load before playing; unload when done |
| `Ended` | Chain lines or close dialogue |

```lua
local tts = Instance.new("AudioTextToSpeech")
tts.Text = "Welcome back, survivor. The gate opens at dusk."
tts.Speed = 0.95
tts.Pitch = -2
tts.AutoLocalize = true
tts.Parent = npcHead

local emitter = Instance.new("AudioEmitter")
emitter.Parent = npcHead
local w = Instance.new("Wire")
w.SourceInstance, w.TargetInstance = tts, emitter
w.Parent = emitter

tts:LoadAsync()
tts:Play()
tts.Ended:Wait()
tts:Unload()
```

### Throttles (from the API reference)

- Per experience: `1 + 6 x concurrent users` requests per minute.
- Per user, client-side: 4 requests per second.
- Extra usage can be bought through Extended Services.

A 20-player server gets about 121 requests a minute. Fine for dialogue, not fine for reading every kill-feed entry.

### Use it well

- **Cache by text.** Fixed lines (tutorial, shop greetings) should reuse one loaded instance instead of new requests every time.
- **Barks, not essays.** Short NPC reactions ("Over here!", "Reloading!") work best.
- **Always show subtitles.** TTS is an addition, never the only channel. Pair with your caption system.
- **Accessibility narrator:** an opt-in setting that reads the focused button's text when gamepad selection changes (`GuiService.SelectedObject` changed). Debounce so fast scrolling doesn't burn the budget.
- **Localization:** `AutoLocalize` translates automatically; check important lines with real speakers, and keep proper nouns consistent with your translation table.

## AudioSpeechToText

One **Input** pin. Wire a player's `AudioDeviceInput` into it and read `Text` as recognition updates; `VoiceDetected` says whether speech is present; `Enabled` turns it on and off.

- Throttle: `1 + 5 x concurrent users` requests per minute per experience.
- The voice chat docs say **Voice Chat must be enabled** in the experience to use speech-to-text, so it only works for voice-eligible players.

Good uses: shouting a spell name, a "say the password" door, accessibility voice commands. Rules:

- Provide a button or key alternative for every voice command. Many players can't or won't use a mic.
- Match loosely (lowercase, strip punctuation, accept synonyms); recognition is not exact.
- Process on the client, send the **intent** ("cast fireball") to the server, and validate it there like any other input.
- Text produced from players' speech that other players will see still needs normal text filtering.

## Pitfalls

- Calling `Play()` before `LoadAsync()` finishes, causing silence on slow connections.
- Leaving many loaded TTS instances around; `Unload()` when finished.
- Building gameplay that depends on precise speech recognition.

## Related
[[Audio - Hub]] · [[Dialogue, Voice, Subtitles and Ducking]] · [[Voice Chat with the Audio API - Teams, Radios and Effects]] · [[Accessibility Localization - Hub]]
