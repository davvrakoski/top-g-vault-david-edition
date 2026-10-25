---
title: "Techniques and conversion"
description: "Step‑by‑step guidelines on implementing instance streaming in a non‑streaming game, as well as techniques for using it efficiently and effectively."
area: "30 Official Roblox Docs"
cluster: "Workspace"
source: "https://create.roblox.com/docs/workspace/streaming/techniques"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Step‑by‑step guidelines on implementing instance streaming in a non‑streaming game, as well as techniques for using it efficiently and effectively.*

This guide outlines several techniques for using in-game [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|instance streaming]] efficiently and effectively. While there's no "one size fits all" solution for designing a streaming game, following these high‑level steps will get you most of the way there.

> [!success]
> If you are converting a non-streaming game to streaming, be sure to check out the [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#AI streaming conversion skill|AI streaming conversion skill]] which can convert games to streaming automatically.

## Streaming properties

Once [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|StreamingEnabled]] is toggled on for the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] object in Studio, set its related properties to the following recommended values:

| Property | Recommendation |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#EnableSLIMAvatars\|EnableSLIMAvatars]] | Use [[30 Official Roblox Docs/API Reference/Enums/RolloutState\|Enabled]] to render R15 avatars as lightweight, animated stand‑ins when appropriate. See [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#SLIM avatars\|SLIM avatars]] for more info. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#ModelStreamingBehavior\|ModelStreamingBehavior]] | Use [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingBehavior\|Improved]] to enable the most efficient streaming for [[30 Official Roblox Docs/API Reference/Classes/Model\|Models]] with [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] descendants. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingIntegrityMode\|StreamingIntegrityMode]] | Use [[30 Official Roblox Docs/API Reference/Enums/StreamingIntegrityMode\|PauseOutsideLoadedArea]] to balance gameplay integrity without pausing unnecessarily or too often. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingMinRadius\|StreamingMinRadius]] | Use the default of `64` to maximize how much the engine can scale the game down for low‑end devices. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius\|StreamingTargetRadius]] | Use the default of `1024` to strike a good balance between visibility for players on high‑end devices and a reasonable memory footprint. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamOutBehavior\|StreamOutBehavior]] | Use [[30 Official Roblox Docs/API Reference/Enums/StreamOutBehavior\|Opportunistic]] to allow the client to aggressively garbage collect content, significantly reducing memory usage and helping prevent out‑of‑memory crashes. |

## Model level-of-detail

[[30 Official Roblox Docs/API Reference/Classes/Model#LevelOfDetail|Model.LevelOfDetail]] helps fill in non‑streamed [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] content with lightweight composite or imposter meshes, making the world look visually complete. [[30 Official Roblox Docs/Workspace/Streaming/SLIM|SLIM]] (Scalable Lightweight Interactive Models) are particularly effective, as players often cannot distinguish a SLIM mesh from the fully streamed‑in original.

For best results:

- Group parts that are spatially and logically related, for example all the parts of a car.
- Set [[30 Official Roblox Docs/API Reference/Classes/Model#LevelOfDetail|LevelOfDetail]] to [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|SLIM]] on models that contain **static** meshes and parts. Models that are modified at runtime or play animations are not supported.
- Keep the spatial extent of each model under ~64 cubic studs to increase the likelihood that the entire actual model streams in together. If a model has very large extents, break it up into smaller modular models and apply an appropriate [[30 Official Roblox Docs/API Reference/Classes/Model#LevelOfDetail|LevelOfDetail]] to each one.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|Disabled]]/[[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|Automatic]]*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|SLIM]]*

## Model structure

Beyond setting [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Model level-of-detail|model level‑of‑detail]], the structure and settings of your [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] has a significant impact on how well streaming performs. As you build out or convert an existing game:

- **Use atomic models for logical grouping** — When a script needs access to all of the parts within a model, set its [[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode|ModelStreamingMode]] to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Atomic]]. This allows client‑side scripts to safely access instances inside the model without excessive use of [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]] (although such scripts must still use [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]] for the overall atomic model).

	> [!info]
	> Atomicity guarantees apply only during initial replication. Once an atomic model has been replicated to the client, any **new** instances added under that model are **not** replicated atomically and are instead streamed according to normal [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Technical behavior|streaming behavior]]. Systems that dynamically modify atomic models must handle late‑arriving instances explicitly where necessary.

