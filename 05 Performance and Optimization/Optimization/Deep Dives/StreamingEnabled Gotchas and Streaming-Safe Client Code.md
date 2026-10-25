---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "StreamingEnabled Gotchas and Streaming-Safe Client Code"
tags: [deep-dive, roblox, streaming, streamingenabled, client, memory, optimization]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# StreamingEnabled Gotchas and Streaming-Safe Client Code

**Why this matters:** instance streaming is Roblox's highest-impact fix for client memory and join time, and it is on by default for new places, but code written for a fully loaded world breaks in quiet, intermittent ways once parts can be missing, stale or re-added.
This note lists the gotchas with the engine behaviour behind each one, then gives client patterns (a streaming-aware lookup, tag binders, server pre-fetching, persistence used sparingly) that make code correct under streaming.

The concepts (radii, model modes) are summarised in [[Instance Streaming Deep Dive]]; world layout is in [[Large World Streaming Architecture]]; the symptom checklist is [[Streaming causes nil - missing instances]].

---

## 1. Engine behaviour you must internalise

From the Roblox streaming docs (as of 2026):

1. Streaming applies only to **Workspace** descendants. ReplicatedStorage and ReplicatedFirst are never streamed.
2. On join, Workspace replicates **except** BaseParts, models set to Atomic/Persistent/PersistentPerPlayer, Nonatomic models when `ModelStreamingBehavior = Improved`, and their descendants. Those stream in later by distance and device conditions.
3. **Stream-out parents the instance to `nil`; it is not destroyed.** Your Luau references stay valid and **connections stay connected**; if it streams back in, it is the same object. `ChildRemoved`/`DescendantRemoving` fire on its parent.
4. **Local-only property changes can be lost** when an instance streams out and back in: properties and tags re-synchronise from the server.
5. Once streamed out, a part's properties stop updating on that client. Reads still succeed but return **stale** values.
6. **Assemblies stream in as whole units** (with constraints and attachments). Unanchored assemblies do not stream out until all parts are eligible. Huge moving assemblies cause network/CPU spikes.
7. Instances **created or cloned by client scripts are exempt** from stream-out unless parented under a server-created instance. A Model with no BasePart descendants is exempt unless it is under a BasePart.
8. **Client physics only simulates in streamed areas**, even for local and Persistent instances.
9. During a `CharacterAdded` on the client, the character model can be **parented before all its descendants have replicated**, so direct indexing (`character.Humanoid`) can fail.
10. ChildAdded/ChildRemoved and CollectionService added/removed signals **fire on stream in/out**, indistinguishable from real spawns and removals.
11. Server scripts see **everything, always**. Streaming only affects clients.

---

## 2. Gotcha table

| Gotcha | Symptom | Fix |
| --- | --- | --- |
| `workspace.Map.Door` dot-indexing | Error "is not a valid member" for some players | `FindFirstChild` with nil checks, or `WaitForChild` with a timeout, or make `Map` an Atomic model |
| `WaitForChild` with no timeout on a distant object | Script hangs forever; loading screen never closes | Timeouts; tag binders instead of waiting |
| Remote sends an Instance | Client receives `nil` | Send an ID/attribute; resolve on the client when present |
| Loading screen waits for a map part | Never dismisses: no character yet, so no replication focus | Signal readiness after the character spawns and its area streams; or `AddReplicationFocus` at the spawn |
| Client changes colour/transparency of a streamed part | Change disappears after walking away and back | Keep client state in Luau keyed by instance or ID; reapply on stream-in |
| Distance checks on the client against far parts | Uses stale position | Do distance logic on the server, or skip parts not under Workspace |
| Spawn VFX on `GetInstanceAddedSignal` | Effects replay every time an NPC streams back in | Track "already seen" in a weak-keyed table (section 4) |
| Server teleports a player across the map | Falls through the world / pause screen | `RequestStreamAroundAsync` before moving |
| Cutscene camera far from the character | Empty world in the shot | `AddReplicationFocus` for the cutscene, remove after |
| Everything set to Persistent "to fix bugs" | Memory and join time worse than before streaming | Persistent only for a handful of always-needed parts |

---

## 3. A streaming-aware lookup helper

