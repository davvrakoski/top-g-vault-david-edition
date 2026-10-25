---
title: "Work with the Animation Editor"
description: "Explains how to work with the Animation Editor to create a custom animation."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/curriculums/animator/work-with-the-animation-editor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to work with the Animation Editor to create a custom animation.*

The **Animation Editor** lets you move and rotate your characters' body parts like an action figure into unique poses at different keyframes of an animation. Studio then automatically creates keyframes in between those poses that flow together to make your characters appear as if they're moving.

[Video: AnimationExample.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-island-of-move/creating-animations/AnimationExample.mp4)

In this chapter, let's explore how to open the **Animation Editor**, customize your settings to help with posing your character, and create an animation with two unique poses that Studio flows together to make it look like the character is swimming in water.

[Video: show-animation-breakdown.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-island-of-move/creating-animations/show-animation-breakdown.mp4)

## Open Animation Editor

The **Animation Editor** is Studio's primary animation tool. While it comes with a lot of functionality, such as [[30 Official Roblox Docs/Animation/Animation capture|animation capture]] and [[30 Official Roblox Docs/Animation/Inverse Kinematics|inverse kinematics]] tools, this lesson focuses on its basic tools to help you get started in learning how to create animations.

1. At the top of the toolbar, go to the **Avatar** tab.
1. Click the **Clip Editor** button. The **Animation Editor** displays at the bottom of Studio.

## Prepare rig

The **Animation Editor** requires a **rig**, or poseable figure, to create character animations because rigs include the internal structure you need to move and rotate body parts into different poses. While you can create your own rigs or access several pre-built rigs through the **Rig Generator** tool, this lesson provides a rig on top of the pedestal in the game.

*(image in the full Top G Vault)*

To prepare your rig:

1. Select the **Figure** rig on top of the pedestal. The part names that make up the rig's body parts display in the **Animation Editor**.

   *(image in the full Top G Vault)*

1. In the toolbar, find the snapping tools and make sure **Rotate** and **Move** are not checked.

   *(image in the full Top G Vault)*

1. Using the camera controls, move the camera to get a good view of the part you want to animate. While moving, hold <kbd>Shift</kbd> to slow down camera movements.

     | **Action** | **Control** |
     | --- | --- |
     | **Move** | <kbd>W</kbd> <kbd>A</kbd> <kbd>S</kbd> <kbd>D</kbd> |
     | **Rotate** | Hold the right mouse button to rotate around the selected object. |
     | **Zoom** | Use your mouse's scroll wheel. |
     | **Focus** | Press <kbd>F</kbd> to focus on a the selected object. |

   [Video: show-move-camera.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-island-of-move/creating-animations/show-move-camera.mp4)

   > [!warning] Can't move the camera?
   > If the camera doesn't move when you press <kbd>W</kbd> <kbd>A</kbd> <kbd>S</kbd> <kbd>D</kbd>, click somewhere inside the 3D viewport.

## Create first pose

Now that the **Animation Editor** is open and your rig preparation is complete, it's time to start posing your character for the first pose of your animation. This lesson focuses on a swimming animation, but feel free to adjust the learnings for your own poses. Depending on the animation you want to create, your first pose may be very different.

*(image in the full Top G Vault)*

*Swimming*

*(image in the full Top G Vault)*

*Crouching*

*(image in the full Top G Vault)*

*Dancing*

> [!info]
> Creating poses is an art form, and it takes time to figure out how to move and rotate body parts to meet the needs of your animation. It's normal and expected for your poses to look and feel different from the lesson's video examples.

To create your first pose for a swimming animation:

1. Back in the toolbar, select the **Rotate** tool, then click on the rig's **LeftUpperArm**. A set of handles display around the body part.

   *(image in the full Top G Vault)*

   [Video: click-upper-arm.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-island-of-move/create-the-first-pose/click-upper-arm.mp4)

