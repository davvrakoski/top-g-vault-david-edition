---
area: "40 Community Resources"
cluster: "Performance and Security"
source_note: "community/performance-security/network-receive-budget"
title: "Network Receive Budget - 50 KB per Second and What Fills It"
tags: [roblox, community, "cluster/performance-and-security", networking, bandwidth, replication]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://devforum.roblox.com/t/real-world-building-and-scripting-optimization-for-roblox/3127146
  - https://create.roblox.com/docs/performance-optimization/microprofiler/network
---
# Network Receive Budget - 50 KB per Second and What Fills It

The vault's monitoring notes tell you to "set your own" bandwidth budget. Here is a concrete one from a shipped project. It comes from MrChickenRocket's DevForum guest article (Aug 2024, Roblox Staff category).

## The numbers

- Open the **Ctrl+F7** stats panel and watch **Recv**: what the server sends **you**, the client.
- The readout **turns red at 50 KB/s**, and replication is throttled from there.
- From about **40 KB/s**, **physics object updates start being throttled**, so stay **well under 40**.
- Each **moving physics assembly** costs roughly **0.4 to 0.9 KB/s**. That gives a rough budget of about **40 to 60 moving assemblies** visible to a client.
- The biggest contributors are moving physics objects and players, then heavy RemoteEvent use.

These figures come from one expert's testing in 2024. Re-check them in your own game, but they make a solid starting point.

## What fills the pipe (and the fix)

| Source | Why it costs | Fix |
|---|---|---|
| Unanchored server-owned parts that move (carts, debris, NPC rigs) | Each assembly streams position updates | Anchor and animate on clients. Despawn debris fast. Keep it below the assembly budget. |
| Server-side tweens and per-frame property writes | Every step replicates | Server sets the state, clients animate it (see [[Server-Side Tweens and Property Churn - Hidden Replication Cost]]) |
| Pets, coins and pickups as real server instances | Creating, moving and destroying them all replicate | **Event-driven props**: the server keeps the data, clients spawn the visuals |
| Chatty remotes (per-frame position pushes) | Constant reliable traffic | Lower the rate, send deltas, use UnreliableRemoteEvent or buffers (see [[Buffers and Bit Packing for Network Payloads]]) |
| Streaming in big map chunks | Bursts of instance data | Tune streaming radius, keep models atomic and lean |

## Event-driven props (how the example did it)

In *Cardboard Box Simulator*, **coins and pets exist only as server data**. The server fires events, and **clients create the meshes**. Pet movement runs fully on clients (raycasts plus `PivotTo`), so it uses close to **zero** bandwidth even with about **360 pets** visible in a 12-player server. Coin pickups carry **serial numbers**, so the server can reject made-up collections.

```lua
-- Server: authoritative coin ledger with serials; clients only render.
local spawnCoin = game:GetService("ReplicatedStorage").Remotes.SpawnCoin :: RemoteEvent
local collectCoin = game:GetService("ReplicatedStorage").Remotes.CollectCoin :: RemoteEvent
local PICKUP_RANGE = 12
local nextSerial = 0
local live: {[number]: {owner: Player, pos: Vector3}} = {}

local function spawnFor(player: Player, pos: Vector3)
	nextSerial += 1
	live[nextSerial] = { owner = player, pos = pos }
	spawnCoin:FireClient(player, nextSerial, pos) -- a few bytes, no Instance replication
end

collectCoin.OnServerEvent:Connect(function(player, serial: unknown)
	if typeof(serial) ~= "number" then return end
	local coin = live[serial]
	if not coin or coin.owner ~= player then return end -- unknown, already taken, or someone else's
	local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart") :: BasePart?
	if not root or (root.Position - coin.pos).Magnitude > PICKUP_RANGE then return end
	live[serial] = nil
	-- award currency here
end)
```

## Finding the culprit

The Creator Hub *Network usage* page: network data appears **only in frame dumps from the desktop client or Studio**. Set the MicroProfiler **Network** menu to High or Low, save a dump, then open **X-Ray / Network**. Received and sent rows are coloured by type: **physics blue, data green, assets red**. Right-click to open **Network events** for the details of each packet.

## Credits

MrChickenRocket (Peter McNeill), *Real world building and scripting optimization for Roblox*, DevForum, Aug 2024. Roblox Creator Hub, *Network usage* (CC BY 4.0). The ledger code is original.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Performance and Security - Hub]]

**Related notes:** [[Server Heartbeat, Ping and Bandwidth Monitoring]] · [[Network usage]] · [[Network Ownership and Physics Replication]] · [[Physics Throttling, Sleep and Adaptive Timestepping]] · [[Mobile Budgets from a Real Project - Triangles, Draw Calls and Memory]]

<!-- TDOD_GRAPH_END -->
