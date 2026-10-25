---
title: "IncrementalPatchBuilder"
description: "Builds signed incremental patches for hot-reloading a running client from script changes detected by a separate file watcher."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/IncrementalPatchBuilder"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Builds signed incremental patches for hot-reloading a running client from script changes detected by a separate file watcher.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Internal tooling service, not for creator game scripts. A separate file-watcher system detects changes in a mapped subtree of scripts; this service rebuilds an in-memory patch tree and serializes that tree into a signed binary patch that can be delivered to a running client for hot-reload.

Builds are debounced so rapid successive edits coalesce into a single patch build. When [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder#SerializePatch|SerializePatch]] is `true`, the resulting patch is delivered through [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy|AssetDeliveryProxy]] and written to the configured output path.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder#AddPathsToBundle\|AddPathsToBundle]] | boolean | Whether each script in the patch is tagged with a `FilePath` attribute recording its on-disk source path. |
| [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder#BuildDebouncePeriod\|BuildDebouncePeriod]] | double | The interval, in seconds, used to debounce rebuilds so that rapid script changes are coalesced into a single patch build. |
| [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder#HighCompression\|HighCompression]] | boolean | Whether the serialized patch is written with high-compression settings. |
| [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder#SerializePatch\|SerializePatch]] | boolean | Whether a completed build is serialized into a signed binary patch. |
| [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder#UseFileLevelCompressionInsteadOfChunk\|UseFileLevelCompressionInsteadOfChunk]] | boolean | Whether per-chunk compression is skipped so that the patch is compressed at the file level instead. |
| [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder#ZstdCompression\|ZstdCompression]] | boolean | Whether per-chunk compression of the patch uses the Zstandard algorithm. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AddPathsToBundle

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Defaults to `false`. When `true`, and the builder is running alongside a `CoreScriptSyncService`, each script instance added to the patch is given a `FilePath` attribute set to the on-disk path of the file it was synced from. When `false`, no path attributes are written.

### BuildDebouncePeriod

**Type:** double

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Defaults to `0.1` (100 milliseconds). When the separate file watcher reports a script change, the builder waits this interval before rebuilding, and any additional changes that arrive during the window are batched into the same build. Larger values reduce redundant rebuilds during bursts of edits, at the cost of added latency before the patch updates.

### HighCompression

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Defaults to `false`. When `true`, the builder writes the binary patch with high-compression settings, trading additional build time for a smaller patch.

### SerializePatch

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Defaults to `true`. When `true`, each successful build is serialized into a signed binary patch, delivered through [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy|AssetDeliveryProxy]], and written to the configured output path. When `false`, the builder still produces the in-memory patch tree but skips serialization, so no patch file is emitted.

### UseFileLevelCompressionInsteadOfChunk

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Defaults to `false`. When `true`, the builder disables the serializer's per-chunk compression, storing the patch's chunks uncompressed so that compression can be applied at the file level instead. This property takes precedence over [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder#ZstdCompression|ZstdCompression]]: when it is `true`, the Zstandard setting has no effect.

### ZstdCompression

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Defaults to `false`. When `true`, the builder compresses the patch's chunks with the Zstandard algorithm. This applies only while [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder#UseFileLevelCompressionInsteadOfChunk|UseFileLevelCompressionInsteadOfChunk]] is at its default of `false`, because that property takes precedence and disables per-chunk compression entirely.

---
*Source: [IncrementalPatchBuilder](https://create.roblox.com/docs/reference/engine/classes/IncrementalPatchBuilder) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
