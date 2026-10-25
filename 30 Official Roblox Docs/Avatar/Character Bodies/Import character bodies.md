---
title: "Import character bodies"
description: "Use the Importer to add third-party models to Studio before testing, using, or uploading the character model."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/character-bodies/import"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use the Importer to add third-party models to Studio before testing, using, or uploading the character model.*

Studio's Importer lets you import 3D assets into your projects, such as avatar clothing, accessories, and character bodies. The following instructions detail how to import a character body `.fbx` or `.gltf` file into Studio as a `Model` object that you can use in your games, upload to the Marketplace, or share with other creators.

> [!info]
> If your `.fbx` or `.gltf` file is a single mesh, you can use the [[30 Official Roblox Docs/Avatar Setup/Avatar Setup|Avatar Setup]] tool to automatically partition the mesh into the appropriate 15 body parts necessary for an avatar character body.

While the Importer provides object previews and error-checking to ensure that your creation meets Roblox's [[30 Official Roblox Docs/Art/Modeling/General specifications|general 3D requirements]], it's important to ensure that your character model also meets Roblox's [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|character body specifications]] to use or sell this asset as an avatar-ready character model, otherwise you can encounter errors at different points in the workflow.

To import your asset as a character body model:

1. In the **Home** tab, click the **Import** button to open the 3D Importer. A file browser opens.
1. Select your rigged character's `.fbx` or `.gltf` file. The 3D Importer loads a preview of the character model.

    *(image in the full Top G Vault)*

   - If textures don't load for your asset, you can manually import your textures later.
   - For additional information on import settings and troubleshooting, see [[30 Official Roblox Docs/Studio/Importer|Importer]].

1. In the **Rig General** section,
   1. **OPTIONAL** If you are importing an [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Advanced R15 rigs|advanced R15 rig]], set **Rig Type** to **Custom Humanoid**.
   1. Set **Rig Scale** to the appropriate [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Body scale|Body Scale]] of your character.
   1. Set **Constraint Type** to **Joint Upgrade**.

   *(image in the full Top G Vault)*

1. Select **Import**. The asset populates in your workspace as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] with the appropriate textures applied as a [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|MeshPart.TextureID]].

   *(image in the full Top G Vault)*

   *(image in the full Top G Vault)*

> [!note]- Textures didn't load correctly?
> If your textures didn't load correctly, you can import them manually using the [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md):
>
> 1. In the **Asset Manager**, click the **Import** button. If you are unable to access the Asset Manager, save and publish your game first.
> 1. Upload your image files.
> 1. After moderation clears your images, select the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] parented within your imported [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].
> 1. If you are using a single basic texture, set the [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|MeshPart.TextureID]] property to your uploaded texture image.
> 1. If you are using PBR textures:
>
>    1. Add a [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] child to your [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].
>
>       *(image in the full Top G Vault)*
>
>    1. In the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] properties, click each property value and assign the appropriate texture image from the asset dropdown:
>
>       1. Set the **ColorMap** to the **\_ALB** texture image.
>       1. Set the **MetalnessMap** to the **\_MTL** texture image.
>       1. Set the **NormalMap** to the **\_NOR** texture image.
>       1. Set the **RoughnessMap** to the **\_RGH** texture image.
>
>       *(image in the full Top G Vault)*

<br>

With this new character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], you can perform any of the following:

- If your character includes an [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Advanced R15 rigs|advanced R15 rig]], add [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription|HumanoidRigDescription]] and/or [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription|DigitsRigDescription]] objects for Marketplace and animation requirements. You may need to use the [[30 Official Roblox Docs/Characters/Adaptive Animation|Adaptive Animation]] plugin to remap your joints and set a baseline t-pose reference to better support your animations.
- Begin the process of [[30 Official Roblox Docs/Marketplace/Publish to Marketplace#Upload an asset|uploading and publishing]] the character model to the Marketplace. This involves some additional validation and moderation steps.
- Use the model in your current game and modify the model's appearance with [[30 Official Roblox Docs/Characters/Character appearance#Manually modify appearance|HumanoidDescription]].

  - Playtest as the character by renaming the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] to `StarterCharacter` and moving the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] to the [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] folder in the **Explorer** before play testing.

- Save the model to your [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) or make it public on the [[30 Official Roblox Docs/Production/Creator Store|Creator Store]] to use within any of your games or share with other creators.

> [!warning]
> Character creation is a complex process that requires lots of testing and iteration. For information on importing your character model into a test place and verifying your avatar and related components, see [[30 Official Roblox Docs/Avatar/Character Bodies/Test character bodies|Test character bodies]].

---
*Source: [Import character bodies](https://create.roblox.com/docs/avatar/character-bodies/import) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
