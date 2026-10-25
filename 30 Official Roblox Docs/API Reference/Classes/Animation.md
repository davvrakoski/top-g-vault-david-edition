---
title: "Animation"
description: "References an animation asset which can be loaded by an `AnimationController`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Animation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*References an animation asset which can be loaded by an [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation

## Description

An object that references an animation asset ([[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|AnimationId]]) which can be loaded by an [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]].

#### Loading an Animation on Client or Server

In order for [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] to replicate correctly, it's important to know when they should be loaded on the client or on the server:

- If an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] is a descendant of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] or [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]] in a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]], animations started on that player's client will be replicated to the server and other clients.

- If the [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] is **not** a descendant of a player character, its animations must be loaded and started on the server to replicate.

The [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] object must be initially created on the server and replicated to clients for animation replication to work at all. If an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] is created locally, then [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] loaded with that [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] will not replicate.

See also [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]] and [[30 Official Roblox Docs/Animation/Use animations|Using Animations]] to learn how to create and add pre-built or custom animations to your game.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationContent\|AnimationContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | A reference to the animation asset associated with this [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId\|AnimationId]] | ContentId | Asset ID of the animation an [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] object is referencing. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AnimationContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]-typed reference to the animation asset for this [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]]. It is the underlying storage for [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|AnimationId]] and accepts animation asset URIs; setting either property updates the other.

Requires `Animation` security and is not accessible from regular scripts. For most use cases, use [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|AnimationId]] instead, which provides unrestricted access to the same animation reference as a string content ID.

### AnimationId

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation

This property is the asset ID of the animation an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object is referencing. Once an animation has been created and uploaded to Roblox, the ID can be copied from the [Creator Dashboard](https://create.roblox.com/dashboard/creations?activeTab=Animation).

Note that the animation will need to be loaded onto an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] in order to play it.

---
*Source: [Animation](https://create.roblox.com/docs/reference/engine/classes/Animation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
