---
title: "Humanoid"
description: "A special object that gives models the functionality of a character."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Humanoid"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A special object that gives models the functionality of a character.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The Humanoid is a special object that gives models the functionality of a character. It grants the model with the ability to physically walk around and interact with various components of a Roblox experience. Humanoids are always parented inside of a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], and the model is expected to be an assembly of [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] and [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]]; the root part of the assembly is expected to be named `HumanoidRootPart`. It also expects a part named `Head` to be connected to the character's torso part, either directly or indirectly. By default, there are two official types of character rigs supplied by Roblox, each with their own set of rules:

## R6

- A basic character rig that uses 6 parts for limbs.
- The `Head` part must be attached to a part named `Torso`, or the Humanoid will die immediately.
- BodyPart appearances are applied using [[30 Official Roblox Docs/API Reference/Classes/CharacterMesh|CharacterMesh]] objects.
- Certain properties, such as [[30 Official Roblox Docs/API Reference/Classes/Humanoid#LeftLeg|Humanoid.LeftLeg]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RightLeg|Humanoid.RightLeg]], only work with R6.

## R15

- More complex than R6, but also far more flexible and robust.
- Uses 15 parts for limbs.
- The `Head` part must be attached to a part named `UpperTorso` or the Humanoid will die immediately.
- BodyPart appearances have to be assembled directly.
- Can be dynamically rescaled by using special [[30 Official Roblox Docs/API Reference/Classes/NumberValue|NumberValue]] objects parented inside of the Humanoid.
- The Humanoid will automatically create [[30 Official Roblox Docs/API Reference/Classes/Vector3Value|Vector3Value]] objects named `OriginalSize` inside of each limb.
- If a NumberValue is parented inside of the Humanoid and is named one of the following, it will be used to control the scaling functionality:
  - BodyDepthScale
  - BodyHeightScale
  - BodyWidthScale
  - HeadScale

*Code samples for this API (`Walking-Camera-Bobble-Effect`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Humanoid); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AutoJumpEnabled\|AutoJumpEnabled]] | boolean | Sets whether the character will automatically jump when they hit an obstacle as a player on a mobile device. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AutomaticScalingEnabled\|AutomaticScalingEnabled]] | boolean | When Enabled, AutomaticScalingEnabled causes the size of the character to change in response to the values in the humanoid's child scale values changing. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AutoRotate\|AutoRotate]] | boolean | AutoRotate sets whether or not the Humanoid will automatically rotate to face in the direction they are moving in. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#BreakJointsOnDeath\|BreakJointsOnDeath]] | boolean | Determines whether the humanoid's joints break when in the [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType.Dead]] state. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#CameraOffset\|CameraOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | An offset applied to the Camera's subject position when its CameraSubject is set to this Humanoid. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#CollisionType\|CollisionType]] | [[30 Official Roblox Docs/API Reference/Enums/HumanoidCollisionType\|HumanoidCollisionType]] | **Deprecated.** Selects the [[30 Official Roblox Docs/API Reference/Enums/HumanoidCollisionType\|Enum.HumanoidCollisionType]] for R15 and Rthro non-player characters. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType\|DisplayDistanceType]] | [[30 Official Roblox Docs/API Reference/Enums/HumanoidDisplayDistanceType\|HumanoidDisplayDistanceType]] | Controls the distance behavior of the humanoid's name and health display. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayName\|DisplayName]] | string | Sets the text of a Humanoid, displayed above their head. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#EvaluateStateMachine\|EvaluateStateMachine]] | boolean | Used to disable the internal physics and state machine of the Humanoid. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#FloorMaterial\|FloorMaterial]] | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] | Describes the [[30 Official Roblox Docs/API Reference/Enums/Material\|Enum.Material]] that the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is currently standing on. If the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] isn't standing on anything, the value of this property will be _Air_. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health\|Health]] | float | Describes the current health of the Humanoid on the range [0, [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth\|Humanoid.MaxHealth]]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayDistance\|HealthDisplayDistance]] | float | Used in conjunction with the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType\|DisplayDistanceType]] property to control the distance from which a humanoid's health bar can be seen. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayType\|HealthDisplayType]] | [[30 Official Roblox Docs/API Reference/Enums/HumanoidHealthDisplayType\|HumanoidHealthDisplayType]] | Controls when the humanoid's health bar is allowed to be displayed. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HipHeight\|HipHeight]] | float | Determines the distance off the ground the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart\|Humanoid.RootPart]] should be. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Jump\|Jump]] | boolean | If `true`, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] jumps with an upwards force. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpHeight\|JumpHeight]] | float | Provides control over the height that the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] jumps to. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpPower\|JumpPower]] | float | Determines how much upwards force is applied to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] when jumping. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#LeftLeg\|LeftLeg]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | **Deprecated.** A reference to the humanoid's _Left Leg_ part. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth\|MaxHealth]] | float | The maximum value of a humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health\|Health]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#maxHealth\|maxHealth]] | float | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxSlopeAngle\|MaxSlopeAngle]] | float | The maximum slope angle that a humanoid can walk on without slipping. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveDirection\|MoveDirection]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Describes the direction that the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is walking in. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameDisplayDistance\|NameDisplayDistance]] | float | Used in conjunction with the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType\|Humanoid.DisplayDistanceType]] property to control the distance from which a humanoid's name can be seen. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#NameOcclusion\|NameOcclusion]] | [[30 Official Roblox Docs/API Reference/Enums/NameOcclusion\|NameOcclusion]] | Controls whether a humanoid's name and health bar can be seen behind walls or other objects. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#PlatformStand\|PlatformStand]] | boolean | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is currently in the [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType.PlatformStanding]] state. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RequiresNeck\|RequiresNeck]] | boolean | Allows developers to disable the behavior where a player `Character\|character` dies if the Neck [[30 Official Roblox Docs/API Reference/Classes/Motor6D\|Motor6D]] is removed or disconnected even momentarily. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RightLeg\|RightLeg]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | **Deprecated.** A reference to the humanoid's _Right Leg_ part. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RigType\|RigType]] | [[30 Official Roblox Docs/API Reference/Enums/HumanoidRigType\|HumanoidRigType]] | Describes whether this [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is utilizing the legacy R6 character rig, or the new R15 character rig. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart\|RootPart]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | A reference to the humanoid's `HumanoidRootPart` object. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SeatPart\|SeatPart]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | A reference to the seat that a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is currently sitting in, if any. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Sit\|Sit]] | boolean | Describes whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is currently sitting. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#TargetPoint\|TargetPoint]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Describes the 3D position where the [[30 Official Roblox Docs/API Reference/Classes/Player\|Player]] controlling the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] last clicked in the world while using a [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Torso\|Torso]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | **Deprecated.** A reference to a humanoid's root driving part. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#UseJumpPower\|UseJumpPower]] | boolean | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpHeight\|JumpHeight]] (false) or [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpPower\|Humanoid.JumpPower]] (true) property is used. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkSpeed\|WalkSpeed]] | float | Describes the humanoid's maximum movement speed in studs per second. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPart\|WalkToPart]] | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | A reference to a part whose position is trying to be reached by a humanoid. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPoint\|WalkToPoint]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The position that a humanoid is trying to reach, after a call to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveTo\|Humanoid:MoveTo()]] is made. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AddAccessory\|AddAccessory()]] | () | Attaches the specified [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] to the humanoid's parent. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AddCustomStatus\|AddCustomStatus()]] | boolean | **Deprecated.** Adds a custom status to the Humanoid. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AddStatus\|AddStatus()]] | boolean | **Deprecated.** Adds a BoolValue to the Humanoid's _Status_ object. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescription\|ApplyDescription()]] | () | **Deprecated.** Makes the character's look match that of the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync\|ApplyDescriptionAsync()]] | () | Makes the character's look match that of the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]]. If `HumanoidDescription.UseAvatarSettings` is true, the Avatar Settings for the experience will also be applied to the character. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionReset\|ApplyDescriptionReset()]] | () | **Deprecated.** Makes the character's look match that of the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]], even after external changes. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionResetAsync\|ApplyDescriptionResetAsync()]] | () | Makes the character's look match that of the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]], even after external changes. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#BuildRigFromAttachments\|BuildRigFromAttachments()]] | () | Assembles a tree of [[30 Official Roblox Docs/API Reference/Classes/Motor6D\|Motor6D]] joints by attaching together [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] objects in a humanoid's character. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ChangeState\|ChangeState()]] | () | Sets the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] to enter the given [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#EquipTool\|EquipTool()]] | () | Makes the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] equip the given [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetAccessories\|GetAccessories()]] | Array | Returns an array of [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] objects that the humanoid's parent is currently wearing. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetAppliedDescription\|GetAppliedDescription()]] | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | Returns a copy of the humanoid's cached [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] which describes its current look. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetBodyPartR15\|GetBodyPartR15()]] | [[30 Official Roblox Docs/API Reference/Enums/BodyPartR15\|BodyPartR15]] | Pass a body part to this method (the body part should be a sibling of Humanoid, and a child of a Model) to get the [[30 Official Roblox Docs/API Reference/Enums/BodyPartR15\|Enum.BodyPartR15]] of the [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetLimb\|GetLimb()]] | [[30 Official Roblox Docs/API Reference/Enums/Limb\|Limb]] | Returns the [[30 Official Roblox Docs/API Reference/Enums/Limb\|Enum.Limb]] enum that is associated with the given [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetMoveVelocity\|GetMoveVelocity()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the current intended movement velocity of the Humanoid. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetPlayingAnimationTracks\|GetPlayingAnimationTracks()]] | Array | **Deprecated.** Returns an array of all [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTracks]] that are currently being played on the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetRelativeVelocityAtFloor\|GetRelativeVelocityAtFloor()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Returns the humanoid's actual physical velocity relative to the surface it is standing on as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] in world-space orientation. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState\|GetState()]] | [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|HumanoidStateType]] | Returns the humanoid's current [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetStateEnabled\|GetStateEnabled()]] | boolean | Returns whether a [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]] is enabled for the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetStatuses\|GetStatuses()]] | Array | **Deprecated.** Returns a table of the Humanoid's statuses, and custom statuses. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HasCustomStatus\|HasCustomStatus()]] | boolean | **Deprecated.** Returns boolean based on if custom statuses exist. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HasStatus\|HasStatus()]] | boolean | **Deprecated.** Returns a boolean based on if a status exists. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#LoadAnimation\|LoadAnimation()]] | [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] | **Deprecated.** Loads an [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] onto a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]], returning an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] that can be used for playback. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#loadAnimation\|loadAnimation()]] | [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Move\|Move()]] | () | Causes the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] to walk in the given direction. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveTo\|MoveTo()]] | () | Causes the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] to attempt to walk to the given location by setting the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPoint\|Humanoid.WalkToPoint]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPart\|Humanoid.WalkToPart]] properties. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#PlayEmote\|PlayEmote()]] | boolean | **Deprecated.** Plays emotes and returns if was successfully ran. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#PlayEmoteAsync\|PlayEmoteAsync()]] | boolean | Plays emotes and returns if was successfully ran. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RemoveAccessories\|RemoveAccessories()]] | () | Removes all [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] objects worn by the humanoid's parent. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RemoveCustomStatus\|RemoveCustomStatus()]] | boolean | **Deprecated.** Removes the defined custom status from the Status model in the Humanoid.. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RemoveStatus\|RemoveStatus()]] | boolean | **Deprecated.** Removes the defined status from the Status model in the Humanoid. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ReplaceBodyPartR15\|ReplaceBodyPartR15()]] | boolean | Dynamically replaces a Humanoid body part with a different part. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SetStateEnabled\|SetStateEnabled()]] | () | Sets whether a given [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]] is enabled for the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#TakeDamage\|TakeDamage()]] | () | Lowers the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health\|Humanoid.Health]] of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] by the given _amount_ if it is not protected by a [[30 Official Roblox Docs/API Reference/Classes/ForceField\|ForceField]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#takeDamage\|takeDamage()]] | () | **Deprecated.**  |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#UnequipTools\|UnequipTools()]] | () | Unequips any [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]] currently equipped by the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |

### Events

| Event | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AnimationPlayed\|AnimationPlayed]] | `animationTrack` | **Deprecated.** Fires when an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] begins playing on the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionFinished\|ApplyDescriptionFinished]] | `description` | Fires when a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] has finished being applied to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Climbing\|Climbing]] | `speed` | Fires when the speed at which a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is climbing changes. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#CustomStatusAdded\|CustomStatusAdded]] | `status` | **Deprecated.** Fired when a status is added to the Humanoid. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#CustomStatusRemoved\|CustomStatusRemoved]] | `status` | **Deprecated.** Fired when a status is removed from the Humanoid. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Died\|Died]] |  | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] dies. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#FallingDown\|FallingDown]] | `active` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] enters or leaves the `FallingDown` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#FreeFalling\|FreeFalling]] | `active` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] enters or leaves the `Freefall` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GettingUp\|GettingUp]] | `active` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] enters or leaves the `GettingUp` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthChanged\|HealthChanged]] | `health` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health\|Humanoid.Health]] changes (or when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth\|Humanoid.MaxHealth]] is set). |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Jumping\|Jumping]] | `active` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] enters and leaves the `Jumping` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveToFinished\|MoveToFinished]] | `reached` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] finishes walking to a goal declared by [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveTo\|Humanoid:MoveTo()]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#PlatformStanding\|PlatformStanding]] | `active` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] enters or leaves the `PlatformStanding` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Ragdoll\|Ragdoll]] | `active` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] enters or leaves the `Ragdoll` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Running\|Running]] | `speed` | Fires when the speed at which a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is running changes. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Seated\|Seated]] | `active`, `currentSeatPart` | Fired when a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] either sits in a [[30 Official Roblox Docs/API Reference/Classes/Seat\|Seat]] or [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat\|VehicleSeat]] or gets up. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StateChanged\|StateChanged]] | `old`, `new` | Fires when the state of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is changed. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StateEnabledChanged\|StateEnabledChanged]] | `state`, `isEnabled` | Fires when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SetStateEnabled\|Humanoid:SetStateEnabled()]] is called on the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StatusAdded\|StatusAdded]] | `status` | **Deprecated.** Fired when a status is added to the Humanoid. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StatusRemoved\|StatusRemoved]] | `status` | **Deprecated.** Fired when a status is removed from the Humanoid. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Strafing\|Strafing]] | `active` | Fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] enters or leaves the `StrafingNoPhysics` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Swimming\|Swimming]] | `speed` | Fires when the speed at which a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is swimming in [[30 Official Roblox Docs/API Reference/Classes/Terrain\|Terrain]] water changes. |
| [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Touched\|Touched]] | `touchingPart`, `humanoidPart` | Fires when one of the humanoid's limbs come in contact with another [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AutoJumpEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Jump Settings · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

AutoJumpEnabled sets whether or not the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] will attempt to automatically jump over an obstacle it is walking towards.

Currently, this property only works when the following conditions are true:

- The Humanoid's character model is the [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] of a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]].
- The Player in question is using touch controls.

When a player's character spawns, the property's value matches the player's [[30 Official Roblox Docs/API Reference/Classes/Player#AutoJumpEnabled|Player.AutoJumpEnabled]] property - which in turn matches the [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#AutoJumpEnabled|StarterPlayer.AutoJumpEnabled]] property.

*Code samples for this member (`Auto-Jump-Toggle`) are published on the source page; their code is not part of the open-source repo.*

### AutomaticScalingEnabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Game · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The Humanoid has six child scale values including `BodyDepthScale`, `BodyHeightScale`, `BodyProportionScale`, `BodyTypeScale`, `BodyWidthScale`, `HeadScale`. Changing the value of any of these causes the character's body parts and accessories to change size, but only if `AutomaticScalingEnabled` is true.

### AutoRotate

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

The AutoRotate property describes whether or not the Humanoid will automatically rotate to face in the direction they are moving. When set to true, the character model will gradually turn to face their movement direction as the Humanoid walks around. When set to false, the character model will remain fixated in its current rotation, unless a rotating force is applied to the _HumanoidRootPart_.

If the character model happens to be the character of a player, then the behavior of the Humanoid's rotation is influenced by the UserGameSetting's RotateType property.

When the AutoRotate property is set to true, the RotateType property has the following effects on the Humanoid's rotation:

| RotationType | Behavior | Context |
| --- | --- | --- |
| MovementRelative |  |  |
| CameraRelative | Character will rotate to face in the direction of the camera. | Player has their camera zoomed into first-person, or they are in shift-lock mode. |

*Code samples for this member (`AutoRotate`) are published on the source page; their code is not part of the open-source repo.*

### BreakJointsOnDeath

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

Determines whether the humanoid's joints break when in the [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType.Dead]] state. Defaults to true.

### CameraOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Capabilities:** AvatarBehavior

The CameraOffset property specifies an offset to the camera's subject position when its [[30 Official Roblox Docs/API Reference/Classes/Camera#CameraSubject|Camera.CameraSubject]] is set to this [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

The offset is applied in object-space, relative to the orientation of the Humanoid's _HumanoidRootPart_. For example, an offset [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] value of _(0, 10, 0)_ offsets the player's camera to 10 studs above the player's humanoid.

*Code samples for this member (`Walking-Camera-Bobble-Effect`) are published on the source page; their code is not part of the open-source repo.*

### CollisionType

> [!warning] Deprecated
> This member is deprecated.

**Type:** [[30 Official Roblox Docs/API Reference/Enums/HumanoidCollisionType|HumanoidCollisionType]]

**Security:** read None / write PluginSecurity · **Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Tags:** `Deprecated`

This property selects the [[30 Official Roblox Docs/API Reference/Enums/HumanoidCollisionType|Enum.HumanoidCollisionType]] for R15 and Rthro non-player characters.

### DisplayDistanceType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/HumanoidDisplayDistanceType|HumanoidDisplayDistanceType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The **DisplayDistanceType** property controls the distance behavior of the humanoid's name and health display. This property is set using the [[30 Official Roblox Docs/API Reference/Enums/HumanoidDisplayDistanceType|Enum.HumanoidDisplayDistanceType]] enum with three available values, each with their own set of rules:

- When set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidDisplayDistanceType|Viewer]], the humanoid sees the name/health of other humanoids within range of its own `NameDisplayDistance` and `HealthDisplayDistance`.
- When set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidDisplayDistanceType|Subject]], the humanoid takes **full control** over its own name and health display through its `NameDisplayDistance` and `HealthDisplayDistance` values.
- When set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidDisplayDistanceType|None]], the humanoid's name and health bar do not appear under any circumstances.

See [[30 Official Roblox Docs/Characters/Character name-health display|Character Name/Health Display]] for an in-depth guide on controlling the appearance of character names and health bars.

*Code samples for this member (`displaying-a-humanoid-s-health-and-name`) are published on the source page; their code is not part of the open-source repo.*

### DisplayName

**Type:** string

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

`DisplayName` is a property that determines the Humanoid's name display when visible. By default, a new Humanoid will have the value of an empty string. If `DisplayName` is an empty string, the humanoid's name display will default to the humanoid's parent's name property.

#### Player Character Loading

When players load their character, either automatically or through the use of [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterAsync|LoadCharacterAsync()]], the Humanoid that is created by the engine will have its `DisplayName` property set to the player's `DisplayName` property.

#### StarterCharacter and StarterHumanoid

When a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] named `StarterHumanoid` is parented to [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]], or when a Humanoid is present in a Model named `StarterCharacter`, the DisplayName property will be respected when Characters are loaded by Players in the game. The engine will only override the `DisplayName` property of the Humanoid with the `DisplayName` property of the player if the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayName|Humanoid.DisplayName]] of `StarterHumanoid` is an empty string.

### EvaluateStateMachine

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

Used to disable the internal physics and state machine of the `Humanoid`.

#### What does turning this off do?

- **No forces** - The humanoid will not apply forces to any of its parts. The humanoid will not move the character in any way.
- **No sensors** - The humanoid will not run any spatial queries to detect floors, ladders, or other obstacles (such as auto-jump).
- **No collision changes** - The humanoid will not alter the collision state of any of the character parts. By default, only the torso and head have [[30 Official Roblox Docs/API Reference/Classes/BasePart#CanCollide|Part.CanCollide]] enabled.
- **No state transitions or replication** - The humanoid will not automatically update its state. You can still set humanoid state with a script, but it will not automatically replicate.

#### What does turning this off **not** do?

- **State events** - If manually setting humanoid states, the events for each of the humanoid's states and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StateChanged|StateChanged]] will still fire, which means the Animate script will still receive them and animate the character based on its current humanoid state.
- **Appearance** - [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]], clothes, accessories and other humanoid rendering behavior.
- **Camera and player scripts** - The humanoid is still linked to [[30 Official Roblox Docs/API Reference/Classes/Players|Players]] and camera scripts, which ensures the camera will continue to follow the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart|Humanoid.RootPart]].
- **Player input handling** - The [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveDirection|Humanoid.MoveDirection]] property will still be updated via the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Move|Humanoid:Move()]] function and [[30 Official Roblox Docs/API Reference/Classes/PlayerScripts|PlayerScripts]] for input.

### FloorMaterial

