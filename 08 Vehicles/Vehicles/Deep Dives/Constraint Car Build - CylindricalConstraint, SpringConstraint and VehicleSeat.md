---
area: "08 Vehicles"
cluster: "Vehicles"
tags: [deep-dive, roblox, vehicles, physics, constraints, suspension]
cssclasses: [tg-a08]
---

# Constraint Car Build - CylindricalConstraint, SpringConstraint and VehicleSeat

> **Why this matters:** Free-model cars are a tangle of welds and magic numbers that break when you change the body mesh. A car you can build from a script, with suspension maths you understand, is a car you can tune, reskin and debug.
> This note builds a full four-wheel car from primitives with steering, suspension and drive, then shows how to drive it with correct network ownership.

---

## 1. Anatomy

Per wheel, three bodies and three constraints:

```
Chassis (one assembly: chassis + body mesh + VehicleSeat, all welded)
  |
  |-- CylindricalConstraint  (slides along vertical axis = suspension travel,
  |                           rotates about the same axis = steering servo)
  |-- SpringConstraint        (vertical spring + damper between chassis and knuckle)
  v
Knuckle (small invisible part)
  |
  |-- HingeConstraint         (axle; Motor on driven wheels, free on others)
  v
Wheel (cylinder part with friction)
```

The official Cylindrical page describes exactly this use: a `CylindricalConstraint` together with a `SpringConstraint` "is ideal for building vehicle suspensions where the wheel shock can slide up and down while the wheel itself spins". Here the cylindrical's rotation is used for **steering** instead of spin, and a separate hinge does the spinning, which keeps steering and drive independent.

## 2. Units you need

From the Roblox units page:

- **1 stud = 28 cm.** So 1 stud/s = 0.28 m/s ≈ **1.0 km/h** (≈ 0.63 mph). A car doing 120 studs/s is doing about 120 km/h. That makes speed tuning intuitive.
- Default gravity is **196.2 studs/s²**; "realistic" gravity is 35 studs/s². Most games keep the default; cars then feel snappy but light. If you change `Workspace.Gravity`, retune every spring.
- Mass is in RMU (1 RMU ≈ 21.95 kg). You rarely need the conversion; work with `AssemblyMass`.

## 3. The build script

Drop this in a server `Script`. It builds a drivable test car at a position. Every number is a named constant so you can tune it.

