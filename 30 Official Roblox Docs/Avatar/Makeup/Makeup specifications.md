---
title: "Makeup specifications"
description: "Makeup is a cosmetic look made up of multiple facial textures and optional eyebrow and eyelashes."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/makeup/specifications"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Makeup is a cosmetic look made up of multiple facial textures and optional eyebrow and eyelashes.*

Makeup requires a specific set of components and configuration standards to ensure it displays properly on avatar faces of all shapes and sizes. Before you start the export process, verify that your makeup meets the following specifications and guidelines for proper Studio compatibility.

When you're ready to export your makeup, reference all [[30 Official Roblox Docs/Avatar/Makeup/Reassign textures|export setting requirements]] for Blender and Maya.

> [!info] For other types of 3D models:
> - [[30 Official Roblox Docs/Art/Modeling/General specifications|General mesh]] specifications.
> - [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications|Rigid accessory]] specifications.
> - [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|Layered accessory]] specifications.

## General

If you are following the best practice [[30 Official Roblox Docs/Avatar/Makeup/Makeup#Creation process|creation process]], ensure that your template file submission includes the following objects that are correctly configured and named in their respective third-party modeling software:

*(image in the full Top G Vault)*

- A **head mesh object** and associated **cage mesh object**.
  - These two objects must include the prefix "TransferTarget_" in their name.
- **TransferTexture mesh objects** for each region: `Eyes`, `Face`, `Lips`.
  - These three objects must follow the following naming conventions.
    - `TransferTexture_Eyes_01`
    - `TransferTexture_Lips_01`
    - `TransferTexture_Face_01`
    - Any for multiple regions, increment the affix number: `TransferTexture_Face_02`
- Optional [[30 Official Roblox Docs/Avatar/Makeup/Makeup specifications#Eyebrows and eyelashes|eyebrows and eyelashes]].

> [!warning]
> The [provided Roblox makeup template head](https://github.com/Roblox/avatar/tree/main/Makeup) should already be properly configured with the correct objects and naming conventions. To prevent issues with import, avoid renaming or deleting the data model of the template head when creating your own makeup.

## Decals and textures

All accessory textures must meet Roblox's [[30 Official Roblox Docs/Art/Modeling/Texture specifications|texture specifications]], but makeup textures include two additional considerations:

- There is a 4K texture limit for [[30 Official Roblox Docs/Avatar/Avatar in-experience creation|in-game]] makeup creation.
- There is a 1K texture limit for makeup that you upload to the [Marketplace](https://www.roblox.com/catalog).

For additional information on PBR textures, see [[30 Official Roblox Docs/Art/Modeling/PBR textures|PBR textures]].

## Eyebrows and eyelashes

Eyebrows and eyelashes are optional layered accessories for makeup looks. If you choose to include them in your creations, they must meet all [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|layered accessory requirements]], notably:

- **Cage data** - Eyebrows and eyelashes each require their own inner and outer cage.

  *(image in the full Top G Vault)*

  - Eyebrows and eyelashes can also take advantage of automatic skinning, specifically with [[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer#Special skinning transfer joints|special skinning joints]].

- **Geometry size** - Eye accessories can't exceed the [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|maximum dimensions]] for their asset type.
- **Budgets** - Eye accessories can't exceed 4k triangles each.

---
*Source: [Makeup specifications](https://create.roblox.com/docs/avatar/makeup/specifications) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
