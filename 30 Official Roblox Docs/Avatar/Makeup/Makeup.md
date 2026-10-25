---
title: "Makeup"
description: "Makeup is a cosmetic look made up of multiple facial textures and optional eyebrow and eyelashes."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/makeup"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Makeup is a cosmetic look made up of multiple facial textures and optional eyebrow and eyelashes.*

**Makeup** is a cosmetic item that you can apply to a face of an avatar or non-playable character for additional creative expression, such as traditional makeup art (e.g., eyeshadow, lipstick, and blush), face paint, battle markings, and camouflage.

Makeup is made up of multiple specialized texture layers baked into a [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] object, and each texture layer contains a unique makeup component like the lips or eyes region. Players can purchase makeup as a set on the [Marketplace](https://www.roblox.com/catalog) and apply it as a complete cohesive look, or swap out individual makeup components for others that match their own avatar's style.

> [!info]
> This guide covers authoring makeup assets in Studio. To let players create and purchase makeup directly within your experience at runtime, see [[30 Official Roblox Docs/Avatar/In-experience creation for makeup|In-experience creation for makeup]].

*(image in the full Top G Vault)*

*Complete look*

*(image in the full Top G Vault)*

*Eyes texture layer*

*(image in the full Top G Vault)*

*Lip texture layer*

*(image in the full Top G Vault)*

*Face texture layer*

This guide provides several [[30 Official Roblox Docs/Avatar/Makeup/Makeup#Resources|makeup templates]] that you can use within your creation process, such as:

- Template textures that you can use in 2D editing software to author makeup.
- Template heads that you can use to view and test your makeup before export.
- Reference game you can use to import and test your makeup assets on characters with different skin tones and body types.

You can either use these templates as a pure reference to see how everything works, or you can use all of them at each step of the suggested creation process.

*(image in the full Top G Vault)*

*Reference template render*

*(image in the full Top G Vault)*

*Reference template data model*

## Makeup components

You can apply textures to three primary regions of the face: the eyes region, lips region, and face region. Each region has overlapping surfaces with other regions to allow for seamless, continuous looks between makeup components.

*(image in the full Top G Vault)*

*Eyes region*

*(image in the full Top G Vault)*

*Lips region*

*(image in the full Top G Vault)*

*Face region*

In addition, you can include eyebrows and eyelashes with your makeup creations. Eyebrows and eyelashes are [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] objects that contain [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects with skinning and caging data. This allows them to animate properly as the character's face changes expressions.

*(image in the full Top G Vault)*

*Eyebrow and eyelash mesh objects*

*(image in the full Top G Vault)*

*Eyebrow and eyelash data model*

When you import your makeup creation from your favorite third-party modeling software into the [[30 Official Roblox Docs/Avatar/Makeup/Makeup#Reference game|reference game]], Studio automatically detects mesh names, then generates the necessary [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] objects under the imported model. You can then quickly apply your makeup [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] objects and accessories by dragging them from the imported reference head into a character's **Makeup** or **Accessories** folder.

*(image in the full Top G Vault)*

*The imported model contains your makeup decals and face accessories*

*(image in the full Top G Vault)*

*Your makeup displays at runtime when you drag your makeup assets into the correct folders*

> [!info]
> Makeup assets that you create for the [Marketplace](https://www.roblox.com/catalog) can include up to 6 total [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] objects, comprised of any combination of regions.

## Resources

The following are downloadable resources you can use within the creation process:

- See [[30 Official Roblox Docs/Avatar/Makeup/Makeup#Template textures|Template textures]] for image and project files you can use in 2D editing software like GIMP or Photoshop.
- See [[30 Official Roblox Docs/Avatar/Makeup/Makeup#Template heads|Template heads]] for required 3D models you can use to view and test your makeup assets.
- See [[30 Official Roblox Docs/Avatar/Makeup/Makeup#Reference game|Reference game]] to import and test your makeup assets into Studio

> [!info]
> For resources that include two templates, in almost every case **it's recommended to use the mesh template** to create makeup because:
>
> - It's easier and more intuitive to use because it mimics applying makeup in the real world.
> - It contains a higher-fidelity mesh and UVs with minimal distortion.
>
> Some creators prefer using the cage template because there is only one transfer when projecting the texture, while there are two transfers before projecting the texture for the mesh template. This can result in makeup transferring more accurately with less artifacts.

> [!warning]
> Be sure to review your options **before** starting to create makeup because you cannot start with one template, then transfer your makeup to the other.

### Template textures

When you are finished making changes to any of the following template texture images:

1. Export your new textures.

   > [!note]- Exporting from Photoshop
   > ![](https://www.youtube.com/watch?v=0se12PNhVCI)
   >
   >
   >
   > > [!info]
   > > The video presenter uses **File** > **Export** > **Layers to Files** to export each layer as its own `.png` file.

   > [!note]- Exporting from Substance Painter
   > ![](https://www.youtube.com/watch?v=g79GBh0AcXA)

   > [!note]- Exporting from Procreate
   > To export textures from Procreate:
   >
   >   1. Navigate to the **Layers** pane, then hide everything but your first makeup component layer, such as your eyes, lips, or face layer.
   >
   >      *(image in the full Top G Vault)*
   >
   >   1. With your makeup component layer active, navigate to the **Actions** menu > **Share** tab > **Share Textures - PNG** to save all of your makeup component's textures to a location on your device.
   >
   >      *(image in the full Top G Vault)*
   >      *(image in the full Top G Vault)*
   >
   >   1. Delete all of the head, eyebrows, and eyelash textures.
   >      1. Open the location where you saved all of your makeup component's textures.
   >      1. Delete everything except for the following PBR textures:
   >         - `TransferTarget_FullHead_Mat-Color`
   >         - `TransferTarget_FullHead_Mat-Metallic`
   >         - `TransferTarget_FullHead_Mat-Roughness`
   >   1. Replace your makeup component's `TransferTarget_FullHead_Mat-Color` layer with a version that will export transparency in the output texture.
   >      1. Copy your active makeup component layer.
   >      1. Navigate to the **Gallery** > **Plus** icon > **Clipboard**. A new Procreate file displays with your makeup component layer.
   >
   >         *(image in the full Top G Vault)*
   >
   >      1. In the **Layers** pane, disable the **Background color** layer. Your makeup component displays without a background.
   >
   >         *(image in the full Top G Vault)*
   >
   >      1. With your makeup component layer active, navigate to the **Actions** menu > **Share** tab > **Share Image - PNG**.
   >      1. In the file browser, navigate to the location on your device with all of your makeup component's textures, then save/override the `TransferTarget_FullHead_Mat-Color` texture.
   >   1. Rename your makeup component's PBR textures appropriately so that you can easily reference each makeup component's PBR data when you reassign your textures in Blender or Maya. For example, if you are exporting texture maps for lips:
   >      - `Lips-Color`
   >      - `Lips-Metallic`
   >      - `Lips-Roughness`
   >   1. Repeat this process for every makeup component you want to import for your makeup look.
   >
   >      *(image in the full Top G Vault)*

2. [[30 Official Roblox Docs/Avatar/Makeup/Reassign textures|Reassign the preset textures]] in a [[30 Official Roblox Docs/Avatar/Makeup/Makeup#Template heads|template head]] with your new textures.
3. [[30 Official Roblox Docs/Avatar/Makeup/Import into Studio|Import the reference head]] with your new textures into Studio.

Photoshop / GIMP texture images

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

A comprehensive `.zip` folder with realistic texture images for use in Photoshop or your preferred image editor.

[Mesh Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/Photoshop-Gimp-Realistic-Mesh.zip)

[Cage Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/Photoshop-Gimp-Realistic-Cage.zip)

Substance Painter files

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

A comprehensive `.zip` folder with realistic texture files for use in Substance Painter, an industry-standard PBR authoring software.

[Mesh Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/SubstancePainter-Realistic-Mesh.zip)

[Cage Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/SubstancePainter-Realistic-Cage.zip)

Procreate texture images

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

A comprehensive `.zip` folder with realistic texture images for use in Procreate.

[Mesh Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/Procreate-Realistic-Mesh.zip)

[Cage Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/Procreate-Realistic-Cage.zip)

Photoshop / GIMP texture images

*(image in the full Top G Vault)*

A comprehensive `.zip` folder with blocky texture images for use in Photoshop or your preferred image editor.

[Mesh Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/Photoshop-Gimp-Blocky-Mesh.zip)

Substance Painter files

*(image in the full Top G Vault)*

A comprehensive `.zip` folder with blocky texture files for use in Substance Painter, an industry-standard PBR authoring software.

[Mesh Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/SubstancePainter-Blocky-Mesh.zip)

Procreate texture images

*(image in the full Top G Vault)*

A comprehensive `.zip` folder with blocky texture images for use in Procreate.

[Mesh Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/Procreate-Blocky-Mesh.zip)

### Template heads

Each template head includes:

- Target head mesh object or head cage mesh object
- Eye, lip, and multiple face region mesh objects, fully linked to reference PBR textures
- Eyebrows and eyelash mesh objects

> [!info]
> The Blender and Maya templates also include a facial region reference `.png` file that you can use to reference how your makeup assets fit into the eye, lips, and face/cheek regions.

Blender template reference files

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

A comprehensive `.zip` folder of Blender assets, including multiple realistic reference heads pre-configured for testing in the Makeup test place or for authoring your own makeup.

[Mesh Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/Blender-Realistic-Mesh.zip)

[Cage Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/Blender-Realistic-Cage.zip)

Maya template reference files

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

A comprehensive `.zip` folder of Maya assets, including multiple realistic reference heads pre-configured for testing in the Makeup test place or for authoring your own makeup.

[Mesh Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/Maya-Realistic-Mesh.zip)

[Cage Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/Maya-Realistic-Cage.zip)

FBX / GLTF template reference files

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

A comprehensive `.zip` folder of `.fbx` and `.gltf` assets, including realistic heads with various example makeup looks that are ready to be implemented into Studio for testing purposes.

[Mesh Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/FBX-GLTF-Realistic-Mesh.zip)

[Cage Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/FBX-GLTF-Realistic-Cage.zip)

<br>

Blender template reference files

*(image in the full Top G Vault)*

A comprehensive `.zip` folder of Blender assets, including multiple blocky reference heads pre-configured for testing in the Makeup test place or for authoring your own makeup.

[Mesh Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/Blender-Blocky-Mesh.zip)

Maya template reference files

*(image in the full Top G Vault)*

A comprehensive `.zip` folder of Maya assets, including multiple blocky reference heads pre-configured for testing in the Makeup test place or for authoring your own makeup.

[Mesh Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/Maya-Blocky-Mesh.zip)

FBX / GLTF template reference files

*(image in the full Top G Vault)*

A comprehensive `.zip` folder of `.fbx` and `.gltf` assets, including blocky heads with various example makeup looks that are ready to be implemented into Studio for testing purposes.

[Mesh Template](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/makeup/resources/FBX-GLTF-Blocky-Mesh.zip)

### Reference game

Reference place file (download)

*(image in the full Top G Vault)*

At this time, you can only test makeup on the downloadable placefile.
<br>
In Github, select the download icon on the right-side to download the `MakeupBeta.zip` file.

[Github link](https://github.com/Roblox/avatar/blob/main/Makeup/MakeupBeta.zip)

## Creation process

> [!warning]
> This process assumes that you are proficient in 3D modeling software, such as Blender or Maya, and that you understand how to update, replace, export, save, and alter materials within your modeling tool and any additional texturing software or plugins.

*(image in the full Top G Vault)*

*Download the 3D reference template head and texture templates applicable to your workflow.*

*(image in the full Top G Vault)*

*Modify the texture images in the tools of your choice.*

*(image in the full Top G Vault)*

*In Blender or Maya, replace the textures in the template with your new textures and export.*

While you can easily swap [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] objects in Studio to make a quick change to a character's makeup, the following instruction is best practice for implementing PBR-based textures into Roblox makeup at scale. This process requires:

- The [[30 Official Roblox Docs/Avatar/Makeup/Makeup#Resources|Makeup test place and template files]]
- A 3D modeling tool such as [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview)
- Any PBR texturing software, such as [Substance Painter](https://www.adobe.com/products/substance3d/apps/painter.html), [Materialize](http://boundingboxsoftware.com/materialize/index.php), or plugins like [Ucupaint](https://extensions.blender.org/add-ons/ucupaint/) (Blender).

As always with 3D art and creation workflows, there are many ways to achieve a specific goal, and the makeup and PBR publishing flow is no exception. It's recommended to try the workflow in this guide first, then adjust as necessary for your own creation requirements:

1. Download a [[30 Official Roblox Docs/Avatar/Makeup/Makeup#Resources|reference template head]] and open it in the general modeling software of your choice.
2. Using your texturing tools or image editing software, modify the texture images associated with the different regions: `TransferTexture_Eyes`, `TransferTexture_Face`, or `TransferTexture_Lips`.
3. When you've created your new texture images, use Blender or Maya to reassign the existing file textures in the template. For more information, see [[30 Official Roblox Docs/Avatar/Makeup/Reassign textures|Reassign textures]].
4. Review [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head caging best practices|Face caging best practices]] for guidance on how to adjust face cages so that your makeup displays correctly for your use case.
5. Export the entire template file as a `.fbx` or `.gltf`. All 3D modeling [[30 Official Roblox Docs/Art/Modeling/Export settings|export requirements]] apply, but there are a few makeup-specific settings you must configure:

   - If you are using Blender,
     1. In the export file browser window, navigate to the **Include** section, then enable the **Custom Properties** toggle for makeup UV data transfer purposes.
     1. In the **Armature** section, enable **Only Deform Bones** to ensure your export file includes skinning data for eyebrows and eyelashes.

       *(image in the full Top G Vault)*

       *All necessary Blender export settings for makeup*

   - If you are using Maya, in the export file browser window, navigate to the **Deformed Models** section, then enable the **Skins** toggle to ensure your export file includes skinning data for eyebrows and eyelashes.

       *(image in the full Top G Vault)*

6. [[30 Official Roblox Docs/Avatar/Makeup/Import into Studio|Import]] the template file into Studio. Studio automatically detects your mesh object names and associated textures, and generates `Decal` objects.

   *(image in the full Top G Vault)*

7. Apply any makeup decals or eyebrow and eyelash accessories to characters in the test place by dropping makeup assets in the appropriate character's `Makeup` or `Accessories` folder.

   *(image in the full Top G Vault)*

8. Click the **Play** button, then navigate to the character with new makeup assets to preview.

---
*Source: [Makeup](https://create.roblox.com/docs/avatar/makeup) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
