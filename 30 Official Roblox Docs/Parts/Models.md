---
title: "Models"
description: "Models are container objects for geometric groupings like parts, Motor6D objects, and other models."
area: "30 Official Roblox Docs"
cluster: "Parts"
source: "https://create.roblox.com/docs/parts/models"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Models are container objects for geometric groupings like parts, Motor6D objects, and other models.*

**Models** are containers for physical objects that you can use to organize your workspace and group your assets, such as parts, welds, or joints. While models often contain connected parts known as an [[30 Official Roblox Docs/Physics/Assemblies|assembly]], they can also contain any number of individual parts or objects, such as scripts, attachments, or other models.

To demonstrate, avatar characters are a single [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] containing the appropriate humanoid parts, joints, and scripts necessary for runtime behavior:

*(image in the full Top G Vault)*

*A model named Octavia*

*(image in the full Top G Vault)*

*The groupings that comprise the model*

## Create models

> [!warning]
> You can create models using any open use or restricted asset, but any restricted assets that you don't have [explicit permission](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/privacy.md) to use are **not** visible or audible at runtime unless the game itself has permission to use those assets.

There are two ways to create models:

- Group objects together to automatically form a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object.
- Insert an empty [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object into the Workspace, then manually add child objects to the model.

To create a model using the grouping method:

1. In the **Explorer** window or 3D viewport, select every object that you want to group into a model.
1. Right-click on one of the objects and select **Group**, or press <kbd>Ctrl</kbd><kbd>G</kbd> on Windows or <kbd>⌘</kbd><kbd>G</kbd> on Mac. A new [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object displays with all of the objects that make up the model nested underneath.

   *(image in the full Top G Vault)*

> [!info]
> To completely ungroup a model back to its original objects, right-click it and select **Ungroup**, or press <kbd>Ctrl</kbd><kbd>U</kbd> on Windows or <kbd>⌘</kbd><kbd>U</kbd> on Mac.

### Set a primary part

If you have a model with parts that are joined together through physical joints like [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] or [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6Ds]], you should specify a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] within the model to become a [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]]. A model's [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]] is the physical reference that specifies which [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] the pivot point and bounding box should move with when the model changes position or orientation.

To set a primary part:

1. In the **Explorer** window, select a model.
1. In the **Properties** window, select the **PrimaryPart** property. Your cursor changes.
1. Back in the **Explorer** window, select the part that you want to become your primary part.

## Select models

As you hover over models in the viewport, they are outlined to indicate their potential selection. You can select an outlined model by clicking it, or you can select multiple models by holding <kbd>Shift</kbd>, <kbd>Ctrl</kbd>, or <kbd>⌘</kbd> as you hover over and click them.

*(image in the full Top G Vault)*

As models typically contain multiple child [[30 Official Roblox Docs/Parts/Parts|parts]] or [[30 Official Roblox Docs/Parts/Meshes|meshes]], some children may be hidden from view. To select a specific child without moving the camera around or locating the child in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy, click while holding <kbd>Alt</kbd> on Windows or <kbd>⌥</kbd> on Mac to perform [[30 Official Roblox Docs/Studio/Studio interface|selection cycling]].

[Video: Selection-Cycling.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/studio/general/Selection-Cycling.mp4)

*Selection cycling*

## Transform models

You can move, scale, or rotate a model using the Studio [[30 Official Roblox Docs/Parts/Parts#Transform parts|transform]] tools. Unless you've set a [[30 Official Roblox Docs/Parts/Models#Set a primary part|primary part]], a model transforms based on the center of its bounding box.

Additionally, within a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], you can move or rotate a model through the following methods:

| Method | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Model#MoveTo\|MoveTo()]] | Moves the model's [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart\|PrimaryPart]] to the given position. If a primary part has not been specified, the root part of the model will be used. |
| [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo\|PivotTo()]] | Transforms the model along with all of its descendant [[30 Official Roblox Docs/API Reference/Classes/PVInstance\|PVInstances]] such that the pivot is located at the specified [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Model#TranslateBy\|TranslateBy()]] | Shifts a model by the given [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] offset, preserving the model's orientation. |

## Model behaviors

While models act similarly to [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] objects for most purposes in your game, they also exhibit some unique behaviors.

### Character models

When a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is present inside a model that contains a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] named **Head**, Roblox displays a name and/or health bar above that part. For more information, see [[30 Official Roblox Docs/Characters/Character name-health display|Character Name/Health Display]].

