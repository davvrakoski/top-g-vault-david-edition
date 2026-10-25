---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/boats-ocean-resources"
title: "Boats and Ocean Resources - BuoyancySensor, Gerstner Waves and FFT Ocean"
tags: [roblox, community, vehicles, boats, water, buoyancy, luau, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/BuoyancySensor
  - https://devforum.roblox.com/t/gerstner-wave-module/3011006
  - https://devforum.roblox.com/t/open-source-my-fft-ocean-project/4776893
  - https://devforum.roblox.com/t/terraingetwaveheightvector3/182047
  - https://devforum.roblox.com/t/how-would-i-make-my-boat-drivable-on-gerstner-waves/2767436
---
# Boats and Ocean Resources - BuoyancySensor, Gerstner Waves and FFT Ocean

The vault's build guide for boats (terrain-water floating vs scripted buoyancy) is [[Hover, Boat and Flying Vehicles with Mover Constraints]]. This note adds the engine sensor and the community ocean resources.

## The core problem
Terrain water makes parts float by density, but its **waves are visual only**: a long-standing DevForum feature request points out they have no physics. So a boat on terrain water bobs on a flat surface while the waves animate through it, and a boat on a custom wave mesh needs custom buoyancy.

## BuoyancySensor (engine, terrain water)
A `BuoyancySensor` parented to a part reports how that part meets **Terrain** water:
| Property | True when |
|---|---|
| `TouchingSurface` | Any point of the part touches terrain water |
| `FullySubmerged` | The whole part is under water with at least one voxel of water above it |

Use it to switch boat behavior instead of raycasting for water yourself.

```lua
--!strict
-- Driver's client. Only push the boat while its hull is in the water.
local RunService = game:GetService("RunService")

local boat = workspace:WaitForChild("Boat") :: Model
local hull = boat.PrimaryPart :: BasePart
local seat = boat:WaitForChild("DriverSeat") :: VehicleSeat
local thrust = hull:WaitForChild("Thrust") :: VectorForce   -- RelativeTo = Attachment0, pushes along -Z

local sensor = Instance.new("BuoyancySensor")
sensor.Parent = hull

local MAX_THRUST = hull.AssemblyMass * 60

RunService.PreSimulation:Connect(function()
	local inWater = sensor.TouchingSurface and not sensor.FullySubmerged
	local power = if inWater then seat.ThrottleFloat * MAX_THRUST else 0
	thrust.Force = Vector3.new(0, 0, -power)
end)
```

If `FullySubmerged` stays true the boat is sinking: lower hull density, or add air-filled (low density) parts.

## Community ocean resources
| Resource | What it is | License | Status |
|---|---|---|---|
| **Gerstner Wave Module** by wyverndayo (DevForum, 2024-06-08) | `GerstnerWave` module + `WaveClient` that deforms an **EditableMesh** ocean (can also drive boned meshes). Place file attached to the thread | None stated: **link only** | Replies (late 2024 to 2025) report errors after EditableMesh changes (vertex colors deprecated; use face colors) and a boat falling through still waves. No author update seen |
| **Realistic Ocean Sailing Project** by vnmeee (DevForum, 2026-08-05) | FFT ocean with LOD, buoyancy and ship physics; uncopylocked place plus an "Update 7" `.rbxl` | Called open source, no license named: **link only** | Author has stopped development and offers no tutorials or fixes |

Because neither names a license, study them and write your own code; do not ship their files in a kit.

## Floating on your own waves
The common pattern (a "boat drivable on Gerstner waves" thread shows a working version):
1. Make your wave function callable from Luau: `height(x, z, t)`. A Gerstner sum is just a few sines.
2. Sample it at **bow, stern, port and starboard**.
3. Set the hull's height from the average and its pitch / roll from the differences (or apply an up-force at each sample point for a physical feel).
4. Use the **same time value on every client** (for example `workspace:GetServerTimeNow()`), or each player sees different waves under the same boat.

Scripted buoyancy force per sample point, the standard Archimedes starting point: push up by `depthBelowSurface x area x waterDensity x gravity`, plus a damping force against vertical velocity so the boat does not bounce forever.

## Boat gameplay notes
- Players standing on a moving deck: see [[Riding Moving Vehicles - Keeping Standing Players Onboard]].
- Boats share the car exploits (teleporting the boat while owning it): [[Vehicle Anti-Exploit - Server Sanity Checks for Client-Owned Cars]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[BuoyancySensor]] · [[Hover, Boat and Flying Vehicles with Mover Constraints]] · [[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]] · [[Physics Budget for Vehicle Games - Assemblies, Sleep, Timestepping and Collisions]]

<!-- TDOD_GRAPH_END -->
