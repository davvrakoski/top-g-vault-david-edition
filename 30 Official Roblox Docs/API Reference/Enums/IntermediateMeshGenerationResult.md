---
title: "IntermediateMeshGenerationResult"
description: "Indicates the type of result delivered via the intermediate-result callback during an asynchronous mesh-generation operation."
api_type: enum
aliases: ["Enum.IntermediateMeshGenerationResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/IntermediateMeshGenerationResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the type of result delivered via the intermediate-result callback during an asynchronous mesh-generation operation.*

## Description

`IntermediateMeshGenerationResult` is returned as the first argument to the optional intermediate-result callback supplied to [[30 Official Roblox Docs/API Reference/Classes/GenerationService#GenerateMeshAsync|GenerateMeshAsync()]]. When the backend finishes producing an intermediate version of the mesh before the final result is ready, the callback fires with a value from this enum together with a `generationId` string and a `contextId` string. The only current member is [[30 Official Roblox Docs/API Reference/Enums/IntermediateMeshGenerationResult|Enum.IntermediateMeshGenerationResult.HighQualityMesh]].

`GenerateMeshAsync` and `InternalGenerateMeshAsync` are deprecated; new code should use [[30 Official Roblox Docs/API Reference/Classes/GenerationService#GenerateModelAsync|GenerateModelAsync()]], which returns the generated `Model` directly to the calling coroutine and does not use this enum.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `HighQualityMesh` | 0 | Signals that the intermediate mesh delivered to the callback is high-quality. |

---
*Source: [IntermediateMeshGenerationResult](https://create.roblox.com/docs/reference/engine/enums/IntermediateMeshGenerationResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
