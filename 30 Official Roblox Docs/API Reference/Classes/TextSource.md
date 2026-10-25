---
title: "TextSource"
description: "Represents a speaker in a `TextChannel`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TextSource"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents a speaker in a [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`

## Description

Represents a speaker in a [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]].

[[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSources]] provide details on permissions users have in [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannels]]. There may be multiple [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSources]] for a user if that user belongs in multiple [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannels]].

Create [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSources]] with [[30 Official Roblox Docs/API Reference/Classes/TextChannel#AddUserAsync|TextChannel:AddUserAsync()]], which adds a [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] to the [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]] as a descendant.

Remove [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSources]] by calling [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|TextSource.Destroy]].

Name of a [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] is the [[30 Official Roblox Docs/API Reference/Classes/Player#DisplayName|Player.DisplayName]] of the user associated with the [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]] via [[30 Official Roblox Docs/API Reference/Classes/TextSource#UserId|TextSource.UserId]].

To learn more about using TextSources, see [[30 Official Roblox Docs/Chat/Text chat overview|In-Experience Text Chat]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextSource#CanSend\|CanSend]] | boolean | Determines whether the user can send messages to the [[30 Official Roblox Docs/API Reference/Classes/TextChannel\|TextChannel]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextSource#UserId\|UserId]] | int64 | UserId of the user represented by the [[30 Official Roblox Docs/API Reference/Classes/TextSource\|TextSource]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### CanSend

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Chat

Determines whether the user can send messages to the [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]].

If `false`, user can only read messages in the [[30 Official Roblox Docs/API Reference/Classes/TextChannel|TextChannel]].

### UserId

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** Chat · **Tags:** `ReadOnly`, `NotReplicated`

UserId of the user represented by the [[30 Official Roblox Docs/API Reference/Classes/TextSource|TextSource]].

Support for non-user entities may be added in the future via passing in negative numbers for this property.

---
*Source: [TextSource](https://create.roblox.com/docs/reference/engine/classes/TextSource) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
