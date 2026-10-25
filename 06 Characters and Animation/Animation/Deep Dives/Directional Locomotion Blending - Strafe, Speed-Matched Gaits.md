---
area: "06 Characters and Animation"
cluster: "Animation"
tags: [deep-dive, roblox, animation, locomotion, blending]
cssclasses: [tg-a06]
---

# Directional Locomotion Blending - Strafe, Speed-Matched Gaits

> **Why this matters:** Shooters, lock-on melee and top-down games all need characters that walk sideways and backwards without moonwalking. The default Animate script only knows "forward".
> A small weight-blending controller on the `Movement` priority gives you 8-way strafing with feet that match ground speed.

---

## 1. When you need it

You need directional locomotion when the character's facing and its movement direction are decoupled:

- shift-lock or over-the-shoulder shooter cameras,
- lock-on melee (circling an enemy),
- twin-stick/top-down aiming,
- NPCs that strafe while keeping their weapon on the player.

If the character always faces where it runs (classic Roblox), the default `Animate` script is fine. Skip this note.

## 2. Clips to author

Minimum set (all **looped**, all **Movement** priority, all **in place**, no root motion):

| Clip | Direction | Authored speed |
|---|---|---|
| `Idle` | none | 0 (Idle priority) |
| `WalkF` | forward | measure, e.g. 8 studs/s |
| `WalkB` | backward | same as WalkF |
| `WalkL` | strafe left | same |
| `WalkR` | strafe right | same |
| `RunF` | forward | measure, e.g. 18 studs/s |

Optional: `RunB`, `RunL`, `RunR` and diagonals. Four directions plus blending already looks good; diagonals mainly fix leg crossing at 45 degrees.

**Measure authored speed.** Play the walk in the Animation Editor next to a grid, count how many studs a foot travels backwards per cycle while planted, divide by cycle length. Write it down per clip. Speed matching is impossible without this number.

**Sync the cycles.** All walk clips should have the same length and the same foot contact timing (left foot down at 0%, right at 50%). Otherwise blending two clips crosses the legs.

## 3. The blend math

Each frame:

1. Get the horizontal velocity `v` of the root part.
2. Convert to **local space** of the character: `local = root.CFrame:VectorToObjectSpace(v)`. In Roblox, a model's forward is `-Z`, so forward speed is `-local.Z` and right speed is `local.X`.
3. Compute direction weights from the angle, using a cosine-style split so weights always sum to 1:
   - forward = max(0, fwd) / total, backward = max(0, -fwd) / total, right = max(0, right) / total, left = max(0, -right) / total, where total = |fwd| + |right|.
4. Blend walk vs run by speed.
5. Set each track's weight with `AdjustWeight()` and each track's playback speed to `actualSpeed / authoredSpeed`.

Using `|fwd| + |right|` (L1 normalization) keeps the total weight at 1 so the pose never "shrinks" between clips.

## 4. Controller code

```lua
--!strict
-- ReplicatedStorage/Shared/StrafeLocomotion.lua
-- Drives 4-way walk + forward run on the Movement priority. Call :Step(dt) every frame.
local StrafeLocomotion = {}
StrafeLocomotion.__index = StrafeLocomotion

export type Config = {
	ids: { [string]: string },        -- Idle, WalkF, WalkB, WalkL, WalkR, RunF
	walkSpeed: number,                 -- authored walk speed (studs/s)
	runSpeed: number,                  -- authored run speed (studs/s)
	idleThreshold: number?,            -- below this speed, idle only
	fade: number?,                     -- AdjustWeight fade time
}

function StrafeLocomotion.new(animator: Animator, root: BasePart, config: Config)
	local self = setmetatable({}, StrafeLocomotion)
	self.root = root
	self.config = config
	self.tracks = {} :: { [string]: AnimationTrack }

	for name, id in config.ids do
		local a = Instance.new("Animation")
		a.AnimationId = id
		local t = animator:LoadAnimation(a)
		t.Looped = true
		t.Priority = if name == "Idle" then Enum.AnimationPriority.Idle else Enum.AnimationPriority.Movement
		self.tracks[name] = t
	end

	-- Start everything at near-zero weight so cycles stay phase-locked.
	for name, t in self.tracks do
		t:Play(0, if name == "Idle" then 1 else 0.001, 1)
	end
	return self
end

function StrafeLocomotion:Step(_dt: number)
	local cfg = self.config
	local fade = cfg.fade or 0.12
	local v = self.root.AssemblyLinearVelocity
	local flat = Vector3.new(v.X, 0, v.Z)
	local speed = flat.Magnitude
	local tr = self.tracks

	if speed < (cfg.idleThreshold or 0.75) then
		for name, t in tr do
			if name ~= "Idle" then
				t:AdjustWeight(0.001, fade)
			end
		end
		tr.Idle:AdjustWeight(1, fade)
		return
	end

	local localV = self.root.CFrame:VectorToObjectSpace(flat)
	local fwd = -localV.Z
	local right = localV.X
	local total = math.abs(fwd) + math.abs(right)
	local wF = math.max(fwd, 0) / total
	local wB = math.max(-fwd, 0) / total
	local wR = math.max(right, 0) / total
	local wL = math.max(-right, 0) / total

	-- walk -> run blend applies to the forward component only (no RunB/L/R in this set)
	local runT = math.clamp((speed - cfg.walkSpeed) / (cfg.runSpeed - cfg.walkSpeed), 0, 1)
	local wRunF = wF * runT
	local wWalkF = wF * (1 - runT)

	tr.Idle:AdjustWeight(0.001, fade)
	tr.WalkF:AdjustWeight(math.max(wWalkF, 0.001), fade)
	tr.RunF:AdjustWeight(math.max(wRunF, 0.001), fade)
	tr.WalkB:AdjustWeight(math.max(wB, 0.001), fade)
	tr.WalkL:AdjustWeight(math.max(wL, 0.001), fade)
	tr.WalkR:AdjustWeight(math.max(wR, 0.001), fade)

	-- speed matching: one rate for all tracks keeps them phase-locked
	local refSpeed = cfg.walkSpeed + (cfg.runSpeed - cfg.walkSpeed) * runT * wF
	local rate = math.clamp(speed / refSpeed, 0.5, 2)
	for name, t in tr do
		if name ~= "Idle" then
			t:AdjustSpeed(rate)
		end
	end
end

function StrafeLocomotion:Destroy()
	for _, t in self.tracks do
		t:Stop(0)
		t:Destroy()
	end
end

return StrafeLocomotion
```

