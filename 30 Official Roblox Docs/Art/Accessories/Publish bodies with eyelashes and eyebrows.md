---
title: "Publish bodies with eyelashes and eyebrows"
description: "Eyelashes and eyebrows are optional accessory items you can equip to an avatar to publish in the Marketplace."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/accessories/publish-eyebrows-eyelashes"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Eyelashes and eyebrows are optional accessory items you can equip to an avatar to publish in the Marketplace.*

Eyelashes and eyebrows are cosmetics that can help emphasize facial features and create a unique way of customizing a character. Similar to clothing, eyelashes and eyebrows are [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories|3D layered accessories]] that can stretch and fit over different face shapes and can deform and stretch with character face animations.

*(image in the full Top G Vault)*

*Character body without eyelashes and eyebrows*

*(image in the full Top G Vault)*

*Character body with eyelashes and eyebrows*

*(image in the full Top G Vault)*

*Standalone eyelashes and eyebrows*

When publishing eyelashes and eyebrows, you must parent these [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] objects under the avatar character's [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] prior to uploading the character `Model` to the Marketplace. These `Accessory` face objects must adhere to Roblox's accessory requirements and include layered components such as caging, rigging, and skinning components. For an overview on creating your own eyelashes and eyebrows, see [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create face accessories|Create face accessories]]. Eyebrows and eyelashes must use [[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer|Automatic Skinning Transfer]] with the `RBX_Leader` and `RBX_Follower` special joints to be published on the marketplace.

> [!warning]
> At this time, you can only bundle **eyelashes**, **eyebrows**, and **hair** with your body on Marketplace upload. Other facial accessories, such as horns, makeup, glitter, or other cosmetics are not acceptable. See [[30 Official Roblox Docs/Marketplace/Marketplace policy|Marketplace policy]] for specific information on allowable cosmetics and other policy regulations and guidelines.

## Configure eyelash and eyebrow accessories

Use the following steps to import your face accessory and body assets into Studio. After converting the eyelashes and eyebrows to `Accessory` objects, parent the `Accessory` objects within the character `Model` before uploading the character to the Marketplace.

You can download reference `.fbx` models of [eyelashes](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/reference-files/Eyelashes.fbx), [eyebrows](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/reference-files/Eyebrows.fbx), and an [avatar body](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/reference-files/AnimeFemale-Studio-Ready.fbx) to follow along this process.

1. In the [[30 Official Roblox Docs/Studio/Importer|Importer]], import the `.fbx` files of your face accessory and body. The eyelashes, eyebrows, and body each populate in your Workspace as a `Model`.
   1. If you are using the reference body, set **Rig General** > **Rig Type** to **Rthro**.
2. Use the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] and select the **Eyelash** or **Eyebrow** model and click **Next**.

   *(image in the full Top G Vault)*

3. Select the appropriate **Accessory** > **Eyelash** or **Accessory** > **Eyebrow** asset type and click **Next**.
4. **OPTIONAL** Preview the fit of your face accessory.
   1. If the face accessory was modeled on a specific character body, you may want to import that character body into Studio and use it as a mannequin in the fitting tool's preview. See [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] for more information on adding custom characters.
   2. If using the provided reference body, you can continue to step 5.
5. Click **Generate MeshPart Accessory** to create your MeshPart.
6. **Repeat steps 2-5** for the other face accessory.
7. In the Outliner, **drag and drop** the face `Accessory` objects within the character `Model` instance. The accessories automatically equip and attach to the correct areas of your avatar character.

   *(image in the full Top G Vault)*

   *Workspace preview of body with face accessories*

   *(image in the full Top G Vault)*

   *Outliner hierarchy*

8. If required, rename the accessory objects to `EyelashAccessory` or `EyebrowAccessory` accordingly.

9. Once you are ready to upload the avatar model with your face accessories, see [[30 Official Roblox Docs/Marketplace/Publish to Marketplace#Upload an asset|Upload an asset]] for instructions on uploading and publishing your avatar body with eyelashes and eyebrows to the Marketplace.

---
*Source: [Publish bodies with eyelashes and eyebrows](https://create.roblox.com/docs/art/accessories/publish-eyebrows-eyelashes) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
