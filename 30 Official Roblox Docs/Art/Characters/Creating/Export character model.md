---
title: "Export character model"
description: "Export your character model from Blender using the correct settings and processes."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/characters/creating/export-character"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Export your character model from Blender using the correct settings and processes.*

> [!warning]
> It's important to test your assets multiple times at every point of the asset creation process, whether it is within Blender or after importing into Studio. See [[30 Official Roblox Docs/Avatar/Character Bodies/Test character bodies|Test characters]] for more information.

Whether you are exporting your character for testing, or are performing a final export out of Blender, you must apply the appropriate export settings to ensure that Blender exports the proper character data.

To export your character:

1. In the topbar, navigate to **File** > **Export** > **FBX (.fbx)**. The Blender file browser window displays.
1. Set **Path Mode** to **Copy** and enable the **Embed Textures** icon.
1. In the **Include** section, enable **Custom Properties**.
1. Expand the **Armature** section and disable **Add Leaf Bones**.
1. Enable **Bake Animation**, expand the section, then:

   1. Disable **NLA Strips**, **All Actions**, and **Force Start/End Keyframes**.
   1. Set **Simplify** to **0.0**.

1. Click the **Export FBX** button and save the `.fbx` to the directory of your choice.

*(image in the full Top G Vault)*

> [!warning]
> After exporting your .fbx file, see [[30 Official Roblox Docs/Avatar/Character Bodies/Test character bodies|Test character bodies]] for steps on importing your character model into a test place and verifying your avatar and related components.

> [!success]
> After importing the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] character to Studio, you can now perform the following with this asset:
>
> - [[30 Official Roblox Docs/Marketplace/Publish to Marketplace|Upload the character]] to the Marketplace.
> - Use the humanoid character on an existing game by applying a [[30 Official Roblox Docs/Characters/Character appearance#Manually modify appearance|HumanoidDescription]]to the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object.
> - Save the asset to your [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) to share or use within any of your games.

---
*Source: [Export character model](https://create.roblox.com/docs/art/characters/creating/export-character) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
