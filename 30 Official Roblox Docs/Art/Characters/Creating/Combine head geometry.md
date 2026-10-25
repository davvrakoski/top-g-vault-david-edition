---
title: "Combine head geometry"
description: "When creating characters in Blender, you must combine the head geometry to a single object."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/characters/creating/combine-head-geometry"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*When creating characters in Blender, you must combine the head geometry to a single object.*

Whenever you are ready to export your model, it's important to clean up your project to ensure that your model is ready to export. This includes the following tasks that ensure the customized template model and all of the avatar components can import into Studio successfully:

- Combining extra head geometry
- Removing extra head bones
- Verifying attachment points
- Final technical checks

> [!danger]
> Failure to combine head geometry and [[30 Official Roblox Docs/Art/Characters/Creating/Remove extra bones|remove head bones]] will cause issues with validation, as the character will no longer adhere to the expected standard [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Body parts|geometry]] and [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging|joint hierarchy]].

## Combine head geometry

At this point, you should also combine the separate head and face objects within the single `Head_Geo` object. Some templates don't include some face objects, like lashes. To combine the head and face meshes:

1. In the Outliner, hold <kbd>Ctrl</kbd>/<kbd>⌘</kbd> and click the following objects, ending with the `Head_Geo`:

   - `UpperTeeth_Geo`
   - `LowerTeeth_Geo`
   - `Tongue_Geo`
   - `RightLash_Geo`
   - `RightEye_Geo`
   - `LeftLash_Geo`
   - `LeftEye_Geo`
   - `Head_Geo`

   *(image in the full Top G Vault)*

   > [!danger]
   > When selecting multiple head objects, make sure that the `Head_Geo` is highlighted as yellow, indicating it as the main object that the others merge into. This correctly preserves the custom properties stored in the head mesh. You can achieve this by selecting the head last in the Outliner.

1. While in **Object** mode, right-click in the viewport and select **Join** from the contextual menu. The objects combine as a single `Head_Geo` object.

   [Video: Cleanup_01.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Cleanup_01.mp4)

---
*Source: [Combine head geometry](https://create.roblox.com/docs/art/characters/creating/combine-head-geometry) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
