---
title: "Animator"
description: "Responsible for the playback and replication of `Animations`."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Animator"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Responsible for the playback and replication of [[30 Official Roblox Docs/API Reference/Classes/Animation|Animations]].*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

`Animator` is the main class responsible for the playback and replication of [[30 Official Roblox Docs/API Reference/Classes/Animation|Animations]]. All replication of playing [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] is handled through the `Animator` instance.

See [[30 Official Roblox Docs/Animation/Animation in Roblox|Animation in Roblox]] to learn how to create and add pre-built or custom animations to your game.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Animator#EvaluationThrottled\|EvaluationThrottled]] | boolean | Indicates whether animation evaluation was throttled (skipped) this frame for this [[30 Official Roblox Docs/API Reference/Classes/Animator\|Animator]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Animator#PreferLodEnabled\|PreferLodEnabled]] | boolean | Controls whether animation LOD throttling is allowed for this [[30 Official Roblox Docs/API Reference/Classes/Animator\|Animator]]. When set to `false`, animations always evaluate at full fidelity. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Animator#ApplyJointVelocities\|ApplyJointVelocities()]] | () | Computes relative velocities between parts and applies them to [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1\|Motor6D.Part1]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Animator#GetPlayingAnimationTracks\|GetPlayingAnimationTracks()]] | Array | Returns the list of currently active [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTracks]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Animator#GetTrackByAnimationId\|GetTrackByAnimationId()]] | [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]]? | Returns an existing [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] on this [[30 Official Roblox Docs/API Reference/Classes/Animator\|Animator]] that was loaded from an [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] with the given animation ID. Unlike [[30 Official Roblox Docs/API Reference/Classes/Animator#LoadAnimation\|LoadAnimation()]], this method does not create a new [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] instance. |
| [[30 Official Roblox Docs/API Reference/Classes/Animator#LoadAnimation\|LoadAnimation()]] | [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] | Loads an [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] onto an `Animator`, returning an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Animator#StepAnimations\|StepAnimations()]] | () | Increments the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#TimePosition\|AnimationTrack.TimePosition]] of all playing [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTracks]] that are loaded onto the `Animator`, applying the offsets to the model associated with the `Animator`. For use in the command bar or by plugins only. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Animator#AnimationPlayed\|AnimationPlayed]] | `animationTrack` | Fires when the `Animator` starts playing an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### EvaluationThrottled

**Type:** boolean

**Thread safety:** Safe · **Category:** Behavior · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `ReadOnly`, `NotReplicated`

A read-only property that indicates whether animation evaluation was throttled (skipped) on this frame. When `true`, the [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] reused the pose from the previous frame instead of evaluating fresh animation data.

This property is useful when layering procedural animation on top of [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#Transform|Transform]] — if evaluation was throttled, applying procedural offsets would fight the stale pose and should be skipped:

*Code samples for this member (`Animator-EvaluationThrottled`) are published on the source page; their code is not part of the open-source repo.*

### PreferLodEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

When `true` (the default), the engine may reduce animation evaluation frequency for remotely-simulated characters based on distance, screen coverage, and frame budget. When set to `false`, LOD-based throttling is disabled and this [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] always evaluates at full fidelity.

Setting this to `false` is useful for important NPCs or characters that must always animate smoothly regardless of distance. However, disabling LOD for many animators simultaneously can impact performance.

Note that this property only controls per-animator LOD throttling. The workspace-level [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace.ClientAnimatorThrottlingMode]] setting can independently disable or enable throttling for all animators.

## Methods

### ApplyJointVelocities

```lua
Animator:ApplyJointVelocities(motors: Variant): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Given the current set of [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] playing and their current times and play speeds, this method computes relative velocities between the parts and applies them to [[30 Official Roblox Docs/API Reference/Classes/JointInstance#Part1|Motor6D.Part1]] (the part which `Animator` considers the "child" part). These relative velocity calculations and assignments happen in the order provided.

This method doesn't apply velocities for a given joint if both of the joint's parts are currently part of the same assembly; for example, if they are still connected directly or indirectly by motors or welds.

Note that this method doesn't disable or remove the joints for you. You must disable or otherwise remove the rigid joints from the assembly before calling this method.

The given [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6Ds]] are not required to be descendants of the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. Removing the joints from the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] before calling this method is supported.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `motors` | Variant |  | An array of [[30 Official Roblox Docs/API Reference/Classes/Motor6D\|Motor6D]] instances to compute and apply velocities for. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetPlayingAnimationTracks

```lua
Animator:GetPlayingAnimationTracks(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the list of currently active [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] on this [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]]. This includes tracks that are fading out and does **not** depend on [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#IsPlaying|AnimationTrack.IsPlaying]] being `true`; as a result, [[30 Official Roblox Docs/API Reference/Classes/Animator#GetTrackByAnimationId|GetTrackByAnimationId()]] may be a better option to get a specific [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] by its asset ID. Fading tracks are automatically stopped and removed from this list once their blend weight reaches zero.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of currently active [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTracks]] on this [[30 Official Roblox Docs/API Reference/Classes/Animator\|Animator]], including tracks that are fading out. |

### GetTrackByAnimationId

```lua
Animator:GetTrackByAnimationId(animationId: ContentId): AnimationTrack?
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns an existing [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] on this [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] that was loaded from an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] with the given animation ID. Unlike [[30 Official Roblox Docs/API Reference/Classes/Animator#LoadAnimation|LoadAnimation()]], this method does **not** create a new [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] instance; it only looks up a track that was previously loaded.

If multiple tracks have been loaded for the same animation ID, this method returns the first match. If no matching track exists, it returns `nil`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `animationId` | ContentId |  | The asset ID of the [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] whose loaded track should be retrieved. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]]? | The first [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] on this `Animator` that was loaded from the given animation ID, or `nil` if none has been loaded. |

*Code samples for this member (`Animator-GetTrackByAnimationId`) are published on the source page; their code is not part of the open-source repo.*

### LoadAnimation

```lua
Animator:LoadAnimation(animation: Animation): AnimationTrack
```

**Thread safety:** Unsafe · **Capabilities:** Animation

This method loads the given [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] onto this `Animator`, returning a playable [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]]. When called on an `Animator` within models that the client has network ownership of, for example the local player's character or from [[30 Official Roblox Docs/API Reference/Classes/BasePart#SetNetworkOwner|BasePart:SetNetworkOwner()]], this method also loads the animation for the server as well.

Note that the `Animator` must be in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] before making a call to `LoadAnimation()` or else it will be unable to retrieve the [[30 Official Roblox Docs/API Reference/Classes/AnimationClipProvider|AnimationClipProvider]] service and throw an error.

#### Warning

Do **not** use `LoadAnimation()` in an attempt to retrieve an existing track. Calling `LoadAnimation()` always creates a **new** [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] instance which may impact game performance if overused. Instead, use [[30 Official Roblox Docs/API Reference/Classes/Animator#GetTrackByAnimationId|GetTrackByAnimationId()]] when you need to look up a track that was already loaded.

#### Loading an Animation on Client or Server

In order for [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] to replicate correctly, it's important to know when they should be loaded on the client or on the server:

- If an `Animator` is a descendant of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] or [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]] in a player's [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]], animations started on that player's client will be replicated to the server and other clients.

- If the `Animator` is **not** a descendant of a player character, its animations must be loaded and started on the server to replicate.

The `Animator` object must be initially created on the server and replicated to clients for animation replication to work at all. If an `Animator` is created locally, then [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] loaded with that `Animator` will not replicate.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `animation` | [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] to be used. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] | A new [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] linked to the given [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]]. |

### StepAnimations

```lua
Animator:StepAnimations(deltaTime: float): ()
```

**Thread safety:** Unsafe · **Capabilities:** Animation, PluginOrOpenCloud

Increments the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#TimePosition|AnimationTrack.TimePosition]] of all playing [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] that are loaded onto the `Animator`, applying the offsets to the model associated with the `Animator`. For use in the command bar or by plugins only.

The `deltaTime` parameter determines the number of seconds to increment on the animation's progress. Typically this method will be called in a loop to preview the length of an animation (see example).

Note that once animations have stopped playing, the model's joints will need to be manually reset to their original positions (see example).

#### Access

This method requires Plugin-level security. It can only be called from the Studio command bar or from a [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugin]]. Regular [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] and [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] instances cannot call this method.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `deltaTime` | float |  | The amount of time in seconds animation playback is to be incremented. by. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Animator-StepAnimations`) are published on the source page; their code is not part of the open-source repo.*

## Events

### AnimationPlayed

```lua
Animator.AnimationPlayed(animationTrack: AnimationTrack)
```

**Capabilities:** Animation

Fires for all [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Play|AnimationTrack:Play()]] calls on [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] created and owned by the `Animator`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `animationTrack` | [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] |  | The [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] that began playing. |

---
*Source: [Animator](https://create.roblox.com/docs/reference/engine/classes/Animator) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
