---
title: "CreateContentResult"
description: "Indicates the result of a `AssetService:CreateDataModelContentAsync()` call."
api_type: enum
aliases: ["Enum.CreateContentResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/CreateContentResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the result of a [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateDataModelContentAsync|AssetService:CreateDataModelContentAsync()]] call.*

## Description

Returned as the first value in the tuple from [[30 Official Roblox Docs/API Reference/Classes/AssetService#CreateDataModelContentAsync|AssetService:CreateDataModelContentAsync()]], which creates a `DataModel`-scoped runtime content object at runtime. A value of [[30 Official Roblox Docs/API Reference/Enums/CreateContentResult|Success]] means the content was created and stored successfully; any other value describes why the operation failed.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Success` | 1 | The content object was created and stored successfully. |
| `PermissionDenied` | 2 | The user does not have the required permissions to perform this operation. |
| `UploadFailed` | 3 | Asset failed to upload. |
| `StorageLimitExceeded` | 4 | The storage budget limit for [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]]-scoped content was exceeded. |
| `Unknown` | 5 | An unknown error occurred. |

---
*Source: [CreateContentResult](https://create.roblox.com/docs/reference/engine/enums/CreateContentResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
