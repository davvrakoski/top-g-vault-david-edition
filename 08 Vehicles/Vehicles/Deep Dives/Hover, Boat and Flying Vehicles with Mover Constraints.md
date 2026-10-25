---
area: "08 Vehicles"
cluster: "Vehicles"
tags: [deep-dive, roblox, vehicles, boats, aircraft, hover, mover-constraints]
cssclasses: [tg-a08]
---

# Hover, Boat and Flying Vehicles with Mover Constraints

> **Why this matters:** Wheeled-car tutorials are everywhere; hoverbikes, speedboats, planes and helicopters are where most Roblox vehicle projects get stuck, because there are no wheels to lean on.
> All four can be built from the same small set of mover constraints (`VectorForce`, `LinearVelocity`, `AlignOrientation`, `Torque`) plus a few raycasts.

---

## 1. Mover constraints cheat sheet (current API)

| Constraint | What it does | Key properties |
|---|---|---|
| `VectorForce` | Constant force at an attachment or the centre of mass | `Force`, `RelativeTo` (`World`, `Attachment0`, `Attachment1`), `ApplyAtCenterOfMass` |
| `Torque` | Constant torque | `Torque`, `RelativeTo` |
| `LinearVelocity` | Drives velocity toward a target, limited by force | `VelocityConstraintMode` (`Vector`, `Line`, `Plane`), `VectorVelocity` / `LineVelocity` / `PlaneVelocity`, `MaxForce`, `ForceLimitMode` (`Magnitude`, `PerAxis`), `RelativeTo` |
| `AngularVelocity` | Drives angular velocity toward a target | `AngularVelocity`, `MaxTorque`, `RelativeTo` |
| `AlignOrientation` | Rotates toward a target orientation | `Mode` (`OneAttachment` uses the `CFrame` property as the goal), `MaxTorque`, `MaxAngularVelocity`, `Responsiveness` (5 to 200), `RigidityEnabled`, `AlignType` |
| `AlignPosition` | Moves toward a target position | `Mode`, `Position`, `MaxForce`, `MaxVelocity`, `Responsiveness` |

Rules of thumb:

- **Forces** (`VectorForce`, `Torque`) are for things that should feel physical: thrust, lift, buoyancy.
- **Velocity drivers** (`LinearVelocity`, `AngularVelocity`) are for "I want to move at this speed" arcade control.
- **Align** constraints are for attitude: keep upright, bank into turns, face the camera.
- Always set a finite `MaxForce`/`MaxTorque`. Infinite values make vehicles push through walls and fling players.

Ownership: as with cars, the **driver's client owns the assembly** and runs the controller. See [[Vehicle jitters - wrong player controls physics]].

## 2. Hoverbike

A hoverbike is the arcade car with longer rays and no "grounded" requirement for steering, plus an `AlignOrientation` that tilts the bike to the ground normal and leans into turns.

```lua
--!strict
-- Client controller step for a hoverbike. Instances (created once on the server):
--   chassis: BasePart; 4 corner Attachments "FL_Susp".. with VectorForces "FL_Force"..,
--   "Centre" Attachment; VectorForce "Thrust" (World); AlignOrientation "Attitude" (OneAttachment, Attachment0 = Centre)
local Workspace = game:GetService("Workspace")

local HOVER_HEIGHT = 4
local RAY_LENGTH = 9
local SPRING = 3.0         -- multiple of weight per stud of error, shared across 4 corners
local DAMP = 0.9
local MAX_SPEED = 120
local ACCEL = 70
local TURN_RATE = 2.2      -- rad/s
local LEAN = math.rad(28)
local GRIP = 4             -- lateral slide damping; lower = driftier

local heading = 0          -- yaw angle we control directly

local function step(chassis: BasePart, throttle: number, steer: number, dt: number, params: RaycastParams)
	local mass = chassis.AssemblyMass
	local g = Workspace.Gravity
	local vel = chassis.AssemblyLinearVelocity
	local up = chassis.CFrame.UpVector
	local normalSum = Vector3.zero
	local hits = 0

	for _, name in { "FL", "FR", "RL", "RR" } do
		local att = chassis:FindFirstChild(name .. "_Susp") :: Attachment
		local force = chassis:FindFirstChild(name .. "_Force") :: VectorForce
		local hit = Workspace:Raycast(att.WorldPosition, Vector3.new(0, -RAY_LENGTH, 0), params)
		if hit then
			hits += 1
			normalSum += hit.Normal
			local err = HOVER_HEIGHT - hit.Distance
			local f = (mass * g / 4) * (1 + SPRING * err) - DAMP * mass * vel.Y / 4
			force.Force = Vector3.new(0, math.max(f, 0), 0)
		else
			force.Force = Vector3.zero
		end
	end

	-- heading is integrated from steering; bike always turns, even slowly
	heading -= steer * TURN_RATE * dt
	local flatFwd = CFrame.Angles(0, heading, 0).LookVector
	local right = CFrame.Angles(0, heading, 0).RightVector

	local fwdSpeed = vel:Dot(flatFwd)
	local latSpeed = vel:Dot(right)
	local accel = if fwdSpeed < MAX_SPEED then ACCEL * throttle else 0
	local thrust = (flatFwd * accel - right * latSpeed * GRIP - flatFwd * fwdSpeed * 0.15) * mass
	if hits == 0 then thrust *= 0.3 end -- weak control in the air
	;(chassis:FindFirstChild("Thrust") :: VectorForce).Force = thrust

	-- attitude: align up with ground normal, lean into turns
	local groundUp = if hits > 0 then (normalSum / hits).Unit else Vector3.yAxis
	local base = CFrame.lookAt(Vector3.zero, flatFwd, groundUp)
	local goal = base * CFrame.Angles(0, 0, -steer * LEAN * math.clamp(fwdSpeed / 40, 0, 1))
	;(chassis:FindFirstChild("Attitude") :: AlignOrientation).CFrame = goal
end
```