```lua
--!strict
-- ServerScriptService/BuildTestCar.server.lua
local Workspace = game:GetService("Workspace")

local ORIGIN = CFrame.new(0, 8, 0)      -- where to build; car faces -Z
local CHASSIS_SIZE = Vector3.new(6, 1.2, 12)
local WHEEL_RADIUS = 1.4
local WHEEL_WIDTH = 1.0
local TRACK_HALF = 3.7                  -- x offset of wheel centres
local AXLE_Z = 4.2                      -- z offset of axles (front = -AXLE_Z)
local WHEEL_DROP = 1.1                  -- wheel centre below chassis centre at build time
local SPRING_TOP = 2.0                  -- spring upper attachment height above knuckle
local TRAVEL_UP, TRAVEL_DOWN = 0.7, 1.0 -- suspension limits (studs)
local SAG = 0.35                        -- static compression we want at rest (studs)
local DAMPING_RATIO = 0.55              -- 0.3 bouncy ... 1.0 critically damped

local function part(props: { [string]: any }): Part
	local p = Instance.new("Part")
	p.TopSurface = Enum.SurfaceType.Smooth
	p.BottomSurface = Enum.SurfaceType.Smooth
	for k, v in props do
		(p :: any)[k] = v
	end
	return p
end

-- Attachment whose primary axis (X) points world-up when the parent is unrotated.
local function upAttachment(parent: BasePart, worldPos: Vector3, name: string): Attachment
	local a = Instance.new("Attachment")
	a.Name = name
	local localPos = parent.CFrame:PointToObjectSpace(worldPos)
	a.CFrame = CFrame.fromMatrix(localPos, Vector3.new(0, 1, 0), Vector3.new(-1, 0, 0))
	a.Parent = parent
	return a
end

local model = Instance.new("Model")
model.Name = "ConstraintCar"

local chassis = part({
	Name = "Chassis", Size = CHASSIS_SIZE, CFrame = ORIGIN, Color = Color3.fromRGB(200, 60, 50),
	CustomPhysicalProperties = PhysicalProperties.new(1.2, 0.3, 0.2),
})
chassis.Parent = model

-- low ballast pulls the centre of mass down (anti-rollover)
local ballast = part({
	Name = "Ballast", Size = Vector3.new(4, 0.4, 8), CFrame = ORIGIN * CFrame.new(0, -0.5, 0),
	Transparency = 1, CanCollide = false, CanQuery = false, CanTouch = false,
	CustomPhysicalProperties = PhysicalProperties.new(6, 0.3, 0.2),
})
ballast.Parent = model
local bw = Instance.new("WeldConstraint")
bw.Part0, bw.Part1 = chassis, ballast
bw.Parent = ballast

local seat = Instance.new("VehicleSeat")
seat.Name = "DriverSeat"
seat.Size = Vector3.new(2, 1, 2)
seat.CFrame = ORIGIN * CFrame.new(-1.2, 1.1, 0.5)
seat.HeadsUpDisplay = false
seat.Parent = model
local sw = Instance.new("WeldConstraint")
sw.Part0, sw.Part1 = chassis, seat
sw.Parent = seat

type Corner = { name: string, x: number, z: number, steer: boolean, drive: boolean }
local corners: { Corner } = {
	{ name = "FL", x = -TRACK_HALF, z = -AXLE_Z, steer = true,  drive = false },
	{ name = "FR", x =  TRACK_HALF, z = -AXLE_Z, steer = true,  drive = false },
	{ name = "RL", x = -TRACK_HALF, z =  AXLE_Z, steer = false, drive = true },
	{ name = "RR", x =  TRACK_HALF, z =  AXLE_Z, steer = false, drive = true },
}

local springs: { SpringConstraint } = {}

for _, c in corners do
	local centreCF = ORIGIN * CFrame.new(c.x, -WHEEL_DROP, c.z) -- same rotation as the chassis
	local centre = centreCF.Position

	local knuckle = part({
		Name = c.name .. "_Knuckle", Size = Vector3.new(0.6, 0.6, 0.6), CFrame = centreCF,
		Transparency = 1, CanCollide = false, CanQuery = false, CanTouch = false,
		CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5),
	})
	knuckle.Parent = model

	local wheel = part({
		Name = c.name .. "_Wheel", Shape = Enum.PartType.Cylinder,
		Size = Vector3.new(WHEEL_WIDTH, WHEEL_RADIUS * 2, WHEEL_RADIUS * 2),
		CFrame = centreCF, -- Cylinder axis is the part's X axis = car's right
		Color = Color3.fromRGB(30, 30, 30),
		-- density, friction, elasticity, frictionWeight, elasticityWeight
		CustomPhysicalProperties = PhysicalProperties.new(0.9, 1.6, 0.05, 100, 1),
	})
	wheel.Parent = model

	-- suspension + steering
	local aChassis = upAttachment(chassis, centre, c.name .. "_SuspA")
	local aKnuckle = upAttachment(knuckle, centre, c.name .. "_SuspB")
	local cyl = Instance.new("CylindricalConstraint")
	cyl.Name = c.name .. "_Suspension"
	cyl.Attachment0, cyl.Attachment1 = aChassis, aKnuckle
	cyl.LimitsEnabled = true
	cyl.LowerLimit, cyl.UpperLimit = -TRAVEL_DOWN, TRAVEL_UP
	cyl.AngularActuatorType = Enum.ActuatorType.Servo
	cyl.ServoMaxTorque = 1e6
	cyl.AngularSpeed = 4          -- rad/s: how fast the wheel steers
	cyl.AngularResponsiveness = 45
	cyl.TargetAngle = 0
	cyl.Parent = chassis

	local aTop = upAttachment(chassis, (centreCF * CFrame.new(0, SPRING_TOP, 0)).Position, c.name .. "_SpringTop")
	local spring = Instance.new("SpringConstraint")
	spring.Name = c.name .. "_Spring"
	spring.Attachment0, spring.Attachment1 = aTop, aKnuckle
	spring.Visible = false
	spring.Parent = chassis
	table.insert(springs, spring)

	-- axle
	local hA = Instance.new("Attachment"); hA.Name = c.name .. "_AxleA"; hA.Parent = knuckle
	local hB = Instance.new("Attachment"); hB.Name = c.name .. "_AxleB"; hB.Parent = wheel
	local hinge = Instance.new("HingeConstraint")
	hinge.Name = c.name .. "_Axle"
	hinge.Attachment0, hinge.Attachment1 = hA, hB
	if c.drive then
		hinge.ActuatorType = Enum.ActuatorType.Motor
		hinge.MotorMaxTorque = 0       -- set by the drive controller
		hinge.AngularVelocity = 0
	end
	hinge.Parent = knuckle

	local nc = Instance.new("NoCollisionConstraint")
	nc.Part0, nc.Part1 = chassis, wheel
	nc.Parent = wheel

	knuckle:SetAttribute("Steer", c.steer)
	hinge:SetAttribute("Drive", c.drive)
end

model.PrimaryPart = chassis
model.Parent = Workspace

-- Spring tuning from mass: done after parenting so AssemblyMass is valid.
task.defer(function()
	local totalMass = chassis.AssemblyMass
	for _, p in model:GetDescendants() do
		if p:IsA("BasePart") and (p.Name:match("_Wheel$") or p.Name:match("_Knuckle$")) then
			totalMass += p.Mass
		end
	end
	local cornerMass = totalMass / 4
	local g = Workspace.Gravity
	local k = cornerMass * g / SAG                         -- stiffness so the car sags SAG studs
	local cDamp = DAMPING_RATIO * 2 * math.sqrt(k * cornerMass)
	for _, s in springs do
		s.Stiffness = k
		s.Damping = cDamp
		s.FreeLength = SPRING_TOP + SAG                    -- rests at build height under load
	end
	print(string.format("Car mass %.1f, k=%.0f, c=%.0f", totalMass, k, cDamp))
end)
```

