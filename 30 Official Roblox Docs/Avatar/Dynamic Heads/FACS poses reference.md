---
title: "FACS poses reference"
description: "The Facial Action Coding System (FACS) ensures that all face animations have a common pose reference and can create similar face animations."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/dynamic-heads/facs-poses-reference"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Facial Action Coding System (FACS) ensures that all face animations have a common pose reference and can create similar face animations.*

The [Facial Action Coding System](https://en.wikipedia.org/wiki/Facial_Action_Coding_System) (FACS) is a comprehensive, anatomically-based system for describing all visually discernible facial movement. This system breaks down all facial expressions into individual types of muscle movement, such as `LeftEyeClosed` or `MouthLeft`. You can [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Pose the joints|configure]] and store these muscle movements, or **poses**, within the head model through a third-party modeling software, such as [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview). When you import the head model into Studio, you can then access and [[30 Official Roblox Docs/Art/Characters/Facial Animation/Animate heads|animate]] these poses to create lively facial expressions.

The following is a list of 50 base poses that you can use in Roblox to portray a wide range of face emotions. Except for the first neutral pose, the order of poses you save to your character model doesn't matter since this information is set during the [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Map each pose|mapping]] process as a custom property.

> [!warning]
> If you intend to publish your avatar to the Marketplace, your avatar head must include the required [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head specifications#FACS poses|17 facial base poses]]. Marketplace validation rejects assets that do not include these 17 required base poses.

You can combine multiple FACS base poses together in one animation frame to create complex facial expressions. However, some combinations of poses might collide unless you also add a [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads#Combination poses|corrective]] to their full default values.

## LeftEyeClosed

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftEyeClosed|LeftEyeClosed]] closes the character's left eyelid.

[Video: LeftEyeClosedA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftEyeClosedA.mp4)

[Video: LeftEyeClosedB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftEyeClosedB.mp4)

## RightEyeClosed

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightEyeClosed|RightEyeClosed]] closes the character's right eyelid.

[Video: RightEyeClosedA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightEyeClosedA.mp4)

[Video: RightEyeClosedB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightEyeClosedB.mp4)

## EyesLookDown

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#EyesLookDown|EyesLookDown]] makes the eyes gaze down.

[Video: EyesLookDownA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/EyesLookDownA.mp4)

[Video: EyesLookDownB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/EyesLookDownB.mp4)

## JawDrop

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#JawDrop|JawDrop]] lowers the jaw downward, opening the mouth.

[Video: JawDropA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/JawDropA.mp4)

[Video: JawDropB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/JawDropB.mp4)

## Pucker

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#Pucker|Pucker]] makes a kiss-like shape with the mouth.

[Video: PuckerA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/PuckerA.mp4)

[Video: PuckerB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/PuckerB.mp4)

## LeftLipCornerPuller

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftLipCornerPuller|LeftLipCornerPuller]] raises the corners of the mouth upwards in a smile.

[Video: LeftLipCornerPullerA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftLipCornerPullerA.mp4)

[Video: LeftLipCornerPullerB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftLipCornerPullerB.mp4)

## RightLipCornerPuller

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightLipCornerPuller|RightLipCornerPuller]] raises the corners of the mouth upwards in a smile.

[Video: RightLipCornerPullerA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightLipCornerPullerA.mp4)

[Video: RightLipCornerPullerB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightLipCornerPullerB.mp4)

## ChinRaiser

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#ChinRaiser|ChinRaiser]] raises the chin up; moves the lower lip upwards.

[Video: ChinRaiserA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/ChinRaiserA.mp4)

[Video: ChinRaiserB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/ChinRaiserB.mp4)

When you use [[30 Official Roblox Docs/API Reference/Classes/FaceControls#ChinRaiser|ChinRaiser]] and the character's mouth is closed, the character's lower lip collides with their upper lip. When you need to keep the mouth closed while raising the chin, use [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference#ChinRaiserUpperLip|ChinRaiserUpperLip]] and [[30 Official Roblox Docs/API Reference/Classes/FaceControls#ChinRaiser|ChinRaiser]] together to raise both the lower and upper lip, and avoid a collision. Note that if you use this method, you must set both [[30 Official Roblox Docs/API Reference/Classes/FaceControls#ChinRaiser|ChinRaiser]] and [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference#ChinRaiserUpperLip|ChinRaiserUpperLip]] to the same value so the lips move the same distance upwards.

## ChinRaiserUpperLip

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#ChinRaiserUpperLip|ChinRaiserUpperLip]] raises the upper lip up when ChinRaiser is engaged and it is touching the upper lip.

[Video: ChinRaiserUpperLipA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/ChinRaiserUpperLipA.mp4)

[Video: ChinRaiserUpperLipB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/ChinRaiserUpperLipB.mp4)

## LeftCheekRaiser

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftCheekRaiser|LeftCheekRaiser]] squints the character's left eye.

