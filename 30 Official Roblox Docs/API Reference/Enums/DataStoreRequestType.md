---
title: "DataStoreRequestType"
description: "Indicates the type of data store request being made."
api_type: enum
aliases: ["Enum.DataStoreRequestType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/DataStoreRequestType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the type of data store request being made.*

## Description

Categorizes data store operations for use with [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#GetRequestBudgetForRequestType|DataStoreService:GetRequestBudgetForRequestType()]], which returns the remaining per-server request budget for a given category.

The enum contains two sets of values. The **legacy** values (`GetAsync`, `SetIncrementAsync`, `UpdateAsync`, `GetSortedAsync`, `SetIncrementSortedAsync`, `OnUpdate`, `ListAsync`, `GetVersionAsync`, and `RemoveVersionAsync`) should not be used. The **modern** values (`StandardRead`, `StandardWrite`, `StandardList`, `StandardRemove`, `OrderedRead`, `OrderedWrite`, `OrderedList`, and `OrderedRemove`) correspond to the newer [[30 Official Roblox Docs/API Reference/Classes/DataStore|DataStore]] and [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore|OrderedDataStore]] API families that use universe-level and per-server limits.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `GetAsync` | 0 | Refers to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync\|GetAsync()]] and the read of [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync\|UpdateAsync()]]. |
| `SetIncrementAsync` | 1 | Refers to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync\|SetAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync\|IncrementAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync\|RemoveAsync()]], and the write of [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync\|UpdateAsync()]] when it returns a non-`nil` value. |
| `UpdateAsync` | 2 | Refers to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync\|UpdateAsync()]]. |
| `GetSortedAsync` | 3 | Refers to [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore#GetSortedAsync\|GetSortedAsync()]]. |
| `SetIncrementSortedAsync` | 4 | Refers to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync\|SetAsync()]] [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync\|IncrementAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync\|RemoveAsync()]], and the write of [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync\|UpdateAsync()]] while using an [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore\|OrderedDataStore]]. |
| `OnUpdate` | 5 | Refers to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#OnUpdate\|OnUpdate()]]. |
| `ListAsync` | 6 | Refers to [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListKeysAsync\|ListKeysAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListVersionsAsync\|ListVersionsAsync()]]. |
| `GetVersionAsync` | 7 | Refers to [[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAsync\|GetVersionAsync()]]. |
| `RemoveVersionAsync` | 8 | Refers to [[30 Official Roblox Docs/API Reference/Classes/DataStore#RemoveVersionAsync\|RemoveVersionAsync()]]. |
| `StandardRead` | 9 | Refers to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync\|GetAsync()]], [[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAsync\|GetVersionAsync()]], [[30 Official Roblox Docs/API Reference/Classes/DataStore#GetVersionAtTimeAsync\|GetVersionAtTimeAsync()]], and the read of [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync\|UpdateAsync()]] for [[30 Official Roblox Docs/API Reference/Classes/DataStore\|DataStore]]. |
| `StandardWrite` | 10 | Refers to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync\|SetAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync\|IncrementAsync()]], and the write of [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync\|UpdateAsync()]] for [[30 Official Roblox Docs/API Reference/Classes/DataStore\|DataStore]]. |
| `StandardList` | 11 | Refers to [[30 Official Roblox Docs/API Reference/Classes/DataStoreService#ListDataStoresAsync\|ListDataStoresAsync()]], and [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListKeysAsync\|ListKeysAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/DataStore#ListVersionsAsync\|ListVersionsAsync()]] for [[30 Official Roblox Docs/API Reference/Classes/DataStore\|DataStore]]. |
| `StandardRemove` | 12 | Refers to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync\|RemoveAsync()]] for [[30 Official Roblox Docs/API Reference/Classes/DataStore\|DataStore]]. |
| `OrderedRead` | 13 | Refers to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#GetAsync\|GetAsync()]] and the read of [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync\|UpdateAsync()]] for [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore\|OrderedDataStore]]. |
| `OrderedWrite` | 14 | Refers to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync\|SetAsync()]], [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#IncrementAsync\|IncrementAsync()]], and the write of [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#UpdateAsync\|UpdateAsync()]] for [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore\|OrderedDataStore]]. |
| `OrderedList` | 15 | Refers to [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore#GetSortedAsync\|GetSortedAsync()]] for [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore\|OrderedDataStore]]. GetRequestBudgetForRequestType()`with this enum will return`0`. |
| `OrderedRemove` | 16 | Refers to [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#RemoveAsync\|RemoveAsync()]] for [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore\|OrderedDataStore]]. |

---
*Source: [DataStoreRequestType](https://create.roblox.com/docs/reference/engine/enums/DataStoreRequestType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
