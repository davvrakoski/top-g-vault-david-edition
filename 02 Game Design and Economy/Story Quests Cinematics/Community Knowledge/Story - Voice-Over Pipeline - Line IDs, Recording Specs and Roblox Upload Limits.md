---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Voice-Over Pipeline - Line IDs, Recording Specs and Roblox Upload Limits"
tags: [roblox, community-knowledge, story, voice-over, audio, dialogue, pipeline]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/audio/assets
  - https://handbook.tesrskywind.com/sound/va-mixing/editorial
  - https://voiceactor.com/audio-file-labeling
  - https://create.roblox.com/docs/reference/engine/classes/AudioTextToSpeech
---
# Voice-Over Pipeline - Line IDs, Recording Specs and Roblox Upload Limits

Voiced lines make a Roblox story feel expensive, help young and non-English readers, and let players keep their eyes on the monster instead of a text box. They also create a pile of files that must stay matched to text, subtitles and translations through every rewrite. Most small-team VO problems are **bookkeeping**, not acting: a line edited after recording, a take uploaded twice, a file too loud next to the others. This note is a pipeline from script to in-game playback. Speech features of the Audio API (text-to-speech, speech-to-text) are covered in [[Text-to-Speech and Speech-to-Text with the Audio API]].

## 1. Every line gets a permanent ID

Before anyone records, number the script. Voice-acting guides recommend naming each take after its line number with fixed-width numbers so files sort correctly. For games, make the ID structured:

`CH1_MARA_014` = chapter, speaker, line number. Alternate takes: `CH1_MARA_014_B`.

The same ID is the **localization key** for the subtitle and the key in your dialogue data ([[Dialogue Trees as Data - Nodes, Conditions and Effects]]). One ID ties text, audio, subtitle and translation together. If a line's meaning changes, give it a **new** ID so the old recording cannot play with the new text.

## 2. A script sheet actors can use

Columns: ID, speaker, line, **context** (what just happened), **direction** (whispered, panicked), **max length** in seconds if it must fit a cutscene, and status (written / recorded / uploaded / in game). Context matters more than direction: "she just saw her brother taken" gets a better read than "sad".

## 3. Recording and delivery specs

The Skywind project's open VA mixing handbook gives a sensible delivery standard to borrow:

- **16-bit, 44.1 kHz, mono WAV** masters;
- **true peak no higher than -1.0 dBFS**;
- average loudness around **-20 LUFS** (about +/-1 dB), with shouts allowed up to about -16 and whispers down to about -22;
- cleanup of plosives, clicks, mouth noise and hum before compression.

What matters most is **consistency**: every line should feel equally loud in game. Measure LUFS on every file (free meters exist; any DAW loudness meter works). Record all lines for one character in one session where possible so the mic, room and voice match.

## 4. Roblox upload rules

From the Roblox audio assets docs:

- Each file must be **under 20 MB and under 7 minutes**.
- Import limits: **100 audio assets per 30 days** for unverified accounts, **2,000 per 30 days** for ID-verified accounts. A 300-line script will not fit an unverified account's monthly quota.
- Uploads go to **moderation** first and show only in your Creator Dashboard until approved.
- Imported audio is **private** by default; grant use to your experience (or upload under the group that owns the game).

Practical consequences:

- **Bundle short barks** into one file per character and play one slice at a time with the `PlaybackRegion` property (a `NumberRange` in seconds, on both `Sound` and `AudioPlayer`; a `Sound` also needs `PlaybackRegionsEnabled = true`). Fewer uploads, fewer moderation waits.
- Keep a spreadsheet column for the **asset ID** of each line.
- Only upload audio you have the rights to. Get written permission from every voice actor, including friends.

## 5. Placeholder voice

Use text-to-speech or your own scratch reads to test timing before final casting. The Audio API includes `AudioTextToSpeech`; replace placeholders by ID when real takes arrive.

## 6. Playback in game

- Look up audio by line ID; if no asset exists yet, show the subtitle with no audio (never block).
- **Ducking:** lower music and ambience 4-8 dB while a voice plays (a compressor sidechain or a `SoundGroup` volume tween). See [[Dialogue, Voice, Subtitles and Ducking]].
- **2D or 3D?** Story narration and radio voices: 2D. A character standing in the room: 3D on the character's head so position reads.
- **Subtitles on by default**, timed from the audio length plus 0.3-0.5 s ([[Subtitles and Captions - Readable Defaults for Roblox]]).
- **Preload** the next few lines with `ContentProvider:PreloadAsync` so the first word is not late.

## 7. Localized voice (only if you must)

Full dubbing multiplies every cost above by the number of languages. Most Roblox games voice one language and subtitle the rest. If you dub, key the asset IDs by locale (`CH1_MARA_014.es`) and fall back to the original language audio plus subtitles when a locale is missing.

## Checklist

- [ ] Line IDs fixed before recording.
- [ ] Context column filled for every line.
- [ ] All files measured to the same loudness target.
- [ ] Upload quota checked against line count.
- [ ] Missing audio never blocks dialogue.

## Related
[[Story Quests Cinematics - Hub]] · [[Dialogue and Cutscene Blueprint]] · [[Dialogue, Voice, Subtitles and Ducking]] · [[Text-to-Speech and Speech-to-Text with the Audio API]]
