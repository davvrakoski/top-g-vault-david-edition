---
title: "Animation Editor"
description: "Animation Editor allows you to design and publish custom animations on rigs."
area: "30 Official Roblox Docs"
cluster: "Animation"
source: "https://create.roblox.com/docs/animation/editor"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Animation Editor allows you to design and publish custom animations on rigs.*

The **Animation Editor**, accessible from Studio's **Avatar** tab or **Window** ⟩ **Avatar** menu, allows you to design and publish custom animations on rigs. A rig is an object with individual sections connected by joints. You can move these joints to [[30 Official Roblox Docs/Animation/Animation Editor#Create poses|create poses]] and then smoothly animate the rig from pose to pose.

*(image in the full Top G Vault)*

## Interface

The Animation Editor's window is divided into three primary sections:

*(image in the full Top G Vault)*

### Media / Playback Controls

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

Animation name.

*(image in the full Top G Vault)*

Media and playback options.

*(image in the full Top G Vault)*

Position indicator which displays the timeline unit for the position of the scrubber in **seconds:frames**.

### Track List

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

Name of rig.

*(image in the full Top G Vault)*

Opens the **Manage IK** window.

*(image in the full Top G Vault)*

Opens a contextual menu of additional tracks you can add to the track list.

*(image in the full Top G Vault)*

Opens a contextual menu with options such as **Add Keyframe** and **Delete Track**.

### Timeline

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

Scrubber that marks the current time and/or frame.

*(image in the full Top G Vault)*

Time and/or frame units.

*(image in the full Top G Vault)*

Opens a contextual menu of options including **Timeline Unit**, **Frame Rate**, toggling [[30 Official Roblox Docs/Animation/Animation events|Animation Events]] on/off, and more.

*(image in the full Top G Vault)*

Draggers to expand or contract the time/frame unit marks.

## Create an animation

You can only create animations using **rigs**.