- **Minimize persistent models** — [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Persistent|Persistent]] models load after join and never stream out, permanently occupying memory. Set a model's [[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode|ModelStreamingMode]] to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Persistent]] only if it **must** remain available and accessible to scripts at all times.

- **Decompose container models** — A common non‑streaming pattern is a single huge [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] that contains many NPCs, props, or similar groupings. Under streaming, container models decrease streaming efficiency and they aren't optimal for [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Model level-of-detail|model level‑of‑detail]] which works best with closely grouped instances. Decompose container models into smaller models with physically close or logically related parts.

- **Flatten deeply nested model hierarchies** — Nesting a [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Persistent|persistent]] model inside an [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Atomic|atomic]] model effectively forces the atomic model to behave as persistent. Flat hierarchies are easier to reason about under streaming.

## SLIM avatars

Platform avatars outside of the currently streamed area are not visible by default, but enabling [[30 Official Roblox Docs/API Reference/Classes/Workspace#EnableSLIMAvatars|Workspace.EnableSLIMAvatars]] renders R15 avatars as lightweight, animated stand‑ins when appropriate. Effectively, the engine:

- Renders a SLIM version when an actual avatar model streams out.
- Swaps between SLIM and full-resolution representations based on available resources, even inside the streaming radius.
- Throttles SLIM animations based on scene importance and available bandwidth.

SLIM avatars support R15 player characters with a body, dynamic head, [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Standard R15 rigs|standard]] or [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Advanced R15 rigs|advanced]] R15 rig, and rigid/layered accessories. R6 avatars, NPCs, and avatars with custom proportions are excluded. For the full list of supported and excluded avatar configurations, performance data, and troubleshooting tips, see [[30 Official Roblox Docs/Workspace/Streaming/SLIM|SLIM avatars]].

## Script patterns

The following script patterns are most commonly affected by streaming. The correct strategy depends on the intent of the code, so each pattern lists multiple options where appropriate.

### Direct index to descendants

Indexing into [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] descendants with the `.` operator throws an error if any instance in the path isn't currently streamed in. The same applies to [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChild|FindFirstChild()]], [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChildWhichIsA|FindFirstChildWhichIsA()]], and [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChildOfClass|FindFirstChildOfClass()]] which return `nil` if the child has not streamed in.

```lua title="Descendant Lookup"
local house1 = workspace:FindFirstChild("House1") -- nil if "House1" has not streamed in
local door = workspace.House1.Door -- Broken if "House1" or "Door" has not streamed in
```

A similar pattern is accessing the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] or other character descendants directly inside a [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAdded|Player.CharacterAdded]] connection. Under streaming, the character model is parented to [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] before all of its descendants have replicated, so direct indexing fails.

```lua title="Character Descendants"
local Players = game:GetService("Players")

local player = Players.LocalPlayer

player.CharacterAdded:Connect(function(character)
	local humanoid = character.Humanoid
end)
```

#### Strategy 1

If the script cannot make progress without an instance, wait for it with [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]]:

```lua title="Descendant Lookup"
local house1 = workspace:WaitForChild("House1")
local door = house1:WaitForChild("Door")
```

#### Strategy 2

When an instance may not be streamed in but the script can proceed without it, `nil`‑check with [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChild|Instance:FindFirstChild()]].

```lua title="Descendant Lookup"
local house1 = workspace:FindFirstChild("House1")
local door = house1 and house1:FindFirstChild("Door")
if door then
	door.Color = Color3.new(1, 0, 0)
end
```

#### Strategy 3

Make the parent a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], set its [[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode|ModelStreamingMode]] to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Atomic]], and place objects like `Door` as descendants. The engine guarantees all of the **initial** descendants are present once the atomic model itself is available, but you'll still need to use [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]] on the model itself, as well as instances added to the model **after** it's been replicated.

