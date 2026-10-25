---
title: "StyleBase"
description: "The base class for `StyleSheet` and `StyleRule`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StyleBase"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The base class for [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] and [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRule]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRule]], [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]]
- **Memory category:** Gui
- **Tags:** `NotCreatable`

## Description

The base class for [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] and [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRule]]. Holds a list of child [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]], as well as token definitions which are stored as [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attributes]].

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StyleBase#GetStyleRules\|GetStyleRules()]] | List<[[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRule]]> | Returns an array of associated [[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRules]]. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleBase#InsertStyleRule\|InsertStyleRule()]] | () | Inserts a new [[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRule]] into the array of rules. |
| [[30 Official Roblox Docs/API Reference/Classes/StyleBase#SetStyleRules\|SetStyleRules()]] | () | Similar to [[30 Official Roblox Docs/API Reference/Classes/StyleBase#InsertStyleRule\|InsertStyleRule()]] but lets you declare and set multiple [[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRules]] at once. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StyleBase#StyleRulesChanged\|StyleRulesChanged]] |  | Fires when one or more [[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRules]] is explicitly changed on the connected [[30 Official Roblox Docs/API Reference/Classes/StyleSheet\|StyleSheet]] or [[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRule]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetStyleRules

```lua
StyleBase:GetStyleRules(): List<StyleRule>
```

**Thread safety:** Unsafe · **Capabilities:** UI

Returns an array of associated [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]].

**Returns**

| Type | Description |
| --- | --- |
| List<[[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRule]]> | Array of [[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRules]]. |

### InsertStyleRule

```lua
StyleBase:InsertStyleRule(rule: StyleRule, priority: int?): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Inserts a new [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRule]] into the array of rules so that its [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Priority|Priority]] is greater than all previous [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]]. If `priority` is specified, sets the new rule's [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Priority|Priority]] to the specified value.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `rule` | [[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRule]] |  | The [[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRule]] to insert. |
| `priority` | int? |  | The number to set the rule's [[30 Official Roblox Docs/API Reference/Classes/StyleRule#Priority\|Priority]] to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### SetStyleRules

```lua
StyleBase:SetStyleRules(rules: Instances): ()
```

**Thread safety:** Unsafe · **Capabilities:** UI

Similar to [[30 Official Roblox Docs/API Reference/Classes/StyleBase#InsertStyleRule|InsertStyleRule()]] but lets you declare and set multiple [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]] at once.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `rules` | Instances |  | Array of [[30 Official Roblox Docs/API Reference/Classes/StyleRule\|StyleRules]] to set. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`StyleBase-SetStyleRules`) are published on the source page; their code is not part of the open-source repo.*

## Events

### StyleRulesChanged

```lua
StyleBase.StyleRulesChanged()
```

**Capabilities:** UI

Fires when one or more [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRules]] is explicitly changed on the connected [[30 Official Roblox Docs/API Reference/Classes/StyleSheet|StyleSheet]] or [[30 Official Roblox Docs/API Reference/Classes/StyleRule|StyleRule]], for example when [[30 Official Roblox Docs/API Reference/Classes/StyleBase#InsertStyleRule|InsertStyleRule()]] is called.

---
*Source: [StyleBase](https://create.roblox.com/docs/reference/engine/classes/StyleBase) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
