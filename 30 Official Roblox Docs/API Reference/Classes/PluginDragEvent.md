---
title: "PluginDragEvent"
description: "Provides information about an in-progress drag for the drag events that plugins can respond to."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/PluginDragEvent"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Provides information about an in-progress drag for the drag events that plugins can respond to.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

[[30 Official Roblox Docs/API Reference/Classes/PluginDragEvent|PluginDragEvent]] provides information about a drag-and-drop operation that a plugin can respond to. An instance of it is passed as the argument to the [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] drag events ([[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragEntered|PluginGui.PluginDragEntered]], [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragMoved|PluginGui.PluginDragMoved]], [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragLeft|PluginGui.PluginDragLeft]], and [[30 Official Roblox Docs/API Reference/Classes/PluginGui#PluginDragDropped|PluginGui.PluginDragDropped]]) which fire as a drag started with [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag|Plugin:StartDrag()]] moves over, into, out of, or is released on a plugin widget.

It carries the [[30 Official Roblox Docs/API Reference/Classes/PluginDragEvent#Sender|Sender]], [[30 Official Roblox Docs/API Reference/Classes/PluginDragEvent#MimeType|MimeType]], and [[30 Official Roblox Docs/API Reference/Classes/PluginDragEvent#Data|Data]] originally supplied to [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag|Plugin:StartDrag()]], along with the [[30 Official Roblox Docs/API Reference/Classes/PluginDragEvent#Position|Position]] of the cursor within the widget receiving the drag.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/PluginDragEvent#Data\|Data]] | string | The data payload being transferred by the drag. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginDragEvent#MimeType\|MimeType]] | string | The MIME type describing the format of the dragged data, such as `text/plain`. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginDragEvent#Position\|Position]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The position of the drag relative to the widget receiving it. |
| [[30 Official Roblox Docs/API Reference/Classes/PluginDragEvent#Sender\|Sender]] | string | A caller-defined string identifying the source of the drag. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Data

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

The data being transferred by the drag, corresponding to the `Data` value passed to [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag|Plugin:StartDrag()]] when the drag began. This property is read-only and defaults to an empty string.

### MimeType

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

Identifies the format of [[30 Official Roblox Docs/API Reference/Classes/PluginDragEvent#Data|PluginDragEvent.Data]], corresponding to the `MimeType` value passed to [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag|Plugin:StartDrag()]] when the drag began. This property is read-only and defaults to an empty string.

### Position

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

The position, in pixels, of the mouse cursor relative to the [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] widget receiving the drag, updated as the drag moves. This property is read-only and defaults to `(0, 0)`.

### Sender

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

A caller-defined string used to identify where the drag originated, corresponding to the `Sender` value passed to [[30 Official Roblox Docs/API Reference/Classes/Plugin#StartDrag|Plugin:StartDrag()]] when the drag began. This property is read-only and defaults to an empty string.

---
*Source: [PluginDragEvent](https://create.roblox.com/docs/reference/engine/classes/PluginDragEvent) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
