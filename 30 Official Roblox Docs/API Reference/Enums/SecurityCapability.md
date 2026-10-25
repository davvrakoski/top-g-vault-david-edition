---
title: "SecurityCapability"
description: "Identifies a specific permission capability that a sandboxed script container may grant or restrict."
api_type: enum
aliases: ["Enum.SecurityCapability"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SecurityCapability"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Identifies a specific permission capability that a sandboxed script container may grant or restrict.*

## Description

`SecurityCapability` is a bitmask-based permission system that controls which engine APIs and Luau language features are accessible to scripts running inside sandboxed containers. Each value represents one capability bit that can be granted or restricted.

When an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] has its [[30 Official Roblox Docs/API Reference/Classes/Instance#Sandboxed|Sandboxed]] property enabled, the engine intersects the capabilities of all ancestor containers to determine the effective permission set of any script that executes within that container. API members, classes, and Luau built-ins are each annotated with one or more `SecurityCapability` values; a script's thread must hold every required capability to call them.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `RunClientScript` | 0 | Indicates that a script container is permitted to execute scripts on the client ([[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScript]]). |
| `RunServerScript` | 1 | Indicates that a script container is permitted to execute scripts on the server ([[30 Official Roblox Docs/API Reference/Classes/Script\|Script]]). |
| `AccessOutsideWrite` | 2 | Grants a script read-write access to instances that live outside its sandboxed container. |
| `AssetRequire` | 3 | **Deprecated.** Deprecated. Use [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability\|Enum.SecurityCapability.LoadUnownedAsset]] instead. |
| `LoadString` | 4 | Allows a script to use the `loadstring()` Luau built-in to compile and execute a string as code. |
| `ScriptGlobals` | 5 | Allows a script to access the `shared` and `_G` shared global variable tables. |
| `CreateInstances` | 6 | Allows a script to create new `Instance` objects using `Instance.new()`. |
| `Basic` | 7 | Guards access to a broad set of general-purpose engine APIs that do not belong to a more specific capability category. |
| `Audio` | 8 | Guards access to audio engine APIs such as [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]], [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]], and related classes. |
| `DataStore` | 9 | Guards access to data store APIs such as [[30 Official Roblox Docs/API Reference/Classes/DataStoreService\|DataStoreService]] and its associated objects. |
| `Network` | 10 | Guards access to low-level networking APIs such as [[30 Official Roblox Docs/API Reference/Classes/HttpService\|HttpService]]. |
| `Physics` | 11 | Guards access to physics engine APIs such as [[30 Official Roblox Docs/API Reference/Classes/Constraint\|Constraint]] classes and [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] physics properties. |
| `UI` | 12 | Guards access to UI engine APIs such as [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGui]], [[30 Official Roblox Docs/API Reference/Classes/Frame\|Frame]], and other [[30 Official Roblox Docs/API Reference/Classes/GuiObject\|GuiObject]] classes. |
| `CSG` | 13 | Guards access to Constructive Solid Geometry (CSG) APIs such as [[30 Official Roblox Docs/API Reference/Classes/UnionOperation\|UnionOperation]] and [[30 Official Roblox Docs/API Reference/Classes/NegateOperation\|NegateOperation]]. |
| `Chat` | 14 | Guards access to chat engine APIs such as [[30 Official Roblox Docs/API Reference/Classes/TextChatService\|TextChatService]] and related chat classes. |
| `Animation` | 15 | Guards access to animation engine APIs such as [[30 Official Roblox Docs/API Reference/Classes/AnimationController\|AnimationController]] and related classes. |
| `Avatar` | 16 | **Deprecated.** Deprecated. Use [[30 Official Roblox Docs/API Reference/Enums/SecurityCapability\|Enum.SecurityCapability.AvatarAppearance]] instead. |
| `Input` | 17 | Guards access to user input APIs such as [[30 Official Roblox Docs/API Reference/Classes/UserInputService\|UserInputService]] and [[30 Official Roblox Docs/API Reference/Classes/ContextActionService\|ContextActionService]]. |
| `Environment` | 18 | Guards access to environment and world-setting APIs such as [[30 Official Roblox Docs/API Reference/Classes/Lighting\|Lighting]] and [[30 Official Roblox Docs/API Reference/Classes/Atmosphere\|Atmosphere]]. |
| `RemoteEvent` | 19 | Guards access to remote event and function APIs such as [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent\|RemoteEvent]] and [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction\|RemoteFunction]]. |
| `LegacySound` | 20 | Guards access to the legacy [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] and pre-[[30 Official Roblox Docs/API Reference/Classes/VoiceChatService#UseAudioApi\|VoiceChatService.UseAudioApi]] sound stack APIs. |
| `Players` | 21 | Guards access to [[30 Official Roblox Docs/API Reference/Classes/Players\|Players]] service APIs that query or manage connected players. |
| `CapabilityControl` | 22 | Guards access to the `Instance.Capabilities` and `Instance.Sandboxed` properties that configure script sandboxing. |
| `Plugin` | 23 | Mirrors the legacy `Plugin` permission level, granting access to Studio plugin APIs. |
| `LocalUser` | 24 | Mirrors the legacy `LocalUser` permission level, granting access to IDE-only and Studio-level APIs. |
| `WritePlayer` | 25 | Mirrors the legacy `WritePlayer` permission level, granting the ability to modify player identity properties such as name and `UserId`. |
| `RobloxScript` | 26 | Mirrors the legacy `RobloxScript` permission level, granting access to `CoreScript` APIs. |
| `RobloxEngine` | 27 | Mirrors the legacy `RobloxEngine` permission level, granting access to internal engine-level APIs. |
| `Unassigned` | 28 | The default capability assigned to API members that have not been explicitly assigned to any other capability category. |
| `InternalTest` | 29 | Restricts access to non-sensitive APIs that are intentionally kept internal. |
| `PluginOrOpenCloud` | 30 | Restricts access to APIs callable only from Studio plugin or Open Cloud Luau execution sessions. |
| `Assistant` | 31 | Restricts access to APIs that may only be called from Studio Assistant execution contexts. |
| `RemoteCommand` | 32 | Restricts access to APIs that are executable only from Studio's `RemoteCommandService` in Team Create sessions. |
| `AssetRead` | 33 | Guards access to APIs that read or query asset metadata from the Roblox catalog. |
| `AssetManagement` | 34 | Guards access to asset management APIs such as [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#PreloadAsync\|ContentProvider:PreloadAsync()]] and encryption-key registration. |
| `DynamicGeneration` | 35 | Guards access to procedural and AI-driven content generation APIs such as [[30 Official Roblox Docs/API Reference/Classes/EditableMesh\|EditableMesh]] and [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService\|AvatarCreationService]]. |
| `PlatformAvatarEditing` | 36 | Guards access to platform-level avatar editing APIs provided by [[30 Official Roblox Docs/API Reference/Classes/AvatarEditorService\|AvatarEditorService]]. |
| `AssetCreateUpdate` | 37 | Guards access to APIs that create or update published Roblox assets. |
| `Capture` | 38 | Guards access to [[30 Official Roblox Docs/API Reference/Classes/CaptureService\|CaptureService]] APIs that take screenshots and record video. |
| `SensitiveInput` | 39 | Guards access to sensitive user input APIs such as those that can read raw keyboard or mouse data beyond normal game input. |
| `Monetization` | 40 | Guards access to in-experience purchase and monetization APIs such as [[30 Official Roblox Docs/API Reference/Classes/MarketplaceService\|MarketplaceService]]. |
| `LoadOwnedAsset` | 41 | Allows a script to load assets that are owned by the experience's creator using [[30 Official Roblox Docs/API Reference/Classes/InsertService\|InsertService]] or [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require\|require()]]. |
| `Social` | 42 | Guards access to social APIs such as [[30 Official Roblox Docs/API Reference/Classes/SocialService\|SocialService]], [[30 Official Roblox Docs/API Reference/Classes/FriendPages\|FriendPages]], and [[30 Official Roblox Docs/API Reference/Classes/ExperienceInviteOptions\|ExperienceInviteOptions]]. |
| `ServerCommunication` | 43 | Guards access to server-to-server messaging APIs such as [[30 Official Roblox Docs/API Reference/Classes/MessagingService\|MessagingService]]. |
| `Logging` | 44 | Guards access to [[30 Official Roblox Docs/API Reference/Classes/LogService\|LogService]] and logging-related APIs. |
| `PromptExternalPurchase` | 45 | Guards access to APIs that initiate external (non-Roblox) purchase prompts. |
| `Groups` | 46 | Guards access to group-related APIs such as [[30 Official Roblox Docs/API Reference/Classes/GroupService\|GroupService]]. |
| `Teleport` | 47 | Guards access to teleportation APIs such as [[30 Official Roblox Docs/API Reference/Classes/TeleportService\|TeleportService]], [[30 Official Roblox Docs/API Reference/Classes/TeleportOptions\|TeleportOptions]], and [[30 Official Roblox Docs/API Reference/Classes/TeleportAsyncResult\|TeleportAsyncResult]]. |
| `Consequences` | 48 | Guards access to moderation and player-consequence APIs such as [[30 Official Roblox Docs/API Reference/Classes/Players#BanAsync\|Players:BanAsync()]] and [[30 Official Roblox Docs/API Reference/Classes/ModerationService\|ModerationService]]. |
| `Material` | 49 | Guards access to [[30 Official Roblox Docs/API Reference/Classes/MaterialService\|MaterialService]], [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]], and custom material APIs. |
| `AvatarBehavior` | 50 | Guards access to APIs that control avatar locomotion and behavior at runtime. |
| `AvatarAppearance` | 51 | Guards access to APIs that read or modify avatar appearance, such as [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]]. |
| `LoadUnownedAsset` | 52 | Allows a script to [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require\|require()]] asset IDs or call [[30 Official Roblox Docs/API Reference/Classes/InsertService#LoadAsset\|InsertService:LoadAsset()]] for assets not owned by the creator. |

---
*Source: [SecurityCapability](https://create.roblox.com/docs/reference/engine/enums/SecurityCapability) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