```luau
--!strict
-- ReplicatedStorage/Shared/Util/Streamed.luau
local Workspace = game:GetService("Workspace")

local Streamed = {}

-- True if the instance is currently streamed in (part of Workspace on this client).
function Streamed.isPresent(instance: Instance?): boolean
	return instance ~= nil and instance:IsDescendantOf(Workspace)
end

-- Resolve a path like {"Map", "Shops", "Armory"} without erroring. Returns nil if any
-- step is missing right now.
function Streamed.find(root: Instance, path: { string }): Instance?
	local current: Instance? = root
	for _, name in path do
		if not current then
			return nil
		end
		current = current:FindFirstChild(name)
	end
	return current
end

-- Wait for a path with a total timeout; returns nil on timeout instead of hanging.
function Streamed.waitFor(root: Instance, path: { string }, timeout: number): Instance?
	local deadline = os.clock() + timeout
	local current: Instance = root
	for _, name in path do
		local remaining = deadline - os.clock()
		if remaining <= 0 then
			return nil
		end
		local child = current:WaitForChild(name, remaining)
		if not child then
			return nil
		end
		current = child
	end
	return current
end

return Streamed
```

Use `waitFor` only on the **critical path** (something the script genuinely cannot continue without) and always handle `nil`. For everything optional, prefer reacting to presence (next section) over waiting.

---

## 4. React to presence instead of waiting: tag binders

The most robust client pattern under streaming: **behaviour lives in components bound to tags**, created when a tagged instance appears and destroyed when it leaves. Streaming in/out then just creates and destroys components. The full binder (with yield and ancestry handling) is in [[CollectionService Tag-Driven Architecture]]. Two streaming-specific additions:

```luau
--!strict
local CollectionService = game:GetService("CollectionService")

-- 1. "First time only" effects: instances are reused on stream-in, so a weak-keyed
--    table remembers what we have already seen without leaking destroyed instances.
local seen: { [Instance]: boolean } = setmetatable({}, { __mode = "k" }) :: any

CollectionService:GetInstanceAddedSignal("Enemy"):Connect(function(enemy)
	if seen[enemy] then
		return -- streamed back in, not a new spawn
	end
	seen[enemy] = true
	playSpawnEffects(enemy)
end)

-- 2. Client-only state that must survive stream-out lives in Luau, keyed by a
--    server-assigned ID attribute, and is reapplied when the instance appears.
local doorTint: { [string]: Color3 } = {}

local function applyTint(door: Instance)
	local id = door:GetAttribute("DoorId")
	if typeof(id) == "string" and doorTint[id] and door:IsA("BasePart") then
		door.Color = doorTint[id]
	end
end
CollectionService:GetInstanceAddedSignal("Door"):Connect(applyTint)
for _, door in CollectionService:GetTagged("Door") do
	applyTint(door)
end
```

Server-side spawns are better detected with an explicit signal: the server sets a `SpawnedAt` attribute (server-set attributes survive stream cycles) or fires a remote with the entity ID at spawn time.

---

## 5. Server-side pre-fetching and foci

```luau
--!strict
-- Server: move a player far away without a streaming pause.
local function teleportCharacter(player: Player, destination: CFrame)
	-- Ask the engine to stream the destination to this player first (yields).
	-- Optional timeout: the engine stops trying after this many seconds.
	pcall(function()
		player:RequestStreamAroundAsync(destination.Position, 5)
	end)
	local character = player.Character
	if character and character.Parent then
		character:PivotTo(destination)
	end
	MovementGuard.Grace(player, 2) -- tell anti-cheat this jump is legitimate
end
```

- `RequestStreamAroundAsync` is **temporary and not guaranteed**; low client memory or network conditions can limit it. It is still the documented way to avoid pop-in and pauses after `CFrame` teleports.
- `Player:AddReplicationFocus(part)` / `RemoveReplicationFocus` keep an area streamed until removed (spectator cameras, a home base you return to often, a scope view). Roblox warns that each extra focus adds server streaming work comparable to another player, and too many foci make clients more likely to be killed for memory. Keep it to one or two, and always remove them.
- **Predictive streaming** (`Workspace.PredictiveStreamingMode = Enabled`) is an opt-in engine feature that pre-fetches likely respawn points and keeps recently left areas briefly, with no code changes.
- **Frustum streaming** (`Player.FrustumStreaming`, set on the server, modes Disabled/Automatic/Enabled) streams what the camera sees beyond the radius, for scopes, racing and free cameras. It increases memory and CPU use; enable it per player when the gameplay needs it. The MovementGuard reference is from [[Server-Side Movement Validation and Anti-Exploit Checks]].

---

## 6. Model streaming modes: when to use which

