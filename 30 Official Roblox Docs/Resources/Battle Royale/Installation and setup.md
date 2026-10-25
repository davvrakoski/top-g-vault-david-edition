---
title: "Installation and setup"
description: "Explains the installation and setup details for the Battle Royale game kit."
area: "30 Official Roblox Docs"
cluster: "Resources"
source: "https://create.roblox.com/docs/resources/battle-royale/installation-and-setup"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the installation and setup details for the Battle Royale game kit.*

To setup the Battle Royale game, you must download [[30 Official Roblox Docs/Studio/Roblox Studio setup|Studio]] and the project [[30 Official Roblox Docs/Resources/Battle Royale/Installation and setup#Reference files|reference files]].

Additional configuration of the [[30 Official Roblox Docs/Resources/Battle Royale/Installation and setup#Copy and paste place IDs|place IDs]], [[30 Official Roblox Docs/Resources/Battle Royale/Installation and setup#Adjust server fill|server]], and [[30 Official Roblox Docs/Resources/Battle Royale/Installation and setup#Publish additional places|publishing]] settings are also required before continuing on to [[30 Official Roblox Docs/Resources/Battle Royale/Run the game|running the game]].

## Reference files

[RobloxBattleRoyale.zip](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/resources/battle-royale/installation-and-setup/RobloxBattleRoyale.zip) consists of easily accessible `.rbxl` files which you can open in Roblox Studio and experiment with immediately.

| Name | Description |
| --- | --- |
| Lobby.rbxl | Entrance lobby where players choose the game mode. |
| Gameplay.rbxl | Where the battle match takes place. |
| Queue.rbxl | Queue place where players gather before being teleported to battle map. |

## Create a new game

Roblox Battle Royale must be structured as a game with six unique places. To begin:

1. Open `Lobby.rbxl` in Roblox Studio.

   *(image in the full Top G Vault)*

2. Select **File** → **Publish As…** to open the publishing window.
3. Near the bottom of the window, click **Create new experience**.
4. Type in **Lobby** for the place name.

   *(image in the full Top G Vault)*

5. For the **Creator** field, select "Me" to publish the place to your personal account, or select a group.
6. When ready, click the **Create** button.

## Add additional places

Once the lobby place is published, you'll need to add **five additional places** to the game:

1. If it's not already visible, open the **Asset Manager** window.
2. Double-click the **Places** folder.

   *(image in the full Top G Vault)*

3. Right-click in any empty region of the window (not over a place name/tile) and select **Add New Place**. Repeat this a total of five times so that you have six places.
4. Right-click each of the **new** places, select **Rename**, and name them as follows:

   *(image in the full Top G Vault)*

5. Publish the game again (**File** → **Publishx**).

## Copy and paste place IDs

Each place must be cross-associated so that players can teleport from the lobby to various play mode queues and vice-versa. To achieve this, you'll need to gather the place IDs of the places you created above.

1. In the **Asset Manager** window, right-click **Lobby** and select **Copy ID to Clipboard**.

   *(image in the full Top G Vault)*

2. If it's not already visible, open the **Explorer** window.
3. Open the **MainConfiguration** script within **ReplicatedFirst** → **Configurations**.

   *(image in the full Top G Vault)*

4. Locate the `_places` table and paste the copied ID from step #1 as the value of the `lobby` key.

   ```lua title="Lobby-MainConfiguration"
   local ReplicatedStorage = game:GetService("ReplicatedStorage")
   local RunService = game:GetService("RunService")
   local Players = game:GetService("Players")


   local isServer = RunService:IsServer()
   local ConfigEvent = nil

   local _placeOverrides = {}
   local _overrides = {}

   ---

   -- List of named places in the game
   local _places = {
    lobby = 0123456789,
    gameplay_development = 0,
    queue_default = 0,
    queue_deathmatch = 0,
    queue_teamDeathmatch = 0,
    queue_freePlay = 0
   }

   ---
   ```

5. Repeat the **Copy ID to Clipboard** process for the other five places and paste them into the associated `_places` table key value.

    | Place | Table key |
    | --- | --- |
    | Lobby | lobby |
    | Gameplay | gameplay_development |
    | Queue (Default) | queue_default |
    | Queue (Deathmatch) | queue_deathmatch |
    | Queue (Team Deathmatch) | queue_teamDeathmatch |
    | Queue (Free Play) | queue_freePlay |

   ```lua
   -- List of named places in the game
   local _places = {
    lobby = 0123456789,
    gameplay_development = 0987654321,
    queue_default = 0123459876,
    queue_deathmatch = 0987651234,
    queue_teamDeathmatch = 0132457689,
    queue_freePlay = 0678912345
   }
   ```

6. Publish the game again (**File** → **Publish**).

## Adjust server fill

By default, Roblox balances players/servers for an optimal social gameplay experience, but a battle royale should allow for bigger and more intense battles. To achieve this:

1. Open Studio's **File** ⟩ **Experience Settings** window.
2. Select the **Places** tab.
3. For each of the six places, click the button and select **Edit**.

   *(image in the full Top G Vault)*

4. For **Server Fill**, select **Maximum**.

   *(image in the full Top G Vault)*

5. Click **Save** at the bottom of the window.

## Publish additional places

Now you'll need to open the remaining `.rbxl` files from the downloaded bundle, modify their `_places` tables, and publish them.

### Copy places table

1. Refer to the `_places` table in the lobby's **MainConfiguration** script:

```lua
--------------------------------------
-- List of named places in the game
local _places = {
	lobby = 0123456789,
	gameplay_development = 0987654321,
	queue_default = 0123459876,
	queue_deathmatch = 0987651234,
	queue_teamDeathmatch = 0132457689,
	queue_freePlay = 0678912345
}
--------------------------------------
```

1. Select the **entire table** and copy it to the clipboard with <kbd>Ctrl</kbd><kbd>C</kbd> (<kbd>⌘</kbd><kbd>C</kbd> on Mac).
2. Close the lobby place by clicking the X in its tab.

   *(image in the full Top G Vault)*

### Replace tables

1. Open the `Gameplay.rbxl` file.
2. Open its **MainConfiguration** script within **ReplicatedFirst** → **Configurations**.

   *(image in the full Top G Vault)*

3. Paste the `_places` table you copied above over the existing `_places` table (<kbd>Ctrl</kbd><kbd>V</kbd>; <kbd>⌘</kbd><kbd>V</kbd>) so that each place's tables are identical.

   ```lua
   --------------------------------------
   -- List of named places in the game
   local _places = {
    lobby = 0123456789,
    gameplay_development = 0987654321,
    queue_default = 0123459876,
    queue_deathmatch = 0987651234,
    queue_teamDeathmatch = 0132457689,
    queue_freePlay = 0678912345
   }
   --------------------------------------
   ```

4. Select **File** → **Publish As…** to open the publishing window.
5. Near the bottom of the window, click **Update existing experience…**.
6. Locate and click the **Lobby** place that you published earlier.
7. On the next screen, you should see a list of the places you added earlier. From the list, select the **Gameplay** place and click the **Overwrite** button.

   *(image in the full Top G Vault)*

8. Once the place is published, close it by clicking the X in its tab.

   *(image in the full Top G Vault)*

9. Open the `Queue.rbxl` file and repeat this process, using **File** → **Publish As…** to publish it to all four queue places. Essentially, `Queue.rbxl` should be published to the **Queue (Default)**, **Queue (Deathmatch)**, **Queue (Team Deathmatch)**, and **Queue (Free Play)** slots.

   | File | Publish Slot |
   | --- | --- |
   | Lobby.rbxl | Lobby |
   | Gameplay.rbxl | Gameplay |
   | Queue.rbxl | Queue (Default) |
   | Queue.rbxl | Queue (Deathmatch) |
   | Queue.rbxl | Queue (Team Deathmatch) |
   | Queue.rbxl | Queue (Free Play) |

---
*Source: [Installation and setup](https://create.roblox.com/docs/resources/battle-royale/installation-and-setup) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
