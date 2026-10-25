---
area: "08 Vehicles"
cluster: "Vehicles"
tags: [deep-dive, roblox, vehicles, arcade, drifting, physics]
cssclasses: [tg-a08]
---

# Arcade Handling and Drifting Without Fighting Physics

> **Why this matters:** Constraint cars behave like real cars: they understeer, flip on curbs and need careful grip tuning. Kart racers, cop chases and stunt games want cars that feel *fun*: instant turn-in, controllable drifts, boost.
> A raycast-suspension car with explicit grip and yaw forces gives you that control, using only `Raycast`, `VectorForce` and `Torque`.

---

## 1. Two vehicle philosophies

| | Constraint car | Raycast arcade car |
|---|---|---|
| Wheels | Physical cylinders on hinges | Visual only; 4 raycasts are the "wheels" |
| Grip | Emerges from friction | You write it (one number per axis) |
| Drift | Hard to control | A parameter you turn down |
| Rollover | Realistic (often too easy) | You decide (upright torque) |
| Curbs and bumps | Realistic | Smooth (spring-damper per ray) |
| CPU | 4 hinge + 4 cylindrical + 4 springs per car | 4 raycasts + 6 force instances per car |
| Best for | Sims, off-road, physics sandboxes | Karts, racers, chase games, mobile |

For the constraint approach see [[Constraint Car Build - CylindricalConstraint, SpringConstraint and VehicleSeat]].

## 2. The forces, one per job

Each physics step (on the owning client), for a single box chassis:

1. **Suspension (per corner).** Raycast down from each corner. If it hits within rest length, apply an upward spring-damper force at that corner: `F = k·compression - c·(vertical velocity at that corner)`. Four `VectorForce`s, one per corner attachment.
2. **Drive.** A forward force at the centre of mass, from throttle, only when at least one wheel is grounded.
3. **Lateral grip.** A sideways force opposing sideways velocity. High grip = on rails; low grip = drift.
4. **Yaw control.** A torque that steers the car's rotation rate toward `steer × turnRate`. This is what makes arcade cars turn instantly.
5. **Air control and self-righting.** When airborne, small pitch/roll correction torques keep the car landing on its wheels.

Drag and rolling resistance are folded into the drive force.

## 3. Building the instances

```lua
--!strict
-- ReplicatedStorage/Shared/ArcadeCarRig.lua
-- Adds the force instances to a single-part chassis. Run on the server once when the car spawns.
local ArcadeCarRig = {}

function ArcadeCarRig.setup(chassis: BasePart, halfWidth: number, halfLength: number, rideHeight: number)
	local corners = {
		FL = Vector3.new(-halfWidth, 0, -halfLength),
		FR = Vector3.new( halfWidth, 0, -halfLength),
		RL = Vector3.new(-halfWidth, 0,  halfLength),
		RR = Vector3.new( halfWidth, 0,  halfLength),
	}
	for name, offset in corners do
		local a = Instance.new("Attachment")
		a.Name = name .. "_Susp"
		a.Position = offset
		a.Parent = chassis
		local f = Instance.new("VectorForce")
		f.Name = name .. "_Force"
		f.Attachment0 = a
		f.RelativeTo = Enum.ActuatorRelativeTo.World
		f.ApplyAtCenterOfMass = false   -- apply at the corner so the body pitches and rolls
		f.Force = Vector3.zero
		f.Parent = chassis
	end

	local centre = Instance.new("Attachment")
	centre.Name = "Centre"
	centre.Parent = chassis

	local drive = Instance.new("VectorForce")
	drive.Name = "DriveForce"
	drive.Attachment0 = centre
	drive.RelativeTo = Enum.ActuatorRelativeTo.World
	drive.ApplyAtCenterOfMass = true
	drive.Force = Vector3.zero
	drive.Parent = chassis

	local torque = Instance.new("Torque")
	torque.Name = "YawTorque"
	torque.Attachment0 = centre
	torque.RelativeTo = Enum.ActuatorRelativeTo.World
	torque.Torque = Vector3.zero
	torque.Parent = chassis

	chassis:SetAttribute("RideHeight", rideHeight)
end

return ArcadeCarRig
```

The chassis should be a single box part (body mesh welded to it, massless, non-colliding) with low friction so it slides instead of grinding when it touches walls.

## 4. The controller (runs on the driver's client)