```lua title="Descendant Lookup"
local house1 = workspace:WaitForChild("House1")

-- House model is atomic; its initial descendants are guaranteed to be present
local door = house1.Door
```

### Instances sent remotely

A [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]]/[[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] signal and the instance it refers to travel independently, so the signal can arrive on the client before the instance is present — or the instance may never be present at all. Two likely causes include:

- Under streaming, there may be a slight delay between when a part/model is created on the server and when it gets replicated to clients. Effectively, a part referenced by a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]]/[[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] may simply not exist yet, even inside a streamed area.

- Sending a part/model reference from server to client through a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] or [[30 Official Roblox Docs/API Reference/Classes/RemoteFunction|RemoteFunction]] requires that the instance is replicated to the receiving client. Sending an instance path as a string has the same issue, as the path may resolve to a non‑existent location on the client:

	```lua title="Client Script"
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local remoteEvent = ReplicatedStorage:FindFirstChildOfClass("RemoteEvent")

	remoteEvent.OnClientEvent:Connect(function(data)
		local checkpoint = data.checkpoint -- Errors if "checkpoint" isn't streamed in
		local level = workspace.Levels[data.levelPath] -- Errors if path isn't streamed in
	end)
	```

#### Strategy 1

If the receiving client script needs the instance to proceed, include [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]] before using it. Note that this can yield indefinitely if the instance never streams in, so consider adding a timeout as the second parameter of [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]].

#### Strategy 2

Pre‑fetch the area with [[30 Official Roblox Docs/API Reference/Classes/Player#RequestStreamAroundAsync|Player:RequestStreamAroundAsync()]] before firing the event. This makes it likely (though not guaranteed) that the instance is present when the client receives the event. See [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Proactive streaming|proactive streaming]].

#### Strategy 3

If the script can tolerate the instance being absent for some clients, simply `nil`‑check with [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstChild|Instance:FindFirstChild()]] and skip the work for those clients.

### Client desynchronization

Client‑side desynchronization should be treated as an exception, not a standard design pattern. Introducing client‑only copies or reparenting instances locally can create serious issues. Audit your code for places which rely on these types of changes persisting on the client.

For example, reparenting an instance locally from [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] to [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] can make that instance eligible to be streamed out. Similarly,
cloning an instance locally ([[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Instance:Clone()]]) from [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] into [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] creates a client‑only copy that is no longer part of the server replication pipeline and will not receive property updates from the original server‑owned instance.

The same concept applies when calling [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]] on the client for a server‑owned object. This removes the instance locally but the server still has it, so it will stream in again with its original state when eligible.

### Proactive streaming

When a player's next destination can be anticipated, make server‑side calls to [[30 Official Roblox Docs/API Reference/Classes/Player#RequestStreamAroundAsync|Player:RequestStreamAroundAsync()]] to stream in transient areas for temporary loading, or use [[30 Official Roblox Docs/API Reference/Classes/Player#AddReplicationFocus|Player:AddReplicationFocus()]] on a **limited** basis for areas that should remain loaded until explicitly released.

For example, when a player character is about to teleport by [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] change to another player's house in a distant location, you can pre‑fetch the destination area to minimize pop‑in and provide a smoother transition. The following script shows how a client-to-server [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|remote event]] can be fired to move a player character using a pre-fetching method. If the pre-fetch request is successful when the function returns, the minimum radius around the target location should be present on the client.

```lua title="Server Script - Teleport Player Character"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local teleportEvent = ReplicatedStorage:WaitForChild("TeleportEvent")

local function teleportPlayer(player, teleportTarget)
	-- Request streaming around target location
	player:RequestStreamAroundAsync(teleportTarget)

	-- Teleport character
	local character = player.Character
	if character and character.Parent then
		local currentPivot = character:GetPivot()
		character:PivotTo(currentPivot * CFrame.new(teleportTarget))
	end
end

-- Call teleport function when the client fires the remote event
teleportEvent.OnServerEvent:Connect(teleportPlayer)
```

