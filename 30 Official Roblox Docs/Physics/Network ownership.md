---
title: "Network ownership"
description: "Learn how the Roblox Engine utilizes network ownership to improve physical responsiveness for players."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/network-ownership"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Learn how the Roblox Engine utilizes network ownership to improve physical responsiveness for players.*

In order to support complex physical mechanisms while also aiming for a smooth and responsive experience for players, the Roblox [[30 Official Roblox Docs/Physics/Physics|physics]] engine utilizes a **distributed physics** system in which computations are distributed between the server and all connected clients. Within this system, the engine assigns **network ownership** of physically simulated [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] to either a client or server to divide the work of calculating physics.

Clients experience **more responsive** physics interactions with parts that they own, since there's no latency from communication with the server. Network ownership also improves server performance because physics computations can be split up among individual clients, allowing the server to prioritize other tasks.

## BasePart ownership

By default, the server retains ownership of any [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. Additionally, the server **always** owns anchored [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and you cannot manually change their ownership.

Based on a client's hardware capacity and the player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] proximity to an unanchored [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], the engine automatically assigns ownership of that part to the client. Thus, parts close to a player's character are more likely to become player-owned.

## Assembly ownership

If a physics-based mechanism has no anchored parts, [[30 Official Roblox Docs/Physics/Network ownership#Setting ownership|setting ownership]] on an [[30 Official Roblox Docs/Physics/Assemblies|assembly]] within that mechanism sets the same ownership for **every assembly** in the mechanism.

If you anchor a lone assembly that is **not** part of a broader mechanism, its ownership goes to the server, since the server always owns anchored [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]]. Upon unanchoring the same assembly, its previous ownership state is lost and it reverts to automatic handling by the engine.

If you anchor one assembly within a broader mechanism of assemblies, its ownership goes to the server, but ownership of the other assemblies remains unchanged. Unanchoring the same assembly reverts its previously set ownership.

## Setting ownership

In games with complex physics interactions or in cases where you need to assign direct control, you can set ownership through a server-side call to [[30 Official Roblox Docs/API Reference/Classes/BasePart#SetNetworkOwner|BasePart:SetNetworkOwner()]].

> [!info]
> While you can manually call [[30 Official Roblox Docs/API Reference/Classes/BasePart#SetNetworkOwner|SetNetworkOwner(nil)]] for the server for gameplay-critical objects that the client should not be able to manipulate, you should do so conservatively since it may result in  jittery physics interactions for clients.
>
>
> Also note that the server **always** owns anchored [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] and you cannot manually change their ownership.

Consider a vehicle that has a [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat|VehicleSeat]] object for the driver and a [[30 Official Roblox Docs/API Reference/Classes/Seat|Seat]] object for a passenger, with both included in the vehicle assembly. With the default ownership rules, if a player character sits in the [[30 Official Roblox Docs/API Reference/Classes/Seat|Seat]] (passenger) and then another player jumps into the [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat|VehicleSeat]] (driver), the **passenger** gains physical ownership of the entire vehicle because they entered first. The driver will have to wait several network cycles before their input is recognized and the vehicle will feel less responsive.

The following [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] fixes this by manually assigning network ownership to the driver. In it, the [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat|VehicleSeat]] sets its [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat#Occupant|Occupant]] to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] sitting on it, so the script listens for the seat's [[30 Official Roblox Docs/API Reference/Classes/Object#Changed|Changed]] event to catch when a player sits in the seat. When the driver leaves the seat, the vehicle's network ownership is reverted to automatic with [[30 Official Roblox Docs/API Reference/Classes/BasePart#SetNetworkOwnershipAuto|BasePart:SetNetworkOwnershipAuto()]].

```lua
local Players = game:GetService("Players")

local vehicleSeat = script.Parent

vehicleSeat.Changed:Connect(function(prop)
	if prop == "Occupant" then
		local humanoid = vehicleSeat.Occupant
		if humanoid then
			-- Get the player from the character
			local player = Players:GetPlayerFromCharacter(humanoid.Parent)
			if player then
				vehicleSeat:SetNetworkOwner(player)
			end
		else
			-- Reset ownership when seat is unoccupied
			vehicleSeat:SetNetworkOwnershipAuto()
		end
	end
end)
```

> [!warning]
> For smooth performance and responsive behavior, ensure you also assign ownership of any loose [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] on top of a vehicle to the same client that controls the vehicle.

## Visualizing ownership

To assist with network ownership debugging, Studio can render colored outlines around objects when playtesting.

[Video: Visualization-Demo.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/network-ownership/Visualization-Demo.mp4)

| Outline color |  | Description |
| --- | --- | --- |
| `rgb(30,100,50)` | (green) | Your client owns the part and is simulating it. |
| `rgb(160,0,0)` | (red) | The part is within a "buffer zone" where your client is simulating it but it's still owned by something else. Your client might get ownership after this, or it may reject. |
| `rgb(220,220,220)`<br>`rgb(140,140,140)` | (white/grey) | Server or another client owns the part through either automatic network ownership or from explicit assignment through [[30 Official Roblox Docs/API Reference/Classes/BasePart#SetNetworkOwner\|part:SetNetworkOwner()]]. |
| `rgb(0,0,0)` | (black) | The part is owned by neither the server nor the client. Physics will not apply to this part. |

> [!info]
> Note that in a [[30 Official Roblox Docs/Studio/Studio testing modes#Multi-client simulation|multi-client simulation]], each client is assigned a unique color to indicate their ownership; this is mirrored in the [[30 Official Roblox Docs/Studio/Studio testing modes#Toggle client/server|Server]] view, helping you determine which client owns which part(s) at any given time.

To enable network ownership visualization:

1. Click on the **visualization options** button in the upper-right corner of the 3D viewport.

   *(image in the full Top G Vault)*

2. In the dropdown menu, toggle on **Network owners**.

## Security concerns

Roblox cannot verify physics calculations when a client has ownership over a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. Clients can exploit this and send bad data to the server, such as teleporting the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], making it go through walls or fly around.

Additionally, [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|BasePart.Touched]] events are tied to network ownership, meaning that a client can fire [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|Touched]] events on a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] it owns and send it to the server, even if the server doesn't see it touch anything. For example, a client can make a sword deal damage to another player across the map by firing the event through script injections, so it's important to check the validity of such events fired by clients.

See [[30 Official Roblox Docs/Scripting/Security/Security and cheat mitigation tactics|Security Tactics and Cheat Mitigation]] for detailed security tactics and cheat mitigation tactics for Roblox games.

---
*Source: [Network ownership](https://create.roblox.com/docs/physics/network-ownership) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
