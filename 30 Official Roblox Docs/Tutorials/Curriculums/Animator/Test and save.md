---
title: "Test and save"
description: "Explains how to playtest and save your fitness game."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/curriculums/animator/test-and-save"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to playtest and save your fitness game.*

Now that your poses are complete and set up to play as your character's run animation, it's time to playtest your game to verify that the animation plays properly, then publish your work to Roblox so that you can save your progress.

## Playtest your animation

It's important to playtest your game often to ensure that your animation plays exactly the way you want it to play for your players. Studio offers several playtest options:

- **Test** – Starts the playtest by inserting your avatar at a spawn location.
- **Test Here** – Starts the playtest by inserting your avatar in front of the camera's current position.
- **Run** – Starts the playtest without inserting your avatar. Instead, the playtest begins at the current camera position and you can navigate around using the camera controls.

While all options are useful at different times, it's important to use a playtest option that inserts your avatar so that you can see your animation play.

To playtest your animation:

1. In the top-left corner of Studio, verify that your playtest is set to either **Test** or **Test Here**, then click the **Play** button. Studio enters playtest mode.

   *(image in the full Top G Vault)*

1. Use the <kbd>WASD</kbd> keys to walk around and see the animation play.

   [Video: finished-animation.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-island-of-move/change-the-animation/finished-animation.mp4)

   > [!warning]
   > If you make updates to the animation, remember to **Save** it in the **Animation Editor**.

1. When you're done, return to the top-left corner of Studio, then click the **Stop** button. Studio exits playtest mode.

   *(image in the full Top G Vault)*

If you're running into any issues with your animation, check out the following troubleshooting tips:

**Issue:** Animation is spotty, skips, or looks glitchy.

- Make sure that the first and last poses are the same. If they aren't, right-click on the diamond for the first pose and copy it, then paste that pose at the end of the timeline.
- Check that the figure stays inside the white grid when you select it. If not, it may go through walls or the ground when the animation plays.

**Issue:** Animation isn't the one that you were working on.

- Check that you've published the animation through the **Animation Editor**.
- In the **Explorer** window, find an object named **WalkAnimationID**, then make sure its `Value` property is only a number.

## Publish to Roblox

You have access to your animation ID for other projects, but if you were to close Studio now, you would lose every edit you made to your game. For this reason, it's important to publish your work to Roblox often to save your work and connect the game to your account.

> [!info]
> It's recommended to publish to Roblox every ten minutes or after making a big change.

1. In the top-left corner of your computer, click **File** > **Publish** to open the publishing window.

1. In the **Game details** window,

   1. Upload an [[30 Official Roblox Docs/Production/Publishing/Icons|icon]] and [[30 Official Roblox Docs/Production/Publishing/Thumbnails|thumbnail]] to display on your game's main details page.
   1. In the **Name** field, provide a name for your game.
   1. Set **Genre** and the optional **Subgenre** dropdown menus to what type of gameplay players should expect. For more information, see [[30 Official Roblox Docs/Production/Publishing/Genres|Genres]].
   1. In the **Description** field, provide a summary of what players can expect from your game.
   1. Click the **Save** button. Roblox publishes your game to the cloud with a unique `UniverseID`.

Now that your game is published and connected to your account, you can edit it from any computer!

> [!info] Saving after publishing
> Next time you want to save your work, just go to **File** → **Publish** or use the hotkey combo (<kbd>Alt</kbd><kbd>P</kbd>/<kbd>⌥</kbd><kbd>P</kbd>).

---
*Source: [Test and save](https://create.roblox.com/docs/tutorials/curriculums/animator/test-and-save) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