[Video: LeftCheekRaiserA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftCheekRaiserA.mp4)

[Video: LeftCheekRaiserB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftCheekRaiserB.mp4)

## RightCheekRaiser

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightCheekRaiser|RightCheekRaiser]] squints the character's right eye.

[Video: RightCheekRaiserA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightCheekRaiserA.mp4)

[Video: RightCheekRaiserB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightCheekRaiserB.mp4)

## LeftInnerBrowRaiser

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftInnerBrowRaiser|LeftInnerBrowRaiser]] raises the interior half of the character's left brow upwards.

[Video: LeftInnerBrowRaiserA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftInnerBrowRaiserA.mp4)

[Video: LeftInnerBrowRaiserB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftInnerBrowRaiserB.mp4)

## RightInnerBrowRaiser

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightInnerBrowRaiser|RightInnerBrowRaiser]] raises the interior half of the character's right brow upwards.

[Video: RightInnerBrowRaiserA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightInnerBrowRaiserA.mp4)

[Video: RightInnerBrowRaiserB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightInnerBrowRaiserB.mp4)

## LeftLipCornerDown

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftLipCornerDown|LeftLipCornerDown]] lowers the corners of the mouth downwards in a frown.

[Video: LeftLipCornerDownA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftLipCornerDownA.mp4)

[Video: LeftLipCornerDownB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftLipCornerDownB.mp4)

## RightLipCornerDown

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightLipCornerDown|RightLipCornerDown]] lowers the corners of the mouth downwards in a frown.

[Video: RightLipCornerDownA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightLipCornerDownA.mp4)

[Video: RightLipCornerDownB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightLipCornerDownB.mp4)

## LeftLowerLipDepressor

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftLowerLipDepressor|LeftLowerLipDepressor]] lowers the lower lip downwards away from the upper lip, revealing the lower teeth.

[Video: LeftLowerLipDepressorA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftLowerLipDepressorA.mp4)

[Video: LeftLowerLipDepressorB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftLowerLipDepressorB.mp4)

## RightLowerLipDepressor

> [!warning]
> If publishing to the Marketplace, your avatar asset must include this pose.

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightLowerLipDepressor|RightLowerLipDepressor]] lowers the lower lip down away from the upper lip revealing the lower teeth.

[Video: RightLowerLipDepressorA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightLowerLipDepressorA.mp4)

[Video: RightLowerLipDepressorB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightLowerLipDepressorB.mp4)

## EyesLookLeft

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#EyesLookLeft|EyesLookLeft]] makes the eyes gaze left.

[Video: EyesLookLeftA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/EyesLookLeftA.mp4)

[Video: EyesLookLeftB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/EyesLookLeftB.mp4)

## EyesLookRight

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#EyesLookRight|EyesLookRight]] makes the eyes gaze right.

[Video: EyesLookRightA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/EyesLookRightA.mp4)

[Video: EyesLookRightB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/EyesLookRightB.mp4)

## EyesLookUp

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#EyesLookUp|EyesLookUp]] makes the eyes gaze up.

[Video: EyesLookUpA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/EyesLookUpA.mp4)

[Video: EyesLookUpB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/EyesLookUpB.mp4)

## LeftLipStretcher

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftLipStretcher|LeftLipStretcher]] stretches the corners of the mouth apart.

[Video: LeftLipStretcherA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftLipStretcherA.mp4)

[Video: LeftLipStretcherB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftLipStretcherB.mp4)

## LeftUpperLipRaiser

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftUpperLipRaiser|LeftUpperLipRaiser]] raises the character's left upper lip away from the lower lip revealing the upper teeth.

[Video: LeftUpperLipRaiserA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftUpperLipRaiserA.mp4)

[Video: LeftUpperLipRaiserB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftUpperLipRaiserB.mp4)

## LipsTogether

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LipsTogether|LipsTogether]] brings the character's lips together. However, if the character's mouth is closed, their lips are already together and they collide.

[Video: LipsTogetherA-1.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LipsTogetherA-1.mp4)

