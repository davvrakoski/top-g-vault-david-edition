---
title: "Wire"
description: "Connects one or more `Instances` to form a processing graph of their streams. At the moment, only audio streams are supported, but this may expand in the future."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Wire"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Connects one or more [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] to form a processing graph of their streams. At the moment, only audio streams are supported, but this may expand in the future.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

[[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] connects one or more [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] to form a processing graph of their streams. Each [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] connects a source and target instance, and a source and target "pin" within each of those instances. Pins are string identifiers that select which stream is to be carried by the wire.

At the moment, only audio streams are supported, but this may expand in the future.

The following instances may be connected by [[30 Official Roblox Docs/API Reference/Classes/Wire|Wires]]:

- [[30 Official Roblox Docs/API Reference/Classes/AudioAnalyzer|AudioAnalyzer]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioChannelMixer|AudioChannelMixer]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioChannelSplitter|AudioChannelSplitter]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioChorus|AudioChorus]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor|AudioCompressor]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceInput|AudioDeviceInput]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput|AudioDeviceOutput]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioDistortion|AudioDistortion]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioEcho|AudioEcho]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioEqualizer|AudioEqualizer]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioFader|AudioFader]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioFilter|AudioFilter]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioFlanger|AudioFlanger]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioGate|AudioGate]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioLimiter|AudioLimiter]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioPitchShifter|AudioPitchShifter]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioRecorder|AudioRecorder]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioReverb|AudioReverb]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioSpeechToText|AudioSpeechToText]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioTextToSpeech|AudioTextToSpeech]]
- [[30 Official Roblox Docs/API Reference/Classes/AudioTremolo|AudioTremolo]]
- [[30 Official Roblox Docs/API Reference/Classes/VideoPlayer|VideoPlayer]]
- [[30 Official Roblox Docs/API Reference/Classes/VideoDisplay|VideoDisplay]]

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Wire#Connected\|Connected]] | boolean | Denotes whether the [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] is carrying a stream of data. |
| [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|SourceInstance]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] producing a stream to be carried over the wire. |
| [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName\|SourceName]] | string | The name of the pin on [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|SourceInstance]] that is producing a stream. |
| [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|TargetInstance]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] to receive a stream from [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance\|SourceInstance]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName\|TargetName]] | string | The name of the pin on [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance\|TargetInstance]] that is receiving a stream. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Connected

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Connections · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

Denotes whether the [[30 Official Roblox Docs/API Reference/Classes/Wire|Wire]] is connected, meaning its [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|SourceInstance]], [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|TargetInstance]], [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|SourceName]], and [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|TargetName]] properties are all assigned, the corresponding [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceName|SourceName]] and [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetName|TargetName]] pins exist on [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|SourceInstance]] and [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|TargetInstance]] respectively, and the connection does not result in a cyclic processing graph.

### SourceInstance

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Connections · **Loaded/Saved:** true/true · **Capabilities:** Basic

The [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] producing a stream to be carried over the wire. At the moment, only audio streams are wirable.

### SourceName

**Type:** string

**Thread safety:** ReadSafe · **Category:** Connections · **Loaded/Saved:** true/true · **Capabilities:** Basic

The name of the pin on [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|SourceInstance]] that is producing a stream. At the moment, various audio instances only have an **Output** pin, but this may expand in the future. The default value of this property is **Output** so it is not yet necessary to change.

### TargetInstance

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Connections · **Loaded/Saved:** true/true · **Capabilities:** Basic

The [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] intended to receive a stream from [[30 Official Roblox Docs/API Reference/Classes/Wire#SourceInstance|SourceInstance]]. Currently, only audio streams are wirable.

### TargetName

**Type:** string

**Thread safety:** ReadSafe · **Category:** Connections · **Loaded/Saved:** true/true · **Capabilities:** Basic

The name of the pin on [[30 Official Roblox Docs/API Reference/Classes/Wire#TargetInstance|TargetInstance]] that is receiving a stream. At the moment, audio instances typically have an **Input** pin, but [[30 Official Roblox Docs/API Reference/Classes/AudioCompressor|AudioCompressor]] has an additional **Sidechain** pin. This may expand in the future.

---
*Source: [Wire](https://create.roblox.com/docs/reference/engine/classes/Wire) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