```lua
--!strict
-- ReplicatedStorage/Shared/ArcadeCar.lua
local Workspace = game:GetService("Workspace")

local ArcadeCar = {}
ArcadeCar.__index = ArcadeCar

export type Tuning = {
	springK: number,        -- per corner, multiplied by mass*g/4 (1.0 = settle at ~ restLength/2)
	damping: number,        -- per corner, fraction of critical
	restLength: number,     -- ray length that counts as "wheel touching"
	maxSpeed: number,       -- studs/s
	accel: number,          -- studs/s^2 at full throttle
	brakeDecel: number,
	reverseSpeed: number,
	turnRate: number,       -- rad/s at full steer
	yawResponse: number,    -- 1/s, how fast yaw rate reaches target
	grip: number,           -- 1/s lateral velocity damping (on rails ~ 12)
	driftGrip: number,      -- 1/s while drifting (~ 2)
	driftTurnBoost: number, -- multiplier on turnRate while drifting
}

function ArcadeCar.new(chassis: BasePart, tuning: Tuning)
	local self = setmetatable({}, ArcadeCar)
	self.chassis = chassis
	self.t = tuning
	self.corners = {}
	for _, name in { "FL", "FR", "RL", "RR" } do
		table.insert(self.corners, {
			att = chassis:FindFirstChild(name .. "_Susp") :: Attachment,
			force = chassis:FindFirstChild(name .. "_Force") :: VectorForce,
		})
	end
	self.drive = chassis:FindFirstChild("DriveForce") :: VectorForce
	self.yaw = chassis:FindFirstChild("YawTorque") :: Torque
	self.params = RaycastParams.new()
	self.params.FilterType = Enum.RaycastFilterType.Exclude
	self.params.FilterDescendantsInstances = { chassis:FindFirstAncestorOfClass("Model") or chassis }
	self.drifting = false
	self.driftCharge = 0
	return self
end

-- throttle, steer: -1..1. handbrake: boolean. dt: physics step or frame time.
function ArcadeCar:Step(throttle: number, steer: number, handbrake: boolean, dt: number)
	local t = self.t
	local body = self.chassis
	local mass = body.AssemblyMass
	local g = Workspace.Gravity
	local cf = body.CFrame
	local up = cf.UpVector
	local vel = body.AssemblyLinearVelocity
	local angVel = body.AssemblyAngularVelocity

	-- 1. suspension
	local grounded = 0
	local k = t.springK * mass * g / 4 / (t.restLength * 0.5)
	local c = t.damping * 2 * math.sqrt(k * mass / 4)
	for _, corner in self.corners do
		local origin = corner.att.WorldPosition
		local hit = Workspace:Raycast(origin, -up * t.restLength, self.params)
		if hit then
			grounded += 1
			local compression = t.restLength - hit.Distance
			-- velocity of this corner point along the up axis
			local r = origin - body.AssemblyCenterOfMass
			local pointVel = vel + angVel:Cross(r)
			local vUp = pointVel:Dot(up)
			local fMag = math.max(0, k * compression - c * vUp)
			corner.force.Force = hit.Normal * fMag
		else
			corner.force.Force = Vector3.zero
		end
	end
	local onGround = grounded >= 2

	-- 2. drive (forward axis is -Z / LookVector)
	local fwd = cf.LookVector
	local right = cf.RightVector
	local fwdSpeed = vel:Dot(fwd)
	local driveAccel = 0
	if onGround then
		if throttle > 0 then
			driveAccel = if fwdSpeed < t.maxSpeed then t.accel * throttle else 0
		elseif throttle < 0 then
			if fwdSpeed > 1 then
				driveAccel = -t.brakeDecel
			elseif fwdSpeed > -t.reverseSpeed then
				driveAccel = t.accel * 0.6 * throttle
			end
		else
			driveAccel = -fwdSpeed * 0.6 -- rolling resistance
		end
	end
	-- 3. lateral grip
	self.drifting = onGround and handbrake and math.abs(fwdSpeed) > 20
	local grip = if self.drifting then t.driftGrip else t.grip
	local latSpeed = vel:Dot(right)
	local latAccel = if onGround then -latSpeed * grip else 0
	self.drive.Force = (fwd * driveAccel + right * latAccel) * mass

	-- 4. yaw control (only meaningful on the ground)
	local yawRate = angVel:Dot(up)
	local direction = if fwdSpeed >= 0 then 1 else -1           -- steering flips in reverse
	local speedFactor = math.clamp(math.abs(fwdSpeed) / 15, 0, 1) -- no spinning in place
	local turn = t.turnRate * (if self.drifting then t.driftTurnBoost else 1)
	local targetYaw = -steer * turn * speedFactor * direction   -- positive yaw about +Y turns left
	local yawError = if onGround then targetYaw - yawRate else 0
	-- angular "acceleration" toward target; scale by an approximate yaw inertia
	local size = body.Size
	local inertia = mass * (size.X * size.X + size.Z * size.Z) / 12
	local torque = up * (yawError * t.yawResponse * inertia)

	-- 5. air control: gently level the car when airborne
	if not onGround then
		local levelAxis = up:Cross(Vector3.yAxis) -- axis to rotate up toward world up
		torque += levelAxis * (inertia * 6) - angVel * inertia * 1.5 * Vector3.new(1, 0, 1)
	end
	self.yaw.Torque = torque

	-- drift charge for mini-turbo boosts
	if self.drifting then
		self.driftCharge += dt * math.abs(steer)
	end
end

-- Call when the handbrake is released; returns boost tier 0..3 and resets charge.
function ArcadeCar:ReleaseDrift(): number
	local tier = if self.driftCharge > 2.4 then 3 elseif self.driftCharge > 1.4 then 2 elseif self.driftCharge > 0.6 then 1 else 0
	self.driftCharge = 0
	return tier
end

return ArcadeCar
```

