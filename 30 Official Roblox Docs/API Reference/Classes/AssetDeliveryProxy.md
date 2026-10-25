---
title: "AssetDeliveryProxy"
description: "Runs a local HTTP server that serves assets to real devices."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AssetDeliveryProxy"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Runs a local HTTP server that serves assets to real devices.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Internal service for remote asset delivery; not intended for game scripts. It backs the remote hot-reload workflow: [[30 Official Roblox Docs/API Reference/Classes/IncrementalPatchBuilder|IncrementalPatchBuilder]] builds a signed patch and this proxy serves it, along with any overridden assets, over HTTP to the connected device. The server runs on its own thread and is controlled through [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy#StartServer|AssetDeliveryProxy.StartServer]], [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy#Interface|AssetDeliveryProxy.Interface]], and [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy#Port|AssetDeliveryProxy.Port]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy#Interface\|Interface]] | string | The network interface address that the asset-delivery HTTP server binds to. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy#Port\|Port]] | int | The TCP port that the asset-delivery HTTP server listens on. |
| [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy#StartServer\|StartServer]] | boolean | Controls whether the asset-delivery HTTP server is running. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Interface

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Sets the local network interface (address) that the proxy's HTTP server binds to when it starts. Defaults to an empty string. Assigning a value schedules the server to restart, but a new interface only takes effect while the server is running — that is, once [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy#StartServer|AssetDeliveryProxy.StartServer]] is `true` (it defaults to `false`).

### Port

**Type:** int

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

The TCP port the proxy's HTTP server listens on. Defaults to `0`, which tells the server to pick an available port automatically. While the server is running, reading this property returns the port actually in use rather than the configured value. A new port only takes effect when the server (re)starts via [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy#StartServer|AssetDeliveryProxy.StartServer]] (defaults to `false`).

### StartServer

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

Controls whether the proxy's HTTP server is running. Setting it to `true` schedules the server to start; setting it to `false` stops it. Defaults to `false`, so the server is off until you enable it. Because the server only (re)starts while this is `true`, changes to [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy#Interface|AssetDeliveryProxy.Interface]] and [[30 Official Roblox Docs/API Reference/Classes/AssetDeliveryProxy#Port|AssetDeliveryProxy.Port]] take effect only when this property is `true`.

---
*Source: [AssetDeliveryProxy](https://create.roblox.com/docs/reference/engine/classes/AssetDeliveryProxy) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
