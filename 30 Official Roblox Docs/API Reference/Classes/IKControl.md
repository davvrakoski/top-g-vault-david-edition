---
title: "IKControl"
description: "Specifies a control to generate a procedural animation pose using Inverse Kinematics."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/IKControl"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Specifies a control to generate a procedural animation pose using Inverse Kinematics.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation

## Description

**IKControl** instances generate procedural animation poses using Inverse Kinematics (IK). They allow you to make characters respond realistically to their environment.

For example, you can make a character place its hand on a door handle exactly, and the character will do so independently of its position. [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControls]] provide the advantage of needing to create much fewer animations for your game while giving your experience a more realistic and polished feel.

[[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControls]] must be a child of a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] or [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]] with an [[30 Official Roblox Docs/API Reference/Classes/Animator|Animator]] and have all of their required properties set properly, otherwise they don't have any effect. The required properties are [[30 Official Roblox Docs/API Reference/Classes/IKControl#Type|Type]], [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]], [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]], [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot|ChainRoot]]. As soon as those are set, the [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] modifies the pose of your character as you specify. The following code sample demonstrates how to set up your first [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] and get started with creating more realistic animations for your game.

You can use [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControls]] to make a character:

- Rotate its head and torso to look at a point of interest in the world.
- Modify its feet positions to respond to dynamic terrain. Adjust its legs and feet to place them accordingly on terrain with rocks and slopes.
- Hold a gun and place its hands appropriately on the grip without needing to create animations for each gun in the game.
- Aim at a point in the world, so that the tip of the gun point exactly at what you want to shoot. Especially useful in third person shooters.
- Place its hands on the steering wheel of a car and follow it when it rotates.
- Much more!

[[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] will override the animation for all the parts between the [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot|ChainRoot]] and the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]]. You can enable/disable it using [[30 Official Roblox Docs/API Reference/Classes/IKControl#Enabled|Enabled]] or change how much they have an effect over the underlying animation using the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Weight|Weight]]. Be careful: if you do not set up your [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControls]] correctly, you might generate bad and unrealistic poses!

*Code samples for this API (`IKControl-Setup`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/IKControl); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot\|ChainRoot]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The last part that you are interested in moving your character. For example, the upper arm. Must be an ancestor of [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] and be a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or a [[30 Official Roblox Docs/API Reference/Classes/Bone\|Bone]] in your character. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#Enabled\|Enabled]] | boolean | Toggles the control on and off. True by default. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The part that you are interested in moving to reach the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target\|Target]]. For example, the hand of your character. Must be a descendant of [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot\|ChainRoot]] and be a [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] or a [[30 Official Roblox Docs/API Reference/Classes/Bone\|Bone]] in your character. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffectorOffset\|EndEffectorOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | An additional offset applied on top of the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] in its local space to change where it moves. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#Offset\|Offset]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | An additional offset applied on top of the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target\|Target]] to change where the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] moves. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#Pole\|Pole]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | An optional instance that determines which way the chain bends. You can use this to specify which way an elbow or knee bends. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#Priority\|Priority]] | int | Specifies the order in which controls are solved. Higher values have higher priority. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#SmoothTime\|SmoothTime]] | float | Specifies the average number of seconds that it takes for the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] to smoothly reach the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target\|Target]]. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target\|Target]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The object that the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]] reaches for or points at. It can be anything that has a position in the world, such as [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]], [[30 Official Roblox Docs/API Reference/Classes/Bone\|Bone]], or [[30 Official Roblox Docs/API Reference/Classes/Motor6D\|Motor6D]]. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#Type\|Type]] | [[30 Official Roblox Docs/API Reference/Enums/IKControlType\|IKControlType]] | Specifies how the solver satisfies this control. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#Weight\|Weight]] | float | Specifies the weight of the IK control target. Should be in the [0, 1] range. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetChainCount\|GetChainCount()]] | int | Returns the number of segments in the IK chain between the [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot\|ChainRoot]] and the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]]. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetChainLength\|GetChainLength()]] | float | Returns the total length, in studs, of the IK chain between the [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot\|ChainRoot]] and the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]]. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetNodeLocalCFrame\|GetNodeLocalCFrame()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Returns the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the chain node at the given index, relative to its parent node in the chain. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetNodeWorldCFrame\|GetNodeWorldCFrame()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Returns the world-space [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] of the chain node at the given index. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetRawFinalTarget\|GetRawFinalTarget()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Returns the world-space target [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] the solver aims for before [[30 Official Roblox Docs/API Reference/Classes/IKControl#SmoothTime\|SmoothTime]] smoothing is applied. |
| [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetSmoothedFinalTarget\|GetSmoothedFinalTarget()]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Returns the world-space target [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] the solver aims for after [[30 Official Roblox Docs/API Reference/Classes/IKControl#SmoothTime\|SmoothTime]] smoothing is applied. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ChainRoot

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

By specifying a [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot|ChainRoot]] and an [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]], you instruct the [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] that it's allowed to move and rotate all parts between the two to move the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] to the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]]. For example, if you specify the LeftHand as [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] and LeftUpperArm as the [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot|ChainRoot]], the control moves 3 parts: the LeftHand, the LeftLowerArm, and the LeftUpperArm. Avoid setting [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot|ChainRoot]] as the actual root of the character because that produces unrealistic results.

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

This property allows you to toggle the IK control on and off. It's on by default. When [[30 Official Roblox Docs/API Reference/Classes/IKControl#Enabled|Enabled]] is false, the IK control is off and isn't resolved by the underlying solver.

### EndEffector

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] describes the last part in the chain of your character that you want to affect. For example, it could be the hand when you want to move the whole arm to reach a point. It can be a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] on a character, that has a [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] as its child, a [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] directly, a [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]], or a [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]]. The pivot of the selected [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] moves to the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]], so you can use [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] to modify which point of a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] should reach the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]].

### EndEffectorOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

The end-effector offset is an additional [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] applied on top of the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]] [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] that produces the final [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] used to place the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]]. By default, it's the identity CFrame, so if you don't set it, it has no effect and the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] uses the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]] [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] directly, which is specified in the local space of the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]].

Alternatively, you can use Attachments by setting an Attachment as [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]], which moves it to the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]] instead of the parts it's attached to, effectively obtaining the same result.

You can also use [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffectorOffset|EndEffectorOffset]] to modify which axis of the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] should point at the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]] when using `LookAt` as [[30 Official Roblox Docs/API Reference/Classes/IKControl#Type|Type]].

### Offset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

The offset is an additional [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] applied on top of the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]] [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] that produces the final [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] used to place the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]]. It's identity by default, so if you don't set it, it has no effect and the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] will use the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]] [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] directly. You can animate it to create procedural animations such as typing on a keyboard. It's useful when the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]] and [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] aren't aligned and you need to fix it with an additional rotation or translation.

### Pole

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/IKControl#Pole|Pole]] is an optional [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] that gives you control over how intermediate parts in your character should bend. It can be anything that has a position in the world, such as [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]], [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]], [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]], [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]]. It is by default `nil`. When you specify it, the underlying solver will make the parts bend towards it. When it is `nil`, the solver will try to make elbows and knees bend appropriately based on the limb of the character. The limb will be "Arm" when you select as [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] either the _LeftHand_ or _RightHand_ and as [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot|ChainRoot]] the corresponding _LeftUpperArm_ or _RightUpperArm_, and it will be "Leg" when you select as [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] either the _LeftFoot_ or _RightFoot_ and as [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot|ChainRoot]] the corresponding _LeftUpperLeg_ or _RightUpperLeg_. In all other cases, if you don't specify a pole, the chain might not bend as you expect.

### Priority

**Type:** int

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

