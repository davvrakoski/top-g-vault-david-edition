---
title: "StarterGear"
description: "If the game allows gear, `StarterGear` is a container automatically inserted into each `Player` object when the player joins the game. Whenever the player's character spawns, the contents of that player's `StarterGear` are copied into the player's `Backpack`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StarterGear"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*If the game allows gear, `StarterGear` is a container automatically inserted into each [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object when the player joins the game. Whenever the player's character spawns, the contents of that player's `StarterGear` are copied into the player's [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

When a player spawns, the contents of that player's `StarterGear` is copied into the player's [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]]. Additionally, if the game allows gear, all of the appropriate gear [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]] that the player owns are inserted into that player's `StarterGear`.

Unlike [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]], `StarterGear` isn't a service but rather a child of each [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] object, so its contents are player‑specific. Whether or not gear can be permitted is determined in a place's **Permissions** settings. You can enable gear by its genre or choose specific types to allow. To disable gear, ensure all the gear types are unselected.

Listening to the [[30 Official Roblox Docs/API Reference/Classes/Players#PlayerAdded|Players.PlayerAdded]] event from a server [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] is useful for accessing `StarterGear`:

```lua
local Players = game:GetService("Players")

local toolPrefab = Instance.new("Tool")
toolPrefab.Name = "Example Tool"

local function onPlayerAdded(player)
	-- Wait for StarterGear to be added
	local starterGear = player:WaitForChild("StarterGear")
	-- Clone prefab tool to StarterGear
	local toolClone = toolPrefab:Clone()
	toolClone.Parent = starterGear
end

Players.PlayerAdded:Connect(onPlayerAdded)
```

#### Gameplay Considerations

Always test experiences after adding gear to them to check that users can't easily abuse them there. Gear may include [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] objects which allow the player to perform actions that you might not consider; for example, navigational gear might allow the player to access a part of the map that you don't want them to, and weapon gear may allow the holder to damage other players, possibly without retribution or retaliation.

---
*Source: [StarterGear](https://create.roblox.com/docs/reference/engine/classes/StarterGear) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