1. Click and drag the handles to rotate the rig's left arm, and note how each handle rotates the arm in a different direction. You can undo any change by pressing either <kbd>Ctrl</kbd><kbd>Z</kbd> or <kbd>⌘</kbd><kbd>Z</kbd>, depending on your computer.

   [Video: rotate-upper-arm.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-island-of-move/create-the-first-pose/rotate-upper-arm.mp4)

1. Rotate different body parts until your first pose is complete. Make sure to change the camera angle as you're working so that you can see the pose from multiple points of view.

   [Video: timelapse-first-pose.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-island-of-move/create-the-first-pose/timelapse-first-pose.mp4)

> [!warning]
> If you're running into any issues while trying to rotate your rig's body parts, check out the following troubleshooting tips:
>
> **Issue:** You can't click on rotation handles.
>
> - Another part may be blocking your click.
> - Try rotating around your camera until you see a blue box whenever you hover over the part you want to click.
>
> **Issue:** You can't see the rotation handles.
>
> - If you see a set of arrows instead of the circles, you need to select the **Rotate** tool in the toolbar.

## Duplicate keyframes

Before you begin your second pose, let's take a moment to duplicate your first pose at the end of your animation. This process ensures that your animation repeats smoothly as it loops.

To move your first pose to the end of the animation, you need to move the **scrubber** that marks the current keyframe position to the end of the timeline. The **timeline** is the numbered line at the top of the **Animation Editor** that represents your animation in seconds.

*(image in the full Top G Vault)*

*Scrubber*

*(image in the full Top G Vault)*

*Timeline*

To duplicate your first pose's keyframes to the end of the animation:

1. In the **Animation Editor**, click on the **white diamond** at the top of the timeline. This diamond represents every body part's rotational data for your first pose at `0:00` on the timeline. Note that the white diamond displays with a blue border when you have done this step correctly.

   *(image in the full Top G Vault)*

1. Copy the first pose by pressing <kbd>Ctrl</kbd><kbd>C</kbd> or <kbd>⌘</kbd><kbd>C</kbd>, depending on your computer.
1. Click the **scrubber**, then drag it to the end of the animation at `1:00` on the timeline.
1. Paste your first pose at this new timeline position by pressing <kbd>Ctrl</kbd><kbd>V</kbd> or <kbd>⌘</kbd><kbd>V</kbd>, depending on your computer. A new set of diamonds display at the end keyframe.

   *(image in the full Top G Vault)*

1. To loop the animation, click the **Loop** icon. Your animation will now repeat seamlessly.

   *(image in the full Top G Vault)*

## Create second pose

Using the same process as earlier in the lesson, it's time to create your second pose! After you design this unique pose, Studio will automatically create keyframes in between those poses that flow together to make your characters appear as if they're swimming.

To create your second pose for a swimming animation:

1. Set the scrubber in the middle of the animation. You can either drag the scrubber to roughly be in the middle of the timeline, or you can manually set it to `0.5` in the **position indicator** to the left of the timeline.

   *(image in the full Top G Vault)*

1. With the **Rotate** tool still active, rotate different body parts until your second pose is complete. Remember to change the camera angle as you're working so that you can see the pose from multiple points of view.

   [Video: show-middle-timelapse.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-island-of-move/adding-the-second-pose/show-middle-timelapse.mp4)

   > [!info] Posing Faster
   > Speed up posing by rotating body parts connected to the torso first, such as the upper arm and thigh, then work outwards to pose the hands and feet.

   > [!warning] Start a Pose from Scratch
   > Don't like a pose and want to just start from the beginning? You can reset your character to the default pose using the following process:
   >
   > 1. Right click on the top white diamond of the pose you want to reset. A menu displays.
   >
   > 1. From the menu, select **Reset Selected**.

1. In the **Animation Editor**, click the **Play** button to test your animation. Feel free to make adjustments to either of your poses until it looks like the character is smoothly swimming in water.

Congratulations on posing your character for your first animation! The next lesson details how to save and export your animation so that you can use it within games.

---
*Source: [Work with the Animation Editor](https://create.roblox.com/docs/tutorials/curriculums/animator/work-with-the-animation-editor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
