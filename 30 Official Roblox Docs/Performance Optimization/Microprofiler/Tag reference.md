---
title: "Tag reference"
description: "A list of tags for the MicroProfiler."
area: "30 Official Roblox Docs"
cluster: "Performance Optimization"
source: "https://create.roblox.com/docs/performance-optimization/microprofiler/tag-table"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*A list of tags for the MicroProfiler.*

The following is a list of common tags in the [[30 Official Roblox Docs/Performance Optimization/Microprofiler/MicroProfiler|MicroProfiler]], grouped by category. Tags are also interchangeably called tasks, timers, scopes, processes, and labels. Whatever the name, they represent a unit of work.

Understanding these tags can help you identify problematic code in your game. The tables contain tag label, descriptions, and advice for improving performance and optimizing your game.

For a complete list of all MicroProfiler tags and their descriptions, see the [LibMP documentation](https://github.com/Roblox/libmp/blob/main/docs/ALL-SCOPES%2Emd) on GitHub.

## Sleep

When threads aren't actively performing tasks, they enter a sleep state, with tags to indicate how long the thread was sleeping. At any given time, it's extremely common for most worker threads to be in a sleep state.

## Navigation

| Label | Description | Performance advice |
| --- | --- | --- |
| rasterizeTile | Updates navigation tiles needed for a pathfinding request, usually followed by **computePath** which requires those tiles be up-to-date. Follows **NavigationJob/preprocess** on the main thread. | Reduce the number of pathfinding tile invalidations, as this causes those paths to need recomputing. This is caused by non-navigable parts moving. |
| computePath | Calculates paths, typically after **rasterizeTile**. | Reduce the number and world extents of [[30 Official Roblox Docs/API Reference/Classes/Path#ComputeAsync\|Path:ComputeAsync()]] calls. Try reusing paths for multiple agents if they are expected to start/end from approximately similar locations. |
| preprocess/getPrimitivesOverlapping | Collects the world geometry for each pathfinding tile and schedules the rasterization tasks to be executed by the pathfinding thread. | Reduce the part count. |

## Animation and humanoids

| Label | Description | Performance advice |
| --- | --- | --- |
| Simulation/gameStepped | Processing of game-specific objects such as [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoids]], [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animations]] and heartbeat callbacks. | See **gameStepped** labels below. |
| Simulation/gameStepped/stepHumanoid | [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] state changes and movement. | Reduce the amount of [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoids]] or disable [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] states on NPCs that don't need them, such as [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Climbing]] or [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Swimming]]. Reduce callbacks to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StateChanged\|Humanoid.StateChanged]] or state changes such as [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Running\|Running]] or [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Died\|Died]]. |
| Simulation/gameStepped/stepAnimation | [[30 Official Roblox Docs/API Reference/Classes/Animator\|Animators]] will step forward in currently playing animations. | Reduce the amount of [[30 Official Roblox Docs/API Reference/Classes/Animator\|Animators]] or animated joints to lower the workload of this step. Reduce number of callbacks to animation events such as [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#KeyframeReached\|AnimationTrack.KeyframeReached]] or [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Ended\|AnimationTrack.Ended]] |
| Simulation/gameStepped/RunService.Stepped | Runs functions connected to the [[30 Official Roblox Docs/API Reference/Classes/RunService#Stepped\|RunService.Stepped]] event. | Reduce the amount or workload of functions connected to this event. Consider delaying or replacing expensive calculations or spreading computation across multiple frames. |

## Audio

| Label | Description | Performance advice |
| --- | --- | --- |
| Sound | Processes acoustic simulation and updates sounds in active playback. | See **Sound** labels below. |
| Sound/stepInstances | Updates the volume of active sounds in the workspace. | Reduce the amount of sounds in active playback. |

## Networking

| Label | Description | Performance advice |
| --- | --- | --- |
| Net PacketReceive | Receives network packets. If many objects or events are being replicated, this step takes longer. | Replicate fewer objects or events. |
| Replicator/ProcessPackets | Processes contents of network packets, such as motion, event invocations and property changes. | Reduce the number or size of objects being replicated, or do this in incremental steps. May increase if map size increases, as larger maps tend to have more overall activity. |
| Allocate Bandwidth and Run Senders/Dispatch Physics Senders and TouchSenders | Sends data about activity in the game. | Reduce the amount of moving objects and/or touches. See following sections. |
| Allocate Bandwidth and Run Senders/Dispatch StreamJob | Sends corresponding specific regions to specific clients in the streaming feature. | Reduce the minimum and target streaming radii. |
| Allocate Bandwidth and Run Senders/Dispatch Data Senders | Sends property changes, remote event invocations, [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] state changes, animation state changes, and replication of new instances. | Reduce the number of replicated changes to the data model. |
| Replicator SendCluster | Sends [[30 Official Roblox Docs/Parts/Environmental terrain\|Terrain]] data to clients. | Reduce the amount or size of terrain changes. |
| ModelCompleteness Mega Job | Server only: completeness is an internal concept. When models are completely sent, model completeness events are sent. | Add or remove fewer instances. |
| deserializePacket | Low-level network packet processing. Prepares for **Replicator/ProcessPackets**. | Send fewer or smaller updates. |

## Rendering

| Label | Description | Performance advice |
| --- | --- | --- |
| Prepare | Information is gathered from the main thread and updates various data structures used for rendering. | See **Prepare** labels below. |
| Prepare/Pass3dAdorn | Handles rendering of various object adorns, such as text labels above objects. For [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] labels with occlusion, this step includes raycasting to determine if such objects are visible. This includes non-transparent parts to facilitate debug visualizations. | Reduce the number of visible adorned objects, such as [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGuis]], [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] name/health labels, etc. Reduce the number of visible parts. |
| Prepare/Pass2d | Readies 2D UI rendering (both player and Roblox UI). | Reduce the amount or complexity of UI elements. |
| Prepare/UpdatePrepare/updateInvalidParts | Updates parts that had some property changed or added. | Reduce the amount of properties changes on the world. If a script updates a large set of object properties, break it down across frames. |
| Prepare/UpdatePrepare/updateInvalidatedFastClusters | Prepares "FastCluster" geometries used to render [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoids]] and [[30 Official Roblox Docs/Art/Modeling/Rigging and skinning\|skinned]] [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]]. Labels specify the number of parts, vertices, and size of vertices. | Reduce visual changes to models with [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoids]] or skinned [[30 Official Roblox Docs/API Reference/Classes/MeshPart\|MeshParts]]. |
| Prepare/UpdatePrepare/updateDynamicParts | Prepares [[30 Official Roblox Docs/API Reference/Classes/Beam\|Beams]], [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter\|ParticleEmitters]], and [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoids]] for rendering. | Reduce the number of visible [[30 Official Roblox Docs/API Reference/Classes/Beam\|Beams]], [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter\|ParticleEmitters]], and [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoids]]. |
| Prepare/UpdatePrepare/updateInstancedClusters | Updates geometry that uses instanced rendering such as parts. Labels **Clusters** and **Instances** indicate the number updated. | Reduce work that implicitly updates the bounding box of the part, such as [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame\|BasePart.CFrame]], [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size\|BasePart.Size]], or [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform\|Motor6D.Transform]]. Creative property updates such as [[30 Official Roblox Docs/API Reference/Classes/Bone#Transform\|Bone.Transform]] can help. |
| Perform | When actual rendering commands are created and issued. | See **Perform** labels below. |
| Perform/fillGuiVertices | Fills buffers with UI vertices to prepare for rendering. **gui count** label indicates the amount of [[30 Official Roblox Docs/API Reference/Classes/LayerCollector\|LayerCollectors]] visible in the frame. | If the cost is high, reduce the amount, density, and space taken by UI elements. If there are too many **Process GuiEffect** labels, consider reducing the use of [[30 Official Roblox Docs/API Reference/Classes/UIGradient\|UIGradient]] and [[30 Official Roblox Docs/API Reference/Classes/UICorner\|UICorner]] on text labels. |
| Perform/Scene/queryFrustumOrdered | Applies frustum culling so that objects not visible are not rendered. | If there is a high cost that means there are a lot of elements. Perhaps use some larger meshes where a single mesh has more details as opposed to many small individual pieces. |
| Perform/Scene/computeLightingPerform | Computation of lighting near the camera. | Manipulate the number of light sources or move the camera less to reduce the time it takes to recalculate lighting. |
| Perform/Scene/computeLightingPerform/LightGridCPU | Updates the voxel lighting, which is used at lower quality levels. | If updating chunk occupancy takes too long, consider using lower resolution geometry, reducing the number of parts, or anchoring parts. If the other labels take too long, consider reducing the number of lights and using non-shadow casting geometry for objects that move and invalidate the occupancy. |
| Perform/Scene/computeLightingPerform/ShadowMapSystem | Updates shadow maps. Not performed at quality levels below 4. | Reduce the number of lights. You can also use [[30 Official Roblox Docs/API Reference/Classes/Light#Shadows\|Light.Shadows]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart#CastShadow\|BasePart.CastShadow]] to disable shadow casting on less important instances. See [[30 Official Roblox Docs/Performance Optimization/Improve performance#Mitigation\|Improve performance]]. |
|  |  |  |
| Perform/Scene/Glow, ColorCorrection, MSAA, SSAO, and SSAOApply | Post-processing rendering. | Reduce the number of post-processing effects. Usually this is not significant. |
| Perform/Scene/UI | UI rendering. In **Id_Screen**, there is a label with the number of batches, materials and triangles used. | Reduce the number of visible UI elements. Using [[30 Official Roblox Docs/API Reference/Classes/CanvasGroup\|CanvasGroups]] can help at the expense of increased memory use. |
| Perform/Scene/UpdateView/updateParticles, updateParticleBoundings | Update particle position and bounds. | Reduce the number of [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter\|ParticleEmitters]], emission rates, lifetimes, etc. Limit the movement of emitters. |
| Scene/Id_Opaque, RenderView/Id_Opaque | Parts in the scene with an overall transparency of `0.01` or lower. | Reduce the use and density of parts. |
| Scene/Id_Transparent, RenderView/Id_Transparent | Parts in the scene with an overall transparency between `0.01` and `1`. | Reduce the use of partial transparency. |
| Scene/Id_Decals, RenderView/Id_Decals | Decals in the scene. | Reduce the use of decals on complex meshes. |
| Scene/Shadows | Shadow recalculation in the scene, usually performed on dynamic scenes and typical gameplay. Parts regardless of transparency cast shadows under the assumption that they contain decals. Not performed at quality levels below 4. | If this step takes too long, consider disabling [[30 Official Roblox Docs/API Reference/Classes/BasePart#CastShadow\|BasePart.CastShadow]] for complex meshes, parts with high partial transparency, and less important instances. Fully transparent parts that don't have decals or need decal shadows should have [[30 Official Roblox Docs/API Reference/Classes/BasePart#CastShadow\|BasePart.CastShadow]] disabled. See [[30 Official Roblox Docs/Performance Optimization/Improve performance#Mitigation\|Improve performance]]. |
| Perform/Present | Forwards to the GPU thread to perform rendering commands. | Reduce scene complexity in general. If this step is taking a long time, you might be limited by the GPU. |
| Perform/Present/waitUntilCompleted | Waits for the GPU to finish rendering the previous frame. | If this is generally happening a lot then the amount of things rendered is too high. The Frame Rate Manager helps with balancing this, but if it remains high, try following performance advice from the individual **Scene** tags. |
| LoadImage | Processes images into a format the engine can use. | Reduce the use of large images. |

## Scripts

| Label | Description | Performance advice |
| --- | --- | --- |
| Render/PreRender/fireBindToRenderSteppedCallbacks | Running functions bound to render step via [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToRenderStep\|RunService:BindToRenderStep()]]. | Ensure functions connected to this event do as little work as possible. |
| Render/PreRender/RunService.RenderStepped | Runs functions connected to the [[30 Official Roblox Docs/API Reference/Classes/RunService#RenderStepped\|RunService.RenderStepped]] event. | Ensure functions connected to this event do as little work as possible. |
| WaitingHybridScriptJob | Resumes scripts waiting using [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild\|Instance:WaitForChild()]] or `Globals.Roblox.wait()`. Usually performed 30 times per second. This step has an execution time budget to run waiting scripts. | If you have too many waiting scripts or scripts with a long runtime before yielding, this step is throttled and waits longer before it can run again. Reduce the amount of bound functions or long computations in this step. |
| GC | Luau's garbage collection cycle. | Pool tables and other collectable objects or try to reduce creating temporary tables. |
| Heartbeat/RunService.Heartbeat | Runs functions connected to the [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat\|RunService.Heartbeat]] event. | Reduce the amount or workload of functions connected to this event. Consider delaying or replacing expensive calculations or spreading computation across multiple frames. |

## Simulation

| Label | Description | Performance advice |
| --- | --- | --- |
| Distributed Physics Ownership | Determines whether the server or a client has authority over certain instances such as parts. | Reduce the amount of parts that frequently switch network ownership, especially those with common interaction. |
| Simulation/assemble | Updates a tree of connected objects (assemblies) used by the physics engine. | Reduce the amount of joints being created or destroyed. |
| Simulation/physicsSteppedTotal/physicsStepped | Runs the physics simulation. | Reduce the amount and complexity of physically simulated bodies. |
| Simulation/physicsSteppedTotal/physicsStepped/SpatialFilter/filterStep | Updates simulation islands, arranging parts according to network ownership, local simulation. Islands are non-interacting groups of parts which can be simulated independently. | Avoid setting network ownership frequently. Keep groups of parts far enough away from each other so they can be simulated separately. |
| Simulation/physicsSteppedTotal/physicsStepped/worldStep/stepContacts | Updates contacts between objects. | Reduce the amount of bodies colliding at once, or use simpler collision boxes. Cubes are better than complex meshes. |
| Simulation/physicsSteppedTotal/physicsStepped/worldStep/stepWorld **OR** stepWorldThrottled | Solves physics equations relating to connectors, buoyancy and [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoids]]. When the engine is overloaded and unable to simulate everything in real time, some steps may be throttled (**stepWorldThrottled**) and only "real-time assemblies" such as [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoids]] are simulated. | Depends on where the time is going based on the following three phases: **stepContacts**: narrow phase collision detection geometry tests. **Solver step**: integrate time and resolve collisions and other constraints **updateBroadphase**: update positions of assemblies in collision detection system and find possibly colliding narrow phase pairs. |
| notifyMovingAssemblies | Helps track how long primitives have been sleeping. |  |
| Simulation/physicsSteppedTotal/physicsStepped/interpolateNetworkedAssemblies | Interpolates assemblies not controlled by the current player. | Set the network owner of parts to the current player to reduce this; although this will usually cause more physics work to be done elsewhere. |
| Simulation/handleFallenParts | Removes parts that have fallen below [[30 Official Roblox Docs/API Reference/Classes/Workspace#FallenPartsDestroyHeight\|Workspace.FallenPartsDestroyHeight]]. | Lower the destroy height or reduce the amount of parts that fall to the destroy height. |
| Heartbeat/heartbeatInternal/workspaceOnHeartbeat/updateVisuallySleeping | Second part of **notifyMovingAssemblies**. |  |
| Heartbeat/RunService.Heartbeat | Runs functions connected to the [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat\|RunService.Heartbeat]] event to simulation and scripts contacts. Current description is generic enough to be not wrong. | Reduce the amount or workload of functions connected to [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat\|RunService.Heartbeat]]. |
| worldStep/stepContacts | Helps physics simulation step many contacts at once. | Reduce the number of colliding objects. |
| SolveBatch | Helps the physics simulation solve batches of objects' motion. |  |

## UI

| Label | Description | Performance advice |
| --- | --- | --- |
| Render/PreRender/UpdateInput | Updates and fires all user input related events if the user has performed input since the last frame. | Try and not do too much work directly as you get the input. Consider doing a minimal amount of processing for the input, and larger computations should be pushed off to another thread that happens later. |
| Render/PreRender/TweenService | Updates objects being tweened using [[30 Official Roblox Docs/API Reference/Classes/TweenService\|TweenService]] and calls completion callbacks, such as those used provided to [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TweenSize\|GuiObject:TweenSize()]] or [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TweenPosition\|GuiObject:TweenPosition()]]. | Reduce the number of objects being tweened using [[30 Official Roblox Docs/API Reference/Classes/TweenService\|TweenService]] and ensure callbacks do as little work as possible. |
| Heartbeat/TweenService | In the server, [[30 Official Roblox Docs/API Reference/Classes/TweenService\|TweenService]] runs in [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat\|RunService.Heartbeat]] instead of [[30 Official Roblox Docs/API Reference/Classes/RunService#PreRender\|RunService.PreRender]]. | Reduce the number of objects being tweened using [[30 Official Roblox Docs/API Reference/Classes/TweenService\|TweenService]] and ensure callbacks do as little work as possible. |
| Render/PreRender/UpdateUILayouts | Updates position and size for UI elements on all enabled [[30 Official Roblox Docs/API Reference/Classes/LayerCollector\|LayerCollectors]]. | See **UpdateUILayouts** labels below. |
| Render/PreRender/UpdateUILayouts/Rebuild Z-order list | Rebuilds the internal Z-order list of UI elements (not to be confused with [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex\|GuiObject.ZIndex]]) in a [[30 Official Roblox Docs/API Reference/Classes/LayerCollector\|LayerCollector]] on first render or when a new element is added, removed, or had its [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex\|GuiObject.ZIndex]] changed. | Reduce the number of UI elements in [[30 Official Roblox Docs/API Reference/Classes/LayerCollector\|LayerCollectors]] before first render and avoid frequently changing the parent and [[30 Official Roblox Docs/API Reference/Classes/GuiObject#ZIndex\|GuiObject.ZIndex]] of UI elements inside them. The more elements a [[30 Official Roblox Docs/API Reference/Classes/LayerCollector\|LayerCollector]] has, the worse it performs. |
| Render/PreRender/UpdateUILayouts/Layout | Updates position and size for UI elements in an individual [[30 Official Roblox Docs/API Reference/Classes/LayerCollector\|LayerCollector]]. Can contain a label with information about the relevant UI, along with the amount of Relayouts, Updates and Resizes. | Reduce the amount of UI elements being resized or repositioned, such as those managed by [[30 Official Roblox Docs/API Reference/Classes/UILayout\|UILayout]] and those tweened with [[30 Official Roblox Docs/API Reference/Classes/TweenService\|TweenService]], [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TweenSize\|GuiObject:TweenSize()]], or [[30 Official Roblox Docs/API Reference/Classes/GuiObject#TweenPosition\|GuiObject:TweenPosition()]]. Consider using fixed sizes for [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGuis]]. |

---
*Source: [Tag reference](https://create.roblox.com/docs/performance-optimization/microprofiler/tag-table) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