### Instance property reads

Once an instance streams out, its property updates are no longer replicated to that client. Reading properties such as [[30 Official Roblox Docs/API Reference/Classes/BasePart#Position|BasePart.Position]] continue to succeed but return the last replicated value which can be arbitrarily stale.

```lua
local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- Position may be stale if "target" has streamed out
local dist = (target.Position - player.Character.HumanoidRootPart.Position).Magnitude
```

#### Strategy 1

Move the logic to the server, as server‑side scripts see all instances at all times. This is generally the most reliable option for distance checks and other position‑sensitive logic.

#### Strategy 2

Detect stream out using [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Signal change handling|signal change]] detection, or test [[30 Official Roblox Docs/API Reference/Classes/Instance#FindFirstAncestorWhichIsA|Instance:FindFirstAncestorWhichIsA("Workspace")]] as `false` to skip the stale property check for instances no longer present.

#### Strategy 3

If the part must always be available, group it inside a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] and set the model's [[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode|ModelStreamingMode]] to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Persistent]]. Use this approach sparingly, as persistent models never stream out and permanently occupy memory.

### Waiting on the critical path

Some non‑streaming games load their map by cloning it from [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] into [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], then wait for it on the client before dismissing a loading screen and signaling readiness. Under streaming this hangs indefinitely — the client's character hasn't spawned yet, so there's no [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Replication focus|replication focus]], and the spatial map instance never streams in.

#### Strategy 1

Move the loading screen logic so that it doesn't depend on a specific spatial instance being present, for example by signaling readiness once the character has spawned and the immediate surrounding area is streamed in.

#### Strategy 2

Call [[30 Official Roblox Docs/API Reference/Classes/Player#AddReplicationFocus|Player:AddReplicationFocus()]] at the desired spawn location to give the client a [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Replication focus|replication focus]] before the character spawns.

### Signal change handling

Signals such as [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildAdded|Instance.ChildAdded]]/[[30 Official Roblox Docs/API Reference/Classes/Instance#ChildRemoved|Instance.ChildRemoved]] and [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]] signals like [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceAddedSignal|GetInstanceAddedSignal()]] or [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceRemovedSignal|GetInstanceRemovedSignal()]] also fire on stream in/out, indistinguishable from real spawns/removals. Receiving scripts can't tell the difference from the signal alone, so logic which assumes a signal corresponds to a "real" event needs to be updated.

#### Strategy 1

Audit scripts for any signal listeners that could break or change significantly when triggered by stream in and/or stream out. For example, if you play audio or visual effects when an enemy NPC initially spawns into the world, assign each enemy an [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attribute]] such as `Spawned` on the first spawn, and skip replaying the same audio/effects in future stream‑ins of the enemy.

```lua title="Attribute Tracking"
local CollectionService = game:GetService("CollectionService")

local TAG_NAME = "Enemy"

CollectionService:GetInstanceAddedSignal(TAG_NAME):Connect(function(enemy)
	if not enemy:GetAttribute("Spawned") then
		-- Set "Spawned" attribute on enemy for initial spawn
		enemy:SetAttribute("Spawned", true)

		-- Play audio/visual effects for this initial spawn
		playSpawnEffects(enemy)
	end
end)
```

#### Strategy 2

Assign a logical [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]] tag to all of the affected objects using [[30 Official Roblox Docs/API Reference/Classes/CollectionService#AddTag|AddTag()]] or the [[30 Official Roblox Docs/Studio/Properties window#Instance tags|Tags]] section of an instance's properties in Studio. Then, from a client‑side script, detect when a tagged object streams in or out through [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceAddedSignal|GetInstanceAddedSignal()]] and [[30 Official Roblox Docs/API Reference/Classes/CollectionService#GetInstanceRemovedSignal|GetInstanceRemovedSignal()]] and handle the object accordingly.

```lua title="Tagged Object Streaming Detection"
local CollectionService = game:GetService("CollectionService")

local TAG_NAME = "FlickerLightSource"

local random = Random.new()
local flickerSources = {}

-- Detect tagged parts currently streamed in
for _, light in CollectionService:GetTagged(TAG_NAME) do
	flickerSources[light] = true
end

-- Detect new tagged parts streaming in or out
CollectionService:GetInstanceAddedSignal(TAG_NAME):Connect(function(light)
	flickerSources[light] = true
end)
CollectionService:GetInstanceRemovedSignal(TAG_NAME):Connect(function(light)
	flickerSources[light] = nil
end)

-- Flicker loop
while true do
	for light in flickerSources do
		light.Brightness = 8 + random:NextNumber(-0.4, 0.4)
	end
	task.wait(0.05)
end
```

### Iteration over collections

Client-side collection iterations like [[30 Official Roblox Docs/API Reference/Classes/Instance#GetChildren|Instance:GetChildren()]] and [[30 Official Roblox Docs/API Reference/Classes/Instance#GetDescendants|Instance:GetDescendants()]] return only the streamed‑in subset of descendants. This applies even when the parent itself is always replicated, such as a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] directly under [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] whose spatial descendants stream in and out.

```lua
local Players = game:GetService("Players")

local player = Players.LocalPlayer

-- Folder "Homes" is always replicated but its children stream in and out
-- This loop may miss homes that aren't currently streamed in
for _, home in workspace.Homes:GetChildren() do
	if home.Settings.Owner.Value == player.Name then
		return home
	end
end
```

#### Strategy 1

If a complete enumeration is required, perform the scan on the server and pass the result to the player through a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] if needed.

#### Strategy 2

If the anticipated enumeration set is small enough, group each descendant as a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] and set [[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode|ModelStreamingMode]] to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|PersistentPerPlayer]]. This is appropriate for things like a roster of player‑owned plots that's small and game‑critical.

#### Strategy 3

If the script's purpose is to find the nearest match or operate on whatever's currently visible, partial results may be acceptable. Comment on this assumption inside the script so that other maintainers don't reintroduce it as a bug.

### Spatial queries

Client‑side spatial queries like [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#Raycast|WorldRoot:Raycast()]], [[30 Official Roblox Docs/API Reference/Classes/WorldRoot#GetPartBoundsInBox|WorldRoot:GetPartBoundsInBox()]], and [[30 Official Roblox Docs/API Reference/Classes/Model#GetBoundingBox|Model:GetBoundingBox()]] reflect only streamed‑in content. Whether that's a problem depends on what the query is used for.

#### Strategy 1

Use the server for queries whose result must reflect the full world, for example a raycast that checks whether the player has line of sight to a distant target.

#### Strategy 2

If the query is intentionally local, for example a small radius around the player, it's already operating on streamed content and no change is needed.

#### Strategy 3

To spatially query a complete [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], set its [[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode|ModelStreamingMode]] to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Atomic]]. An atomic model is guaranteed to have all of its initial descendants present once the model itself is available, so bounds and extents will be accurate.

#### Strategy 4

If a model's geometry is known at edit time, store its bounds as [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attributes]] on the model itself and read those instead of recomputing on the client.

### Other patterns

The following patterns also may also apply and should be carefully considered:

- A [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] or [[30 Official Roblox Docs/API Reference/Classes/AudioPlayer|AudioPlayer]] parented to a 3D object stops when that object streams out. For ambient audio that should persist regardless of streaming, parent the emitter to a [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Persistent|persistent]] model or to a non‑streaming container.

- In-game [[30 Official Roblox Docs/UI/In-game UI containers|UI]] objects like [[30 Official Roblox Docs/API Reference/Classes/BillboardGui|BillboardGui]] or [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] as well as [[30 Official Roblox Docs/Effects/Effects|visual effects]] like [[30 Official Roblox Docs/API Reference/Classes/Beam|Beams]] or [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlights]] whose adornee or attachment streams out simply stop rendering. This may be the intended behavior, but you should verify it.