[Video: LipsTogetherB-1.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LipsTogetherB-1.mp4)

This pose's main use case is in connection with the [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference#JawDrop|JawDrop]] property. If you set [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference#JawDrop|JawDrop]] and [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LipsTogether|LipsTogether]] to 100% of their default values, the character's lips stay together as the jaw drops.

[Video: LipsTogetherA-2.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LipsTogetherA-2.mp4)

[Video: LipsTogetherB-2.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LipsTogetherB-2.mp4)

In addition, if you set [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference#JawDrop|JawDrop]] to 100% of its default value, and ease [[30 Official Roblox Docs/API Reference/Classes/FaceControls#LipsTogether|LipsTogether]] in and out of 100% of its default value, the character's lips open and close.

[Video: LipsTogetherA-3.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LipsTogetherA-3.mp4)

[Video: LipsTogetherB-3.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LipsTogetherB-3.mp4)

## RightLipStretcher

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightLipStretcher|RightLipStretcher]] stretches the corners of the mouth apart.

[Video: RightLipStretcherA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightLipStretcherA.mp4)

[Video: RightLipStretcherB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightLipStretcherB.mp4)

## RightUpperLipRaiser

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightUpperLipRaiser|RightUpperLipRaiser]] raises the right upper lip away from the lower lip, revealing the upper teeth.

[Video: RightUpperLipRaiserA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightUpperLipRaiserA.mp4)

[Video: RightUpperLipRaiserB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightUpperLipRaiserB.mp4)

## FlatPucker

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#FlatPucker|FlatPucker]] brings the corners of the mouth inward and presses the lips back against the teeth. This pose is also known as lip tightener.

[Video: FlatPuckerA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/FlatPuckerA.mp4)

[Video: FlatPuckerB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/FlatPuckerB.mp4)

## Funneler

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#Funneler|Funneler]] makes an 'O' shape with the mouth.

[Video: FunnelerA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/FunnelerA.mp4)

[Video: FunnelerB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/FunnelerB.mp4)

## LowerLipSuck

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LowerLipSuck|LowerLipSuck]] rolls the lower lip up over the teeth.

[Video: LowerLipSuckA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LowerLipSuckA.mp4)

[Video: LowerLipSuckB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LowerLipSuckB.mp4)

## LipPresser

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LipPresser|LipPresser]] presses the lips together.

[Video: LipPresserA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LipPresserA.mp4)

[Video: LipPresserB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LipPresserB.mp4)

## MouthLeft

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#MouthLeft|MouthLeft]] moves the mouth to the character's left. This property doesn't move the character's jaw, teeth, or tongue, only their mouth. If you want to move those additional facial features, use [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference#JawLeft|JawLeft]] instead.

[Video: MouthLeftA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/MouthLeftA.mp4)

[Video: MouthLeftB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/MouthLeftB.mp4)

## MouthRight

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#MouthRight|MouthRight]] moves the mouth to the character's right. This property doesn't move the character's jaw, teeth, or tongue to the right, only their mouth. If you want to move those additional facial features, use [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference#JawRight|JawRight]] instead.

[Video: MouthRightA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/MouthRightA.mp4)

[Video: MouthRightB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/MouthRightB.mp4)

## UpperLipSuck

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#UpperLipSuck|UpperLipSuck]] rolls the upper lip around the teeth.

[Video: UpperLipSuckA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/UpperLipSuckA.mp4)

[Video: UpperLipSuckB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/UpperLipSuckB.mp4)

## LeftCheekPuff

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftCheekPuff|LeftCheekPuff]] puffs up the character's left cheek.

[Video: LeftCheekPuffA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftCheekPuffA.mp4)

[Video: LeftCheekPuffB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftCheekPuffB.mp4)

## LeftDimpler

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftDimpler|LeftDimpler]] moves the corners of the left side of the mouth back toward the teeth.

[Video: LeftDimplerA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftDimplerA.mp4)

[Video: LeftDimplerB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftDimplerB.mp4)

## RightCheekPuff

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightCheekPuff|RightCheekPuff]] puffs up the character's right cheek.

[Video: RightCheekPuffA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightCheekPuffA.mp4)

[Video: RightCheekPuffB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightCheekPuffB.mp4)

## RightDimpler

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightDimpler|RightDimpler]] moves the corners of the right side of the mouth back toward the teeth.

[Video: RightDimplerA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightDimplerA.mp4)

[Video: RightDimplerB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightDimplerB.mp4)

