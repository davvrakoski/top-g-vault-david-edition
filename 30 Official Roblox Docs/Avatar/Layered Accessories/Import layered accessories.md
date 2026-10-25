---
title: "Import layered accessories"
description: "Use the Importer to add third-party models to Studio before using the Accessory Fitting Tool to convert the model to an Accessory."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/layered-accessories/import"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use the Importer to add third-party models to Studio before using the Accessory Fitting Tool to convert the model to an Accessory.*

Studio's Importer lets you import 3D assets into your projects, such as character bodies, makeup, and layered accessories. The following instructions detail how to import a layered accessory `.fbx` or `.gltf` file into Studio as a `Model` object and convert it into an `Accessory` object that you can use in your games, upload to the Marketplace, or share with other creators.

While the Importer provides object previews and error-checking to ensure that your creation meets Roblox's [[30 Official Roblox Docs/Art/Modeling/General specifications|general 3D requirements]], it's important to ensure that your character model also meets Roblox's [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|layered accessory specifications]] to use or sell this asset as an avatar-ready layered accessory, otherwise you can encounter errors at different points in the workflow.

## Import accessories

To import your asset as a layered accessory:

1. In the **Home** tab, click the **Import** button to open the Importer. A file browser opens.
1. Select your layered accessory's `.fbx` or `.gltf` file. The Importer loads a preview of the layered accessory.

      *(image in the full Top G Vault)*

1. Select **Import**. The asset populates in your workspace as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] with the appropriate textures applied as a [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|MeshPart.TextureID]].

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

## Convert layered accessories

After importing your asset into Studio, you can begin **converting** the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object into a [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] using the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] (AFT) so that avatar character bodies can equip your layered accessory.

> [!warning]
> For shoes, you must convert the left shoe and the right shoe as separate layered accessories. Use the following instructions for each shoe before grouping both shoe accessories as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] when [[30 Official Roblox Docs/Marketplace/Publish to Marketplace#Upload an asset|saving to Roblox]].

To generate your layered accessory:

1. In the toolbar's **Avatar** tab, click **Accessory** to open the AFT. The **Accessory Fitting Tool** panel displays.
1. In the panel:

   1. Select the **Part** field, then in the **Explorer** window, select the layered accessory [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] object.
   1. Back in the panel, click the **Next** button. The **Asset Type** page displays.

   *(image in the full Top G Vault)*

1. In the **Asset Type** page:

   1. Set asset type to **Clothing**, then use the dropdown menu to choose the clothing type of your layered accessory.
   1. Click the **Next** button. A preview panel displays with a default character wearing your layered accessory.

   *(image in the full Top G Vault)*

1. [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool#Test accessories|Test]] out various sample characters and animations to make sure your layered accessory is deforming and moving correctly.

   - If necessary, make minor cage adjustments using the editing features. Larger cage changes may require returning to your third-party modeling software and re-exporting the asset.

1. After previewing your asset, click the **Generate MeshPart Accessory** button. Your 3D model populates in your project as an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] object.

With this [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] object, you can perform any of the following:

- Begin the process of [[30 Official Roblox Docs/Marketplace/Publish to Marketplace#Upload an asset|uploading and publishing]] the layered accessory to the Marketplace.

- Use the layered accessory in your current game by equipping it to character models with [[30 Official Roblox Docs/Characters/Character appearance#Manually modify appearance|HumanoidDescription]], or by dragging and dropping the layered accessory under the appropriate character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object.

- Save the layered accessory to your [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) or make it public on the [[30 Official Roblox Docs/Production/Creator Store|Creator Store]] to use within any of your games or share with other creators.

---
*Source: [Import layered accessories](https://create.roblox.com/docs/avatar/layered-accessories/import) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
