---
title: "AudioFilterType"
description: "Filter types used for `AudioFilter` instances."
api_type: enum
aliases: ["Enum.AudioFilterType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AudioFilterType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Filter types used for [[30 Official Roblox Docs/API Reference/Classes/AudioFilter|AudioFilter]] instances.*

## Description

Families of curves that [[30 Official Roblox Docs/API Reference/Classes/AudioFilter|AudioFilter]] can use to process incoming audio. Each filter type is applied at a specified [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency|Frequency]] and may be shaped by additional [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Gain|Gain]] or [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Q|Q]] parameters.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Peak` | 0 | Filter that boosts or reduces sound near a specified [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency\|Frequency]]. |
| `LowShelf` | 1 | Filter that boosts or reduces sound below a specified [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency\|Frequency]]. |
| `HighShelf` | 2 | Filter that boosts or reduces sound above a specified [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency\|Frequency]]. |
| `Lowpass12dB` | 3 | Filter that cuts sound above a specified [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency\|Frequency]], at a slope of -12dB/octave. |
| `Lowpass24dB` | 4 | Filter that cuts sound above a specified [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency\|Frequency]], at a slope of -24dB/octave. |
| `Lowpass48dB` | 5 | Filter that cuts sound above a specified [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency\|Frequency]], at a slope of -48dB/octave. |
| `Highpass12dB` | 6 | Filter that cuts sound below a specified [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency\|Frequency]], at a slope of -12dB/octave. |
| `Highpass24dB` | 7 | Filter that cuts sound below a specified [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency\|Frequency]], at a slope of -24dB/octave. |
| `Highpass48dB` | 8 | Filter that cuts sound below a specified [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency\|Frequency]], at a slope of -48dB/octave. |
| `Bandpass` | 9 | Filter that only allows sound near a specified [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency\|Frequency]] to be heard. |
| `Notch` | 10 | Filter that cuts sound near a specified [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency\|Frequency]]. |
| `Lowpass6dB` | 11 | Filter that cuts sound above a specified [[30 Official Roblox Docs/API Reference/Classes/AudioFilter#Frequency\|Frequency]], at a slope of -6dB/octave. |

---
*Source: [AudioFilterType](https://create.roblox.com/docs/reference/engine/enums/AudioFilterType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
