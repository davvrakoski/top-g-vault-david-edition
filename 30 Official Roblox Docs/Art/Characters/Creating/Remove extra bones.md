---
title: "Remove extra bones"
description: "When creating characters in Blender, you must remove the extra head bones included in the template."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/characters/creating/remove-extra-bones"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*When creating characters in Blender, you must remove the extra head bones included in the template.*

The helper bones used to help place the head geometries also require removal to validate correctly. While these extra bones do not include any skinning data, do not delete any of the facial animation bones parented within DynamicHead, as these include important skinning data that drives facial animation.

> [!danger]
> Failure to [[30 Official Roblox Docs/Art/Characters/Creating/Combine head geometry|combine head geometry]] and remove head bones will cause issues with validation, as the character will no longer adhere to the standard [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Body parts|geometry]] and [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging|joint hierarchy]].

Remove the additional head bones by selecting them and deleting them in edit mode:

1. If required for your template, toggle visibility on your **Armature** object. The bones display in the viewport.
1. In the Outliner, expand the character's armature object and find the **Joints** object that parents the bone structure of the character.

   *(image in the full Top G Vault)*

1. Expand the **Joints** object's hierarchy by holding <kbd>Shift</kbd> and clicking the expansion dropdown.
1. In the viewport, select any bone and switch to **Edit** mode.
1. Under the `Head` joint, hold <kbd>Shift</kbd> and select all the head child joints except `DynamicHead`.

   *(image in the full Top G Vault)*

1. With the extra head bones selected, right-click in the viewport and select **Delete Selected Bones** from the contextual menu.

   [Video: Cleanup_01-1.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Cleanup_01-1.mp4)

---
*Source: [Remove extra bones](https://create.roblox.com/docs/art/characters/creating/remove-extra-bones) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
