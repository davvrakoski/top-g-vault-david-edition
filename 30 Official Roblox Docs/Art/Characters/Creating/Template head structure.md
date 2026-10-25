---
title: "Template head structure"
description: "Each Roblox avatar template contains modular separate pieces that must later be combined or removed."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/characters/creating/head-objects"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Each Roblox avatar template contains modular separate pieces that must later be combined or removed.*

Each avatar character body template includes extra head mesh objects and face armature bones. Separating these objects within the templates allows you to make easier changes to each of these separate objects, as demonstrated during the texturing section of this tutorial.

To avoid validation errors, you must [[30 Official Roblox Docs/Art/Characters/Creating/Combine head geometry|join]] and [[30 Official Roblox Docs/Art/Characters/Creating/Remove extra bones|remove]] these extra objects during the cleanup process prior to exporting.

The extra head mesh objects are the following:

- Head_Geo
- UpperTeeth_Geo
- LowerTeeth_Geo
- Tongue_Geo
- RightLash_Geo
- RightEye_Geo
- LeftLash_Geo
- LeftEye_Geo

*(image in the full Top G Vault)*

*Extra head-related meshes in Blender's Outliner*

The extra head bone children are the following and may differ between templates:

- Tongue
- LowerTeeth
- UpperTeeth
- LeftEye
- RightEye

*(image in the full Top G Vault)*

*Extra head-related bones in Blender's Outliner*

While these extra objects exist to aid the creation and modification process, leaving them in your project on final export will cause validation issues when uploading these assets to the Marketplace.

---
*Source: [Template head structure](https://create.roblox.com/docs/art/characters/creating/head-objects) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
