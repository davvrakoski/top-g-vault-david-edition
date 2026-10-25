---
title: "Use Studio's Importer"
description: "Use Studio's Importer to import a third-party 3D model into Studio."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/creating-rigid/importing"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use Studio's Importer to import a third-party 3D model into Studio.*

[Video: Importing.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Importing.mp4)

Studio's Importer provides a quick and easy way to import third-party 3D `.fbx` or `.gltf` assets into your projects. The importer provides object previews and error-checking to ensure that your asset meets Studio's general 3D requirements.

<br>

To import your asset ([downloadable reference](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/accessories/creating-rigid/Chest-Texturing-Complete.fbx)):

1. In the **Home** tab, click the **Import** button to open the Importer. A file browser opens.
1. Select your asset's `.fbx` file. The Importer loads a preview of the rigid accessory.
1. Select **Import**. The asset populates in your workspace as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] with the appropriate textures applied as a [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|MeshPart.TextureID]].

> [!note]- Textures didn't load correctly?
> If your textures didn't load correctly, you can import them manually using the [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md):
>
> 1. In the **Asset Manager**, click the **Import** button. If you are unable to access the Asset Manager, save and publish your game first.
> 1. Upload your image file.
> 1. After moderation clears your image, select the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] parented within your imported [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].
> 1. In the **TextureID** property, select the value field and add the asset ID of the texture image.

> [!success]
> After successful import, your model object populates in your project as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] with the appropriate textures applied. See [[30 Official Roblox Docs/Studio/Importer|Importer]] for additional information on import settings and troubleshooting.

---
*Source: [Use Studio's Importer](https://create.roblox.com/docs/art/accessories/creating-rigid/importing) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
