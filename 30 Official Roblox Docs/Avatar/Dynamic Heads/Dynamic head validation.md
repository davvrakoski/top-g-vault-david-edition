---
title: "Dynamic head validation"
description: "In-depth details on how Roblox validates head assets"
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/dynamic-heads/validate"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*In-depth details on how Roblox validates head assets*

> [!info]
> This content is for creators who intend to create dynamic heads designated for the Marketplace, or any character heads that support assets from the Marketplace.

![](https://www.youtube.com/watch?v=OwhkWzSBnf0)

Roblox runs a rigorous validation to ensure each asset that you upload to the Marketplace is compatible with all other assets on the Marketplace. For dynamic heads, validation primarily ensures that the head asset includes:

- A correctly **configured outer cage** to wear clothing and accessories.
- Correctly configured **facial animation poses** to perform basic universal expressions, such as blinking and smiling.

The primary validation check for dynamic heads [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation#Facial animation detection|uses the cage to detect facial animation]]. See below for a reference of how validation processes, as well as [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation#Common issues|common issues]].

> [!warning]
> Validation also checks for other issues, such as poor caging or missing required FACS poses. For more information, see [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation#Common issues|common issues]].

> [!info]
> [[30 Official Roblox Docs/Avatar Setup/Avatar Setup|Avatar Setup]] automatically generates components for your avatar characters, **including the head cage and facial animation** required for the Marketplace. You can save time by submitting character models without avatar components into Avatar Setup, then modifying the output. If necessary, you can download your output as a `.gltf`, then adjust the FACS or cage data in your third-party modeling tool.
>
> For issues or feedback regarding Avatar Setup, submit a [bug report](https://devforum.roblox.com/c/bug-reports/10).

## Facial animation detection

One of the primary dynamic head validation checks verifies if your head asset has **visually discernible** animations. To achieve this, the validation tool uses the head cage to "project" [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation#Landmark projection|facial landmarks]] onto your base mesh.

After these landmarks are created, validation [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation#Test face animations|tests various face animation poses]] to ensure that these landmarks move and deform appropriately. Validation succeeds when it detects appropriate movement of the landmarks for eyes closed, mouth open, and basic happy/sad expressions.

Failure to either assign landmarks onto the base mesh, or failure to deform landmarks appropriately can occur for several reasons. For more information, see [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation#Common issues|common issues]].

### Landmark projection

Validation uses the head cage to project landmarks onto the head mesh. This helps Roblox establish where the eyes and mouth are and helps guide the facial animation test.

*(image in the full Top G Vault)*

*Cage mesh: Specific vertices of the cage mark eyes and mouth.*

*(image in the full Top G Vault)*

*Roblox validation projects these points onto the head mesh.*

*(image in the full Top G Vault)*

*Head mesh: All landmarks projected from cage mesh to head mesh.*

> [!success]
> Once validation verifies that projection is successful and all landmarks established onto the head mesh, it can move onto testing facial animations.

### Test face animations

Now that the validation system knows where to check for the eyes and mouth, the validation checks for facial animations to ensure that the following basic actions are possible:

- Left and right eyes can close
- Mouth can open
- Basic happy and sad expressions

> [!info]
> For a full list of the minimum FACS poses your dynamic heads need to pass validation, see [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head specifications#FACS poses|Dynamic head specifications - FACS poses]].

The validation looks for the **relative change in the landmarks**. For example, when testing for right eye closing (FACS pose: `RightEyeClosed`), validation checks if the landmarks move from their original neutral state accordingly.

*(image in the full Top G Vault)*

*Face mesh with all projected landmarks applied from cage.*

*(image in the full Top G Vault)*

*Validation verifies that the right eye can close based off of displacement of landmarks.*

## Common issues

Validation checks for several aspects of your head asset. If you are receiving an error related to dynamic head animation, use the following table for potential culprits:

| Issue | Potential fixes |
| --- | --- |
| The validation tool is **unable to successfully apply landmarks**.<br><br>See [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation#Unable to project landmarks\|Unable to project landmarks]]. | • Verify that the **cage landmark vertices are positioned directly over the corresponding areas of the face**.<br><br>• Verify that the **cage is not intersecting with the head mesh**. Landmark projection expects the cage to be over the head mesh.<br><br>• **Check for any gaps, holes, or difficult surfaces** of the face where landmarks can fail to project. |
| The validation tool is able to apply landmarks, but **can not detect animation**.<br><br>See [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation#Animations not displacing landmarks\|Animations not displacing landmarks]]. | • Verify that **landmarks are on the areas of the eyes and mouth that move during animation**.<br><br>• Verify that the **cage is not intersecting with the head mesh**. Landmark projection expects the cage to be over the head mesh.<br><br>• **If using separate meshes for eyeballs and mouthbags**, ensure that your landmarks are applied to the head mesh, not the eyeballs or mouthbag. This can be achieved by slightly widening the area where your cages project landmarks. |
| The validation tool doesn't detect [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation#Animation data missing\|FACS animations]]. | • Your head doesn't include FACS animation. Verify that your head includes FACS poses and mapping. |

### Unable to project landmarks

If validation is unable to apply the projection correctly onto the surface of the head, the validation fails. This often occurs if your **cage extends beyond your head mesh**, or if your head mesh has a **hole or gap** that prevents the application of the landmark. See the following examples:

*(image in the full Top G Vault)*

*Cage **extends too far beyond the mesh** and the validation is unable to apply 3 landmarks to the base mesh.*

*(image in the full Top G Vault)*

*Base mesh has a **hollow gap** in the design, preventing validation from applying 3 landmarks to denote the eye area.*

> [!success]
> In both cases, adjusting the cage to allow the proper projection of landmarks to the base mesh would resolve this issue.

### Animations not displacing landmarks

In the case where landmarks are correctly applied to the base mesh and the base mesh includes FACS data, it's possible that the facial animations do not displace the landmarks enough to pass validation. See the following example:

*(image in the full Top G Vault)*

*Landmarks successfully established on base mesh, but are not near the expected regions.*

*(image in the full Top G Vault)*

*When testing animations, validation doesn't detect the expected change to the landmark regions.*

> [!success]
> In the example case, adjusting the cage to allow the proper projection of landmarks at the appropriate areas would resolve this issue.

There may also be cases where the landmarks are correct, but the animation itself does not alter the projected landscapes enough to pass validation. In these cases, fixing the animation and/or optimizing the cage could help the validation properly identify the facial animation.

### Animation data missing

Heads require [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head specifications#FACS poses|17 specific FACS poses]] that are used to test the 5 basic actions. Regardless of landmarks or other FACS animations, validation immediately fails if the minimum 17 poses were not detected.

For information on how to pose and map dynamic heads, see [[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads|Create basic dynamic heads]].

## Working with non-humanoids

Some character models, typically non-humanoids, have unnatural or missing eyes and mouths. The most common case of this is the classic blocky features.

In this case, the cage still applies the expected landscapes to the head surface, and Roblox validates if facial animations correctly displace the facial animations.

*(image in the full Top G Vault)*

*The cage for a blocky character applies landmarks to the surface of the head.*

*(image in the full Top G Vault)*

*Ensure that the landmarks are applied in areas where animation can effectively move the landmarks.*

*(image in the full Top G Vault)*

*Validation checks the displacement of the landmarks to verify facial animation. <br><br>Make sure that your [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head specifications#FACS poses|FACS animations]] properly affect the region where landmarks are applied.*

In cases where eyes and mouths might be missing, the validation still projects landmarks and expects facial animation in those areas.

*(image in the full Top G Vault)*

*Although this character doesn't have eyes or mouth, the cage still attempts to project landmarks for those features.*

*(image in the full Top G Vault)*

*In this example, the cage landmarks apply to the surface of this eye-less character head.*

*(image in the full Top G Vault)*

*Validation checks the displacement of the landmarks to verify facial animation. <br><br>Make sure that your [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head specifications#FACS poses|FACS animations]] properly affect the regions where the landmarks are applied.*

---
*Source: [Dynamic head validation](https://create.roblox.com/docs/avatar/dynamic-heads/validate) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
