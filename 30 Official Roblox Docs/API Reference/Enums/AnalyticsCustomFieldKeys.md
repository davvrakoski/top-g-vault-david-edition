---
title: "AnalyticsCustomFieldKeys"
description: "Used to form a dictionary of custom fields to provide breakdowns in Roblox-provided charts."
api_type: enum
aliases: ["Enum.AnalyticsCustomFieldKeys"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/AnalyticsCustomFieldKeys"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Used to form a dictionary of custom fields to provide breakdowns in Roblox-provided charts.*

## Description

Used to form a dictionary of custom fields to provide breakdowns in Roblox-provided charts. For example:

```lua
local customFields = {
	[Enum.AnalyticsCustomFieldKeys.CustomField01.Name] = "value1",
	[Enum.AnalyticsCustomFieldKeys.CustomField02.Name] = "value2",
	[Enum.AnalyticsCustomFieldKeys.CustomField03.Name] = "value3",
}
```

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `CustomField01` | 0 | The first custom field key, used to provide a breakdown dimension in Roblox-provided analytics charts. |
| `CustomField02` | 1 | The second custom field key, used to provide a breakdown dimension in Roblox-provided analytics charts. |
| `CustomField03` | 2 | The third custom field key, used to provide a breakdown dimension in Roblox-provided analytics charts. |

---
*Source: [AnalyticsCustomFieldKeys](https://create.roblox.com/docs/reference/engine/enums/AnalyticsCustomFieldKeys) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
