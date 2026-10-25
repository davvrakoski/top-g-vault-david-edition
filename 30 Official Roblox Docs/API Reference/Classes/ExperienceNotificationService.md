---
title: "ExperienceNotificationService"
description: "Service containing methods to validate users and prompt them to enable experience notifications."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ExperienceNotificationService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Service containing methods to validate users and prompt them to enable experience notifications.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

[[30 Official Roblox Docs/Production/Promotion/Experience notifications|Experience notifications]] are a way for 13+ users to keep up with their favorite experiences through timely, personalized notifications. This service contains methods to validate users and prompt them to enable notifications.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ExperienceNotificationService#CanPromptOptInAsync\|CanPromptOptInAsync()]] | boolean | Indicates whether the local player can be prompted to enable notifications. |
| [[30 Official Roblox Docs/API Reference/Classes/ExperienceNotificationService#PromptOptIn\|PromptOptIn()]] | () | Shows an in-experience prompt for the local player to enable notifications. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ExperienceNotificationService#OptInPromptClosed\|OptInPromptClosed]] |  | Fires when the local player closes the prompt. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### CanPromptOptInAsync

```lua
ExperienceNotificationService:CanPromptOptInAsync(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Players, Social · **Tags:** `Yields`

[[30 Official Roblox Docs/API Reference/Classes/ExperienceNotificationService#CanPromptOptInAsync|CanPromptOptInAsync()]] returns `true` if the local player can be prompted to enable notifications. You should always use the result of this method before calling [[30 Official Roblox Docs/API Reference/Classes/ExperienceNotificationService#PromptOptIn|PromptOptIn()]] since the ability to be prompted depends on various factors like the player's age or whether they've already enabled notifications for your experience.

This method always infers the **local** player ([[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]]) and it can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Client]]. It should also be called in a [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] since it's an asynchronous network call that may occasionally fail.

See [[30 Official Roblox Docs/Production/Promotion/Experience notifications|Experience notifications]] for more details on implementing and customizing notifications, using launch data, and more.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the local player can be prompted to enable notifications. |

*Code samples for this member (`ExperienceNotificationService1`) are published on the source page; their code is not part of the open-source repo.*

### PromptOptIn

```lua
ExperienceNotificationService:PromptOptIn(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Players, Social

[[30 Official Roblox Docs/API Reference/Classes/ExperienceNotificationService#PromptOptIn|PromptOptIn()]] prompts the local player to enable notifications through an in-experience modal. You should always use the result of [[30 Official Roblox Docs/API Reference/Classes/ExperienceNotificationService#CanPromptOptInAsync|CanPromptOptInAsync()]] before calling this method since the ability to be prompted depends on various factors like the player's age or whether they've already enabled notifications for your experience.

This method always infers the **local** player ([[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|Players.LocalPlayer]]) and it can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Client]].

See [[30 Official Roblox Docs/Production/Promotion/Experience notifications|Experience notifications]] for more details on implementing and customizing notifications, using launch data, and more.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`ExperienceNotificationService1`) are published on the source page; their code is not part of the open-source repo.*

## Events

### OptInPromptClosed

```lua
ExperienceNotificationService.OptInPromptClosed()
```

**Capabilities:** Players, Social

This event fires when the local player closes a prompt that was displayed through [[30 Official Roblox Docs/API Reference/Classes/ExperienceNotificationService#PromptOptIn|PromptOptIn()]]. It can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Client]].

See [[30 Official Roblox Docs/Production/Promotion/Experience notifications|Experience notifications]] for more details on implementing and customizing notifications, using launch data, and more.

*Code samples for this member (`ExperienceNotificationService1`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [ExperienceNotificationService](https://create.roblox.com/docs/reference/engine/classes/ExperienceNotificationService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
