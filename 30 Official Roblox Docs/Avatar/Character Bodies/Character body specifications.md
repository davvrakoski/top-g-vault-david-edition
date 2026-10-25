---
title: "Character body specifications"
description: "Character body specification lists the specific technical requirements for Studio compatibility."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/character-bodies/specifications"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Character body specification lists the specific technical requirements for Studio compatibility.*

Character body models require a specific set of components and configuration standards to ensure all avatar features work as expected across the platform. Before you start the export process, verify that your model meets the following modeling specifications and guidelines for proper Studio compatibility.

When you're ready to export your character body, reference all [[30 Official Roblox Docs/Avatar/Character Bodies/Export character bodies|export setting requirements]] for Blender and Maya.

> [!info] For other types of 3D models:
> - [[30 Official Roblox Docs/Art/Modeling/General specifications|General mesh]] specifications.
> - [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications|Rigid accessory]] specifications.
> - [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|Layered accessory]] specifications.

## Geometry

Character body models for avatars are made up of 15 separate mesh objects and require additional geometry requirements to import into Studio and publish successfully. In addition to [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Body scale|body scale types]], [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Body parts|body parts]], and [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Triangle budgets|triangle budget]] specifications, ensure that your models also fulfill the following general requirements when modeling your character's body:

- **Watertight** - All geometry must be watertight without exposed holes or backfaces. Meshes used as outer cages do not need to be watertight.
- **No N-gons** - Model your assets in quads where possible.
- **Transformations** - All translation, rotation, and scale values must be frozen and pivots set to `0`, `0`, `0`.
- **Orientation** - Characters must face positive Z and stand up in positive Y.
- **Pose** - Before exporting, set your character to an I-Pose, A-Pose, or T-Pose when possible.

### Body scale

