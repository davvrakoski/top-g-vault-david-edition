---
area: "20 FBX Asset Library"
cluster: "Animation"
license: "CC-BY-4.0"
fbx_count: 810
tags: [asset, fbx, animation, mocap]
cssclasses: [tg-a20]
---
# 100STYLE Mocap - Catalog
> [!topg] 810 motion-capture FBX clips of one actor walking, running, sidestepping and idling in **100 different styles** (zombie, drunk, old, proud, robot, sneaking, limping, hopping...). 1,127 minutes (18.8 hours) of 30 fps animation, 1.30 GB. **License: CC BY 4.0, credit is required** (see [[#Attribution (required)]]).

Back to [[FBX Asset Library - Hub]] · [[Animation - Hub]]

## What it is
- The **100STYLE dataset** by Ian Mason, Sebastian Starke and Taku Komura (Zenodo record 8127870), recorded for the 2022 paper *Real-Time Style Modelling of Human Locomotion via Feature-Wise Transformations and Local Motion Phases*. Original data: 810 BVH files at 60 fps, about 4.78 million frames.
- Converted for this vault: each BVH trimmed to the dataset's own `Frame_Cuts.csv` (removes the T-pose and setup frames at both ends), resampled to **30 fps**, exported from Blender 5.2 as **FBX: armature + baked animation**, metres, Y-up / -Z forward, no leaf bones.
- Skeleton: **23 joints**, root `Hips`; spine `Chest`, `Chest2`, `Chest3`, `Chest4`, `Neck`, `Head`; arms `Collar`, `Shoulder`, `Elbow`, `Wrist`; legs `Hip`, `Knee`, `Ankle`, `Toe` (each with `Left`/`Right` prefix). About 1.79 m tall. No mesh: these are animation files for retargeting.
- **Root motion is kept** in the `Hips` bone (the character really travels). Clips are long continuous takes (median: walks and TR1 about 2 minutes, runs and sidesteps 40-90 s, idles 13 s): cut the loop or section you need.
- Each style folder: `<Style>_<Code>.fbx` per content type + `preview.png`. The original `Dataset_List.csv` and `Frame_Cuts.csv` sit in this folder too.

### Content codes
Code | Movement
---|---
`FW` | Forwards walking
`FR` | Forwards running
`BW` | Backwards walking
`BR` | Backwards running
`SW` | Sidestep walking
`SR` | Sidestep running
`ID` | Idling (standing in the style)
`TR1` / `TR2` / `TR3` | Transitions: the style performed while switching between the movement types above (only 8 styles have TR2, 2 have TR3)

## Styles
Preview | Style | Clips | Min | Description (from the dataset's `Dataset_List.csv`) | Codes
:-:|---|--:|--:|---|---
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Aeroplane/preview.png\|96]] | **Aeroplane** | 8 | 11.1 | Both arms raised as wings - tilting from side to side. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Akimbo/preview.png\|96]] | **Akimbo** | 8 | 10.0 | Hands on hips. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Angry/preview.png\|96]] | **Angry** | 8 | 7.2 | Swing lower arms aggressively - fists closed. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/ArmsAboveHead/preview.png\|96]] | **ArmsAboveHead** | 8 | 9.1 | Arms raised straight above head. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/ArmsBehindBack/preview.png\|96]] | **ArmsBehindBack** | 8 | 9.6 | Prince Phillip Walk - hands clasped behind back. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/ArmsBySide/preview.png\|96]] | **ArmsBySide** | 8 | 9.6 | Keep arms fixed by side and do not move them. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/ArmsFolded/preview.png\|96]] | **ArmsFolded** | 8 | 9.9 | Right arm folded over left. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Balance/preview.png\|96]] | **Balance** | 8 | 14.0 | Arms out to side for balance - tilting side to side. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/BeatChest/preview.png\|96]] | **BeatChest** | 8 | 9.9 | Beat chest while moving normally. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/BentForward/preview.png\|96]] | **BentForward** | 8 | 9.7 | Tilt torso forwards. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/BentKnees/preview.png\|96]] | **BentKnees** | 8 | 10.9 | Bend knees as much as possible. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/BigSteps/preview.png\|96]] | **BigSteps** | 8 | 8.9 | As large steps as possible. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/BouncyLeft/preview.png\|96]] | **BouncyLeft** | 9 | 9.8 | Step normally with right foot but spring off left foot. | `BR, BW, FR, FW, ID, SR, SW, TR1, TR2`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/BouncyRight/preview.png\|96]] | **BouncyRight** | 9 | 9.9 | Step normally with left foot but spring off right foot. | `BR, BW, FR, FW, ID, SR, SW, TR1, TR2`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Cat/preview.png\|96]] | **Cat** | 8 | 12.7 | Use hands as paws - step opposite hand and foot. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Chicken/preview.png\|96]] | **Chicken** | 8 | 10.3 | Bob head - arms as wings. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/CrossOver/preview.png\|96]] | **CrossOver** | 8 | 13.7 | Step each foot in front of other leg. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Crouched/preview.png\|96]] | **Crouched** | 8 | 10.0 | Sqaut slightly and bend back. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/CrowdAvoidance/preview.png\|96]] | **CrowdAvoidance** | 8 | 12.7 | Occasionally turning shoulders or turn sideways to avoid others. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Depressed/preview.png\|96]] | **Depressed** | 8 | 12.8 | Head bowed arms swinging. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Dinosaur/preview.png\|96]] | **Dinosaur** | 8 | 12.3 | Like a t-rex arms close to body dinosaur posture. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/DragLeftLeg/preview.png\|96]] | **DragLeftLeg** | 8 | 13.1 | Drag left foot along the floor. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/DragRightLeg/preview.png\|96]] | **DragRightLeg** | 8 | 13.1 | Drag right foot along the floor. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Drunk/preview.png\|96]] | **Drunk** | 8 | 11.3 | Stumbling around at random. Various foot step sizes and arm motions. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/DuckFoot/preview.png\|96]] | **DuckFoot** | 8 | 14.9 | Toes pointing inwards. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Elated/preview.png\|96]] | **Elated** | 8 | 8.4 | Swing arms with spring. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/FairySteps/preview.png\|96]] | **FairySteps** | 8 | 17.0 | One foot in front of the other so the heel touches the toe. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Flapping/preview.png\|96]] | **Flapping** | 8 | 8.3 | Flap arms as wings on tiptoes. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/FlickLegs/preview.png\|96]] | **FlickLegs** | 8 | 15.2 | Knees together and flick legs to sides as moving. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Followed/preview.png\|96]] | **Followed** | 8 | 9.2 | Check behind occasionally. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/GracefulArms/preview.png\|96]] | **GracefulArms** | 8 | 9.9 | One arm across chest the other extended walk tall. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/HandsBetweenLegs/preview.png\|96]] | **HandsBetweenLegs** | 9 | 9.5 | Bent back - legs wide - hands swing between legs. | `BR, BW, FR, FW, ID, SR, SW, TR1, TR2`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/HandsInPockets/preview.png\|96]] | **HandsInPockets** | 8 | 9.8 | Place hands in pockets and walk and run. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Heavyset/preview.png\|96]] | **Heavyset** | 8 | 10.2 | Walking as a muscle man tensed biceps. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/HighKnees/preview.png\|96]] | **HighKnees** | 8 | 13.3 | Lift knees high but only knees - not marching. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/InTheDark/preview.png\|96]] | **InTheDark** | 8 | 14.2 | Feeling around as if in darkness. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/KarateChop/preview.png\|96]] | **KarateChop** | 8 | 12.4 | Open hands swing hand with each step to do a karate chop. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Kick/preview.png\|96]] | **Kick** | 8 | 13.8 | Kick with every step. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/LawnMower/preview.png\|96]] | **LawnMower** | 8 | 11.1 | Roll hands over one another like disco move and tilt torso forwards and then back. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/LeanBack/preview.png\|96]] | **LeanBack** | 8 | 10.6 | Bent backwards. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/LeanLeft/preview.png\|96]] | **LeanLeft** | 8 | 11.8 | Normal motion upperbody tilted right. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/LeanRight/preview.png\|96]] | **LeanRight** | 8 | 12.3 | Normal motion upperbody tilted left. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/LeftHop/preview.png\|96]] | **LeftHop** | 9 | 5.6 | Hop on left foot. | `BR, BW, FR, FW, ID, SR, SW, TR1, TR2`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/LegsApart/preview.png\|96]] | **LegsApart** | 8 | 12.1 | Legs relatively straight wide apart. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/LimpLeft/preview.png\|96]] | **LimpLeft** | 8 | 13.6 | Keep left leg straight and limp. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/LimpRight/preview.png\|96]] | **LimpRight** | 8 | 12.1 | Keep right leg straight and limp. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/LookUp/preview.png\|96]] | **LookUp** | 8 | 11.6 | Tilt head to look at ceiling. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Lunge/preview.png\|96]] | **Lunge** | 8 | 11.3 | Wide step bend knee every step in lunge position. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/March/preview.png\|96]] | **March** | 8 | 10.3 | High knees swing arms at elbows. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Monk/preview.png\|96]] | **Monk** | 8 | 12.1 | Interlock hands in front of pelvis head slightly bowed. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Morris/preview.png\|96]] | **Morris** | 8 | 9.8 | Swing hands side to side as if waving hankies. Bouncy/skipping footsteps. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Neutral/preview.png\|96]] | **Neutral** | 8 | 11.0 | Normal walking. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Old/preview.png\|96]] | **Old** | 8 | 19.1 | Hunchbacked move very slowly. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/OnHeels/preview.png\|96]] | **OnHeels** | 8 | 10.0 | Walk on heels with toes raised. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/OnPhoneLeft/preview.png\|96]] | **OnPhoneLeft** | 8 | 9.7 | Holding phone in left. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/OnPhoneRight/preview.png\|96]] | **OnPhoneRight** | 8 | 10.5 | Holding phone in right. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/OnToesBentForward/preview.png\|96]] | **OnToesBentForward** | 8 | 9.8 | As bent forward style but on tip toes. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/OnToesCrouched/preview.png\|96]] | **OnToesCrouched** | 8 | 10.7 | As crouched style but on tip toes. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/PendulumHands/preview.png\|96]] | **PendulumHands** | 8 | 10.5 | Squat slightly make right angle with elbows and swing hands freely. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Penguin/preview.png\|96]] | **Penguin** | 8 | 18.9 | Waddle with feet close together. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/PigeonToed/preview.png\|96]] | **PigeonToed** | 8 | 15.7 | Toes turned inwards. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Proud/preview.png\|96]] | **Proud** | 8 | 9.7 | Straight back arms move as if marching to a lesser degree. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Punch/preview.png\|96]] | **Punch** | 8 | 9.8 | Punch with every step. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Quail/preview.png\|96]] | **Quail** | 8 | 12.1 | Arms straight by sides slightly back very small quick steps. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/RaisedLeftArm/preview.png\|96]] | **RaisedLeftArm** | 8 | 8.5 | Raise left arm perpendicular to body. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/RaisedRightArm/preview.png\|96]] | **RaisedRightArm** | 8 | 9.1 | Raise right arm perpendicular to body. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/RightHop/preview.png\|96]] | **RightHop** | 9 | 5.5 | Hop on right foot. | `BR, BW, FR, FW, ID, SR, SW, TR1, TR2`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Roadrunner/preview.png\|96]] | **Roadrunner** | 8 | 8.1 | Arms behind as wings pick up knees - bent a little. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Robot/preview.png\|96]] | **Robot** | 8 | 14.8 | Stiff movements arms bending at elbows. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Rocket/preview.png\|96]] | **Rocket** | 8 | 9.5 | Bent to flat back with hands behind as thrusters. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Rushed/preview.png\|96]] | **Rushed** | 8 | 5.9 | Rushing about swinging arms for extra momentum. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/ShieldedLeft/preview.png\|96]] | **ShieldedLeft** | 8 | 9.0 | Squat down with left arm raised in block as if holding a shield above head. Right harm as if holding a sword. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/ShieldedRight/preview.png\|96]] | **ShieldedRight** | 8 | 9.2 | Squat down with right arm raised in block as if holding a shield above head. Left arm as if holding a sword. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Skip/preview.png\|96]] | **Skip** | 8 | 8.9 | Skipping like a child. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/SlideFeet/preview.png\|96]] | **SlideFeet** | 8 | 12.3 | Barely lift feet off the floor/kick into floor. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/SpinAntiClock/preview.png\|96]] | **SpinAntiClock** | 10 | 8.7 | Rotate anticlockwise as you move. | `BR, BW, FR, FW, ID, SR, SW, TR1, TR2, TR3`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/SpinClock/preview.png\|96]] | **SpinClock** | 10 | 8.6 | Rotate in clockwise circles as you move. | `BR, BW, FR, FW, ID, SR, SW, TR1, TR2, TR3`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Star/preview.png\|96]] | **Star** | 8 | 10.6 | Wide arms and legs. Arms slightly below horizontal. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/StartStop/preview.png\|96]] | **StartStop** | 8 | 22.6 | Pause briefly after after step. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Stiff/preview.png\|96]] | **Stiff** | 8 | 12.9 | Stiff limbs arms straight. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Strutting/preview.png\|96]] | **Strutting** | 8 | 12.2 | With swagger leant slightly back arms swinging freely. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Superman/preview.png\|96]] | **Superman** | 8 | 9.0 | Right arm raised like superman flying. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Swat/preview.png\|96]] | **Swat** | 8 | 8.2 | As if holding a rifle and raiding a building. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Sweep/preview.png\|96]] | **Sweep** | 8 | 12.2 | Sweeping with a broom while moving. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Swimming/preview.png\|96]] | **Swimming** | 8 | 9.6 | Breastroke walking. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/SwingArmsRound/preview.png\|96]] | **SwingArmsRound** | 8 | 12.6 | Swing arms round body (right in front left at back then switch). | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/SwingShoulders/preview.png\|96]] | **SwingShoulders** | 8 | 12.7 | Rotate torso and shoulders left to right and back. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Teapot/preview.png\|96]] | **Teapot** | 8 | 8.9 | One arm on hip other arm raised. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Tiptoe/preview.png\|96]] | **Tiptoe** | 8 | 10.0 | Walk on toes with heels raised. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/TogetherStep/preview.png\|96]] | **TogetherStep** | 8 | 17.7 | Step left foot - then together - then right foot. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/TwoFootJump/preview.png\|96]] | **TwoFootJump** | 8 | 7.9 | Feet together and jump. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/WalkingStickLeft/preview.png\|96]] | **WalkingStickLeft** | 8 | 12.1 | Walk with a stick - used broom handle. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/WalkingStickRight/preview.png\|96]] | **WalkingStickRight** | 8 | 12.3 | Walk with a stick - used broom handle. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Waving/preview.png\|96]] | **Waving** | 8 | 11.0 | Waving at somebody else at random. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/WhirlArms/preview.png\|96]] | **WhirlArms** | 9 | 10.9 | Windmill arms. | `BR, BW, FR, FW, ID, SR, SW, TR1, TR2`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/WideLegs/preview.png\|96]] | **WideLegs** | 8 | 12.0 | Legs apart motions. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/WiggleHips/preview.png\|96]] | **WiggleHips** | 8 | 17.6 | Hands raised infront of body wiggle hips side to side. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/WildArms/preview.png\|96]] | **WildArms** | 8 | 10.7 | Swing arms much more than normal almost punching into the air. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/WildLegs/preview.png\|96]] | **WildLegs** | 8 | 14.4 | Kick legs into the air with each step. | `BR, BW, FR, FW, ID, SR, SW, TR1`
![[20 FBX Asset Library/100STYLE Mocap (CC-BY 4.0)/Zombie/preview.png\|96]] | **Zombie** | 8 | 11.6 | Arms infront like zombie. | `BR, BW, FR, FW, ID, SR, SW, TR1`

