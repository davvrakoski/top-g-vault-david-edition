---
title: "HumanoidRigDescription"
description: "Stores the joint mapping, T-pose, and per-joint properties for a 22-joint bipedal character rig. Joints may be `AnimationConstraint`, `Motor6D`, or `Bone` instances."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/HumanoidRigDescription"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Stores the joint mapping, T-pose, and per-joint properties for a 22-joint bipedal character rig. Joints may be [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] instances.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation

## Description

Stores the joint mapping, reference T-pose and per-joint properties for a bipedal `Humanoid` character rig. Each of the 22 joints in the rig hierarchy can reference an `Instance` (typically a `Motor6D`, `AnimationConstraint` or `Bone`), define a T-pose adjustment transform, rotation range limits, and carry a size for volumetric visualization and retargeting. For an example Blender and Maya rig hierarchy with all optional joints, see [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Advanced R15 rigs|Character specifications - Advanced R15 rigs]].

Use `AutoRig` to automatically populate joint references from a character model, or assign joints individually. Supports both R6 (6-joint) and R15 (15-joint) rig subsets in addition to the full 22-joint standard set, as well as rigs with more than 22 joints by mapping the key subset of joints.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#Chest\|Chest]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The chest joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#ChestRangeMax\|ChestRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the chest joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#ChestRangeMin\|ChestRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the chest joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#ChestSize\|ChestSize]] | float | Volume sphere diameter for the chest joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#ChestTposeAdjustment\|ChestTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the chest joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#HeadBase\|HeadBase]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The head base joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#HeadBaseRangeMax\|HeadBaseRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the head base joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#HeadBaseRangeMin\|HeadBaseRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the head base joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#HeadBaseSize\|HeadBaseSize]] | float | Volume sphere diameter for the head base joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#HeadBaseTposeAdjustment\|HeadBaseTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the head base joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftAnkle\|LeftAnkle]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The left ankle joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftAnkleRangeMax\|LeftAnkleRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the left ankle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftAnkleRangeMin\|LeftAnkleRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the left ankle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftAnkleSize\|LeftAnkleSize]] | float | Volume sphere diameter for the left ankle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftAnkleTposeAdjustment\|LeftAnkleTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the left ankle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftClavicle\|LeftClavicle]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The left clavicle joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftClavicleRangeMax\|LeftClavicleRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the left clavicle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftClavicleRangeMin\|LeftClavicleRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the left clavicle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftClavicleSize\|LeftClavicleSize]] | float | Volume sphere diameter for the left clavicle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftClavicleTposeAdjustment\|LeftClavicleTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the left clavicle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftElbow\|LeftElbow]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The left elbow joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftElbowRangeMax\|LeftElbowRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the left elbow joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftElbowRangeMin\|LeftElbowRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the left elbow joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftElbowSize\|LeftElbowSize]] | float | Volume sphere diameter for the left elbow joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftElbowTposeAdjustment\|LeftElbowTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the left elbow joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftHip\|LeftHip]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The left hip joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftHipRangeMax\|LeftHipRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the left hip joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftHipRangeMin\|LeftHipRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the left hip joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftHipSize\|LeftHipSize]] | float | Volume sphere diameter for the left hip joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftHipTposeAdjustment\|LeftHipTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the left hip joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftKnee\|LeftKnee]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The left knee joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftKneeRangeMax\|LeftKneeRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the left knee joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftKneeRangeMin\|LeftKneeRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the left knee joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftKneeSize\|LeftKneeSize]] | float | Volume sphere diameter for the left knee joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftKneeTposeAdjustment\|LeftKneeTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the left knee joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftShoulder\|LeftShoulder]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The left shoulder joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftShoulderRangeMax\|LeftShoulderRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the left shoulder joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftShoulderRangeMin\|LeftShoulderRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the left shoulder joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftShoulderSize\|LeftShoulderSize]] | float | Volume sphere diameter for the left shoulder joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftShoulderTposeAdjustment\|LeftShoulderTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the left shoulder joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftToeBase\|LeftToeBase]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The left toe base joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftToeBaseRangeMax\|LeftToeBaseRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the left toe base joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftToeBaseRangeMin\|LeftToeBaseRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the left toe base joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftToeBaseSize\|LeftToeBaseSize]] | float | Volume sphere diameter for the left toe base joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftToeBaseTposeAdjustment\|LeftToeBaseTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the left toe base joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftWrist\|LeftWrist]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The left wrist joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftWristRangeMax\|LeftWristRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the left wrist joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftWristRangeMin\|LeftWristRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the left wrist joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftWristSize\|LeftWristSize]] | float | Volume sphere diameter for the left wrist joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#LeftWristTposeAdjustment\|LeftWristTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the left wrist joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#Neck\|Neck]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The neck joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#NeckRangeMax\|NeckRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the neck joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#NeckRangeMin\|NeckRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the neck joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#NeckSize\|NeckSize]] | float | Volume sphere diameter for the neck joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#NeckTposeAdjustment\|NeckTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the neck joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#OriginOffset\|OriginOffset]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | Offset of the rig origin from the character model's primary part. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightAnkle\|RightAnkle]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The right ankle joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightAnkleRangeMax\|RightAnkleRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the right ankle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightAnkleRangeMin\|RightAnkleRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the right ankle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightAnkleSize\|RightAnkleSize]] | float | Volume sphere diameter for the right ankle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightAnkleTposeAdjustment\|RightAnkleTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the right ankle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightClavicle\|RightClavicle]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The right clavicle joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightClavicleRangeMax\|RightClavicleRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the right clavicle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightClavicleRangeMin\|RightClavicleRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the right clavicle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightClavicleSize\|RightClavicleSize]] | float | Volume sphere diameter for the right clavicle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightClavicleTposeAdjustment\|RightClavicleTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the right clavicle joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightElbow\|RightElbow]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The right elbow joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightElbowRangeMax\|RightElbowRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the right elbow joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightElbowRangeMin\|RightElbowRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the right elbow joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightElbowSize\|RightElbowSize]] | float | Volume sphere diameter for the right elbow joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightElbowTposeAdjustment\|RightElbowTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the right elbow joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightHip\|RightHip]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The right hip joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightHipRangeMax\|RightHipRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the right hip joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightHipRangeMin\|RightHipRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the right hip joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightHipSize\|RightHipSize]] | float | Volume sphere diameter for the right hip joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightHipTposeAdjustment\|RightHipTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the right hip joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightKnee\|RightKnee]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The right knee joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightKneeRangeMax\|RightKneeRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the right knee joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightKneeRangeMin\|RightKneeRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the right knee joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightKneeSize\|RightKneeSize]] | float | Volume sphere diameter for the right knee joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightKneeTposeAdjustment\|RightKneeTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the right knee joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightShoulder\|RightShoulder]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The right shoulder joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightShoulderRangeMax\|RightShoulderRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the right shoulder joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightShoulderRangeMin\|RightShoulderRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the right shoulder joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightShoulderSize\|RightShoulderSize]] | float | Volume sphere diameter for the right shoulder joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightShoulderTposeAdjustment\|RightShoulderTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the right shoulder joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightToeBase\|RightToeBase]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The right toe base joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightToeBaseRangeMax\|RightToeBaseRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the right toe base joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightToeBaseRangeMin\|RightToeBaseRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the right toe base joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightToeBaseSize\|RightToeBaseSize]] | float | Volume sphere diameter for the right toe base joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightToeBaseTposeAdjustment\|RightToeBaseTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the right toe base joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightWrist\|RightWrist]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The right wrist joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightWristRangeMax\|RightWristRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the right wrist joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightWristRangeMin\|RightWristRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the right wrist joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightWristSize\|RightWristSize]] | float | Volume sphere diameter for the right wrist joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RightWristTposeAdjustment\|RightWristTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the right wrist joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#Root\|Root]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The root joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RootRangeMax\|RootRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the root joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RootRangeMin\|RootRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the root joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RootSize\|RootSize]] | float | Volume sphere diameter for the root joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#RootTposeAdjustment\|RootTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the root joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#Spine\|Spine]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The spine joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#SpineRangeMax\|SpineRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the spine joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#SpineRangeMin\|SpineRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the spine joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#SpineSize\|SpineSize]] | float | Volume sphere diameter for the spine joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#SpineTposeAdjustment\|SpineTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the spine joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#Waist\|Waist]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The waist joint instance in the rig hierarchy. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#WaistRangeMax\|WaistRangeMax]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Maximum rotation limit per axis for the waist joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#WaistRangeMin\|WaistRangeMin]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Minimum rotation limit per axis for the waist joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#WaistSize\|WaistSize]] | float | Volume sphere diameter for the waist joint. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#WaistTposeAdjustment\|WaistTposeAdjustment]] | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] | T-pose alignment transform for the waist joint. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#GetJointFromName\|GetJointFromName()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Returns the joint instance associated with the given name string. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#GetJointNames\|GetJointNames()]] | Array | Returns the full set of 22 standard joint names in hierarchy order. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#GetR15JointNames\|GetR15JointNames()]] | Array | Returns the 15 joint names used by R15 rigs. |
| [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription#GetR6JointNames\|GetR6JointNames()]] | Array | Returns the 6 joint names used by R6 rigs. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Chest

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the chest joint. This joint is the branch point for the neck chain and both clavicle chains.

### ChestRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the chest joint along each local axis (X, Y, Z).

### ChestRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the chest joint along each local axis (X, Y, Z).

### ChestSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Size of the chest joint's volume sphere, used for rig visualization and collision.

### ChestTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the chest joint to align it with the T-pose reference orientation.

### HeadBase

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the head base joint. This is the terminal joint of the head chain.

### HeadBaseRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the head base joint along each local axis (X, Y, Z).

### HeadBaseRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the head base joint along each local axis (X, Y, Z).

### HeadBaseSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the head base joint's volume sphere, used for rig visualization and collision.

### HeadBaseTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the head base joint to align it with the T-pose reference orientation.

### LeftAnkle

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the left ankle joint.

### LeftAnkleRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the left ankle joint along each local axis (X, Y, Z).

### LeftAnkleRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the left ankle joint along each local axis (X, Y, Z).

### LeftAnkleSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the left ankle joint's volume sphere, used for rig visualization and collision.

### LeftAnkleTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the left ankle joint to align it with the T-pose reference orientation.

### LeftClavicle

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the left clavicle (collarbone) joint.

### LeftClavicleRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the left clavicle joint along each local axis (X, Y, Z).

### LeftClavicleRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the left clavicle joint along each local axis (X, Y, Z).

### LeftClavicleSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the left clavicle joint's volume sphere, used for rig visualization and collision.

### LeftClavicleTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the left clavicle joint to align it with the T-pose reference orientation.

### LeftElbow

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the left elbow joint.

### LeftElbowRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the left elbow joint along each local axis (X, Y, Z).

### LeftElbowRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the left elbow joint along each local axis (X, Y, Z).

### LeftElbowSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the left elbow joint's volume sphere, used for rig visualization and collision.

### LeftElbowTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the left elbow joint to align it with the T-pose reference orientation.

### LeftHip

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the left hip joint. This is the root of the left leg chain.

### LeftHipRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the left hip joint along each local axis (X, Y, Z).

### LeftHipRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the left hip joint along each local axis (X, Y, Z).

### LeftHipSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the left hip joint's volume sphere, used for rig visualization and collision.

### LeftHipTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the left hip joint to align it with the T-pose reference orientation.

### LeftKnee

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the left knee joint.

### LeftKneeRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the left knee joint along each local axis (X, Y, Z).

### LeftKneeRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the left knee joint along each local axis (X, Y, Z).

### LeftKneeSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the left knee joint's volume sphere, used for rig visualization and collision.

### LeftKneeTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the left knee joint to align it with the T-pose reference orientation.

### LeftShoulder

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the left shoulder joint.

### LeftShoulderRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the left shoulder joint along each local axis (X, Y, Z).

### LeftShoulderRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the left shoulder joint along each local axis (X, Y, Z).

### LeftShoulderSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the left shoulder joint's volume sphere, used for rig visualization and collision.

### LeftShoulderTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the left shoulder joint to align it with the T-pose reference orientation.

### LeftToeBase

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the left toe base joint. This is the terminal joint of the left leg chain.

### LeftToeBaseRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the left toe base joint along each local axis (X, Y, Z).

### LeftToeBaseRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the left toe base joint along each local axis (X, Y, Z).

### LeftToeBaseSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the left toe base joint's volume sphere, used for rig visualization and collision.

### LeftToeBaseTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the left toe base joint to align it with the T-pose reference orientation.

### LeftWrist

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the left wrist joint. This is the terminal joint of the left arm chain.

### LeftWristRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the left wrist joint along each local axis (X, Y, Z).

### LeftWristRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the left wrist joint along each local axis (X, Y, Z).

### LeftWristSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the left wrist joint's volume sphere, used for rig visualization and collision.

### LeftWristTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the left wrist joint to align it with the T-pose reference orientation.

### Neck

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the neck joint.

### NeckRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the neck joint along each local axis (X, Y, Z).

### NeckRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the neck joint along each local axis (X, Y, Z).

### NeckSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the neck joint's volume sphere, used for rig visualization and collision.

### NeckTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the neck joint to align it with the T-pose reference orientation.

### OriginOffset

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Animation, PluginOrOpenCloud

Coordinate frame offset of the rig origin relative to the character model's primary part. Adjusts where the rig hierarchy is anchored within the character.

### RightAnkle

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the right ankle joint.

### RightAnkleRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the right ankle joint along each local axis (X, Y, Z).

### RightAnkleRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the right ankle joint along each local axis (X, Y, Z).

### RightAnkleSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the right ankle joint's volume sphere, used for rig visualization and collision.

### RightAnkleTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the right ankle joint to align it with the T-pose reference orientation.

### RightClavicle

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the right clavicle (collarbone) joint.

### RightClavicleRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the right clavicle joint along each local axis (X, Y, Z).

### RightClavicleRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the right clavicle joint along each local axis (X, Y, Z).

### RightClavicleSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the right clavicle joint's volume sphere, used for rig visualization and collision.

### RightClavicleTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the right clavicle joint to align it with the T-pose reference orientation.

### RightElbow

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the right elbow joint.

### RightElbowRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the right elbow joint along each local axis (X, Y, Z).

### RightElbowRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the right elbow joint along each local axis (X, Y, Z).

### RightElbowSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the right elbow joint's volume sphere, used for rig visualization and collision.

### RightElbowTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the right elbow joint to align it with the T-pose reference orientation.

### RightHip

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the right hip joint. This is the root of the right leg chain.

### RightHipRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the right hip joint along each local axis (X, Y, Z).

### RightHipRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the right hip joint along each local axis (X, Y, Z).

### RightHipSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the right hip joint's volume sphere, used for rig visualization and collision.

### RightHipTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the right hip joint to align it with the T-pose reference orientation.

### RightKnee

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the right knee joint.

### RightKneeRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the right knee joint along each local axis (X, Y, Z).

### RightKneeRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the right knee joint along each local axis (X, Y, Z).

### RightKneeSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the right knee joint's volume sphere, used for rig visualization and collision.

### RightKneeTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the right knee joint to align it with the T-pose reference orientation.

### RightShoulder

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the right shoulder joint.

### RightShoulderRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the right shoulder joint along each local axis (X, Y, Z).

### RightShoulderRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the right shoulder joint along each local axis (X, Y, Z).

### RightShoulderSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the right shoulder joint's volume sphere, used for rig visualization and collision.

### RightShoulderTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the right shoulder joint to align it with the T-pose reference orientation.

### RightToeBase

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the right toe base joint. This is the terminal joint of the right leg chain.

### RightToeBaseRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the right toe base joint along each local axis (X, Y, Z).

### RightToeBaseRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the right toe base joint along each local axis (X, Y, Z).

### RightToeBaseSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the right toe base joint's volume sphere, used for rig visualization and collision.

### RightToeBaseTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the right toe base joint to align it with the T-pose reference orientation.

### RightWrist

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the right wrist joint. This is the terminal joint of the right arm chain.

### RightWristRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the right wrist joint along each local axis (X, Y, Z).

### RightWristRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the right wrist joint along each local axis (X, Y, Z).

### RightWristSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the right wrist joint's volume sphere, used for rig visualization and collision.

### RightWristTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the right wrist joint to align it with the T-pose reference orientation.

### Root

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the root joint, which is the base of the entire rig hierarchy. The waist, left hip, and right hip chains all originate from this joint.

### RootRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the root joint along each local axis (X, Y, Z).

### RootRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the root joint along each local axis (X, Y, Z).

### RootSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the root joint's volume sphere, used for rig visualization and collision.

### RootTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the root joint to align it with the T-pose reference orientation.

### Spine

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the spine joint.

### SpineRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the spine joint along each local axis (X, Y, Z).

### SpineRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the spine joint along each local axis (X, Y, Z).

### SpineSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the spine joint's volume sphere, used for rig visualization and collision.

### SpineTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the spine joint to align it with the T-pose reference orientation.

### Waist

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** Mapping · **Loaded/Saved:** true/true · **Capabilities:** Animation

The [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]], [[30 Official Roblox Docs/API Reference/Classes/AnimationConstraint|AnimationConstraint]], or [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] joint instance for the waist joint.

