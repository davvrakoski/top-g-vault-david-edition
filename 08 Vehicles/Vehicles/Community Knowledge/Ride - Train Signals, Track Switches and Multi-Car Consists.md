---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Train Signals, Track Switches and Multi-Car Consists"
tags: [roblox, community-knowledge, vehicles, trains, signals, splines]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://forums.factorio.com/viewtopic.php?p=253972
  - https://forums.factorio.com/viewtopic.php?p=245553
  - https://create.roblox.com/docs/reference/engine/classes/Workspace
  - https://create.roblox.com/docs/reference/engine/classes/Model
---
# Ride - Train Signals, Track Switches and Multi-Car Consists

The vault's train note picks between spline (CFrame) trains and physics carts. Once you have more than one train or a branching line, you need railway logic: a track graph with switches, block signals so trains do not collide, and consists (multiple cars) that follow the curve correctly. This note assumes spline trains, which is what most metro, freight and story train games use.

## Track as a graph
- **Segment**: one spline (or a polyline of Attachments) with a precomputed arc-length table, so you can ask "position and tangent at distance d".
- **Node**: where segments meet. A plain node links one segment to the next. A **switch** node has one input and two outputs, with a `switchState` (1 or 2, an index into its outputs).
- A train's position = `(segment, distance)`. When `distance` passes the segment length, move to the next segment chosen by the node (and the switch state).

```lua
local function advance(pos, dd)
	pos.d += dd
	while pos.d > pos.seg.length do
		pos.d -= pos.seg.length
		local node = pos.seg.endNode
		pos.seg = node.outs[node.switchState or 1]
	end
end
```
Switch models: rotate the visible points rails and change `switchState` together; refuse to throw a switch while any train is on it.

## Block signals
Split the network into **blocks** (a list of segments between two signals). A block is occupied if any car of any train is inside it.
- Signal before a block shows red when the block is occupied, green when free.
- A train approaching a red signal brakes to stop at the signal distance.
- Factorio's well known lesson applies directly: put **chain signals** before and inside junctions and normal signals at the exits, so trains do not stop in the middle of an intersection and block every route. A chain signal is green only if the block after the junction is also free.
- Two-way single track needs signals for both directions or it behaves as one-way.

## Consists (several cars)
- Each car has a `bogieSpacing` and a `coupling` gap. Car i sits at distance `head - sum(lengths and gaps before it)` along the path, walking backwards through segments if needed.
- Orient each car using **two points**, front and rear bogie, not the tangent at its center. That keeps long cars on the inside of curves and over switches.
- Move every car with `PivotTo` (or `workspace:BulkMoveTo` for many anchored parts) from one script per train.
- Coupling and uncoupling become list operations: split the list of cars into two trains with separate positions.

## Speed and driving
- Driver controls change a target speed; acceleration and braking curves are per train (freight is slow).
- Speed limits per segment (curves, stations). The AI or assist brakes to the limit before entering.
- Station stops: a station marker at a distance on a segment; stop when the head reaches it.

## Network
Simulate trains on the server at a fixed rate, but render on clients: send `segment id, distance, speed` a few times per second and let clients extrapolate with `workspace:GetServerTimeNow()`. Clients then move cars locally every frame. That is smooth and costs little bandwidth.

## Pitfalls
- Arc-length tables are essential; raw spline `t` makes trains speed up and slow down on curves.
- Throwing a switch under a train teleports the rear cars.

## Related
[[Vehicles - Hub]] - [[Trains on Roblox - Spline CFrame Trains vs PrismaticConstraint Carts]] - [[Riding Moving Vehicles - Keeping Standing Players Onboard]] - [[Kenney - Train Kit]]
