---
title: "DataStoreObjectVersionInfo"
description: "An instance describing version information for a key."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DataStoreObjectVersionInfo"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An instance describing version information for a key.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

An instance describing version information for a key, including the version string, created time, and whether it has been marked as deleted.

See also:

- [[30 Official Roblox Docs/Cloud Services/Data Stores/Data stores|Data Stores]], an in-depth guide on data structure, management, error handling, etc.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreObjectVersionInfo#CreatedTime\|CreatedTime]] | int64 | Indicates when the version was created in milliseconds since epoch. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreObjectVersionInfo#IsDeleted\|IsDeleted]] | boolean | Whether the version has been marked as deleted. |
| [[30 Official Roblox Docs/API Reference/Classes/DataStoreObjectVersionInfo#Version\|Version]] | string | Uniquely identifies a particular version of the key. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CreatedTime

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** DataStore · **Tags:** `ReadOnly`, `NotReplicated`

This property indicates when the version was created in milliseconds since epoch.

### IsDeleted

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** DataStore · **Tags:** `ReadOnly`, `NotReplicated`

This property describes whether the version has been marked as deleted. Deleted versions will be permanently deleted after 30 days.

### Version

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** DataStore · **Tags:** `ReadOnly`, `NotReplicated`

This property uniquely identifies a particular version of the key. It can be passed to [[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAsync|DataStore:GetVersionAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/DataStore#RemoveVersionAsync|DataStore:RemoveVersionAsync()]] to get or remove the version respectively.

---
*Source: [DataStoreObjectVersionInfo](https://create.roblox.com/docs/reference/engine/classes/DataStoreObjectVersionInfo) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
