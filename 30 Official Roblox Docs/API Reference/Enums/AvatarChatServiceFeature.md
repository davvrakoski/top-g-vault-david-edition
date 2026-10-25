---
title: "AvatarChatServiceFeature"
description: "A bitmask enum whose items represent individual avatar chat capabilities for voice and video communication within an experience."
api_type: enum
aliases: ["Enum.AvatarChatServiceFeature"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AvatarChatServiceFeature"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*A bitmask enum whose items represent individual avatar chat capabilities for voice and video communication within an experience.*

## Description

A bitmask enum whose items represent individual avatar chat capabilities for voice and video communication within an experience. Each item is a single bit flag; multiple flags are combined with bitwise-OR to form a feature mask that `IsEnabled()` can test. Flags fall into three categories: universe/place settings (set by the server based on creator configuration), user eligibility and opt-in state (resolved per-player from backend permissions), and moderation status.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `None` | 0 | No avatar chat features are enabled. This is the default value of the bitmask before any capabilities are resolved. |
| `UniverseAudio` | 1 | Voice chat audio is enabled at the universe level. This is a server-side setting configured by the experience creator; it must be combined with [[30 Official Roblox Docs/API Reference/Enums/AvatarChatServiceFeature\|Enum.AvatarChatServiceFeature.PlaceAudio]] for audio to be active in a given place. |
| `UniverseVideo` | 2 | Avatar video (camera-based facial animation) is enabled at the universe level. This is a server-side setting configured by the experience creator; it must be combined with [[30 Official Roblox Docs/API Reference/Enums/AvatarChatServiceFeature\|Enum.AvatarChatServiceFeature.PlaceVideo]] for video to be active in a given place. |
| `PlaceAudio` | 4 | Voice chat audio is enabled for the current place. Both this flag and [[30 Official Roblox Docs/API Reference/Enums/AvatarChatServiceFeature\|Enum.AvatarChatServiceFeature.UniverseAudio]] must be set for audio to be active in the place. |
| `PlaceVideo` | 8 | Avatar video (camera-based facial animation) is enabled for the current place. Both this flag and [[30 Official Roblox Docs/API Reference/Enums/AvatarChatServiceFeature\|Enum.AvatarChatServiceFeature.UniverseVideo]] must be set for video to be active in the place. |
| `UserAudioEligible` | 16 | The user meets the requirements to use voice chat audio (age-verified, not banned, etc.). Eligibility is resolved per-player from backend permissions; it does not imply the user has opted in (see [[30 Official Roblox Docs/API Reference/Enums/AvatarChatServiceFeature\|Enum.AvatarChatServiceFeature.UserAudio]]). |
| `UserAudio` | 32 | The user has opted in to voice chat audio. This flag is only meaningful when [[30 Official Roblox Docs/API Reference/Enums/AvatarChatServiceFeature\|Enum.AvatarChatServiceFeature.UserAudioEligible]] is also set; together they indicate the user both can and has chosen to use voice. |
| `UserVideoEligible` | 64 | The user meets the requirements to use avatar video (camera-based facial animation). Eligibility is resolved per-player from backend permissions; it does not imply the user has opted in (see [[30 Official Roblox Docs/API Reference/Enums/AvatarChatServiceFeature\|Enum.AvatarChatServiceFeature.UserVideo]]). |
| `UserVideo` | 128 | The user has opted in to avatar video (camera-based facial animation). This flag is only meaningful when [[30 Official Roblox Docs/API Reference/Enums/AvatarChatServiceFeature\|Enum.AvatarChatServiceFeature.UserVideoEligible]] is also set; together they indicate the user both can and has chosen to use video. |
| `UserBanned` | 256 | The user is currently banned from avatar chat features. When this flag is present in the client features mask, voice and video capabilities are unavailable to the player regardless of other eligibility flags. |
| `UserVerifiedForVoice` | 512 | The user has completed voice verification. |

---
*Source: [AvatarChatServiceFeature](https://create.roblox.com/docs/reference/engine/enums/AvatarChatServiceFeature) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