- [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|BasePart.Touched]] events, [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompts]], [[30 Official Roblox Docs/API Reference/Classes/DragDetector|DragDetectors]], and [[30 Official Roblox Docs/API Reference/Classes/ClickDetector|ClickDetectors]] do not operate for players whose client doesn't have the associated part/model streamed in. If interaction must be possible from any range, the model needs to be [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Persistent|persistent]] or the interaction needs a different mechanism.

- For [[30 Official Roblox Docs/API Reference/Classes/PathfindingService|PathfindingService]] and client‑side pathfinding, the pathfinder only sees streamed‑in geometry on the client and it may route through obstacles that exist on the server. For strategies, see [[30 Official Roblox Docs/Characters/Pathfinding#Streaming compatibility|Pathfinding - Strategies]] for strategies.

## Realistic test conditions

Once [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Script patterns|scripts are updated]], test the game thoroughly. Streaming bugs often only manifest at the edges of the streamed area or during transitions, so only testing near spawn or at target radius isn't sufficient.

- Test with [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius|Workspace.StreamingTargetRadius]] set to its minimum value (`64`). Some streaming bugs only appear when the streamed area is small.

- Play through the full traversal patterns of the game, teleport between distant areas, and revisit areas after leaving them. These are the situations that exercise stream in and stream out the most.