**Type:** [[30 Official Roblox Docs/API Reference/Enums/Material|Material]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** AvatarBehavior · **Tags:** `ReadOnly`, `NotReplicated`

This is a read-only property that describes the [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]] the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is currently standing on. It works with both regular [[30 Official Roblox Docs/API Reference/Classes/BasePart|Parts]] and [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] voxels.

The code sample below demonstrates how to listen to when this property changes using [[30 Official Roblox Docs/API Reference/Classes/Object#GetPropertyChangedSignal|Object:GetPropertyChangedSignal()]]. When the material the humanoid is standing on changes, it will print a message indicating the new material being stood on.

```lua
local Humanoid = route.to.humanoid

Humanoid:GetPropertyChangedSignal("FloorMaterial"):Connect(function()
	print("New value for FloorMaterial: " .. tostring(Humanoid.FloorMaterial))
end)
```

#### Caveats

- When the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is not standing on a floor, the value of this property will be set to _Air_.
  - This occurs because Enum properties cannot have an empty value.
  - This can cause some confusion if a part has its material is set to Air, though in practice, parts are not supposed to use that material in the first place.
- The character model of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] must be able to collide with the floor, or else it will not be detected.
  - You cannot test if the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is swimming with this property. You should instead use its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState|Humanoid:GetState()]] function.

### Health

**Type:** float

**Thread safety:** ReadSafe · **Category:** Game · **Loaded/Saved:** true/false · **Capabilities:** AvatarBehavior · **Tags:** `NotReplicated`

This property represents the current health of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. The value is restricted to the range between 0 and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth|MaxHealth]]. If the humanoid is dead, this property is continually set to 0.

Note that the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#TakeDamage|TakeDamage()]] function may be used to subtract from [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Health]] instead of setting the property directly.

#### Health Regeneration

By default, a passive health regeneration script is automatically inserted into humanoids. This causes non-dead player characters to regenerate 1% of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth|MaxHealth]] each second. To disable this regeneration behavior, add an empty [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] named **Health** to [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]].

#### Health Bar Display

When [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Health]] is less than [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth|MaxHealth]], a health bar is displayed in-experience. The display behavior of the health bar is dependent on the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayDistance|HealthDisplayDistance]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayType|HealthDisplayType]].

See [[30 Official Roblox Docs/Characters/Character name-health display|Character Name/Health Display]] for an in-depth guide on controlling the appearance of character names and health bars.

#### Death

When the value of the character's health reaches 0, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] automatically transitions to the [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType.Dead]] state. In this state, [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Health]] is locked to 0; however, there is no error or warning for setting the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Health]] of a dead humanoid to a positive nonzero value.

### HealthDisplayDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

This property is a number used in conjunction with the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType|DisplayDistanceType]] property to control the distance from which a humanoid's health bar can be seen.

See [[30 Official Roblox Docs/Characters/Character name-health display|Character Name/Health Display]] for an in-depth guide on controlling the appearance of character names and health bars.

### HealthDisplayType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/HumanoidHealthDisplayType|HumanoidHealthDisplayType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

This property controls when a humanoid's health bar is allowed to be displayed. By default, this property is set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidHealthDisplayType|DisplayWhenDamaged]], which makes the health bar only display when a humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Health]] is less than its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth|MaxHealth]]. It can also be set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidHealthDisplayType|AlwaysOn]], which makes the health bar always display, or [[30 Official Roblox Docs/API Reference/Enums/HumanoidHealthDisplayType|AlwaysOff]], which prevents it from ever displaying.

Note that this property functions independently of the humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayDistance|HealthDisplayDistance]] property which is responsible for making the health bar fade out at certain distances. If `Humanoid.HealthDisplayType|HealthDisplayType` is set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidHealthDisplayType|AlwaysOn]], it will still fade out depending the how [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayDistance|HealthDisplayDistance]] is configured.

See [[30 Official Roblox Docs/Characters/Character name-health display|Character Name/Health Display]] for an in-depth guide on controlling the appearance of character names and health bars.

### HipHeight

**Type:** float

**Thread safety:** ReadSafe · **Category:** Game · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Determines the distance (in studs) off the ground the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart|RootPart]] should be when the humanoid is standing. The [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RigType|RigType]] influences the way this property behaves.

For R15 rigs, a suitable hip height is preset to ensure the height of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart|RootPart]] is correct. The height of the legs is not used. The overall height of the humanoid can be described in the following formula:

```lua
Height = (0.5 * RootPart.Size.Y) + HipHeight
```

For R6 rigs, [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HipHeight|HipHeight]] instead describes a relative offset. The overall height of the humanoid can be described in the following formula:

```lua
Height = LeftLeg.Size.Y + (0.5 * RootPart.Size.Y) + HipHeight
```

### Jump

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** true/false · **Capabilities:** AvatarBehavior · **Tags:** `NotReplicated`

If `true`, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] jumps with an upwards force equal to the value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpPower|Humanoid.JumpPower]] or the height of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpHeight|Humanoid.JumpHeight]], depending on the value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#UseJumpPower|Humanoid.UseJumpPower]].

### JumpHeight

**Type:** float

**Thread safety:** ReadSafe · **Category:** Jump Settings · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

Provides control over the height a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] jumps, in studs. The starting value of this property is determined by the value of [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterJumpHeight|StarterPlayer.CharacterJumpHeight]] which defaults to 7.2.

Although setting this property to 0 will effectively prevent the humanoid from jumping, it's recommended to disable jumping by disabling the [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType.Jumping]] state through [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SetStateEnabled|Humanoid:SetStateEnabled()]].

This property is only visible in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window if [[30 Official Roblox Docs/API Reference/Classes/Humanoid#UseJumpPower|Humanoid.UseJumpPower]] is set to **false**, as it is not relevant otherwise (instead, [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpPower|Humanoid.JumpPower]] is used).

### JumpPower

**Type:** float

**Thread safety:** ReadSafe · **Category:** Jump Settings · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

Determines how much upwards force is applied to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] when jumping. The starting value of this property is determined by the value of [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterJumpPower|StarterPlayer.CharacterJumpPower]] which defaults to 50 and is constrained between 0 and 1000. Note that jumps are also influenced by the [[30 Official Roblox Docs/API Reference/Classes/Workspace#Gravity|Workspace.Gravity]] property which determines the acceleration due to gravity.

Although setting this property to 0 will effectively prevent the humanoid from jumping, it's recommended to disable jumping by disabling the [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType.Jumping]] state through [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SetStateEnabled|Humanoid:SetStateEnabled()]].

This property is only visible in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window if [[30 Official Roblox Docs/API Reference/Classes/Humanoid#UseJumpPower|Humanoid.UseJumpPower]] is set to **true**, as it is not relevant otherwise (instead, [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpHeight|Humanoid.JumpHeight]] is used).

### LeftLeg

> [!warning] Deprecated
> This instance only works with the old R6 rig. It will not work with the
> R15 rig and should not be used in new work not using the R6 rig.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** AvatarBehavior · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

A reference to the humanoid's _Left Leg_ part. The value of this property will always be `nil` if the humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RigType|RigType]] is set to R15.

### MaxHealth

**Type:** float

**Thread safety:** ReadSafe · **Category:** Game · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

The maximum value of a humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Health]].

The value of this property is used alongside the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Health]] property to size the default health bar display. When a humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Health]] reaches [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth|MaxHealth]], its health bar may not be displayed, depending on its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#HealthDisplayType|HealthDisplayType]] property.

### maxHealth

> [!warning] Deprecated
> This deprecated property is a variant of `Class.Humanoid.MaxHealth` which
> should be used instead.

**Type:** float

**Thread safety:** ReadSafe · **Category:** Game · **Loaded/Saved:** true/false · **Capabilities:** AvatarBehavior · **Tags:** `NotReplicated`, `Deprecated`

### MaxSlopeAngle

**Type:** float

**Thread safety:** ReadSafe · **Category:** Game · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

This property determines the maximum slope angle that a humanoid can climb. If the angle of a slope is greater than a humanoid's MaxSlopeAngle, they will slide down the slope.

When a character spawns, this property is set according to the value of [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterMaxSlopeAngle|StarterPlayer.CharacterMaxSlopeAngle]].

The value of this property is constrained to values between 0° and 89°. It defaults to 89°, so humanoids can climb pretty much any slope they want by default.

*Code samples for this member (`limiting-the-slope-a-humanoid-can-walk-up`) are published on the source page; their code is not part of the open-source repo.*

### MoveDirection

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** AvatarBehavior · **Tags:** `ReadOnly`, `NotReplicated`

**MoveDirection** is a read-only property that describes the direction a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is walking in, as a unit vector or zero length vector. The direction is described in world space.

Because this property is read-only, it cannot be set by a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

*Code samples for this member (`Walking-Camera-Bobble-Effect`) are published on the source page; their code is not part of the open-source repo.*

### NameDisplayDistance

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

The **NameDisplayDistance** property is a number used in conjunction with the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#DisplayDistanceType|Humanoid.DisplayDistanceType]] property to control the distance from which a humanoid's name can be seen.

See [[30 Official Roblox Docs/Characters/Character name-health display|Character Name/Health Display]] for an in-depth guide on controlling the appearance of character names and health bars.

### NameOcclusion

