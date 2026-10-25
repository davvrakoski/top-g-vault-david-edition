---
title: "Instance streaming"
description: "Instance streaming allows the Roblox engine to dynamically load and unload 3D content in regions of the world."
area: "30 Official Roblox Docs"
cluster: "Workspace"
source: "https://create.roblox.com/docs/workspace/streaming"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Instance streaming allows the Roblox engine to dynamically load and unload 3D content in regions of the world.*

In-game **instance streaming** allows the Roblox engine to dynamically load and unload 3D content and related instances in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. This can improve the overall player experience in several ways, including:

- **Faster Join Times** — Players can start playing in one part of the world while more of the world loads in the background.
- **Memory Efficiency** — Games can be played on devices with less memory since content is dynamically streamed in and out. More immersive and detailed worlds can be played on a wider range of devices.
- **Improved Performance** — Better frame rates and performance, as the server can spend less time and bandwidth synchronizing changes between the world and players in it. Clients spend less time updating instances that aren't currently relevant to the player.
- **Level of Detail** — When configured, distant models, platform avatars, and terrain remain visible even when they're not streamed to clients, keeping the game optimized without entirely sacrificing background visuals. [[30 Official Roblox Docs/Workspace/Streaming/SLIM|SLIM]] provides the highest-fidelity level of detail for both models and avatars.

Instance streaming is controlled through the [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|Workspace.StreamingEnabled]] property, enabled by default for new places created in Studio. This property cannot be set in a script.

*(image in the full Top G Vault)*

> [!success]
> Once you review this technical guide, it's recommended that you review the [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion|streaming techniques]] guide on how to use streaming efficiently and effectively, and the [[30 Official Roblox Docs/Workspace/Streaming/SLIM|SLIM]] guide for enabling high‑fidelity level‑of‑detail on models and avatars.

## Technical behavior

### Scope

Streaming logic and features apply exclusively to instances that are descendants of [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], while instances stored in other containers such as [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] and [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] are ineligible for streaming. For example, placing an [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Atomic|atomic]] model under [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] does not guarantee atomic replication.

### Stream in

When a player joins a game with instance streaming enabled:

1. Instances in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] are replicated to the client **excluding** the following:

   *(image in the full Top G Vault)*

   [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] ([[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] and [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]])

   *(image in the full Top G Vault)*

   [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] set to [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Atomic|Atomic]], [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Persistent|Persistent]], or [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#PersistentPerPlayer|PersistentPerPlayer]]; see [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Model streaming controls|per‑model streaming controls]]

   *(image in the full Top G Vault)*

   [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] set to [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Nonatomic|Nonatomic]] (default) when [[30 Official Roblox Docs/API Reference/Classes/Workspace#ModelStreamingBehavior|Workspace.ModelStreamingBehavior]] is set to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingBehavior|Improved]]

   *(image in the full Top G Vault)*

   Descendants of the above instances

2. During gameplay, the server may stream instances in the above deferred categories to the client based on the game's [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Streaming properties|streaming properties]], player position, client device performance, and other conditions.

### Stream out

During gameplay, a client may remove regions of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] from the player's [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] based on the behavior set by [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamOutBehavior|Workspace.StreamOutBehavior]]. The process begins with regions furthest away from the [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Replication focus|replication foci]] and moves in closer, as needed. Regions inside the [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingMinRadius|Workspace.StreamingMinRadius]] range never stream out.

Note that a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] with no [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] descendants, such as one used merely as a "container" for non‑[[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] instances like scripts, is **exempt** from streaming out **unless** it is made a descendant of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

> [!info]
> Instances which are **created** or **cloned** by client-side scripts are exempted from streaming out unless they are parented under a server‑created instance.

> [!warning]
> When an instance streams out, it is parented to `nil` so that any existing Luau state will reconnect if the instance streams back in. As a result, removal signals such as [[30 Official Roblox Docs/API Reference/Classes/Instance#ChildRemoved|ChildRemoved]] or [[30 Official Roblox Docs/API Reference/Classes/Instance#DescendantRemoving|DescendantRemoving]] fire on its **parent** or **ancestor**, but the instance itself is not destroyed in the same sense as an [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]] call. Local-only changes to instance properties (changes that exist on a client and have not been replicated to the server) can be lost if the instances streams out and later streams back in.

### Assemblies

Physical [[30 Official Roblox Docs/Physics/Assemblies|assemblies]] stream **in** as complete units, including their associated [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]] and [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]], helping to ensure consistent physics updates on clients. The only exception is when the assembly is [[30 Official Roblox Docs/Physics/Assemblies#Anchoring behavior|anchored]], in which case only the [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] within the streaming radius are streamed in alongside their associated [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraints]] and [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]].

Assemblies do not stream **out** until all of their [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] are eligible to stream out.

> [!warning]
> Avoid creating moving assemblies with unnecessarily large numbers of instances, as all of the instances streaming in unison may cause network/CPU spikes.

## Streaming properties

The following properties control how instance streaming applies to your game. All of these properties are **non-scriptable** and must be set on the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] object in Studio.

*(image in the full Top G Vault)*

| Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#EnableSLIMAvatars\|EnableSLIMAvatars]] | Controls whether a [[30 Official Roblox Docs/Workspace/Streaming/SLIM\|SLIM]] model is generated for avatar characters in the game. When enabled, avatars render using SLIM in the same way that setting [[30 Official Roblox Docs/API Reference/Classes/Model#LevelOfDetail\|Model.LevelOfDetail]] to [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail\|SLIM]] works for other models. See [[30 Official Roblox Docs/Workspace/Streaming/SLIM\|SLIM]] for details. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#ModelStreamingBehavior\|ModelStreamingBehavior]] | Controls how [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Nonatomic\|Nonatomic]] (default) models stream in and out.<br><br>**RECOMMENDED** Use [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingBehavior\|Improved]] to enable the most efficient streaming for [[30 Official Roblox Docs/API Reference/Classes/Model\|Models]] with [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] descendants. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#PredictiveStreamingMode\|PredictiveStreamingMode]] | Opts in to [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Predictive streaming\|predictive streaming]] which uses engine signals to proactively stream areas a player is likely to need soon, such as respawn locations or regions the player recently left via [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] change. Predictions are additive, expire after a short time if unused, and are skipped on resource‑constrained clients. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingIntegrityMode\|StreamingIntegrityMode]] | The game may behave in unintended ways if a player moves into a region of the world that hasn't been streamed to them. This property offers a way to avoid those potentially problematic situations.<br><br>**RECOMMENDED** Use [[30 Official Roblox Docs/API Reference/Enums/StreamingIntegrityMode\|PauseOutsideLoadedArea]] to balance gameplay integrity without pausing unnecessarily or too often. You can also [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Pause screen customization\|customize the pause screen]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingMinRadius\|StreamingMinRadius]] | This property indicates the radius around the [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Replication focus\|replication foci]] in which instances stream in at the highest priority. Care should be taken when increasing the default, as doing so will require more memory and more server bandwidth at the expense of other components.<br><br>**RECOMMENDED** Use the default of `64` to maximize how much the engine can scale the game down for low‑end devices. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius\|StreamingTargetRadius]] | This property controls the maximum distance away from the [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Replication focus\|replication foci]] in which instances stream in. Note that the engine is allowed to retain previously loaded instances beyond the target radius, memory permitting.<br><br>A smaller [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius\|StreamingTargetRadius]] reduces server workload, as the server will not stream in additional instances beyond the set value. However, the target radius is also the maximum distance players will be able to see the full detail of your game, so you should pick a value that creates a nice balance between these.<br><br>**RECOMMENDED** Use the default of `1024` to strike a good balance between visibility for players on high‑end devices and a reasonable memory footprint. |
| [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamOutBehavior\|StreamOutBehavior]] | This property sets the [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Stream out\|streaming out]] behavior according to the value of [[30 Official Roblox Docs/API Reference/Enums/StreamOutBehavior\|Enum.StreamOutBehavior]]. If set to [[30 Official Roblox Docs/API Reference/Enums/StreamOutBehavior\|LowMemory]] (default), the client only streams out regions beyond the minimum radius in a low memory situation. If set to [[30 Official Roblox Docs/API Reference/Enums/StreamOutBehavior\|Opportunistic]], regions beyond [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius\|StreamingTargetRadius]] can be removed on the client even when there is no memory pressure (in this mode, the client never removes instances that are within the target radius, except in low memory situations).<br><br>**RECOMMENDED** Use [[30 Official Roblox Docs/API Reference/Enums/StreamOutBehavior\|Opportunistic]] to allow the client to aggressively garbage collect content, significantly reducing memory usage and helping prevent out‑of‑memory crashes. |

