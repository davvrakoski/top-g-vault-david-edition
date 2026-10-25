---
area: "06 Characters and Animation"
cluster: "Animation"
tags: [deep-dive, roblox, animation, ik, ikcontrol]
cssclasses: [tg-a06]
---

# IKControl Recipes - Foot Planting, Aiming and Look-At

> **Why this matters:** Feet floating on stairs, heads that never look at the speaker and guns that point 20 degrees off the crosshair make an otherwise good game look cheap.
> `IKControl` fixes all three procedurally, but only if you set the chain, pole, weight and smoothing correctly and fade it in and out instead of toggling it.

---

## 1. IKControl in 60 seconds

An `IKControl` must be a child of a `Humanoid` or an `AnimationController` that has an `Animator`. It is solved after animations each frame, so it *corrects* the animated pose rather than replacing it.

| Property | What it does | Practical note |
|---|---|---|
| `Type` | `Transform`, `Position`, `Rotation`, `LookAt` | Feet: `Position` (or `Transform` to also match slope). Head: `LookAt`. Hand on a grip: `Transform`. |
| `ChainRoot` | First part/bone in the chain | `LeftUpperLeg` for a whole leg, `UpperTorso` for spine+head look. |
| `EndEffector` | Last part/bone (or an Attachment) | `LeftFoot`, `Head`, `RightHand`. An Attachment lets you aim *its* point instead of the part centre. |
| `Target` | Where the end effector should go | Any instance with a position: Attachment, BasePart, Bone. Use an Attachment you move yourself. |
| `Pole` | Which way the knee/elbow bends | Optional; for R15 arm and leg chains the solver guesses well, otherwise set one. |
| `Weight` | 0 to 1 blend | Weight 0 does **not** fully disable; set `Enabled = false` for that. |
| `SmoothTime` | Critically damped smoothing, seconds | Default `0.05`; `0` disables smoothing. |
| `Priority` | Solve order | Higher is solved later and can override lower ones. Default `0`. |
| `Offset` / `EndEffectorOffset` | Extra CFrames | Fix misaligned hand/foot axes without moving the target. |

There is also `Workspace.IKControlConstraintSupport`, which controls whether the IK solver respects physical constraints (for example a `HingeConstraint` on an elbow or a limited `BallSocketConstraint` on a wrist, as in the official IK tutorial). Use it if your arms bend backwards.

**Who runs IK?** Create the `IKControl` instances once (server or client), but compute targets **on each client for the characters it can see**. Foot targets come from local raycasts every frame; replicating them over the network would be laggy and wasteful.

## 2. Recipe: foot planting on slopes and stairs

The goal: on uneven ground, each foot sits on the surface, and the pelvis drops so the lower foot can reach.

Design decisions first:

- Only plant when the character is **grounded and slow** (idle, walking). At running speed, planting fights the run cycle and looks worse. Fade weight by speed.
- Raycast from above each foot's *animated* position downward. Use the animated foot position (the part's CFrame after animation) so the step cycle still reads.
- Lower the pelvis by the larger of the two foot offsets, clamped.