When multiple controls are active on a character, the order in which they are solved by the underlying system affects the final generated pose. By changing this value, you specify the ordering in which controls are satisfied. Higher values have higher priority, and higher-priority controls are resolved later because their result might override the previous result of other controls. If you have multiple IK controls on a character and one is more important than the other, specify a lower priority for it. It is 0 by default, meaning all controls have the same priority.

### SmoothTime

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

This value specifies the average number of seconds that it takes for the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] to reach the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]]. The behavior is that of a critically-damped spring, where the rate of change is proportional to the distance to the target and no oscillations are present when approaching the target. Smaller values create a quicker convergence, and larger values create a slower convergence. A value of 0 disables smoothing. The default value is 0.05 to provide a very slight smoothing that makes the motion feel realistic.

### Target

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]] represents a point ([[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]) in the world that you want your [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] to reach. The exact behavior of reaching can be set via the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Type|Type]] property, and an additional [[30 Official Roblox Docs/API Reference/Classes/IKControl#Offset|Offset]] can be applied on top of it to modify it. If you set a [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]] that will be moved either by physics or a script, at each frame the [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] will try to satisfy it, automatically updating the point to reach.

### Type

**Type:** [[30 Official Roblox Docs/API Reference/Enums/IKControlType|IKControlType]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

By changing the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Type|Type]], you can change the behavior of the control. These are the available options:

- Transform: it's a full 6-DoF constraint. Aligns the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] to that of the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]].
- Position: aligns the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] position to that of the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]].
- Rotation: aligns the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] rotation to that of the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]].
- LookAt: moves and orients the whole chain to make an axis (by default the forward axis) on the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] point at a position in the world specified by [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]].

### Weight

**Type:** float

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Animation

You can control how much a given control affects the character pose by using this property. Values should be in the [0, 1] range. 0 means no effect, and 1 means full effect of the IK control. Values outside this range are truncated. Smoothly varying this value allows you to blend in or out a specific control to avoid jarring motion. It is 1 by default.

The weight determines the interpolation factor between the End-Effector and the IK target. Setting the weight to 0 doesn't disable the IK Control because other factors, including the SmoothTime smoothing factor and Pole, can still change the pose. To truly disable the IK Control, turn the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Enabled|Enabled]] property to false.

## Methods

### GetChainCount

```lua
IKControl:GetChainCount(): int
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the number of segments in the IK chain, meaning the number of parent-child links between the [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot|ChainRoot]] and the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]]. A chain of three parts has a count of `2`.

The chain always has one more node than it has segments, so the valid indices for [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetNodeWorldCFrame|GetNodeWorldCFrame()]] and [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetNodeLocalCFrame|GetNodeLocalCFrame()]] range from `1` to the returned count plus `1`. This returns `0` when the [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] doesn't resolve to a valid chain, such as when its required properties aren't set.

**Returns**

| Type | Description |
| --- | --- |
| int | The number of segments in the chain, or `0` if the chain isn't valid. |

### GetChainLength

```lua
IKControl:GetChainLength(): float
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the total length of the IK chain in studs, computed as the sum of the world-space distances between each consecutive part from the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] up to the [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot|ChainRoot]]. This is the maximum reach of the chain: a [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]] placed farther than this distance from the chain's base can't be reached, and the chain extends toward it as far as it can.

This returns `0` when the [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] doesn't resolve to a valid chain, such as when its required properties aren't set.

**Returns**

| Type | Description |
| --- | --- |
| float | The combined length of the chain in studs, or `0` if the chain isn't valid. |

### GetNodeLocalCFrame

