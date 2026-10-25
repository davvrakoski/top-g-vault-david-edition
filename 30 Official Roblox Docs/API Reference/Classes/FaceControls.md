---
title: "FaceControls"
description: "The `FaceControls` object defines a set of properties for controlling the facial expressions of a Dynamic Head."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/FaceControls"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] object defines a set of properties for controlling the facial expressions of a Dynamic Head.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Animation

## Description

The [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] object defines a set of properties for controlling the facial expressions of a character head capable of animation.

The FaceControls properties are based on the Facial Action Coding System (FACS), a comprehensive system for describing all visually discernible facial movement based on anatomy. [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] properties can only be set between 0 and 1. Different combinations of the [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] property values create different facial expressions. Recording multiple facial expressions over time creates facial animation.

## What is an Animatable Head?

An animatable head is a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] that implements a facial rig and is capable of playing facial animations and triggering facial expressions. A [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] object that is a child of a head [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] can change the facial expressions of the head.

A head consists of the following three components:

- Skinned MeshPart instance for the head geometry with an internal rig that deforms this skinned MeshPart
- FaceControls instance that drives the internal rig when properties such as FaceControls.JawDrop are changed.
- Cage [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] instance for tight fitting facial accessories

In a third-party modeling tool, such as Blender or Maya, an artist can create a joint-driven facial rig, pose the joints to match each of the individual FACS controls, and save as an FBX. When a head `.FBX` is imported in Studio, a facs-to-joint mapping is created. This mapping deforms the mesh geometry when FaceControls properties are changed. The mapping and the facial rig (including [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] instances) are not exposed to developers and can only be accessed through the FaceControls instance. The [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] for a Dynamic Head looks and behaves the same as a regular [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] except when a FaceControls instance is a child of the MeshPart. Editing the properties of the FaceControls deforms the MeshPart's geometry. These properties are available to animate in the Animation Editor.

See [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic heads|Facial animation]] for more information on usage and creation of an animatable head.

## Animatable Heads in the Marketplace

If you are publishing your head to the Marketplace, your head asset must include a minimum subset of face controls. Roblox's publishing validation rejects assets without the following required poses:

- EyesLookDown
- EyesLookLeft
- EyesLookRight
- EyesLookUp
- JawDrop
- LeftEyeClosed
- LeftLipCornerPuller
- LeftLipStretcher
- LeftLowerLipDepressor
- LeftUpperLipRaiser
- LipsTogether
- Pucker
- RightEyeClosed
- RightLipCornerPuller
- RightLipStretcher
- RightLowerLipDepressor
- RightUpperLipRaiser

