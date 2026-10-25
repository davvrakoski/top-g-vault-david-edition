---
title: "AssetPatchSettings"
description: "Configures a single patch asset built by `IncrementalPatchBuilder` and served through `AssetDeliveryProxy`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AssetPatchSettings"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Configures a single patch asset built by [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder|IncrementalPatchBuilder]] and served through [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy|AssetDeliveryProxy]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

Defines the settings for an asset produced by [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder|IncrementalPatchBuilder]] and served through [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy|AssetDeliveryProxy]] during local debugging and hot-reload. An `AssetPatchSettings` instance can only be parented to an [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder|IncrementalPatchBuilder]], and its [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Name]] represents the patch ID. Each child provides the content ID and cache location that the builder uses when it registers a completed patch.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AssetPatchSettings#ContentId\|ContentId]] | string | The content ID used to override this patch asset when it is served by [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy\|AssetDeliveryProxy]]. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetPatchSettings#OutputPath\|OutputPath]] | string | The filesystem path where the built patch asset is cached; when empty, an in-memory cache is used instead. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetPatchSettings#PatchId\|PatchId]] | string | An identifier for distinguishing patches under a single [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder\|IncrementalPatchBuilder]]. Has no effect. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ContentId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The content ID used to override this asset when it is served by [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy|AssetDeliveryProxy]], for example `rbxasset://models/DataModelPatch/DataModelPatch.rbxm`. When [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder|IncrementalPatchBuilder]] finishes a build, it registers the serialized patch under this content ID so that requests for that asset return the patched content. Defaults to an empty string.

### OutputPath

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The output path for the local cache of the patch asset, for example `/path/to/content/models/DataModelPatch/DataModelPatch.rbxm`. When set, [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder|IncrementalPatchBuilder]] writes each completed patch to this path, creating any missing parent directories. Defaults to an empty string; when empty, no file is written and an in-memory cache is used instead.

### PatchId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

An identifier for distinguishing patches under a single [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder|IncrementalPatchBuilder]]. Has no effect. Defaults to an empty string.

---
*Source: [AssetPatchSettings](https://create.roblox.com/docs/reference/engine/classes/AssetPatchSettings) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