```lua
--!strict
-- StarterPlayerScripts/FootIK.client.lua
-- R15 foot planting for the local character. Extend to nearby NPCs with the same function.
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local RAY_UP = 1.5          -- start the ray this far above the foot
local RAY_DOWN = 3.0        -- how far below to search
local MAX_PELVIS_DROP = 1.2 -- studs
local PLANT_MAX_SPEED = 10  -- studs/s; above this, IK fades out
local FOOT_HEIGHT = 0.2     -- distance from foot part centre to sole; measure your rig

type FootRig = {
	ik: IKControl,
	target: Attachment,
	foot: BasePart,
}

local function makeFoot(humanoid: Humanoid, character: Model, side: "Left" | "Right"): FootRig
	local root = character:WaitForChild("HumanoidRootPart") :: BasePart
	local target = Instance.new("Attachment")
	target.Name = side .. "FootIKTarget"
	target.Parent = Workspace.Terrain -- world-space attachment we move freely

	local ik = Instance.new("IKControl")
	ik.Name = side .. "FootIK"
	ik.Type = Enum.IKControlType.Position
	ik.ChainRoot = character:WaitForChild(side .. "UpperLeg")
	ik.EndEffector = character:WaitForChild(side .. "Foot")
	ik.Target = target
	ik.SmoothTime = 0.06
	ik.Weight = 0
	ik.Parent = humanoid
	return { ik = ik, target = target, foot = ik.EndEffector :: BasePart }
end

local function setup(character: Model)
	local humanoid = character:WaitForChild("Humanoid") :: Humanoid
	local root = character:WaitForChild("HumanoidRootPart") :: BasePart
	local lowerTorso = character:WaitForChild("LowerTorso") :: BasePart
	local rootJoint = lowerTorso:WaitForChild("Root") :: Motor6D
	local baseC0 = rootJoint.C0

	local feet = { makeFoot(humanoid, character, "Left"), makeFoot(humanoid, character, "Right") }

	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	params.FilterDescendantsInstances = { character }

	local pelvisDrop = 0

	local conn = RunService.PreRender:Connect(function(dt)
		local state = humanoid:GetState()
		local grounded = state == Enum.HumanoidStateType.Running
			or state == Enum.HumanoidStateType.RunningNoPhysics
			or state == Enum.HumanoidStateType.Landed
		local speed = (root.AssemblyLinearVelocity * Vector3.new(1, 0, 1)).Magnitude
		local wantWeight = if grounded then math.clamp(1 - speed / PLANT_MAX_SPEED, 0, 1) else 0

		local maxDrop = 0
		for _, f in feet do
			local footPos = f.foot.Position
			local origin = footPos + Vector3.new(0, RAY_UP, 0)
			local hit = Workspace:Raycast(origin, Vector3.new(0, -(RAY_UP + RAY_DOWN), 0), params)
			if hit and wantWeight > 0 then
				local desired = hit.Position + Vector3.new(0, FOOT_HEIGHT, 0)
				f.target.WorldPosition = desired
				-- how far below the animated foot the ground is (positive = needs to drop)
				local drop = footPos.Y - desired.Y
				maxDrop = math.max(maxDrop, drop)
				f.ik.Weight += (wantWeight - f.ik.Weight) * math.min(dt * 12, 1)
			else
				f.ik.Weight += (0 - f.ik.Weight) * math.min(dt * 12, 1)
			end
		end

		-- lower the pelvis so the lower foot can reach; ease toward the goal
		local goalDrop = math.clamp(maxDrop, 0, MAX_PELVIS_DROP) * wantWeight
		pelvisDrop += (goalDrop - pelvisDrop) * math.min(dt * 10, 1)
		rootJoint.C0 = baseC0 * CFrame.new(0, -pelvisDrop, 0)
	end)

	humanoid.Died:Once(function()
		conn:Disconnect()
		for _, f in feet do
			f.ik:Destroy()
			f.target:Destroy()
		end
	end)
	character.Destroying:Once(function()
		conn:Disconnect()
		for _, f in feet do
			f.target:Destroy()
		end
	end)
end

local player = Players.LocalPlayer
player.CharacterAdded:Connect(setup)
if player.Character then
	setup(player.Character)
end
```

Notes on this recipe:

- **The pelvis offset uses the `Root` Motor6D's `C0` on the client.** Changing `C0` locally is visual only. The animator writes `Transform`, not `C0`, so the two do not fight. Check the joint name on custom rigs; on standard R15 it is `LowerTorso.Root`.
- **If you enabled `StarterPlayer.AvatarJointUpgrade`**, character joints become `AnimationConstraint` objects instead of `Motor6D`, so `WaitForChild("Root") :: Motor6D` will be wrong. Find the joint by name and class at runtime, and drive the pelvis offset through the constraint's attachments, or skip the pelvis drop and accept slightly bent legs. Test this path explicitly; the recipe above assumes classic Motor6D joints.
- **`FOOT_HEIGHT`** depends on your rig. Measure: stand on flat ground, read `foot.Position.Y - groundY`.
- **Target attachments parented to `Workspace.Terrain`** are a common trick for world-space attachments (Terrain is always present and never moves). Clean them up yourself.
- **Do not change `Humanoid.HipHeight`** to drop the body. That changes physics and replication; the visual-only `C0` offset is safer.
- For slopes, switch the type to `Transform` and set the target's CFrame so the foot's up vector matches `hit.Normal`. Expect to need `EndEffectorOffset` to correct the foot's local axes.

## 3. Recipe: look-at for heads (NPCs, dialogue, player)