**Type:** [[30 Official Roblox Docs/API Reference/Enums/NameOcclusion|NameOcclusion]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Controls whether a humanoid's name and health bar can be seen behind walls or other objects. This property is a [[30 Official Roblox Docs/API Reference/Enums/NameOcclusion|Enum.NameOcclusion]] value and can be configured to occlude all names, enemy names, or disable occlusion entirely.

In cases where the [[30 Official Roblox Docs/API Reference/Classes/Players#LocalPlayer|LocalPlayer]] has no [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] associated with it, this property instead applies to the subject [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

See [[30 Official Roblox Docs/Characters/Character name-health display|Character Name/Health Display]] for an in-depth guide on controlling the appearance of character names and health bars.

*Code samples for this member (`occlude-player-names`) are published on the source page; their code is not part of the open-source repo.*

### PlatformStand

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** AvatarBehavior

Determines whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is currently in the [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType.PlatformStanding]] state. When true, the Humanoid is in a state where it is free-falling and cannot move. This state behaves similar to sitting, except that jumping does not free the humanoid from the state.

### RequiresNeck

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

Allows developers to disable the behavior where a player `Character|character` dies if the Neck [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] is removed or disconnected even momentarily. This property defaults to true.

### RightLeg

> [!warning] Deprecated
> This instance only works with the old R6 rig. It will not work with the
> R15 rig and should not be used in new work not using the R6 rig.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** AvatarBehavior · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

A reference to the humanoid's _Right Leg_ part. The value of this property will always be `nil` if the humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RigType|RigType]] is set to R15.

### RigType

**Type:** [[30 Official Roblox Docs/API Reference/Enums/HumanoidRigType|HumanoidRigType]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

**RigType** describes whether a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is utilizing the legacy R6 character rig, or the newer R15 character rig.

The R6 rig uses 6 visible [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] while the R15 rig uses 15 visible [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]]. R15 rigs have more joints than R6 rigs, making them much more versatile when being animated.

Note that if this property is set incorrectly, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] will not function correctly. For example, if a R15 humanoid's **RigType** is set to R6, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] will die as there is no [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] called **Torso** connected to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] called **Head**.

### RootPart

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/true · **Capabilities:** AvatarBehavior · **Tags:** `ReadOnly`, `NotReplicated`

A reference to the humanoid's `HumanoidRootPart` object. The `HumanoidRootPart` is required for all assemblies that include a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] and is the primary driving part of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] that controls a humanoid's movement through the 3D world. This part is normally invisible and typically resides in the local origin center of the character model.

The `HumanoidRootPart` is included in all platform-wide avatar characters, and automatically created when a character model is imported into Studio. It's possible to manually add a `HumanoidRootPart` to a model by adding a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] named `HumanoidRootPart` and ensuring it's the root part of the assembly.

Use this property to reference the specific `HumanoidRootPart` without searching the model hierarchy. You can get or set the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of this part to change position or reorient the entire character model.

For R15 or higher-fidelity characters, the [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|Model.PrimaryPart]] of the [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]] model is also set to `HumanoidRootPart`.

While R6 characters also include a `HumanoidRootPart`, the R6 characters, [[30 Official Roblox Docs/API Reference/Classes/Model#PrimaryPart|Model.PrimaryPart]] is set to the `Head` part.

### SeatPart

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** AvatarBehavior · **Tags:** `ReadOnly`, `NotReplicated`

SeatPart is a reference to the seat that a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is currently sitting in, if any. The value of this property can be either a [[30 Official Roblox Docs/API Reference/Classes/Seat|Seat]], or a [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat|VehicleSeat]]. It will be _nil_ if the Humanoid is not currently sitting in a seat.

Note:

- For a bool describing if the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is currently sitting or not, see [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Sit|Humanoid.Sit]]

### Sit

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** AvatarBehavior

The Sit property is a boolean that indicates whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is currently sitting. [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]] can be forced into a sitting state by setting this property's value to true. If the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] isn't attached to a seat while in its sitting state, it will trip over with no collision in its legs. A [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] can escape from the sitting state by jumping.

Note:

- The [[30 Official Roblox Docs/API Reference/Classes/Seat|Seat]] or [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat|VehicleSeat]] the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is sitting on can be obtained using the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SeatPart|Humanoid.SeatPart]] property
- It is possible to detect when a Humanoid sits by connecting to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Seated|Humanoid.Seated]] event.

### TargetPoint

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** AvatarBehavior

**Do not use** This property only works with Experimental Mode enabled, which has been entirely discontinued.

This property describes a 3D position in space where the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] controlling this [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] last clicked with a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] equipped.

This property is primarily used by classic tools to determine what a humanoid is targeting when they activate a tool. If you give an NPC a classic rocket launcher, set their **TargetPoint**, and then call the tool's [[30 Official Roblox Docs/API Reference/Classes/Tool#Activate|Tool:Activate()]] function, you can make the NPC fire a rocket at the target point.

### Torso

> [!warning] Deprecated
> This instance only works with the old R6 rig. It will not work with the
> R15 rig and should not be used in new work not using the R6 rig.

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Capabilities:** AvatarBehavior · **Tags:** `Hidden`, `NotReplicated`, `Deprecated`

A reference to a humanoid's root driving part. Contrary to the name of this property, it will only point to the Torso part if a humanoid doesn't have a HumanoidRootPart.

### UseJumpPower

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Jump Settings · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

When a character spawns, this property is set according to the value of [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterUseJumpPower|StarterPlayer.CharacterUseJumpPower]], which defaults to true.

When jumping, with this set to false, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpHeight|Humanoid.JumpHeight]] value is used to ensure the humanoid jumps to that height. With this set to true, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpPower|Humanoid.JumpPower]] value is used to apply an upward force.

### WalkSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Game · **Loaded/Saved:** true/true · **Capabilities:** AvatarBehavior

This property describes how quickly the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is able to walk, in studs per second. It defaults to the value of [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterWalkSpeed|StarterPlayer.CharacterWalkSpeed]] (`16`), meaning a player character can move 16 studs in any direction each second.

#### Notes

- When controlled on a mobile device or a gamepad, a humanoid can walk slower than its [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkSpeed|WalkSpeed]] if the controlling thumbstick is moved just a gradual degree from center.
- You can freeze a humanoid in place by setting [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkSpeed|WalkSpeed]] to `0`, effectively preventing the controlling player from moving it through the default movement mechanisms. Note, however, that [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkSpeed|WalkSpeed]] is a client‑replicated property which can be modified locally, so it should **not** be used as a security mechanism or as the sole method for preventing humanoid movement.
- The default animation script scales a humanoid's movement animations based on how fast it is moving relative to the default speed of 16 studs/second.
- The speed at which the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is currently walking can be obtained using the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Running|Running]] event.

### WalkToPart

**Type:** [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** AvatarBehavior

`WalkToPart` is a reference to a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] that the humanoid is trying to reach, after having been prompted to do so via the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveTo|MoveTo()]] method.

When `WalkToPart` is set and a humanoid is actively trying to reach the part, it will keep updating its [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] goal to be the position of the part, plus the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPoint|WalkToPoint]] translated in object space relative to the rotation of the part. This can be described in Luau as:

```lua
goal = humanoid.WalkToPart.CFrame:PointToObjectSpace(humanoid.WalkToPoint)
```

Note that simply setting the value of `WalkToPart` is not sufficient to make a humanoid start "following" a part. Call [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveTo|MoveTo()]] to initiate movement.

### WalkToPoint

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Control · **Loaded/Saved:** false/false · **Capabilities:** AvatarBehavior

`WalkToPoint` describes the 3D position in space that a humanoid is trying to reach, after having been prompted to do so via the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveTo|MoveTo()]] method.

If a humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPart|WalkToPart]] is set, the goal is set by transforming `WalkToPoint` relative to the part's position and rotation. Otherwise, the humanoid will try to reach the 3D position specified by `WalkToPoint` directly.

Note that simply setting the value of `WalkToPoint` is not sufficient to make a humanoid start moving toward a point. Call [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveTo|MoveTo()]] to initiate movement.

## Methods

### AddAccessory

```lua
Humanoid:AddAccessory(accessory: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

This method attaches the specified [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] to the humanoid's parent.

When this method is called, an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] is attached to the character by searching for an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] in the humanoid's parent that shares the same name as an [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] in the accessory's **Handle** [[30 Official Roblox Docs/API Reference/Classes/Part|Part]]. If one is found, the **Handle** part will be connected to the parent of the [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] using a [[30 Official Roblox Docs/API Reference/Classes/Weld|Weld]], and the weld will be configured so the [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] occupy the same space.

If the required [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] can not be found, then the [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] will remain parented to the humanoid's parent but it will be unattached.

Typically, accessory welds are created on the server, but they can be created on the client under certain circumstances. In these situations, client-sided calls to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AddAccessory|AddAccessory()]] may not always produce the desired behavior and you can use [[30 Official Roblox Docs/API Reference/Classes/Humanoid#BuildRigFromAttachments|BuildRigFromAttachments()]] to force the expected weld creation.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `accessory` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] to be attached. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Humanoid-AddAccessory-Example`) are published on the source page; their code is not part of the open-source repo.*

### AddCustomStatus

> [!warning] Deprecated
> This item is deprecated, as it was a part of the unfinished RbxStatus
> library which would have allowed you to add conditions to a Humanoid. Do
> not use it for new work.

```lua
Humanoid:AddCustomStatus(status: string): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Adds a BoolValue to the Humanoid's _Status_ object, whose name is equal to the string passed as the _status_ argument. If the status already exists, a new BoolValue will not be created.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | string |  | The custom status name to add to the Humanoid. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the custom status was successfully added; returns false if it already exists. |

### AddStatus

> [!warning] Deprecated
> This item is deprecated, as it was a part of the unfinished RbxStatus
> library which would have allowed you to add conditions to a Humanoid. Do
> not use it for new work.

```lua
Humanoid:AddStatus(status: Status = Poison): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

Adds a BoolValue to the Humanoid's _Status_ object, whose name is equal to the name of the _Status_ enum passed as the _status_ argument. If the status already exists, a new BoolValue will not be created.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | [[30 Official Roblox Docs/API Reference/Classes/Status\|Status]] | `Poison` | The [[30 Official Roblox Docs/API Reference/Enums/Status\|Enum.Status]] value to add to the Humanoid. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the status was successfully added; returns false if it already exists. |

### ApplyDescription

> [!warning] Deprecated
> This method has been superseded by
> `Class.Humanoid:ApplyDescriptionAsync()|ApplyDescriptionAsync()`.

```lua
Humanoid:ApplyDescription(humanoidDescription: HumanoidDescription, assetTypeVerification: AssetTypeVerification = Default): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance · **Tags:** `Yields`, `Deprecated`

This yielding method makes the character's look match that of the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]]. A copy of the passed [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] is cached as the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] for the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

This method is optimized through making the assumption that only this method is used to change the appearance of the character, and no changes are made through other means between calls. If changes are made to the character between calls, then this method may not make the character reflect the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] accurately.

This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|ApplyDescriptionAsync()]], which should be used for all new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | The [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] instance which you want to set the character to match. |
| `assetTypeVerification` | [[30 Official Roblox Docs/API Reference/Enums/AssetTypeVerification\|AssetTypeVerification]] | `Default` | The asset type verification mode. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ApplyDescriptionAsync

```lua
Humanoid:ApplyDescriptionAsync(humanoidDescription: HumanoidDescription, assetTypeVerification: AssetTypeVerification = Default): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance · **Tags:** `Yields`

This yielding method makes the character's look match that of the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]]. A copy of the passed [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] is cached as the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] for the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

