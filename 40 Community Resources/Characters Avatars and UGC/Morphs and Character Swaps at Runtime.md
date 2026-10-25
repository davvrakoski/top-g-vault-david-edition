---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/morphs-character-swaps"
title: "Morphs and Character Swaps at Runtime"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", custom-character, morph, luau]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/2667412
  - https://devforum.roblox.com/t/free-character-morph-script/2711849
  - https://devforum.roblox.com/t/2420027
  - https://devforum.roblox.com/t/morphing-with-values/1864634
  - https://devforum.roblox.com/t/how-to-make-a-character-morph/2310078
  - https://create.roblox.com/docs/characters/appearance
---
# Morphs and Character Swaps at Runtime

Two different jobs get called "morph":

1. **Re-dress the same avatar** (team uniform, class armor, a hat). Use `HumanoidDescription`. See [[HumanoidDescription Recipes - Async APIs and Safe Apply Order]].
2. **Become a different model** (monster, animal, prop hunt prop, custom rig). Swap `player.Character`.

## Swap pattern that the DevForum keeps landing on

From several Scripting Support threads (credits below):

- Clone the morph from ServerStorage on the **server**.
- **Unanchor** its HumanoidRootPart. An anchored root was the accepted fix in a 2023 thread where the morph just teleported next to the player.
- Move it with `PivotTo(oldCharacter:GetPivot())`. `SetPrimaryPartCFrame` is deprecated.
- Set `player.Character = newModel`, parent it to Workspace, destroy the old model.
- Copy anything from StarterCharacterScripts the new model needs (the shared "Free character Morph Script" does this).
- Reset the camera subject on the client.
- Wait until the default appearance has loaded before swapping; a thread found swapping too early left two characters in the world.
- For persistence across respawns, remember the morph name (attribute or DataStore) and reapply in `CharacterAdded`.

## Original server example

```lua
-- ServerScriptService/MorphService (ModuleScript)
local ServerStorage = game:GetService("ServerStorage")
local StarterPlayer = game:GetService("StarterPlayer")

local MORPHS = ServerStorage:WaitForChild("Morphs")
local MorphService = {}

function MorphService.morph(player: Player, morphName: string): boolean
	local template = MORPHS:FindFirstChild(morphName)
	local old = player.Character
	if not (template and old and old.PrimaryPart) then
		return false
	end

	local new = template:Clone()
	local root = new:FindFirstChild("HumanoidRootPart") :: BasePart?
	if not (root and new:FindFirstChildOfClass("Humanoid")) then
		new:Destroy()
		return false
	end
	root.Anchored = false
	new.PrimaryPart = root
	new.Name = player.Name

	-- Copy character scripts the template does not already have.
	for _, item in StarterPlayer.StarterCharacterScripts:GetChildren() do
		if not new:FindFirstChild(item.Name) then
			item:Clone().Parent = new
		end
	end

	new:PivotTo(old:GetPivot())
	player.Character = new
	new.Parent = workspace
	old:Destroy()
	player:SetAttribute("Morph", morphName)
	return true
end

return MorphService
```

Client side, after the swap:

```lua
local Players = game:GetService("Players")
local player = Players.LocalPlayer

player.CharacterAdded:Connect(function(character)
	local humanoid = character:WaitForChild("Humanoid")
	workspace.CurrentCamera.CameraSubject = humanoid
end)
```

## Gotchas

- Setting `player.Character` fires `CharacterAdded` again. Guard any code that would re-morph forever.
- Leaderboards, nametags and tool scripts that cached the old Humanoid break. Rebind them on `CharacterAdded`.
- Network ownership normally goes to the player for their character; if the morph moves strangely, check that no part is anchored or welded to the map.
- If the morph has no standard R15 parts, HumanoidDescription scaling and layered clothing will not work on it (see [[Layered Clothing on Custom and Non-R15 Rigs]]).

## Credits

- DevForum: ChronicallyOnlin_e (question) and YAYAYGPPR (accepted fix) in topic 2667412; the "Free character Morph Script" resource thread; "Temporarily replace character with a custom model"; "Morphing with values"; "How to make a character morph". Code above is our own.
- Roblox Creator Docs, *Character appearance* (CC BY 4.0).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[StarterCharacter Setup Checklist]] · [[Player and Character Lifecycle Without Race Conditions]] · [[HumanoidDescription Recipes - Async APIs and Safe Apply Order]] · [[Custom Camera Systems in Luau]]

<!-- TDOD_GRAPH_END -->