See [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference|FACS poses reference]] for more information on usage and creation of an animatable head.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#ChinRaiser\|ChinRaiser]] | float | Raises the chin up; moves the lower lip upwards. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#ChinRaiserUpperLip\|ChinRaiserUpperLip]] | float | Moves the upper lip when ChinRaiser is engaged and touching the upper lip. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#Corrugator\|Corrugator]] | float | Brings the left and right brows inward together. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#EyesLookDown\|EyesLookDown]] | float | Moves gaze down. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#EyesLookLeft\|EyesLookLeft]] | float | Moves gaze left. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#EyesLookRight\|EyesLookRight]] | float | Moves gaze right. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#EyesLookUp\|EyesLookUp]] | float | Moves gaze up. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#FlatPucker\|FlatPucker]] | float | Also known as lip tightener; brings the corners of the mouth inward and pressing the lips back against the teeth. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#Funneler\|Funneler]] | float | Makes a 'O' shape with the mouth. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#JawDrop\|JawDrop]] | float | Lowers the jaw downward opening the mouth. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#JawLeft\|JawLeft]] | float | Moves mouth and jaw to the left (character left). |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#JawRight\|JawRight]] | float | Moves mouth and jaw to the right (character right). |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftBrowLowerer\|LeftBrowLowerer]] | float | Lowers the left brow down. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftCheekPuff\|LeftCheekPuff]] | float | Puffs up the left cheek. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftCheekRaiser\|LeftCheekRaiser]] | float | Squints the left eye. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftDimpler\|LeftDimpler]] | float | Moves the corners of the mouth back in Z. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftEyeClosed\|LeftEyeClosed]] | float | Closes the left eyelid. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftEyeUpperLidRaiser\|LeftEyeUpperLidRaiser]] | float | Raises the left eyelid upwards to reveal more of the eye white above the iris. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftInnerBrowRaiser\|LeftInnerBrowRaiser]] | float | Raises the interior half of the left brow upwards. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftLipCornerDown\|LeftLipCornerDown]] | float | Lowers the corners of the mouth downwards in a frown. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftLipCornerPuller\|LeftLipCornerPuller]] | float | Raises the corners of the mouth upwards in a smile. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftLipStretcher\|LeftLipStretcher]] | float | Stretches the corners of the mouth apart. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftLowerLipDepressor\|LeftLowerLipDepressor]] | float | Lowers the lower lip down away from the upper lip revealing the lower teeth. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftNoseWrinkler\|LeftNoseWrinkler]] | float | Raise the left nostril, pulls the brow down slightly, and wrinkles on the side of the nose. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftOuterBrowRaiser\|LeftOuterBrowRaiser]] | float | Raises the outer part of the left brow upwards. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftUpperLipRaiser\|LeftUpperLipRaiser]] | float | Raises the left upper lip away from the lower lip revealing the upper teeth. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LipPresser\|LipPresser]] | float | Presses the lips together. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LipsTogether\|LipsTogether]] | float | Brings the lips together relative to JawDrop. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LowerLipSuck\|LowerLipSuck]] | float | Rolls the lower lip up over the teeth. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#MouthLeft\|MouthLeft]] | float | Moves the mouth left. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#MouthRight\|MouthRight]] | float | Moves the mouth right. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#Pucker\|Pucker]] | float | Makes a kiss-like shape with the mouth. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightBrowLowerer\|RightBrowLowerer]] | float | Lowers the right brow down. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightCheekPuff\|RightCheekPuff]] | float | Puffs up the right cheek. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightCheekRaiser\|RightCheekRaiser]] | float | Squints the right eye. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightDimpler\|RightDimpler]] | float | Moves the corners of the mouth back in Z. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightEyeClosed\|RightEyeClosed]] | float | Closes the right eyelid. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightEyeUpperLidRaiser\|RightEyeUpperLidRaiser]] | float | Raises the right eyelid upwards to reveal more of the eye white above the iris. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightInnerBrowRaiser\|RightInnerBrowRaiser]] | float | Raises the interior half of the right brow upwards. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightLipCornerDown\|RightLipCornerDown]] | float | Lowers the corners of the mouth downwards in a frown. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightLipCornerPuller\|RightLipCornerPuller]] | float | Raises the corners of the mouth upwards in a smile. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightLipStretcher\|RightLipStretcher]] | float | Stretches the corners of the mouth apart. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightLowerLipDepressor\|RightLowerLipDepressor]] | float | Lowers the lower lip down away from the upper lip revealing the lower teeth. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightNoseWrinkler\|RightNoseWrinkler]] | float | Raises the right nostril, pulls the brow down slightly, and wrinkles on the side of the nose. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightOuterBrowRaiser\|RightOuterBrowRaiser]] | float | Raises the outer part of the right brow upwards. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightUpperLipRaiser\|RightUpperLipRaiser]] | float | Raises the right upper lip away from the lower lip revealing the upper teeth. This is a required pose for avatars. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#TongueDown\|TongueDown]] | float | Bends the tongue down. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#TongueOut\|TongueOut]] | float | Extends the tip of the tongue out of the mouth. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#TongueUp\|TongueUp]] | float | Bends the tongue up. |
| [[30 Official Roblox Docs/API Reference/Classes/FaceControls#UpperLipSuck\|UpperLipSuck]] | float | Rolls the upper lip around the teeth. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ChinRaiser

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Raises the chin up; moves the lower lip upwards

### ChinRaiserUpperLip

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Moves the upper lip when ChinRaiser is engaged and touching the upper lip

### Corrugator

**Type:** float

**Thread safety:** ReadSafe · **Category:** Brows · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Brings the left and right brows inward together

### EyesLookDown

**Type:** float

**Thread safety:** ReadSafe · **Category:** Eyes · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Moves gaze down. This is a required pose for avatars.

### EyesLookLeft

**Type:** float

**Thread safety:** ReadSafe · **Category:** Eyes · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Moves gaze left. This is a required pose for avatars.

### EyesLookRight

**Type:** float

**Thread safety:** ReadSafe · **Category:** Eyes · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Moves gaze right. This is a required pose for avatars.

### EyesLookUp

**Type:** float

**Thread safety:** ReadSafe · **Category:** Eyes · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Moves gaze up. This is a required pose for avatars.

### FlatPucker

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Also known as lip tightener; brings the corners of the mouth inward and pressing the lips back against the teeth

### Funneler

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Makes a 'O' shape with the mouth

### JawDrop

**Type:** float

**Thread safety:** ReadSafe · **Category:** Jaw · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Lowers the jaw downward opening the mouth. This is a required pose for avatars.

### JawLeft

**Type:** float

**Thread safety:** ReadSafe · **Category:** Jaw · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Moves the mouth and jaw to the character's left. Like all [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] properties, this value is clamped between 0 and 1 and defaults to 0, meaning no displacement. [[30 Official Roblox Docs/API Reference/Classes/FaceControls#JawRight|FaceControls.JawRight]] applies the opposite displacement, moving the mouth and jaw to the character's right.

### JawRight

**Type:** float

**Thread safety:** ReadSafe · **Category:** Jaw · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Moves mouth and jaw to the right (character right)

### LeftBrowLowerer

**Type:** float

**Thread safety:** ReadSafe · **Category:** Brows · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Lowers the left brow down

### LeftCheekPuff

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Puffs up the left cheek

### LeftCheekRaiser

**Type:** float

**Thread safety:** ReadSafe · **Category:** Eyes · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Squints the left eye

### LeftDimpler

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Moves the corners of the mouth back in Z

### LeftEyeClosed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Eyes · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Closes the left eyelid. This is a required pose for avatars.

### LeftEyeUpperLidRaiser

**Type:** float

**Thread safety:** ReadSafe · **Category:** Eyes · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Raises the left eyelid upwards to reveal more of the eye white above the iris

### LeftInnerBrowRaiser

**Type:** float

**Thread safety:** ReadSafe · **Category:** Brows · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Raises the interior half of the left brow upwards

### LeftLipCornerDown

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Lowers the corners of the mouth downwards in a frown

### LeftLipCornerPuller

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Raises the corners of the mouth upwards in a smile. This is a required pose for avatars.

### LeftLipStretcher

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Stretches the corners of the mouth apart. This is a required pose for avatars.

### LeftLowerLipDepressor

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Lowers the lower lip down away from the upper lip revealing the lower teeth. This is a required pose for avatars.

### LeftNoseWrinkler

**Type:** float

**Thread safety:** ReadSafe · **Category:** Brows · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Raise the left nostril, pulls the brow down slightly, and wrinkles on the side of the nose

### LeftOuterBrowRaiser

**Type:** float

**Thread safety:** ReadSafe · **Category:** Brows · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Raises the outer part of the left brow upwards

### LeftUpperLipRaiser

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Raises the left upper lip away from the lower lip revealing the upper teeth. This is a required pose for avatars.

### LipPresser

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Presses the lips together

### LipsTogether

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Brings the lips together relative to JawDrop. This is a required pose for avatars.

### LowerLipSuck

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Rolls the lower lip up over the teeth

### MouthLeft

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Moves the mouth left

### MouthRight

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Moves the mouth right

### Pucker

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Makes a kiss-like shape with the mouth. This is a required pose for avatars.

### RightBrowLowerer

**Type:** float

**Thread safety:** ReadSafe · **Category:** Brows · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Lowers the right brow down

### RightCheekPuff

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Puffs up the right cheek

### RightCheekRaiser

**Type:** float

**Thread safety:** ReadSafe · **Category:** Eyes · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Squints the right eye

### RightDimpler

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Moves the corners of the mouth back in Z

### RightEyeClosed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Eyes · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Closes the right eyelid. This is a required pose for avatars.

### RightEyeUpperLidRaiser

**Type:** float

**Thread safety:** ReadSafe · **Category:** Eyes · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Raises the right eyelid upwards to reveal more of the eye white above the iris

### RightInnerBrowRaiser

**Type:** float

**Thread safety:** ReadSafe · **Category:** Brows · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Raises the interior half of the right brow upwards

### RightLipCornerDown

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Lowers the corners of the mouth downwards in a frown

### RightLipCornerPuller

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Raises the corners of the mouth upwards in a smile. This is a required pose for avatars.

### RightLipStretcher

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Stretches the corners of the mouth apart. This is a required pose for avatars.

### RightLowerLipDepressor

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Lowers the lower lip down away from the upper lip revealing the lower teeth. This is a required pose for avatars.

### RightNoseWrinkler

**Type:** float

**Thread safety:** ReadSafe · **Category:** Brows · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Raises the right nostril, pulls the brow down slightly, and wrinkles on the side of the nose

### RightOuterBrowRaiser

**Type:** float

**Thread safety:** ReadSafe · **Category:** Brows · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Raises the outer part of the right brow upwards

### RightUpperLipRaiser

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Raises the right upper lip away from the lower lip revealing the upper teeth. This is a required pose for avatars.

### TongueDown

**Type:** float

**Thread safety:** ReadSafe · **Category:** Tongue · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Bends the tongue down

### TongueOut

**Type:** float

**Thread safety:** ReadSafe · **Category:** Tongue · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Extends the tip of the tongue out of the mouth

### TongueUp

**Type:** float

**Thread safety:** ReadSafe · **Category:** Tongue · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Bends the tongue up

### UpperLipSuck

**Type:** float

**Thread safety:** ReadSafe · **Category:** Mouth · **Loaded/Saved:** false/false · **Capabilities:** Animation · **Tags:** `NotReplicated`

Rolls the upper lip around the teeth

---
*Source: [FaceControls](https://create.roblox.com/docs/reference/engine/classes/FaceControls) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
