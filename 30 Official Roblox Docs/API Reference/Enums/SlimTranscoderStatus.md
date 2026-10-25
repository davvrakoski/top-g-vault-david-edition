---
title: "SlimTranscoderStatus"
description: "Describes the backend transcoding state of a SLIM model, from upload through transcoding to success or failure."
api_type: enum
aliases: ["Enum.SlimTranscoderStatus"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SlimTranscoderStatus"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the backend transcoding state of a SLIM model, from upload through transcoding to success or failure.*

## Description

Describes the backend transcoding state of a SLIM model. The status progresses as the model is uploaded to the content-delivery network and transcoded into SLIM assets. The **DebugVisualizations** panel in the Developer Console can color-code models by this status to surface which models have successfully transcoded and which have failed.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Unknown` | 0 | The transcoding status has not yet been determined. This is the initial state before the model has been queried. Shown as yellow in the debug tint overlay. |
| `Transcoding` | 1 | SLIM transcoding is currently in progress on the backend. The model is expected to transition to Succeeded or Failed once transcoding completes. Shown as blue in the debug tint overlay. |
| `Succeeded` | 2 | Transcoding completed successfully and the SLIM assets are available for streaming. Shown as green in the debug tint overlay. |
| `Failed` | 3 | Transcoding did not complete successfully. Shown as red in the debug tint overlay. |

---
*Source: [SlimTranscoderStatus](https://create.roblox.com/docs/reference/engine/enums/SlimTranscoderStatus) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
