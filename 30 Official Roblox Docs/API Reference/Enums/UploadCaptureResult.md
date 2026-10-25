---
title: "UploadCaptureResult"
description: "Describes the outcome of a `CaptureService:UploadCaptureAsync()` call."
api_type: enum
aliases: ["Enum.UploadCaptureResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/UploadCaptureResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Describes the outcome of a [[30 Official Roblox Docs/API Reference/Classes/CaptureService#UploadCaptureAsync|CaptureService:UploadCaptureAsync()]] call.*

## Description

Represents the result of uploading a capture to the asset system.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 0 | The capture was successfully uploaded and registered as an asset. |
| `NeedPermission` | 1 | The experience has not been granted developer gallery read and upload permission, so the capture cannot be uploaded. |
| `CaptureModerated` | 2 | The capture was rejected by Roblox content moderation and cannot be uploaded. |
| `CaptureNotInGallery` | 3 | The capture no longer exists in the user's gallery and cannot be uploaded. |
| `IneligibleCapture` | 4 | The capture is not eligible for upload to this experience, either because it is a permanent system capture or the experience permissions grant was rejected. |
| `UploadQuotaReached` | 5 | The user has reached their daily capture upload quota and the upload was not completed. |
| `UploadPending` | 6 | The upload is still in progress and the asset has not yet been assigned an ID; poll [[30 Official Roblox Docs/API Reference/Classes/CaptureService#CheckUploadCaptureStatusAsync\|CaptureService:CheckUploadCaptureStatusAsync()]] again to check for completion. |
| `UploadFailed` | 7 | The upload completed but a backend processing error occurred, so the capture was not saved as an asset. |

---
*Source: [UploadCaptureResult](https://create.roblox.com/docs/reference/engine/enums/UploadCaptureResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
