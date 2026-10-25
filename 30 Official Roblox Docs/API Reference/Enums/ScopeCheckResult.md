---
title: "ScopeCheckResult"
description: "Indicates the outcome of an `ExperienceAuthService` scope-authorization request."
api_type: enum
aliases: ["Enum.ScopeCheckResult"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ScopeCheckResult"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Indicates the outcome of an `ExperienceAuthService` scope-authorization request.*

## Description

Returned by an `ExperienceAuthService` scope-authorization callback to indicate whether the player granted, denied, or failed to complete a permission-consent flow. Callers such as [[30 Official Roblox Docs/API Reference/Classes/AssetService|AssetService]] and [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService|AvatarCreationService]] inspect this value to decide whether to proceed with the authorized action or surface an appropriate error to the developer.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `ConsentAccepted` | 0 | The player accepted the authorization prompt and a valid token was issued for the requested scopes. |
| `InvalidScopes` | 1 | The requested scopes are not recognized or are not permitted for the calling context. |
| `Timeout` | 2 | The scope-check request exceeded the configured timeout period before the player responded. |
| `NoUserInput` | 3 | The authorization prompt was dismissed without any explicit player action, such as when the player disconnects or the UI is closed without a response. |
| `BackendError` | 4 | The Roblox backend returned an error or unexpected HTTP status when exchanging the consent grant for an authorization token. |
| `UnexpectedError` | 5 | An unexpected error occurred that is not covered by a more specific result code. |
| `InvalidArgument` | 6 | One or more arguments passed to the scope-check call were invalid, such as an empty scope list, a null player instance, or a player who is no longer in the experience. |
| `ConsentDenied` | 7 | The player explicitly declined the authorization prompt. |

---
*Source: [ScopeCheckResult](https://create.roblox.com/docs/reference/engine/enums/ScopeCheckResult) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
