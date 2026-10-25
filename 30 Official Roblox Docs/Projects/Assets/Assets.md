---
title: "Assets"
description: "An overview of how assets work on the platform."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects/assets"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*An overview of how assets work on the platform.*

Almost everything in Roblox is represented as a cloud-based asset with a unique corresponding ID. This ID is typically in the form of `rbxassetid://[ID]`, which gets applied to various instances as a property that's appropriate for that particular asset type. For example, [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], and [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] instances reference image, mesh, and audio assets through their respective [[30 Official Roblox Docs/API Reference/Classes/Decal#ColorMapContent|ColorMapContent]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart#MeshId|MeshId]], and [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Asset|Asset]] properties.

`rbxassetid://7229442422`
*(image in the full Top G Vault)*

`rbxassetid://6768917255`
*(image in the full Top G Vault)*

`rbxassetid://9125402735`

[Audio: Boom-Impact.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/general/Boom-Impact.mp3)

This cloud-based asset system allows you to store assets through Roblox and reuse them across the platform in various contexts, such as in different objects and places, without maintaining local copies as part of each saved Studio game. You can find millions of project assets in the [Creator Store](https://create.roblox.com/store), equip avatar assets in the [Marketplace](https://www.roblox.com/catalog), or you can create your own assets and [[30 Official Roblox Docs/Projects/Assets/Assets#Asset management|import]] them directly into Studio through the asset management tools.

When you import assets, they must pass a [[30 Official Roblox Docs/Projects/Assets/Assets#Asset moderation|moderation]] check before users can see and interact with them in published games. After Roblox approves imported assets, you can choose to retain ownership of their usage on the platform or make them publicly available as detailed in [[30 Official Roblox Docs/Projects/Assets/Assets#Asset permissions|Asset permissions]].

## Asset types

All [[30 Official Roblox Docs/API Reference/Enums/AssetType|asset types]] available on the platform generally fall into one of three categories:

- Assets that map to project-level items. You can find and configure these assets for specific games on the [Creator Dashboard](https://create.roblox.com/dashboard/creations).
- Assets that are objects, or that change the appearance or behavior of objects within places. You can [[30 Official Roblox Docs/Projects/Assets/Assets#Asset management|import]] these assets or find them in the [Creator Store](https://create.roblox.com/store).
- Assets that change the body, clothing, or animation of avatars and non-playable characters. You can find these assets in the [Marketplace](https://www.roblox.com/catalog).

Every asset type works differently depending on where it lives on the platform. See the following sections for information on how to use each asset type for [[30 Official Roblox Docs/Projects/Assets/Assets#For games|games]], [[30 Official Roblox Docs/Projects/Assets/Assets#For places|places]], and [[30 Official Roblox Docs/Projects/Assets/Assets#For avatars|avatars]].

### For games

There are three asset types that map to project-level items. These asset types are unique to the game that they map to, meaning they are non-transferable to other projects.

- **Places** — Every game has one or more [[30 Official Roblox Docs/Projects/Projects#Places|places]], or individual 3D worlds. Each place is represented by a [[30 Official Roblox Docs/Projects/Data model|data model]] that describes the place's 3D world and logic.
- **Badges** — A [[30 Official Roblox Docs/Production/Publishing/Badges|badges]] is a special award you can gift users when they meet a goal within a game, such as completing a difficult objective or playing for a certain amount of time.
- **Passes** — A [[30 Official Roblox Docs/Production/Monetization/Passes|pass]] is a monetization product that allows you to charge a one-time Robux fee in order for users to access special privileges within a game, such as entry to a restricted area, an in-game avatar item, or a permanent power-up.

### For places

In general, there are two categories of asset types for places that you can either [[30 Official Roblox Docs/Projects/Assets/Assets#Asset management|import]] or find in the [Creator Store](https://create.roblox.com/store):

- Assets that exist as objects within the data model, such as [[30 Official Roblox Docs/Parts/Models|models]] and [[30 Official Roblox Docs/Parts/Meshes|meshes]].
- Assets that you apply as an object's property, such as audio, images, fonts, and videos.

For more information on both types of these assets for places, such as where and how you can use them in Studio, reference the following table.

| Asset Type | Description |
| --- | --- |
| **Model** | A [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] is a container object for geometric groupings such as [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BaseParts]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]], and other [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] objects. Models can also contain objects such as [[30 Official Roblox Docs/API Reference/Classes/Script\|Scripts]]. Whenever you group objects together in Studio, they automatically become a [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] object. For more information, see [[30 Official Roblox Docs/Parts/Models\|models]]. |
| **Mesh** | A [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshPart]] is a type of part object that includes a physically-simulated custom mesh. For more information, see [[30 Official Roblox Docs/Parts/Meshes\|meshes]]. |
| **Audio** | An [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer\|AudioPlayer]] instance loads and plays an audio file and passes the output through a [[30 Official Roblox Docs/API Reference/Classes/Wire\|Wire]] to an [[30 Official Roblox Docs/API Reference/Classes/AudioEmitter\|AudioEmitter]] or [[30 Official Roblox Docs/API Reference/Classes/AudioDeviceOutput\|AudioDeviceOutput]]. For more information, see [[30 Official Roblox Docs/Audio/Audio assets\|audio assets]] and [[30 Official Roblox Docs/Audio/Audio objects\|audio objects]]. |
| **Image** | Images are used in several ways within a place, including [[30 Official Roblox Docs/Parts/Textures and decals\|textures/decals]] on parts, [[30 Official Roblox Docs/UI/Text & image labels\|image labels]], [[30 Official Roblox Docs/Parts/Meshes\|mesh textures]], textures for [[30 Official Roblox Docs/Parts/Materials\|custom materials]], textures for [[30 Official Roblox Docs/Environment/Lighting and effects\|special effects]], and more. |
| **Font** | [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]], [[30 Official Roblox Docs/API Reference/Classes/TextLabel\|TextLabel]], and [[30 Official Roblox Docs/API Reference/Classes/TextBox\|TextBox]] objects display typography in a specific style when you apply a font asset ID. You cannot import fonts, but the [Creator Store](https://create.roblox.com/store) offers over 80 different fonts for your use. |
| **Video** | A [[30 Official Roblox Docs/API Reference/Classes/VideoFrame\|VideoFrame]] object displays a video through its [[30 Official Roblox Docs/API Reference/Classes/VideoFrame#Video\|Video]] asset property. See [[30 Official Roblox Docs/UI/Video frames\|video frames]] for more information. |

### For avatars

There are three categories of asset types for avatars that you can find in the [Marketplace](https://www.roblox.com/catalog) and equip to avatars:

- **Body Parts** — Assets that represent sections of the avatar character model, such as its head, torso, or legs.
- **Clothing and Accessories** — Assets that represent clothing and accessories on top of body parts.
- **Animations** — Assets that animate the avatar character model, such as how it runs, jumps, or swims.

Every [[30 Official Roblox Docs/Characters/Characters|character]] model contains a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] object with asset IDs for the character's body parts, clothing, accessories, and animations. By default, a user's playable character references their personal Roblox avatar, but you can apply a custom [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] if desired. For more information, see [[30 Official Roblox Docs/Characters/Character appearance|character appearance]].

## Packages

Within Studio, you can convert single assets or asset hierarchies into **packages** and reuse them in multiple games, letting you optimize asset management across your entire team or across multiple projects. When a package is updated, you or your team members can update specific copies to the most current version, update all copies across a game, or set specific copies to auto update.

For more information, see [packages](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/packages.md).

## Asset URIs

Assets and other content stored outside of the current place are identified through **Uniform Resource Identifiers** (URIs) which are formatted strings that point to a file stored online, within the Roblox application package, or saved to the client's device.

The basic structure is a **scheme** followed by `://` and a **path** that varies according to the scheme.

**[Scheme]://[Path]**<br>

The Roblox Engine supports several custom URI schemes for referencing content stored on the platform.

### rbxassetid

`rbxassetid` points to a user-uploaded asset on Roblox. This format is a common standard for properties such as [[30 Official Roblox Docs/API Reference/Classes/Decal#ColorMapContent|Decal.ColorMapContent]], [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Texture|ParticleEmitter.Texture]], and [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer#Asset|AudioPlayer.Asset]].

***rbxassetid://7229442422***

<br>
*(image in the full Top G Vault)*

***rbxassetid://3845386987***

<br>
*(image in the full Top G Vault)*

***rbxassetid://9125402735***

<br>

[Audio: Boom-Impact.mp3](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/general/Boom-Impact.mp3)

### rbxasset

`rbxasset` points to Roblox's content folder on the user's device, for example:

**rbxasset://textures/face.png**<br>

The content folder's location depends on the user's operating system:

#### Windows

`%LOCALAPPDATA%\Roblox\Versions\<version>\content`<br>
(alternatively `C:\Program Files (x86)\Roblox\Versions\<version>\content`)

#### Mac

`Applications/RobloxStudio.app/Contents/Resources/content`

### rbxthumb

`rbxthumb` points to a thumbnail image for the provided asset. Its string format takes a thumbnail type (`type`), an asset ID (`id`), and width/height (`w`/`h`).

**rbxthumb://type=Asset&id=24813339&w=150&h=150**<br>

| Type (`type`) | Expected `id` Value | Supported Sizes (`w`×`h`) |
| --- | --- | --- |
| `Asset` | ID for a 2D or 3D asset | 150×150, 420×420 |
| `Avatar` | ID for a Roblox user ([[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]]) | 48×48, 60×60, 100×100, 150×150, 180×180, 352×352, 420×420, 720×720 |
| `AvatarBust` | ID for a Roblox user ([[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]]) | 50×50, 60×60, 75×75, 100×100, 150×150, 180×180, 352×352, 420×420 |
| `AvatarHeadShot` | ID for a Roblox user ([[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]]) | 48×48, 60×60, 100×100, 150×150, 180×180, 352×352, 420×420 |
| `BadgeIcon` | ID for a [[30 Official Roblox Docs/Production/Publishing/Badges\|badge]] | 150×150 |
| `BundleThumbnail` | ID for a [Marketplace](https://www.roblox.com/catalog) bundle such as a [character](https://www.roblox.com/catalog?Category=17), [head](https://www.roblox.com/catalog?Category=4&Subcategory=66), or [shoes](https://www.roblox.com/catalog?Category=3&Subcategory=64) | 150×150, 420×420 |
| `FontFamily` | ID for a font in the [[30 Official Roblox Docs/Production/Creator Store\|Creator Store]] or [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) inventory | 1200×80 |
| `GameIcon` | ID for a game ([[30 Official Roblox Docs/API Reference/Classes/DataModel#GameId\|DataModel.GameId]]); shows the game's [[30 Official Roblox Docs/Production/Publishing/Icons\|icon]] | 50×50, 150×150 |
| `GamePass` | ID for a [[30 Official Roblox Docs/Production/Monetization/Passes\|pass]] | 150×150 |
| `GameThumbnail` | ID for a game ([[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|DataModel.PlaceId]]); shows the game's primary [[30 Official Roblox Docs/Production/Publishing/Thumbnails\|thumbnail]] | 256×144, 384×216, 480×270, 576×324, 768×432 |
| `GroupIcon` | ID for a [[30 Official Roblox Docs/Projects/Groups (teams)\|group]] | 150×150, 420×420 |
| `Outfit` | ID gathered from an [[30 Official Roblox Docs/API Reference/Classes/OutfitPages\|OutfitPages]] table | 150×150, 420×420 |

```lua title="Apply Avatar Head Shot Thumbnail"
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player.PlayerGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

local imageLabel = Instance.new("ImageLabel")
imageLabel.AnchorPoint = Vector2.new(0, 0)
imageLabel.Size = UDim2.new(0, 150, 0, 150)
imageLabel.Position = UDim2.new(0, 16, 0, 16)
imageLabel.BorderSizePixel = 0
imageLabel.BackgroundColor3 = Color3.new(0, 0, 0)
imageLabel.BackgroundTransparency = 0.8
imageLabel.Parent = screenGui

local success, content, isReady = pcall(function()
	return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352)
end)
if success then
	-- Apply thumbnail content to image label
	imageLabel.Image = content
	-- Crop thumbnail to circle
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1, 0)
	corner.Parent = imageLabel
end
```

### rbxgameasset

`rbxgameasset` points to an asset uploaded through the [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md). It allows access to assets by a user‑friendly name instead of ID, so if you upload an image named `Potion.png`, you can reference it as:

**rbxgameasset://Images/Potion**<br>

In the above example, `Images` is the category/folder that appears in the [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) and `Potion` is the asset name, minus its extension.

> [!warning]
> `rbxgameasset` only works for the current game. If you paste a parent object that utilizes the asset into another game, the asset will not load (or will load a different asset if you've uploaded one with the same name to that other game). If you need an asset to work across multiple games, use `rbxassetid` instead of `rbxgameasset`.

### rbxhttp

`rbxhttp` is shorthand for [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#BaseUrl|ContentProvider.BaseUrl]], for example:

**rbxhttp://Thumbs/Avatar.ashx?x=100&y=100&format=png**

### rbxtemp

`rbxtemp` allows you to refer [[30 Official Roblox Docs/API Reference/Classes/File|Files]]. Use [[30 Official Roblox Docs/API Reference/Classes/File#GetTemporaryId|File:GetTemporaryId()]] to generate a valid `rbxtemp` URL. For example:

**rbxtemp://1**

### https / http

`https` or `http` points to the exact location of something on the internet. It only works on Roblox-approved domains and raises an error if you use it elsewhere.

**https://www.roblox.com/asset/?id=9723979220**

## Asset permissions

An asset's privacy status determines who has permission to use the asset within their games. By default, all assets are **private** when you or your [[30 Official Roblox Docs/Projects/Groups (teams)|group]] members import them into Studio. If you want to grant everyone access to the asset ID, you must distribute the asset to the [Creator Store](https://create.roblox.com/store).

> [!warning]
> Special privacy rules and workflows apply to **audio** and **video** assets. See [asset privacy](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/privacy.md) for details on sharing these asset types among friends and games.

## Asset moderation

Roblox performs both human and automated asset moderation on a proactive and reactive basis to ensure assets adhere to the [Community Rules](https://en.help.roblox.com/hc/articles/203313410), [Terms of Use](https://en.help.roblox.com/hc/articles/115004647846), and [[30 Official Roblox Docs/Production/Publishing/Intellectual Property Guidelines|Intellectual Property guidelines]]. If any asset violates these moderation policies, such as including discriminatory or adult content, the Moderation team flags and removes the asset to protect users from harmful or non-compliant content. This process generally happens within a few hours after you import the asset.

If an asset is still in the moderation queue when you publish your game, users cannot see or interact with the asset until Roblox approves it. If the asset doesn't pass moderation, you will receive a [notification](https://en.help.roblox.com/hc/en-us/articles/360020870412-Understanding-Moderation-Messages) explaining why the asset cannot be on the platform in its current state. For more information, see Working with Assets - Asset Moderation.

> [!warning]
> To maintain community safety and civility, Roblox may take down games and/or terminate accounts that maliciously import or publish non-compliant assets.

## Asset management

Roblox offers several tools to import, store, and publish your assets:

| Tool | Description |
| --- | --- |
| [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) | Imports and stores [[30 Official Roblox Docs/Parts/Textures and decals\|images]], [[30 Official Roblox Docs/Parts/Meshes\|meshes]], [[30 Official Roblox Docs/Audio/Audio assets\|audio]], and more. Only displays assets that you've imported into the currently opened game. |
| [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) | Stores every asset that you or your [[30 Official Roblox Docs/Projects/Groups (teams)\|groups]] have ever imported into Studio, regardless of what game you currently have open. Also includes assets from the [Creator Store](https://create.roblox.com/store), allowing you to quickly drop user-generated assets directly into your games. |
| [[30 Official Roblox Docs/Studio/Importer\|Importer]] | Imports 3D models from third-party modeling tools as a custom [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]] instance. |

## Archive assets

To further help with organization, you can archive most asset types in the **Creations** ⟩ **Development Items** section of the [Creator Dashboard](https://create.roblox.com/dashboard/creations). To archive an item, hover over an asset's thumbnail, click the **⋯** button, and select **Archive** from the context menu.

*(image in the full Top G Vault)*

After you archive an asset, it disappears from the website and is no longer usable or visible in Roblox games, including your own.

> [!warning]
> For more information on how archiving works with Marketplace items, see [[30 Official Roblox Docs/Marketplace/Moderation#Archive assets|moderation]].

---
*Source: [Assets](https://create.roblox.com/docs/projects/assets) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
