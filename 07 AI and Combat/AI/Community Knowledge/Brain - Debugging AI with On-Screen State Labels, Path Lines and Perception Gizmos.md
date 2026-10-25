---
area: "07 AI and Combat"
cluster: "AI"
title: "Debugging AI with On-Screen State Labels, Path Lines and Perception Gizmos"
tags: [roblox, community-knowledge, ai, debugging, tooling, billboardgui, pathfinding]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BillboardGui
  - https://create.roblox.com/docs/reference/engine/classes/WireframeHandleAdornment
  - https://create.roblox.com/docs/characters/pathfinding
  - https://create.roblox.com/docs/reference/engine/classes/Highlight
  - https://create.roblox.com/docs/reference/engine/classes/Instance#SetAttribute
---
# Debugging AI with On-Screen State Labels, Path Lines and Perception Gizmos

"The zombie just stood there" is impossible to fix from a bug report. AI bugs are about **what the NPC believed**: which state it was in, what target it had, whether it could see the player, which path it was following. Professional AI teams always build a debug overlay early. On Roblox you can build one in an hour with built-in instances, and toggle it on in live servers for developers only.

## 1. Built-in Studio views first

The pathfinding docs point to the **Visualization Options** widget (top right of the 3D viewport): enable **Navigation mesh** and **Pathfinding modifiers**, and optionally **Pathfinding links**. Most "NPC won't path there" bugs are visible immediately: a gap in the navmesh, a doorway narrower than `AgentRadius`, a modifier labeled wrong.

## 2. Publish brain state as attributes

The server brain writes a few attributes on the NPC model when they change (not every frame):

- `AIState` ("Chase", "Attack", "Search")
- `AITarget` (target name)
- `AISees` (boolean), `AIHeard` (boolean)
- `AIPathStatus` (last `Path.Status` name), `AIWaypoint` (index / total)
- `AIToken` (holding an attack token?)

Attributes replicate, so any client can draw them, and you can also read them in the Properties window during a Studio test. Changing a string attribute only on state change costs almost nothing.

## 3. State label above the head (client)

A developer-only LocalScript adds a `BillboardGui` to each NPC's head:

```lua
local function attachLabel(npc: Model)
	local head = npc:FindFirstChild("Head")
	if not head then return end
	local gui = Instance.new("BillboardGui")
	gui.Size = UDim2.fromOffset(160, 40)
	gui.StudsOffset = Vector3.new(0, 2.5, 0)
	gui.AlwaysOnTop = true
	gui.MaxDistance = 120
	local text = Instance.new("TextLabel")
	text.Size = UDim2.fromScale(1, 1)
	text.BackgroundTransparency = 0.4
	text.TextScaled = true
	text.Parent = gui
	local function refresh()
		text.Text = string.format("%s > %s\n%s", npc:GetAttribute("AIState") or "?",
			npc:GetAttribute("AITarget") or "-", npc:GetAttribute("AIPathStatus") or "")
	end
	npc.AttributeChanged:Connect(refresh)
	refresh()
	gui.Adornee = head
	gui.Parent = head
end
```

Color the label by state (green idle, yellow search, red attack) and it becomes readable from across a room. `MaxDistance` keeps 200 labels from flooding the screen.

## 4. Path lines

Draw the current path with a `WireframeHandleAdornment`: it starts empty, and `AddPath(points, false)` draws connected segments; `Clear()` resets it. Parent it to a Part or Terrain as Adornee, with points relative to the Adornee's center. Send the waypoint positions to developer clients only when a path is recomputed (a debug RemoteEvent) or keep it Studio-only on the server.

## 5. Perception gizmos

- **Vision cone**: two lines from the head at +/- half the FOV angle, length = sight range, plus a line to the target colored green (seen) or red (blocked by raycast).
- **Hearing radius**: a flat circle drawn with `AddPath` on the ground (loop = true).
- **Last known position**: a small sphere adornment where the NPC thinks the player is; essential for debugging search behavior.
- **Highlight** the NPC's current target with a `Highlight` instance (cheap, only one at a time).

## 6. Live-server toggle

- Gate the overlay by `UserId` list or group rank checked on the **server**, which then sends the debug stream only to those players.
- A chat or Cmdr command `/aidebug on`.
- Never ship debug remotes that accept input from normal players.

## 7. Logs that match the overlay

Log state transitions with NPC id and time (`[Z12] Chase -> Search (lost sight 2.1s)`). When a tester reports a bug, the log plus a screenshot of the labels usually tells you the cause.

## Pitfalls

- Debug labels created on the server for every NPC: replication cost in live games. Build them on the client.
- Forgetting to remove adornments when NPCs despawn (memory leak); parent them under the NPC so they die with it.
- Updating label text every Heartbeat for hundreds of NPCs.

## Related
[[AI - Hub]] - [[AI gets stuck or loops]] - [[Enemy AI Pathing Loop with PathfindingService]] - [[NPC Vision and Hearing Model]] - [[Cmdr Permissions - BeforeRun Hooks Done Right]]
