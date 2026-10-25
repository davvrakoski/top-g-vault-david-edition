---
area: "07 AI and Combat"
cluster: "AI"
tags: [deep-dive, roblox, ai, pathfinding, npc]
cssclasses: [tg-a07]
---

# Enemy AI Pathing Loop with PathfindingService

> **Why this matters:** The official pathfinding sample walks one character to one static point. Enemies chase *moving* players, get blocked by doors, fall off ledges and run on servers with 50 other NPCs.
> This note turns `PathfindingService` into a production chase loop: direct movement when possible, throttled repaths when needed, stuck recovery, and server-owned physics.

---

## 1. Facts from the docs you must design around

- `PathfindingService:CreatePath(agentParameters)` takes `AgentRadius` (default 2), `AgentHeight` (5), `AgentCanJump` (true), `AgentCanClimb` (false, climbs `TrussPart`s), `WaypointSpacing` (4; `math.huge` = no intermediate waypoints) and `Costs` (material names or `PathfindingModifier` labels → cost; `math.huge` = forbidden).
- `Path:ComputeAsync(start, finish)` **yields** and can fail. Always `pcall` it and check `path.Status == Enum.PathStatus.Success`.
- Each `PathWaypoint` has `Position`, `Action` (`Walk`, `Jump`, `Custom`) and `Label` (for `PathfindingLink`s and climbing).
- `Path.Blocked` fires with the index of a blocked waypoint; re-compute only if it is **ahead** of the agent.
- Limits: straight-line start-to-finish distance must not exceed **3,000 studs**, and a computation may exhaust a **20,000-node** budget earlier in complex maps.
- `Humanoid:MoveTo()` times out after **8 seconds** if the goal is not reached; calling it again resets the timer. It also ends if a script changes the root part's `CFrame`.
- Under instance streaming, client-side pathfinding can fail if the destination is not streamed in; server-side is unaffected.

## 2. The loop, in plain words

Every NPC brain tick (not every frame; see section 7):

