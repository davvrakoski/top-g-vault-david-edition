---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Anchors and Mooring with RopeConstraint"
tags: [roblox, community-knowledge, vehicles, boats, constraints, rope]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/constraints/rope
  - https://create.roblox.com/docs/reference/engine/classes/RopeConstraint
  - https://devforum.roblox.com/t/ropeconstraintproblem/670224
  - https://devforum.roblox.com/t/ropeconstraint-help/729721
---
# Ride - Anchors and Mooring with RopeConstraint

Parked boats drift away on waves, block docks, and get pushed into the map edge by other players. An anchor and dock lines fix that and add a nice ritual: drop anchor, tie up, walk ashore. Both are just `RopeConstraint`s with a winch, so it takes about 40 lines.

## Anchor drop
1. Put an Attachment `AnchorPoint` at the bow.
2. On "Drop anchor", raycast straight down from the bow (ignore the boat with `RaycastParams`). If it hits terrain or the seabed, place an anchored, invisible `Part` there with an Attachment.
3. Create a `RopeConstraint` from bow to seabed. Set `Length` to the measured distance plus slack (about 10%). `Visible = true`, `Thickness` 0.2.
4. Lift anchor: enable `WinchEnabled`, set `WinchTarget` to 1, `WinchSpeed` 6, then destroy the rope and the seabed part once `CurrentDistance` is near the target.

Facts from the docs: with `WinchEnabled`, the rope tries to bring its attachments to `WinchTarget`. `WinchSpeed`, `WinchResponsiveness` and `WinchForce` set how fast and hard. `WinchSpeed` cannot be negative; to let out line you raise `WinchTarget`.

```lua
local function dropAnchor(boat, bowAtt, seabedPos)
	local base = Instance.new("Part")
	base.Anchored, base.CanCollide, base.Transparency = true, false, 1
	base.Size = Vector3.one
	base.Position = seabedPos
	base.Parent = workspace
	local a1 = Instance.new("Attachment", base)
	local rope = Instance.new("RopeConstraint")
	rope.Attachment0, rope.Attachment1 = bowAtt, a1
	rope.Length = (bowAtt.WorldPosition - seabedPos).Magnitude * 1.1
	rope.Visible = true
	rope.Parent = boat
	return rope, base
end
```

## Dock mooring
- Give each dock slot two cleat Attachments (bow and stern). A `ProximityPrompt` "Tie up" on the dock creates two ropes to the boat's matching attachments with a short length.
- Use the winch to pull the boat in gently (`WinchTarget` 2, low `WinchForce`) instead of teleporting it. Too much force makes the boat flip or vibrate.
- When the driver sits again, auto-untie or show "Untie" first, so players do not rip the dock.

## Why ropes go wrong (DevForum lessons)
- Setting `Length` from `CurrentDistance` while things move makes the length creep. Measure the distance once with `.Magnitude` and set it, as the RopeConstraint problem thread recommends.
- `Attachment0` and `Attachment1` take Attachment objects, not parts (the "RopeConstraint help" thread).
- Create ropes on the server so everyone sees and simulates them consistently.

## Gameplay uses
- Anchored boats stop counting as "active vehicles", so your cleanup script can skip them.
- A heavy storm can snap ropes: destroy the rope when `CurrentDistance` stays above `Length` for a few seconds while wind or waves push.
- Fishing games: anchor = fishing allowed, moving = no fishing.

## Checklist
- [ ] Anchor raycast ignores the boat and players
- [ ] Rope length set once from measured distance
- [ ] Winch pulls in smoothly with no flip
- [ ] Ropes cleaned up when the boat despawns

## Related
[[Vehicles - Hub]] - [[Trailers and Towing with BallSocketConstraint]] - [[Boats and Ocean Resources - BuoyancySensor, Gerstner Waves and FFT Ocean]] - [[Ride - Boat Planing, Hull Trim and Speed-Driven Wakes]]
