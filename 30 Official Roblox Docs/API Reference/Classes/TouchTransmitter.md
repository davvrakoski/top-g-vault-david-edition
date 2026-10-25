---
title: "TouchTransmitter"
description: "An internal object used by networking and replication code to transmit `BasePart.Touched` and `BasePart.TouchEnded` events."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TouchTransmitter"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*An internal object used by networking and replication code to transmit [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|BasePart.Touched]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#TouchEnded|BasePart.TouchEnded]] events.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotBrowsable`

## Description

An internal object used by networking and replication code to transmit [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|BasePart.Touched]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#TouchEnded|BasePart.TouchEnded]] events.

The TouchTransmitter object named 'TouchInterest' is created and parented to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] when the [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|BasePart.Touched]] or [[30 Official Roblox Docs/API Reference/Classes/BasePart#TouchEnded|BasePart.TouchEnded]] events are listened (connected) to.

Removing the TouchTransmitter will prevent the touched events from working. The TouchTransmitter object can also be removed exclusively on the client. This will prevent collisions from models the client has network ownership of (such as the player's character) from registering.

Note, in almost all circumstances developers should disconnect the connection using [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection#Disconnect|RBXScriptConnection:Disconnect()]] method rather than removing the TouchTransmitter. Otherwise the connection will not be cleaned up which can cause performance issues over time.

---
*Source: [TouchTransmitter](https://create.roblox.com/docs/reference/engine/classes/TouchTransmitter) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
