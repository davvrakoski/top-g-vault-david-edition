---
area: "07 AI and Combat"
cluster: "AI"
tags: [deep-dive, roblox, ai, npc, crowds, lod, performance]
cssclasses: [tg-a07]
---

# NPC Crowds, Animation LOD and Server Budgets

> **Why this matters:** 20 NPCs are easy. 200 zombies, shoppers or soldiers will melt a Roblox server through Humanoid physics, replication and server-played animations long before the AI logic costs anything.
> The fix is to split *simulation* (server, cheap, low rate) from *presentation* (clients, animated, distance-LODed), and to use the engine's own animation throttling instead of fighting it.

---

## 1. Where the cost actually goes

For a typical crowd, in rough order of cost (measure your own with the MicroProfiler and the server `Stats`):

1. **Humanoid simulation** for every NPC (state machine, ground checks, physics controller).
2. **Physics replication** of every moving unanchored assembly to every client.
3. **Server-played animation tracks** replicating to all clients.
4. **Perception queries** (raycasts, overlap queries) at high rates.
5. **Pathfinding computations**.
6. **The decision logic** itself (usually the cheapest part).

So the biggest wins are structural: fewer Humanoids, fewer replicated physics bodies, animation on clients, lower tick rates.

## 2. Three crowd tiers

| Tier | Count (guide) | Server representation | Client presentation |
|---|---|---|---|
| **Hero** (bosses, companions, nearby elites) | 1 to 10 | Full Humanoid, server-owned physics, pathfinding | Full animation, IK, VFX |
| **Combat crowd** (zombies near players) | 10 to 80 | AnimationController or slim Humanoid; server moves it (CFrame/constraints); pathing only when needed | Client-played animation from attributes; distance LOD |
| **Ambient crowd** (background shoppers, far hordes) | 50 to 500 | Not simulated per NPC, or data only | Client-only models moved along splines, impostors, or SLIM/streaming meshes |

The counts are guides from shipped Roblox crowd games, not engine limits; your map, devices and NPC complexity decide the real numbers.

## 3. Server-driven crowd without Humanoids

An anchored NPC model moved with `BulkMoveTo` costs no physics simulation at all, and replicates as CFrame updates.

```lua
--!strict
-- ServerScriptService/AI/CrowdMover.server.lua
-- Moves anchored AnimationController NPCs along their brain's desired velocity, ground-snapped.
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

type Agent = {
	model: Model,
	root: BasePart,            -- anchored PrimaryPart; the rest welded or anchored with it
	desired: Vector3,          -- set by the AI brain (flat velocity, studs/s)
	speed: number,
	groundY: number,
	lastGroundCheck: number,
	moving: boolean,
}

local agents: { Agent } = {}
local groundParams = RaycastParams.new()
groundParams.FilterType = Enum.RaycastFilterType.Include
groundParams.FilterDescendantsInstances = { Workspace:WaitForChild("Map") } -- only walkable geometry

local GROUND_CHECK_INTERVAL = 0.2
local HIP = 3

RunService.Heartbeat:Connect(function(dt)
	local parts: { BasePart } = {}
	local cframes: { CFrame } = {}
	local now = os.clock()
	for _, a in agents do
		local vel = a.desired
		if vel.Magnitude > 0.05 then
			local pos = a.root.Position + vel * dt
			if now - a.lastGroundCheck > GROUND_CHECK_INTERVAL then
				a.lastGroundCheck = now
				local hit = Workspace:Raycast(pos + Vector3.new(0, 4, 0), Vector3.new(0, -12, 0), groundParams)
				if hit then a.groundY = hit.Position.Y end
			end
			pos = Vector3.new(pos.X, a.groundY + HIP, pos.Z)
			table.insert(parts, a.root)
			table.insert(cframes, CFrame.lookAt(pos, pos + Vector3.new(vel.X, 0, vel.Z)))
		end
		local moving = vel.Magnitude > 0.05
		if moving ~= a.moving then          -- write attributes on state change only
			a.moving = moving
			a.model:SetAttribute("Moving", moving)
		end
	end
	if #parts > 0 then
		Workspace:BulkMoveTo(parts, cframes, Enum.BulkMoveMode.FireCFrameChanged)
	end
end)

return {
	add = function(model: Model, speed: number)
		local root = model.PrimaryPart :: BasePart
		root.Anchored = true
		table.insert(agents, { model = model, root = root, desired = Vector3.zero, speed = speed,
			groundY = root.Position.Y - HIP, lastGroundCheck = 0, moving = false })
	end,
}
```

