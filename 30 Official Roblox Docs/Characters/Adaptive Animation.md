---
title: "Adaptive Animation"
description: "Set up your character rig to support universal sets of animations and emotes."
area: "30 Official Roblox Docs"
cluster: "Characters"
source: "https://create.roblox.com/docs/characters/adaptive-animation"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Set up your character rig to support universal sets of animations and emotes.*

Roblox's **Adaptive Animation** system allows animations to play seamlessly between custom characters with unique body types, rigs, and proportions. This feature utilizes [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription|HumanoidRigDescription]] and [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription|DigitsRigDescription]] objects within your character model so that you can customize, modify, and map the internal joints of your custom character for universal animation support.

After importing a character rig, you can access several Studio tools to help you remap your joints and set a baseline T-pose reference to better support animations. After configuring your rig, your custom character can playback any R15 animation, or any animation that has been published from a character with [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription|HumanoidRigDescription]] and [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription|DigitsRigDescription]] objects.

*(image in the full Top G Vault)*

*Seamlessly import custom characters into Studio as a `Custom Humanoid` rig type.*

*(image in the full Top G Vault)*

*Modify and adjust the generated [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription|HumanoidRigDescription]] to ensure compatibility with universal animations.*

## Modify custom character rig

When importing a rig as a `Custom Humanoid`, Studio attempts to automatically configure the model's [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription|HumanoidRigDescription]] and [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription|DigitsRigDescription]] objects. When necessary, you can use the joint assignment and T-pose tools to fine-tune or adjust the automated changes.

> [!info]
> You can follow along with your own custom character or the [reference character](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/art/reference-files/Snow.fbx) featured within this guide. The reference character is a modified version of Blender Studio's [Snow](https://studio.blender.org/characters/snow/v4/) character combined with Blender's [base mesh](https://www.blender.org/download/demo-files/) assets.

### Import model

Use the 3D Importer to import a character model, then use the Adaptive Animation system to add [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription|HumanoidRigDescription]] and [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription|DigitsRigDescription]] objects:

1. In the **Home** tab, click the **Import** button to open the 3D Importer. A file browser opens.
2. Select your rigged character's `.fbx` or `.gltf` file. The 3D Importer loads a preview of the character model.
3. In the **Rig General** section, set **Rig Type** to **Custom**.
  *(image in the full Top G Vault)*
4. Select the **Import** button. The character displays in your workspace as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].
5. In the **Avatar** tab, click the **Adaptive Animation** button. The **Remap Rig** panel displays.
6. In the **Remap Rig** panel, click the **Create** button. The Adaptive Animation systems generates a [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription|HumanoidRigDescription]] object and a [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription|DigitsRigDescription]] for each hand.

   *(image in the full Top G Vault)*

### Assign joints

The Adaptive Animation system requires at least 15 of your character's joints to map to Roblox's [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|standardized 15 joints skeleton]]. While the automated import process attempts to make this assignment automatically, you can verify and reassign joints by using the joint assignment tool.

When you select your model's [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription|HumanoidRigDescription]] or [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription|DigitsRigDescription]] objects, the joint assignment tool's **visual picker** displays in the top right of the 3D viewport with a view of the standard Roblox skeleton. To assign joints, you can either click the joints in the 3D viewport or visual picker, then click the corresponding joint in the other view. When a joint is assigned, the joint icon **turns orange** in both the 3D viewport and the visual picker.

When using the joint assignment tool, the visual picker displays:

- All 15 standard joint assignments that you are required to assign to your character's rig as a filled-in gray circle.
- All additonal joint assignments that you are not required to assign to your character's rig as empty circle outlines. If your rig is compatible with these extra joints, you can assign them appropriately to help improve animation quality.

*(image in the full Top G Vault)*

*Joints that are not assigned appear as a grey indicator on both the visual picker and the 3D viewport mannequins.*

*(image in the full Top G Vault)*

*When assigned, joint indicators turn orange in both the visual picker and the 3D viewport.*

To access and use the joint assignment tool:

1. In the **Explorer** window, expand the model you just imported and select the child [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription|HumanoidRigDescription]]. The Adaptive Animation toolbar displays with the joint assignment tool active, and your character's mesh objects become semi-translucent so you can view its internal joints.
1. In the 3D viewport, click a joint within the character's body, then in the visual picker, select the corresponding joint. The joint indicator turns orange to indicate that it has been assigned.
1. If your character's rig includes optional joints in its hands,
   1. Navigate back to the **Explorer** window, then select one of your model's child [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription|DigitsRigDescription]] objects. The visual picker updates to display a view of your character's left or right hand.

      *(image in the full Top G Vault)*

   1. Assign each optional joint by clicking a joint on the hand, then selecting the corresponding joint in the visual picker.
   1. Repeat this process for the character's other child [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription|DigitsRigDescription]] object.

### Create t-pose

To ensure universal animation support, it's important to set up a standard T-pose configuration as a baseline reference for your character. The Adaptive Animation toolbar offers a T-pose mode with tooling to either automatically position your character to match T-pose requirements, or modify the position and rotation of your joints to ensure the best animation results.

*(image in the full Top G Vault)*
*(image in the full Top G Vault)*

*To move joints, select the joint while T-pose tooling is active, then use the multi-transform tool to apply a positional or rotational change.*

To create a T-pose using T-pose mode:

1. In the Adaptive Animation toolbar, select the **T-pose mode** button to switch to T-pose mode.

   *(image in the full Top G Vault)*

1. Select the **Enforce T-pose** button to automatically position your character for T-pose requirements.

   *(image in the full Top G Vault)*

1. If you need to make adjustments to your character's T-pose,

   1. If you want to rotate both left and right limbs simultaneously, enable the left and right symmetry icon.

      *(image in the full Top G Vault)*

   1. Select one of the upper arm joints near the shoulder. The joint turns blue to indicate that it is selected.
   1. Use the **Rotate** tool to rotate the joint into a T-pose.
   1. If necessary, position the legs and other areas of the body until your rig is in a T-pose.
1. To test your rig's T-pose,
   1. Navigate to the Adaptive Animation toolbar, then use the dropdown to select an animation.
   1. Press the play icon. If an animation doesn't animate correctly, you may need to remap or re-pose your character's rig.

> [!success]
> Once your character's rig is configured and saved, that character can [[30 Official Roblox Docs/Animation/Animation in Roblox|support playback]] of any R15 animation or animations published from a custom character with a [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription|HumanoidRigDescription]].

---
*Source: [Adaptive Animation](https://create.roblox.com/docs/characters/adaptive-animation) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
