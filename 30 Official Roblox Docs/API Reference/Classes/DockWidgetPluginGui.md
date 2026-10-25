---
title: "DockWidgetPluginGui"
description: "A `PluginGui` that displays its contents in a dockable, resizable Roblox Studio window."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/DockWidgetPluginGui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] that displays its contents in a dockable, resizable Roblox Studio window.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] → [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]] → [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

**DockWidgetPluginGui** is a [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]] that displays its contents inside a dockable Roblox Studio window. It is used to create widgets similar to the built-in **Animation Editor** and **Terrain Tools**.

This GUI can be created using [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateDockWidgetPluginGuiAsync|Plugin:CreateDockWidgetPluginGuiAsync()]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui#HostWidgetWasRestored\|HostWidgetWasRestored]] | boolean | Describes whether the previous state of this DockWidgetPluginGui was restored when it was created. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/PluginGui|PluginGui]], [[30 Official Roblox Docs/API Reference/Classes/LayerCollector|LayerCollector]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d|GuiBase2d]], [[30 Official Roblox Docs/API Reference/Classes/GuiBase|GuiBase]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### HostWidgetWasRestored

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** UI · **Tags:** `ReadOnly`, `NotReplicated`

Describes whether the previous state of this [[30 Official Roblox Docs/API Reference/Classes/DockWidgetPluginGui|DockWidgetPluginGui]] was restored when it was created.

---
*Source: [DockWidgetPluginGui](https://create.roblox.com/docs/reference/engine/classes/DockWidgetPluginGui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
