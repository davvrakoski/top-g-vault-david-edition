---
title: "Server authority techniques"
description: "Techniques for creating high-quality, smooth, multiplayer games using the server authority model."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects/server-authority/techniques"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Techniques for creating high-quality, smooth, multiplayer games using the server authority model.*

This guide outlines various techniques for creating high-quality, smooth, multiplayer games using the [[30 Official Roblox Docs/Projects/Server Authority/Server authority model|server authority model]].

## Predictive instance creation (instance stitching)

Instance **stitching** lets client scripts predictively create [[30 Official Roblox Docs/API Reference/Classes/Instance|Instances]] inside [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation|RunService:BindToSimulation()]] callbacks. The client creates the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] immediately without waiting for a server round‑trip; when the server's authoritative copy arrives, the client‑created instance and the server's authoritative copy are merged into one. From your script's perspective, the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] exists immediately and is consistent with the server.

Instance stitching is useful in cases where an instance must be visible and active on the client as soon as possible. While the server will eventually replicate any instance the client needs (along with any effects they had on the world), this process incurs at least one round‑trip of latency due to server communication. Examples include firing a rocket launcher and creating physics constraints — without stitching, the client will see the rocket pop in far away from them, or some jitter when the new constraints replicate to them.

### Technical behavior

Instance stitching works by generating the same deterministic GUID on both the client and the server. The GUID is derived from four inputs: the type of the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] being created, the source's identity (see below), the current simulation frame, and a per‑script call counter that resets each frame.