1. If you don't already have a rig in the workspace, insert a pre-built rig using the [[30 Official Roblox Docs/Studio/Rig Generator|Rig Generator]] tool. The pre-built rigs have all of the basic parts and mechanisms to build a character animation.

   *(image in the full Top G Vault)*

   > [!info]
   > For a custom rig with [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] joints, check that [[30 Official Roblox Docs/API Reference/Classes/BasePart#AssemblyRootPart|AssemblyRootPart]] is the part you intend to remain stationary when the joints animate. [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]] does not set the assembly root. If another part is selected, see [[30 Official Roblox Docs/Physics/Assemblies#Assembly root part|assembly root part selection]].

2. In the 3D viewport or the **Explorer** window, select the rig.

From here, you can begin [[30 Official Roblox Docs/Animation/Animation Editor#Create poses|creating poses]] for your rig and modifying the animation settings, such as [[30 Official Roblox Docs/Animation/Animation Editor#Loop an animation|looping the animation]] or [[30 Official Roblox Docs/Animation/Animation Editor#Set a priority|setting its priority]].

## Create poses

An animation consists of different **poses**, or specific positions and orientations of [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects within a rig. You can create poses by moving or rotating bones or meshes, such as the rig's hands, feet, or torso. After you create multiple poses on different positions of the timeline, the animation editor runs between them with your [[30 Official Roblox Docs/Animation/Animation Editor#Easing|easing settings]] to smoothly animate the rig from pose-to-pose.

For example, a simple animation where a humanoid character turns
to look 45° to the left has two poses: The initial position looking forward, and the turned position looking left.

[Video: Animation-Poses.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/animation/animation-editor/Animation-Poses.mp4)

To create a pose:

1. In the **Explorer** window, select the rig and expand its child instances to access the bones or meshes.

2. In the 3D viewport or the **Explorer** window, select a bone or mesh.

3. In the timeline, click-and-move the **scrubber** to the frame position where you want to set the pose. By default, Roblox represents timeline units as **seconds:frames** and animations run at 30 frames per second. For example, **0:15** indicates ½ second.

   *(image in the full Top G Vault)*

    > [!info]
    > By default, the timeline displays a duration of 1 second (1:00). To add more time to the timeline, enter a new value in the right-side box of the position indicator.

4. Move or rotate the bone or mesh to a new orientation. For bones, you can rotate them to pose the rig along the created bone joints.

   [Video: Transform-Demo-Skinned.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/skinned-meshes/Transform-Demo-Skinned.mp4)

   Whenever you adjust a specific bone or mesh, a new track displays in the track list and a new **keyframe** displays on the timeline for that bone or mesh at that specific frame position.

    *(image in the full Top G Vault)*

   > [!info]
   > When creating poses, you can toggle between **Move** and **Rotate**
   > modes by pressing <kbd>R</kbd>. These modes work exactly like moving and rotating base objects, including the snap settings and incremental values located in Studio's toolbar.

5. When you're ready to preview the animation, click the **Play** button in the editor's playback controls or press the <kbd>Spacebar</kbd>.

## Keyframes

Once you [[30 Official Roblox Docs/Animation/Animation Editor#Create poses|create basic poses]] for a rig,
fine-tuning individual keyframes can significantly improve the final
animation. You can either:

- Operate on a specific track or keyframe by clicking or right-clicking on that track/keyframe.
- Operate on **all** tracks by clicking or right-clicking in the upper region of the track list.

*(image in the full Top G Vault)*

| Operation | Workflow |
| --- | --- |
| **Insert keyframe(s)** | Right-click and select **Add Keyframe Here**. Note that the keyframe(s) insert at the time position closest to where you click, not at the position of the scrubber. |
| **Move keyframe(s)** | Select one or more keyframes and then drag them to a new time position. |
| **Duplicate keyframe(s)** | Select one or more keyframes and copy them (<kbd>Ctrl</kbd><kbd>C</kbd> or <kbd>⌘</kbd><kbd>C</kbd>). Then move the scrubber to the target time position and paste the copied frames (<kbd>Ctrl</kbd><kbd>V</kbd> or <kbd>⌘</kbd><kbd>V</kbd>). |
| **Delete keyframe(s)** | Select one or more keyframes and press <kbd>Delete</kbd> or <kbd>Backspace</kbd>. |

### Easing

For each keyframe in the animation editor, you can choose both an
[[30 Official Roblox Docs/Animation/Animation Editor#Easing style|easing style]] and an [[30 Official Roblox Docs/Animation/Animation Editor#Easing direction|easing direction]].

#### Easing style

Easing **style** is the rate at which an animation moves between different frame
positions within the animation. By default, a part will move and/or rotate from
one keyframe to the next in an even, steady motion known as **linear easing**.
In the following video, linear easing makes the character's turning animation
appear stiff and robotic.

[Video: Easing-Linear.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/animation/animation-editor/Easing-Linear.mp4)

*Linear easing*

While that may look appropriate for some motions, compare the following video
where **cubic easing** makes the animation of the character's motion appear more
natural.

[Video: Easing-Cubic.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/animation/animation-editor/Easing-Cubic.mp4)

*Cubic easing*

To change the easing style for one or more keyframes:

1. Select one or more keyframes. Every selected keyframe is now surrounded by a blue border.
2. Right-click on a keyframe with a border. A pop-up menu displays.
3. Hover over **Easing Style** and choose from the following options:
   - **Linear** — Moves at a constant speed.
   - **Constant** — Removes interpolation between the selected keyframe and
     next keyframe. The animation will "snap" from keyframe to keyframe.
   - **CubicV2** — Eases in or out with cubic interpolation.
   - **Elastic** — Moves as if the object is attached to a rubber band.
   - **Bounce** — Moves as if the start or end position of the tween is bouncy.

#### Easing direction

Easing **direction** defines which end of the animation movement is affected by
the [[30 Official Roblox Docs/Animation/Animation Editor#Easing style|easing style]]. By default, the motion is slower at the
beginning and faster toward the end of the animation.

To change the easing direction for one or more keyframes:

1. Select one or more keyframes. Every selected keyframe is now surrounded by a blue border.
1. Right-click on a keyframe with a border. A pop-up menu displays.
1. Hover over **Easing Direction** and choose from the following options:
   - **In** — The motion will be slower at the beginning and faster toward the
     end.
   - **Out** — The motion will be faster at the beginning and slower toward the
     end.
   - **InOut** — **In** and **Out** on the same tween, with **In** at the
     beginning and **Out** taking effect halfway through.

### Optimize keyframes

Animators can often generate many keyframes during the course of animation, especially when using various animation tools and features. To help reduce the number of unnecessary keyframes and make it easier to animate on the timeline, the animation editor provides tools for [[30 Official Roblox Docs/Animation/Animation Editor#Automatic|automatic]] and [[30 Official Roblox Docs/Animation/Animation Editor#On-demand|on-demand]] keyframe optimization.

#### Automatic

The animation editor automatically detects and removes unnecessary keyframes when creating [[30 Official Roblox Docs/Art/Characters/Facial Animation/Animate heads|facial animations]] and when [[30 Official Roblox Docs/Animation/Curve Editor#Open the Curve Editor|promoting a keyframe animation to a curve animation]].

If 3 or more consecutive keyframes have the same value in a track, the editor removes the intermediary keyframes and keeps only the first and last keyframes.

If the track only contains keyframes with default values, such as an [[30 Official Roblox Docs/API Reference/Datatypes/CFrame#identity|identity]] coordinate frame, or a `0` value for a curve animation, the entire track is removed from the animation.

#### On-demand

During animating, you can use the editor's **Keyframe Optimization** tool to quickly reduce the number of unnecessary keyframes. Keyframe Optimization prioritizes the least impactful keyframes first. You can adjust the number of keyframes using the slider.

While using the slider, you can preview the animation and scrub through the timeline to check your animation but you can not perform editing operations, such as changing keyframe values or adding tracks.

To access the **Optimize Keyframes** tool:

1. From the editor's media/playback controls, click the **⋯** button and select **Optimize Keyframes**.

   *(image in the full Top G Vault)*

2. In the popup window, move the slider to the desired number of keyframes. You can preview and play back the animation to verify the optimization.
3. Click **OK** when complete.

## Loop an animation

To make an animation automatically loop, navigate to the media/playback controls and click the **Looping** button.

*(image in the full Top G Vault)*

> [!info]
> A looping animation doesn't interpolate between the final keyframes and first keyframes. To make the animation loop smoothly, duplicate the first keyframes and use them as the final keyframes.

## Set a priority

An animation's **priority** ([[30 Official Roblox Docs/API Reference/Enums/AnimationPriority|Enum.AnimationPriority]]) dictates when it will play in a game. For example, if you play an animation with a higher priority
than another animation that's already playing, the new animation will
override the old. For example, a "jump" animation should take priority over an "idle" animation so that a character doesn't perform both at the same time.

Roblox uses seven levels of priority, ordered here from highest to lowest:

*(image in the full Top G Vault)*

**Action4**

*(image in the full Top G Vault)*

**Action3**

*(image in the full Top G Vault)*

**Action2**

*(image in the full Top G Vault)*

**Action**

*(image in the full Top G Vault)*

**Movement**

*(image in the full Top G Vault)*

**Idle**

*(image in the full Top G Vault)*

**Core**

<br>

To set an animation to a different priority:

1. Navigate to the editor's media/playback controls and click the **⋯** button.

   *(image in the full Top G Vault)*

1. Hover over **Set Animation Priority** and choose the desired priority setting.

## Save an animation

When you save an animation, Studio saves it as a
[[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] object in [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]] and adds a reference to your rig object. Saving your animation is meant to preserve your animation progress and work. If you intend to use an animation, [[30 Official Roblox Docs/Animation/Animation Editor#Export an animation|export it]] before referencing the published animation in your game.

To save an animation:

1. Navigate to the editor's media/playback controls and click the **⋯** button.

   *(image in the full Top G Vault)*

2. Select **Save** or **Save As** to save the animation in [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]].

   *(image in the full Top G Vault)*

> [!note]- **Accessing Local Animation Data**
> Roblox saves animation data locally to [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]] to preserve your animation work. In most cases, your game shouldn't directly access this local data and instead should reference a published animation.
>
> In the rare cases that your game requires accessing local data, reference the value of the [[30 Official Roblox Docs/API Reference/Classes/ObjectValue|ObjectValue]] in your rig's `AnimSaves` folder rather than directly accessing the [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]].
>
> ```lua title="Correctly Access Local Animation Data"
> local rig = workspace.Rig
>
> -- Access your local animation data with the value reference in your rig
> local anim = rig.AnimSaves.Value.[SavedAnimation]
> ```
>
> > [!warning]
> > Since local data is stored in [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]], it doesn't replicate and isn't available from clients. If your clients need access to that data, you must move the [[30 Official Roblox Docs/API Reference/Classes/KeyframeSequence|KeyframeSequence]] or [[30 Official Roblox Docs/API Reference/Classes/CurveAnimation|CurveAnimation]] objects and their descendants to [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]].

## Export an animation

When you export an animation to Studio, it becomes available for use in
all games. This means that you only need to create an animation
once, then you can reuse it as many times as you want.

> [!warning]
> If your animation will be used for a **default** Roblox character animation like jumping or running, ensure that you rename the final keyframe as outlined in the first step below.

To export an animation:

1. **IMPORTANT** If the animation will be used to [[30 Official Roblox Docs/Animation/Use animations#Replace default animations|replace a default character animation]] like running or jumping, rename the final keyframe `End` as follows:
   1. Right-click the final keyframe symbol in the upper bar region and choose **Rename Key Keyframe** from the
   contextual menu.

      *(image in the full Top G Vault)*

   2. Type `End` (**case-sensitive**) into the input field.
   3. Click the **Save** button.

2. Navigate to the editor's media/playback controls and click the **⋯** button.

   *(image in the full Top G Vault)*

3. Select **Publish to Roblox** from the contextual menu.
4. In the **Asset Configuration** window, enter an animation title and optional description.
5. **IMPORTANT** If the animation will be used in any [[30 Official Roblox Docs/Projects/Groups (teams)|group-owned]] game, select the group from the **Creator** field.
6. Click the **Submit** button.

Once the upload is complete, you can copy the animation's asset ID
from the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) for scripting custom animations or to replace default character animations, as outlined in [[30 Official Roblox Docs/Animation/Use animations|Use animations]].

---
*Source: [Animation Editor](https://create.roblox.com/docs/animation/editor) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