1. **Pick a target** (perception: [[NPC Vision and Hearing Model]]).
2. **Line of sight + flat ground to target?** Move straight at it with `MoveTo`. No path needed. This covers most of a chase in open areas and saves almost all pathfinding cost.
3. **Otherwise**, if there is no path, the path is stale (target moved more than N studs from the path's end), or the path is blocked, **request a repath**, throttled.
4. **Follow waypoints**: `MoveTo` the next waypoint; on arrival advance; on `Jump` action, jump; on custom labels, run the custom action.
5. **Stuck check**: if the NPC has not made progress for ~1 s, jump, then repath, then (as a last resort) teleport a few studs back onto the last good waypoint.

## 3. Server setup: ownership first

NPC jitter is usually not pathfinding. It is network ownership flipping between the server and nearby players. Pin NPCs to the server:

```lua
local function pinToServer(model: Model)
	for _, part in model:GetDescendants() do
		if part:IsA("BasePart") and not part.Anchored then
			part:SetNetworkOwner(nil)
		end
	end
end
```

Call it after the NPC is parented to `workspace` (ownership calls on parts not in the world error). See [[Vehicle jitters - wrong player controls physics]] for the same root cause in vehicles.

## 4. The chase controller

```lua
--!strict
-- ServerScriptService/AI/ChaseController.lua
local PathfindingService = game:GetService("PathfindingService")
local Workspace = game:GetService("Workspace")

local ChaseController = {}
ChaseController.__index = ChaseController

local REPATH_MIN_INTERVAL = 0.6   -- seconds between path computations per NPC
local TARGET_MOVED_REPATH = 6     -- studs the target can move before the path is stale
local WAYPOINT_REACHED = 2.5      -- studs (horizontal) to count a waypoint as reached
local STUCK_TIME = 1.0
local STUCK_MIN_PROGRESS = 1.0    -- studs per STUCK_TIME

function ChaseController.new(model: Model)
	local self = setmetatable({}, ChaseController)
	self.model = model
	self.humanoid = model:FindFirstChildOfClass("Humanoid") :: Humanoid
	self.root = model:FindFirstChild("HumanoidRootPart") :: BasePart
	self.path = PathfindingService:CreatePath({
		AgentRadius = 2,
		AgentHeight = 5,
		AgentCanJump = true,
		AgentCanClimb = false,
		WaypointSpacing = 4,
		Costs = {
			Water = 20,
			DangerZone = math.huge,   -- PathfindingModifier label: never enter
			Door = 2,                 -- PathfindingModifier with PassThrough on doors
		},
	})
	self.waypoints = {} :: { PathWaypoint }
	self.index = 0
	self.pathGoal = nil :: Vector3?
	self.lastRepath = -math.huge
	self.computing = false
	self.lastProgressPos = self.root.Position
	self.lastProgressTime = os.clock()

	self.losParams = RaycastParams.new()
	self.losParams.FilterType = Enum.RaycastFilterType.Exclude
	self.losParams.FilterDescendantsInstances = { model }

	self.path.Blocked:Connect(function(blockedIndex: number)
		if blockedIndex >= self.index then
			self.waypoints = {}
			self.index = 0
		end
	end)
	return self
end

function ChaseController:hasDirectRoute(targetPos: Vector3): boolean
	local from = self.root.Position
	local delta = targetPos - from
	if math.abs(delta.Y) > 3 then return false end           -- different floor: use a path
	if delta.Magnitude > 80 then return false end            -- far: use a path
	local hit = Workspace:Raycast(from, delta, self.losParams)
	if hit and not hit.Instance:IsDescendantOf(self.targetModel or Workspace.Terrain) then
		return false
	end
	-- cheap "is there floor halfway" check to avoid walking off ledges
	local mid = from + delta * 0.5
	local floor = Workspace:Raycast(mid + Vector3.new(0, 2, 0), Vector3.new(0, -8, 0), self.losParams)
	return floor ~= nil
end

function ChaseController:requestPath(goal: Vector3)
	local now = os.clock()
	if self.computing or now - self.lastRepath < REPATH_MIN_INTERVAL then return end
	self.computing = true
	self.lastRepath = now
	task.spawn(function()
		local ok, err = pcall(function()
			self.path:ComputeAsync(self.root.Position, goal)
		end)
		self.computing = false
		if not self.model.Parent then return end
		if ok and self.path.Status == Enum.PathStatus.Success then
			self.waypoints = self.path:GetWaypoints()
			self.index = math.min(2, #self.waypoints) -- waypoint 1 is the start position
			self.pathGoal = goal
		else
			self.waypoints = {}
			self.index = 0
			self.pathGoal = nil
			if not ok then warn("ComputeAsync failed:", err) end
		end
	end)
end

function ChaseController:followPath()
	local wp = self.waypoints[self.index]
	if not wp then return end
	local flat = Vector3.new(1, 0, 1)
	if ((wp.Position - self.root.Position) * flat).Magnitude < WAYPOINT_REACHED then
		self.index += 1
		wp = self.waypoints[self.index]
		if not wp then return end
	end
	if wp.Action == Enum.PathWaypointAction.Jump then
		self.humanoid.Jump = true
	elseif wp.Action == Enum.PathWaypointAction.Custom then
		-- PathfindingLink labels arrive here, e.g. wp.Label == "Ladder" or "UseBoat"
	end
	self.humanoid:MoveTo(wp.Position) -- re-issuing each tick also resets the 8 s timeout
end

function ChaseController:checkStuck()
	local now = os.clock()
	if now - self.lastProgressTime < STUCK_TIME then return end
	local moved = (self.root.Position - self.lastProgressPos).Magnitude
	if moved < STUCK_MIN_PROGRESS then
		self.humanoid.Jump = true
		self.waypoints = {}
		self.index = 0
		self.lastRepath = -math.huge -- allow an immediate repath
	end
	self.lastProgressPos = self.root.Position
	self.lastProgressTime = now
end

-- Call this from the AI scheduler at 5 to 10 Hz per NPC.
function ChaseController:Tick(targetModel: Model?)
	self.targetModel = targetModel
	local targetRoot = targetModel and targetModel:FindFirstChild("HumanoidRootPart") :: BasePart?
	if not targetRoot then
		self.humanoid:MoveTo(self.root.Position) -- stop
		return
	end
	local goal = targetRoot.Position

	if self:hasDirectRoute(goal) then
		self.waypoints = {}
		self.index = 0
		self.humanoid:MoveTo(goal)
	else
		local stale = self.pathGoal == nil or (goal - self.pathGoal).Magnitude > TARGET_MOVED_REPATH
		if #self.waypoints == 0 or stale then
			self:requestPath(goal)
		end
		self:followPath()
	end
	self:checkStuck()
end

return ChaseController
```

## 5. Modifiers and links: designing the map for AI

- **`PathfindingModifier`** on an invisible, non-colliding, anchored part marks a region with a `Label`. Put the label in `Costs`. `math.huge` forbids the region (lava, traps, player bases).
- **`PassThrough`** on a modifier makes pathfinding ignore the part as an obstacle. Use it for doors that NPCs can open.
- **`PathfindingLink`** connects two `Attachment`s (`Attachment0`/`Attachment1`, optional `IsBidirectional`) across gaps the navmesh cannot: ladders, jump pads, boats, teleporters. Its `Label` must appear in `Costs` with a value, and the waypoint arriving at the link carries that label so your code can run the custom traversal.
- **Navigation visualization:** turn on navigation mesh and labels in Studio's visualization options to see what the pathfinder sees. Fix map geometry before tweaking code.

## 6. Multiple agent sizes

A `Path` object bakes in its agent parameters. Create **one path object per agent type** (zombie, brute, crawler), not per NPC call, and reuse it per NPC. A brute with `AgentRadius = 4` cannot use 6-stud corridors that a normal zombie uses; that is a level design decision, not a bug.

## 7. Server budget

- Brain ticks at **5 to 10 Hz**, staggered across NPCs, from one scheduler (see [[Scalable NPC Update Scheduler]] and [[NPC Tick Budgeter]]). Never one `while true do` loop per NPC with its own `task.wait`.
- **Limit concurrent `ComputeAsync` calls** (for example 4 in flight server-wide). Queue the rest. Under load, prioritize NPCs close to players.
- **Share paths for packs:** 10 zombies chasing the same player from the same room can follow one leader's path with offsets.
- **Direct-route first** eliminates most path requests.
- Distant NPCs (no player within ~150 studs) should idle or move along cheap precomputed patrol routes, not pathfind.

## 8. Patrols and leashing

Patrol routes are lists of points authored in Studio (parts in a folder, ordered by name). Compute paths between consecutive points **once** at server start and cache the waypoints. When an NPC loses its target, return along a cached route.

Leash: if the NPC gets more than `LEASH` studs from its spawn, drop the target and return. This prevents players from kiting a boss across the map and breaks most exploit-farms.

## Common mistakes

- No `pcall` around `ComputeAsync`.
- Recomputing the path every frame for a moving target.
- Forgetting `SetNetworkOwner(nil)`, so NPCs stutter near players.
- Using `MoveToFinished:Wait()` per waypoint in a loop that never handles the 8 s timeout or a blocked path.
- One `CreatePath` call per computation instead of reusing the path object per agent type.
- Ignoring `Path.Status` values like `NoPath` and walking into walls.
- Pathfinding when the target is in plain sight on flat ground.
- Client-side pathfinding to a part that is not streamed in.

## Checklist

- [ ] NPC parts server-owned.
- [ ] Path objects created once per agent type with correct radius/height/costs.
- [ ] Direct-route check before pathfinding.
- [ ] Repath throttle and staleness threshold.
- [ ] `Blocked` handled only for waypoints ahead.
- [ ] Jump and custom (link) waypoints handled.
- [ ] Stuck detection with jump/repath/recover.
- [ ] Global cap on concurrent path computations.
- [ ] Modifiers and links placed; navmesh visualized in Studio.

---

**Related:** [[AI - Hub]] · [[Pathfinding Engineering]] · [[AI gets stuck or loops]] · [[NPC AI Framework]] · [[Production NPC State Machine]] · [[NPCs tank server performance]]
