---
title: "DistanceAttenuationMode"
description: "Determines how an `AudioEmitter` attenuates (fades out) as the distance between the `AudioEmitter` and an interacting `AudioListener` increases."
api_type: enum
aliases: ["Enum.DistanceAttenuationMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DistanceAttenuationMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Determines how an [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] attenuates (fades out) as the distance between the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] and an interacting [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] increases.*

## Description

Determines how an [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] attenuates (fades out) as the distance between the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] and an interacting [[30 Official Roblox Docs/API Reference/Classes/AudioListener|AudioListener]] increases. Most values refer to a preset rolloff curve that the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter|AudioEmitter]] will apply over the range given by [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationBounds|DistanceAttenuationBounds]]. When set to [[30 Official Roblox Docs/API Reference/Enums/DistanceAttenuationMode|Enum.DistanceAttenuationMode.Custom]], the emitter instead uses a developer-supplied curve given by [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#SetDistanceAttenuation|AudioEmitter:SetDistanceAttenuation()]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Custom` | 0 | Uses the developer-supplied [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuation\|DistanceAttenuation]] curve for gain rolloff. |
| `InverseTapered` | 1 | Volume attenuates according to a hybrid model which follows the [[30 Official Roblox Docs/API Reference/Enums/DistanceAttenuationMode\|Enum.DistanceAttenuationMode.Inverse]] model when close to the lower bound of [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationBounds\|AudioEmitter.DistanceAttenuationBounds]] and the [[30 Official Roblox Docs/API Reference/Enums/DistanceAttenuationMode\|Enum.DistanceAttenuationMode.LinearSquared]] model when close to the upper bound of [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationBounds\|AudioEmitter.DistanceAttenuationBounds]]. This is done by taking the lesser of these two curves, such that the curve mostly follows an inverse relationship but tapers to silence at the maximum distance. |
| `Linear` | 2 | Volume attenuates between the bounds of [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationBounds\|AudioEmitter.DistanceAttenuationBounds]] with a linear relationship. This is done by computing (`maxDistance` - `distance`) / (`maxDistance` - `minDistance`), where distance is the [[30 Official Roblox Docs/API Reference/Datatypes/Vector3#Magnitude\|Vector3.Magnitude]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]]'s position and the [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]]'s position. |
| `LinearSquared` | 3 | Volume attenuates between the bounds of [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationBounds\|AudioEmitter.DistanceAttenuationBounds]] with a linear-squared relationship. This is done by squaring the formula used to determine the volume when using [[30 Official Roblox Docs/API Reference/Enums/DistanceAttenuationMode\|Enum.DistanceAttenuationMode.Linear]], which creates a parabolic curve with a steeper fade. |
| `Inverse` | 4 | Volume attenuates from the lower bound of [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter#DistanceAttenuationBounds\|AudioEmitter.DistanceAttenuationBounds]] in an inverse manner, mirroring how sounds attenuate in the real world. This is done by computing (`minDistance`/`distance`), where `distance` is the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2#Magnitude\|Vector2.Magnitude]] between the [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]]'s position and the [[30 Official Roblox Docs/API Reference/Classes/AudioListener\|AudioListener]]'s position. |

---
*Source: [DistanceAttenuationMode](https://create.roblox.com/docs/reference/engine/enums/DistanceAttenuationMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