## How to use in Roblox
Roblox only plays animations made for a Roblox rig (R15 for most games), with the rig's own bone names (`LowerTorso`, `UpperTorso`, `LeftUpperArm`, `LeftLowerLeg`...). These FBX files use the 100STYLE skeleton, so they must be **retargeted** first:
1. **Get an R15 rig into Blender.** Use an R15 rig file you trust (your own avatar rig, or an R15 dummy rig exported from Studio). Pose it in a T-pose like the 100STYLE skeleton, or note the difference for the retarget step.
2. **Import the 100STYLE clip** (`File > Import > FBX`). It arrives as an armature with one action.
3. **Cut the part you want.** Set the frame range to one clean cycle or a short section; long takes are not useful as game animations. If the Roblox Humanoid should do the moving, remove the horizontal travel of `Hips` (keep its up/down bob) so the clip plays in place.
4. **Retarget** the motion onto the R15 rig. Two common ways:
   - **Rokoko Studio Live for Blender** (free add-on; it may ask you to sign in with a free Rokoko account): its retargeting panel maps a source armature to a target armature and bakes the result; check every bone pair in the mapping list, since this skeleton's names are not a standard preset.
   - **Constraints**: on the R15 bones add `Copy Rotation` constraints that target the matching 100STYLE bones (plus `Copy Location` on the root), then bake with `Pose > Animation > Bake Action` (Visual Keying on, Clear Constraints on).
   Bone map that works well: `Hips -> LowerTorso`, `Chest3 or Chest4 -> UpperTorso`, `Head -> Head`, `LeftShoulder -> LeftUpperArm`, `LeftElbow -> LeftLowerArm`, `LeftWrist -> LeftHand`, `LeftHip -> LeftUpperLeg`, `LeftKnee -> LeftLowerLeg`, `LeftAnkle -> LeftFoot` (same for Right).