*(image in the full Top G Vault)*

### Destroy height

To prevent parts that have fallen off of a game's map from continuing to fall forever, Studio automatically destroys parts that fall below the [[30 Official Roblox Docs/API Reference/Classes/Workspace#FallenPartsDestroyHeight|Workspace.FallenPartsDestroyHeight]] value. If a part destroyed due to this behavior is the last part in a model, then that model will also be destroyed.

## Model streaming

Instance [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|streaming]] dynamically loads and unloads [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] on a player's device as their character explores the 3D world. With streaming enabled, you can specify the way each model should be treated under streaming behavior. For example, a model set to [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Persistent|Persistent]] will never stream out, or a model set to [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Atomic|Atomic]] will stream in and out as a single unit with all of its descendants. For more information, see [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|per-model streaming controls]].

Because the 3D content that exists on the client changes dynamically in a streaming-enabled game, models might suddenly disappear, which can be visually jarring for the player. To avoid this situation, you can set specific models to render as optimized "SLIM" meshes or as lower resolution "imposter" meshes when streamed out. See [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Model level-of-detail|model level of detail]].

## Upload models

When you upload or import a `.gltf`, `.fbx` and `.obj` model file to the cloud using the [[30 Official Roblox Docs/Art/Accessories/Creating Rigid/Use Studio's Importer|Importer]], Roblox represents it as a cloud-based asset with a unique corresponding ID. This cloud-based asset system allows you to store models through Roblox and reuse them across the platform in various contexts without maintaining local copies as part of each saved Studio game.

To upload a model you made in Studio:

1. In the **Explorer** window, right-click your model. A contextual menu displays.
2. Select **Save to Roblox**. The **Asset Configuration** window displays.
3. In the **Asset Configuration** window,

   1. Set **Content Type** to **Development Item**.
   1. Set **Asset Category** to **Model**.
   1. Complete the following fields:

      - **Title** - The name of your model.
      - **Description** - A short description of your model.
      - **Creator** - Use the dropdown to select if you'd like to publish this asset as an individual or as part of an associated group.
      - **Genre** - The genre of your model.

   1. Click the **Save** button. After a moment, the **Asset Configuration** window displays your model's asset ID that you can use in your projects or share with other creators, groups, or games. For more information on granting permission to collaborators and games so that they can use your models, see [Asset privacy](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/privacy.md)

## Distribute and sell models

You can publicly distribute and sell your own models on the Creator Store for United States Dollars (USD), as long as the models have less than 15,000 dependencies. Each of these dependencies must be an:

- Open use asset or a restricted asset that you created, excluding audio and video.
- Audio or video asset that you acquired from the Creator Store.

This monetization method lets you earn 100% of net proceeds on transactions, bypassing platform fees and DevEx rates. For more information on asset and seller requirements, including how to set up a seller account to set prices and receive payouts, see [[30 Official Roblox Docs/Production/Creator Store#Distribute and sell assets|Creator Store - Distribute and sell assets]].

> [!info]
> If you want to distribute a model with a child audio asset that you created, you must distribute the audio asset on the Creator Store **_before_** making it a child of the model in order for the audio to be audible at runtime.

When creating models for the Creator Store, ensure:

- The model and its dependencies adhere to the [Community Rules](https://en.help.roblox.com/hc/articles/203313410), [Terms of Use](https://en.help.roblox.com/hc/articles/115004647846), [[30 Official Roblox Docs/Production/Publishing/Intellectual Property Guidelines|Intellectual Property guidelines]], and Creator Store requirements.
- The model is set to a reasonable scale and orientation so that it's usable out of the box when inserted from the Creator Store.
- All of the model's dependencies import into Studio without any warnings.
- Each mesh dependency contains no more than 20,000 triangles.
- Each texture dependency meets Roblox's [[30 Official Roblox Docs/Art/Modeling/Texture specifications|texture specifications]].

---
*Source: [Models](https://create.roblox.com/docs/parts/models) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