```lua
-- Head/neck look-at with limited angle. Works on R15 humanoids and AnimationController rigs.
local function makeLookAt(humanoidOrController: Instance, character: Model)
	local target = Instance.new("Attachment")
	target.Name = "LookTarget"
	target.Parent = workspace.Terrain

	local ik = Instance.new("IKControl")
	ik.Name = "HeadLook"
	ik.Type = Enum.IKControlType.LookAt
	ik.ChainRoot = character:WaitForChild("UpperTorso") -- include the chest for a natural turn
	ik.EndEffector = character:WaitForChild("Head")
	ik.Target = target
	ik.SmoothTime = 0.15  -- heads turn slower than hands
	ik.Weight = 0
	ik.Parent = humanoidOrController
	return ik, target
end

local MAX_ANGLE = math.rad(70)

-- call every frame (or every few frames for distant NPCs)
local function updateLook(ik: IKControl, target: Attachment, head: BasePart, root: BasePart, worldPoint: Vector3?, dt: number)
	local want = 0
	if worldPoint then
		local toPoint = (worldPoint - head.Position)
		local flatForward = root.CFrame.LookVector
		local angle = math.acos(math.clamp(flatForward:Dot(toPoint.Unit), -1, 1))
		if angle < MAX_ANGLE then
			want = 1
			target.WorldPosition = worldPoint
		end
	end
	ik.Weight += (want - ik.Weight) * math.min(dt * 6, 1)
end
```

Using `UpperTorso` as `ChainRoot` spreads the rotation across chest, neck and head. If the whole upper body twists too much, set `ChainRoot` to `Head` itself or lower the weight to 0.6. The angle cutoff stops the "owl head" effect when the target walks behind the NPC; the dot product math is explained in [[Dot Product, Cross Product, and FOV]].

## 4. Recipe: aim correction (third-person shooters)

Animated aim poses are authored for "straight ahead". When the camera pitches up or down, the gun should follow. Two layers:

1. **Spine pitch via LookAt.** `ChainRoot = LowerTorso` or `UpperTorso`, `EndEffector` = an Attachment on the weapon's muzzle (or on `RightHand`), `Type = LookAt`, target = the world point under the crosshair (a camera raycast hit).
2. **Off-hand grip via Transform.** `ChainRoot = LeftUpperArm`, `EndEffector = LeftHand`, target = a `LeftGrip` attachment on the weapon. This keeps the left hand glued to the foregrip whatever the spine does.

Order them with `Priority`: spine look-at at `Priority = 0`, left-hand grip at `Priority = 1`, so the grip is solved after the spine moves the weapon.

For other players' characters, replicate only the **aim pitch/yaw** (a small number, throttled to ~10 to 20 Hz via an `UnreliableRemoteEvent`) and rebuild the target point locally. Do not replicate world positions every frame.

## 5. Recipe: hands on world objects (doors, ladders, steering wheels)

`Type = Transform`, `ChainRoot = RightUpperArm`, `EndEffector = RightHand`, target = an Attachment on the door handle. Fade `Weight` from 0 to 1 over 0.15 s as the interaction starts, back to 0 when it ends. Vehicles are the big one: hands on the steering wheel make seated driving look intentional. See [[Vehicle Enter - Exit, Seats and Camera]].

## 6. Budget and LOD

IK is not free. Rough guidance (not an official number, measure with the MicroProfiler):

- Local player: full foot IK + look-at + aim every frame.
- Other players within ~40 studs: look-at and aim every frame, foot IK every frame only if on screen.
- Beyond ~40 studs or off screen: `Enabled = false`.
- Crowds of NPCs: look-at only for the 2 to 3 NPCs nearest the camera.

Disable with `Enabled = false` rather than weight 0, because the docs note weight 0 still lets smoothing and pole affect the pose.

The `Animator.EvaluationThrottled` property tells you when animation evaluation was skipped this frame for a throttled remote character; skip your procedural offsets on those frames so they do not fight a stale pose.

## Common mistakes

- Putting `IKControl` under the character model instead of under the `Humanoid`/`AnimationController`.
- Toggling `Enabled` on and off instead of fading `Weight`, causing a visible pop.
- Setting `Weight = 0` and assuming IK is off.
- Raycasting from the root instead of each foot; both feet land at the same height.
- Using `HipHeight` to lower the body for foot IK.
- Planting feet while running, which drags the stride.
- Look-at with no angle limit, so heads spin 180 degrees.
- Running foot IK on 40 NPCs every frame on mobile.
- Leaving world-space target attachments behind after the character is destroyed.

## Checklist

- [ ] IKControls parented to Humanoid/AnimationController with an Animator.
- [ ] Targets are Attachments you move locally each frame.
- [ ] Foot IK fades by speed and grounded state; pelvis drop clamped.
- [ ] Look-at has an angle cutoff and slower `SmoothTime`.
- [ ] Aim spine + off-hand grip ordered with `Priority`.
- [ ] Remote characters replicate aim angles only, throttled.
- [ ] Distance/visibility LOD sets `Enabled = false`.
- [ ] Target attachments cleaned up on death and despawn.

---

**Related:** [[Animation - Hub]] · [[Animation Layering, IK and Markers]] · [[Procedural Animation, Springs and Recoil]] · [[Animation foot slide - state fighting]] · [[Dot Product, Cross Product, and FOV]] · [[Character Controllers]]
