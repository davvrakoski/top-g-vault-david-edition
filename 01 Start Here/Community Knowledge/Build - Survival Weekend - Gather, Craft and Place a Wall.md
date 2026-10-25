---
area: "01 Start Here"
cluster: "Start Here"
title: "Build - Survival Weekend - Gather, Craft and Place a Wall"
tags: [roblox, community-knowledge, start-here, weekend-build, survival, crafting]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
  - https://create.roblox.com/docs/scripting/attributes
  - https://create.roblox.com/docs/scripting/events/remote
  - https://create.roblox.com/docs/scripting/security/security-tactics
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
---
# Build - Survival Weekend - Gather, Craft and Place a Wall

Survival games stack three loops: gather resources, craft them into items, and build or use those items to stay alive. Each loop alone is simple; the beginner trap is building hunger, temperature, day-night, enemies, inventory UI and base raids all at once and finishing none. This plan builds the three core loops end to end with plain attributes as the inventory, then adds exactly one threat on day 2 so the building matters. Full design: [[Zombie Survival Starter Architecture]], [[Crafting System Blueprint]] and [[Case Study - 99 Nights in the Forest]].

## The weekend scope

| In | Cut (later) |
|---|---|
| 2 resources: Wood, Stone | Ores, food, rarity tiers |
| 3 recipes: Wall, Campfire, Axe | Recipe tree, workbench tiers |
| Place walls on a 4-stud grid | Free rotation, roofs, snapping sockets |
| Night: enemies spawn for 2 minutes | Hunger, thirst, temperature |
| Inventory as attributes + a text list | Drag-drop slots, hotbar |

## Day 1 - gather and craft (about 5 hours)

1. **Map (1.5 h).** A forest clearing with 15 trees and 8 rocks near spawn and richer clusters further out. Read [[Map - Survival Resource Distribution - Risk Rings, Node Clusters and Respawn Timers]].
2. **Resource nodes (1 h).** Each tree or rock model gets the tag `Node`, attributes `Item = "Wood"`, `Hits = 5`, `MaxHits = 5`, and a ProximityPrompt (`HoldDuration = 0.5`). Tags: [[Starter - First Tags and Attributes - One Script for Every Kill Brick]].
3. **Core script, gather + craft parts (2 h).** Below. Inventory is just attributes on the Player (`Wood = 12`), which replicate to that client for the HUD.
4. **Crafting UI (30 min).** Three buttons that fire `Craft("Wall")` etc., and a label listing your counts. The look can come later: [[Recipe - Crafting Table]].

## Day 2 - build and survive (about 5 hours)

1. **Placement (2 h).** The client shows a see-through wall under the mouse, snapped to 4 studs, and fires `Place("Wall", position)`. The server re-snaps, checks range and stock, checks for overlap, then builds. Grid math: [[Math - Square Grids - World to Cell, Neighbours and Chunk Keys]]; full system later: [[Grid Placement System - Community Blueprint]].
2. **One threat (2 h).** Every 5 minutes, night falls for 2 minutes and 3-5 slow enemies walk toward the nearest player; walls block them. Reuse [[Starter - First Chasing Enemy - Nearest Player, Touch Damage and a Leash]]. Lighting: [[Day - Night and Lighting Blueprint]].
3. **Campfire (30 min).** Standing near a placed campfire heals slowly: [[Recipe - Healing Zones and Safe Zones]].
4. **Wrap (30 min).** Decide: saving bases is a big job (ownership, limits, data size). For this weekend, servers reset; say so on the game page.

## The core script: gather, craft, place

```lua
-- ServerScriptService/Survival
local CollectionService = game:GetService("CollectionService")
local RS = game:GetService("ReplicatedStorage")
local RECIPES = {Wall = {Wood = 6}, Campfire = {Wood = 3, Stone = 2}, Axe = {Wood = 2, Stone = 3}}
local GRID, RANGE = 4, 20

local function add(player, item, n)
	player:SetAttribute(item, (player:GetAttribute(item) or 0) + n)
end
local function remote(name)
	local r = Instance.new("RemoteEvent")
	r.Name = name
	r.Parent = RS
	return r
end

for _, node in CollectionService:GetTagged("Node") do
	local home = node.Parent
	node:FindFirstChildWhichIsA("ProximityPrompt", true).Triggered:Connect(function(player)
		add(player, node:GetAttribute("Item"), 1)
		node:SetAttribute("Hits", node:GetAttribute("Hits") - 1)
		if node:GetAttribute("Hits") <= 0 then
			node.Parent = nil -- hide; connections stay alive
			task.delay(60, function()
				node:SetAttribute("Hits", node:GetAttribute("MaxHits"))
				node.Parent = home
			end)
		end
	end)
end

remote("Craft").OnServerEvent:Connect(function(player, name)
	local recipe = type(name) == "string" and RECIPES[name]
	if not recipe then return end
	for item, n in recipe do
		if (player:GetAttribute(item) or 0) < n then return end
	end
	for item, n in recipe do add(player, item, -n) end
	add(player, name, 1)
end)

remote("Place").OnServerEvent:Connect(function(player, name, pos)
	local template = type(name) == "string" and RS.Buildables:FindFirstChild(name)
	if not template or typeof(pos) ~= "Vector3" then return end
	if (player:GetAttribute(name) or 0) < 1 then return end
	local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not root or (root.Position - pos).Magnitude > RANGE then return end
	local snapped = Vector3.new(math.round(pos.X / GRID) * GRID, pos.Y,
		math.round(pos.Z / GRID) * GRID)
	local cf = CFrame.new(snapped)
	if #workspace:GetPartBoundsInBox(cf, template:GetExtentsSize() * 0.9) > 1 then
		return -- something besides the ground is in the way
	end
	local built = template:Clone()
	built:PivotTo(cf)
	built.Parent = workspace.Built
	add(player, name, -1)
end)
```

Every remote argument is checked for type and range before use, because exploiters can send anything: [[Remote Type and Allowlist Validation]]. Put each model in `ReplicatedStorage/Buildables` and set its pivot at the bottom centre so it sits on the clicked point. The overlap test allows one part (the ground); if your ground is many parts, use an `OverlapParams` filter on a `Built` folder instead. The 0.9 shrink stops walls placed edge to edge from blocking each other.

## What to cut when you run late

- The Axe recipe and tool damage: gathering with bare hands is fine.
- Night enemies: replace them with a timer and "survive 3 nights" text; walls become decoration.
- The ghost preview: place the wall in front of the player instead of at the mouse.

## How to test

- [ ] Harvest a tree 5 times: it disappears, then returns after 60 s with full Hits.
- [ ] Craft a Wall with 5 wood: refused, wood unchanged.
- [ ] Place a wall 100 studs away by editing the client: refused.
- [ ] Place two walls on the same cell: the second is refused.
- [ ] Two players harvest the same tree: total wood equals MaxHits, no negative Hits.

## Related
[[00 START HERE - Top G Vault]] - [[Crafting System Blueprint]] - [[Zombie Survival Starter Architecture]] - [[Case Study - Natural Disaster Survival]]