This method is optimized through making the assumption that only this method is used to change the appearance of the character, and no changes are made through other means between calls. If changes are made to the character between calls, then this method may not make the character reflect the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] accurately. If you want to use this method in conjunction with other means of updating the character, [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionResetAsync|Humanoid:ApplyDescriptionResetAsync()]] will always ensure the character reflects the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetAppliedDescription|Humanoid:GetAppliedDescription()]] which returns the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] currently applied to the humanoid.
- [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromUserIdAsync|Players:GetHumanoidDescriptionFromUserIdAsync()]] which returns a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] describing the avatar for the passed in user.
- [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromOutfitIdAsync|Players:GetHumanoidDescriptionFromOutfitIdAsync()]] which returns a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] whose parameters are initialized to match that of the passed in server-side outfit asset.
- [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterWithHumanoidDescriptionAsync|Player:LoadCharacterWithHumanoidDescriptionAsync()]] which spawns a player with the look from the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | The [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] instance which you want to set the character to match. |
| `assetTypeVerification` | [[30 Official Roblox Docs/API Reference/Enums/AssetTypeVerification\|AssetTypeVerification]] | `Default` | The asset type verification mode. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ApplyDescriptionReset

> [!warning] Deprecated
> This method has been superseded by
> `Class.Humanoid:ApplyDescriptionResetAsync()|ApplyDescriptionResetAsync()`.

```lua
Humanoid:ApplyDescriptionReset(humanoidDescription: HumanoidDescription, assetTypeVerification: AssetTypeVerification = Default): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance · **Tags:** `Yields`, `Deprecated`

This yielding method makes the character's look match that of the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]], even after external changes. A copy of the passed [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] is cached as the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] for the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

This method will always ensure the character reflects the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]], even if changes have been made to the character not using the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] system. This is in contrast to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescription|Humanoid:ApplyDescription()]] which is optimized and may incorrectly apply a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] if the character has been changed by means other than through the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] system.

This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionResetAsync|ApplyDescriptionResetAsync()]], which should be used for all new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | The [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] instance which you want to set the character to match. |
| `assetTypeVerification` | [[30 Official Roblox Docs/API Reference/Enums/AssetTypeVerification\|AssetTypeVerification]] | `Default` | The asset type verification mode. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### ApplyDescriptionResetAsync

```lua
Humanoid:ApplyDescriptionResetAsync(humanoidDescription: HumanoidDescription, assetTypeVerification: AssetTypeVerification = Default): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance · **Tags:** `Yields`

This yielding method makes the character's look match that of the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]], even after external changes. A copy of the passed [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] is cached as the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] for the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

This method will always ensure the character reflects the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]], even if changes have been made to the character not using the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] system (for example not using [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionResetAsync|ApplyDescriptionResetAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|ApplyDescriptionAsync()]]). This is in contrast to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|ApplyDescriptionAsync()]] which is optimized and may incorrectly apply a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] if the character has been changed by means other than through the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] system.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `humanoidDescription` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | The [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] instance which you want to set the character to match. |
| `assetTypeVerification` | [[30 Official Roblox Docs/API Reference/Enums/AssetTypeVerification\|AssetTypeVerification]] | `Default` | The asset type verification mode. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### BuildRigFromAttachments

```lua
Humanoid:BuildRigFromAttachments(): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior

This method assembles a tree of [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] joints for the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] joints are required for the playback of [[30 Official Roblox Docs/API Reference/Classes/Animation|Animations]].

Starting from the humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart|RootPart]], this method collects all [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] parented in the current part whose name ends with **RigAttachment**. It then searches for a matching attachment in the character that shares the same name as the attachment. Using those two attachments, a [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] joint is generated based on the parts associated with the two attachments and the [[30 Official Roblox Docs/API Reference/Classes/Attachment#CFrame|CFrame]] of the attachments.

[[30 Official Roblox Docs/API Reference/Classes/Humanoid#BuildRigFromAttachments|Humanoid:BuildRigFromAttachments()]] also scales the character and sets body colors.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Humanoid-BuildRigFromAttachments-Port`, `R15-Package-Importer`) are published on the source page; their code is not part of the open-source repo.*

### ChangeState

```lua
Humanoid:ChangeState(state: HumanoidStateType = None): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior

This method causes the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] to enter the given [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]], describing the activity the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is currently doing.

Please review the [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]] page for more information on the particular states, as some have unintuitive names. For example, [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType.Running]] describes a state where the humanoid's legs are on the ground, including when stationary.

Due to the default behavior of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], some states will automatically be changed when set. For example:

- Setting the state to [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType.Swimming]] when the humanoid is not in the water will cause it to be automatically set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType.GettingUp]].
- As it is unused, setting the state to [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType.PlatformStanding]] will cause the humanoid state to be automatically set to [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType.Running]].

Note that in order to set the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] state using this method, you must do so from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] and the client must have [[30 Official Roblox Docs/Physics/Network ownership|network ownership]] of the [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Player.Character]]. Alternatively, you can call this method from a server-side [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], but the server must have network ownership of the player character.

See also [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SetStateEnabled|Humanoid:SetStateEnabled()]] to enable or disable a particular state, and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState|Humanoid:GetState()]] to get the current humanoid state.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|HumanoidStateType]] | `None` | The [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]] that the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is to perform. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`double-jump`) are published on the source page; their code is not part of the open-source repo.*

### EquipTool

```lua
Humanoid:EquipTool(tool: Instance): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior

This method makes the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] equip the given [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]].

When this method is called, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] will first automatically unequip all [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]] that it currently has equipped.

Although they will be equipped, [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]] for which [[30 Official Roblox Docs/API Reference/Classes/Tool#RequiresHandle|Tool.RequiresHandle]] is `true` will not function if they have no handle, regardless if this method is used to equip them or not.

See also [[30 Official Roblox Docs/API Reference/Classes/Humanoid#UnequipTools|Humanoid:UnequipTools()]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `tool` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]] to equip. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### GetAccessories

```lua
Humanoid:GetAccessories(): Array
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

This method returns an array of [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] objects that the humanoid's parent is currently wearing. All such [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] objects will be included, regardless of whether they're attached or not.

If the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] has no [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] objects, an empty array will be returned.

See also [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AddAccessory|Humanoid:AddAccessory()]] to attach an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] to a humanoid's parent.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of [[30 Official Roblox Docs/API Reference/Classes/Accessory\|Accessory]] objects that are parented to the humanoid's parent. |

*Code samples for this member (`remove-accessories-after-loading`) are published on the source page; their code is not part of the open-source repo.*

### GetAppliedDescription

```lua
Humanoid:GetAppliedDescription(): HumanoidDescription
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

This method returns a copy of the humanoid's cached [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] which describes its current look. This can be used to quickly determine a character's look and to assign their look to other characters using the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]] method.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromUserIdAsync|Players:GetHumanoidDescriptionFromUserIdAsync()]] which returns a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] describing the avatar for the passed in user.
- [[30 Official Roblox Docs/API Reference/Classes/Players#GetHumanoidDescriptionFromOutfitIdAsync|Players:GetHumanoidDescriptionFromOutfitIdAsync()]] which returns a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] whose parameters are initialized to match that of the passed in server-side outfit asset.
- [[30 Official Roblox Docs/API Reference/Classes/Player#LoadCharacterWithHumanoidDescriptionAsync|Player:LoadCharacterWithHumanoidDescriptionAsync()]] which spawns a player with the look from the passed in [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]].

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] | A copy of the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] currently applied to the humanoid. |

### GetBodyPartR15

```lua
Humanoid:GetBodyPartR15(part: Instance): BodyPartR15
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior

This method returns what [[30 Official Roblox Docs/API Reference/Enums/BodyPartR15|Enum.BodyPartR15]] a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] is, or [[30 Official Roblox Docs/API Reference/Enums/BodyPartR15|Enum.BodyPartR15.Unknown]] if the part is not an R15 body part. This method allows developers to retrieve player body parts independent of what the actual body part names are, instead returning an enum.

It can be used in conjunction with [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ReplaceBodyPartR15|Humanoid:ReplaceBodyPartR15()]]. For example, if a player's body part touches something, this function will return get a part instance. Developers can then look up what part of the body that was, like head or arm. Then depending on what that part was, developers can either perform some gameplay action or replace that part with some other part - perhaps showing damage.

This method can be useful for games where hit location is important. For example, it can be used to determine if a player is hit in the leg and then slow them down based on the injury.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The specified part being checked to see if it is an R15 body part. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/BodyPartR15\|BodyPartR15]] | The specified part's R15 body part type or unknown if the part is not a body part. |

### GetLimb

```lua
Humanoid:GetLimb(part: Instance): Limb
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior

This method returns the [[30 Official Roblox Docs/API Reference/Enums/Limb|Enum.Limb]] enum that is associated with the given [[30 Official Roblox Docs/API Reference/Classes/Part|Part]]. It works for both R15 and R6 rigs, for example:

```lua
-- For R15
print(humanoid:GetLimb(character.LeftUpperLeg))  -- Enum.Limb.LeftLeg
print(humanoid:GetLimb(character.LeftLowerLeg))  -- Enum.Limb.LeftLeg
print(humanoid:GetLimb(character.LeftFoot))  -- Enum.Limb.LeftLeg

-- For R6
print(humanoid:GetLimb(character:FindFirstChild("Left Leg")))  -- Enum.Limb.LeftLeg
```

Note that [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetLimb|Humanoid:GetLimb()]] will throw an error if the part's parent is not set to the humanoid's parent.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]] for which the [[30 Official Roblox Docs/API Reference/Enums/Limb\|Enum.Limb]] is to be retrieved. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/Limb\|Limb]] | The [[30 Official Roblox Docs/API Reference/Enums/Limb\|Enum.Limb]] the part corresponds with. |

*Code samples for this member (`Humanoid-GetLimb1`) are published on the source page; their code is not part of the open-source repo.*

### GetMoveVelocity

```lua
Humanoid:GetMoveVelocity(): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior

Returns the Humanoid's intended movement velocity as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]. The result is the product of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkSpeed|WalkSpeed]], the intended movement direction, and the current percent walk speed. If the Humanoid is not moving, this returns `(0, 0, 0)`.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | A [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] representing the Humanoid's intended movement velocity in world space. |

### GetPlayingAnimationTracks

> [!warning] Deprecated
> This member is deprecated.

```lua
Humanoid:GetPlayingAnimationTracks(): Array
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Deprecated`

This method returns an array of all [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] that are currently being played on the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. A typical use for this method is stopping currently playing tracks using [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#Stop|AnimationTrack:Stop()]].

Beware that this method will not return [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTracks]] that have loaded but are **not playing**. If you want to track these you will need to index them manually.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of currently playing [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTracks]]. |

### GetRelativeVelocityAtFloor

```lua
Humanoid:GetRelativeVelocityAtFloor(): Vector3
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior

Returns the humanoid's actual physical velocity relative to the surface it is standing on as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] in world-space orientation. This accounts for moving platforms by subtracting floor velocity from the humanoid's body velocity. Unlike [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetMoveVelocity|Humanoid:GetMoveVelocity()]], which returns the intended input-driven velocity, this reflects the humanoid's true physics-based motion — useful for animation speed scaling or detecting whether a character is actually moving versus pushing against a wall. When the humanoid is airborne, the floor velocity component uses the last cached value from when it was grounded.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | The humanoid's velocity relative to the floor surface, as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] in world-space orientation. Returns `(0, 0, 0)` if the humanoid has no root part. |

### GetState

```lua
Humanoid:GetState(): HumanoidStateType
```

**Thread safety:** Safe · **Capabilities:** AvatarBehavior

This method returns the humanoid's current [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]], describing the activity the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is currently doing, such as jumping or swimming.

See also [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SetStateEnabled|Humanoid:SetStateEnabled()]] to enable or disable a particular state, and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ChangeState|Humanoid:ChangeState()]] to change the current humanoid state.

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|HumanoidStateType]] | The current [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]] of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]]. |

*Code samples for this member (`double-jump`) are published on the source page; their code is not part of the open-source repo.*

### GetStateEnabled

```lua
Humanoid:GetStateEnabled(state: HumanoidStateType): boolean
```

**Thread safety:** Safe · **Capabilities:** AvatarBehavior

The GetStateEnabled method returns whether a [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]] is enabled for the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

The humanoid state describes the activity the humanoid is currently doing.

When a particular [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]] is disabled, the humanoid can never enter that state. This is true regardless if the attempt to change state is made using [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ChangeState|Humanoid:ChangeState()]] or Roblox internal humanoid code.

See also:

- For an event that fires when a humanoid state is enabled or disabled see [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StateEnabledChanged|Humanoid.StateEnabledChanged]]
- To enable or disable a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] state use [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SetStateEnabled|Humanoid:SetStateEnabled()]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|HumanoidStateType]] |  | The given [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the given [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]] is enabled. |

*Code samples for this member (`setting-and-getting-humanoid-states`) are published on the source page; their code is not part of the open-source repo.*

### GetStatuses

> [!warning] Deprecated
> This item is deprecated, as it was a part of the unfinished RbxStatus
> library which would have allowed you to add conditions to a Humanoid. Do
> not use it for new work.

```lua
Humanoid:GetStatuses(): Array
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

The GetStatuses method returns a table of the Humanoid's statuses, and custom statuses.

**Returns**

| Type | Description |
| --- | --- |
| Array | An array of strings representing the names of all statuses currently applied to the Humanoid. |

### HasCustomStatus

> [!warning] Deprecated
> This item is deprecated, as it was a part of the unfinished RbxStatus
> library which would have allowed you to add conditions to a Humanoid. Do
> not use it for new work.

```lua
Humanoid:HasCustomStatus(status: string): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

The HasCustomStatus method returns boolean based on if custom statuses exist.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | string |  | The custom status name to check for. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the specified custom status exists on the Humanoid. |

### HasStatus

> [!warning] Deprecated
> This item is deprecated, as it was a part of the unfinished RbxStatus
> library which would have allowed you to add conditions to a Humanoid. Do
> not use it for new work.

```lua
Humanoid:HasStatus(status: Status = Poison): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

The HasStatus method returns a boolean based on if a status exists.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | [[30 Official Roblox Docs/API Reference/Classes/Status\|Status]] | `Poison` | The [[30 Official Roblox Docs/API Reference/Enums/Status\|Enum.Status]] value to check for. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the specified status exists on the Humanoid. |

### LoadAnimation

> [!warning] Deprecated
> This function is deprecated in favor of using
> `Class.Animator:LoadAnimation()` directly (the `Class.Animator` may be
> created while editing or at runtime).

```lua
Humanoid:LoadAnimation(animation: Animation): AnimationTrack
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Deprecated`

This method loads an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] onto a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], returning an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] that can be used for playback.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `animation` | [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] to load. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] | The [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] created from the loaded [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]]. |

### loadAnimation

> [!warning] Deprecated
> This deprecated method is a variant of `Class.Humanoid:LoadAnimation()`.
> `Class.Animator:LoadAnimation()` should be used instead.

```lua
Humanoid:loadAnimation(animation: Animation): AnimationTrack
```

**Thread safety:** Unsafe · **Capabilities:** Animation · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `animation` | [[30 Official Roblox Docs/API Reference/Classes/Animation\|Animation]] |  |  |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] |  |

### Move

```lua
Humanoid:Move(moveDirection: Vector3, relativeToCamera: boolean = False): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior

This method causes the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] to walk in the given [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] direction.

By default, the direction is in world terms, but if the `relativeToCamera` parameter is `true`, the direction is relative to the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] of the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|CurrentCamera]]. As the negative **Z** direction is considered "forwards" in Roblox, the following code will make the humanoid walk in the direction of the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|CurrentCamera]].

```lua
humanoid:Move(Vector3.new(0, 0, -1), true)
```

When this method is called, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] will move until the method is called again. However, this method will be overwritten in the next frame by Roblox's default character control script. This can be avoided by either calling this function every frame using [[30 Official Roblox Docs/API Reference/Classes/RunService#BindToRenderStep|RunService:BindToRenderStep()]] (see example), or overwriting the control scripts in [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]].

This method can be called on the server, but this should only be done when the server has [[30 Official Roblox Docs/Physics/Network ownership|network ownership]] of the humanoid's assembly.

See also [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveTo|Humanoid:MoveTo()]] which makes a[[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] walk to a point, and [[30 Official Roblox Docs/API Reference/Classes/Player#Move|Player:Move()]] which effectively calls this function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `moveDirection` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The direction to walk in. |
| `relativeToCamera` | boolean | `False` | Set to `true` if the `moveDirection` parameter should be taken as relative to the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera\|CurrentCamera]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`moving-a-humanoid-forwards`) are published on the source page; their code is not part of the open-source repo.*

### MoveTo

```lua
Humanoid:MoveTo(location: Vector3, part: Instance = nil): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior

This method causes the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] to attempt to walk to a given location by setting the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPoint|WalkToPoint]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPart|WalkToPart]] properties, corresponding to the `location` and `part` parameters.

If the `part` parameter is specified, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] will still attempt to walk to the `location` parameter's point. However, if the `part` moves, the point will move to be at the same position **relative to the part**.

Note that the movement operation will time out after 8 seconds if the humanoid doesn't reach its goal (this timeout exists so that humanoids do not get stuck waiting for [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveToFinished|MoveToFinished]] to fire). If you don't want this to happen, call `MoveTo()` at a repeated interval so that the timeout keeps resetting.

[[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveTo|MoveTo()]] ends if any of the following conditions apply:

- The character arrives at its destination, assuming a ~1 stud threshold to account for various humanoid speeds and framerates.

- The character gets stuck and the timer expires.

- The value of either [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPoint|WalkToPoint]] or [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPart|WalkToPart]] changes.

- A script calls [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Move|Move()]] with a new `moveDirection` parameter.

- A script changes the [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|CFrame]] property of the humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart|RootPart]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `location` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] |  | The position to set [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPoint\|Humanoid.WalkToPoint]] to. |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | `nil` | The [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] to set [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPart\|Humanoid.WalkToPart]] to. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`humanoid-moveto-without-time-out`) are published on the source page; their code is not part of the open-source repo.*

### PlayEmote

> [!warning] Deprecated
> This method has been superseded by
> `Class.Humanoid:PlayEmoteAsync()|PlayEmoteAsync()`.

```lua
Humanoid:PlayEmote(emoteName: string): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior · **Tags:** `Yields`, `Deprecated`

This yielding method looks up the emote by name in the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] currently applied to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] and plays it. If the emote cannot be found in the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]], the method errors.

This method has been superseded by [[30 Official Roblox Docs/API Reference/Classes/Humanoid#PlayEmoteAsync|PlayEmoteAsync()]], which should be used for all new work.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `emoteName` | string |  | name of the emote to play. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | successfully played. |

### PlayEmoteAsync

```lua
Humanoid:PlayEmoteAsync(emoteName: string): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior · **Tags:** `Yields`

If the emote could not be played because the emoteName is not found in the HumanoidDescription, this method will give an error. The method will return true to indicate that the emote was played successfully.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `emoteName` | string |  | name of the emote to play. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | successfully played. |

### RemoveAccessories

```lua
Humanoid:RemoveAccessories(): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

This method removes all [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] objects worn by the humanoid's parent. For player [[30 Official Roblox Docs/API Reference/Classes/Player#Character|Characters]], this will remove all hats and other accessories.

This method removes [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] object by calling [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Instance:Destroy()]] on them, meaning the [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Parent]] of the accessories are set to `nil` and locked.

See also [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AddAccessory|Humanoid:AddAccessory()]] to attach an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]], and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetAccessories|Humanoid:GetAccessories()]] to get all [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] objects belonging to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`remove-accessories-after-loading`) are published on the source page; their code is not part of the open-source repo.*

### RemoveCustomStatus

> [!warning] Deprecated
> This item is deprecated, as it was a part of the unfinished RbxStatus
> library which would have allowed you to add conditions to a Humanoid. Do
> not use it for new work.

```lua
Humanoid:RemoveCustomStatus(status: string): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

The RemoveCustomStatus method removes the defined custom status from the Status model in the Humanoid..

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | string |  | The custom status name to remove from the Humanoid. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the custom status was successfully removed; returns false if it does not exist. |

### RemoveStatus

> [!warning] Deprecated
> This item is deprecated, as it was a part of the unfinished RbxStatus
> library which would have allowed you to add conditions to a Humanoid. Do
> not use it for new work.

```lua
Humanoid:RemoveStatus(status: Status = Poison): boolean
```

**Thread safety:** Unsafe · **Tags:** `Deprecated`

The RemoveStatus method removes the defined status from the Status model in the Humanoid.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | [[30 Official Roblox Docs/API Reference/Classes/Status\|Status]] | `Poison` | The [[30 Official Roblox Docs/API Reference/Enums/Status\|Enum.Status]] value to remove from the Humanoid. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the status was successfully removed; returns false if it does not exist. |

### ReplaceBodyPartR15

```lua
Humanoid:ReplaceBodyPartR15(bodyPart: BodyPartR15, part: BasePart): boolean
```

**Thread safety:** Unsafe · **Capabilities:** AvatarAppearance

Dynamically replaces a R15/Rthro limb part in a Humanoid with a different part. The part is automatically scaled as normal.

This method is useful for modifying characters during gameplay or building characters from a base rig. The related method [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetBodyPartR15|GetBodyPartR15]] can come in handy when using this method.

The name of the part passed in should match with the name of the BodyPartR15 Enum passed in.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `bodyPart` | [[30 Official Roblox Docs/API Reference/Enums/BodyPartR15\|BodyPartR15]] |  | The body part to replace. [[30 Official Roblox Docs/API Reference/Enums/BodyPartR15\|Enum.BodyPartR15.Unknown]] will fail. |
| `part` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]] [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] which will be parented to the character. |

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the body part replacement was successful; returns false if the specified body part could not be found in the character. |

### SetStateEnabled

```lua
Humanoid:SetStateEnabled(state: HumanoidStateType, enabled: boolean): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior

This method sets whether a given [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]] is enabled for the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. When a particular [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]] is disabled, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] can never enter that state. This is true regardless if the attempt to change state is made using [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ChangeState|Humanoid:ChangeState()]] or Roblox internal [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] code.

Note that using `SetStateEnabled()` on the server does not replicate the change to the client, nor vice-versa.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|HumanoidStateType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]] to be enabled or disabled. |
| `enabled` | boolean |  | `true` if `state` is to be enabled, `false` if `state` is to be disabled. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`jump-cooldown`) are published on the source page; their code is not part of the open-source repo.*

### TakeDamage

```lua
Humanoid:TakeDamage(amount: float): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior

This method lowers the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Humanoid.Health]] of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] by the given _amount_ if it is not protected by a [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]]

This method accepts negative values for the _amount_ parameter. This will increase the humanoid's [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Humanoid.Health]]. However this will only have an effect if no [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]] is present.

#### How do ForceFields protect against TakeDamage

A [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is considered protected by a [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]] if a [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]] meets one of the following criteria:

- The [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]] shares the same [[30 Official Roblox Docs/API Reference/Classes/Instance#Parent|Instance.Parent]] as the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]
- The [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]] is parented to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart|Humanoid.RootPart]] of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]
- The [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]] is parented to an ancestor of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] other than the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]

To do damage to a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] irrespective of any [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceFields]] present, set [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Humanoid.Health]] directly.

For more information on how [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceFields]] protect [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]] see the [[30 Official Roblox Docs/API Reference/Classes/ForceField|ForceField]] page.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `amount` | float |  | The damage, or amount to be deduced from the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health\|Humanoid.Health]]. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

*Code samples for this member (`Humanoid-TakeDamage1`) are published on the source page; their code is not part of the open-source repo.*

### takeDamage

> [!warning] Deprecated
> This deprecated method is a variant of `Class.Humanoid:TakeDamage()`,
> which should be used instead.

```lua
Humanoid:takeDamage(amount: float): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior · **Tags:** `Deprecated`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `amount` | float |  |  |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

### UnequipTools

```lua
Humanoid:UnequipTools(): ()
```

**Thread safety:** Unsafe · **Capabilities:** AvatarBehavior

This method unequips any [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] currently equipped by the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]]. The unequipped [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] will be parented to the [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] of the [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] associated with the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

If no [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] is equipped, this method will do nothing.

Although [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]] can be equipped by NPCs, this method only works on [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]] with a corresponding [[30 Official Roblox Docs/API Reference/Classes/Player|Player]], as a [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] object is required to parent the unequipped [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] to.

See also [[30 Official Roblox Docs/API Reference/Classes/Humanoid#EquipTool|Humanoid:EquipTool()]].

**Returns**

| Type | Description |
| --- | --- |
| () |  |

## Events

### AnimationPlayed

> [!warning] Deprecated
> This member is deprecated.

```lua
Humanoid.AnimationPlayed(animationTrack: AnimationTrack)
```

**Capabilities:** Animation · **Tags:** `Deprecated`

The AnimationPlayed event fires when an [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack|AnimationTrack]] begins playing on the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

A common use for this function is to connect the [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack#KeyframeReached|AnimationTrack.KeyframeReached]] event for the playing AnimationTrack, so additional effects can be added to the animation (for example [[30 Official Roblox Docs/API Reference/Classes/Sound|Sounds]] and [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitters]]).

This event can be used for any [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] regardless if it belongs to the local player's client or not.

See also:

- For the [[30 Official Roblox Docs/API Reference/Classes/AnimationController|AnimationController]] equivalent of this event, please see [[30 Official Roblox Docs/API Reference/Classes/AnimationController#AnimationPlayed|AnimationController.AnimationPlayed]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `animationTrack` | [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] |  | The [[30 Official Roblox Docs/API Reference/Classes/AnimationTrack\|AnimationTrack]] that has begun playing. |

*Code samples for this member (`pausing-an-animation-when-a-keyframe-is-reached`) are published on the source page; their code is not part of the open-source repo.*

### ApplyDescriptionFinished

```lua
Humanoid.ApplyDescriptionFinished(description: HumanoidDescription)
```

**Capabilities:** AvatarAppearance

Fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] finishes applying a [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] to the character, at the end of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionAsync|Humanoid:ApplyDescriptionAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ApplyDescriptionResetAsync|Humanoid:ApplyDescriptionResetAsync()]]. The `description` parameter is the [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription|HumanoidDescription]] that was applied.

The event fires on the server and replicates to clients, so server or client listeners can respond when the character's appearance has been updated.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `description` | [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] |  | The [[30 Official Roblox Docs/API Reference/Classes/HumanoidDescription\|HumanoidDescription]] that was applied to the character. |

### Climbing

```lua
Humanoid.Climbing(speed: float)
```

**Capabilities:** AvatarBehavior

Fires when the speed at which a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is climbing changes.

[[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]] can climb up ladders made out of [[30 Official Roblox Docs/API Reference/Classes/BasePart|Parts]] or [[30 Official Roblox Docs/API Reference/Classes/TrussPart|TrussParts]].

[[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]] climb at 70% of their [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkSpeed|Humanoid.WalkSpeed]].

This event will not always fire with a speed of 0 when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] stops climbing.

See also:

- For swimming and running see the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Swimming|Humanoid.Swimming]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Running|Humanoid.Running]] events
- You can also detect when a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is climbing using the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StateChanged|Humanoid.StateChanged]] event
- You can disable climbing using the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SetStateEnabled|Humanoid:SetStateEnabled()]] function

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `speed` | float |  | The speed at which the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is currently climbing. |

*Code samples for this member (`Humanoid-Climbing1`) are published on the source page; their code is not part of the open-source repo.*

### CustomStatusAdded

> [!warning] Deprecated
> This item is deprecated, as it was a part of the unfinished RbxStatus
> library which would have allowed you to add conditions to a Humanoid. Do
> not use it for new work.

```lua
Humanoid.CustomStatusAdded(status: string)
```

**Tags:** `Deprecated`

The CustomStatusAdded event fires when a status is added to the Humanoid via the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#AddCustomStatus|Humanoid:AddCustomStatus()]] method.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | string |  | The name of the custom status that was added. |

### CustomStatusRemoved

> [!warning] Deprecated
> This item is deprecated, as it was a part of the unfinished RbxStatus
> library which would have allowed you to add conditions to a Humanoid. Do
> not use it for new work.

```lua
Humanoid.CustomStatusRemoved(status: string)
```

**Tags:** `Deprecated`

The CustomStatusRemoved event fires when a status is removed from the Humanoid via the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RemoveCustomStatus|Humanoid:RemoveCustomStatus()]] method.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | string |  | The name of the custom status that was removed. |

### Died

```lua
Humanoid.Died()
```

**Capabilities:** AvatarBehavior

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] dies, usually when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Humanoid.Health]] reaches 0. This could be caused either by disconnecting their head from their [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Torso|Humanoid.Torso]], or directly setting the health property.

This event only fires if the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is a descendant of the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. If the `Dead` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]] is disabled it will not fire.

*Code samples for this member (`Humanoid-Died1`) are published on the source page; their code is not part of the open-source repo.*

### FallingDown

```lua
Humanoid.FallingDown(active: boolean)
```

**Capabilities:** AvatarBehavior

The FallingDown event fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] enters and leaves the `FallingDown` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]].

The [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] will enter the `GettingUp` state 3 seconds after the `FallingDown` state is enabled. When this happens this event will fire with an _active_ value of _false_, and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GettingUp|Humanoid.GettingUp]] will fire with an _active_ value of _true_.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | boolean |  | Describes whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is entering or leaving the `FallingDown` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |

### FreeFalling

```lua
Humanoid.FreeFalling(active: boolean)
```

**Capabilities:** AvatarBehavior

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] enters or leaves the `Freefall` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]].

The _active_ parameter represents whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is entering or leaving the `Freefall` state.

Although the `Freefall` state generally ends when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] reaches the ground, this event may fire with _active_ equal to _false_ if the state is changed while the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is falling. For this reason, you should use [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StateChanged|Humanoid.StateChanged]] and listen for the `Landed` state to work out when a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] has landed.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | boolean |  | Whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is entering or leaving the `Freefall` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |

### GettingUp

```lua
Humanoid.GettingUp(active: boolean)
```

**Capabilities:** AvatarBehavior

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] enters or leaves the [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType.GettingUp]] state, a transition state that is activated shortly after the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] enters the [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|FallingDown]] (3 seconds) or [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Ragdoll]] (1 second) states.

When a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] attempts to get back up, this event will first fire with an `active` parameter of `true` before shortly after firing again with an `active` parameter of `false`.

To force a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] to fall over, use the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ChangeState|Humanoid:ChangeState()]] function with [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType.FallingDown]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | boolean |  | Whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is entering or leaving the `GettingUp` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |

### HealthChanged

```lua
Humanoid.HealthChanged(health: float)
```

**Capabilities:** AvatarBehavior

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Humanoid.Health]] changes. However, it will not fire if the health is increasing from a value equal to or greater than the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth|Humanoid.MaxHealth]].

When [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Humanoid.Health]] reaches zero, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] will die and the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Died|Humanoid.Died]] event will fire. This event will fire with a value of zero.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `health` | float |  | The new value of [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health\|Humanoid.Health]]. |

*Code samples for this member (`Humanoid-HealthChanged1`, `Health-Bar`) are published on the source page; their code is not part of the open-source repo.*

### Jumping

```lua
Humanoid.Jumping(active: boolean)
```

**Capabilities:** AvatarBehavior

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] enters and leaves the `Jumping` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]].

When a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] jumps, this event fires with an `active` parameter of `true` before shortly afterwards firing again with an `active` parameter of `false`. This second firing does not correspond with a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] landing; for that, listen for the `Landed` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]] using [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StateChanged|Humanoid.StateChanged]].

You can disable jumping using the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SetStateEnabled|Humanoid:SetStateEnabled()]] function.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | boolean |  | Whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is entering or leaving the `Jumping` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |

### MoveToFinished

```lua
Humanoid.MoveToFinished(reached: boolean)
```

**Capabilities:** AvatarBehavior

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] finishes walking to a goal declared by the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPoint|Humanoid.WalkToPoint]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPart|Humanoid.WalkToPart]] properties.

