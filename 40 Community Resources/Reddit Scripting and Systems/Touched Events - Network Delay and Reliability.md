---
area: "40 Community Resources"
cluster: "Reddit Scripting and Systems"
source_note: "community/reddit-scripting/touched-events-network-delay"
title: "Touched Events - Network Delay and Reliability"
tags: [roblox, community, reddit, "cluster/reddit-scripting-and-systems"]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/touch-events-and-network-delay/2876495
  - https://devforum.roblox.com/t/how-do-i-make-touched-not-activate-wayyyyy-before-it-actually-touches-smth/4699525
cssclasses: [tg-a40]
---

# Touched Events - Network Delay and Reliability

"My `.Touched` fires too early / too late / twice / not at all" is a top-five help topic. The best explanation is a Mar 2024 article by @APandaPoet on how Touched and TouchEnded replicate in Roblox's distributed physics.

## What actually happens (summary)

- Touch events are **detected by whichever machine simulates the part** (its network owner) and replicated to others.
- The server and each client see positions at **different times**, so the same contact can be reported at different moments, or a touch can register on one side and not the other.
- A client may detect touches for parts it doesn't own **and** receive the replicated event, so handlers can see more than one Touched for one contact.
- Players' own characters are client-owned, so touches between a player and a server part are first decided on that player's machine. Exploiters can fire touch callbacks on their client (an often-mentioned exploit function, noted by @technology1111).

## Practical rules from the threads

1. **Debounce per target**, not globally, and on the server.
2. **Never trust Touched for anything valuable** (damage, currency, checkpoints in competitive modes) without a server check like distance or state.
3. For "it fires before it really touches", the part's collision box is bigger than it looks (mesh collision fidelity) or the client is ahead of the server. Use a spatial query at the moment you care about.
4. For melee hits, use casts or overlap queries instead of Touched (see [[Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts]]).

## Own pattern: server-checked touch pad

```lua
local Players = game:GetService("Players")
local pad = workspace:WaitForChild("RewardPad") :: BasePart

local COOLDOWN = 2
local MAX_DISTANCE = 8
local lastTouch: {[number]: number} = {}

pad.Touched:Connect(function(hit)
	local character = hit:FindFirstAncestorOfClass("Model")
	local player = character and Players:GetPlayerFromCharacter(character)
	if not player then return end

	local now = os.clock()
	if lastTouch[player.UserId] and now - lastTouch[player.UserId] < COOLDOWN then
		return -- per-player debounce
	end

	local root = character:FindFirstChild("HumanoidRootPart") :: BasePart?
	if not root or (root.Position - pad.Position).Magnitude > MAX_DISTANCE then
		return -- server-side sanity check
	end

	lastTouch[player.UserId] = now
	-- grant reward here
end)

Players.PlayerRemoving:Connect(function(player)
	lastTouch[player.UserId] = nil
end)
```

Size `MAX_DISTANCE` to the pad: half its largest dimension plus a few studs of slack.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Reddit Scripting and Systems - Hub]]

**Related notes:** [[Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts]] · [[Network Ownership and Physics Replication]] · [[Remote spam - duplicate actions]] · [[Melee Hitbox Modules - RaycastHitbox to ShapecastHitbox]]

<!-- TDOD_GRAPH_END -->
