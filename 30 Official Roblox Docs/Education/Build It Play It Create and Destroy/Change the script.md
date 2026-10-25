---
title: "Change the script"
description: "Part of the Create and Destroy series. Learn how to open and change a script in Roblox Studio."
area: "30 Official Roblox Docs"
cluster: "Education"
source: "https://create.roblox.com/docs/education/build-it-play-it-create-and-destroy/change-the-script"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Part of the Create and Destroy series. Learn how to open and change a script in Roblox Studio.*

With the map complete, you'll move onto polishing the game. These next articles will cover these finishing touches:

- Modify a script to award different points for buildings.
- Upload a custom game image.
- Share the game with friends.

## Open the script

Besides just the map, other aspects of Create and Destroy can be customized through a **script**, a container for code used to run a game. In this case, you'll change the points awarded by destroying buildings.

1. At the top of the **Explorer**, a list of everything included in a project, on the right-hand side, type **GameSettings**.
   *(image in the full Top G Vault)*

2. Double-click **GameSettings** to open the script editor.
   *(image in the full Top G Vault)*

## GameSettings script contents

In the script, you'll see a section with the three different point values given to players for large buildings (HighPoints), medium buildings (MediumPoints), and for props (LowPoints).

```lua
-- Game Variables
GameSettings.intermissionDuration = 10
GameSettings.roundDuration = 30
GameSettings.minimumPlayers = 1
GameSettings.transitionStart = 3
GameSettings.transitionEnd = 3
GameSettings.pointValues = {
	-- Value types must match folder names to award points correctly
	LowPoints = 0,
	MediumPoints = 10,
	HighPoints = 15,
}
```

## Change the points value

Giving players more points can make smashing buildings feel even more rewarding.

1. Look for Line 11 in the script. Make the large buildings worth 150 points by changing `HighPoints = 15`, to `HighPoints = 150`. Be sure to keep the comma after the number.

   ```lua
   GameSettings.pointValues = {
   	-- Value types must match folder names to award points correctly
   	LowPoints = 0,
   	MediumPoints = 10,
   	HighPoints = 150,
   }
   ```

2. **Playtest** and see how the change feels. Ask yourself if you'd like players to get more points for smashing the medium sized buildings as well. You can change that too.

   *(image in the full Top G Vault)*

3. If desired, take some time to experiment in making changes to the script. For example, changing the number in [[30 Official Roblox Docs/API Reference/Classes/GameSettings|GameSettings.roundDuration]] can make rounds go faster or shorter, depending on how many seconds you type.

   > [!warning]
   > If the project doesn't work as intended once a change has been made in the script, go back to the script editor and **undo** your last change.

## Share with friends

When you first publish a game, it's automatically set to private. Making it public in the **Experience Settings** menu will allow friends to be able to join with a link.

1. In the **File** → **Experience Settings** window, select **Permissions**.

2. Choose **Public** and click **Save**.

---
*Source: [Change the script](https://create.roblox.com/docs/education/build-it-play-it-create-and-destroy/change-the-script) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
