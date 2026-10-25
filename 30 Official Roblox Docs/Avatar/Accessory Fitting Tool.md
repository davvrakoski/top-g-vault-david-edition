---
title: "Accessory Fitting Tool"
description: "The Accessory Fitting Tool lets you adjust and test custom accessory models on different body types, animations, or custom assets."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/accessory-fitting-tool"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Accessory Fitting Tool lets you adjust and test custom accessory models on different body types, animations, or custom assets.*

The **Accessory Fitting Tool** (AFT) is a built-in Studio tool that allows you to test your custom models on multiple combinations of character bodies, animations, and accessories before generating the final [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] object. When testing your accessories, you can make minor fit and positional changes to ensure that you get the best result possible.

The AFT automatically handles the conversion of the custom [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] based on your menu selections, allowing you to create [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories|layered accessories]] or [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories|rigid accessories]]. After generating an accessory, the AFT creates the correct [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] object hierarchy with any updated fit edits, sets the appropriate `AccessoryType` property, and generates any required body attachment points.

*(image in the full Top G Vault)*

*Test and edit the orientation and placement of your rigid accessories.*

*(image in the full Top G Vault)*

*Test and edit the cages of your layered accessories.*

> [!warning]
> If you are intending to sell an accessory on the Marketplace, make sure your accessory model design adheres to [[30 Official Roblox Docs/Marketplace/Marketplace policy|Marketplace policies]].

## Set up accessories

The first stage of the fitting workflow allows you to configure the type of accessory to correctly populate the correct fitting tools and generate the appropriate accessory object. When selecting the type of accessory, the following options are available:

- **Clothing**: Layered accessories that use an inner and outer cage to stretch and wrap around a character body and existing clothing items.
- **Accessory**: Rigid accessories that attach to a specific attachment point of a character body and remain static in that position and orientation.

Before using the AFT, ensure that you have the [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] or [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] you intend to create into an accessory selectable in your project. As a reference, you can test the AFT using a reference [layered accessory](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/accessories/reference-files/Additional-FBX-assets.zip) or [rigid accessory](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/accessories/reference-files/Bow-rigid.rbxm) custom model.

To setup your accessories:

1. In the toolbar's **Avatar** tab, click **Accessory** to open the AFT. The **Accessory Fitting Tool** panel displays.
1. In the panel:

   1. Select the **Part** field, then in the **Explorer** window, select your accessory's respective [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] or [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object. The text field populates with the name of the object.
   1. Back in the panel, click the **Next** button. The **Asset Type** page displays.

   *(image in the full Top G Vault)*

1. In the **Asset Type** page:

   1. Select the correct asset type for your accessory:

      - If your asset is a layered accessory, select **Clothing**.
      - If your asset is a rigid accessory, select **Accessory**.

   1. Use the dropdown menu to choose the `AssetType` of your accessory.
   1. Set body type to the [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Body scale|body scale]] you determined while sculpting and sizing of the asset during the creation process.

      - **Classic**: Sets the scaling of the accessory to classic proportions.
      - **Proportions Slender**: Sets the `AvatarPartScaleType` value to `ProportionsSlender`.
      - **Proportions Normal**: Sets the `AvatarPartScaleType` value to `ProportionsNormal`.

      > [!info]
      > This setting does not affect layered accessories, and it only affects rigid accessories if the specific body part has a different `AvatarPartScaleType` [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]] object. For more information, see [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications#AvatarPartScaleType|Rigid Accessories - AvatarPartScaleType]].

   1. Click the **Next** button. A preview panel displays with a default character wearing your accessory.

   *(image in the full Top G Vault)*
   *(image in the full Top G Vault)*

## Test accessories

After you provide the initial accessory details, the AFT displays a preview panel. With the preview panel, you can test how your accessory looks on different combinations of character bodies, rigid accessories, layered accessories, animations, and custom assets in your game. If you notice any fitting issues with your accessory, you can use the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool#Edit accessory fit|edit]] tools to make minor adjustments to your accessory.

> [!info]
> At any point of the testing process, you can [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|initiate a playtest]] to launch an instance of your game where your avatar is replaced with the currently selected character body and accessories from the AFT.

### With different bodies

You can select different character bodies to test the fit and wear of your accessories. The AFT supplies several default character body models you can use to ensure your accessories fit as expected.

*(image in the full Top G Vault)*

*Bazooka Bones character preview*

*(image in the full Top G Vault)*

*Magma Fiend character preview*

To test your accessory with a different character body:

1. In the tool's catalog, navigate to **Avatars** > **Default**.
2. Click one of the character model tiles. The preview loads with the selected character model.
   1. If two character tiles are selected, click a selected tile to deselect it.
   2. In the character preview, **click** and **drag** to rotate and **right-click** to pan to inspect your character.

### With other layered accessories

You can select multiple layered accessories to test the fit and layering of your caged accessories. The AFT supplies several default character models you can use to ensure your accessories fit as expected.

*(image in the full Top G Vault)*

To test your accessory with a different layered accessory:

1. In the tool's catalog, navigate to **Clothing** > **Default**.
2. Click one or more of the available catalog items. The character preview loads with the selected clothing accessory.
   1. In the catalog, click an active tile to deselect the asset.
   2. In the character preview, **drag** and **drop** the accessory boxes to change the layer order.
   3. In the character preview, **click** and **drag** to rotate and **right-click** to pan to inspect your character.