### Why these numbers

- **Stiffness from sag.** At rest each spring carries a quarter of the weight: `F = m_corner × g`. A spring compressed by `sag` pushes back `k × sag`. Setting `k = m_corner × g / sag` makes the car settle exactly `sag` studs. Bigger sag = softer, floatier car.
- **FreeLength = build length + sag**, so after settling, the car sits at its build height and the wheels have travel both ways.
- **Damping from damping ratio.** Critical damping for a mass-spring is `2√(k·m)`. Multiply by 0.4 to 0.7 for a road car (a little bounce), 0.8 to 1.0 for a stiff race car. Too low = boat; too high = the car skips over bumps because the wheels cannot follow the ground.
- **Wheel friction 1.6 with `frictionWeight` 100** makes the wheel's friction dominate the contact (Roblox combines the two surfaces' friction using the weights), so the tyre grip does not depend on what road material the map uses.
- **Ballast** with high density and `CanCollide = false`, welded low, drags the centre of mass down. Check `chassis.AssemblyCenterOfMass` in the command bar; it should sit below the chassis centre.

## 4. Driving it (client-owned physics)

Rule from the network ownership docs: the machine that owns the assembly simulates it. A car feels responsive only if the **driver's client owns it** and applies inputs locally.

Server: give ownership to the driver.

```lua
-- Script inside the car model (server)
local seat = script.Parent:WaitForChild("DriverSeat") :: VehicleSeat
local Players = game:GetService("Players")

seat:GetPropertyChangedSignal("Occupant"):Connect(function()
	local humanoid = seat.Occupant
	if humanoid then
		local player = Players:GetPlayerFromCharacter(humanoid.Parent)
		if player then
			seat:SetNetworkOwner(player)
			seat.Parent:SetAttribute("DriverUserId", player.UserId)
		end
	else
		seat:SetNetworkOwnershipAuto()
		seat.Parent:SetAttribute("DriverUserId", nil)
	end
end)
```

