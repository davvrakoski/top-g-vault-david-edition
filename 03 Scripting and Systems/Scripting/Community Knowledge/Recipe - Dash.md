---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Dash"
tags: [roblox, community-knowledge, scripting, recipe, luau, movement, dash, linearvelocity, cooldown]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/constraints/linear-velocity
  - https://create.roblox.com/docs/reference/engine/classes/LinearVelocity
  - https://create.roblox.com/docs/reference/engine/classes/ContextActionService
  - https://create.roblox.com/docs/scripting/security/client-server-boundary
---
# Recipe - Dash

Press Q (or a touch button, or ButtonX on a gamepad) to burst a few studs in the direction you are moving, with a cooldown. Battlegrounds, roguelikes and parkour games all use some version. This recipe uses a short-lived `LinearVelocity` instead of the deprecated `BodyVelocity`, and shows how the server can still own the parts that matter (i-frames, damage) while the movement itself stays on the client.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Script | Type | Location |
|---|---|---|
| `Dash` | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| `DashServer` | Script | `ServerScriptService` |
| `DashEvent` | RemoteEvent | `ReplicatedStorage` (created by `DashServer`) |

## Client: the burst
```lua
-- StarterPlayerScripts/Dash (LocalScript)
local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local DASH_SPEED = 70      -- studs per second during the burst
local DASH_TIME = 0.18     -- seconds; 70 * 0.18 = about 12.6 studs
local COOLDOWN = 1.0

local player = Players.LocalPlayer
local dashEvent = ReplicatedStorage:WaitForChild("DashEvent") :: RemoteEvent
local lastDash = -math.huge

local function dash()
	if os.clock() - lastDash < COOLDOWN then return end
	local character = player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	local root = humanoid and humanoid.RootPart
	if not root or humanoid.Health <= 0 or humanoid.SeatPart then return end

	-- dash where the stick/keys point; fall back to where the character faces
	local dir = humanoid.MoveDirection
	if dir.Magnitude < 0.1 then
		dir = root.CFrame.LookVector
	end
	dir = Vector3.new(dir.X, 0, dir.Z)
	if dir.Magnitude < 0.01 then return end
	dir = dir.Unit
	lastDash = os.clock()

	local attachment = Instance.new("Attachment")
	attachment.Name = "DashAttachment"
	attachment.Parent = root

	local mover = Instance.new("LinearVelocity")
	mover.Attachment0 = attachment
	mover.RelativeTo = Enum.ActuatorRelativeTo.World
	mover.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
	mover.VectorVelocity = dir * DASH_SPEED -- Y = 0 holds height: an "air dash"
	mover.MaxForce = root.AssemblyMass * 4000
	mover.Parent = root

	dashEvent:FireServer() -- tell the server, so it can grant i-frames
	task.delay(DASH_TIME, function()
		mover:Destroy()
		attachment:Destroy()
	end)
end

ContextActionService:BindAction("Dash", function(_, state)
	if state == Enum.UserInputState.Begin then
		dash()
	end
	return Enum.ContextActionResult.Sink
end, true, Enum.KeyCode.Q, Enum.KeyCode.ButtonX)
ContextActionService:SetTitle("Dash", "Dash")
```

## Server: cooldown and i-frames
The server never moves the character (the client owns it). It only decides whether this dash earns invulnerability, using its own clock.
```lua
-- ServerScriptService/DashServer (Script)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SERVER_COOLDOWN = 0.9   -- slightly below the client's 1.0 to absorb network jitter
local IFRAME_TIME = 0.25

local dashEvent = Instance.new("RemoteEvent")
dashEvent.Name = "DashEvent"
dashEvent.Parent = ReplicatedStorage

local lastDash: {[Player]: number} = {}

dashEvent.OnServerEvent:Connect(function(player)
	local now = os.clock()
	if now - (lastDash[player] or 0) < SERVER_COOLDOWN then
		return -- too fast: ignore (do not kick; lag can bunch events)
	end
	lastDash[player] = now
	local character = player.Character
	if not character then return end
	character:SetAttribute("Invulnerable", true)
	task.delay(IFRAME_TIME, function()
		if character.Parent then
			character:SetAttribute("Invulnerable", false)
		end
	end)
end)

Players.PlayerRemoving:Connect(function(player)
	lastDash[player] = nil
end)
```
Your damage code then skips targets where `character:GetAttribute("Invulnerable")` is true.

## How to test
1. Play, walk and press Q: a quick slide of about 12 studs. Press Q again at once: nothing until 1 s passes.
2. Jump and dash: you travel flat in the air (because Y velocity is held at 0). For a ground-only dash, return early when `humanoid.FloorMaterial == Enum.Material.Air`.
3. Start a server + client test, select your character on the server and watch the `Invulnerable` attribute flick on and off.
4. Dash into a wall: you should stop, not fling. If you fling, lower `MaxForce`.

## Common mistakes
- **`BodyVelocity` / `BodyPosition`.** Deprecated; use `LinearVelocity` / `AlignPosition` (see [[Deprecated Roblox APIs and Their Modern Replacements]]).
- **`MaxForce = math.huge`.** Works until the player hits a wall corner and gets launched. Scale with `AssemblyMass`.
- **Forgetting to destroy the mover** when the character dies mid-dash: `task.delay` still runs, and `Destroy` on an already-destroyed instance is harmless, so the pattern above is safe.
- **Server cooldown equal to the client one.** Packets arrive bunched; keep the server window a little shorter, as above.
- For knockback on other players (which the server *does* apply) see [[Smooth Knockback - What Works for All Clients]].

## Related
[[Scripting - Hub]] · [[Recipe - Double Jump]] · [[Choosing Mover Constraints - AlignPosition, LinearVelocity and Friends]] · [[Recipe - Server-Side Cooldowns and Rate Limits]]
