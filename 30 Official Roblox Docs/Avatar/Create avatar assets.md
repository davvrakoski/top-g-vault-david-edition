---
title: "Create avatar assets"
description: "Create avatar characters, cosmetics, clothing, and accessories to the Marketplace."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/create"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Create avatar characters, cosmetics, clothing, and accessories to the Marketplace.*

As an avatar creator, you can empower self-expression with your creativity and monetize your creations. Whether you're a 3D artist, character rigging specialist, animator, or someone with interest in character design, there are many pathways for you to create on Roblox, including:

- **Bodies** - Geometry, textures, rigging armature, attachment points, and cages that make up how a character renders and articulates in the 3D space.
- **Makeup** - Facial cosmetic items, such as traditional makeup art, face paint, or battle markings.
- **Accessories and clothing** - Equippable items that attach or wrap around the character's body.
- **Animations** - Full body emotes or facial expressions that express the character's personality.

Almost every custom avatar asset requires a combination of creative work in third-party image editing or 3D modeling software and Studio's built-in avatar customization and validation tooling. Let's explore your options.

## Third-party tools

There are a wide range of third-party tools available to create file types that you can import into Studio for avatar assets. The following are examples of popular third-party software that creators commonly use for their creative workflows.

| | | |
| --- | --- | --- |
| *(image in the full Top G Vault)* | *(image in the full Top G Vault)* | *(image in the full Top G Vault)* |
| [Blender](https://www.blender.org/) is a free, open-source 3D creation suite with a broad range of modeling, sculpting, texturing, rigging, and animation tools. | [Autodesk Maya](https://www.autodesk.com/products/maya/overview) is a subscription-based industry standard toolset that covers the entire 3D production pipeline. | [GNU Image Manipulation Program](https://www.gimp.org/) (GIMP) is a free, open-source image editor. |

## Studio tools

Once you have your custom image or 3D model file, Studio offers a full suite of tooling to convert the model or image file into Roblox-ready avatar assets that meet platform policies and technical standards. The following are all major tools you can use to create, test, and upload your assets to the Marketplace.

| **Importer** | **Avatar Setup** | **Automatic Skinning Transfer** |
| --- | --- | --- |
| The [[30 Official Roblox Docs/Studio/Importer\|Importer]] allows you to import 3D models, images, and other file types into Studio. It supports meshes for avatar items with PBR textures, rigging, skinning, and animation data. | [[30 Official Roblox Docs/Avatar Setup/Avatar Setup\|Avatar Setup]] automatically processes custom models into avatar assets. If the models don't have all essential components for publishing to the Marketplace, Avatar Setup generates them, such as partitions for your geometry, rigging armatures, skinning weights and influences, cages, facial animations, and attachments. | [[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer\|Automatic Skinning Transfer]] transfers or generates skinning data to layered accessories and facial rigid accessories. This allows the accessories to deform along the character it's attached to without you having to skin the accessory itself. |

| **Accessory Fitting Tool** | **Animation Editor** | **Adaptive Animation** |
| --- | --- | --- |
| The [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool\|Accessory Fitting Tool]] (AFT) lets you test your custom models on multiple combinations of character bodies, animations, and accessories before generating the final [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] object. | The [[30 Official Roblox Docs/Animation/Animation Editor\|Animation Editor]] lets you import, design, and publish custom emotes for your rigging armatures. | The [[30 Official Roblox Docs/Characters/Adaptive Animation\|Adaptive Animation]] system lets you customize, modify, and map the internal joints of your custom avatar characters for universal animation support across bodies with unique body types, rigs, and proportions. |

In addition, you can create and configure experiences to let players create avatar assets during runtime, either from base models that you provide or their own photos and prompts.

| **Avatar in-experience creation** | **Photo-to-Avatar generation** |
| --- | --- |
| [[30 Official Roblox Docs/Avatar/Avatar in-experience creation\|Avatar in-experience creation]] lets players create, customize, and purchase avatar bodies in real time. When purchased, these custom bodies save directly to the player's Roblox inventory, allowing them to equip and wear the custom avatars in other experiences. | [[30 Official Roblox Docs/Avatar/Photo-to-avatar generation\|Photo-to-Avatar generation]] lets players generate a fully functional avatar character using a photo and a text prompt. |

---
*Source: [Create avatar assets](https://create.roblox.com/docs/avatar/create) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
