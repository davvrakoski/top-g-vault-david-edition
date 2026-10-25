---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Vehicle Lights - Headlights, Brake Lights and Indicators"
tags: [roblox, community-knowledge, vehicles, lighting, spotlight, polish]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/SpotLight
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceLight
  - https://create.roblox.com/docs/effects/light-sources
  - https://create.roblox.com/docs/reference/engine/classes/VehicleSeat
---
# Vehicle Lights - Headlights, Brake Lights and Indicators

Working lights are the cheapest polish a vehicle can get, and at night they are gameplay: players read other cars by their lights. They are also a classic performance trap, because every car with four shadow-casting lights adds up fast on phones. This note covers a light rig that looks good and scales.

## Two layers: glow and light
1. **Glow (cheap):** the lens mesh switches `Material` to `Neon` (or raises a SurfaceAppearance emissive mask) and changes `Color`. This is what players actually look at.
2. **Light (expensive):** a `SpotLight` that lights the road. Only headlights really need this; brake and indicator lights can be glow only, or a tiny `PointLight` with no shadows.

## Headlights
- Use **one** `SpotLight` per car at the front centre, not one per lamp. Two overlapping cones look nearly identical and cost double.
- Useful values to start from: `Angle` 45-60, `Range` 40-60, `Brightness` 2-4, `Face` set to the part's front face.
- `Shadows = true` only for the player's own car; turn it off for every other car.
- Toggle with an attribute so it replicates: `car:SetAttribute("Headlights", true)`. Each client reacts locally.

## Brake and reverse lights from inputs
Brake lights should come on when the driver is **slowing**, not just when throttle is negative (negative throttle while stopped means reverse):

```lua
-- runs on every client for nearby cars
local function updateLights(car: Model)
	local seat = car:FindFirstChild("DriveSeat") :: VehicleSeat?
	local root = car.PrimaryPart
	if not seat or not root then return end
	local forwardSpeed = root.AssemblyLinearVelocity:Dot(root.CFrame.LookVector)
	local t = seat.ThrottleFloat
	local braking = (t < -0.1 and forwardSpeed > 2) or (t > 0.1 and forwardSpeed < -2)
	local reversing = t < -0.1 and forwardSpeed <= 2

	for _, lamp in car.Lights.Brake:GetChildren() do
		lamp.Material = if braking then Enum.Material.Neon else Enum.Material.Glass
	end
	for _, lamp in car.Lights.Reverse:GetChildren() do
		lamp.Transparency = if reversing then 0 else 0.6
	end
end
```
`ThrottleFloat` replicates, so this runs on every client without remotes. Only write properties when the state changes (cache the last state) to avoid property churn.

## Indicators and hazards
- Blink with a shared clock so all clients blink in sync: `local on = (workspace:GetServerTimeNow() % 0.8) < 0.4`.
- Auto-cancel the indicator after the car's heading changes by more than ~60 degrees since it was switched on.
- Hazards: both sides, triggered automatically when the car is out of fuel or badly damaged.

## Scaling to many cars
| Distance from camera | What runs |
|---|---|
| < 80 studs | Full: spotlight, glow, blink |
| 80-300 studs | Glow only, no SpotLight (`Enabled = false`) |
| > 300 studs | Nothing updates; leave last state |

Check distances a few times per second, not per frame. Test at night on a low-end phone with 20 cars on screen; the Developer Console and MicroProfiler will show light cost directly.

## Pitfalls
- Lights inside a mesh that blocks them: SpotLights cast from the part, so put them on a small invisible part at the bumper.
- Daytime headlight bloom: lower `Brightness` when `Lighting.ClockTime` is daytime instead of turning them off completely; it reads better in tunnels.
- Lights on a model that streams out: rebuild state when it streams back in.

## Related
[[Vehicles - Hub]] · [[Vehicles and StreamingEnabled - Atomic Cars and Streaming Ahead]] · [[Mobile FPS collapses]] · [[SpotLight]]
