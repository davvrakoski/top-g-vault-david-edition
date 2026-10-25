---
title: "GuiBase2d"
description: "An abstract class inherited by 2D `GuiObjects`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/GuiBase2d"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An abstract class inherited by 2D [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Subclasses:** [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

[[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] is an abstract class inherited by 2D [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsolutePosition\|AbsolutePosition]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Describes the actual screen position of a [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d\|GuiBase2d]] element, in pixels. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteRotation\|AbsoluteRotation]] | float | Describes the actual screen rotation of a [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d\|GuiBase2d]] element, in degrees. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize\|AbsoluteSize]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Describes the actual screen size of a [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d\|GuiBase2d]] element, in pixels. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AutoLocalize\|AutoLocalize]] | boolean | When set to `true`, localization will be applied to this [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d\|GuiBase2d]] and its descendants. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#Localize\|Localize]] | boolean | **Deprecated.** Automatically set to true when a localization table's [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#Root\|LocalizationTable.Root]] targets this object, or an ancestor of this object. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#RootLocalizationTable\|RootLocalizationTable]] | [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable\|LocalizationTable]] | A reference to a [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable\|LocalizationTable]] to be used to apply automated localization to this [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d\|GuiBase2d]] and its descendants. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionBehaviorDown\|SelectionBehaviorDown]] | [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior\|SelectionBehavior]] | Customizes gamepad selection behavior in the down direction. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionBehaviorLeft\|SelectionBehaviorLeft]] | [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior\|SelectionBehavior]] | Customizes gamepad selection behavior in the left direction. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionBehaviorRight\|SelectionBehaviorRight]] | [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior\|SelectionBehavior]] | Customizes gamepad selection behavior in the right direction. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionBehaviorUp\|SelectionBehaviorUp]] | [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior\|SelectionBehavior]] | Customizes gamepad selection behavior in the up direction. |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionGroup\|SelectionGroup]] | boolean | Allows customization of gamepad selection movement. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionChanged\|SelectionChanged]] | `amISelected`, `previousSelection`, `newSelection` | Fires when the gamepad selection moves to, leaves, or changes within the connected [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d\|GuiBase2d]] or any descendant [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObjects]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AbsolutePosition

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** Unsafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

[[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsolutePosition|AbsolutePosition]] is a read-only property that provides the screen position of a [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] element in pixels. This represents the actual pixel position at which an element renders as a result of its ancestors' sizes and positions. Note that [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsolutePosition|AbsolutePosition]] always represents the top-left corner of the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] element.

If the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] is in a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]], the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsolutePosition|AbsolutePosition]] property uses the [[30 Official Roblox Docs/API Reference/Enums/ScreenInsets|CoreUISafeInsets]] viewport coordinate system. The origin of this coordinate system is located at the bottom-left corner of the Roblox top bar. Note that this is the same coordinate system used by the [[30 Official Roblox Docs/API Reference/Classes/InputObject#Position|InputObject.Position]] property.

*(image in the full Top G Vault)*

See also [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteRotation|AbsoluteRotation]] and [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|AbsoluteSize]].

### AbsoluteRotation

**Type:** float

**Thread safety:** Unsafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

[[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteRotation|AbsoluteRotation]] is a read-only property that describes the actual screen rotation of a [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] element, in degrees. It does **not** perform bounds checking, so its value may not be in the range `0` to `360`.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsolutePosition|AbsolutePosition]] and [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|AbsoluteSize]].

### AbsoluteSize

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** Unsafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

[[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize|AbsoluteSize]] is a read-only property that describes the actual screen size of a [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] element, in pixels.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsolutePosition|AbsolutePosition]] and [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteRotation|AbsoluteRotation]].

### AutoLocalize

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Localization · **Loaded/Saved:** true/true · **Capabilities:** UI

When set to `true`, localization will be applied to this [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] and its descendants. The entries used for localization are the same set of entries returned by [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetTableEntries|LocalizationService:GetTableEntries()]]. Entries with [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AutoLocalize|AutoLocalize]] enabled are automatically re-translated after the cloud table loads if necessary.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#RootLocalizationTable|RootLocalizationTable]].

### Localize

> [!warning] Deprecated
> This item is deprecated. Do not use it for new work.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Localization · **Loaded/Saved:** true/false · **Capabilities:** UI · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

This property is automatically set to true when a localization table's [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#Root|LocalizationTable.Root]] targets this object, or an ancestor of this object. [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTables]] with their [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable#Root|LocalizationTable.Root]] property pointed at an instance will localize all [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel.TextButton]] that are descendants of the root instance.

### RootLocalizationTable

**Type:** [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]]

**Thread safety:** ReadSafe · **Category:** Localization · **Loaded/Saved:** true/true · **Capabilities:** UI

A reference to a [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] to be used to apply automated localization to this [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] and its descendants. [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AutoLocalize|AutoLocalize]] must be set to `true` on the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] and its ancestors for automated localization to be applied.

You can set this to reference a [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] anywhere in the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. The [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] object and all of its children will try to use that specific [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]] and its ancestors for automatic text replacement before using the tables under [[30 Official Roblox Docs/API Reference/Classes/LocalizationService|LocalizationService]] in an undefined order and the cloud table.

If there is no translation available in the referenced table, it will look for a translation in the parent of that table, if it is also a [[30 Official Roblox Docs/API Reference/Classes/LocalizationTable|LocalizationTable]], and so on.