Notes:

- The suspension term `mass*g/4 * (1 + SPRING*err)` holds exactly the weight at the target height (`err = 0`) and adds or removes force proportionally. Damping uses vertical velocity.
- `AlignOrientation` in `OneAttachment` mode aligns `Attachment0` to the `CFrame` property. Give it `Responsiveness` around 20 to 40 and a `MaxTorque` scaled to mass; `RigidityEnabled = true` would snap and fight collisions.
- Heading is a variable you integrate, which avoids yaw drift from collisions.
- `CFrame.lookAt(at, target, up)` with `up` = ground normal builds a basis that follows slopes.

## 3. Boats

### Option A: let terrain water do the work

Roblox terrain water applies buoyancy to parts based on their density (parts less dense than water float). A boat hull with a low `CustomPhysicalProperties` density floats on terrain water without any script. Add a thrust `VectorForce` at the stern and a yaw `Torque` and you have a boat. This is the fastest path when your water is terrain. Test hull density carefully; too low and the boat skates on top.

### Option B: scripted buoyancy (part-based water, waves, full control)

When the water is a mesh or part plane (stylized oceans, animated waves), compute buoyancy yourself from sample points:

```lua
--!strict
-- Client (owner) buoyancy step. Hull has Attachments named "Float1".."FloatN" spread over its bottom,
-- each with a VectorForce (RelativeTo World, ApplyAtCenterOfMass false).
local Workspace = game:GetService("Workspace")

local WATER_LEVEL = 0          -- or a function of (x, z, time) for waves
local MAX_DEPTH = 1.5          -- depth at which a sample point gives full lift
local LIFT = 1.8               -- total lift at full submersion as a multiple of weight
local WATER_DRAG = 1.2         -- per-point velocity damping in water (1/s)

local function waterHeight(x: number, z: number, t: number): number
	return WATER_LEVEL + 0.6 * math.sin(x * 0.05 + t) + 0.4 * math.sin(z * 0.07 + t * 1.3)
end

local function buoyancyStep(hull: BasePart, floats: { Attachment }, forces: { VectorForce }, t: number)
	local mass = hull.AssemblyMass
	local g = Workspace.Gravity
	local perPointWeight = mass * g / #floats
	local vel = hull.AssemblyLinearVelocity
	local angVel = hull.AssemblyAngularVelocity
	local com = hull.AssemblyCenterOfMass

	for i, att in floats do
		local p = att.WorldPosition
		local depth = waterHeight(p.X, p.Z, t) - p.Y
		if depth > 0 then
			local submerged = math.clamp(depth / MAX_DEPTH, 0, 1)
			local pointVel = vel + angVel:Cross(p - com)
			local lift = Vector3.new(0, perPointWeight * LIFT * submerged, 0)
			local drag = -pointVel * (mass / #floats) * WATER_DRAG * submerged
			forces[i].Force = lift + drag
		else
			forces[i].Force = Vector3.zero
		end
	end
end
```

Clients must agree on the wave function and time: use `workspace:GetServerTimeNow()` as `t` so all clients render the same waves and the owner's physics matches what others see.

Boat handling: thrust at the stern (only when the stern float point is submerged), rudder torque proportional to forward speed (a stationary boat cannot turn), and stronger lateral drag than forward drag so it carves instead of sliding.

## 4. Arcade plane

Planes feel good when the player controls **rates** (pitch, roll, yaw) and the plane's velocity follows its nose.

