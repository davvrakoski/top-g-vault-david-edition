---
title: "Highlighting objects"
description: "Highlighting objects lets you call attention to specific objects within your game."
area: "30 Official Roblox Docs"
cluster: "Effects"
source: "https://create.roblox.com/docs/effects/highlighting"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Highlighting objects lets you call attention to specific objects within your game.*

The [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instance is a visual effect which you can use to call attention to a specific object within a game. Every highlight effect has a silhouette **outline** that surrounds the object and a solid overlay
**interior** that displays over the object. You can customize both of these components independently to modify the highlight's visual appearance.

*(image in the full Top G Vault)*

*Base object*

*(image in the full Top G Vault)*

*Yellow outline and black interior*

*(image in the full Top G Vault)*

*Black outline and yellow interior*

Useful applications of the highlight effect include:

- Providing visual feedback that an object is important and/or interactable.
- Making distant objects visible through objects that are closer to the user.
- Indicating the current position and status of other characters.

## Add highlights

As a performance limit, Studio only displays 255 simultaneous [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instances on the client-side at a time. If you add more than this limit, the additional [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instances are silently ignored.

Note also that highlights on low-end devices may be more pixelated but will otherwise look the same as on other devices with any combination of settings.

### Parent to objects

To add a highlight effect to an object, you can parent a new [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] directly to the object.

1. In the **Explorer** window, hover over either a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] or a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], then click the ⊕ button. A contextual menu displays.
2. From the menu, insert a **Highlight**. The highlight displays on the object with its default property values that create a white outline and a red tint overlay.

   *(image in the full Top G Vault)*

### Set the adornee

Alternatively, you can place the [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instance outside of a child/parent relationship either within the workspace, [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]], [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]], [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]], or [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]], then set its [[30 Official Roblox Docs/API Reference/Classes/Highlight#Adornee|Adornee]] property to the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] or [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that you want to highlight.

## Customize highlights

You can change the properties of a [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instance to create interesting visual effects that properly highlight objects in theme with your game.

### OutlineColor

The [[30 Official Roblox Docs/API Reference/Classes/Highlight#OutlineColor|OutlineColor]] property sets the [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] value of the highlight's outline.

*(image in the full Top G Vault)*

*OutlineColor = [255, 100, 50]*

*(image in the full Top G Vault)*

*OutlineColor = [0, 255, 125]*

*(image in the full Top G Vault)*

*OutlineColor = [75, 150, 255]*

### OutlineTransparency

The [[30 Official Roblox Docs/API Reference/Classes/Highlight#OutlineTransparency|OutlineTransparency]] property sets the visibility of the highlight's outline to any value between the default value of **0** (opaque) and **1** (invisible).

*(image in the full Top G Vault)*

*OutlineTransparency = 0*

*(image in the full Top G Vault)*

*OutlineTransparency = 1*

### FillColor

The [[30 Official Roblox Docs/API Reference/Classes/Highlight#FillColor|FillColor]] property sets the [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]] value of the highlight's interior.

*(image in the full Top G Vault)*

*FillColor = [255, 100, 50]*

*(image in the full Top G Vault)*

*FillColor = [0, 255, 125]*

*(image in the full Top G Vault)*

*FillColor = [75, 150, 255]*

### FillTransparency

The [[30 Official Roblox Docs/API Reference/Classes/Highlight#FillTransparency|FillTransparency]] property sets the visibility of the highlight's interior to any value between the default value of **0** (opaque) and **1** (invisible). You can use this property to determine how much of the object's existing color you want viewers to see.

*(image in the full Top G Vault)*

*FillTransparency = 0*

*(image in the full Top G Vault)*

*FillTransparency = 0.5*

*(image in the full Top G Vault)*

*FillTransparency = 1*

### DepthMode

The [[30 Official Roblox Docs/API Reference/Classes/Highlight#DepthMode|DepthMode]] property controls how the effect displays with respect to other objects in the world.

- [[30 Official Roblox Docs/API Reference/Enums/HighlightDepthMode|AlwaysOnTop]] — Allows the highlight to display regardless if there are objects between the camera and the highlighted object. This means the viewer is always able to see the highlight regardless of what is between the highlighted object and the camera.

- [[30 Official Roblox Docs/API Reference/Enums/HighlightDepthMode|Occluded]] — Hides the highlight if there are objects between the camera and the highlighted object. This means the viewer is only able to see the object if there are no obstructing objects between the highlighted object and the camera's view.

#### AlwaysOnTop

*(image in the full Top G Vault)*

#### Occluded

*(image in the full Top G Vault)*

### Enabled

The [[30 Official Roblox Docs/API Reference/Classes/Highlight#Enabled|Enabled]] property allows you to quickly enable or disable the highlight **without any impact on performance**.

> [!warning]
> While a disabled [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] doesn't display, it still takes one of the 255 available [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] slots. If you plan to permanently disable a [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instance, it's best to delete the highlight rather than disable it.

## Performance tips

While you have a lot of options to customize [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instances, the following tips are recommended to increase your game's performance on all devices:

- Adding or removing a [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] can cause a geometry rebuilding step that might lead to performance spikes and extra draw calls. If you want to change a [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instance's appearance or temporarily hide/display it on an object, it's best to customize the properties of the [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instance directly, as changing any property of the [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instance is lightweight and doesn't impact performance.

- Roblox draws objects in a back to front order, which can cause problems if you embed objects with a child [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] inside other objects that also have children [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instances. For this reason, it's best to keep objects with [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instances outside of a parent/child relationship with other objects with [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] instances.

- The first [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] rendered on the screen incurs most of the performance cost (up to 1 millisecond of GPU time on mobile devices). For additional highlights beyond the first, you should not see a significant performance impact on any platform.

- On mobile devices, highlights are more costly on performance when they cover more of the screen. On other platforms, highlights have the same performance cost regardless of their screen coverage.

- On all platforms, highlights that are not visible on the screen (whether disabled or fully transparent) incur no performance cost.

---
*Source: [Highlighting objects](https://create.roblox.com/docs/effects/highlighting) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
