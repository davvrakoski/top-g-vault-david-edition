---
title: "FACSDataLod"
description: "Specifies the level of detail for FACS blendshape data transmitted by the face tracking system."
api_type: enum
aliases: ["Enum.FACSDataLod"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/FACSDataLod"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the level of detail for FACS blendshape data transmitted by the face tracking system.*

## Description

`FACSDataLod` controls how many FACS (Facial Action Coding System) blendshape weights the face tracking system transmits and processes. Higher LOD numbers transmit fewer controls, reducing network and CPU cost at the expense of facial animation fidelity. The active LOD is selected automatically at runtime based on performance.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `LOD0` | 0 | Full-fidelity FACS data transmitting all 50 blendshape controls. |
| `LOD1` | 1 | Reduced FACS data transmitting 6 blendshape controls: JawDrop, RightEyeClosed, LeftEyeClosed, RightLipCornerPuller, LeftLipCornerPuller, and Pucker. |
| `LODCount` | 2 | Sentinel value equal to the total number of FACSDataLod levels; not a valid LOD to assign. |

---
*Source: [FACSDataLod](https://create.roblox.com/docs/reference/engine/enums/FACSDataLod) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
