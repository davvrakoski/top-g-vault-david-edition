---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Survival - Resource Respawns, Base Griefing and Raids"
tags: [roblox, community-knowledge, testing, qa, genre-qa, survival, building]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/scripting/security/security-tactics
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
  - https://create.roblox.com/docs/cloud-services/memory-stores
  - https://umod.org/plugins/raid-protection
  - https://umod.org/community/raid-protection/36462-offline-raid-protection-active-when-one-player-is-offline
---
# QA Pass - Survival - Resource Respawns, Base Griefing and Raids

Survival games mix three systems that each break in their own way: a world that refills (trees, ore, loot crates), a building system where players change the map, and other players who want to wreck what you built. Bugs here are rarely crashes. They are slow economic leaks (resources farmed by server hopping) and social damage (spawn trapping, offline raids) that drive players away.

## Bugs this genre always ships with
- **Respawn inside things.** A tree or ore node respawns inside a wall, a base or a player.
- **Server-hop farming.** Node state lives in server memory, so every new server has full nodes; hopping servers beats waiting.
- **Shared full yield.** Three players hit one node and each gets the full drop.
- **Client harvest rate.** The tool's swing rate is enforced on the client only.
- **Building through others.** Placement allows walls that overlap another player's base, block doors, or seal spawn points (spawn trapping).
- **Building on nodes and loot.** A wall placed over a node or crate spawn claims it forever.
- **Offline raiding.** Bases are destroyed while the owner is away, which feels like lost hours. Rust plugin communities show the long tail: offline-protection rules have loopholes (for example, protection staying on because some authorised member is offline), so whatever rule you pick needs its own edge-case tests.
- **AFK stat drain.** Hunger and thirst keep ticking in menus or while the game is loading.

## Test checklist
1. Stand on a node's spawn point when its timer ends; also build a wall there. The node must wait or move, not spawn inside.
2. Clear a node, hop to a new server, and back. Decide whether nodes are per-server (then cap yield per player per hour) or global (then store timers in MemoryStore), and test that rule.
3. Three players hit one node together. Total yield must equal one node's yield (split or first-come).
4. Fire the harvest remote 20 times per second. Server caps it to the tool's real rate.
5. Try to place a wall that overlaps another base, a spawn point, a node and a door. Each rejected.
6. Raid: owner online, owner offline, owner's teammate online. Each must follow your written raid rule.
7. Leave with a base half built, rejoin in a different server. Base reloads on your plot without overlapping someone else's.
8. Sit in the pause menu and in the loading screen for 5 minutes. Stats should not drain (or drain at the documented rate).

## Exploit angles
- Placement checks on the server: overlap query with `GetPartBoundsInBox` against other players' builds and a no-build zone list (spawns, nodes, roads).
- Damage to buildings goes through one server function that checks raid rules, tool type and range.
- Cap parts per player and per server; a base that grows forever is also a server lag tool.

## Balance checks
- Measure resources per hour solo, in a group of four, and server hopping. The group rate should not be four times solo unless you mean it.
- Time to rebuild a destroyed base vs time to raid one. If raiding takes 2 minutes and rebuilding 2 hours, everyone leaves after their first raid.

## Data and save checks
- Save bases as a list of pieces with positions relative to the plot origin, plus a schema version.
- Save inventory on leave and on `BindToClose`; inventory dropped on death must not also stay in the save (death dupe).
- Use `UpdateAsync` for anything two servers could touch, like a shared clan storage.

## Debug helper: respawn a node only where it is clear
```lua
-- Server: try to respawn a node; retry later if anything is in the way.
local RETRY = 15

local function respawnWhenClear(template: BasePart, cframe: CFrame, parent: Instance, ground: Instance)
	local params = OverlapParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	-- ignore other nodes, the ground the node sits on, and terrain
	params.FilterDescendantsInstances = { parent, ground, workspace.Terrain }
	local box = template.Size * 0.9 -- slightly smaller so touching neighbours do not count
	while true do
		local hits = workspace:GetPartBoundsInBox(cframe, box, params)
		if #hits == 0 then
			local node = template:Clone()
			node.CFrame = cframe
			node.Parent = parent
			return node
		end
		task.wait(RETRY)
	end
end
```
Log how often a respawn has to retry; a node that retries constantly sits in a popular building spot and should move.

## Related
[[Testing - Hub]] - [[Zombie Survival Starter Architecture]] - [[Case Study - Natural Disaster Survival]] - [[Test - Dupe Hunting Test Script - Trades, Gifts, Drops and Rejoins]] - [[Test - Economy Regression Checklist - Currency, Rewards and Sinks]]
