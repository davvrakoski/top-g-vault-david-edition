---
area: "07 AI and Combat"
cluster: "Combat"
title: "Recoil, Spread and Bloom for Roblox Guns"
tags: [roblox, community-knowledge, combat, guns, recoil, spread, camera]
cssclasses: [tg-a07]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/recoil-implementations/225453
  - https://devforum.roblox.com/t/how-to-make-good-gun-recoil/2272370
  - https://devforum.roblox.com/t/help-with-gun-recoil-system/2166799
  - https://create.roblox.com/docs/reference/engine/classes/RunService#BindToRenderStep
  - https://create.roblox.com/docs/reference/engine/datatypes/Random
---
# Recoil, Spread and Bloom for Roblox Guns

Two different systems hide under the word "recoil", and mixing them up causes most of the DevForum complaints (camera oscillating, choppy kicks, guns that feel random). **Camera recoil** moves the player's view after a shot: it is felt, it is client-only, and skill can control it. **Spread/bloom** changes where bullets actually go: it decides hits, so the server must agree with it. Keep them separate.

## Camera recoil (client, cosmetic)

Model it as an offset that **kicks fast and recovers slowly**, applied on top of the camera every frame. A damped spring or a simple exponential decay both work; the threads' oscillation bugs come from springs with too little damping, and the choppy bugs from setting the camera CFrame once per shot.

```lua
local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera
local offset = Vector2.zero -- pitch, yaw in radians still to apply
local applied = Vector2.zero

local function kick(pitchDeg: number, yawDeg: number)
	offset += Vector2.new(math.rad(pitchDeg), math.rad(yawDeg))
end

RunService:BindToRenderStep("GunRecoil", Enum.RenderPriority.Camera.Value + 1, function(dt)
	-- move a fraction of the remaining kick this frame (fast), then recover (slow)
	local step = offset * math.min(1, dt * 25)
	offset -= step
	applied += step
	local recover = applied * math.min(1, dt * 6)
	applied -= recover
	local delta = step - recover
	camera.CFrame *= CFrame.Angles(delta.X, -delta.Y, 0)
end)
```

Binding after the camera's render priority makes the offset apply on top of the default camera instead of fighting it. The player's own mouse movement still works, so pulling down to counter recoil is a learnable skill.

## Recoil patterns

Fixed per-shot patterns (as in many competitive shooters) are more learnable than random kicks. Store a table per weapon:

```lua
local AK_PATTERN = { {1.2, 0}, {1.3, 0.1}, {1.4, 0.2}, {1.2, -0.3}, {1.0, -0.5}, {0.9, 0.4} }
-- shot i uses AK_PATTERN[math.min(i, #AK_PATTERN)], plus a tiny random jitter
```

Reset the shot index after the trigger is released for about 0.3 s.

## Spread and bloom (gameplay, must be server-consistent)

- **Base spread** per weapon (degrees): sniper 0.05, rifle 0.8, SMG 2, shotgun pellets 4.
- **Bloom** grows per shot (+0.3 degrees, capped) and decays when not firing.
- **Modifiers:** x0.5 aiming down sights, x1.5 moving, x2 in the air.

To keep hits consistent, share a **seed sequence** instead of trusting the final direction: when the weapon is equipped, the server sends a random seed base; shot number `n` uses `Random.new(base + n)` on both sides. The client computes the deviation for its local tracer and hit test and sends the shot number with the shot. The server recomputes the same deviation from that seed plus the spread value it calculates itself (from its own knowledge of the weapon, bloom and movement state) and rejects shots whose claimed direction does not match within a small tolerance, or whose shot numbers repeat or skip. Because the server chose the base, the client cannot shop for lucky seeds.

```lua
local function deviate(dir: Vector3, spreadDeg: number, seed: number): Vector3
	local rng = Random.new(seed)
	local angle = math.rad(spreadDeg) * math.sqrt(rng:NextNumber()) -- uniform over the cone's disc
	local roll = rng:NextNumber() * 2 * math.pi
	local cf = CFrame.lookAt(Vector3.zero, dir)
	return (cf * CFrame.Angles(0, 0, roll) * CFrame.Angles(angle, 0, 0)).LookVector
end
```

## Feel checklist

- [ ] Kick, recovery and pattern per weapon in a config module
- [ ] Viewmodel kick (weapon moves back and up) separate from camera kick
- [ ] Crosshair size tied to current spread so players see bloom
- [ ] Recoil scaled down for gamepad/touch, which cannot counter-pull as precisely
- [ ] Server validates fire rate and ammo independently of recoil

## Pitfalls

- TweenService on the camera for recoil: rapid shots interrupt tweens (a thread reports the camera getting stuck).
- Recoil that permanently moves the aim with no recovery: players drift into the sky.
- Applying spread only on the client: exploiters remove it. Recompute on the server.

## Related
[[Combat - Hub]] - [[Hitscan and Projectile Weapon Blueprint]] - [[Config-Driven Weapons]] - [[Hitstop, Screen Shake and Camera Impact Feel]]
