---
area: "12 UI Audio and Camera"
cluster: "Audio"
title: "Material-Based Footsteps - FloorMaterial and Animation Markers"
tags: [roblox, community-knowledge, audio, footsteps, animation-events, surfaces]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/AnimationTrack
  - https://create.roblox.com/docs/animation/events
  - https://devforum.roblox.com/t/2221267
  - https://devforum.roblox.com/t/2570529
  - https://devforum.roblox.com/t/how-to-change-an-npcs-walk-sounds/2503814
---
# Material-Based Footsteps - FloorMaterial and Animation Markers

Footsteps that match the surface (wood creak, metal clang, grass rustle, splash in water) make a world feel solid, and in horror and stealth games they are gameplay: you hear where the threat is. The default character sound is one looping run sound for everything. A good custom system has three parts: **when** a foot lands, **what** it lands on, and **how** it sounds without repeating.

## 1. When: animation markers, with a fallback

**Best:** add keyframe markers named `Footstep` (with a parameter like `L` or `R`) on the contact frames of your walk and run animations in the Animation Editor. Then:

```lua
track:GetMarkerReachedSignal("Footstep"):Connect(function(foot: string)
	playStep(foot)
end)
```

Steps line up exactly with the animation at any speed, including custom walk cycles. DevForum footstep threads recommend this approach for accurate timing.

**Fallback** (default animations or NPCs without markers): time steps from speed. Listen to `Humanoid.Running(speed)` and step every `strideLength / speed` seconds, for example a 2.6-stud stride for an average R15 walk (tune by watching your own animation).

```lua
local STRIDE = 2.6
local timer = 0
RunService.Heartbeat:Connect(function(dt)
	local speed = humanoid.MoveDirection.Magnitude > 0 and root.AssemblyLinearVelocity.Magnitude or 0
	if speed < 1 or humanoid.FloorMaterial == Enum.Material.Air then
		timer = 0
		return
	end
	timer += dt
	if timer >= STRIDE / speed then
		timer = 0
		playStep()
	end
end)
```

## 2. What: the surface

- `Humanoid.FloorMaterial` is read-only, works on Parts and Terrain, and is `Air` while jumping or falling. No raycast needed for the base material.
- For **MaterialVariants** (your custom "MetalGrate" variant still reports `Metal`), raycast down from the root and read `result.Instance.MaterialVariant` or a `FootstepSurface` attribute you set on parts.
- Water: check `FloorMaterial == Enum.Material.Water` for terrain water, and a "shallow water" zone attribute for parts.

```lua
local SURFACE = {
	[Enum.Material.Grass] = "Grass", [Enum.Material.LeafyGrass] = "Grass",
	[Enum.Material.Wood] = "Wood", [Enum.Material.WoodPlanks] = "Wood",
	[Enum.Material.Metal] = "Metal", [Enum.Material.DiamondPlate] = "Metal",
	[Enum.Material.Sand] = "Sand", [Enum.Material.Snow] = "Snow",
	[Enum.Material.Water] = "Water",
}
local function surfaceFor(material: Enum.Material): string
	return SURFACE[material] or "Concrete"
end
```

## 3. How: variation without repetition

- 4-6 recorded variants per surface, chosen at random but **never the same one twice in a row**.
- Randomise pitch (`PlaybackSpeed` 0.92-1.08) and volume (0.85-1.0) slightly on every step.
- Different sets or louder volume for running vs walking vs crouching; landing from a jump gets its own heavier sound.
- Play from the foot or root as a 3D sound with a short falloff (about 30-45 studs) so other players hear direction.

```lua
local lastIndex = {}
local function pickVariant(surface: string, sounds: { Sound }): Sound
	local i
	repeat i = math.random(#sounds) until #sounds == 1 or i ~= lastIndex[surface]
	lastIndex[surface] = i
	return sounds[i]
end
```

## Local player vs others

- Run the system **on each client for every character it can see** (other players and NPCs), not on the server. Footsteps are presentation; server-side sounds replicate late and cost bandwidth.
- Skip characters beyond ~50 studs, and cap simultaneous footstep sounds (for example 12) in crowded scenes.
- Your own steps can be quieter in first person; too-loud self footsteps are a common complaint.

## Replacing the default run sound

Default character sounds come from a client script in `PlayerScripts` (commonly named `RbxCharacterSounds`). The usual community approach is to place your own LocalScript with the same name in `StarterPlayerScripts` so it replaces the default, or to silence the `Running` sound inside the character. This is community practice, not documented in the official docs (unverified there); check it still works after engine updates.

## Pitfalls

- Using `Touched` on feet: fires unreliably and multiple times per step.
- Raycasting every frame for every character just to read material; `FloorMaterial` is free.
- One sound set for all surfaces with pitch shifting. Players hear it as fake immediately.
- Forgetting crouch/sneak volume in a stealth game: sound level is a mechanic, so expose it to AI hearing too.

## Related
[[Audio - Hub]] · [[Footsteps and Surface Audio]] · [[AudioEmitter Attenuation Curves and Acoustic Simulation]] · [[Animation Will Not Play - Troubleshooting Checklist]]
