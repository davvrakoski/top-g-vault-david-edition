---
title: "Import"
description: "Use the Importer to import your custom accessory into Studio."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/creating/importing"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use the Importer to import your custom accessory into Studio.*

After creating your t-shirt in Blender, import the `.fbx` using Studio's Importer tool to add the t-shirt to your project as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].

Use the Importer to import your `.fbx` into Studio:

1. In the **Home** tab, click the **Import** button to open the Importer. A file browser opens.
1. Select your t-shirt's `.fbx` file. The Importer loads a preview of the layered accessory.
1. Select **Import**. The asset populates in your workspace as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] with the appropriate textures applied as a [[30 Official Roblox Docs/API Reference/Classes/MeshPart#TextureID|MeshPart.TextureID]].

   *(image in the full Top G Vault)*

> [!note]- Textures didn't load correctly?
> If your textures didn't load correctly, you can import them manually using the [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md):
>
> 1. In the **Asset Manager**, click the **Import** button. If you are unable to access the Asset Manager, save and publish your game first.
> 1. Upload your image file.
> 1. After moderation clears your image, select the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] parented within your imported [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].
> 1. In the **TextureID** property, select the value field and add the asset ID of the texture image.

---
*Source: [Import](https://create.roblox.com/docs/art/accessories/creating/importing) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
