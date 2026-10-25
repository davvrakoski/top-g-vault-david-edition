---
title: "Personalize the game"
description: "Part of the Roblox Build It, Play It Challenge - Island of Move. Customize the template script."
area: "30 Official Roblox Docs"
cluster: "Education"
source: "https://create.roblox.com/docs/education/build-it-play-it-island-of-move/personalize-the-game"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Part of the Roblox Build It, Play It Challenge - Island of Move. Customize the template script.*

Make the Move It Simulator into your own unique vision by changing the rewards a player earns, the name of the game, and settings like player speed. Making these changes can change the mood of your game. In a few minutes, go from just a template to a unique game based off your vision.

## Change the game settings

The words you see in-game like "Move It Simulator", and "Roblox Developer" are all changeable. You can even make players move faster. These changes can be done by opening a script called _GameSettings_. That script includes different **variables**, or placeholders, for names and numbers used.

1. To open the script, find **Explorer** on the right side of Studio. If you cannot see Explorer, go into the View tab and click the Explorer button.

   *(image in the full Top G Vault)*

2. In Explorer **search bar**, type _GameSettings_.

3. Double-click the _GameSettings_ script.

   *(image in the full Top G Vault)*

### Change words

Inside _GameSettings_, you can change words displayed to players. This can even include the game title or messages shown when players level up.

To start, give the game its own unique name.

1. In the GameSetting script, on the left side are **line numbers**. Find **Line 8**.

   ```lua
   local GameSettings = {}

   -- ================================================================================
   -- Game Information
   -- These settings affect text that you see in game
   -- ================================================================================

   GameSettings.gameName = "Move It Simulator"
   GameSettings.developerName = "RobloxUser"

   GameSettings.levelUpMessage = "Level Up!"
   ```

2. Between the quotation marks, type a new name for your game.

   `GameSettings.gameName = "Wizardry School Simulator"`

3. Run your game. Notice how the billboard at the game start changed.

   *(image in the full Top G Vault)*

   *Before*

   *(image in the full Top G Vault)*

   *After*

### Change numbers

By modifying different numbers in _GameSettings_, you can create a unique game for your players. For instance, players can start out moving extra fast or gain levels slowly.

1. In the _GameSetting_ script, find line **28**. This line has the number for the player's starting move speed. Replace the number `7` with a higher number, like `30`.

   ```lua
   -- Multiplier determines how much players need to move before a level; 1 = small amount of movement, 3 much more movement
   local growthModifier = 1.2
   -- How fast a player starts with 0 levels
   local startMoveSpeed = 30
   -- The amount of WalkSpeed added per level
   local speedBoostPerLevel = 3
   ```

Run the game and notice that your player begins the game faster than before.

## Challenge checkpoint

You've customized your game, now claim your free prize! Celebrate your new skills by getting the **Kinetic Staff** and **Do-It-Yourself** badge. Copy the code below.

`DIY`

Click the button to open a Roblox game, find the in-game character, and click **REDEEM CODE** to get your prize.

[**Enter World**](https://www.roblox.com/games/5306359293/)

## Continue customizing

You've taken the first steps in making this game your own, now keep going! Below are a few options to change the look and feel of your game.

| | | |
| --- | --- | --- |
| *(image in the full Top G Vault)*<br><br>**Creating Terrain**<br><br>Sculpt mountains, rivers, or even cover the world in snow.<br><br>[[30 Official Roblox Docs/Studio/Terrain Editor\|View]] | *(image in the full Top G Vault)*<br><br>**Particle Effects**<br><br>Add fire, sparks, and other effects to objects in game.<br><br>[[30 Official Roblox Docs/Effects/Particle emitters\|View]] | *(image in the full Top G Vault)*<br><br>**Atmosphere**<br><br>Change a game's mood by using environment effects.<br><br>[[30 Official Roblox Docs/Environment/Atmospheric effects\|View]] |

---
*Source: [Personalize the game](https://create.roblox.com/docs/education/build-it-play-it-island-of-move/personalize-the-game) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
