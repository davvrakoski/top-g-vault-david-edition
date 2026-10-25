---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Parachutes, Paragliders and Wingsuits - Drag States for Falling Players"
tags: [roblox, community-knowledge, vehicles, parachute, glider, character]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/how-to-slow-down-player-falling/1831385
  - https://devforum.roblox.com/t/how-to-create-terminal-velocity/1147739
  - https://devforum.roblox.com/t/roblox-dragforce-messes-up-on-slopes/4015091
  - https://devforum.roblox.com/t/phoenix-skydiving-system/2485946
  - https://create.roblox.com/docs/reference/engine/classes/VectorForce
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
---
# Ride - Parachutes, Paragliders and Wingsuits - Drag States for Falling Players

Drop-in battle royales, sky islands and plane jumps all need a "falling but controlled" state. The default Humanoid falls at full gravity with almost no air control. The fix is one `VectorForce` on the HumanoidRootPart that applies drag and lift depending on the current gear: none, skydive, wingsuit, parachute or paraglider. Each gear is just a different set of numbers.

## The force
DevForum answers on slowing falls and terminal velocity agree on the method: old BodyVelocity tricks are deprecated; use a `VectorForce` and let drag grow with speed (quadratic drag), which makes a terminal velocity appear on its own.

```lua
-- runs on the owning client (the character is client-owned)
local function airForce(root, gear)
	local v = root.AssemblyLinearVelocity
	local speed = v.Magnitude
	if speed < 0.1 then return Vector3.zero end
	local drag = -v.Unit * gear.k * speed * speed
	local lift = Vector3.yAxis * gear.lift * math.max(0, -v.Y)
	return (drag + lift) * root.AssemblyMass
end
```
Set the `VectorForce` to `RelativeTo = World` and `ApplyAtCenterOfMass = true`. Because the force scales with `AssemblyMass`, big avatars fall the same as small ones.

## Gear table (starting numbers, tune)
| Gear | k (drag) | Forward glide | Target fall speed | Steering |
|---|---|---|---|---|
| Skydive (belly) | 0.035 | 0 | about 75 studs/s | slide with WASD |
| Dive (head down) | 0.012 | 0 | about 130 | fast drop to land first |
| Wingsuit | 0.02 + lift | strong forward | about 35 down, 90 forward | bank to turn |
| Parachute | 0.6 | small | about 18 | slow yaw, flare to slow |
| Paraglider | 0.3 + lift | medium | about 10 down, 40 forward | bank, thermals lift |

With no lift term and gravity 196.2, terminal speed is sqrt(196.2 / k) (for example sqrt(196.2 / 0.035) is about 75). Pick k from the fall speed you want: k = 196.2 / speed squared. Wingsuit and paraglider rows also need the lift term plus a forward push, so tune those in Studio.

## State machine
`Grounded -> Freefall -> (Skydive | Dive) -> Canopy -> Landing -> Grounded`
- Enter freefall from `Humanoid.StateChanged` when the new state is `Enum.HumanoidStateType.Freefall` and height above ground is over a threshold (raycast down).
- Deploy canopy by key or auto at a minimum height (battle royale safety). Opening should not stop the player instantly: lerp `k` from skydive to parachute over 0.8 s, and play a sharp "snap" camera bump.
- Landing: if vertical speed on touch is above a limit, play a roll animation; above a second limit, fall damage.

## Steering
- Read `Humanoid.MoveDirection` (camera relative already) and add a small horizontal force in that direction, capped so players cannot hover.
- Parachute flare: holding jump briefly raises drag and lift for a soft landing, then the canopy stalls if held too long.
- Paraglider thermals: zone parts that add upward force while inside. A cheap, readable way to make maps vertical.

## Visuals and network
- Canopy is a model welded to the root with `Massless = true` so it does not change physics.
- The character is owned by its client, so the force works without server lag. The server should still check landing speeds it sees for anti-cheat sanity.
- The Phoenix Skydiving System on the DevForum is a ready-made R6/R15 pack (license not stated: link only).

## Pitfalls
- Leaving the VectorForce on while grounded makes walking feel sticky; disable it on `Landed`.
- `Humanoid` freefall animations override poses; play your own skydive animation at higher priority.

## Related
[[Vehicles - Hub]] - [[Aerodynamic Fluid Forces Beta - Planes, Gliders and Wind]] - [[Ride - Plane Stall, Flaps, Landing Gear and Runway Rules]] - [[Choosing Mover Constraints - AlignPosition, LinearVelocity and Friends]]
