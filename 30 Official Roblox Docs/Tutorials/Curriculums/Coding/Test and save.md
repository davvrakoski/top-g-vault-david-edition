---
title: "Test and save"
description: "Explains how to playtest and save your story game."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/curriculums/coding/test-and-save"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to playtest and save your story game.*

Now that the first sentence of your main story is complete and ready for players to write their own answer for the playerholder word, it's time to playtest your game to verify that the code runs properly, then publish your work to Roblox so that you can save your progress.

## Playtest your code

It's important to playtest your game often to ensure that your code works as expected. Studio offers several playtest options:

- **Test** – Starts the playtest by inserting your avatar at a spawn location.
- **Test Here** – Starts the playtest by inserting your avatar in front of the camera's current position.
- **Run** – Starts the playtest without inserting your avatar. Instead, the playtest begins at the current camera position and you can navigate around using the camera controls.

While all options are useful at different times, it's important to use a playtest option that inserts your avatar so that you can access the book and play through your story.

To playtest your code:

1. In the top-left corner of Studio, verify that your playtest is set to either **Test** or **Test Here**, then click the **Play** button. Studio enters playtest mode.

   *(image in the full Top G Vault)*

1. In the game, use the following player controls to walk up to the pedestal, then press <kbd>E</kbd> to open the book and start your story. Your first question should display if the code is working properly.

     | **Action** | **Control** |
     | --- | --- |
     | **Move** | <kbd>W</kbd> <kbd>A</kbd> <kbd>S</kbd> <kbd>D</kbd> or arrow keys |
     | **Rotate** | Hold the right mouse button and look around. |
     | **Pan** | Hold the middle mouse button to drag your camera around. |

   *(image in the full Top G Vault)*

1. Answer the question and click the **Submit** button.

   *(image in the full Top G Vault)*

1. When you're done, return to the top-left corner of Studio, then click the **Stop** button. Studio exits playtest mode.

   *(image in the full Top G Vault)*

If your first sentence didn't show up, check out the following troubleshooting tips:

**Issue**: The book doesn't display your first question.

Check that the question is inside of quotation marks.

**Issue**: The story is combined.

Check the following:

- The first part of the story is inside of quotation marks.
- The name of the variable holding the player answers matches exactly. Capitalization counts!
- The name of the variable holding the player's answer is not inside of quotation marks.
- The two strings are separated by `..`.

**Issue**: The book doesn't display the first sentence of your story.

Check the `storyMaker:Write()` function to make sure the **story** variable is in between the parentesis.

## Publish to Roblox

If you were to close Studio now, you would lose every edit you made to your game. For this reason, it's important to publish your work to Roblox often to save your work and connect the game to your account.

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
> Next time you want to save your work, just go to **File** > **Publish** or use the hotkey combo (<kbd>Alt</kbd><kbd>P</kbd>/<kbd>⌥</kbd><kbd>P</kbd>).

---
*Source: [Test and save](https://create.roblox.com/docs/tutorials/curriculums/coding/test-and-save) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