The [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPoint|Humanoid.WalkToPoint]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkToPart|Humanoid.WalkToPart]] properties can be set individually, or using the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveTo|Humanoid:MoveTo()]] function.

If the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] reaches its goal within 8 seconds, this event will return with _reached_ as true. If the goal is not reached within 8 seconds the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] will stop walking and _reached_ will be false. This timeout can be reset be calling [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MoveTo|Humanoid:MoveTo()]] again within the timeout period.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `reached` | boolean |  | A boolean indicating whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] reached is goal. _True_ if the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is reached its goal, _false_ if the walk timed out before the goal could be reached. |

*Code samples for this member (`humanoid-moveto-without-time-out`) are published on the source page; their code is not part of the open-source repo.*

### PlatformStanding

```lua
Humanoid.PlatformStanding(active: boolean)
```

**Capabilities:** AvatarBehavior

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] enters or leaves the `PlatformStanding` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]].

Whilst the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is in the `PlatformStanding` state, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#PlatformStand|Humanoid.PlatformStand]] property will be _true_.

Whilst [[30 Official Roblox Docs/API Reference/Classes/Humanoid#PlatformStand|Humanoid.PlatformStand]] is set to _true_, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] will be unable to move. For more information please see the page for [[30 Official Roblox Docs/API Reference/Classes/Humanoid#PlatformStand|Humanoid.PlatformStand]].

The PlatformStand [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]] was associated with the now disabled [[30 Official Roblox Docs/API Reference/Classes/Platform|Platform]] part. Despite this, it can still be used by developers.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | boolean |  | Whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is entering or leaving the `PlatformStanding` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |

### Ragdoll

```lua
Humanoid.Ragdoll(active: boolean)
```

**Capabilities:** AvatarBehavior

This event fires when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] enters or leaves the `Ragdoll` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]].

The `active` parameter will have the value `true` or `false` to indicate entering or leaving.

Use [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SetStateEnabled|Humanoid:SetStateEnabled()]] to disable the GettingUp state to stay in the Ragdoll state.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/Humanoid#FallingDown|Humanoid.FallingDown]] for the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] event connected with the `FallingDown` state, which behaves similarly to `Ragdoll`

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | boolean |  | Whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is entering or leaving the `Ragdoll` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |

### Running

```lua
Humanoid.Running(speed: float)
```

**Capabilities:** AvatarBehavior

This event fires when the speed at which a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is running changes.

While running [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]] cover, on average, their [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkSpeed|Humanoid.WalkSpeed]] in studs per second.

When the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] stops running this event will fire with a speed of 0.

See also:

- For swimming and climbing see the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Swimming|Humanoid.Swimming]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Climbing|Humanoid.Climbing]] events
- You can also detect when a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is running using the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StateChanged|Humanoid.StateChanged]] event

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `speed` | float |  | The speed at which the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is running. |

*Code samples for this member (`Humanoid-Running1`) are published on the source page; their code is not part of the open-source repo.*

### Seated

```lua
Humanoid.Seated(active: boolean, currentSeatPart: BasePart)
```

**Capabilities:** AvatarBehavior

This event fires when a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] either sits in or gets up from a [[30 Official Roblox Docs/API Reference/Classes/Seat|Seat]] or [[30 Official Roblox Docs/API Reference/Classes/VehicleSeat|VehicleSeat]].

When a character comes into contact with a seat, they are attached to the seat and a sitting animation plays. For more information on this, see the [[30 Official Roblox Docs/API Reference/Classes/Seat|Seat]] page.

- If the character is sitting down, the `active` parameter will be **true** and `currentSeatPart` will be the seat they are currently sitting in.
- If the character got up from a seat, the `active` parameter will be **false** and `currentSeatPart` will be `nil`.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Sit|Humanoid.Sit]], which indicates if a Humanoid is currently sitting
- [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SeatPart|Humanoid.SeatPart]], which indicates the seat a Humanoid is currently sitting in, if any.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | boolean |  | True if the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is sitting down. |
| `currentSeatPart` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The seat the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is sat in if it is sitting down. |

*Code samples for this member (`finding-a-player-s-seat`) are published on the source page; their code is not part of the open-source repo.*

### StateChanged

```lua
Humanoid.StateChanged(old: HumanoidStateType, new: HumanoidStateType)
```

**Capabilities:** AvatarBehavior

This event fires when the state of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is changed.

As there is no "idle" humanoid state, you should instead use the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Running|Humanoid.Running]] event or listen to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RootPart|RootPart]] part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#Velocity|Velocity]] to work out when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is standing still.

#### See Also

- [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetState|Humanoid:GetState()]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ChangeState|Humanoid:ChangeState()]] to get and set the state.
- [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SetStateEnabled|Humanoid:SetStateEnabled()]] to enable and disable specific states.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `old` | [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|HumanoidStateType]] |  | The humanoid's previous state type. |
| `new` | [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|HumanoidStateType]] |  | The humanoid's current state type. |

*Code samples for this member (`jumping-particles`, `jump-cooldown`) are published on the source page; their code is not part of the open-source repo.*

### StateEnabledChanged

```lua
Humanoid.StateEnabledChanged(state: HumanoidStateType, isEnabled: boolean)
```

**Capabilities:** AvatarBehavior

The StateEnableChanged event fires when [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SetStateEnabled|Humanoid:SetStateEnabled()]] is called on the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]].

Parameters include the [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]] in question along with a bool indicating if this state is now enabled.

See also:

- To find if a state is currently enabled, use [[30 Official Roblox Docs/API Reference/Classes/Humanoid#GetStateEnabled|Humanoid:GetStateEnabled()]]
- To listen to [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] state changes use [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StateChanged|Humanoid.StateChanged]]

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `state` | [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|HumanoidStateType]] |  | The [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]] for which the enabled state has been changed. |
| `isEnabled` | boolean |  | True if the state is now enabled. |

*Code samples for this member (`humanoid-state-change-detector`) are published on the source page; their code is not part of the open-source repo.*

### StatusAdded

> [!warning] Deprecated
> This item is deprecated, as it was a part of the unfinished RbxStatus
> library which would have allowed you to add conditions to a Humanoid. Do
> not use it for new work.

```lua
Humanoid.StatusAdded(status: Status)
```

**Tags:** `Deprecated`

The StatusAdded event fires when a status is added to the Humanoid.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | [[30 Official Roblox Docs/API Reference/Classes/Status\|Status]] |  | The name of the status that was added. |

*Code samples for this member (`Humanoid-StatusAdded1`) are published on the source page; their code is not part of the open-source repo.*

### StatusRemoved

> [!warning] Deprecated
> This item is deprecated, as it was a part of the unfinished RbxStatus
> library which would have allowed you to add conditions to a Humanoid. Do
> not use it for new work.

```lua
Humanoid.StatusRemoved(status: Status)
```

**Tags:** `Deprecated`

The StatusRemoved event fires when a status is removed from the Humanoid.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `status` | [[30 Official Roblox Docs/API Reference/Classes/Status\|Status]] |  | The name of the status that was removed. |

*Code samples for this member (`Humanoid-StatusRemoved1`) are published on the source page; their code is not part of the open-source repo.*

### Strafing

```lua
Humanoid.Strafing(active: boolean)
```

**Capabilities:** AvatarBehavior

This event does not fire when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is strafing and should not be used by developers

This event is fired when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] enters or leaves the `StrafingNoPhysics` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]].

When the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] enters the `StrafingNoPhysics` state this event will fire with an _active_ parameter of _true_. The event will fire again with _active_ equal to _false_ when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] leaves the `StrafingNoPhysics` state.

This event is associated with the `StrafingNoPhysics` [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] state and does **not** fire when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is moving perpendicular to the direction it is facing. This state is currently unused, if it is set using [[30 Official Roblox Docs/API Reference/Classes/Humanoid#ChangeState|Humanoid:ChangeState()]] the state will revert to `RunningNoPhysics`.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `active` | boolean |  | Whether the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is entering or leaving the `StrafingNoPhysics` [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType\|Enum.HumanoidStateType]]. |

### Swimming

```lua
Humanoid.Swimming(speed: float)
```

**Capabilities:** AvatarBehavior

This event fires when the speed at which a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is swimming in [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] water changes.

[[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]] swim at 87.5% of their [[30 Official Roblox Docs/API Reference/Classes/Humanoid#WalkSpeed|Humanoid.WalkSpeed]].

This event will not always fire with a speed of 0 when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] stops swimming.

See also:

- For running and climbing see the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Running|Humanoid.Running]] and [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Climbing|Humanoid.Climbing]] events
- You can also detect when a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] is swimming using the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StateChanged|Humanoid.StateChanged]] event
- You can disable swimming using the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#SetStateEnabled|Humanoid:SetStateEnabled()]] function

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `speed` | float |  | The speed the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] is currently swimming at. |

### Touched

```lua
Humanoid.Touched(touchingPart: BasePart, humanoidPart: BasePart)
```

**Capabilities:** AvatarBehavior

This event fires when one of the humanoid's limbs comes in contact with another [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]]. The [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] which the limb is touching, along with the limb itself, is given.

This event will not fire when limbs belonging to the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] come into contact with themselves.

#### Alternatives

Although the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Touched|Humanoid.Touched]] event is useful, you should consider if there are alternatives that better suit your needs.

- In most cases, it's advised to connect a [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|BasePart.Touched]] event for [[30 Official Roblox Docs/API Reference/Classes/BasePart|BaseParts]] of interest instead, as the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Touched|Humanoid.Touched]] event will constantly fire when the humanoid is moving. For example, in a dodgeball game, it would be more practical to connect a [[30 Official Roblox Docs/API Reference/Classes/BasePart#Touched|Touched]] event for the balls rather than use [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Touched|Humanoid.Touched]].
- When trying to work out when the [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] has landed on the ground, the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#StateChanged|Humanoid.StateChanged]] event is more suitable. Alternatively, you can check [[30 Official Roblox Docs/API Reference/Classes/Humanoid#FloorMaterial|Humanoid.FloorMaterial]] to see if the humanoid is standing on any non-air material.

#### Notes

- Connecting to this event will cause a [[30 Official Roblox Docs/API Reference/Classes/TouchTransmitter|TouchTransmitter]] to be created in every limb.
- There is currently no equivalent of [[30 Official Roblox Docs/API Reference/Classes/BasePart#TouchEnded|BasePart.TouchEnded]] for [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoids]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `touchingPart` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] has come in contact with. |
| `humanoidPart` | [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] |  | The limb of the [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] that has been touched. |

*Code samples for this member (`midas-touch-2`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [Humanoid](https://create.roblox.com/docs/reference/engine/classes/Humanoid) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
