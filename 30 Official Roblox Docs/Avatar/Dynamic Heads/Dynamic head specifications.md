---
title: "Dynamic head specifications"
description: "Dynamic head specifications list the specific technical requirements for Studio compatibility."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/dynamic-heads/specifications"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Dynamic head specifications list the specific technical requirements for Studio compatibility.*

Character body models with dynamic heads require a specific set of components and configuration standards so that the entire model works as expected across the platform, including universal support for head accessories and facial animation, and so that the characters can be sold on the Marketplace.

Before you start the export process, verify that your model meets the following modeling specifications and guidelines for proper Studio compatibility.

> [!warning]
> Validation for dynamic heads uses a specialized process that may require you to adjust your existing dynamic head asset. For more information, see [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation|Dynamic head validation]].

> [!info]
> [[30 Official Roblox Docs/Avatar Setup/Avatar Setup|Avatar Setup]] automatically generates components for your avatar characters, **including the head cage and facial animation** required for the Marketplace. You can save time by submitting character models without avatar components into Avatar Setup, then modifying the output. If necessary, you can download your output as a `.gltf`, then adjust the FACS or cage data in your third-party modeling tool.
>
> For issues or feedback regarding Avatar Setup, submit a [bug report](https://devforum.roblox.com/c/bug-reports/10).

## Outer cage

Like all avatar character [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Body parts|body parts]], dynamic heads require an outer cage to ensure layered accessories work properly. In addition, dynamic head outer cages serve to establish **facial landmarks** for the eyes and mouth of the face for the validation process.

For information on how to improve or resolve errors with your dynamic head's outer cage, see [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head caging best practices|Dynamic head caging best practices]].

### Facial landmarks

During validation, Roblox projects the cage eye/mouth regions to the base mesh to identify the eyes and mouth regions of your character head. Roblox expects the following 3 distinct landmarks in your cages:

- Left eye landmark
- Right eye landmark
- Mouth landmark

Even for non-humanoid faces that don't include visual eyes or mouths, it's important to ensure that these landmarks still exist and can be projected over your base mesh. For more information on this process, see [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation|Dynamic head validation]].

*(image in the full Top G Vault)*

*Example face cage UV*

*(image in the full Top G Vault)*

*Highlighted vertices of cage are used to track eyes/mouth on base mesh*

*(image in the full Top G Vault)*

*Landmarks from cage applied to base mesh, used as an indicator for basic animation support during validation*

> [!danger]
> The mouth landmark vertices are on the **second loop** of vertices from the mouth opening. This precision can help prevent issues with [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation#Landmark projection|landmark validation]].
>
> *(image in the full Top G Vault)*

## FACS poses

Dynamic heads support facial animation and can include many different base poses to meet the needs of your character design. That being said, avatar character bodies require at least the following 17 [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference|FACS poses]] to support avatar chat:

- `LeftEyeClosed`
- `RightEyeClosed`
- `EyesLookDown`
- `JawDrop`
- `Pucker`
- `LeftLipCornerPuller`
- `RightLipCornerPuller`
- `ChinRaiser`
- `ChinRaiserUpperLip`
- `LeftCheekRaiser`
- `RightCheekRaiser`
- `LeftInnerBrowRaiser`
- `RightInnerBrowRaiser`
- `LeftLipCornerDown`
- `RightLipCornerDown`
- `LeftLowerLipDepressor`
- `RightLowerLipDepressor`

> [!info]
> While these 17 poses are a requirement, it's recommended to include as many facial poses as possible in your asset to improve expressiveness and facial animation fidelity for facial animations.

To pass the dynamic head [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation|validation process]], your character's head must successfully perform the following 5 facial actions. If the dynamic head can't deform at the points of the cage's [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head specifications#Facial landmarks|facial landmarks]] for these actions, validation fails for the asset.

| Action Unit Test | Non-Zero Control Values |
| --- | --- |
| Left eye blink | `LeftEyeClosed` = `1`<br>`EyesLookDown` = `1` |
| Right eye blink | `RightEyeClosed` = `1`<br>`EyesLookDown` = `1` |
| Mouth opens | `JawDrop` = `1` |
| Happy expression | `Pucker` = `1`<br>`LeftLipCornerPuller` = `1`<br>`RightLipCornerPuller` = `1` |
| Sad expression | `ChinRaiser` = `1`<br>`ChinRaiserUpperLip` = `1`<br>`LeftCheekRaiser` = `0.85`<br>`RightCheekRaiser` = `0.85`<br>`LeftInnerBrowRaiser` = `1`<br>`RightInnerBrowRaiser` = `1`<br>`LeftLipCornerDown` = `1`<br>`RightLipCornerDown` = `1`<br>`LeftLowerLipDepressor` = `1`<br>`RightLowerLipDepressor` = `1` |

## Marketplace requirements

Along with the other technical requirements listed, your character bodies with dynamic heads must meet the following additional specifications before uploading them to the Marketplace to sell:

- Ensure that your character bodies adhere to [[30 Official Roblox Docs/Marketplace/Marketplace policy|Marketplace policies]].
- Whenever applicable, ensure that your character bodies adhere to Roblox's [[30 Official Roblox Docs/Art/Modeling/General specifications|custom mesh specifications]] and [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|character body specifications]].
- Object [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]] is set to `Plastic`.
- Object [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|Transparency]] is set to `0`.
- Object [[30 Official Roblox Docs/API Reference/Classes/MeshPart|VertexColor]] is the default `1, 1, 1`.
- If your character's head includes separate eyelash and eyebrow assets, you must add them to your character body model as [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] objects. For more information, see [[30 Official Roblox Docs/Art/Accessories/Publish bodies with eyelashes and eyebrows|Publish bodies with eyelashes and eyebrows]].
- Your [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] instance doesn't contain extraneous objects, like [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or additional [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] instances.

---
*Source: [Dynamic head specifications](https://create.roblox.com/docs/avatar/dynamic-heads/specifications) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
