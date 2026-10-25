---
title: "NoiseType"
description: "Specifies the noise algorithm used by a `Noise` instance's `NoiseType` property."
api_type: enum
aliases: ["Enum.NoiseType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/NoiseType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the noise algorithm used by a `Noise` instance's `NoiseType` property.*

## Description

Selects the procedural noise algorithm applied when sampling through a `Noise` instance. The chosen value determines which kernel `SampleDirectional()` evaluates; different values support different sampling modes. The default value of `NoiseType` is [[30 Official Roblox Docs/API Reference/Enums/NoiseType|Enum.NoiseType.SimplexGabor]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `SimplexGabor` | 0 | Uses an OpenSimplex2 body-centered cubic (BCC) lattice with a Gabor sinusoidal kernel for anisotropic directional noise sampling. |

---
*Source: [NoiseType](https://create.roblox.com/docs/reference/engine/enums/NoiseType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
