---
title: "Work with third-party software"
description: "An overview of how to incorporate content created from other software into Studio."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/overview-dcc"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*An overview of how to incorporate content created from other software into Studio.*

Creators on Roblox often leverage third-party creation tools to make custom assets and content. These external tools typically specialize in areas like **3D modeling**, **texture creation**, or **audio editing**, and offer additional features and flexibility that complement the Roblox Engine. Check out [Roblox staff 3D art articles](https://devforum.roblox.com/tags/c/resources/roblox-staff/278/art) for guides, tips, and tutorials on using various third-party software.

In most workflows, you create custom assets in [[30 Official Roblox Docs/Art/Work with third-party software#Examples of third-party software|third-party software]], export them as a common file type, and then [[30 Official Roblox Docs/Art/Work with third-party software#Import to Studio|import the file into Studio]].

## Examples of third-party software

The following are examples of third-party software that creators commonly use:

- **3D modeling software**

  - Creators use external 3D modeling software such as [Blender](https://www.blender.org/), [Maya](https://www.autodesk.com/products/maya/overview), or [Cinema 4D](https://www.maxon.net/en/cinema-4d) to design intricate and detailed 3D models. These models can include characters, props, and environmental assets.

- **Image editors and texture creation tools**

  - Graphics designers and texture artists can use tools like [Photoshop](https://www.adobe.com/products/photoshop) or [Substance Painter](https://www.adobe.com/products/substance3d-painter) to create high-quality images. You can use these images for graphic interfaces or as textures for your 3D models. These tools allow for detailed painting, mapping, and manipulation of textures to achieve realistic or stylized effects.

- **Audio editing software**

  - Creators working on sound design or music for their Roblox games might use external audio editing software like [Audacity](https://www.audacityteam.org/) or [Reaper](https://www.reaper.fm/). These tools allow for precise control when creating audio assets.

By using third-party software, creators can tap into specialized features, workflows, and expertise, while expanding their creative possibilities and enhancing the overall quality of their Roblox games.

## Import to Studio

Studio provides several tools to get your third-party content into Studio depending on the type of asset you upload:

- Models

  - Uploaded models must follow Studio's [[30 Official Roblox Docs/Art/Modeling/General specifications|modeling specifications]].
  - Studio's [[30 Official Roblox Docs/Studio/Importer|Importer]] supports `.gltf`, `.fbx`, `.obj` file formats.
  - You can also use tools like the [[30 Official Roblox Docs/Art/Modeling/Roblox Blender plugin|Roblox Blender plugin]] to connect your modeling software to Studio and directly upload your modeling assets between applications.

- Images

  - Uploaded textures must follow Studio's [[30 Official Roblox Docs/Art/Modeling/General specifications|texture specifications]].
  - Studio's [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) supports `.png`, `.jpg`, `.gif`, `.tga`, or `.bmp` file formats and allows for bulk file imports.

- Sounds

  - Uploaded sounds must follow Roblox's [[30 Official Roblox Docs/Audio/Audio assets#Import audio|audio asset requirements]].
  - Studio's [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) supports `.ogg`, `.mp3`, `.flac`, and `.wav` file formats and allows for bulk file imports.

- Video

  - You can import video assets in either `.mp4` or `.mov` format if all of the [[30 Official Roblox Docs/UI/Video frames|requirements]] are met.

> [!warning]
> Roblox performs asset moderation on upload of any asset type. Roblox can also moderate assets after the initial upload. For more information, see [Asset moderation](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md).

---
*Source: [Work with third-party software](https://create.roblox.com/docs/art/overview-dcc) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