5. **Export the R15 rig + baked action as FBX** (armature only, baked animation, no leaf bones).
6. **In Roblox Studio**, open the Animation Editor with your R15 rig selected and use its import option for an FBX animation; check the result, then publish it and use the asset ID in an `Animation` object played through the Humanoid's `Animator`.

Tips: the actor is about 1.79 m tall while a default R15 character is about 5 studs, so rely on the retarget for proportions and do not scale the source by hand. Mirror-friendly styles are marked `Symmetric = Yes` in `Dataset_List.csv`.

For Unity, Unreal or Godot the FBX can be imported directly and retargeted with the engine's humanoid / IK retargeter (map the bones manually: `Chest2`-`Chest4` are extra spine bones).

## Attribution (required)
These files are licensed under **Creative Commons Attribution 4.0 (CC BY 4.0)**. Commercial use and redistribution are allowed **only with credit**. Put this line in your game's credits, description or store page (and keep `LICENSE-CC-BY-4.0.txt` with the files):

> "100STYLE Dataset" by Ian Mason, Sebastian Starke and Taku Komura (https://zenodo.org/records/8127870), licensed under CC BY 4.0 (https://creativecommons.org/licenses/by/4.0/). Converted from BVH to FBX, trimmed and resampled to 30 fps for the Top G Vault.

Paper citation:
> Ian Mason, Sebastian Starke, Taku Komura. 2022. Real-Time Style Modelling of Human Locomotion via Feature-Wise Transformations and Local Motion Phases. *Proceedings of the ACM on Computer Graphics and Interactive Techniques* 5, 1, Article 6 (May 2022). https://doi.org/10.1145/3522618

The creators do not endorse this vault. Files in this folder: `LICENSE-CC-BY-4.0.txt` (attribution, list of changes, full legal code), `README-100STYLE.txt` (original record text and dataset notes), `Dataset_List.csv`, `Frame_Cuts.csv`.

Last checked: 2026-10-25 (license read on the Zenodo record).