```lua
--!strict
-- Client step for an arcade plane. Instances: "Centre" Attachment, LinearVelocity "Flight"
-- (VelocityConstraintMode Vector, RelativeTo World, Attachment0 = Centre, finite MaxForce),
-- AlignOrientation "Attitude" (OneAttachment).
local PITCH_RATE = math.rad(70)
local ROLL_RATE = math.rad(140)
local YAW_RATE = math.rad(25)
local MIN_SPEED, MAX_SPEED = 40, 160
local THROTTLE_RATE = 40 -- studs/s per second

local attitude = CFrame.identity  -- orientation we integrate (rotation only)
local speed = 60

local function planeStep(chassis: BasePart, pitchIn: number, rollIn: number, yawIn: number, throttleIn: number, dt: number)
	-- integrate attitude in local space
	attitude = attitude * CFrame.Angles(pitchIn * PITCH_RATE * dt, -yawIn * YAW_RATE * dt, -rollIn * ROLL_RATE * dt)
	-- coordinated turn: banking also yaws
	local bank = attitude.RightVector.Y
	attitude = CFrame.Angles(0, bank * 0.9 * dt, 0) * attitude

	speed = math.clamp(speed + throttleIn * THROTTLE_RATE * dt, MIN_SPEED, MAX_SPEED)
	-- climbing costs speed, diving gains it
	speed = math.clamp(speed - attitude.LookVector.Y * 20 * dt, MIN_SPEED, MAX_SPEED)

	;(chassis:FindFirstChild("Attitude") :: AlignOrientation).CFrame = attitude
	;(chassis:FindFirstChild("Flight") :: LinearVelocity).VectorVelocity = attitude.LookVector * speed
end
```

Set the plane's `attitude` from the chassis's current rotation when the pilot sits down (`attitude = chassis.CFrame.Rotation`) so it does not snap. Below `MIN_SPEED` you can switch `LinearVelocity.MaxForce` down and let gravity win (stall).

For physically simulated flight, `Workspace.FluidForces` plus `BasePart.EnableFluidForces` enables engine-computed aerodynamic forces on parts. It is a different (simulation-heavy) approach; the default setting disables it. Prototype before committing a whole game to it.

## 5. Helicopter

- **Lift:** `VectorForce` along the helicopter's up vector, `mass × g × (1 + collective)` where collective is -0.5..0.5 from input. Hovering is collective 0.
- **Attitude:** `AlignOrientation` toward a target built from yaw (integrated) and pitch/roll from stick input (max ±25°). Tilting the lift vector produces horizontal movement for free.
- **Drag:** a small `-velocity × mass × 0.3` force to stop endless drifting.
- **Ground effect:** optional extra lift when a down raycast is shorter than 6 studs; it makes landings soft.

## 6. Shared concerns

- **Server validation:** speed caps per vehicle type, altitude ceilings, and "inside geometry" checks. Flying vehicles are the most abused vehicles in Roblox; treat client positions with suspicion. See [[Vehicle Physics and Impact Lab]].
- **Seats:** `VehicleSeat` gives you `ThrottleFloat`/`SteerFloat` for free on keyboard, gamepad and touch. For planes you need two more axes; bind them with `ContextActionService` or the Input Action System.
- **Camera:** chase cameras for planes need look-ahead and roll damping. See [[Vehicle Enter - Exit, Seats and Camera]].
- **Water VFX:** wakes and spray from [[Water and Surface Interaction]] and [[Water, Shorelines and Foam — Practical Roblox Approach]].

## Common mistakes

- `MaxForce = math.huge` on `LinearVelocity`, so the plane bulldozes buildings and flings players.
- Server-side controllers (laggy, ownership fights).
- `AlignOrientation` with `RigidityEnabled = true` on vehicles that collide (violent snapping).
- Hover forces at the centre of mass only (no tilt on slopes).
- Different wave functions or clocks on different clients.
- Boats that can rudder-turn at zero speed.
- Plane attitude initialized to identity on seat, snapping the plane level.

## Checklist

- [ ] Driver owns the assembly; controller on the client.
- [ ] All movers have finite max force/torque.
- [ ] Hover: per-corner lift to a target height + attitude align to normal + lean.
- [ ] Boat: terrain buoyancy or scripted float points with drag; rudder scales with speed.
- [ ] Plane: integrated attitude, velocity along nose, speed trade with pitch.
- [ ] Helicopter: lift along up, attitude from stick, drag.
- [ ] Server speed/altitude sanity checks per vehicle type.
- [ ] Waves and shared effects use `GetServerTimeNow()`.

---

**Related:** [[Vehicles - Hub]] · [[Vehicle Framework]] · [[Vehicle Physics and Impact Lab]] · [[Network Ownership and Physics Replication]] · [[Water and Surface Interaction]] · [[Arcade Handling and Drifting Without Fighting Physics]]
