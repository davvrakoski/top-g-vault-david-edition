---
title: "Play character animations"
description: "The process for changing default character animations and triggering custom animations."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/use-case-tutorials/animation/play-character-animations"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The process for changing default character animations and triggering custom animations.*

**Playing character animations** is an important part of what makes avatars and non-playable characters (NPCs) expressive, realistic, and engaging to your audience. In addition to providing immersive visuals, character animations provide players feedback from their actions, guidance on how to navigate the environment, and vital information about their character and others.

Using the [Hazardous Space Station](https://www.roblox.com/games/134383324873456/Walking-Character-Animation) `.rbxl` file as a reference, this tutorial shows you how to play character animations using two different techniques, including guidance on:

- Swapping default character animation asset IDs with your own custom animations.
- Triggering animations in response to character actions within the 3D space.

After you complete this tutorial, you will have the skills to customize animations for a wide variety of gameplay situations.

## Change default animations

Every character with a default [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] object, whether it's a player-controlled avatar or a non-player character (NPC), includes a set of **default animations** that play whenever the character performs specific in-game actions, such as running, climbing, and jumping. Roblox provides these animations out-of-the-box for every game without any additional scripting effort.

[Video: Default-Fall-Animation.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/playing-character-animations/Default-Fall-Animation.mp4)

*Default Fall Animation*

[Video: Default-Swim-Animation.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/playing-character-animations/Default-Swim-Animation.mp4)

*Default Swim Animation*

[Video: Default-Climb-Animation.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/playing-character-animations/Default-Climb-Animation.mp4)

*Default Climb Animation*

However, if these default animations don't meet the design requirements for your world's environment, aesthetic, or overall narrative, you can swap them out with custom animations that apply to every player that joins your game.

To demonstrate, the following section teaches you how to swap out the default walk animation with a custom walk cycle animation from [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Animation/Create character animations|Create Character Animations]]. Using this same process, you can swap out any of the default animations with your own animation asset IDs.

[Video: Default-Walk-Animation.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/playing-character-animations/Default-Walk-Animation.mp4)

*Default Walk Animation*

[Video: Custom-Walk-Animation.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/playing-character-animations/Custom-Walk-Animation.mp4)

*Custom Walk Animation*

### Create script

Every character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] object includes a child [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] object that stores all of the character's default animations. In order to set any of these default animations to new asset IDs, you must create a script in the [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] so that it can reference and override the [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] object's default values as soon as players load into the game.

To create a script that will reference the default animation asset IDs:

1. In the **Explorer** window, add a new script to **ServerScriptService**.
   1. Hover over **ServerScriptService** and click the ⊕ button.
   1. From the contextual menu, insert a **Script**.
1. In the new script, paste the following code:

   ```lua
   local Players = game:GetService("Players")

   local function onCharacterAdded(character)
   local humanoid = character:WaitForChild("Humanoid")
   local animator = humanoid:WaitForChild("Animator")
   print("Animator found!")
   end

   local function onPlayerAdded(player)
   player.CharacterAdded:Connect(onCharacterAdded)
   end

   Players.PlayerAdded:Connect(onPlayerAdded)
   ```

> [!note]- Code Explanation
> The `ResetDefaultAnimations` script starts by getting the [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] service, which contains all [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] objects for players as they connect to a server. When each of the player's characters load into the game, the [[30 Official Roblox Docs/API Reference/Classes/Player|onCharacterAdded]] function waits until it detects the character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] and [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] objects.
>
> When it detects an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] object for the first time, the script then prints "Animator found!" to let you know that the script is working as intended.

### Replace asset ID

Now that you know your script is able to detect when players load and connect to the server, you can modify your script to specifically reference the animation ID(s) you want to swap with your own custom animations.

The following table contains all of the default character animations that you can call and replace within the [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] object. Note that Idle has two variations that you can program to play more or less frequently.

| Character Action | Animate Script Reference |
| --- | --- |
| **Run** | `animateScript.run.RunAnim.AnimationId` |
| **Walk** | `animateScript.walk.WalkAnim.AnimationId` |
| **Jump** | `animateScript.jump.JumpAnim.AnimationId` |
| **Idle** | `animateScript.idle.Animation1.AnimationId`<br> `animateScript.idle.Animation2.AnimationId` |
| **Fall** | `animateScript.fall.FallAnim.AnimationId` |
| **Swim** | `animateScript.swim.Swim.AnimationId` |
| **Swim (Idle)** | `animateScript.swimidle.SwimIdle.AnimationId` |
| **Climb** | `animateScript.climb.ClimbAnim.AnimationId` |

To replace the default walk animation asset ID:

1. Call the default walk animate script reference, then replace the asset ID with your own custom animation asset ID. For example, the following code sample references the walk cycle animation from [[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Animation/Create character animations|Create Character Animations]].

   ```lua
   local Players = game:GetService("Players")

   local function onCharacterAdded(character)
   local humanoid = character:WaitForChild("Humanoid")
   local animator = humanoid:WaitForChild("Animator")
   print("Animator found!")

   local animateScript = character:WaitForChild("Animate")
   animateScript.walk.WalkAnim.AnimationId = "rbxassetid://122652394532816"
   end

   local function onPlayerAdded(player)
   player.CharacterAdded:Connect(onCharacterAdded)
   end

   Players.PlayerAdded:Connect(onPlayerAdded)
   ```

1. Playtest your game to ensure your custom walk animation overrides the default animation.
   1. Choose **Test** from the dropdown menu and click the **Play** button to its right to begin the playtest.

      *(image in the full Top G Vault)*

   1. Walk around the space station with your avatar.

      [Video: Replace-AssetID-2B.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/playing-character-animations/Replace-AssetID-2B.mp4)