This mirrors the official example: without it, a passenger who sat down first can own the whole car and the driver's input lags several network cycles.

Client: read `VehicleSeat.ThrottleFloat` and `SteerFloat` (set by the default vehicle controls from keyboard, gamepad or touch) and drive the constraints.

```lua
--!strict
-- StarterPlayerScripts/CarDriver.client.lua
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local MAX_SPEED = 110            -- studs/s ≈ 110 km/h
local REVERSE_SPEED = 30
-- Rough grip budget for the test car (~205 RMU): each rear wheel carries ~1/4 of the weight,
-- ~51 * 196.2 ≈ 10,000 force units, × friction 1.6 ≈ 16,000 before slipping.
-- Max torque before wheelspin ≈ 16,000 × wheel radius 1.4 ≈ 22,000. Start just below that.
local DRIVE_TORQUE = 2e4
local BRAKE_TORQUE = 4e4         -- above the grip limit locks the wheels (skids); lower for ABS-like feel
local COAST_TORQUE = 800         -- small: rolling resistance
local MAX_STEER = 32             -- degrees at low speed
local MIN_STEER = 10             -- degrees at top speed
local WHEEL_RADIUS = 1.4
local DRIVE_SIGN = -1            -- flip to 1 if the car drives backward

local player = Players.LocalPlayer
local conn: RBXScriptConnection? = nil

local function bind(seat: VehicleSeat)
	local car = seat.Parent :: Model
	local chassis = car:WaitForChild("Chassis") :: BasePart
	local steerers, drivers = {}, {}
	for _, d in car:GetDescendants() do
		if d:IsA("CylindricalConstraint") and d.Attachment1 and d.Attachment1.Parent:GetAttribute("Steer") then
			table.insert(steerers, d)
		elseif d:IsA("HingeConstraint") and d:GetAttribute("Drive") then
			table.insert(drivers, d)
		end
	end

	conn = RunService.PreSimulation:Connect(function()
		local throttle = seat.ThrottleFloat   -- -1..1
		local steer = seat.SteerFloat         -- -1..1
		local forwardSpeed = chassis.CFrame.LookVector:Dot(chassis.AssemblyLinearVelocity) -- + forward, - backward
		local speedAbs = math.abs(forwardSpeed)

		-- speed-sensitive steering
		local steerLimit = MAX_STEER + (MIN_STEER - MAX_STEER) * math.clamp(speedAbs / MAX_SPEED, 0, 1)
		for _, cyl in steerers do
			cyl.TargetAngle = -steer * steerLimit   -- sign: test once, flip if inverted
		end

		local targetSpeed, torque
		if throttle > 0 then
			if forwardSpeed < -2 then       -- moving backward, pressing forward: brake
				targetSpeed, torque = 0, BRAKE_TORQUE
			else
				targetSpeed, torque = MAX_SPEED * throttle, DRIVE_TORQUE
			end
		elseif throttle < 0 then
			if forwardSpeed > 2 then        -- moving forward, pressing back: brake
				targetSpeed, torque = 0, BRAKE_TORQUE
			else
				targetSpeed, torque = -REVERSE_SPEED, DRIVE_TORQUE
			end
		else
			targetSpeed, torque = 0, COAST_TORQUE
		end

		local angular = DRIVE_SIGN * targetSpeed / WHEEL_RADIUS  -- rad/s
		for _, h in drivers do
			h.AngularVelocity = angular
			h.MotorMaxTorque = torque
		end
	end)
end

local function unbind()
	if conn then conn:Disconnect(); conn = nil end
end

local function onCharacter(character: Model)
	local humanoid = character:WaitForChild("Humanoid") :: Humanoid
	humanoid.Seated:Connect(function(active, seatPart)
		unbind()
		if active and seatPart and seatPart:IsA("VehicleSeat") then
			bind(seatPart)
		end
	end)
end

player.CharacterAdded:Connect(onCharacter)
if player.Character then onCharacter(player.Character) end
```

