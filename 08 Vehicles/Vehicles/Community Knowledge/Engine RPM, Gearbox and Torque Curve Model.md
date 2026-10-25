---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Engine RPM, Gearbox and Torque Curve Model"
tags: [roblox, community-knowledge, vehicles, engine, gearbox, physics]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://gamedev.net/forums/topic/671817-car-transmission-model/
  - https://gamedev.net/forums/topic/461049-car-physics/4041228/
  - https://lupine-vidya.itch.io/gdsim/devlog/677594/workshop-v-start-your-engines-mirror
  - https://create.roblox.com/docs/reference/engine/classes/HingeConstraint
  - https://create.roblox.com/docs/physics/units
---
# Engine RPM, Gearbox and Torque Curve Model

A car that just sets wheel speed from throttle feels like a toy. Adding a small engine model (RPM, a torque curve and gears) gives you gear shifts, rev-limiter bounce, engine braking and, most importantly, an RPM number to drive sound and the tachometer. It is all plain Luau running on the driver's client; the physics side still only receives a wheel speed and a torque limit.

## The chain
The standard approach used in game car physics (popularised by Marco Monster's "Car Physics for Games" and repeated in many GameDev.net threads) is:

```
wheelTorque = engineTorque(rpm) * gearRatio * finalDrive * efficiency
rpm         = wheelOmega * gearRatio * finalDrive * 60 / (2*pi)
```

`wheelOmega` is the drive wheel's angular speed in rad/s. A GameDev.net transmission example uses gear ratios of 3.82, 2.20, 1.52, 1.22, 1.02, 0.84, a final drive of 3.42 and efficiency 0.7. These are real-car-style numbers; keep them as a starting shape and scale torque to Roblox mass.

## Torque curve as a table
Store torque at fixed RPM steps and interpolate (the lookup-table method the gdsim devlog describes):

```lua
local CURVE = { -- rpm, torque (relative, 0..1)
	{1000, 0.55}, {2500, 0.80}, {4000, 1.00}, {5500, 0.95}, {7000, 0.70},
}
local function torqueAt(rpm: number): number
	if rpm <= CURVE[1][1] then return CURVE[1][2] end
	for i = 2, #CURVE do
		local a, b = CURVE[i - 1], CURVE[i]
		if rpm <= b[1] then
			local t = (rpm - a[1]) / (b[1] - a[1])
			return a[2] + (b[2] - a[2]) * t
		end
	end
	return CURVE[#CURVE][2]
end
```

## A per-frame update (driver client)
```lua
local GEARS = {3.2, 2.1, 1.5, 1.15, 0.9}
local FINAL, IDLE, REDLINE, PEAK = 3.4, 900, 7000, 2.0e5
local gear = 1

RunService.Heartbeat:Connect(function()
	local omega = math.abs(rearHinge.Attachment1.Parent.AssemblyAngularVelocity.Magnitude)
	local ratio = GEARS[gear] * FINAL
	local rpm = math.max(IDLE, omega * ratio * 60 / (2 * math.pi))

	-- automatic shifting with a gap so it never hunts
	if rpm > REDLINE * 0.92 and gear < #GEARS then gear += 1
	elseif rpm < REDLINE * 0.45 and gear > 1 then gear -= 1 end

	local throttle = math.max(seat.ThrottleFloat, 0)
	local limiter = if rpm >= REDLINE then 0 else 1
	local torque = torqueAt(rpm) * PEAK * ratio * throttle * limiter

	rearHinge.MotorMaxTorque = math.max(torque, 2000) -- small value = engine braking
	rearHinge.AngularVelocity = (REDLINE * 2 * math.pi / 60) / ratio * math.sign(seat.ThrottleFloat)
	car:SetAttribute("RPM", rpm)
	car:SetAttribute("Gear", gear)
end)
```

Here the motor's target speed is "what redline would give in this gear" and the torque limit carries the curve, so acceleration fades naturally as the curve drops off.

## Tuning tips
- Measure wheel speed from the **wheel part**, not chassis speed, so wheelspin shows up as high RPM.
- Add a shift delay (0.15-0.3 s with torque cut) for a believable "kick".
- Reverse is just a separate ratio with the motor velocity negated.
- Publish `RPM` and `Gear` as attributes so other clients can play the right engine sound without remotes.

## Related
[[Vehicles - Hub]] · [[Engine and Tyre Audio Driven by RPM and Slip]] · [[HingeConstraint Motors and Servos for Wheels and Steering]] · [[Speedometer and Vehicle HUD - Studs to km-h and mph]]