See also [[30 Official Roblox Docs/API Reference/Classes/LocalizationService#GetTableEntries|LocalizationService:GetTableEntries()]] which explains how the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#RootLocalizationTable|RootLocalizationTable]] is used for automated localization.

### SelectionBehaviorDown

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|SelectionBehavior]]

**Thread safety:** ReadSafe · **Category:** Selection · **Loaded/Saved:** true/true · **Capabilities:** UI

[[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionBehaviorDown|SelectionBehaviorDown]] customizes how gamepad selection moves in the down direction out of a selection group. It only has an effect when [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionGroup|SelectionGroup]] is `true`; `SelectionGroup` is `false` by default, and while it remains `false` this property has no effect.

Its default value is [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|Enum.SelectionBehavior.Escape]], which prioritizes buttons within the selection group but allows the selection to move to a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] outside the group in the down direction if no suitable button is found inside. Setting it to [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|Enum.SelectionBehavior.Stop]] instead constrains the selection to the group, preventing it from moving downward out of the group.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionGroup|SelectionGroup]].

### SelectionBehaviorLeft

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|SelectionBehavior]]

**Thread safety:** ReadSafe · **Category:** Selection · **Loaded/Saved:** true/true · **Capabilities:** UI

[[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionBehaviorLeft|SelectionBehaviorLeft]] customizes how gamepad selection moves in the left direction out of a selection group. It only has an effect when [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionGroup|SelectionGroup]] is `true`; `SelectionGroup` is `false` by default, and while it remains `false` this property has no effect.

Its default value is [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|Enum.SelectionBehavior.Escape]], which prioritizes buttons within the selection group but allows the selection to move to a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] outside the group in the left direction if no suitable button is found inside. Setting it to [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|Enum.SelectionBehavior.Stop]] instead constrains the selection to the group, preventing it from moving leftward out of the group.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionGroup|SelectionGroup]].

### SelectionBehaviorRight

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|SelectionBehavior]]

**Thread safety:** ReadSafe · **Category:** Selection · **Loaded/Saved:** true/true · **Capabilities:** UI

[[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionBehaviorRight|SelectionBehaviorRight]] customizes how gamepad selection moves in the right direction out of a selection group. It only has an effect when [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionGroup|SelectionGroup]] is `true`; `SelectionGroup` is `false` by default, and while it remains `false` this property has no effect.

Its default value is [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|Enum.SelectionBehavior.Escape]], which prioritizes buttons within the selection group but allows the selection to move to a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] outside the group in the right direction if no suitable button is found inside. Setting it to [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|Enum.SelectionBehavior.Stop]] instead constrains the selection to the group, preventing it from moving rightward out of the group.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionGroup|SelectionGroup]].

### SelectionBehaviorUp

**Type:** [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|SelectionBehavior]]

**Thread safety:** ReadSafe · **Category:** Selection · **Loaded/Saved:** true/true · **Capabilities:** UI

[[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionBehaviorUp|SelectionBehaviorUp]] customizes how gamepad selection moves in the up direction out of a selection group. It only has an effect when [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionGroup|SelectionGroup]] is `true`; `SelectionGroup` is `false` by default, and while it remains `false` this property has no effect.

Its default value is [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|Enum.SelectionBehavior.Escape]], which prioritizes buttons within the selection group but allows the selection to move to a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] outside the group in the up direction if no suitable button is found inside. Setting it to [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|Enum.SelectionBehavior.Stop]] instead constrains the selection to the group, preventing it from moving upward out of the group.

See also [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionGroup|SelectionGroup]].

### SelectionGroup

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Selection · **Loaded/Saved:** true/true · **Capabilities:** UI

Allows for customization of how gamepad selection can move between buttons, which are descendants of the selection group, leave the group, and select other buttons.

Setting [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionGroup|SelectionGroup]] to `true` exposes the [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionBehaviorUp|SelectionBehaviorUp]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionBehaviorDown|SelectionBehaviorDown]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionBehaviorLeft|SelectionBehaviorLeft]], and [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#SelectionBehaviorRight|SelectionBehaviorRight]] properties. For these selection behaviors, a setting of [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|Enum.SelectionBehavior.Escape]] (default) means the gamepad selection tries to first find a selection within the selection group and only moves outside if it does not find a suitable button. Alternatively, a setting of [[30 Official Roblox Docs/API Reference/Enums/SelectionBehavior|Enum.SelectionBehavior.Stop]] means gamepad selection only looks within the selection group and does not move outside of the group from the selection behavior direction.

## Events

### SelectionChanged

```lua
GuiBase2d.SelectionChanged(amISelected: boolean, previousSelection: GuiObject, newSelection: GuiObject)
```

**Capabilities:** UI

This event fires when the gamepad selection moves to, leaves, or changes within the connected [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] or any descendant [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]]. When the selection highlight moves to a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]], the event bubbles from that [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] to all of its ancestors, informing them that the selection has changed/entered/exited to a [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] in their descendant tree.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `amISelected` | boolean |  | True if the new selection matches the attached GuiBase2d. |
| `previousSelection` | [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] |  | The [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] that was previously selected before the selection changed, or nil if nothing was selected. |
| `newSelection` | [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] |  | The [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] that is now selected after the selection changed, or nil if nothing is selected. |

---
*Source: [GuiBase2d](https://create.roblox.com/docs/reference/engine/classes/GuiBase2d) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
