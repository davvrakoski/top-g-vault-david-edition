---
title: "Capture"
description: "A class which defines a piece of content, such as a screenshot or video, taken in-experience."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Capture"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A class which defines a piece of content, such as a screenshot or video, taken in-experience.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/ScreenshotCapture|ScreenshotCapture]], [[30 Official Roblox Docs/API Reference/Classes/VideoCapture|VideoCapture]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

Represents a single piece of content — a screenshot or a video — captured within an experience. A [[30 Official Roblox Docs/API Reference/Classes/Capture|Capture]] records metadata about that content, including when it was taken ([[30 Official Roblox Docs/API Reference/Classes/Capture#CaptureTime|Capture.CaptureTime]]), what kind of content it is ([[30 Official Roblox Docs/API Reference/Classes/Capture#CaptureType|Capture.CaptureType]]), the place and experience it originated from ([[30 Official Roblox Docs/API Reference/Classes/Capture#SourcePlaceId|Capture.SourcePlaceId]] and [[30 Official Roblox Docs/API Reference/Classes/Capture#SourceUniverseId|Capture.SourceUniverseId]]), and where its underlying file is stored ([[30 Official Roblox Docs/API Reference/Classes/Capture#LocalId|Capture.LocalId]] and [[30 Official Roblox Docs/API Reference/Classes/Capture#FilePathString|Capture.FilePathString]]).

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Capture#CaptureTime\|CaptureTime]] | [[30 Official Roblox Docs/API Reference/Datatypes/DateTime\|DateTime]] | The date and time at which the capture was taken. |
| [[30 Official Roblox Docs/API Reference/Classes/Capture#CaptureType\|CaptureType]] | [[30 Official Roblox Docs/API Reference/Enums/CaptureType\|CaptureType]] | Indicates whether the capture is a screenshot or a video. |
| [[30 Official Roblox Docs/API Reference/Classes/Capture#FilePathString\|FilePathString]] | string | The local filesystem path to the capture's file, as a string. |
| [[30 Official Roblox Docs/API Reference/Classes/Capture#LocalId\|LocalId]] | string | A temporary local identifier for the capture's stored file. |
| [[30 Official Roblox Docs/API Reference/Classes/Capture#SourcePlaceId\|SourcePlaceId]] | int64 | The ID of the place in which the capture was taken. |
| [[30 Official Roblox Docs/API Reference/Classes/Capture#SourceUniverseId\|SourceUniverseId]] | int64 | The ID of the experience in which the capture was taken. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CaptureTime

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/DateTime|DateTime]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Capture · **Tags:** `ReadOnly`, `NotReplicated`

The date and time at which the capture was taken, as a [[30 Official Roblox Docs/API Reference/Datatypes/DateTime|DateTime]]. It defaults to the moment the [[30 Official Roblox Docs/API Reference/Classes/Capture|Capture]] is created. This property is read-only.

### CaptureType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/CaptureType|CaptureType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Capture · **Tags:** `ReadOnly`, `NotReplicated`

Indicates the kind of content the capture holds, as an [[30 Official Roblox Docs/API Reference/Enums/CaptureType|Enum.CaptureType]] value. Defaults to [[30 Official Roblox Docs/API Reference/Enums/CaptureType|Enum.CaptureType.Screenshot]]. This property is read-only.

### FilePathString

**Type:** string

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Capture · **Tags:** `ReadOnly`, `NotReplicated`

The path to the capture's file on the local filesystem, returned as a string. It resolves to the file backing the capture in local capture storage, or an empty string when no file is associated with the capture. This property is read-only.

### LocalId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Capture · **Tags:** `ReadOnly`, `NotReplicated`

A local identifier for the capture's stored file, in the form `rbxtemp://<key>`. It is empty until the capture has been saved to local capture storage, after which it references the stored file by key. This property is read-only.

### SourcePlaceId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Capture · **Tags:** `ReadOnly`, `NotReplicated`

The [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId|PlaceId]] of the place in which the capture was taken. Defaults to `0` when the source place is unknown or unset. This property is read-only.

### SourceUniverseId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** Capture · **Tags:** `ReadOnly`, `NotReplicated`

The universe (experience) ID of the experience in which the capture was taken. Defaults to `0` when the source universe is unknown or unset. This property is read-only.

---
*Source: [Capture](https://create.roblox.com/docs/reference/engine/classes/Capture) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
