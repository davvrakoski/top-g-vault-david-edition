---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Map - Instanced Interior Slots - Pooled Copies and Streaming for Many Players"
tags: [roblox, community-knowledge, maps, interiors, instancing, streaming, housing]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Player
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/classes/PVInstance
---
# Map - Instanced Interior Slots - Pooled Copies and Streaming for Many Players

Many games need private interiors: a player's house, a party's dungeon room, a personal shop. One shared copy doesn't work (everyone walks into the same house), and a separate place per room means loading screens. The middle ground is **slots**: fixed positions far from the map, where the server clones a room for whoever needs one and reuses the slot when they leave. This note goes deeper than the general interiors note, which only mentions the idea.

## Slot layout
- Pick a grid far from the playable map, for example starting at (20000, 500, 0) with slots every 2,000 studs.
- **Spacing larger than your streaming radius.** If streaming is on and `StreamingTargetRadius` is 1024 (the recommended value), slots ~2,000+ studs apart mean a player inside one slot never streams the neighbouring slots or the main map. That keeps client memory low.
- **Stay well inside the safe range.** `Workspace.FallenPartsDestroyHeight` can't go below -50,000 because of floating-point problems far from the origin; keep the whole slot grid within a few tens of thousands of studs.
- **Above the destroy height.** Put the grid at a positive Y so no slot is near `FallenPartsDestroyHeight`.
- Number of slots = max players per server (or max parties). All slots exist in **server** memory while occupied, so a 30-player server can hold 30 rooms; budget the room's part count with that in mind.

## Allocator (original)
```lua
-- ServerScriptService/InteriorSlots.server.lua
local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local ORIGIN, SPACING, SLOTS = Vector3.new(20000, 500, 0), 2000, 40
local free, owned = {}, {} -- owned[userId] = { slot = n, model = Model }
for i = SLOTS, 1, -1 do table.insert(free, i) end

local function slotCFrame(i: number): CFrame
	local x = (i - 1) % 8
	local z = (i - 1) // 8
	return CFrame.new(ORIGIN + Vector3.new(x * SPACING, 0, z * SPACING))
end

local function enterInterior(player: Player, templateName: string)
	if owned[player.UserId] then return end
	local slot = table.remove(free)
	if not slot then warn("No free interior slots") return end
	local room = ServerStorage.Interiors[templateName]:Clone()
	room:PivotTo(slotCFrame(slot))
	room.Parent = workspace.ActiveInteriors
	owned[player.UserId] = { slot = slot, model = room }

	local arrive = (room:FindFirstChild("Arrival") :: BasePart).CFrame
	player:RequestStreamAroundAsync(arrive.Position, 5) -- ask for the room before moving
	local char = player.Character
	if char then char:PivotTo(arrive + Vector3.new(0, 3, 0)) end
end

local function freeInterior(player: Player)
	local rec = owned[player.UserId]
	if not rec then return end
	rec.model:Destroy()
	table.insert(free, rec.slot)
	owned[player.UserId] = nil
end

Players.PlayerRemoving:Connect(freeInterior)
```
Call `enterInterior` from a door's `ProximityPrompt.Triggered` after checking distance on the server, and `freeInterior` (after teleporting them back) when they exit.

## Streaming details that bite
- `Player:RequestStreamAroundAsync(position, timeOut)` asks the server to stream the area in before you move the player. It yields and gives no guarantee, so always spawn the player a few studs above the floor and keep a floor part that is large and simple.
- `Player.ReplicationFocus` (server-set) moves where streaming and physics replication focus. The default is the character's `PrimaryPart`, so you rarely need it for walking into a room. It is useful when a player edits their house from a free camera while the character stays elsewhere: set focus to a part in the room, and set it back to `nil` when done.
- Clients only see rooms they are near, but exploiters can still read anything that has streamed. Don't hide secrets in other players' rooms.

## Shared vs private
| Room | Use |
|---|---|
| One per player | Houses, personal bases, shops |
| One per party | Dungeon runs, co-op puzzles: allocate by party id, free when the last member leaves |
| Shared, single copy | Town hall, store interiors everyone uses |

## Saving furniture
Save each item's offset from the room's pivot (`room:GetPivot():ToObjectSpace(item:GetPivot())`), not world positions. Then the room can load into any slot next session.

## Pitfalls
- Players reset (respawn) inside a slot and appear back on the map while the room stays allocated; free it on `CharacterAdded` if they are no longer inside.
- Lighting: switch to an interior lighting preset on arrival on the client.
- Visitors: if friends may visit, teleport them to the owner's slot and free the room only when the owner leaves.

## Related
[[Maps - Hub]] - [[Interiors, Doors and Portals - In-Place Teleports vs Separate Places]] - [[Streaming causes nil - missing instances]] - [[Large World Streaming Architecture]]