### WaistRangeMax

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Maximum rotation range in degrees for the waist joint along each local axis (X, Y, Z).

### WaistRangeMin

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Range · **Loaded/Saved:** true/true · **Capabilities:** Animation

Minimum rotation range in degrees for the waist joint along each local axis (X, Y, Z).

### WaistSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Size · **Loaded/Saved:** true/true · **Capabilities:** Animation

Diameter of the waist joint's volume sphere, used for rig visualization and collision.

### WaistTposeAdjustment

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]]

**Thread safety:** ReadSafe · **Category:** Tpose · **Loaded/Saved:** true/true · **Capabilities:** Animation

Coordinate frame adjustment applied to the waist joint to align it with the T-pose reference orientation.

## Methods

### GetJointFromName

```lua
HumanoidRigDescription:GetJointFromName(name: string): Instance
```

**Thread safety:** Safe · **Capabilities:** Animation

Returns the joint instance associated with the given joint name. Accepts both standard joint names (e.g., `"LeftShoulder"`) and R15 body part names (e.g., `"LeftLowerLeg"`). Name matching is case-insensitive. Returns `nil` if no joint with the given name is mapped.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | string |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Instance |

### GetJointNames

```lua
HumanoidRigDescription:GetJointNames(): Array
```

**Thread safety:** Safe · **Capabilities:** Animation