## Trigger animations

While the previous technique focuses on swapping out default animations that automatically play whenever a character performs specific in-game actions, you can programmatically trigger animations to play in response to **any** character action within the 3D space, such as picking up an item or taking damage from a hazard.

[Video: Pose-Example.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/playing-character-animations/Pose-Example.mp4)

*In this example, when players touch the golden platform, they trigger a non-default character dance animation.*

This method of playing animations is useful because it provides players instantaneous feedback on how they should interact with objects in their environment. To demonstrate, the following section shows you how to trigger an animation whenever characters are too close to hazardous steam leaks as a way of subtly teaching players to avoid walking too close to the walls.

### Insert volume

One of the most common ways to trigger unique gameplay behavior is to use **volumes**, or invisible regions within the 3D space, to detect when characters or objects interact with specific areas of the environment. When you pair volumes with scripts, you can use their collision feedback to programmatically trigger actions, such as reducing the player's health or playing an animation.

*(image in the full Top G Vault)*

*The Mystery of Duvall Drive uses volumes to trigger gameplay events that change the visual appearance of the room.*

When adding a volume to your game, it's important to scale it so that it only covers the space that you want to trigger your animation. If you make your volume too small, players may never collide with the area to play the animation; conversely, if you make your volume too large, the animation will play before players reach the item or area of interest, and they may not understand what they did to trigger the animation.

To insert a volume around a steam leak that will trigger an animation:

1. In the **Explorer** window, add a new block part.
1. Position and resize the block until it covers the area that you want to trigger your animation.
1. In the **Properties** window,
   1. Set **Name** to **AnimationDetector**.
   1. Set **Transparency** to `1` to make the block invisible.

      *(image in the full Top G Vault)*

### Create script

Now that you have a defined region for triggering your animation, it's time to create a script that programmatically detects whenever players collide with the volume. You can then listen for collision events to trigger any animation that makes sense for your gameplay requirements.

For example, this animation technique uses a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] instead of a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] to provide players immediate feedback when they collide with the volume. If the server were to listen for the collision and play the animation, there could be a delay between the player touching the volume on their client and seeing the animation play because of the replication time from the server to the client.

To create a local script that will detect when the local player's character touches the volume:

1. In the **Explorer** window, add a new script to **StarterCharacterScripts**. This placement ensures the script and its children clone into the player character on join **and** when they respawn back into the game.
   1. Expand **StarterPlayer**, then hover over its **StarterCharacterScripts** child and click the ⊕ button.
   1. From the contextual menu, insert a **LocalScript** and rename it **TriggerAnimation**.
1. In the new script, paste the following code:

   ```lua
   local Workspace = game:GetService("Workspace")

   local animation = script:WaitForChild("Animation")
   local humanoid = script.Parent:WaitForChild("Humanoid")
   local animator = humanoid:WaitForChild("Animator")
   local animationTrack = animator:LoadAnimation(animation)
   local animationDetector = Workspace:WaitForChild("AnimationDetector")

   local debounce = false

   animationDetector.Touched:Connect(function(hit)
   if debounce then 
   return
   end

   local hitCharacter = hit:FindFirstAncestorWhichIsA("Model")
   if hitCharacter ~= localCharacter then
   return
   end

   debounce = true
   animationTrack:Play()
   animationTrack.Ended:Wait()
   debounce = false
   end)
   ```

> [!note]- Code Explanation
> The `TriggerAnimation` script starts by getting the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] service, which contains all objects that exist in the 3D world. This is important because the script needs to reference the [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] object acting as your volume.
>
> For each player character that loads or respawns back into the game, the script waits for:
>
> - Its child [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object, which you will add in the next section.
> - The character's [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] and [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] objects.
> - The volume object in the workspace named **AnimationDetector**.
>
> When anything collides with the volume, the `Touched` event handler function gets the first ancestor that's a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], which should be the character if the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that collided with the volume is a descendant of a character model. If it is, the function then checks to see if the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] is the **local** player's character. If it is, the function then:
>
> - Sets debounce to `true`.
> - Plays and waits for the animation to end.
> - Sets debounce back to `false`.
>
> Setting debounce from `false` to `true` to `false` again after the animation finishes playing is a debounce pattern that prevents the animation from repeatedly triggering as players continuously collide with the volume. For more information on this debounce pattern, see [[30 Official Roblox Docs/Scripting/Debounce patterns#Detect collisions|Detect collisions]].

### Add animation

If you were to playtest your game right now, your `TriggerAnimation` script still wouldn't be able to play an animation in response to the local player-volume collision. This is because it's waiting for a child [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object with an animation asset ID it can reference, and that [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object doesn't currently exist.

To add an animation for the local script to reference as players collide with the volume:

1. In the **Explorer** window, add a new animation to **TriggerAnimation**.
   1. Hover over **TriggerAnimation** and click the ⊕ button.
   1. From the contextual menu, insert an **Animation**.
1. Select the new animation object, then in the **Properties** window, set **AnimationID** to the animation asset ID you want to trigger when players touch the volume. For example, the [Hazardous Space Station](https://www.roblox.com/games/134383324873456/Walking-Character-Animation) sample references `rbxassetid://3716468774` to play an animation of a character falling backwards.
1. Playtest your game to ensure your animation plays when players are near the first steam leak.

   [Video: Add-Animation-3.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/playing-character-animations/Add-Animation-3.mp4)

---
*Source: [Play character animations](https://create.roblox.com/docs/tutorials/use-case-tutorials/animation/play-character-animations) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
