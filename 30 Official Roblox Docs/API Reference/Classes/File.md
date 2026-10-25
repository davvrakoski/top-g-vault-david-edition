---
title: "File"
description: "An asset loaded from a file on disk."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/File"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An asset loaded from a file on disk.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

An object that represents an asset loaded from a file on a local disk. Files generate a temporary asset ID in the form `rbxtemp://` which can be used in Studio without uploading the asset, but will be destroyed when the [[30 Official Roblox Docs/API Reference/Classes/File|File]] is destroyed or when the Studio session ends. Temporary asset IDs are not shared across [[30 Official Roblox Docs/Projects/Collaboration|collaborative]] sessions.

The default [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Name]] of a [[30 Official Roblox Docs/API Reference/Classes/File|File]] instance will be the filename on disk, excluding the path but including the extension.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/File#Size\|Size]] | int64 | The size of the file on disk, in bytes. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/File#GetBinaryContents\|GetBinaryContents()]] | string | Reads the contents of the [[30 Official Roblox Docs/API Reference/Classes/File\|File]] as a string. |
| [[30 Official Roblox Docs/API Reference/Classes/File#GetTemporaryId\|GetTemporaryId()]] | ContentId | Gets a `rbxtemp://` asset ID for this [[30 Official Roblox Docs/API Reference/Classes/File\|File]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Size

**Type:** int64

**Security:** read PluginSecurity / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** AssetRead · **Tags:** `Hidden`, `ReadOnly`, `NotReplicated`

The file size (in bytes) of the local file associated with this [[30 Official Roblox Docs/API Reference/Classes/File|File]].

## Methods

### GetBinaryContents

```lua
File:GetBinaryContents(): string
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** AssetRead

This function is used to read the contents of the [[30 Official Roblox Docs/API Reference/Classes/File|File]] as a raw binary string. This allows the file to be uploaded to web endpoints, or to be processed by plugins.

**Returns**

| Type | Description |
| --- | --- |
| string | A raw binary string representation of the [[30 Official Roblox Docs/API Reference/Classes/File\|File]] contents. |

### GetTemporaryId

```lua
File:GetTemporaryId(): ContentId
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Capabilities:** AssetRead

This function is used to retrieve a temporary asset ID associated with the [[30 Official Roblox Docs/API Reference/Classes/File|File]]. The ID can be used like `rbxassetid://`, for example it can be assigned to the [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#Image|Image]] property of an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]].

Throws an error if the file does not exist on disk.

**Returns**

| Type | Description |
| --- | --- |
| ContentId | The temporary asset ID. |

---
*Source: [File](https://create.roblox.com/docs/reference/engine/classes/File) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