| Mode | Behaviour | Use for | Client code |
| --- | --- | --- | --- |
| **Nonatomic** (default) | Legacy: container and non-part children replicate on join, parts stream individually. Improved behaviour (`ModelStreamingBehavior = Improved`) streams the model more efficiently | Most world geometry | Treat any child as possibly missing |
| **Atomic** | All **initial** descendants stream in together | Doors, interactables, vehicles, anything scripts index into | `WaitForChild` the **model**, then index children directly |
| **Persistent** | Sent soon after join, before `Workspace.PersistentLoaded`; never streams out | A handful of always-needed parts (minimap anchors) | Wait for `PersistentLoaded` before indexing |
| **PersistentPerPlayer** | Persistent for players added with `Model:AddPersistentPlayer()`, Atomic for others | A player's own plot or base | Server adds/removes the player |

Roblox's guidance on Persistent: intended for **rare** cases, not to circumvent streaming; overuse hurts performance. Roblox also recommends `ModelStreamingBehavior = Improved` for efficient model streaming.

```luau
-- Client: safe access to a Persistent model.
-- Persistent models arrive as one atomic unit, so once the model itself exists its
-- initial descendants exist too. Waiting on the model (with a timeout) is enough,
-- and avoids missing a PersistentLoaded event that fired before this script ran.
local Workspace = game:GetService("Workspace")
local anchors = Workspace:WaitForChild("MinimapAnchors", 15)
if anchors then
	local north = anchors:FindFirstChild("North") -- present: atomic guarantee
	-- ...
else
	warn("MinimapAnchors did not arrive; minimap disabled this session")
end
-- If many systems need "all persistent content is here", connect
-- Workspace.PersistentLoaded once in a ReplicatedFirst LocalScript (which runs
-- earliest) and expose a ready flag/signal from a shared module.
```

---

## 7. Settings worth reviewing

All streaming properties are set on Workspace in Studio (not from scripts):

- **`StreamingMinRadius`**: highest-priority radius; Roblox recommends keeping the default **64** so the engine can scale down on low-end devices. Content inside it never streams out.
- **`StreamingTargetRadius`**: maximum stream-in distance and the farthest players see full detail. Must be larger than the minimum radius; the gap is a buffer against network hiccups.
- **`StreamOutBehavior`**: `LowMemory` (default, stream out only under memory pressure) or `Opportunistic` (stream out beyond the target radius even without pressure).
- **`StreamingIntegrityMode`**: `PauseOutsideLoadedArea` (recommended) pauses the player when they reach unloaded space; `Player.GameplayPaused` tells you when this happens.
- **`Workspace:ApplyRecommendedStreamingSettings()`**: a plugin-security method (command bar/plugins) that applies Roblox's current recommended values.
- **SLIM** (`Model.LevelOfDetail = SLIM`, `Workspace.EnableSLIMAvatars`): cloud-generated low-cost stand-ins so streamed-out models and avatars stay visible. Requires the place saved to Roblox with Team Create, and works best on static geometry.

---

## 8. Testing under realistic conditions

- Test with the **smallest radius you might ship**, on a low-memory device, and on a laggy connection.
- Temporarily raise `CameraMaxZoomDistance` (Roblox suggests around 1,000) to fly the camera out and **see** what is streamed around you.
- Exercise: fast vehicles, server teleports, respawn at distant spawns, cutscenes, spectate, joining mid-round, and walking away from and back to every interactable.
- Search the codebase for `workspace.` dot paths in LocalScripts, `WaitForChild(` without a second argument, and remotes that pass Instances.

---

## Common mistakes

- Turning streaming off "because things broke" instead of fixing the scripts.
- `WaitForChild` without a timeout on optional or distant content.
- Passing Instances through remotes to clients that may not have them.
- Client-side visual state stored only on the instance.
- Spawn effects replayed on every stream-in.
- Using Persistent for convenience, erasing the memory benefit.
- Many replication foci per player.
- Doing distance logic on the client against parts that may be stale.
- Forgetting that the server sees everything, so server tests pass while clients fail.

## Checklist

- [ ] No LocalScript dot-indexes Workspace content that can stream.
- [ ] All client `WaitForChild` calls on Workspace content have timeouts and nil handling.
- [ ] Remotes send IDs, not Instances, for streamable content.
- [ ] Client behaviour for world objects runs in tag-bound components.
- [ ] First-time effects tracked with a weak-keyed table or server-set attributes.
- [ ] Server pre-fetches with `RequestStreamAroundAsync` before CFrame teleports.
- [ ] Interactables are Atomic models; Persistent used for a handful of parts at most.
- [ ] Streaming settings reviewed; tested on low-end devices with small radii.

**Related:** [[Optimization - Hub]] · [[Instance Streaming Deep Dive]] · [[Large World Streaming Architecture]] · [[Streaming causes nil - missing instances]] · [[Mobile Performance Deep Dive]]
