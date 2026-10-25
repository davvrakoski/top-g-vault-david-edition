---
title: "AdPortal"
description: "A portal that teleports players to a sponsored experience as part of immersive ads."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AdPortal"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A portal that teleports players to a sponsored experience as part of immersive ads.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

An `AdPortal` is an instance that must be parented to a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] — attempting to parent it elsewhere throws an error. When added to the data model, it registers itself with [[30 Official Roblox Docs/API Reference/Classes/AdService|AdService]] to be served portal ads on rotation, and it uses a child [[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]] to display the current ad's banner image and destination label above the portal.

When the local player's character touches the parent part, the portal teleports that player to the sponsored experience associated with the currently served ad. The portal only teleports while it is valid and has been served an ad with a destination place (see [[30 Official Roblox Docs/API Reference/Classes/AdPortal#Status|AdPortal.Status]]).

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AdPortal#PortalInvalidReason\|PortalInvalidReason]] | string | A creator-facing message explaining why the portal is currently invalid, if it is. |
| [[30 Official Roblox Docs/API Reference/Classes/AdPortal#Status\|Status]] | [[30 Official Roblox Docs/API Reference/Enums/AdUnitStatus\|AdUnitStatus]] | Indicates whether the portal is currently active and able to teleport players. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### PortalInvalidReason

**Type:** string

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** false/false · **Capabilities:** Monetization · **Tags:** `ReadOnly`, `NotReplicated`, `NotScriptable`

Holds a human-readable explanation of why the [[30 Official Roblox Docs/API Reference/Classes/AdPortal|AdPortal]] is not in a valid, servable state. When the portal passes validation the value is an empty string; when validation fails it is populated with the specific reason reported by the portal's validator, such as an unsuitable parent or a misconfigured child [[30 Official Roblox Docs/API Reference/Classes/AdGui|AdGui]].

This property is read-only and defaults to an empty string (`""`). It is intended for surfacing configuration problems to creators in Studio.

### Status

**Type:** [[30 Official Roblox Docs/API Reference/Enums/AdUnitStatus|AdUnitStatus]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/false · **Capabilities:** Monetization · **Tags:** `ReadOnly`, `NotReplicated`

Reports the portal's current [[30 Official Roblox Docs/API Reference/Enums/AdUnitStatus|Enum.AdUnitStatus]]. The value is [[30 Official Roblox Docs/API Reference/Enums/AdUnitStatus|Enum.AdUnitStatus.Active]] only when the portal has passed validation and has been served an ad with a valid destination place; in every other case it is [[30 Official Roblox Docs/API Reference/Enums/AdUnitStatus|Enum.AdUnitStatus.Inactive]].

A newly created portal reports [[30 Official Roblox Docs/API Reference/Enums/AdUnitStatus|Enum.AdUnitStatus.Inactive]], because its destination place is unset (`0`) until the ad service fills the portal with an ad — the portal cannot become [[30 Official Roblox Docs/API Reference/Enums/AdUnitStatus|Enum.AdUnitStatus.Active]], and therefore cannot teleport, until that happens. This property is read-only.

---
*Source: [AdPortal](https://create.roblox.com/docs/reference/engine/classes/AdPortal) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
