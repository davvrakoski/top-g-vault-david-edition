---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/npc-appearance-pipeline"
title: "NPC Appearance Pipeline - From HumanoidDescription to Spawned Rig"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", npc, humanoiddescription, luau]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Players
  - https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription
  - https://create.roblox.com/docs/characters/appearance
  - https://devforum.roblox.com/t/how-to-optimize-humanoids/389801
---
# NPC Appearance Pipeline - From HumanoidDescription to Spawned Rig

This note is about how NPCs **look** and get built. For crowd budgets, ticking and AI, use [[NPC Crowds, Animation LOD and Server Budgets]] and [[NPC AI Framework]].

## Three ways to dress an NPC

| Approach | When | Cost |
| --- | --- | --- |
| **Prebuilt in Studio** (rig plus accessories saved in the place) | Shopkeepers, bosses, story characters | Cheapest at runtime; no web calls |
| **Built at runtime from a description** (`Players:CreateHumanoidModelFromDescriptionAsync`) | Random townsfolk from outfit tables, player-clone statues | Yields, downloads assets; cache results |
| **Copied from a real user** (`Players:GetHumanoidDescriptionFromUserIdAsync`) | Leaderboard statues, "top player of the week", friends in lobby | Web call per user; cache by UserId |

`CreateHumanoidModelFromDescriptionAsync(description, rigType)` returns a full Humanoid model, R6 or R15, wearing everything in the description, including layered clothing.

## Pipeline

1. **Outfit table** in a ModuleScript: body colors, shirt and pants IDs, accessory lists, scale values. Keep IDs you have tested.
2. **Build once, clone many.** Build each outfit's model once at server start (or lazily on first use) and keep it in ServerStorage. Clone the cached model for each spawn instead of calling the web API every time.
3. **Set `UseAvatarSettings`** on descriptions that come from real users, so statues obey the same scale rules as players.
4. **Spawn**: clone, `PivotTo` the spawn point, parent to Workspace, then give the server ownership of the root if it is AI-controlled (`root:SetNetworkOwner(nil)`).
5. **Trim the Humanoid**: disable states the NPC never uses. The 2019 DevForum thread by Intended_Pun (with a summary reply by ForeverHD) lists climbing and swimming as typical states to turn off, plus box collision fidelity on decorative MeshParts.
6. **Despawn** by destroying the clone; never destroy the cached template.

## Original example: outfit cache and spawner

```lua
-- ServerScriptService/NpcOutfits (ModuleScript)
local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local cacheFolder = Instance.new("Folder")
cacheFolder.Name = "NpcOutfitCache"
cacheFolder.Parent = ServerStorage

local OUTFITS = {
	Guard = { Shirt = 0, Pants = 0, HatAccessory = "", HeightScale = 1.05 },
	-- replace 0 with tested catalog IDs
}

local NpcOutfits = {}

local function build(name: string): Model?
	local data = OUTFITS[name]
	if not data then return nil end
	local desc = Instance.new("HumanoidDescription")
	for key, value in data do
		(desc :: any)[key] = value
	end
	local ok, model = pcall(function()
		return Players:CreateHumanoidModelFromDescriptionAsync(desc, Enum.HumanoidRigType.R15)
	end)
	if not ok then
		warn("NPC outfit failed:", name, model)
		return nil
	end
	model.Name = name
	model.Parent = cacheFolder
	return model
end

function NpcOutfits.spawn(name: string, at: CFrame): Model?
	local template = cacheFolder:FindFirstChild(name) or build(name)
	if not template then return nil end
	local npc = template:Clone()
	npc:PivotTo(at)
	npc.Parent = workspace
	local humanoid = npc:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
	end
	local root = npc:FindFirstChild("HumanoidRootPart") :: BasePart?
	if root then
		root:SetNetworkOwner(nil)
	end
	return npc
end

return NpcOutfits
```

## Player-clone statues

- Get the description with `GetHumanoidDescriptionFromUserIdAsync(userId)` inside `pcall`, build the model, then anchor the root and remove the Humanoid's ability to move (statues do not need physics).
- Cache by UserId for the server's lifetime; leaderboards change slowly.
- Respect privacy and safety: only show avatars of players who are actually on your board.

## Faces on NPCs

Dynamic heads can show expressions on NPCs through facial animation or `FaceControls`; see [[Dynamic Heads for Game Developers - FACS, FaceControls and Moods]].

## Credits

- Roblox Creator Docs: Players and HumanoidDescription references, *Character appearance* (CC BY 4.0).
- DevForum "How to Optimize Humanoids" by Intended_Pun, reply by ForeverHD (2019).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[NPC Crowds, Animation LOD and Server Budgets]] · [[NPC AI Framework]] · [[HumanoidDescription Recipes - Async APIs and Safe Apply Order]] · [[NPC kit]] · [[Scalable NPC Horde Lab]]

<!-- TDOD_GRAPH_END -->