Roblox supports three standards of character body scales: **Normal**, **Slender**, and **Classic**. These standards allow developers to create games and spaces with consistent body sizes for standardizing movement and interactions. You can select a body scale on import using [[30 Official Roblox Docs/Studio/Importer#Rig general|Rig Scale options]], or modify the [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications#AvatarPartScaleType|body scale manually]]. Body scale persists when the asset is [[30 Official Roblox Docs/Marketplace/Publish to Marketplace#Upload an asset|uploaded to the Marketplace]].

*(image in the full Top G Vault)*

*A visualization of how Roblox combines the 15 body parts into 6 distinct assets.*

> [!warning]
> Since body assets partially overlap with each other, the total body dimensions do not represent the sum of the avatar's asset dimensions. The total body dimension is the most important factor for ensuring a standard avatar size and scale.

The same bounding box limits apply to Normal, Slender, and Classic body scales. During validation, Roblox rotates each limb to a standard orientation. The validator measures the length of the rotated part and calculates its width and depth from the part's cross section.

#### Bounding box limits

*Minimum (in studs)*

| Part | Width | Length | Depth |
| --- | --- | --- | --- |
| Head | 0.05 | 0.5 | 0.05 |
| Arm | 0.05 | 0.5 | 0.05 |
| Torso | 0.05 | 0.65 | 0.05 |
| Leg | 0.05 | 0.5 | 0.05 |
| **Total** | **1.0** | **4.0** | **0.5** |

*Maximum (in studs)*

| Part | Width | Length | Depth |
| --- | --- | --- | --- |
| Head | 4.0 | 2.0 | 4.0 |
| Arm | 4.0 | 4.5 | 4.0 |
| Torso | 4.0 | 4.0 | 4.0 |
| Leg | 4.0 | 4.5 | 4.0 |
| **Total** | **8.0** | **10.0** | **4.0** |

*(image in the full Top G Vault)*

***Normal**<br><br>An Rthro Normal body scale [[30 Official Roblox Docs/Avatar/Resources#References|downloadable mannequin]].<br><br>In the [[30 Official Roblox Docs/Studio/Importer|Importer]], use **Rig Type** > **Rthro** to import your model as a Normal body scale.*

*(image in the full Top G Vault)*

***Slender**<br><br>An Rthro Slender (Narrow) body scale [[30 Official Roblox Docs/Avatar/Resources#References|downloadable mannequin]].<br><br>In the [[30 Official Roblox Docs/Studio/Importer|Importer]], use **Rig Type** > **Rthro Narrow** to import your model as a Slender body scale.*

*(image in the full Top G Vault)*

***Classic**<br><br>A Classic body scale [[30 Official Roblox Docs/Avatar/Resources#References|downloadable mannequin]].<br><br>In the [[30 Official Roblox Docs/Studio/Importer|Importer]], use **Rig Type** > **Default** to import your model as a Classic body scale.*

### Triangle budgets

Although character body model geometries are typically created using quads, the Roblox Engine converts imported assets into tris. Each asset of your character model must not exceed our maximum tri budget. To quickly get the number of expected tris in your third-party modeling application, you can double the number of quads in your model.

> [!info]
> When character body models are uploaded to Studio and created into assets for the Marketplace, the body is split into 6 individual assets: **DynamicHead**, **Torso**, **LeftArm**, **RightArm**, **LeftLeg**, **RightLeg**.

| Asset type | Included mesh objects | Maximum triangles |
| --- | --- | --- |
| DynamicHead | Head | 4000 |
| Torso | UpperTorso, LowerTorso | 1750 |
| LeftArm | LeftUpperArm, LeftLowerArm, LeftHand | 1248 |
| Right Arm | RightUpperArm, RightLowerArm, RightHand | 1248 |
| LeftLeg | LeftUpperLeg, LeftLowerLeg, LeftFoot | 1248 |
| Right Leg | RightUpperLeg, RightLowerLeg, RightFoot | 1248 |
| Total | Head, UpperTorso, LowerTorso, LeftUpperArm, LeftLowerArm, LeftHand, RightUpperArm, RightLowerArm, RightHand, LeftUpperLeg, LeftLowerLeg, LeftFoot, RightUpperLeg, RightLowerLeg, RightFoot | 10,742 |

### Body parts

See the following specifications for the individual mesh objects that make up a character body model:

- **Naming Convention** - Limbs must all be specifically named:
  - UpperTorso_Geo
  - LowerTorso_Geo
  - LeftUpperArm_Geo
  - LeftLowerArm_Geo
  - LeftHand_Geo
  - RightUpperArm_Geo
  - RightLowerArm_Geo
  - RightHand_Geo
  - LeftUpperLeg_Geo
  - LeftLowerLeg_Geo
  - LeftFoot_Geo
  - RightUpperLeg_Geo
  - RightLowerLeg_Geo
  - RightFoot_Geo
  - Head_Geo
- **Caps** - Limbs must be capped, so that they form a full watertight mesh when separated from the body. Caps can be rounded or flat depending on design.

   *(image in the full Top G Vault)*

> [!info] Interested in creating a higher-fidelity avatar?
> Higher-fidelity character body models require the same 15 mesh objects and naming structure. The only difference is that the mesh objects in higher-fidelity character body models can have [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Advanced R15 rigs|additional internal joints]] in their rigging armatures. When these joints are present in a character body model, their corresponding mesh objects need to be [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Skinning|skinned]] for accurate deformation.

### Face accessories

Face accessories, such as eyebrows and eyelashes, are unique layered accessories that you can bundle with an avatar character body upload. Eyebrows and eyelashes cannot be uploaded as standalone accessories and must be bundled either with a character body or [[30 Official Roblox Docs/Avatar/Makeup/Makeup specifications|makeup assets]]. For more information on face accessories, see [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications#Face accessories|Layered accessory specifications - Face accessories]].

### Visibility

To ensure that avatar sizes are visually consistent, you must standardize body part visibility with the following requirements:

- **Opacity** - Body parts must be fully opaque.
- **Bounding Boxes** - Body part assets must take up a significant visible portion of their bounding box in a front, side, and back view.
  - Body parts, such as Torso, Left Arm, Right Leg, must take up at least 50% of body part's bounding box.
  - The head part must take up at least 50% of the mesh's bounding box.

    *(image in the full Top G Vault)*

    *An acceptable head mesh example that takes up a majority of the bounding box in the front view*

    *(image in the full Top G Vault)*

    *A non-acceptable head mesh example that does not take up the appropriate amount of bounding box space in the front view*

## Attachments

Attachments are points that determine the specific location where accessories and in-game equippable objects attach to the character's body. Like many [[30 Official Roblox Docs/Avatar/Character Bodies/Character bodies#Character body components|character components]], attachment points are set up in third-party modeling software and imported as [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects.

The Importer automatically recognizes and converts mesh objects as attachment points if the objects include the affix `\_Att` and follow the naming conventions below. This only applies when importing meshes with caging data, such as bodies (accessory attachment points are created using the Accessory Fitting Tool). Check out examples of this implementation in any of Roblox's [[30 Official Roblox Docs/Avatar/Resources#References|downloadable reference models]].

Generally, when placing attachment points, position them so they overlap halfway with the character model's mesh part.

*(image in the full Top G Vault)*

*Incorrect placement of collar attachments*

*(image in the full Top G Vault)*

*Correct placement of collar attachments*

For accessories that attach to the head, position the attachment point so it fits on the visible surface of the head mesh. Attachment points that float away from the visible head violate [[30 Official Roblox Docs/Marketplace/Marketplace policy#General creation guidelines|Marketplace policy]].

*(image in the full Top G Vault)*

*Correct placement of head attachments*

*(image in the full Top G Vault)*

*Incorrect placement of head attachments*

Attachments must follow a specific naming convention and positional consistency:

| Mesh part | Attachment name | Details |
| --- | --- | --- |
| Head | FaceCenter_Att | Anywhere within mesh bounding box |
| FaceFront_Att | Front half of mesh bounding box |  |
| Hat_Att | Top half of mesh bounding box, can overlap with Hair_Att |  |
| Hair_Att | Top half of mesh bounding box, can overlap with Hat_Att |  |
| UpperTorso | LeftCollar_Att | Left top half of mesh bounding box |
| RightCollar_Att | Right top half of mesh bounding box |  |
| Neck_Att | Top half of mesh bounding box |  |
| BodyBack_Att | Back half of mesh bounding box |  |
| BodyFront_Att | Front half of mesh bounding box |  |
| LowerTorso | Root_Att | Must set to `0`, `0`, `0` position |
| WaistFront_Att | Front half of mesh bounding box, can overlap with WaistCenter_Att |  |
| WaistBack_Att | Back half of mesh bounding box |  |
| WaistCenter_Att | Anywhere in mesh bounding box, can overlap with WaistFront_Att |  |
| RightUpperArm | RightShoulder_Att | Top half of mesh bounding box |
| RightHand | RightGrip_Att | Anywhere in mesh bounding box. <br><br>Orient grip attachments **perpendicular** to the lower arm bone. For example, for I-Pose (arms pointing down), set the grip attachment to `90`, `0`, `0` (grip attachment pointing forward).<br><br>*(image in the full Top G Vault)* |
| LeftUpperArm | LeftShoulder_Att | Top half of mesh bounding box |
| LeftHand | LeftGrip_Att | Anywhere in mesh bounding box. <br><br>Orient grip attachments **perpendicular** to the lower arm bone. For example, for I-Pose (arms pointing down), set the grip attachment to `90`, `0`, `0` (grip attachment pointing forward).<br><br>*(image in the full Top G Vault)* |
| RightFoot | RightFoot_Att | Anywhere in mesh bounding box |
| LeftFoot | LeftFoot_Att | Anywhere in mesh bounding box |

## Rigging

Unlike generic rigs, humanoid models require a specific hierarchy and naming conventions for the internal bone or joint structure.

*(image in the full Top G Vault)*

*Humanoid rig model*

*(image in the full Top G Vault)*

*Humanoid rig bone structure (Blender)*

### Standard R15 rigs

The following requirements are for **standard R15** rigs.

- **Rig Hierarchy** - Humanoid rigs require a specific bone or joint hierarchy and naming convention:
  - Root
    - HumanoidRootNode
      - LowerTorso
        - UpperTorso
          - Head (representing the base of the neck)
          - LeftUpperArm
            - LeftLowerArm
              - LeftHand
          - RightUpperArm
            - RightLowerArm
              - RightHand
        - LeftUpperLeg
          - LeftLowerLeg
            - LeftFoot
        - RightUpperLeg
          - RightLowerLeg
            - RightFoot

> [!note]- **Blender standard humanoid rig hierarchy with all bones**
> *(image in the full Top G Vault)*

> [!note]- **Maya standard humanoid rig hierarchy with all joints**
> *(image in the full Top G Vault)*

- **LowerTorso and Root** - The LowerTorso and Root bone or joint position must be set to `0`, `0`, `0`.
- **Pose** - Export your character model in an I-Pose, A-Pose, or T-Pose for the best Studio compatibility. The LeftUpperArm and RightUpperArm bones can be exported with rotation values to meet this requirement.

### Advanced R15 rigs

**Advanced R15** rigs have the same requirements as standard rigs, but they support up to 37 additional optional bones or joints for a higher level of realism with articulated hands, shoulders, and spine movements.

You do not need to include every optional bone or joint for an advanced R15 rig, but each optional bone or joint you include must follow a specific hierarchy and naming convention for the respective body part.

#### Torso

| Hierarchy | Example Rig Setup |
| --- | --- |
| • UpperTorso• Spine• Chest• Head• HeadBase<br><br>• RightClavicle• RightUpperArm<br><br>• LeftClavicle• LeftUpperArm | *(image in the full Top G Vault)* |

#### LeftHand

| Hierarchy | Example Rig Setup |
| --- | --- |
| • LeftHand• LeftHandThumb1• LeftHandThumb2• LeftHandThumb3<br><br><br>• LeftHandIndex1• LeftHandIndex2• LeftHandIndex3<br><br><br>• LeftHandMiddle1• LeftHandMiddle2• LeftHandMiddle3<br><br><br>• LeftHandRing1• LeftHandRing2• LeftHandRing3<br><br><br>• LeftHandPinky1• LeftHandPinky2• LeftHandPinky3 | *(image in the full Top G Vault)* |

#### RightHand

| Hierarchy | Example Rig Setup |
| --- | --- |
| • RightHand• RightHandThumb1• RightHandThumb2• RightHandThumb3<br><br><br>• RightHandIndex1• RightHandIndex2• RightHandIndex3<br><br><br>• RightHandMiddle1• RightHandMiddle2• RightHandMiddle3<br><br><br>• RightHandRing1• RightHandRing2• RightHandRing3<br><br><br>• RightHandPinky1• RightHandPinky2• RightHandPinky3 | *(image in the full Top G Vault)* |

#### LeftFoot

| Hierarchy | Example Rig Setup |
| --- | --- |
| • LeftFoot• LeftToeBase | *(image in the full Top G Vault)* |

#### RightFoot

| Hierarchy | Example Rig Setup |
| --- | --- |
| • RightFoot• RightToeBase | *(image in the full Top G Vault)* |

> [!note]- **Blender humanoid rig hierarchy with all optional bones**
> *(image in the full Top G Vault)*

> [!note]- **Maya humanoid rig hierarchy with all optional joints**
> *(image in the full Top G Vault)*

<br>

> [!info]
> Make sure that you skin each additional bone or joint's corresponding mesh object for accurate deformation.

After you [[30 Official Roblox Docs/Avatar/Character Bodies/Import character bodies|import an advanced R15 character rig]] into Studio, you **must** insert [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription|HumanoidRigDescription]] and/or [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription|DigitsRigDescription]] objects into your rig to be able to sell your character on the Marketplace, and for your animations to work properly:

- [[30 Official Roblox Docs/API Reference/Classes/HumanoidRigDescription|HumanoidRigDescription]] objects are necessary for animating individual body parts and adjusting behavioral characteristics of the rig, such as each bone or joint's size and range of motion.
- [[30 Official Roblox Docs/API Reference/Classes/DigitsRigDescription|DigitsRigDescription]] objects are necessary for hand articulation. Your character needs one for each hand with optional bone or joints.

Both of these object types detect bones or joints by their naming conventions, so it is very important to ensure every optional bone or joint is named correctly following the table above **before** you import your character rig into Studio. For a set of advanced R15 rigs that you can reference, see [[30 Official Roblox Docs/Avatar/Resources#Advanced R15 rigs|Resources - Advanced R15 rigs]].

## Skinning

Roblox supports skinning for rigged meshes. For more details on implementing skinned meshes in Studio, see [[30 Official Roblox Docs/Art/Modeling/Rigging and skinning|Rigging and Skinning]].

The following requirements are for skinning character bodies:

- **Max Influences** - A vertex can not be influenced by more than 4 bones or joints.
- **No Root Influences** - Do not apply influences to the Root bone or joint.
- **Symmetry** - When possible, maintain symmetry when applying influences to a rig.

## Facial animation

For information on required facial animation support, see [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head specifications#FACS poses|head specifications]].

## Textures

- Textures for Marketplace assets can't exceed 2048x2048 resolution.
- Textures created for accessories must meet Roblox's [[30 Official Roblox Docs/Art/Modeling/Texture specifications|texture specifications]]. High resolution textures are automatically converted to lower-resolution textures to optimize performance.
- Avatar characters must follow Roblox's [[30 Official Roblox Docs/Art/Modeling/Texture specifications|texture specifications]]. Characters created for the Marketplace can take advantage of [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Custom skin tone|custom skin tones]], which use alpha layers to allow users to select their own base color.

### Custom skin tone

When texturing an avatar character body model where the user can set their own skin tone, set the exposed skin areas as transparent so a default color or texture is not baked into the texture. When rendering, Studio applies the transparent layer on top without any layer effects. This step applies mostly to human-like characters with exposed skin that you intend users to customize.

The following are examples of skin tone shading for the face, and you can apply this process with any part of an avatar with exposed skin:

*(image in the full Top G Vault)*

- Use 100% opacity for areas not related to a customized skin tone, such as eyes and brows.
- When applying shading, use black at low opacity and adjust opacity when needed.
- For areas that are partially translucent, such as shading contours or certain cosmetic features, leave some transparency for partial visibility of the skin tone.
- You should consistently test out how various colors layers can interact with your shading.

*(image in the full Top G Vault)*

*Beige*

*(image in the full Top G Vault)*

*Blue*

*(image in the full Top G Vault)*

*Brown*

*(image in the full Top G Vault)*

*Pink*

## Outer cages

Outer cages on your character model allow your character to wear layered accessories, such as shirts and jackets that stretch and wrap around the body. Review the following list for requirements on adding outer cage meshes to your character body model:

- Use Roblox's [[30 Official Roblox Docs/Avatar Setup/Avatar Setup|Avatar Setup]] or Roblox's [[30 Official Roblox Docs/Avatar/Resources#Project files|body cage templates]] to ensure naming conventions and other configurations are correct.
- **Naming Conventions** - The outer cage of a body part must be named after the primary mesh object with **\_OuterCage** affixed, for example `LeftUpperArm_OuterCage`.
- **Vertices and UV Map** - Don't delete vertices or alter the UVs on outer cages as this can cause errors when importing in Studio or when equipping onto a character. Use Roblox's provided templates for cage meshes to ensure compatibility with other layered assets.
- **Symmetry and consistency** - Keep each face of your geometry consistently sized and retain symmetry wherever possible by using symmetry tools in your modeling software.
- For information on dynamic head cages and best practices when caging, see [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head specifications#Outer cage|Dynamic head specifications]].

> [!info]
> Character bodies only require an outer cage, but layered accessories require both an inner and outer cage to deform properly. For more information, see [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications#Cage meshes|Layered accessory specifications - Cage meshes]].

## Marketplace requirements

Along with the other technical requirements listed, your items must meet the following additional specifications before uploading them to the Marketplace to sell:

- Ensure that your character bodies adhere to [[30 Official Roblox Docs/Marketplace/Marketplace policy|Marketplace policies]].
- Whenever applicable, ensure that your character bodies adhere to Roblox's [[30 Official Roblox Docs/Art/Modeling/General specifications|custom mesh specifications]].
- Object [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]] is set to `Plastic`.
- Object [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|Transparency]] is set to `0`.
- Object [[30 Official Roblox Docs/API Reference/Classes/MeshPart|VertexColor]] is the default `1, 1, 1`.
- If your character's head includes separate eyelash and eyebrow assets, you must add them to your character body model as [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] objects. For more information, see [[30 Official Roblox Docs/Art/Accessories/Publish bodies with eyelashes and eyebrows|Publish bodies with eyelashes and eyebrows]].
- Your [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] instance doesn't contain extraneous objects, like [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or additional [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] instances.

---
*Source: [Character body specifications](https://create.roblox.com/docs/avatar/character-bodies/specifications) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