Trade-offs: anchored crowds do not push each other or get knocked by physics; you implement separation (a spatial hash, see [[Spatial Hash for Nearby Queries]]) and knockback yourself. For zombie hordes that is usually what you want anyway: predictable and cheap.

The mover writes the `Moving` attribute only when the state flips. Keep attributes for state changes, never per-frame data like positions.

## 4. Client-side animation driven by attributes

The server never loads animation tracks for crowd NPCs. Each client animates NPCs near it.

```lua
--!strict
-- StarterPlayerScripts/CrowdAnimator.client.lua
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local IDS = { Idle = "rbxassetid://0", Walk = "rbxassetid://0", Attack = "rbxassetid://0" }
local NEAR = 60      -- full animation
local FAR = 160      -- beyond this, stop animating entirely

type Entry = { model: Model, animator: Animator, tracks: { [string]: AnimationTrack }?, active: boolean }
local entries: { [Model]: Entry } = {}

local function loadTracks(e: Entry)
	e.tracks = {}
	for name, id in IDS do
		local a = Instance.new("Animation")
		a.AnimationId = id
		local t = e.animator:LoadAnimation(a)
		t.Priority = if name == "Attack" then Enum.AnimationPriority.Action else Enum.AnimationPriority.Movement
		t.Looped = name ~= "Attack"
		e.tracks[name] = t
	end
end

local function applyState(e: Entry)
	local tracks = e.tracks
	if not tracks then return end
	if e.model:GetAttribute("Moving") then
		tracks.Walk:Play(0.2)
		tracks.Idle:Stop(0.2)
	else
		tracks.Idle:Play(0.2)
		tracks.Walk:Stop(0.2)
	end
end

local function onAdded(model: Instance)
	if not model:IsA("Model") then return end
	local controller = model:WaitForChild("AnimationController", 5)
	local animator = controller and controller:FindFirstChildOfClass("Animator")
	if not animator then return end
	local e: Entry = { model = model, animator = animator, tracks = nil, active = false }
	entries[model] = e
	model:GetAttributeChangedSignal("Moving"):Connect(function() if e.active then applyState(e) end end)
	model:GetAttributeChangedSignal("AttackAt"):Connect(function()
		if e.active and e.tracks then e.tracks.Attack:Play(0.05) end
	end)
end

CollectionService:GetInstanceAddedSignal("CrowdNPC"):Connect(onAdded)
CollectionService:GetInstanceRemovedSignal("CrowdNPC"):Connect(function(m)
	local e = entries[m :: Model]
	if e and e.tracks then
		for _, t in e.tracks do t:Destroy() end
	end
	entries[m :: Model] = nil
end)
for _, m in CollectionService:GetTagged("CrowdNPC") do task.spawn(onAdded, m) end

-- LOD pass at 4 Hz is plenty
local acc = 0
RunService.Heartbeat:Connect(function(dt)
	acc += dt
	if acc < 0.25 then return end
	acc = 0
	local cam = Workspace.CurrentCamera
	if not cam then return end
	local camPos = cam.CFrame.Position
	for model, e in entries do
		local pivot = model:GetPivot().Position
		local d = (pivot - camPos).Magnitude
		local shouldAnimate = d < FAR
		if shouldAnimate and not e.active then
			if not e.tracks then loadTracks(e) end
			e.active = true
			applyState(e)
		elseif not shouldAnimate and e.active then
			e.active = false
			if e.tracks then
				for _, t in e.tracks do t:Stop(0.3) end
			end
		end
		-- mid-distance: half-rate look by slowing nothing; let engine throttling handle it
	end
end)
```

Why this pattern works:

- Server bandwidth for animation is a couple of attribute changes per NPC per state change.
- Each client only animates what it can see, at its own budget.
- New clients joining mid-fight get correct state from replicated attributes.

The `Animator` under each NPC's `AnimationController` should exist in the model you clone on the server (the docs require the Animator to be created on the server for *replicated* animation; for client-only animation it is still simplest to ship it in the model).

## 5. Engine animation LOD: use it, do not fight it

Three engine controls are directly relevant:

