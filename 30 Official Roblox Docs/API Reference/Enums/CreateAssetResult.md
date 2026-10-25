---
title: "CreateAssetResult"
description: "Indicates the outcome of a call to `AssetService:CreateAssetAsync()` or `AssetService:CreateAssetVersionAsync()`."
api_type: enum
aliases: ["Enum.CreateAssetResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CreateAssetResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the outcome of a call to [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateAssetAsync|AssetService:CreateAssetAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateAssetVersionAsync|AssetService:CreateAssetVersionAsync()]].*

## Description

[[30 Official Roblox Docs/API Reference/Enums/CreateAssetResult|Enum.CreateAssetResult]] is returned as the first element of the tuple from [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateAssetAsync|AssetService:CreateAssetAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateAssetVersionAsync|AssetService:CreateAssetVersionAsync()]]. It indicates whether the asset was created or updated successfully, or why the operation failed. On success, the second tuple element is the new asset ID (for `CreateAssetAsync`) or the new version number (for `CreateAssetVersionAsync`); on failure, the second element is a string with additional diagnostic information.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 1 | The asset was created or updated successfully. |
| `PermissionDenied` | 2 | The caller does not have permission to create or update an asset in the target inventory. |
| `UploadFailed` | 3 | The upload request to the Roblox asset service failed for a reason other than a permission error. |
| `Unknown` | 4 | An unexpected error occurred and the operation could not complete. |

---
*Source: [CreateAssetResult](https://create.roblox.com/docs/reference/engine/enums/CreateAssetResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