Returns an array of all 22 standard joint name strings for this rig description, in hierarchy order: Root, Waist, Spine, Chest, Neck, HeadBase, LeftClavicle, LeftShoulder, LeftElbow, LeftWrist, RightClavicle, RightShoulder, RightElbow, RightWrist, LeftHip, LeftKnee, LeftAnkle, LeftToeBase, RightHip, RightKnee, RightAnkle, RightToeBase.

**Returns**

| Type | Description |
| --- | --- |
| Array | Array |

### GetR15JointNames

```lua
HumanoidRigDescription:GetR15JointNames(): Array
```

**Thread safety:** Safe · **Capabilities:** Animation

Returns an array of the 15 joint name strings used by R15 rigs: Root, Waist, Neck, LeftShoulder, LeftElbow, LeftWrist, RightShoulder, RightElbow, RightWrist, LeftHip, LeftKnee, LeftAnkle, RightHip, RightKnee, RightAnkle.

**Returns**

| Type | Description |
| --- | --- |
| Array | Array |

### GetR6JointNames

```lua
HumanoidRigDescription:GetR6JointNames(): Array
```

**Thread safety:** Safe · **Capabilities:** Animation

Returns an array of the 6 joint name strings used by R6 rigs: Root, Neck, LeftShoulder, RightShoulder, LeftHip, RightHip.

**Returns**

| Type | Description |
| --- | --- |
| Array | Array |

---
*Source: [HumanoidRigDescription](https://create.roblox.com/docs/reference/engine/classes/HumanoidRigDescription) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
