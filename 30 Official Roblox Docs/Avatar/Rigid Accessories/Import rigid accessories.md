---
title: "Import rigid accessories"
description: "Use the Importer to add third-party models to Studio before using the Accessory Fitting Tool to convert the model to an Accessory."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/rigid-accessories/import"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use the Importer to add third-party models to Studio before using the Accessory Fitting Tool to convert the model to an Accessory.*

Studio's Importer lets you import 3D assets into your projects, such as character bodies, makeup, and rigid accessories. The following instructions detail how to import a rigid accessory `.fbx` or `.gltf` file into Studio as a `Model` object and convert it into an `Accessory` object that you can use in your games, upload to the Marketplace, or share with other creators.

While the Importer provides object previews and error-checking to ensure that your creation meets Roblox's [[30 Official Roblox Docs/Art/Modeling/General specifications|general 3D requirements]], it's important to ensure that your character model also meets Roblox's [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications|rigid accessory specifications]] to use or sell this asset as an avatar-ready rigid accessory, otherwise you can encounter errors at different points in the workflow.

## Import accessories

To import your asset as a rigid accessory:

1. In the **Home** tab, click the **Import** button to open the Importer. A file browser opens.
1. Select your rigid accessory's `.fbx` or `.gltf` file. The Importer loads a preview of the rigid accessory.

      *(image in the full Top G Vault)*

1. Select **Import**. The asset populates in your workspace as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] with the appropriate textures applied as a [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|MeshPart.TextureID]].

> [!note]- Textures didn't load correctly?
> If your textures didn't load correctly, you can import them manually using the [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md):
>
> 1. In the **Asset Manager**, click the **Import** button. If you are unable to access the Asset Manager, save and publish your game first.
> 1. Upload your image files.
> 1. After moderation clears your images, select the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] parented within your imported [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], then add a [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] child to your [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].
>
>    *(image in the full Top G Vault)*
>
> 1. Select the [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] object, then in the **Properties** window, click each property value and assign the appropriate texture image from the asset dropdown:
>
>    1. Set the **ColorMap** to the **\_ALB** texture image.
>    1. Set the **MetalnessMap** to the **\_MTL** texture image.
>    1. Set the **NormalMap** to the **\_NOR** texture image.
>    1. Set the **RoughnessMap** to the **\_RGH** texture image.
>
>    *(image in the full Top G Vault)*

## Convert rigid accessories

After importing your asset into Studio, you can begin **fitting** your imported object to a mannequin and **converting** the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object into a [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]]. When fitting and converting your accessory, it's important to use the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] (AFT) to correctly preview the placement and apply the correct configurations to your accessory.

To fit and generate your rigid accessory:

1. In the toolbar's **Avatar** tab, click **Accessory** to open the AFT. The **Accessory Fitting Tool** panel displays.
1. In the panel:

   1. Select the **Part** field, then in the **Explorer** window, select the rigid accessory [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] object.
   1. Back in the panel, click the **Next** button. The **Asset Type** page displays.

   *(image in the full Top G Vault)*

1. In the **Asset Type** page:

   1. Set asset type to **Accessory**, then use the dropdown menu to choose the location of where you want the rigid accessory to attach to a character's body.
   1. Set body type to the [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications#Body scale|body scale]] you determined while sculpting and sizing of the asset during the creation process, then click the **Next** button. A preview panel displays with a default character wearing your rigid accessory.

   *(image in the full Top G Vault)*

1. Select one of the humanoid characters as a mannequin:

   1. In the **Avatars** section, select a humanoid character body.
   1. In the preview panel, deselect the previous selection. Your character body selection displays in the preview window.

      *(image in the full Top G Vault)*

1. Using both the AFT preview window and the viewport, adjust the position, scale, and rotation of the rigid accessory.

   1. Use the AFT preview window and your mannequin as an accurate preview of how your asset fits on the character. The clothing mannequin in the viewport does not accurately portray how rigid accessories attach.
   1. In the viewport, use the **Move**, **Scale**, and **Rotate** tools to adjust the positioning of your rigid accessory.
   1. If you accidentally select something else, click back into the AFT panel to reselect the accessory and resume your adjustments using the transformation tools.

      [Video: Fitting-Bow.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Fitting-Bow.mp4)

1. After previewing and fitting your asset, click the **Generate MeshPart Accessory** button. Your 3D model populates in your project as an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] object.

With this [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] object, you can perform any of the following:

- Begin the process of [[30 Official Roblox Docs/Marketplace/Publish to Marketplace#Upload an asset|uploading and publishing]] the rigid accessory to the Marketplace.

- Use the rigid accessory in your current game by equipping it to character models with a [[30 Official Roblox Docs/Characters/Character appearance#Manually modify appearance|HumanoidDescription]], or by dragging and dropping the rigid accessory under the appropriate character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object.

- Save the rigid accessory to your [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) or make it public on the [[30 Official Roblox Docs/Production/Creator Store|Creator Store]] to use within any of your games or share with other creators.

---
*Source: [Import rigid accessories](https://create.roblox.com/docs/avatar/rigid-accessories/import) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
