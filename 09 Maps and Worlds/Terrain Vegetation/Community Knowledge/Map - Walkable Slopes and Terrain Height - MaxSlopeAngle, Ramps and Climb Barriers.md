---
area: "09 Maps and Worlds"
cluster: "Terrain Vegetation"
title: "Map - Walkable Slopes and Terrain Height - MaxSlopeAngle, Ramps and Climb Barriers"
tags: [roblox, community-knowledge, terrain-vegetation, terrain, slopes, movement]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/StarterPlayer
  - https://create.roblox.com/docs/characters/pathfinding
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
---
# Map - Walkable Slopes and Terrain Height - MaxSlopeAngle, Ramps and Climb Barriers

On a terrain map, slope is the hidden rule of where players can go. Roblox's default lets characters walk up nearly any slope, so a mountain you meant as a wall is a staircase, and a valley you meant as a funnel has a dozen exits. Pick a slope limit early, sculpt to it, and check the whole map with a script instead of by eye.

## The engine numbers
- `Humanoid.MaxSlopeAngle`: the steepest slope a humanoid can climb; steeper slopes make it slide down. It is constrained to 0-89 degrees and **defaults to 89**, which the API reference describes as climbing "pretty much any slope".
- `StarterPlayer.CharacterMaxSlopeAngle` sets that value for every player character on spawn.
- `StarterPlayer.CharacterJumpHeight` defaults to 7.2 studs, so short steep steps are jumpable no matter what the slope limit is.
- NPCs: pathfinding treats terrain as walkable based on its own rules; test NPC paths on your steepest intended ramps.

## Choose a slope budget
A starting policy for an adventure or survival map:
| Slope | Meaning in the map |
|---|---|
| 0-25 degrees | Comfortable walking, roads, base building |
| 25-45 degrees | Hills; climbable, slower to read, fine for paths |
| Above your limit (e.g. 50+) | Cliff: a barrier |

Then set `StarterPlayer.CharacterMaxSlopeAngle` to the limit (for example 50). Every cliff must be steeper than that **for its whole height**, and taller than a jump (more than ~8 studs), or players will hop up ledge by ledge.

## Check slopes with a script (command bar, original)
Raycast a grid down onto terrain and report where the surface is steeper than the limit, so you can see accidental barriers and accidental climbs.

```lua
local LIMIT, STEP = 50, 8
local minX, maxX, minZ, maxZ = -512, 512, -512, 512
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = { workspace.Terrain }
local marks = Instance.new("Folder"); marks.Name = "SlopeMarks"; marks.Parent = workspace
local steep = 0
for x = minX, maxX, STEP do
	for z = minZ, maxZ, STEP do
		local hit = workspace:Raycast(Vector3.new(x, 1000, z), Vector3.new(0, -2000, 0), params)
		if hit then
			local angle = math.deg(math.acos(math.clamp(hit.Normal.Y, -1, 1)))
			if angle > LIMIT then
				steep += 1
				local p = Instance.new("Part")
				p.Anchored, p.CanCollide, p.CanQuery = true, false, false
				p.Size = Vector3.new(STEP, 1, STEP)
				p.Color = Color3.fromRGB(255, 60, 60)
				p.Position = hit.Position
				p.Parent = marks
			end
		end
	end
end
print(("Steep samples: %d (delete workspace.SlopeMarks when done)"):format(steep))
```
Red patches should form continuous walls where you want barriers and be absent on paths. Gaps in a red wall are where players will climb out.

## Sculpting rules
- **Barriers need a lip.** A cliff that ends in a gentle slope at the top is a ramp from the other side. Make sure out-of-bounds areas are steep from both sides or blocked by a boundary.
- **Paths need a flat bed.** Carve roads and paths along contour lines with gentle grades; switchbacks for steep climbs (see the roads note).
- **Use rock meshes to fix terrain.** Terrain voxels are 4 studs, so cliffs have stair-step edges that can be jumpable. A rock mesh with simple collision at the base of a cliff hides it and blocks reliably.
- **High ground should cost time.** A hilltop with a view should be reachable by a longer slope, not a direct climb.

## Vehicles and slopes
Vehicles have their own limits (torque, friction, wheel grip). Test every road with the weakest vehicle. A slope players can walk but cars can't is a nasty surprise in races and roleplay towns.

## Pitfalls
- Changing `CharacterMaxSlopeAngle` late, after the map was built at 89, and discovering half the hills are now walls.
- Terrain stairs: 4-stud voxel steps on cliffs that players jump up one by one.
- NPCs sliding off slopes players can walk, or walking where players can't.
- Forgetting crouch, sprint or climbing abilities that change the rules.

## Related
[[Terrain Vegetation - Hub]] - [[Roads, Paths and Rivers on Terrain - Carving Along a Curve]] - [[Map Boundaries, Kill Planes and Out-of-Bounds Handling]] - [[Math - Vector Projection, Reflection and Slope Checks]] - [[Map - Verticality and Multi-Level Maps - Floor Planes, Stairs, Drops and Ladders]]
