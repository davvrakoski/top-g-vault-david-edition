---
title: "PackageLink"
description: "Links a `DataModel` instance to a corresponding asset in the cloud."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PackageLink"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Links a [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] instance to a corresponding asset in the cloud.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

The purpose of the [[30 Official Roblox Docs/API Reference/Classes/PackageLink|PackageLink]] object is to link a [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] instance to a corresponding asset in the cloud. This improves flows for collaboration, version control, and sharing for models. The [[30 Official Roblox Docs/API Reference/Classes/PackageLink|PackageLink]] instance will be a child of the root of the entire package hierarchy.

[[30 Official Roblox Docs/API Reference/Classes/PackageLink|PackageLinks]] are not creatable through [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]]. They can only be added through interaction with Studio and can only be parented to [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] that can be published independently of [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] publish. The [[30 Official Roblox Docs/API Reference/Classes/PackageLink|PackageLink]] instance will always be the first child shown in the tree view, regardless of sorting.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PackageLink#AutoUpdate\|AutoUpdate]] | boolean | When this property is set to true, the package associated with the given [[30 Official Roblox Docs/API Reference/Classes/PackageLink\|PackageLink]] automatically updates to the latest version. |
| [[30 Official Roblox Docs/API Reference/Classes/PackageLink#Creator\|Creator]] | string | The creator of the package asset. |
| [[30 Official Roblox Docs/API Reference/Classes/PackageLink#DefaultName\|DefaultName]] | string | Engine-managed name of the package's root instance as it was last published, kept as a baseline for detecting local name changes. |
| [[30 Official Roblox Docs/API Reference/Classes/PackageLink#PackageAssetName\|PackageAssetName]] | string | The asset name of the package. |
| [[30 Official Roblox Docs/API Reference/Classes/PackageLink#PackageContent\|PackageContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | Read-only [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] URL for the model asset backing this package. |
| [[30 Official Roblox Docs/API Reference/Classes/PackageLink#PackageId\|PackageId]] | ContentId | The ID of the asset this package corresponds to. |
| [[30 Official Roblox Docs/API Reference/Classes/PackageLink#PermissionLevel\|PermissionLevel]] | [[30 Official Roblox Docs/API Reference/Enums/PackagePermission\|PackagePermission]] | The package permission for the current Studio user. |
| [[30 Official Roblox Docs/API Reference/Classes/PackageLink#SerializedDefaultAttributes\|SerializedDefaultAttributes]] | BinaryString | Engine-managed serialized snapshot of the attributes on the package's root instance as it was last published, kept as a baseline for detecting local attribute changes. |
| [[30 Official Roblox Docs/API Reference/Classes/PackageLink#Status\|Status]] | string | The status of the package. |
| [[30 Official Roblox Docs/API Reference/Classes/PackageLink#VersionNumber\|VersionNumber]] | int64 | Refers to a revision of a specific package. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AutoUpdate

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Link · **Loaded/Saved:** true/true · **Capabilities:** AssetRead

When this property is set to true, the package associated with the given [[30 Official Roblox Docs/API Reference/Classes/PackageLink|PackageLink]] will be automatically updated to the latest version. By default, this property is false upon creation of a package.

This property lets you decide if a given package should be automatically updated to the latest version when entering a given place. The game periodically checks for new updates while a place is open.

This property is visible and configurable in the Properties window in Studio.

### Creator

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** AssetRead · **Tags:** `ReadOnly`, `NotReplicated`, `NotScriptable`

The creator of the package asset.

### DefaultName

**Type:** string

**Security:** read None / write NotAccessibleSecurity · **Thread safety:** ReadSafe · **Category:** Link · **Loaded/Saved:** true/true · **Capabilities:** AssetRead

Managed by the engine and not writable from scripts. Stores the name of the package's root instance as recorded when the package was last published or synced. It defaults to an empty string and is populated from the base root node's name.

This value is the as-published baseline the engine compares against the current instance name to detect local name customizations and preserve them during a three-way merge when the package is updated.

### PackageAssetName

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** AssetRead · **Tags:** `ReadOnly`, `NotReplicated`, `NotScriptable`

The asset name of the package.

### PackageContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Link · **Loaded/Saved:** false/true · **Capabilities:** AssetRead · **Tags:** `ReadOnly`, `NotReplicated`

A read-only [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] that references the package's model asset. The value is the same asset that [[30 Official Roblox Docs/API Reference/Classes/PackageLink#PackageId|PackageLink.PackageId]] points to, expressed as a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] URL rather than a `ContentId` string. This property cannot be written from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

### PackageId

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Link · **Loaded/Saved:** false/true · **Capabilities:** AssetRead · **Tags:** `ReadOnly`, `NotReplicated`

The ID of the asset this package corresponds to.

### PermissionLevel

**Type:** [[30 Official Roblox Docs/API Reference/Enums/PackagePermission|PackagePermission]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** AssetRead · **Tags:** `ReadOnly`, `NotReplicated`, `NotScriptable`

The package permission for the current Studio user.

### SerializedDefaultAttributes

**Type:** BinaryString

**Security:** read None / write NotAccessibleSecurity · **Thread safety:** ReadSafe · **Category:** Link · **Loaded/Saved:** true/true · **Capabilities:** AssetRead

Managed by the engine and not writable from scripts. Stores a serialized (binary) snapshot of the attributes on the package's root instance as recorded when the package was last published or synced. It defaults to an empty value and is populated from the base root node's serialized attributes.

This snapshot is the as-published baseline for a three-way merge: the engine compares the root instance's current attributes against it to preserve local customizations when the package is updated.

### Status

**Type:** string

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Link · **Loaded/Saved:** false/false · **Capabilities:** AssetRead · **Tags:** `ReadOnly`, `NotReplicated`

The status of the package. It can be one of the following statuses: Up To Date, Changed, New Version Available, Changed + New Version Available.

### VersionNumber

**Type:** int64

**Security:** read None / write NotAccessibleSecurity · **Thread safety:** ReadSafe · **Category:** Link · **Loaded/Saved:** true/false · **Capabilities:** AssetRead · **Tags:** `NotReplicated`

This property refers to a revision of a specific package

---
*Source: [PackageLink](https://create.roblox.com/docs/reference/engine/classes/PackageLink) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
