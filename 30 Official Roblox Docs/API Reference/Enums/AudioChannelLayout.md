---
title: "AudioChannelLayout"
description: "Describes the channel layout of an audio stream."
api_type: enum
aliases: ["Enum.AudioChannelLayout"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AudioChannelLayout"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the channel layout of an audio stream.*

## Description

The `AudioChannelLayout` enum describes the channel layout of an audio stream. Audio streams contain one or more channels that are intended to be rendered simultaneously with a particular arrangement of speakers. In general, more channels impact performance but provide higher spatial quality.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Mono` | 0 | Monaural audio streams contain only one **Center** channel.<br><br>*(image in the full Top G Vault)* |
| `Stereo` | 1 | Stereophonic audio streams consist of two channels: **Left** and **Right**.<br><br>*(image in the full Top G Vault)* |
| `Quad` | 2 | Quadrophonic audio streams consist of four channels: **Left**, **Right**, **BackLeft**, and **BackRight**. Quadrophonic streams can encode forward/backward spatial information that stereo streams might struggle with.<br><br>*(image in the full Top G Vault)* |
| `Surround_5` | 3 | Surround sound audio streams consist of five channels: **Left**, **Right**, **Center**, **BackLeft**, and **BackRight**. Surround sound streams encode spatial information with better resolution front and center.<br><br>*(image in the full Top G Vault)* |
| `Surround_5_1` | 4 | 5.1 surround sound consists of six channels: **Left**, **Right**, **Center**, **BackLeft**, **BackRight**, and a **Sub** (subsonic) low‑frequency channel. 5.1 surround sound benefits from low frequencies being less directional in order to encode higher resolution spatial information versus simple 5‑channel surround sound.<br><br>*(image in the full Top G Vault)* |
| `Surround_7_1` | 5 | 7.1 surround sound consists of eight channels: **Left**, **Right**, **Center**, **SurroundLeft**, **SurroundRight**, **BackLeft**, **BackRight**, and a **Sub** (subsonic) low‑frequency channel. 7.1 surround sound is an improvement over 5.1 surround sound, offering better spatial resolution directly to the left and right as well.<br><br>*(image in the full Top G Vault)* |
| `Surround_7_1_4` | 6 | 7.1.4 surround sound consists of twelve channels: **Left**, **Right**, **Center**, **SurroundLeft**, **SurroundRight**, **BackLeft**, **BackRight**, **Sub**, **TopLeft**, **TopRight**, **TopBackLeft**, and **TopBackRight**. 7.1.4 is the only currently supported channel layout that encodes height information.<br><br>*(image in the full Top G Vault)* |

---
*Source: [AudioChannelLayout](https://create.roblox.com/docs/reference/engine/enums/AudioChannelLayout) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
