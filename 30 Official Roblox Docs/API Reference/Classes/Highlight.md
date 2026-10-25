---
title: "Highlight"
description: "A visual effect which you can use to call attention to a specific object within an experience."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Highlight"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A visual effect which you can use to call attention to a specific object within an experience.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instance is a visual effect which you can use to call attention to a specific object within an experience. Every highlight effect has a silhouette **outline** that surrounds the object and a solid overlay **interior** that displays over the object. You can customize both of these components independently to modify the highlight's visual appearance.

| | | |
| --- | --- | --- |
| *(image in the full Top G Vault)* *Base object* | *(image in the full Top G Vault)* *White outline, 50% red interior* | *(image in the full Top G Vault)* *Yellow outline, black interior* |

Useful applications of the highlight effect include:

- Providing visual feedback that an object is important and/or interactable.
- Making distant objects visible through objects that are closer to the user.
- Indicating the current position and status of other characters.

#### Limitations

As a performance limit, Studio only displays 255 simultaneous [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instances on the client at a time. If you exceed this limit, the additional instances are silently ignored. Note that while a [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] with [[30 Official Roblox Docs/API Reference/Classes/Highlight#Enabled|Enabled]] set to `false` doesn't display, it still takes one of the 255 available slots, so if you plan to permanently disable a [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instance, it's best to delete it rather than disable it.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Highlight#Adornee\|Adornee]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] that the [[30 Official Roblox Docs/API Reference/Classes/Highlight\|Highlight]] is applied to. |
| [[30 Official Roblox Docs/API Reference/Classes/Highlight#DepthMode\|DepthMode]] | [[30 Official Roblox Docs/API Reference/Enums/HighlightDepthMode\|HighlightDepthMode]] | Controls how the [[30 Official Roblox Docs/API Reference/Classes/Highlight\|Highlight]] effect displays with respect to other objects in the world. |
| [[30 Official Roblox Docs/API Reference/Classes/Highlight#Enabled\|Enabled]] | boolean | Sets whether or not the highlight is enabled. |
| [[30 Official Roblox Docs/API Reference/Classes/Highlight#FillColor\|FillColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] value of the highlight's interior. |
| [[30 Official Roblox Docs/API Reference/Classes/Highlight#FillTransparency\|FillTransparency]] | float | Sets the transparency of the highlight's interior. |
| [[30 Official Roblox Docs/API Reference/Classes/Highlight#OutlineColor\|OutlineColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] value of the highlight's outline. |
| [[30 Official Roblox Docs/API Reference/Classes/Highlight#OutlineTransparency\|OutlineTransparency]] | float | Sets the transparency of the highlight's outline. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Adornee

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

The [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] for which to apply the [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]], used to apply the effect to an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] outside of a child/parent relationship.

### DepthMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/HighlightDepthMode|HighlightDepthMode]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

Controls how the [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] effect displays with respect to other objects in the world. You can set this property to one of the following options:

- [[30 Official Roblox Docs/API Reference/Enums/HighlightDepthMode|AlwaysOnTop]] — Allows the highlight to display regardless if there are objects between the camera and the highlighted object. This means the viewer is always able to see the highlight regardless of what is between the highlighted object and the camera.

- [[30 Official Roblox Docs/API Reference/Enums/HighlightDepthMode|Occluded]] — Hides the highlight if there are objects between the camera and the highlighted object. This means the viewer is only able to see the object if there are no obstructing objects between the highlighted object and the camera's view.

| | |
| --- | --- |
| *(image in the full Top G Vault)* *DepthMode = AlwaysOnTop* | *(image in the full Top G Vault)* *DepthMode = Occluded* |

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets whether or not the highlight is enabled. This does not impact performance, but disabled [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instances will still take one of the 255 available slots. If you plan to permanently disable a [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instance, it's best to delete it rather than disable it.

### FillColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets the [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] value of the highlight's interior.

| | | |
| --- | --- | --- |
| *(image in the full Top G Vault)* *FillColor = [255, 100, 50]* | *(image in the full Top G Vault)* *FillColor = [0, 255, 125]* | *(image in the full Top G Vault)* *FillColor = [75, 150, 255]* |

### FillTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets the visibility of the highlight's interior to any value between the default value of **0** (opaque) and **1** (invisible). You can use this property to determine how much of the object's existing color you want viewers to see.

| | | |
| --- | --- | --- |
| *(image in the full Top G Vault)* *FillTransparency = 0* | *(image in the full Top G Vault)* *FillTransparency = 0.5* | *(image in the full Top G Vault)* *FillTransparency = 1* |

### OutlineColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets the [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] value of the highlight's outline.

| | | |
| --- | --- | --- |
| *(image in the full Top G Vault)* *OutlineColor = [255, 100, 50]* | *(image in the full Top G Vault)* *OutlineColor = [0, 255, 125]* | *(image in the full Top G Vault)* *OutlineColor = [75, 150, 255]* |

### OutlineTransparency

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets the visibility of the highlight's outline to a value between **0** (opaque) and **1** (transparent).

| | | |
| --- | --- | --- |
| *(image in the full Top G Vault)* *OutlineTransparency = 0* | *(image in the full Top G Vault)* *OutlineTransparency = 1* |  |

---
*Source: [Highlight](https://create.roblox.com/docs/reference/engine/classes/Highlight) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
