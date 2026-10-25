---
title: "AnimationConstraint"
description: "Aligns two `BaseParts` with an animate-able kinematic or force-based joint that supports physical simulation (ragdoll, arm strength). The default joint type for R15 avatar rigs."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/AnimationConstraint"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Aligns two [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] with an animate-able kinematic or force-based joint that supports physical simulation (ragdoll, arm strength). The default joint type for R15 avatar rigs.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

#### Replaces Motor6D for Avatar rigs

As part of the [Avatar Joint Upgrade](https://devforum.roblox.com/t/avatar-joint-upgrade-for-physically-simulated-character-movement-is-now-live/4298561), `AnimationConstraint` is the **replacement for [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]]** in [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging|R15 player character rigs]]. When [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#AvatarJointUpgrade|AvatarJointUpgrade]] is enabled (the default for new experiences), player characters spawn with AnimationConstraints instead of Motor6Ds. Unlike Motor6D, AnimationConstraint supports both kinematic animation and force-based physical simulation — enabling ragdoll physics, arm strength, and other physically simulated character movement without rebuilding the rig.

#### Migrating from Motor6D

If you have existing code that uses Motor6D for character rigs, note these key differences. See also the [Phase 2 migration recommendations](https://devforum.roblox.com/t/avatar-joint-upgrade-aju-phase-2-rollout-updated-migration-recommendations/4656414).

- **Finding joints**: Use `:FindFirstChildWhichIsA("AnimationConstraint")` instead of `:FindFirstChildOfClass("Motor6D")`. For code that must support both old and new rigs, check for AnimationConstraint first, then fall back to Motor6D.
- **C0, C1, Part0, Part1**: These properties exist on AnimationConstraint as **read-only** aliases for backwards compatibility. They map to `Attachment0.CFrame`, `Attachment1.CFrame`, `Attachment0.Parent`, and `Attachment1.Parent` respectively. Do not attempt to write to them.
- **Do not modify RigAttachment.CFrame directly** — this disrupts animation retargeting and causes performance issues.
- **Transform**: Works identically to [[30 Official Roblox Docs/API Reference/Classes/Motor6D#Transform|Motor6D.Transform]] — the [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] writes to it each frame. Layer procedural animations by multiplying into `Transform` during [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|RunService.PreSimulation]], which stacks with active animation tracks without breaking retargeting.
- **IsKinematic**: When `true` (default), behavior is equivalent to Motor6D. Set to `false` to enable force-based physical simulation.
- **Type checks**: `animConstraint:IsA("Motor6D")` returns `false`. Update any `IsA("Motor6D")` guards to also accept `"AnimationConstraint"`.
- **Server replication**: Instead of setting C0 on the server, use client-side animation evaluation and synchronize data through custom Attributes or [[30 Official Roblox Docs/API Reference/Classes/UnreliableRemoteEvent|UnreliableRemoteEvent]].

##### Example: Procedural neck rotation

```lua
-- Before (Motor6D): writing to C0 directly
local originalC0 = neck.C0
RunService.RenderStepped:Connect(function()
    neck.C0 = originalC0 * computeNeckRotation()
end)

-- After (AnimationConstraint): multiplying into Transform during PreSimulation
RunService.PreSimulation:Connect(function()
    if not animator.EvaluationThrottled then
        neck.Transform = computeNeckRotation() * neck.Transform
    end
end)
```

#### Description

An `AnimationConstraint` constrains its [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] so that they're offset by [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#Transform|Transform]]. When [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#IsKinematic|IsKinematic]] is `true`, the parts follow the transform perfectly (identical to Motor6D behavior). When `false`, the constraint applies forces and torques limited by [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxForce|MaxForce]] and [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxTorque|MaxTorque]], enabling physically simulated character movement.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#AngularDamping\|AngularDamping]] | float | Damping ratio for the rotational part of the constraint. Higher values reduce oscillation around the target orientation. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#AngularStrength\|AngularStrength]] | float | Controls how rigidly the constraint enforces the rotational part of its target [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#Transform\|Transform]]. Higher values track the target orientation more stiffly. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#IsKinematic\|IsKinematic]] | boolean | Toggles whether the constraint is kinematic or physically simulated. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#LinearDamping\|LinearDamping]] | float | Damping ratio for the translational part of the constraint. Higher values reduce oscillation around the target position. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#LinearStrength\|LinearStrength]] | float | Controls how rigidly the constraint enforces the translational part of its target [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#Transform\|Transform]]. Higher values track the target position more stiffly. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxForce\|MaxForce]] | float | Maximum force magnitude the constraint can apply to achieve its goal. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxTorque\|MaxTorque]] | float | Maximum torque the constraint can apply to reach its goal. |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#Transform\|Transform]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Describes the current animation offset of the constraint joint. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Constraint|Constraint]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AngularDamping

**Type:** float

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics, Animation

The damping ratio (ζ) applied to the rotational part of the constraint. Only used if [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#IsKinematic|IsKinematic]] is `false`.

A value of `1` corresponds to **critical damping**, where the constraint reaches its target orientation as fast as possible without overshoot in the absence of other forces or constraints. Values less than `1` are under-damped and oscillate around the target before settling. Values greater than `1` are over-damped and approach the target more slowly without oscillation. A value of `0` applies no angular damping, causing the constraint to oscillate.

Even with this property set to `1`, an `AnimationConstraint` at the root of a multi-body mechanism may still exhibit low-frequency oscillation because it does not "see" the full effective mass of the downstream chain. You can compensate by increasing both [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#AngularStrength|AngularStrength]] and `AngularDamping` beyond their defaults.

### AngularStrength

**Type:** float

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics, Animation

Controls how rigidly the constraint enforces the rotational part of its target [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#Transform|Transform]]. Only used if [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#IsKinematic|IsKinematic]] is `false`. The resulting torque is capped by [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxTorque|MaxTorque]].

`AngularStrength` is defined as a normalized natural frequency, `AngularStrength = f / 60`, where `f` is the target natural frequency in Hz. The default value of `1` corresponds to a target frequency of 60 Hz and produces strong tracking of the target orientation. A value of `0` applies no torque. Values less than `1` produce a softer, more compliant rotational response, and values greater than `1` produce a stiffer response.

Use values significantly greater than `1` with caution, as they may cause the simulation to become unstable.

### IsKinematic

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Physics, Animation

When `true`, the connected parts follow the [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#Transform|Transform]] perfectly without participating in physics simulation. When `false`, the connected parts follow the trajectory using forces and torques limited by [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxForce|MaxForce]] and [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxTorque|MaxTorque]].

### LinearDamping

**Type:** float

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics, Animation

The damping ratio (ζ) applied to the translational part of the constraint. Only used if [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#IsKinematic|IsKinematic]] is `false`.

A value of `1` corresponds to **critical damping**, where the constraint reaches its target position as fast as possible without overshoot in the absence of other forces or constraints. Values less than `1` are under-damped and oscillate around the target before settling. Values greater than `1` are over-damped and approach the target more slowly without oscillation. A value of `0` applies no linear damping, causing the constraint to oscillate.

`LinearDamping` has no effect when [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#LinearStrength|LinearStrength]] is `0`.

### LinearStrength

**Type:** float

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics, Animation

Controls how rigidly the constraint enforces the translational part of its target [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#Transform|Transform]]. Only used if [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#IsKinematic|IsKinematic]] is `false`. The resulting force is capped by [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#MaxForce|MaxForce]].

`LinearStrength` uses the same normalized natural frequency definition as [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#AngularStrength|AngularStrength]], `LinearStrength = f / 60`, where `f` is the target natural frequency in Hz. The default value of `1` corresponds to a target frequency of 60 Hz and produces strong tracking of the target position. A value of `0` applies no force. Values less than `1` produce a softer, more compliant positional response, and values greater than `1` produce a stiffer response.

Splitting angular and linear parameters lets you make orientation tracking stiff while keeping positional tracking soft, or vice-versa. As with [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#AngularStrength|AngularStrength]], use values significantly greater than `1` with caution, as they may cause the simulation to become unstable.

### MaxForce

**Type:** float

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics, Animation

Maximum force magnitude the constraint can apply to achieve its goal. Only used if [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#IsKinematic|IsKinematic]] is `false`.

### MaxTorque

**Type:** float

**Thread safety:** ReadSafe · **Category:** Compliance · **Loaded/Saved:** true/true · **Capabilities:** Physics, Animation

Maximum torque the constraint can use to reach its goal. Only used if [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#IsKinematic|IsKinematic]] is `false`.

### Transform

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Physics, Animation

The internal [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] that is manipulated when the constraint is being animated.

Note that `AnimationConstraint` transforms are not applied immediately, but rather as a batch in a parallel job after [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|RunService.PreSimulation]], immediately before physics steps. The deferred batch update is much more efficient than many immediate updates. If the `AnimationConstraint` is part of an animated model with an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]], then [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint#Transform|Transform]] is usually overwritten every frame by the [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] after [[30 Official Roblox Docs/API Reference/Classes/RunService#PreAnimation|RunService.PreAnimation]] and before [[30 Official Roblox Docs/API Reference/Classes/RunService#PreSimulation|RunService.PreSimulation]].

---
*Source: [AnimationConstraint](https://create.roblox.com/docs/reference/engine/classes/AnimationConstraint) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
