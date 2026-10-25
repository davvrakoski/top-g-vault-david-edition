---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Voice Chat Rules for Developers"
tags: [roblox, community-knowledge, publishing, policy, voice-chat, audio-api, safety]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/chat/voice-chat
  - https://en.help.roblox.com/hc/en-us/articles/4405807645972-Voice-FAQ
  - https://en.help.roblox.com/hc/en-us/articles/47660909519764-Voice-chat-with-friends-and-unfiltered-texting
  - https://create.roblox.com/docs/reference/engine/classes/VoiceChatService
---
# Voice Chat Rules for Developers

> Not legal advice. Summary of the Creator Hub "Voice Chat" page and the Help Center "Voice FAQ" (edited 2026-05-12), checked 2026-10-25.

Voice makes social and co-op games feel alive, but it is the most age-gated feature on Roblox. You do not control who may speak; Roblox does. What you control is whether voice is on, how it is routed (proximity, team, global), and how your game behaves for the many players who cannot use it.

## Who can use voice

- Users **13+ who completed an age check** (facial estimation or ID), in a published list of countries; elsewhere, ID verification is needed.
- They talk with **similar age groups**. Cross-age voice needs trusted-friend status, and adults can add teens as trusted friends only through real-life methods (phone contacts, live QR code).
- Under-13 users never get voice or "chat with fewer filters".
- Voice is available on desktop, mobile, VR, PlayStation and Xbox.

## Platform limits you must design around

- Voice works only in places with **max players 100 or fewer**. A place set above 100 cannot have voice; old servers with higher caps need a restart after you change it.
- It is **on by default** for new games with 100 or fewer players. Toggle it in Studio: **File > Experience Settings > Communication > Enable Voice Chat**, then publish.
- To turn voice off in one place of a multi-place game, insert `VoiceChatService` and disable `EnableDefaultVoice`, publish and restart servers. Do not abuse a >100 max-players setting to kill voice.
- Speech-to-text APIs require voice to be enabled.

## Routing voice with the Audio API

With `VoiceChatService.UseAudioApi` set to Enabled, each speaker is an `AudioDeviceInput` you can wire through `AudioFader`, `AudioEmitter` and `Wire` objects:

- **Proximity** (default) volumes by distance.
- **Team-only** voice: set the device's `AccessType` to `Enum.AccessModifierType.Allow` and call `SetUserIdAccessList` with teammates' UserIds whenever teams change.
- **Global** voice: wire every device to one shared fader and output; strip the player's own wire on their client so they do not hear themselves.

These routing changes are allowed; what is not allowed is building a side channel that lets ineligible users hear or speak.

## Safety features you inherit

Players can mute (per session), block (stops voice and text), and file Report Abuse with a "Voice Chat" reason. Roblox uses voice data for safety and moderation, may record (a red dot on the mic shows recording), and says it does not use voice data for advertising.

## Design rules of thumb

1. Never make voice **required** to play. Most players cannot use it; give pings, quick chat or emotes.
2. If your game is essentially "talk to strangers", it is a **social hangout** for the questionnaire (16+, or 18+ with private spaces).
3. Show a clear voice indicator in custom HUDs so players know who is live.
4. Check `VoiceChatService:IsVoiceEnabledForUserIdAsync(userId)` (in `pcall`) before showing voice-only UI.
5. Do not record, store or forward voice audio yourself; that would be personal data with no Roblox safeguards.

## Related
[[Publishing Release - Hub]] · [[Policy - Text Chat Compliance - TextChatService, Rate Limits and Privacy Checks]] · [[Text Chat, Moderation and Player Safety]] · [[Voice Chat]]
