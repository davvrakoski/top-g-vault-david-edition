---
title: "Texturing eyes"
description: "Use Blender's texture painting tools to apply a custom surface appearance on your character's eyes."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/characters/creating/texturing-eyes"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use Blender's texture painting tools to apply a custom surface appearance on your character's eyes.*

You can apply a fully opaque texture to the eyes to achieve a more non-human visual effect for your character. Before editing the eye textures, join the two eye objects to texture them both at the same time. Then texture paint the entire eye, starting with the outer eye, moving to the inner eye, and finishing with the pupil.

To texture your eye mesh objects:

1.  If you haven't already, [[30 Official Roblox Docs/Art/Characters/Creating/Texturing setup#Set texture resolution|increase the texture image resolution]].
1.  In the Outliner, toggle the **Hide in Viewport** option for the `Head_Geo`, `LowerTeeth_Geo`, `Tongue_Geo`, and `UpperTeeth_Geo`. Leave the eye mesh objects visible.

    [Video: Texturing_01.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Texturing_01.mp4)

1.  In **Object** mode, hold <kbd>Shift</kbd> and click on both `LeftEye_Geo` and `RightEye_Geo`, then right-click and select **Join** (<kbd>Ctrl</kbd><kbd>J</kbd>; <kbd>⌘</kbd><kbd>J</kbd>) from the contextual menu to join the objects. The two objects merge using the name of the last object selected.

    [Video: Texturing_02.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Texturing_02.mp4)

1.  Switch to the **Texture Paint** tab, then with the **Draw** tool active, set the following brush settings in the tool sidebar for the outer eye shadow.

    1. In **Brush Settings**, set **Radius** to **50px** and **Strength** to **1.0**.
    1. In **Color Picker**, set **Color** to black.

       *(image in the full Top G Vault)*

1.  Completely paint the eye objects black. This serves as the basis for the outer eye shadow.

    [Video: Texturing_03.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Texturing_03.mp4)

1.  With the **Draw** tool active, set the following brush settings in the tool sidebar for the outer eye color:

    1. In **Brush Settings**, set **Radius** to **75px** and **Strength** to **1.0**.
    1. In **Color Picker**, set **Color** to a deep yellow.

       *(image in the full Top G Vault)*

1.  In the **Texture Paint** tab's 2D view window, line up your cursor to the center of the UV map that corresponds to the eye texture. Click 4-6 times on the center of each eye to create an outer eye color over the base shadow.

    [Video: Texturing_04.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Texturing_04.mp4)

1.  For visibility, enable `Head_Geo` visibility and reorient the camera to a front-facing view.
1. Paint the inner eye color using the following suggestions:

    1.  Click the **X Symmetry** button to enable symmetry. Toggle this off if creating asymmetrical assets.

        *(image in the full Top G Vault)*

    1.  In **Viewport Overlays** settings, enable **Wireframe geometry view**. You can toggle this overlay off when spot checking your visual elements.

        [Video: Texturing_05.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Texturing_05.mp4)

        *(image in the full Top G Vault)*

    1.  Update your brush settings in the tool sidebar for the inner eye:

        1. In **Brush Settings**, set **Radius** to **5px**. You can quickly change this radius as you paint by holding <kbd>F</kbd>.
        1. In **Color Picker**, set **Color** to red.

           *(image in the full Top G Vault)*

        [Video: Texturing_06.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Texturing_06.mp4)

    1.  Periodically make the head mesh visible to ensure your eye texture works with the rest of the model.

1. Update your brush settings in the tool sidebar for the pupils:

    1. In **Brush Settings**, set Radius to **5px**. You can quickly change this radius as you paint by holding <kbd>F</kbd>.
    1. In **Color Picker**, set **Color** to a bright red.

       *(image in the full Top G Vault)*

1. Using the **Brush** tool, paint the pupils of your model.

    [Video: Texturing_07.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Texturing_07.mp4)

1. After completing your texture painting, switch back to **Edit** mode.
1. Hold <kbd>Shift</kbd>, click on both of your eye objects, press <kbd>P</kbd>, and select **By Loose Parts** from the contextual menu to separate the two meshes.
1. Rename your remaining mesh to the original `RightEye_Geo` or `LeftEye_Geo` name.

    [Video: Texturing_08.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/avatar/basic-creation/Texturing_08.mp4)

---
*Source: [Texturing eyes](https://create.roblox.com/docs/art/characters/creating/texturing-eyes) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
