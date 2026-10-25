---
title: "VideoCapture"
description: "A child class of `Capture` for videos."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/VideoCapture"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A child class of [[30 Official Roblox Docs/API Reference/Classes/Capture|Capture]] for videos.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Capture|Capture]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

A child class of [[30 Official Roblox Docs/API Reference/Classes/Capture|Capture]] for videos.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/VideoCapture#FilePath\|FilePath]] | string | Requires `RobloxScript` security. The local file system path to the recorded video file. |
| [[30 Official Roblox Docs/API Reference/Classes/VideoCapture#TimeLength\|TimeLength]] | double | The length of the recorded video, in seconds. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Capture|Capture]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### FilePath

**Type:** string

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Capture · **Tags:** `ReadOnly`, `NotReplicated`

Requires `RobloxScript` security; experience scripts cannot read it even when they hold the [[30 Official Roblox Docs/API Reference/Classes/VideoCapture|VideoCapture]] object. Absolute path on the user's device to the video file this capture represents: the temporary file while recording is in progress, or, after [[30 Official Roblox Docs/API Reference/Classes/CaptureService#PromptSaveCapturesToGallery|PromptSaveCapturesToGallery()]], the permanent gallery location. Defaults to an empty string until a recording has produced a video file.

### TimeLength

**Type:** double

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Capture · **Tags:** `ReadOnly`, `NotReplicated`

Duration of the video capture, in seconds. Populated once recording finishes, whether via [[30 Official Roblox Docs/API Reference/Classes/CaptureService#StopVideoCapture|StopVideoCapture()]] or because the capture's time limit was reached. Defaults to `0` until recording has finished.

---
*Source: [VideoCapture](https://create.roblox.com/docs/reference/engine/classes/VideoCapture) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