```lua
IKControl:GetNodeLocalCFrame(index: int): CFrame
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the node at the given `index` in the solved IK chain, relative to its parent node. Nodes are ordered from the [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot|ChainRoot]] at index `1` to the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] at [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetChainCount|GetChainCount()]] plus `1`.

This reflects the pose most recently produced by the solver. Use [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetNodeWorldCFrame|GetNodeWorldCFrame()]] for the same node in world space. If the `index` is outside the valid range, or the [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] hasn't resolved a valid chain, this returns the identity [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | int |  | The 1-based position of the node in the chain, from `1` (the [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot\|ChainRoot]]) up to [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetChainCount\|GetChainCount()]] plus `1` (the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]]). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The node's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] in the local space of its parent node, or the identity [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] if the index is out of range or the chain hasn't been solved. |

### GetNodeWorldCFrame

```lua
IKControl:GetNodeWorldCFrame(index: int): CFrame
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the world-space [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the node at the given `index` in the solved IK chain. Nodes are ordered from the [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot|ChainRoot]] at index `1` to the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] at [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetChainCount|GetChainCount()]] plus `1`.

This reflects the pose most recently produced by the solver. Use [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetNodeLocalCFrame|GetNodeLocalCFrame()]] for the same node relative to its parent. If the `index` is outside the valid range, or the [[30 Official Roblox Docs/API Reference/Classes/IKControl|IKControl]] hasn't resolved a valid chain, this returns the identity [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `index` | int |  | The 1-based position of the node in the chain, from `1` (the [[30 Official Roblox Docs/API Reference/Classes/IKControl#ChainRoot\|ChainRoot]]) up to [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetChainCount\|GetChainCount()]] plus `1` (the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector\|EndEffector]]). |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The node's world-space [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]], or the identity [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] if the index is out of range or the chain hasn't been solved. |

### GetRawFinalTarget

```lua
IKControl:GetRawFinalTarget(): CFrame
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] that the solver aims the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] at on the current frame, before [[30 Official Roblox Docs/API Reference/Classes/IKControl#SmoothTime|SmoothTime]] smoothing is applied. This is the [[30 Official Roblox Docs/API Reference/Classes/IKControl#Target|Target]] after [[30 Official Roblox Docs/API Reference/Classes/IKControl#Weight|Weight]], [[30 Official Roblox Docs/API Reference/Classes/IKControl#Offset|Offset]], and [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffectorOffset|EndEffectorOffset]] are factored in. For a `LookAt` [[30 Official Roblox Docs/API Reference/Classes/IKControl#Type|Type]], it's the world position the chain is oriented toward.

Compare with [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetSmoothedFinalTarget|GetSmoothedFinalTarget()]], which returns the same target after smoothing. The two are equal when [[30 Official Roblox Docs/API Reference/Classes/IKControl#SmoothTime|SmoothTime]] is `0`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The final target [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]], in world space, before smoothing. |

### GetSmoothedFinalTarget

```lua
IKControl:GetSmoothedFinalTarget(): CFrame
```

**Thread safety:** Unsafe · **Capabilities:** Animation

Returns the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] that the solver aims the [[30 Official Roblox Docs/API Reference/Classes/IKControl#EndEffector|EndEffector]] at on the current frame, after [[30 Official Roblox Docs/API Reference/Classes/IKControl#SmoothTime|SmoothTime]] smoothing has been applied to the raw target from [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetRawFinalTarget|GetRawFinalTarget()]]. Smoothing uses a critically damped spring that eases toward the raw value over roughly [[30 Official Roblox Docs/API Reference/Classes/IKControl#SmoothTime|SmoothTime]] seconds.

Because [[30 Official Roblox Docs/API Reference/Classes/IKControl#SmoothTime|SmoothTime]] defaults to `0.05`, this value trails [[30 Official Roblox Docs/API Reference/Classes/IKControl#GetRawFinalTarget|GetRawFinalTarget()]] slightly while the target moves. When `SmoothTime` is `0`, this returns the same [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] as `GetRawFinalTarget`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | The final target [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]], in world space, after smoothing. |

---
*Source: [IKControl](https://create.roblox.com/docs/reference/engine/classes/IKControl) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