> [!warning]
> [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius|StreamingTargetRadius]] should be larger than [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingMinRadius|StreamingMinRadius]]. 3D content between the target radius and the minimum radius acts as a buffer in case the client temporarily stops receiving new content from the server. If the minimum radius and the target radius are equal, there is no buffer, which can lead to an increase in network pauses or an otherwise suboptimal player experience.

## Replication focus

By default, streaming occurs around the local player's character's [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|PrimaryPart]], although you can specify a different replication focus point through [[30 Official Roblox Docs/API Reference/Classes/Player#ReplicationFocus|Player.ReplicationFocus]].

You can also add and remove additional replication foci through [[30 Official Roblox Docs/API Reference/Classes/Player#AddReplicationFocus|Player:AddReplicationFocus()]] and [[30 Official Roblox Docs/API Reference/Classes/Player#RemoveReplicationFocus|Player:RemoveReplicationFocus()]] to dynamically enable streaming in multiple areas of the game.

> [!warning]
> Use caution when adding additional replication foci as each additional focus increases the server's workload for streaming and updating regions. For example, a single player with nine dynamically moving foci could generate server networking and streaming processing comparable to ten players moving around the game.
>
> On the client, too many foci for a player can limit the engine's ability to adjust to memory limitations and make it more likely for clients to be killed by the OS for using too much memory.

### Physics Simulation

Client-side physics simulation, including prediction and resimulations when [[30 Official Roblox Docs/Projects/Server Authority/Server authority model|server authority]] is implemented, only occurs in streamed areas, even for locally created instances and for [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Persistent]] instances. If you have instances that you'd like to keep simulating even when they're far away from the character, create an additional replication focus near those instances.

### Movement Between Zones

In many games, players frequently move back and forth between the same areas, for example between their "home base" and a "trading hub." In such cases, you can create a replication focus point in each area to ensure those areas are readily present on client devices.

### Distant Viewpoints

Multiple replication points are useful when players can view specific, important regions through a scope, such as enemy bases scattered across a barren landscape. In such cases, you can create a replication focus point in each base to ensure players see details and simulated physics from afar.

## Predictive streaming

Predictive streaming is an opt‑in feature that uses engine signals to anticipate player movement and proactively stream areas the player is likely to need soon. When enabled by setting [[30 Official Roblox Docs/API Reference/Classes/Workspace#PredictiveStreamingMode|PredictiveStreamingMode]] to [[30 Official Roblox Docs/API Reference/Enums/PredictiveStreamingMode|Enabled]], it can reduce streaming pauses and visual pop‑in without any code changes.

Predictive streaming is **additive**. It creates small, temporary streaming foci in addition to your existing [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Replication focus|replication foci]], streams a small amount of extra content, and does not change your game logic or streaming contracts. If a prediction isn't needed, the predicted area expires after a short time and the engine unloads the content. The engine also takes client memory and performance into account, skipping predictions on resource‑constrained devices.

When [[30 Official Roblox Docs/API Reference/Classes/Workspace#PredictiveStreamingMode|PredictiveStreamingMode]] is [[30 Official Roblox Docs/API Reference/Enums/PredictiveStreamingMode|Enabled]], the following predictive features are active:

| Feature | Description |
| --- | --- |
| Spawn pre‑fetching | When a player dies, the engine creates small, temporary streaming foci at possible spawn locations so that likely respawn areas begin streaming before the player character appears, reducing pauses and missing content immediately after respawn. |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] return optimization | When a player [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrames]] away from an area, the engine creates a small, temporary streaming focus at the location they left. This helps keep that area streamed in if the player returns shortly after, a common scenario when moving between buildings, sublevels, shops, or hubs. |

> [!info]
> Predictive streaming works seamlessly with manually created pre‑fetches ([[30 Official Roblox Docs/API Reference/Classes/Player#RequestStreamAroundAsync|Player:RequestStreamAroundAsync()]]) and multiple replication foci ([[30 Official Roblox Docs/API Reference/Classes/Player#AddReplicationFocus|Player:AddReplicationFocus()]]). If you've already created a pre‑fetch or replication focus at a specific location, predictive streaming does not add another streaming focus there.

## Model streaming controls

To avoid issues with streaming on a per-model basis and minimize use of [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]], you can customize how [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] and their descendants stream through their [[30 Official Roblox Docs/API Reference/Classes/Model#ModelStreamingMode|ModelStreamingMode]] property.

### Nonatomic

By default, models are [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Nonatomic]] and they stream in/out based on whether [[30 Official Roblox Docs/API Reference/Classes/Workspace#ModelStreamingBehavior|Workspace.ModelStreamingBehavior]] is set to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingBehavior|Legacy]] (default) or [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingBehavior|Improved]].

###### Legacy

When [[30 Official Roblox Docs/API Reference/Classes/Workspace#ModelStreamingBehavior|Workspace.ModelStreamingBehavior]] is set to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingBehavior|Legacy]] (default), the [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] container and its **non**‑[[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] descendants such as [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] replicate to the client when the player joins. Then, when eligible, the model's [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] descendants stream in.

*(image in the full Top G Vault)*

###### Improved

When [[30 Official Roblox Docs/API Reference/Classes/Workspace#ModelStreamingBehavior|Workspace.ModelStreamingBehavior]] is set to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingBehavior|Improved]], model streaming behavior varies by whether the model contains [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] descendants or does **not** contain [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] descendants:

- A model with [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] descendants streams **in** only when **one** of its [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] descendants is eligible to stream in. At that point, the model and the eligible [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] streams in, along with the model's **non**‑[[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] descendants.

  When the very last remaining [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] of the model streams **out**, the model itself will stream out along with it.

  *(image in the full Top G Vault)*

- A model with no [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] descendants, such as one used merely as a "container" for non‑[[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] instances like scripts, replicates to the client soon after the player joins. This type of model is **exempt** from streaming out **unless** it is made a descendant of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]].

  *(image in the full Top G Vault)*

### Atomic

If a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] is set to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Atomic]], all of its initial descendants are streamed in together when a descendant [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] is eligible to be streamed in. As a result, a client‑side script that needs to access instances **inside** the model would need to use [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]] on the model itself, but not on a descendant [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] or [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] since they are sent alongside the model.

An atomic model is only streamed out when all of its descendant parts are eligible for streaming out, at which point the entire model streams out together.

*(image in the full Top G Vault)*

### Persistent

[[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Persistent]] models are not subject to normal streaming in or out. They are sent as a complete atomic unit soon after the player joins and before the [[30 Official Roblox Docs/API Reference/Classes/Workspace#PersistentLoaded|Workspace.PersistentLoaded]] event fires. Persistent models and their descendants are never streamed out, but to safely handle streaming in within a client‑side script, you should wait for the [[30 Official Roblox Docs/API Reference/Classes/Workspace#PersistentLoaded|PersistentLoaded]] event to fire.

*(image in the full Top G Vault)*

> [!warning]
> Persistent models are intended for very rare circumstances, such as when a small number of parts must always be present on clients for client‑side scripts to access. If possible, server-side [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] should be used, or client scripts should be tolerant of parts streaming in and out. Persistent models are **not** intended to circumvent streaming, and overuse may negatively impact performance.

### PersistentPerPlayer

Models set to [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|PersistentPerPlayer]] behave the same as [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Persistent]] for players that have been added using [[30 Official Roblox Docs/API Reference/Classes/Model#AddPersistentPlayer|Model:AddPersistentPlayer()]]. For other players, behavior is the same as [[30 Official Roblox Docs/API Reference/Enums/ModelStreamingMode|Atomic]]. You can revert a model from player persistence via [[30 Official Roblox Docs/API Reference/Classes/Model#RemovePersistentPlayer|Model:RemovePersistentPlayer()]].

## Pause screen customization

Assuming [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingIntegrityMode|Workspace.StreamingIntegrityMode]] is set to the recommended [[30 Official Roblox Docs/API Reference/Enums/StreamingIntegrityMode|PauseOutsideLoadedArea]], the game will pause if a player moves into a region of the world that hasn't been streamed to them. In these cases, the [[30 Official Roblox Docs/API Reference/Classes/Player#GameplayPaused|Player.GameplayPaused]] property indicates the player's current pause state which can be used with a [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|GetPropertyChangedSignal()]] connection to show or hide a custom GUI.

```lua title="LocalScript"
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")

local player = Players.LocalPlayer

-- Disable default pause modal
GuiService:SetGameplayPausedNotificationEnabled(false)

local function onPauseStateChanged()
	if player.GameplayPaused then
		-- Show custom GUI
	else
		-- Hide custom GUI
	end
end

player:GetPropertyChangedSignal("GameplayPaused"):Connect(onPauseStateChanged)
```

## Runtime debugging

The engine includes multiple on-screen debug panels that can be enabled on the client using keyboard shortcuts. To access streaming debug information:

1. Open the **Network Stats** debug overlay. In a live experience, press <kbd>Shift</kbd><kbd>F3</kbd>. When playtesting in Studio, press <kbd>Shift</kbd><kbd>Ctrl</kbd><kbd>F3</kbd> (Windows) or <kbd>Shift</kbd><kbd>⌘</kbd><kbd>F3</kbd> (Mac).
2. Once the debug overlay is open, press <kbd>Shift</kbd><kbd>1</kbd> repeatedly to cycle through the available panels. The fourth panel is the **Streaming** debug view which displays useful runtime information:
   - Active streaming settings
   - Currently loaded (streamed in) regions
   - Streaming behavior and state

Once enabled, colored highlighted regions appear in the 3D viewport:

| Color | Description |
| --- | --- |
| `rgb(255,0,0)` | Less than [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingMinRadius\|StreamingMinRadius]] |
| `rgb(255,255,0)` | Greater than or equal to [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingMinRadius\|StreamingMinRadius]] and less than [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius\|StreamingTargetRadius]] |
| `rgb(0,0,255)` | Equal to [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius\|StreamingTargetRadius]] |
| `rgb(0,255,0)` | Greater than [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingTargetRadius\|StreamingTargetRadius]] |

[Video: Streaming-Debug.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/optimization/streaming/Streaming-Debug.mp4)

> [!info]
> To increase the ability to zoom the default camera considerably far out while debugging, temporarily increase [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CameraMaxZoomDistance|StarterPlayer.CameraMaxZoomDistance]] while in edit mode or [[30 Official Roblox Docs/API Reference/Classes/Player#CameraMaxZoomDistance|Player.CameraMaxZoomDistance]] during runtime. A value of `1000`, for example, allows you to pull the camera out to view most of the 3D world while still navigating the character around.

---
*Source: [Instance streaming](https://create.roblox.com/docs/workspace/streaming) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