### With animations

You can select different animations to test the movement of your accessories. The AFT supplies several default animation assets you can use to ensure your accessories fit as expected when a model is performing various movements.

*(image in the full Top G Vault)*

To test your accessory with different animations:

1. In the tool's catalog, navigate to **Animations** > **Default**.
2. Click one of the animation asset tiles.
   1. In the catalog, press the play and pause icon to control the playback.
   2. In the character preview, **click** and **drag** to rotate and **right-click** to pan to inspect your character.

### With custom assets

You can add custom character body models, layered accessories, and animations that are part of your workspace to the AFT preview catalog. Use this functionality to verify that your accessory works with any other custom models or accessories they may interact with in your game.

To add custom assets:

1. Click the ⊕ icon next to the catalog search. A prompt appears, allowing you to choose a supported object.

   *(image in the full Top G Vault)*

2. Select any [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]], [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] or [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] within the 3D viewport or **Explorer** window. The asset displays in the corresponding **Custom** category.

## Edit accessory fit

The AFT populates different fitting tools depending on the type of accessory you're creating.

### Layered accessories

When editing layered accessories, the following tools populate in the viewport:

| Icon | Description |
| --- | --- |
| ***(image in the full Top G Vault)*** | **Toggles the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool#Cage editing\|Cage Editing]] interface in the viewport for making minor inner or outer cage changes to your clothing.** |
| *(image in the full Top G Vault)* | Toggles [[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer#Enable Automatic Skinning Transfer\|auto-skinning]] between `EnabledPreserved` and `EnabledOverride`. Depending on the asset and skinning quality, auto-skinning may provide better results.<br><br>• `EnabledPreserved` uses the asset's original skinning data applied in a modeling software.<br>• `EnabledOverride` transfers skinning data from the avatar character instead of using the asset's original skinning data. |
| *(image in the full Top G Vault)* | Displays a button to **Bring Mannequin in View** which centers mannequin in front of the camera. |
| *(image in the full Top G Vault)* | Centers the camera on the mannequin. |

#### Cage editing

When the Cage Editing interface is enabled, additional tools display in the viewport along with the vertices of the selected cage over the mannequin. This allows you to make positional edits to the cage and change how a layered accessory fits on a character body.

*(image in the full Top G Vault)*

> [!warning]
> You can use these cage editing tools for minor to moderate cage edits, but if your asset requires major fit or sculpting changes, it's recommended to edit the cage meshes directly in a third-party modeling software, then reimport the updated model into Studio.

Use the following cage editing tools to help visualize and edit any cage vertices:

| Icon | Description |
| --- | --- |
| ***(image in the full Top G Vault)*** | **Toggles the selection for the inner and outer cage vertices. When selected, the vertices of that specific cage are available to edit.** |
| *(image in the full Top G Vault)* | Sets the radius of influence when editing vertices of the cage mesh. When editing a cage vertex, nearby vertices follow the changes for efficient cage editing. <br> <br>A higher Falloff Distance applies influence to vertices further away from the origin. |
| *(image in the full Top G Vault)* | Displays additional buttons: • Bring Mannequin in View - centers camera on the mannequin.<br>• Reset Inner/Outer Cage - resets any changes made to the selected cage. |
| *(image in the full Top G Vault)* | Sets the opacity of the mesh or the cage vertices, allowing you to better see and access certain vertices and angles of your layered accessory. |

To make changes to the vertices of the currently selected cage:

1. In the toolbar, disable **Move** snapping. This enables you to make detailed changes to a vertex's position.
2. Select a vertex and use the **Move** tool to reposition. Changes to the cage apply immediately and display in the preview panel.
   1. Use the opacity sliders to better visualize the changes to your cage.
   2. Set the **Falloff Distance** depending on the number of vertices being adjusted at once.
      *(image in the full Top G Vault)*

### Rigid accessories

When fitting rigid accessories, a bounding box appears around the mannequin indicating the possible placement of that specific type of accessory. You can position, rotate, and scale objects within this bounding box to ensure your accessory fits on different character models.

*(image in the full Top G Vault)*

*Adjust your rigid accessory fit within the bounding box.*

*(image in the full Top G Vault)*

*If the accessory is outside the appropriate space, the bounding box turns red.*

### Create accessory

AFT applies any fit changes and generates the appropriate [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] instance in the workspace depending on the type of accessory selected and any configurations applied.

When you are ready to generate your accessory, select **Generate MeshPart Accessory**.

*(image in the full Top G Vault)*

*Hierarchy generated for layered accessories.*

*(image in the full Top G Vault)*

*Hierarchy generated for rigid accessories.*

With an accessory successfully created, you can now try the following:

- Begin the process of [[30 Official Roblox Docs/Marketplace/Publish to Marketplace|uploading and publishing]] the accessory to the Marketplace.
- Use the accessory in your current game by equipping it to character models with [[30 Official Roblox Docs/Characters/Character appearance#Manually modify appearance|HumanoidDescription]], or by dragging and dropping the accessory under the appropriate character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object.
- Save the accessory to your [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) or make it public on the [[30 Official Roblox Docs/Production/Creator Store|Creator Store]] to use within any of your games or share with other creators.

---
*Source: [Accessory Fitting Tool](https://create.roblox.com/docs/avatar/accessory-fitting-tool) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
