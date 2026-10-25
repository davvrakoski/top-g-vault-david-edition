---
title: "Photo-to-avatar generation"
description: "Explains how to use AvatarCreationService AvatarGeneration APIs to prompt users to generate Avatars from photos in a game."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/avatar-generation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to use AvatarCreationService AvatarGeneration APIs to prompt users to generate Avatars from photos in a game.*

> [!success]
> The Photo-to-avatar feature is currently in alpha. For the latest information, see the [DevForum announcement](https://devforum.roblox.com/t/early-preview-alpha-release-of-photo-to-avatar-apis/3931624).

> [!warning]
> The following guide applies to creators who are familiar with scripting and Roblox Studio and intend to develop games that allow user-generated avatar items.

You can create a game that allows players to generate a fully functional avatar character using a photo and a text prompt.

This process involves the following steps:

1. Request an avatar generation session.
2. Prompt the user to take a selfie and generate a 2D preview image of the avatar.
3. Generate the full avatar character using [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].

## Request an avatar generation session

To start a photo-to-avatar generation, call [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#RequestAvatarGenerationSessionAsync|AvatarCreationService:RequestAvatarGenerationSessionAsync()]] from the server to request a session for the player. A session provides a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] with a certain number of avatar previews and avatar generations.

As it may take some time for a session to become available, [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#RequestAvatarGenerationSessionAsync|AvatarCreationService:RequestAvatarGenerationSessionAsync()]] returns a [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection|RBXScriptConnection]] and a waitTime in seconds. The waitTime can be used to provide the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] with information on how long it will take them to be able to start their generations.

Once a session is ready, the callback is invoked with a `Dictionary` of information about the session. The `Dictionary` includes:

- `SessionId` — Passed as an argument when calling [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GenerateAvatar2DPreviewAsync|AvatarCreationService:GenerateAvatar2DPreviewAsync]] and [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GenerateAvatarAsync|AvatarCreationService:GenerateAvatarAsync]].
- `Allowed2DGenerations` — The number of 2D preview generations allowed in a session.
- `Allowed3DGenerations` — The number of avatar generations allowed in a session.
- `SessionTime` — The maximum time for a session in seconds.

## Prompt selfie and generate 2D preview

After a session is started, prompt the user to take a selfie and get the fileId `string` by calling the [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptSelectAvatarGenerationImageAsync|AvatarCreationService:PromptSelectAvatarGenerationImageAsync]] method on the Server. This fileId will be passed to the [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GenerateAvatar2DPreviewAsync|AvatarCreationService:GenerateAvatar2DPreviewAsync]] method.

To create a 2D preview image of the avatar call the following methods:

1. [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GenerateAvatar2DPreviewAsync|AvatarCreationService:GenerateAvatar2DPreviewAsync]] on the server.
2. [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#LoadAvatar2DPreviewAsync|AvatarCreationService:LoadAvatar2DPreviewAsync]] on the client.

The [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GenerateAvatar2DPreviewAsync|AvatarCreationService:GenerateAvatar2DPreviewAsync]] takes the SessionId, fileId and an optional text prompt as input to generate a 2D avatar preview. This method returns a previewId.

This previewId should be sent to the client and can then be used to retrieve the preview as an [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]].

If the user is not satisfied with the generated preview, this workflow can be repeated.

## Generate the avatar

Once the user is satisfied with the preview, you can generate the complete 3D avatar character.

To generate an avatar character:

1. Call [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#GenerateAvatarAsync|AvatarCreationService:GenerateAvatarAsync]] on the Server with a `Dictionary` containing the SessionId and PreviewId.
   1. This method call returns a `string` generationId.
2. Retrieve the generated avatar data as a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] using the [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#LoadGeneratedAvatarAsync|AvatarCreationService:LoadGeneratedAvatarAsync]] method on both the game server and the client.
3. Use the `Players.CreateHumanoidModelFromDescription` method to create an avatar model from the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] to display to the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]].

Mesh and texture assets are provided as [[30 Official Roblox Docs/API Reference/Classes/EditableMesh|EditableMesh]] and [[30 Official Roblox Docs/API Reference/Classes/EditableImage|EditableImage]] objects, respectively, to allow continued editing of the generated avatar. Edits should be made on both the game server and the client copy to keep them in sync for publish.

## Publish the avatar

If the user is satisfied with the resulting avatar it can be published using the [[30 Official Roblox Docs/API Reference/Classes/AvatarCreationService#PromptCreateAvatarAsync|AvatarCreationService:PromptCreateAvatarAsync]] method.

For more information, see [[30 Official Roblox Docs/Avatar/Avatar in-experience creation|in-game creation]].

---
*Source: [Photo-to-avatar generation](https://create.roblox.com/docs/avatar/avatar-generation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