Wire it up on the client in `RunService.PreSimulation`, reading `VehicleSeat.ThrottleFloat`/`SteerFloat` for throttle and steering and a bound action (Space / ButtonB / a touch button) for the handbrake. Network ownership must belong to the driver, exactly as in the constraint car note.

Starting tuning for a kart-sized chassis (6 × 2 × 10 studs):

```lua
local tuning = {
	springK = 1.0, damping = 0.6, restLength = 3.0,
	maxSpeed = 95, accel = 60, brakeDecel = 110, reverseSpeed = 30,
	turnRate = 2.4, yawResponse = 8,
	grip = 12, driftGrip = 2.2, driftTurnBoost = 1.35,
}
```

## 5. Why it feels arcade

- **Yaw is commanded, not emergent.** The torque drives yaw *rate* toward a target; the car turns the moment you steer, at any speed above the `speedFactor` ramp.
- **Grip is one number.** Lateral velocity decays exponentially at rate `grip`. At 12/s, sideways velocity halves in about 0.06 s: rails. At 2/s it halves in about 0.35 s: a long, controllable slide.
- **Drift is a state.** Handbrake + speed + ground = drift. Lower grip plus higher turn rate gives the classic kart drift. Releasing grants a boost tier from the accumulated charge.
- **Suspension is per-corner force at the corner,** so the body still pitches under braking and rolls in corners, which sells the motion.

The exponential-decay view of grip and the spring/damper maths are covered more generally in [[Springs and Damping for Game Feel]].

## 6. Boost from drift (and boost pads)

```lua
local function applyBoost(chassis: BasePart, tier: number)
	if tier <= 0 then return end
	local impulse = ({ 18, 28, 40 })[tier]                   -- studs/s gained
	local fwd = chassis.CFrame.LookVector
	chassis:ApplyImpulse(fwd * impulse * chassis.AssemblyMass)
end
```

`ApplyImpulse` on the owning client changes velocity instantly. The server should apply a speed cap check that allows `maxSpeed + biggest boost` for a short window; pads and checkpoints are covered in [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]].

## 7. Visual wheels

Place wheel meshes at `rayOrigin - up * (hit.Distance - wheelRadius)` each frame on **every** client (not just the driver), using the replicated chassis CFrame, and spin them by `fwdSpeed / wheelRadius`. Steer the front wheel meshes by `steer × 25°`. The Kenney Car Kit has `wheel-default`, `wheel-racing` and kart bodies (`kart-oobi` and friends) ready for this: [[Kenney - Car Kit]].

Tyre smoke and skid marks belong to the drift state: emit from rear wheel positions only while `drifting` is true. Recipes in [[Vehicle Dust, Mud and Tire Trail VFX]].

## 8. Stability notes

- **Step rate.** Forces are updated per frame but physics may step several times per frame. That is fine for these smooth forces. If you need exact per-step updates, use `RunService:BindToSimulation` or `PreSimulation`; check current docs for which fits your controller.
- **Spring too stiff for the step rate** makes the car vibrate. Keep `springK` near 1 and raise `damping` before raising stiffness.
- **Car flips on walls:** add a small upright torque even on the ground, or lower the centre of mass (heavier bottom welded part).
- **Low-FPS clients:** grip and yaw are rate-based, so behaviour is consistent, but extreme frame times can overshoot. Clamp `dt` used by any integrations (only the drift charge here).

## Common mistakes

- Applying all suspension force at the centre of mass (no pitch/roll, looks fake).
- Lateral grip computed from world X/Z instead of the car's right vector.
- Steering that does not flip in reverse.
- Turning in place at zero speed (no `speedFactor`).
- Running the controller on the server.
- Using `AngularVelocity` constraint for yaw and accidentally locking pitch and roll.
- Forgetting the air control, so jumps land on the roof.

## Checklist

- [ ] Single box chassis, visual body massless and non-colliding.
- [ ] Four corner VectorForces at corner attachments + drive VectorForce + yaw Torque.
- [ ] Spring-damper per corner from raycast compression.
- [ ] Drive, brake, reverse and rolling resistance only when grounded.
- [ ] Lateral grip and drift grip as tunables.
- [ ] Yaw rate controller with speed ramp and reverse flip.
- [ ] Air levelling torque.
- [ ] Drift charge to boost tiers; server speed cap allows boosts briefly.
- [ ] Visual wheels and drift VFX on all clients.

---

**Related:** [[Vehicles - Hub]] · [[Vehicle Suspension, Chassis and Grip]] · [[Vehicle Physics and Impact Lab]] · [[Racing Starter Architecture]] · [[Springs and Damping for Game Feel]] · [[Vehicle Dust, Mud and Tire Trail VFX]]
