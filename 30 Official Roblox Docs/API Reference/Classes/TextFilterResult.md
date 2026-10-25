---
title: "TextFilterResult"
description: "Represents the result of a call to `TextService:FilterStringAsync()`, used to distribute a filtered string accordingly."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TextFilterResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Represents the result of a call to [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterStringAsync|TextService:FilterStringAsync()]], used to distribute a filtered string accordingly.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `NotReplicated`

## Description

Represents the result of a call to [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterStringAsync|TextService:FilterStringAsync()]]. Used to distribute a filtered string accordingly.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult#GetChatForUserAsync\|GetChatForUserAsync()]] | string | **Deprecated.** Returns the text in a properly filtered manner for the specified [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]]. |
| [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult#GetNonChatStringForBroadcastAsync\|GetNonChatStringForBroadcastAsync()]] | string | Returns the text in a properly filtered manner for all users. |
| [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult#GetNonChatStringForUserAsync\|GetNonChatStringForUserAsync()]] | string | Returns the text in a properly filtered manner for the specified [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] based on age and other details. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetChatForUserAsync

> [!warning] Deprecated
> This method is deprecated and returns an empty string. Text filtering
> pertaining to chat should be done through `Class.TextChatService`, and
> experiences that do not properly filter player-generated chat text may be
> subject to moderation.

```lua
TextFilterResult:GetChatForUserAsync(toUserId: int64): string
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Yields`, `Deprecated`

This method returns the text in a properly filtered manner for the specified [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]] using the least restrictive filtering appropriate for that user, with [[30 Official Roblox Docs/API Reference/Classes/Chat|Chat]] privacy settings of both users enforced. This should be used in the context of chats between players, although there are some other cases where text filtering is required.

The returned string should only be shown to the target user, as it might not be appropriate for all users.

If this method throws an error, the string should **not** be displayed to the user. Cases for error include:

- The two users are not allowed to chat, for example if [[30 Official Roblox Docs/API Reference/Classes/Chat#CanUserChatAsync|Chat:CanUserChatAsync()]] would return `false` for the given sender and receiver.
- The user with the ID `toUserId` is not online on the current server.

This function will return immediately in most cases, although it will yield if the target user has just joined the server and their filtering info is not yet loaded.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `toUserId` | int64 |  | [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the user being chatted. |

**Returns**

| Type | Description |
| --- | --- |
| string | Filtered text string. |

### GetNonChatStringForBroadcastAsync

```lua
TextFilterResult:GetNonChatStringForBroadcastAsync(): string
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Yields`

Returns the text in a properly filtered manner for all users. This should be used in the context of non-chat text that every user can see, such as for a dialog that lets a user write a message on a sign, visible to all users on the server even after the author has left.

**Returns**

| Type | Description |
| --- | --- |
| string | Filtered text string. |

### GetNonChatStringForUserAsync

```lua
TextFilterResult:GetNonChatStringForUserAsync(toUserId: int64): string
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Yields`

Returns the text in a properly filtered manner for the specified [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|Player.UserId]] based on age and other details. This should be used in the context of non-chat text that one specific user can see, such as the name of a pet.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `toUserId` | int64 |  | [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the user intended to see/receive the text. |

**Returns**

| Type | Description |
| --- | --- |
| string | Filtered text string. |

---
*Source: [TextFilterResult](https://create.roblox.com/docs/reference/engine/classes/TextFilterResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
