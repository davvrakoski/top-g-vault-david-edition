---
title: "Secret"
description: "Stores secret non-printable content."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Secret"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Stores secret non-printable content.*

## Description

The [[30 Official Roblox Docs/API Reference/Datatypes/Secret|Secret]] data type stores the secret content returned by [[30 Official Roblox Docs/API Reference/Classes/HttpService#GetSecret|HttpService:GetSecret()]]. It cannot be printed or logged, but can be modified using built-in functions:

*Code samples for this API (`Secret-Overview`) are published on the [source page](https://create.roblox.com/docs/reference/engine/datatypes/Secret); their code is not part of the open-source repo.*

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Secret#AddPrefix\|AddPrefix()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Secret\|Secret]] | Prepends a string to the secret content. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Secret#AddSuffix\|AddSuffix()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Secret\|Secret]] | Appends a string to the secret content. |

## Methods

### AddPrefix

```lua
Secret:AddPrefix(prefix: string): Secret
```

Returns a secret formed by concatenating the supplied string to the secret content, for example prepending `"Bearer"` to the API key.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `prefix` | string |  | The string to prepend to the secret content. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Secret\|Secret]] | A new Secret with the prefix prepended to the original secret value. |

*Code samples for this member (`Secret-AddPrefix`) are published on the source page; their code is not part of the open-source repo.*

### AddSuffix

```lua
Secret:AddSuffix(suffix: string): Secret
```

Returns a secret formed by concatenating the original secret and the supplied string parameter. Useful when creating a URL containing a key and query parameters.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `suffix` | string |  | The string to append to the secret content. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Secret\|Secret]] | A new Secret with the suffix appended to the original secret value. |

*Code samples for this member (`Secret-AddSuffix`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Secret](https://create.roblox.com/docs/reference/engine/datatypes/Secret) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