- For [[30 Official Roblox Docs/API Reference/Datatypes/Instance#new|Instance.new()]] — The source is the script itself (two scripts with the same text are considered different).
- For [[30 Official Roblox Docs/API Reference/Datatypes/Instance#fromExisting|Instance.fromExisting()]] — The source is the [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] that you're calling [[30 Official Roblox Docs/API Reference/Datatypes/Instance#fromExisting|Instance.fromExisting()]] on.
- For [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Instance:Clone()]] — Each cloned instance uses the source instance's GUID as the context seed.

If client and server agree on the inputs, they produce matching GUIDs and the stitch succeeds.

### Implementation

To utilize instance stitching, call [[30 Official Roblox Docs/API Reference/Datatypes/Instance#new|Instance.new()]], [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Instance:Clone()]], or [[30 Official Roblox Docs/API Reference/Datatypes/Instance#fromExisting|Instance.fromExisting()]] inside a [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation|BindToSimulation()]] callback from a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] that gets required on both the client **and** the server. Nothing else is required on your end; the system handles GUID assignment and reconciliation automatically.

You can freely set non-[[30 Official Roblox Docs/Projects/Server Authority/Server authority model#Simulation access|simulation access]] properties such as [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|Name]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|Size]], or [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] on an instance before it is parented into the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]].

```lua title="Simulation (ModuleScript) - Create Instance in a BindToSimulation() Callback"
local RunService = game:GetService("RunService")

local Simulation = {}

Simulation.Initialize = function()
	RunService:BindToSimulation(function(deltaTime)
		local part = Instance.new("Part")
		part.Name = "PredictedPart"
		part.Size = Vector3.new(2, 2, 2)
		part.Parent = workspace -- Part is now in the data model; any non-simulation access changes will error after this
		-- Part exists immediately on the client and will be reconciled with the server
	end)
end

return Simulation
```

[[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Instance:Clone()]] and [[30 Official Roblox Docs/API Reference/Datatypes/Instance#fromExisting|Instance.fromExisting()]] stitch correctly when the source instance was replicated to both client and server; both sides clone from matching source GUIDs and produce matching predicted GUIDs.

```lua title="Simulation (ModuleScript) - Clone Instance in a BindToSimulation() Callback"
local RunService = game:GetService("RunService")

local Simulation = {}

local sourceTemplate -- a replicated Instance

Simulation.Initialize = function()
	RunService:BindToSimulation(function(deltaTime)
		local cloned = sourceTemplate:Clone()
		cloned.Parent = workspace
		-- Cloned hierarchy is stitched with the server's authoritative copy
	end)
end

return Simulation
```

> [!warning]
> Instances created inside a simulation callback must be parented into the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] hierarchy before the end of that frame. Do not store a reference to a speculative instance and parent it in a subsequent frame.

## Position smoothing

You can visually smooth out the position of mispredicted synchronized objects by rendering a different object than what is being simulated.

1. Make the **simulated** object invisible.
2. Make a **renderer** object as a massless, non‑collidable, visual‑only clone to track the simulated object.
3. Attach a script to the renderer object that smoothly tracks the position of the invisible, simulated object. This separation between rendering and simulation lets you alter the position of the renderer object to create a visually smooth experience.

In the following sample [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], the rendered object (parent) smoothly tracks the simulated object. The rendered object is always slightly "behind" the simulated object which is typically fine but may be undesirable in certain situations.

```lua title="Smoothly Track BasePart Position with Renderer Part"
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Object to smoothly track
local smoothTarget:BasePart = workspace.SimulatedPart
-- Visual object that will be smoothed
local renderer:BasePart = script.Parent
-- Time to smooth over; smaller means faster
local smoothTime = 0.07
-- Store data needed to compute the smooth position
local smoothVelocity = Vector3.new()

-- Disable the renderer object's physics
renderer.Massless = true
renderer.Anchored = true
renderer.CanCollide = false

RunService.RenderStepped:Connect(function(deltaTime: number)
	-- Smoothly track the target object
	local smoothPosition, smoothVelocity = TweenService:SmoothDamp(
		renderer.Position,
		smoothTarget.Position,
		smoothVelocity,
		smoothTime,
		math.huge,
		deltaTime)
	renderer.Position = smoothPosition
end)
```

The [Soccer](https://www.roblox.com/games/110687099504272/Soccer-Server-Authority-Template) example game uses a variation of this technique to more intelligently turn on and off position smoothing for the soccer ball. Specifically, the soccer ball only smooths its position when the simulated ball has "jumped" far enough away from the rendered ball. This approach provides the best of both worlds: the soccer ball has no visual latency under normal conditions, and the game smoothly interpolates its position only after the simulated ball has unexpectedly jumped to a new location, likely due to a network artifact or server‑side change.

## Writing animation code

Under server authority, the client's simulation can be [[30 Official Roblox Docs/Projects/Server Authority/Server authority model#Rollback and resimulation|rolled back and resimulated]] when the server corrects a misprediction. During rollback, animation state is rewound, which means [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] handles that you cached in earlier frames may no longer be valid.

### Mirror animation logic

As with any core gameplay logic, the logic for controlling animations must be in sync between server and client or there may be mispredictions and jittery behavior. See [[30 Official Roblox Docs/Projects/Server Authority/Server authority model#Simulation sync|simulation sync]] for a pattern that binds functions through [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation|RunService:BindToSimulation()]] in a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] that's initialized on both the client and server.

### Avoid track caching

A common pattern in non-server-authority scripts is to cache [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] objects at load time and reuse them indefinitely. This pattern fails in a server authoritative game when the server corrects a misprediction and the client rewinds/replays its simulation with corrected data. If your script still holds a reference to a stopped or replaced track, calls like [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#AdjustWeight|AdjustWeight()]] or [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#AdjustSpeed|AdjustSpeed()]] will operate on a track that's no longer visually represented.

```lua title="Cache Tracks on Client (Unreliable)"
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")

-- Cache animation tracks
local tracks = {}
tracks["WalkForward"] = animator:LoadAnimation(walkForwardAnim)

RunService:BindToSimulation(function(dt: number)
	tracks["WalkForward"]:AdjustSpeed(1 + math.cos(time()))
end)
```

Instead of holding onto track objects, store the **animation IDs** (or [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] instances) and query the [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] for the live track whenever you need to interact with it. Two APIs are available for this:

- [[30 Official Roblox Docs/API Reference/Classes/Animator#GetTrackByAnimationId|Animator:GetTrackByAnimationId()]] — Returns the currently active track for a specific animation ID, or `nil` if there are no active animations with that ID. Use this when you know which specific animation you're looking for.
- [[30 Official Roblox Docs/API Reference/Classes/Animator#GetPlayingAnimationTracks|Animator:GetPlayingAnimationTracks()]] — Returns all active tracks (playing, fading out, or paused). Use this when you need to iterate over everything that's active (for example, to stop all animations or find tracks by some criteria).

#### CustomAnimate

[[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] named `CustomAnimate` in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]:

```lua title="CustomAnimate"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local CustomAnimate = {}

-- Store animation references (not loaded tracks)
local animations = {
	WalkForward = ReplicatedStorage.Animations.WalkForward,
}

local function getOrLoadTrack(animator: Animator, animation: Animation): AnimationTrack
	local track = animator:GetTrackByAnimationId(animation.AnimationId)
	if not track then
		track = animator:LoadAnimation(animation)
	end
	return track
end

CustomAnimate.SyncAnimations = function(character)
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:WaitForChild("Animator")

	RunService:BindToSimulation(function(dt: number)
		local walkTrack = getOrLoadTrack(animator, animations.WalkForward)
		if not walkTrack.isPlaying then
			walkTrack.Looped = true
			walkTrack.Priority = Enum.AnimationPriority.Core
			walkTrack:Play()
		end
		walkTrack:AdjustSpeed(1 + math.cos(time()))
	end)
end

return CustomAnimate
```

#### ServerSync

[[30 Official Roblox Docs/API Reference/Classes/Script|Script]] named `ServerSync` in [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]]:

```lua title="ServerSync"
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CustomAnimate = require(ReplicatedStorage.CustomAnimate)

local function onCharacterAdded(character)
	CustomAnimate.SyncAnimations(character)
end

local function onPlayerAdded(player)
	player.CharacterAdded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)
```

#### ClientSync

[[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] named `ClientSync` in [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]]:

```lua title="ClientSync"
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CustomAnimate = require(ReplicatedStorage.CustomAnimate)

local player = Players.LocalPlayer
local character = player.Character
if not character or character.Parent == nil then
	character = player.CharacterAdded:Wait()
end

CustomAnimate.SyncAnimations(character)
```

## Playing sounds and visual effects

In a predicted simulation, it's possible to trigger effects or sounds for events that the client predicted would happen but which never occurred on the server. The rendering system should be prepared to "undo" any mispredicted effects. For example, a client might predict that a grenade exploded and trigger a particle effect, but if another player defused the grenade, the client should hide the particle effect.

A good strategy for rendering a predicted simulation is to synchronize a state machine pattern within the simulation loop and render changes to the state in a render step function. The following example simulates a grenade with a state machine pattern:

```lua title="Simple State Machine for Tracking a Grenade (ModuleScript)"
local module = {}

module.GrenadeStates = {
	Idle = 0,
	Lit = 1,
	Exploded = 2,
	Defused = 3,
}
module.GrenadeExplodeTime = 3.0

module.Initialize = function(grenade)
	RunService:BindToSimulation(function(deltaTime)
		-- Initialize empty grenade state
		local grenadeState = grenade:GetAttribute("State")
		if grenadeState == nil then
			grenadeState = module.GrenadeStates.Idle
			grenade:SetAttribute("State", grenadeState)
			grenade:SetAttribute("Timer", 0.0)
		end

		-- Increment grenade timer
		local timer = grenade:GetAttribute("Timer")
		timer = timer + deltaTime
		grenade:SetAttribute("Timer", timer)

		-- Explode lit grenades
		if grenadeState == module.GrenadeStates.Lit then
			if timer >= module.GrenadeExplodeTime then
				grenadeState = module.GrenadeStates.Exploded
				grenade:SetAttribute("State", grenadeState)
				grenade:SetAttribute("Timer", 0.0)
			end
		end
	end)
end

return module
```

With the previous state machine in place, you can render grenade effects in a [[30 Official Roblox Docs/API Reference/Classes/RunService#RenderStepped|RunService.RenderStepped]] connection within a separate script based on the synchronized grenade state:

```lua title="Render Particles and Sounds based on the Synchronized Grenade State"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Simulation = require(ReplicatedStorage.Simulation)

local grenade = script.Parent
local previousGrenadeState = nil

-- Highlight instance to indicate grenade state
local highlight = Instance.new("Highlight")
highlight.Parent = grenade
highlight.FillTransparency = 1
highlight.OutlineTransparency = 1
highlight.DepthMode = Enum.HighlightDepthMode.Occluded

RunService.RenderStepped:Connect(function(deltaTime: number)
	local grenadeState = grenade:GetAttribute("State")
	local grenadeTimer = grenade:GetAttribute("Timer")

	-- Emit the lit particles if the grenade is lit
	grenade.LitEmitter.Enabled = grenadeState == Simulation.GrenadeStates.Lit
	-- Play the explosion emitter if the grenade just exploded
	if previousGrenadeState ~= grenadeState then
		if grenadeState == Simulation.GrenadeStates.Exploded and grenadeTimer < 0.2 then
			grenade.ExplosionEmitter:Emit(100)
			grenade.ExplosionSound:Play()
		end
		previousGrenadeState = grenadeState
	end 

	-- Change the grenade's highlight color based on the state and time
	if grenadeState == Simulation.GrenadeStates.Lit then
		highlight.FillColor = Color3.fromRGB(255, 0, 0)
		highlight.FillTransparency = 1 - (grenadeTimer / Simulation.GrenadeExplodeTime)
	elseif grenadeState == Simulation.GrenadeStates.Idle then
		highlight.FillTransparency = 1
	elseif grenadeState == Simulation.GrenadeStates.Exploded then
		highlight.FillTransparency = 1
	elseif grenadeState == Simulation.GrenadeStates.Defused then
		highlight.FillColor = Color3.fromRGB(0, 255, 125)
		highlight.FillTransparency = 0.5
	end
end)
```

## Designing around network latency

Certain gameplay mechanics lend themselves better to networked multiplayer than other mechanics. Players will always have some delay between when another player performs an action and when they receive that player's input. The best way to create a super smooth multiplayer game is to design your game with these limitations in mind.

For example, a game with slower acceleration on player movement will appear smoother than one with higher acceleration because the difference in position caused by the network latency of player input will be less than in a game with higher acceleration.

As another example, a gameplay mechanic where players can **instantly** trigger a large explosion by pressing an input will have more network artifacts than if the explosion is delayed after the input, as if by lighting a fuse. This puts the resimulation on the fuse effect instead of on the explosion effect which is a less noticeable network artifact.

## Predicting other player inputs

By default, Roblox does not forward the inputs from each client to every other client. Whether this is right for your game depends on its design:

- For basic humanoid movement, the default behavior means that other player characters' movements are not extrapolated from the authoritative server state and, as a result, other player characters will not mispredict but will render slightly in the past.
- In a racing game, by contrast, the default behavior means that clients will not know whether other players are applying the throttle or other inputs, so other cars may appear behind the local player even if they're actually ahead. To alleviate this, you can store player inputs in [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attributes]] on the server and operate on those synchronized attributes client‑side using [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToSimulation|RunService:BindToSimulation()]] as demonstrated in the following code sample and the [Racing](https://www.roblox.com/games/134686834388911/Racing-Server-Authority-Template) template. This approach lets you use attributes as inputs to your simulation to have fully replicated player inputs.

```lua title="Storing Player Input in Attributes (ModuleScript)"
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local module = {}

module.storePlayerInput = function(player:Player, humanoidRootPart:BasePart)
	local inputContext:InputContext = player.PlayerGui.InputContext
	local throttle = inputContext.DefuseAction:GetState()
	humanoidRootPart:SetAttribute("Throttle", throttle)
	-- Write any other inputs into attributes...

end

module.Initialize = function()
	RunService:BindToSimulation(function(deltaTime)
		if RunService:IsServer() then
			-- Forward inputs from server to all clients
			for _, player in Players:GetPlayers() do
				local humanoidRootPart:BasePart = player.Character.HumanoidRootPart
				local inputContext:InputContext = player.PlayerGui.InputContext
				module.storePlayerInput(player, humanoidRootPart)
			end
		else
			-- Write local player inputs as attributes
			local player = Players.LocalPlayer
			local humanoidRootPart:BasePart = player.Character.HumanoidRootPart
			local inputContext:InputContext = player.PlayerGui.InputContext
			module.storePlayerInput(player, humanoidRootPart)
		end

		-- Use the attributes as inputs to the game
		for _, player in Players:GetPlayers() do
			local humanoidRootPart:BasePart = player.Character.HumanoidRootPart
			local throttle = humanoidRootPart:GetAttribute("Throttle")
			if throttle then
				-- Apply the throttle to the player's vehicle
			end
		end
	end)
end)

return module
```

## Debugging

There are some new tools and techniques you can use to debug a server‑authoritative game.

### Server authority visualizer

Pressing <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>F6</kbd> (Windows) or <kbd>⌘</kbd><kbd>Shift</kbd><kbd>F6</kbd> (Mac) opens Studio's **server authority visualizer** which shows several key pieces of information:

| Details | Description |
| --- | --- |
| **Instance prediction success rate** | The percentage of correctly predicted instances over the last 8 seconds. |
| **Input accept rate** | The percentage of all players' inputs that arrived on time on the server. Late inputs will lower this number. |
| **Client-server step delta** | The number of frames between the client and the server, including the join time of the client. The stability of this number represents the stability of your connection to the server. |
| **RCC heartbeat FPS** | The frame rate of the simulation on the server. If this number drops below 59, the server cannot keep up with the simulation and the game will degrade in quality. |
| **Predicted instance count** | The number of instances your client is [[30 Official Roblox Docs/Projects/Server Authority/Server authority model#Client prediction\|predicting]]. |
| **Input drop reason counts** | The number of times the server has dropped an input for each reason:<br>- **[x] too old** — The inputs arrived late, meaning your network worsened or the client could not keep up with the simulation.<br>- **[x] out of order** — A networking bug occurred that caused your inputs to be rearranged and discarded.<br>- **[x] buffer full** — The server could not buffer your input. Either your network suddenly improved or the server could not keep up with the simulation. |

### Simulation radius

When relying on automatic prediction ([[30 Official Roblox Docs/API Reference/Enums/PredictionMode|Enum.PredictionMode.Automatic]]), you can visualize the prediction radius around your player character by enabling **Are Regions Enabled** in Studio's settings (<kbd>Alt</kbd><kbd>S</kbd> on Windows; <kbd>⌥</kbd><kbd>S</kbd> on Mac). The green cylinder indicates the range around your character in which instances are predicted, and its radius grows and shrinks based on the performance characteristics of the device.

*(image in the full Top G Vault)*

---
*Source: [Server authority techniques](https://create.roblox.com/docs/projects/server-authority/techniques) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
