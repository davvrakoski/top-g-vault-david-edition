---
title: "Spawn With Friends"
description: "The Spawn With Friends module automatically moves spawning players near one of their friends."
area: "30 Official Roblox Docs"
cluster: "Resources"
source: "https://create.roblox.com/docs/resources/modules/spawn-with-friends"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Spawn With Friends module automatically moves spawning players near one of their friends.*

It can be challenging to locate friends in-game. The **SpawnWithFriends** [[30 Official Roblox Docs/Resources/Modules/Developer modules|developer module]] automatically moves spawning players near one of their friends present in the game. This module can also be configured to teleport a player on command instead of automatically.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/developer-modules/spawn-with-friends/Showcase.mp4)

> [!warning]
> Before spawning occurs, in order to avoid spawning a character inside the map's geometry, the system confirms that there is enough space. Thus, this module might work better in games with large, open spaces.

## Module Usage

### Installation

To use the **SpawnWithFriends** module in a game:

1. From Studio's **Window** menu or **Home** tab toolbar, open the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) and select the **Creator Store** tab.

   *(image in the full Top G Vault)*

1. Make sure the **Models** sorting is selected, then click the **See All** button for **Categories**.

   *(image in the full Top G Vault)*

1. Locate and click the **Packages** tile.

1. Locate the **Spawn With Friends** module and click it, or drag-and-drop it into the 3D view.

   *(image in the full Top G Vault)*

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, move the entire **SpawnWithFriends** model into [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. Upon running the game the module will begin running.

### Restricted Spawn Areas

This module may result in players spawning in restricted areas like VIP rooms, access-only spaces, etc. To prevent players from teleporting to these areas:

1. Fill the restricted area with invisible [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]] blocks. Make sure [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|CanCollide]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanTouch|CanTouch]], and [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanQuery|CanQuery]] are **disabled** for all blocks.

   *(image in the full Top G Vault)*

   *Block filling the entire prison room to prevent players from spawning inside*

1. Using the [[30 Official Roblox Docs/Studio/Properties window#Instance tags|Tags]] section of each block's properties, apply the tag `RestrictedSpawnArea` so that [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]] detects them.

1. Paste the following code into a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] within **ServerScriptService**.

   ```lua title="Script"
   local ReplicatedStorage = game:GetService("ReplicatedStorage")
   local CollectionService = game:GetService("CollectionService")

   local SpawnWithFriends = require(ReplicatedStorage.SpawnWithFriends)

   local function validator(playerToTeleport, destinationPlayer, teleportationPoint)
   	-- Iterate through all tagged parts
   	for _, area in CollectionService:GetTagged("RestrictedSpawnArea") do
   		local relativePosition = area.CFrame:PointToObjectSpace(teleportationPoint.Position)
   		local size = area.Size
   		local inXBounds = relativePosition.X < size.X / 2 and relativePosition.X > -size.X / 2
   		local inZBounds = relativePosition.Z < size.Z / 2 and relativePosition.Z > -size.Z / 2
   		if inXBounds and inZBounds then
   			return false  -- Spawn destination is within restricted area; abort teleportation
   		end
   	end
   	return true  -- Spawn destination doesn't overlap any restricted area; proceed with teleportation
   end

   SpawnWithFriends.setTeleportationValidator(validator)
   ```

## API Reference

### Functions

#### configure

*configure(config: [[30 Official Roblox Docs/API Reference/Libraries/table|table]])*

Overrides default configuration options through the following keys/values in the `config` table. This function can only be called from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

| Key | Description | Default |
| --- | --- | --- |
| `teleportToFriendOnRespawn` | If set to `false`, teleportation to a friend will only happen manually via [[30 Official Roblox Docs/Resources/Modules/Spawn With Friends#teleportToRandomFriend\|teleportToRandomFriend]]. | true |
| `teleportDistance` | How far away players should spawn from each other, measured in studs. | 5 |
| `maxCharacterVelocity` | Characters moving faster than this value won't be picked as teleportation candidates, for instance those in moving vehicles. | 48 |
| `bypassFriendshipCheck` | If set to true, **all** players will be candidates for teleportation, not just friends. | false |
| `showLogs` | Whether or not to display log messages in the output. | false |

```lua title="Script" highlight="5-11"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SpawnWithFriends = require(ReplicatedStorage.SpawnWithFriends)

SpawnWithFriends.configure({
	teleportToFriendOnRespawn = true,
	teleportDistance = 5,
	maxCharacterVelocity = 48,
	bypassFriendshipCheck = false,
	showLogs = false
})
```

#### teleportToRandomFriend

*teleportToRandomFriend(playerToTeleport: [[30 Official Roblox Docs/API Reference/Classes/Player|Player]]): `boolean`*

Manually triggers teleportation of a player to one of their friends in the game. Returns a boolean indicating whether or not teleportation succeeded; failure to teleport can be caused by the absence of friends in the server or the inability to find an unobstructed teleportation point. This function can only be called from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

#### setTeleportationValidator

*setTeleportationValidator(validator: `function`)*

Allows you to perform custom pre-teleportation checks by hooking up a validator callback function. The callback receives three parameters:

| Parameter | Description |
| --- | --- |
| `playerToTeleport` | Reference to the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] that is being teleported. |
| `destinationPlayer` | Reference to the target [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] that `playerToTeleport` is being teleported to. |
| `teleportationPoint` | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] where `playerToTeleport` is teleporting to. |

This function and its callback can only be used in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] and the callback returns a boolean indicating whether teleportation should proceed. For example, the `return` logic in the following validator function ensures that the spawning player and destination player are on the same team.

```lua title="Script" highlight="6-8, 10"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SpawnWithFriends = require(ReplicatedStorage.SpawnWithFriends)

-- Teleports players only if they are on the same team
local function validator(playerToTeleport, destinationPlayer, teleportationPoint)
	return playerToTeleport.Team == destinationPlayer.Team
end

SpawnWithFriends.setTeleportationValidator(validator)
```

---
*Source: [Spawn With Friends](https://create.roblox.com/docs/resources/modules/spawn-with-friends) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
