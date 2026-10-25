---
title: "Content"
description: "Represents a reference to asset content stored externally or as an object within the place."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Content"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Represents a reference to asset content stored externally or as an object within the place.*

## Description

The `Content` data type represents a reference to asset content stored externally or as an object within the place, wrapping a single value of one of the supported [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType|Enum.ContentSourceType]] values.

##### Warning

Replication is not yet supported for [[30 Official Roblox Docs/API Reference/Datatypes/Content#Object|Object]] values. When an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] with a [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] property containing a [[30 Official Roblox Docs/API Reference/Datatypes/Content#Object|Object]] value is replicated, an unusable placeholder [[30 Official Roblox Docs/API Reference/Classes/Object|Object]] of the same type will be used instead of the [[30 Official Roblox Docs/API Reference/Classes/Object|Object]] itself, and any attempt to read or write the contents of that placeholder object will throw. These placeholder objects will render as a cyan and magenta checkerboard pattern.

This will be replaced with standard replication behavior in the future. For now, do not use [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] or [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] as [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] on the server on an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] that can replicate to clients.

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Content#fromUri\|fromUri()]] | `uri` | Returns a new `Content` with an [asset URI](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) `string` value referencing content external to the place. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Content#fromAssetId\|fromAssetId()]] | `assetId` | Returns a new `Content` from a numeric asset ID. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Content#fromObject\|fromObject()]] | `object` | Returns a new `Content` with a strong reference to an [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]]. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Content#none\|none]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | An empty `Content` value with [[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType\|Content.SourceType]] of [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType\|None]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType\|SourceType]] | [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType\|Enum.ContentSourceType]] | The source type of the contained value. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Content#Uri\|Uri]] | string? | A URI `string` if [[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType\|Content.SourceType]] is [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType\|Uri]], otherwise `nil`. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Content#Object\|Object]] | [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]]? | A reference to a non-`nil` [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]] if [[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType\|Content.SourceType]] is [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType\|Object]], otherwise `nil`. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Content#Opaque\|Opaque]] | Opaque? | A reference to a non-`nil` `Opaque` content if [[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType\|Content.SourceType]] is [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType\|Opaque]], otherwise `nil`. |

### Constants

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Content#none\|none]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | An empty `Content` value with [[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType\|Content.SourceType]] of [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType\|None]]. |

## Constructors

### fromUri

```lua
Content.fromUri(uri: string): Content
```

Returns a new `Content` with an [asset URI](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) `string` value referencing content external to the place.

[[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType|Content.SourceType]] will be [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType|Uri]], and [[30 Official Roblox Docs/API Reference/Datatypes/Content#Uri|Content.Uri]] will contain a non‑`nil` `string` value.

If `uri` is empty, [[30 Official Roblox Docs/API Reference/Datatypes/Content#none|Content.none]] will be returned instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `uri` | string |  | The [asset URI](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) string. |

### fromAssetId

```lua
Content.fromAssetId(assetId: number): Content
```

Returns a new `Content` from a numeric asset ID. This is a convenience constructor equivalent to calling `Content.fromUri("rbxassetid://" .. tostring(assetId))`.

[[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType|Content.SourceType]] will be [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType|Uri]], and [[30 Official Roblox Docs/API Reference/Datatypes/Content#Uri|Content.Uri]] will contain the formatted `rbxassetid://` URI string.

If `assetId` is `0`, [[30 Official Roblox Docs/API Reference/Datatypes/Content#none|Content.none]] will be returned instead.

Throws if `assetId` is non‑finite, for example [[30 Official Roblox Docs/API Reference/Libraries/math#huge|math.huge()]] or `0/0`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | number |  | The numeric asset ID. |

### fromObject

```lua
Content.fromObject(object: Object): Content
```

Returns a new `Content` with a strong reference to an [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].

[[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType|Content.SourceType]] will be [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType|Object]], and [[30 Official Roblox Docs/API Reference/Datatypes/Content#Object|Content.Object]] will contain a non‑`nil` [[30 Official Roblox Docs/API Reference/Classes/Object|Object]] reference.

[[30 Official Roblox Docs/API Reference/Datatypes/Content#Object|Content.Object]] references are **strong** references that hold **shared ownership** of the [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]. Any [[30 Official Roblox Docs/API Reference/Datatypes/Content#Object|Content.Object]] reference will extend the lifetime of that [[30 Official Roblox Docs/API Reference/Classes/Object|Object]] and prevent it from being garbage collected.

Throws if `object` is `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `object` | [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Object\|Object]] to reference. |

## Properties

### none

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

An empty `Content` value with [[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType|Content.SourceType]] of [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType|None]].

### SourceType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType|Enum.ContentSourceType]]

The source type of the contained value. Indicates which property contains a non‑`nil` value.

### Uri

**Type:** string?

A URI `string` if [[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType|Content.SourceType]] is [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType|Uri]], otherwise `nil`.

### Object

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]?

A reference to a non-`nil` [[30 Official Roblox Docs/API Reference/Classes/Object|Object]] if [[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType|Content.SourceType]] is [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType|Object]], otherwise `nil`.

### Opaque

**Type:** Opaque?

A reference to a non-`nil` `Opaque` content if [[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType|Content.SourceType]] is [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType|Opaque]], otherwise `nil`.

## Constants

### none

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

An empty `Content` value with [[30 Official Roblox Docs/API Reference/Datatypes/Content#SourceType|Content.SourceType]] of [[30 Official Roblox Docs/API Reference/Enums/ContentSourceType|None]].

---
*Source: [Content](https://create.roblox.com/docs/reference/engine/datatypes/Content) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