- Use the [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Runtime debugging|streaming debug overlay]] to monitor the active streaming settings, currently loaded regions, and runtime streaming state.

- Watch the [[30 Official Roblox Docs/Studio/Output|Output]] window and [[30 Official Roblox Docs/Studio/Developer Console|Developer Console]] for errors, as many of the [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Script patterns|script patterns]] produce errors rather than silent misbehavior. Pay particular attention to errors of the form `attempt to index nil with ...` which often indicate a missing [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]] call.

- Equip and activate [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]], fire weapons, and trigger different game interactions.

## AI streaming conversion skill

To assist with streaming conversion and optimization, Roblox offers an **AI streaming skill** that evaluates your game, applies recommended configurations, and cleans up compatibility issues, including:

### Model & World Adjustments

- Configures streaming settings to the [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Streaming properties|recommended baselines]].
- Sets [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Model level-of-detail|level-of-detail]] for models to [[30 Official Roblox Docs/Workspace/Streaming/SLIM|SLIM]] where applicable.
- Refactors [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Model structure|model structures]] to achieve optimal sizes and visual quality.

### Script & Replication Fixes

- Automatically adds necessary [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]] calls and `nil` checks to handle streaming environments.
- Updates client-side [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Spatial queries|spatial queries]] and other [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Script patterns|script patterns]] that behave differently under streaming.
- Intelligently adds pre-fetches and multiple replication foci for [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]] and remote gameplay areas.

### Built-in Guardrails

- Runs a validation safety step to ensure basic gameplay functions properly after conversion.
- Performs a brief playability check to ensure players can successfully join, move around, and don't get stuck in infinite death loops.
- Provides a summary of changes directly in Studio and saves a comprehensive change log to a file.

> [!success]
> Even if your game already utilizes streaming, the skill will scan your existing setup, identify potential issues or areas for improvement, and automatically apply fixes to optimize it further.

<br>

To use the AI skill in your game:

1. **IMPORTANT** Back up your game. The conversion process can be complex, so you should **always** save a backup (**File** ⟩ **Publish to Roblox As**) before running the skill.

2. You can run this skill directly in Assistant or using any LLM you prefer through the [[30 Official Roblox Docs/Studio/Connect to the Roblox Studio MCP server|Model Context Protocol (MCP)]] in Studio. Higher-end AI models with large context windows are recommended; for a typical conversion, a frontier model might take 20-30 minutes and utilize roughly 200,000 tokens of context.

   1. [[30 Official Roblox Docs/Studio/Connect to the Roblox Studio MCP server|Enable and connect the MCP server in Studio]].
   2. Open your game in Studio.
   3. Open **Assistant Settings** ⟩ **Skills** and ensure that `rbx-convert-to-streaming` is toggled on.
   4. Prompt Assistant (or your LLM connected via MCP) to use the skill.

---
*Source: [Techniques and conversion](https://create.roblox.com/docs/workspace/streaming/techniques) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
