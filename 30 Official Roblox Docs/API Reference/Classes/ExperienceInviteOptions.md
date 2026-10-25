---
title: "ExperienceInviteOptions"
description: "Used to customize a player invite prompt."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ExperienceInviteOptions"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Used to customize a player invite prompt.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotReplicated`

## Description

Used to customize a [[30 Official Roblox Docs/Production/Promotion/Player invite prompts|player invite prompt]], such as to customize the prompt message, target a specific friend, or include launch data in the invite.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions#InviteMessageId\|InviteMessageId]] | string | Asset ID that maps to a **Notification** asset type. |
| [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions#InviteUser\|InviteUser]] | int64 | Roblox [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] of the specific friend to invite. |
| [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions#LaunchData\|LaunchData]] | string | Used to set a parameter in [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData\|Player:GetJoinData()]] when a friend joins from the invite notification. |
| [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions#PromptMessage\|PromptMessage]] | string | Custom text shown on the invite prompt for the sending player. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### InviteMessageId

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Social

Asset ID that maps to a **Notification** asset type. This asset is used to store/localize a custom string for the invite notification that friends receive. See [[30 Official Roblox Docs/Production/Promotion/Player invite prompts|Setting Notification Options]] for details.

### InviteUser

**Type:** int64

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Social

Roblox [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserId]] of the specific friend to invite; if not provided, the player will be prompted to pick from a list of friends.

### LaunchData

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Social

Used to set a parameter in [[30 Official Roblox Docs/API Reference/Classes/Player#GetJoinData|Player:GetJoinData()]] when a friend joins from the invite notification; maximum of 200 characters. See [[30 Official Roblox Docs/Production/Promotion/Player invite prompts#Include launch data|Include launch data]] for a usage example.

### PromptMessage

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Social

Custom text shown on the invite prompt for the sending player, for example "Ask your friends to join the adventure!" for a multi-friend invite prompt, or "Invite this friend to join the adventure!" for a specific friend invite prompt.

---
*Source: [ExperienceInviteOptions](https://create.roblox.com/docs/reference/engine/classes/ExperienceInviteOptions) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