## JawLeft

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#JawLeft|JawLeft]] moves the character's jaw, teeth, tongue, and lower lip to their left. If you just want to move the character's mouth to their left, use [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference#MouthLeft|MouthLeft]] instead.

[Video: JawLeftA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/JawLeftA.mp4)

[Video: JawLeftB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/JawLeftB.mp4)

## JawRight

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#JawRight|JawRight]] moves the character's jaw, teeth, tongue, and lower lip to their right. If you just want to move the character's mouth to their right, use [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference#MouthRight|MouthRight]] instead.

[Video: JawRightA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/JawRightA.mp4)

[Video: JawRightB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/JawRightB.mp4)

## Corrugator

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#Corrugator|Corrugator]] brings the left and right brows inward together.

[Video: CorrugatorA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/CorrugatorA.mp4)

[Video: CorrugatorB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/CorrugatorB.mp4)

## LeftBrowLowerer

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftBrowLowerer|LeftBrowLowerer]] lowers the character's left brow down.

[Video: LeftBrowLowererA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftBrowLowererA.mp4)

[Video: LeftBrowLowererB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftBrowLowererB.mp4)

## LeftOuterBrowRaiser

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftOuterBrowRaiser|LeftOuterBrowRaiser]] raises the outer part of the character's left brow upwards.

[Video: LeftOuterBrowRaiserA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftOuterBrowRaiserA.mp4)

[Video: LeftOuterBrowRaiserB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftOuterBrowRaiserB.mp4)

## LeftNoseWrinkler

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftNoseWrinkler|LeftNoseWrinkler]] raises the character's left nostril, pulls the brow down slightly, and wrinkles the left side of the nose.

[Video: LeftNoseWrinklerA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftNoseWrinklerA.mp4)

[Video: LeftNoseWrinklerB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftNoseWrinklerB.mp4)

## RightBrowLowerer

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightBrowLowerer|RightBrowLowerer]] lowers the character's right brow down.

[Video: RightBrowLowererA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightBrowLowererA.mp4)

[Video: RightBrowLowererB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightBrowLowererB.mp4)

## RightOuterBrowRaiser

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightOuterBrowRaiser|RightOuterBrowRaiser]] raises the outer part of the character's right brow upwards.

[Video: RightOuterBrowRaiserA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightOuterBrowRaiserA.mp4)

[Video: RightOuterBrowRaiserB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightOuterBrowRaiserB.mp4)

## RightNoseWrinkler

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightNoseWrinkler|RightNoseWrinkler]] raises the character's right nostril, pulls the brow down slightly, and wrinkles the right side of the nose.

[Video: RightNoseWrinklerA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightNoseWrinklerA.mp4)

[Video: RightNoseWrinklerB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightNoseWrinklerB.mp4)

## LeftEyeUpperLidRaiser

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#LeftEyeUpperLidRaiser|LeftEyeUpperLidRaiser]] raises the character's left eyelid upwards to reveal more of the eye white above the iris.

[Video: LeftEyeUpperLidRaiserA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftEyeUpperLidRaiserA.mp4)

[Video: LeftEyeUpperLidRaiserB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/LeftEyeUpperLidRaiserB.mp4)

## RightEyeUpperLidRaiser

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#RightEyeUpperLidRaiser|RightEyeUpperLidRaiser]] raises the character's right eyelid upwards to reveal more of the eye white above the iris.

[Video: RightEyeUpperLidRaiserA.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightEyeUpperLidRaiserA.mp4)

[Video: RightEyeUpperLidRaiserB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/RightEyeUpperLidRaiserB.mp4)

## TongueDown

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#TongueDown|TongueDown]] bends the tongue down. This pose is only visible if you combine it with [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference#TongueOut|TongueOut]], otherwise the tongue only bends down within the character's mouth.

[Video: TongueDown.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/TongueDown.mp4)

## TongueOut

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#TongueOut|TongueOut]] sticks the tip of the tongue out of the mouth.

[Video: TongueOut.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/TongueOut.mp4)

## TongueUp

[[30 Official Roblox Docs/API Reference/Classes/FaceControls#TongueUp|TongueUp]] bends the tongue up. This pose is only visible if you combine it with [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference#TongueOut|TongueOut]], otherwise the tongue only bends up within the character's mouth.

[Video: TongueUp.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/avatar/dynamic-heads/facs-pose-reference/TongueUp.mp4)

---
*Source: [FACS poses reference](https://create.roblox.com/docs/avatar/dynamic-heads/facs-poses-reference) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