- **`Workspace.ClientAnimatorThrottling`** (`ClientAnimatorThrottlingMode`: `Default`, `Disabled`, `Enabled`): when enabled, animations on remotely simulated models throttle based on visibility to the camera, in-game FPS and number of active animations. Leave it enabled for crowd games.
- **`Animator.PreferLodEnabled`** (default `true`): allows LOD throttling for that animator. Set it to `false` only for a handful of important characters (the boss, the dialogue NPC), because the docs warn that disabling LOD on many animators hurts performance.
- **`Animator.EvaluationThrottled`** (read-only): `true` on frames where evaluation was skipped and the previous pose reused. Skip procedural animation (IK, spring offsets) on those frames.

```lua
-- Boss always animates smoothly:
boss.AnimationController.Animator.PreferLodEnabled = false

-- Procedural layer respects throttling:
RunService.PreRender:Connect(function()
	if animator.EvaluationThrottled then return end
	applyProceduralLean()
end)
```

## 6. Rendering LOD for crowds

- **Instance streaming** plus `Model.ModelStreamingMode` controls when NPC models exist on each client. `Atomic` streams a model in/out as a whole, which avoids half-streamed NPCs.
- **`Model.LevelOfDetail`** (with streaming enabled) can render a low-resolution `StreamingMesh` impostor or a `SLIM` composite beyond the streaming radius. The docs note impostor/composite meshes do not support physics, collision or raycasting, and `StreamingMesh` does not support textures. Good for static distant props, less useful for moving NPCs; test it before relying on it for crowds.
- **`Workspace.EnableSLIMAvatars`** controls SLIM rendering for avatar characters when streaming is on.
- Keep NPC part counts low: 1 skinned `MeshPart` + root beats 15 parts + accessories for a background zombie.
- Turn off name/health display (`DisplayDistanceType = None`) on Humanoid NPCs; draw your own health bars only for the nearest few.

## 7. Server tick budget

- **One scheduler, many agents.** A single `Heartbeat` loop that processes a slice of NPCs each frame (round-robin) keeps cost flat. See [[Scalable NPC Update Scheduler]] and [[Fixed-Rate Scheduler]].
- **Distance tiers for brain rate:** within 50 studs of any player: 10 Hz; 50 to 150: 3 Hz; beyond: 0.5 Hz or asleep.
- **Perception at a lower rate than decisions:** raycast LOS every 0.3 to 0.5 s, cache the result.
- **Batch queries:** one `GetPartBoundsInRadius` around a player to find all nearby NPCs, instead of each NPC searching for players.
- **Despawn and recycle.** Pool NPC models instead of `Destroy()`/`Clone()` for each wave ([[Object Pooling Without Making a Mess]]).

## 8. A crowd budget worksheet (fill in for your game)

| Item | Budget | Measured |
|---|---|---|
| Max simultaneous Humanoid NPCs | 10 | |
| Max AnimationController NPCs near players | 80 | |
| Brain ticks per second (all NPCs) | 400 | |
| Path computations in flight | 4 | |
| Server Heartbeat time spent in AI | < 4 ms | |
| Client animated NPCs (near tier) | 30 | |
| Mobile client FPS in worst fight | > 30 | |

Fill the "Measured" column from Studio's server MicroProfiler and a real low-end phone. Budgets without measurement are wishes; see [[Performance Budget Template]].

## Common mistakes

- 150 zombies with full Humanoids and every state enabled.
- Unanchored NPCs near players, so ownership flips to clients and they rubber-band.
- Server `LoadAnimation` + `Play` on every crowd NPC.
- Per-NPC `while true do task.wait()` loops.
- Disabling `PreferLodEnabled` on all NPCs "to make them smoother".
- Procedural animation applied on throttled frames, causing jitter.
- Writing per-frame positions into attributes.
- Spawning/destroying models every wave instead of pooling.

## Checklist

- [ ] NPC tiers defined (hero / combat crowd / ambient) with counts.
- [ ] Combat crowd uses AnimationController + server mover or slim Humanoids.
- [ ] Animation played on clients from replicated attributes.
- [ ] Client LOD pass: animate near, stop far.
- [ ] `ClientAnimatorThrottling` left on; `PreferLodEnabled = false` only for heroes.
- [ ] `EvaluationThrottled` respected by procedural layers.
- [ ] Streaming mode set on NPC models; part counts minimal.
- [ ] Central scheduler with distance-tiered brain rates.
- [ ] Budget worksheet filled from real measurements.

---

**Related:** [[AI - Hub]] · [[Scalable NPC Horde Lab]] · [[NPCs tank server performance]] · [[NPC Tick Budgeter]] · [[Zombie Crowd Director Blueprint]] · [[Crowd and Encounter Director]]