`forwardSpeed` is the chassis velocity projected on its forward (`LookVector`, -Z) direction. If your body mesh was built facing +Z, rotate the build `ORIGIN` instead of flipping signs everywhere.

Constraint property changes made on the owning client affect that client's simulation, and the resulting motion replicates. When the driver leaves and ownership returns to the server, the server's (default) values apply again, so the motors stop.

**`VehicleSeat.MaxSpeed`, `Torque` and `TurnSpeed`** only drive legacy hinge *surfaces* (see `AreHingesDetected`). With constraints, the seat is just an input device; use `ThrottleFloat`/`SteerFloat`.

## 5. Server sanity checks

Client-owned physics means an exploiter can move their car anywhere. Cheap server checks:

- Every 0.5 s, compare chassis speed to `MAX_SPEED × 1.3`. Repeated violations: reset ownership to the server and teleport back to the last legal position.
- Clamp altitude and flag "flying" cars (no wheel near the ground for > 3 s outside ramps).
- Never award race results, money or damage from client-reported values. See [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]] and [[Vehicle Damage and Impact Blueprint]].

## 6. Tuning order

The order from [[Vehicle Suspension, Chassis and Grip]] applies: mass and centre of mass, then spring (via sag), then damping ratio, then tyre friction, then steering, then power. Practical symptoms:

| Symptom | Likely cause | Fix |
|---|---|---|
| Car bounces after every bump | Damping ratio too low | Raise toward 0.7 |
| Car skips over bumps, loses grip | Damping too high or springs too stiff | Lower damping, increase sag |
| Rolls over in corners | High centre of mass, too much grip | More ballast, lower friction, wider track |
| Wheelspin at launch | `DRIVE_TORQUE` too high for grip | Lower torque or ramp it with throttle |
| Understeer at speed | Steering limit too low or front grip low | Raise `MIN_STEER`, front friction |
| Car jitters at rest | Very stiff springs + light knuckles | Lower stiffness, heavier knuckles |
| Wheels clip the body on bumps | `TRAVEL_UP` too large | Reduce limit or raise body |

## 7. Reskinning with a mesh

Keep the physics car invisible and weld a visual body on top: for example the CC0 `sedan.fbx` or `race.fbx` from [[Kenney - Car Kit]] (wheel meshes such as `wheel-default.fbx` are in the same kit). Weld the body mesh to the chassis with `CanCollide = false`, `Massless = true` so it does not change handling, and weld wheel meshes to the physical wheel cylinders. Physics stays identical across every car skin.

## Common mistakes

- Attachments whose axes do not match, so the cylindrical constraint slides sideways.
- Springs with default stiffness on a heavy car (the car sits on its limits).
- Recomputing springs before the model is in `workspace` (mass reads wrong).
- Server-side drive script, so input feels laggy and ownership fights the driver.
- Expecting `VehicleSeat.MaxSpeed` to do anything with constraint wheels.
- Visual body mesh with collisions and mass, changing the handling.
- Tuning everything at once.

## Checklist

- [ ] Chassis assembly: chassis + ballast + seat + visual body (massless, non-colliding).
- [ ] Per wheel: cylindrical (travel limits + steering servo), spring, hinge.
- [ ] Spring stiffness from sag, damping from ratio, FreeLength = build + sag.
- [ ] Wheel friction weight high so tyres dominate.
- [ ] Driver gets network ownership; drive script is a LocalScript.
- [ ] Speed-sensitive steering; brake vs reverse logic.
- [ ] Server speed/altitude sanity checks.
- [ ] Tuning table recorded on a repeatable test track.

---

**Related:** [[Vehicles - Hub]] · [[Vehicle Suspension, Chassis and Grip]] · [[Vehicle Framework]] · [[Vehicle jitters - wrong player controls physics]] · [[Vehicle Enter - Exit, Seats and Camera]] · [[Network Ownership and Physics Replication]]