Hook it up on the client for the local character (and for nearby remote characters if you replace their Animate too):

```lua
local RunService = game:GetService("RunService")
local StrafeLocomotion = require(game:GetService("ReplicatedStorage").Shared.StrafeLocomotion)

local loco = StrafeLocomotion.new(animator, rootPart, {
	ids = { Idle = "rbxassetid://0", WalkF = "rbxassetid://0", WalkB = "rbxassetid://0",
		WalkL = "rbxassetid://0", WalkR = "rbxassetid://0", RunF = "rbxassetid://0" },
	walkSpeed = 8,
	runSpeed = 18,
})

RunService.PreAnimation:Connect(function(dt)
	loco:Step(dt)
end)
```

## 5. Removing the default walk/run

The default `Animate` script will keep playing its `Core` priority walk underneath. Because your clips are on higher priorities, they win the joints they key; but if your clips do not key a joint (for example the head), the Core walk still bobs it. Options:

1. Fork `Animate` (copy from a play session into `StarterCharacterScripts`, keep its name) and delete the walk/run handling.
2. Replace the walk/run IDs under `Animate` with your idle so Core does nothing visible.

Option 1 is cleaner for shooters; option 2 is fine for prototypes.

## 6. Keeping the character facing the camera

Directional blending only makes sense if the character's facing is decoupled from movement. Typical setup for an over-the-shoulder game:

```lua
humanoid.AutoRotate = false
RunService:BindToRenderStep("FaceCamera", Enum.RenderPriority.Character.Value, function()
	local cam = workspace.CurrentCamera
	local look = cam.CFrame.LookVector
	local flatLook = Vector3.new(look.X, 0, look.Z)
	if flatLook.Magnitude > 0.01 then
		rootPart.CFrame = CFrame.lookAt(rootPart.Position, rootPart.Position + flatLook)
	end
end)
```

Setting `rootPart.CFrame` on the client's own character every frame is acceptable because the client owns its character physics, but it does cancel `Humanoid:MoveTo()` (the docs list a root CFrame change as one of the conditions that ends `MoveTo`). For NPCs, rotate with an `AlignOrientation` instead.

## 7. NPC strafing

On NPCs moved by the server, the same controller works on the server (tracks replicate) or, better, on clients (the server sets an attribute such as `Facing` or simply lets clients read the replicated velocity). Clients reading `AssemblyLinearVelocity` of a server-owned NPC get interpolated values; that is good enough for animation.

## 8. Tuning notes

- **Foot slide at blend boundaries** usually means the clips are not phase-locked. Start all tracks together (as the constructor does) and never `Stop()`/`Play()` them individually during locomotion.
- **Legs crossing at 45 degrees** is the main reason to add diagonal clips. Alternatively, reduce cross-over by authoring strafes with a wider stance.
- **Backward running** at full sprint looks wrong in most games; cap backward speed with `WalkSpeed` changes when moving away from the facing direction.
- Weights below 0.001 are treated as near-invisible here to keep tracks running; the cost is evaluating six tracks per character. For distant characters, collapse to forward-only.

## Common mistakes

- Using world-space velocity instead of root-local velocity, so "left" changes when you turn.
- Normalizing weights with a vector length instead of L1, causing a smaller pose at diagonals.
- Speed matching each clip independently, which de-syncs foot contacts.
- Root motion in strafe clips.
- Forgetting `AutoRotate = false`, so the humanoid turns into the movement direction and the strafes never play.
- Leaving the default Core walk playing and seeing a double head bob.

## Checklist

- [ ] Clips authored in place, same length, same contact timing.
- [ ] Authored speeds measured and stored in config.
- [ ] All locomotion tracks started together and only weight-adjusted.
- [ ] Local-space velocity, L1-normalized weights.
- [ ] One shared playback rate for speed matching.
- [ ] Default walk/run removed or neutralized.
- [ ] Facing decoupled (AutoRotate off or AlignOrientation for NPCs).
- [ ] Distance LOD for remote characters.

---

**Related:** [[Animation - Hub]] · [[Animator Priorities, Weights and Blending Done Right]] · [[Animation foot slide - state fighting]] · [[Character Controllers]] · [[Camera Obstruction, Shoulder Swap and Lock-On]] · [[FPS TPS Starter Architecture]]
