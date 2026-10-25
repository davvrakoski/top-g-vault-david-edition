---
title: "Layered accessory specifications"
description: "Layered accessory specifications lists the specific technical requirements necessary for Studio compatibility."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/layered-accessories/specifications"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Layered accessory specifications lists the specific technical requirements necessary for Studio compatibility.*

Layered accessories require a specific set of components and configuration standards to ensure they are able to stretch and fit on character bodies and include optimizations for performance and quality. Because you must apply many of these requirements as you're designing and modeling the layered accessory in a third-party modeling program like [Blender](https://www.blender.org/) or [Maya](https://www.autodesk.com/products/maya/overview), it's important to review these specifications early and often as you work.

When you're ready to export your layered accessory, reference all [[30 Official Roblox Docs/Avatar/Layered Accessories/Export layered accessories|export setting requirements]] for Blender and Maya.

> [!info] For other types of 3D models:
> - [[30 Official Roblox Docs/Art/Modeling/General specifications|General mesh]] specifications.
> - [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications|Rigid accessory]] specifications.

## Geometry and budgets

- **Single Mesh** - Layered accessories must be a single mesh.
- **Budgets** - Layered accessories can't exceed **4k** triangles.
- **Watertight** - All geometry must be watertight without exposed holes or backfaces.
- Use **quads** whenever possible. Avoid faces with 5 or more sides.
- **Mesh Size** - Meshes must adhere to the following maximum size requirements (in studs, centered on attachment point) according to the type of layered accessory you're designing.

| Asset Type | Width (X) | Height (Y) | Depth (Z) |
| --- | --- | --- | --- |
| T-Shirt, Shirt, Sweater, Jacket, Pants, Shorts, Dress &amp; Skirt | 8 | 8 | 8 |
| Eyebrow and Eyelashes | 1.5 | 0.5 | 0.5 |

## Textures

- Layered accessory textures must meet Roblox's general [[30 Official Roblox Docs/Art/Modeling/Texture specifications|texture specifications]]. High resolution textures are automatically converted to lower-resolution textures to optimize performance.
- Layered accessory textures for Marketplace assets cannot exceed 2048x2048 resolution.

## Attachment points

[[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects for layered accessories set which body part the accessory is attached to when the character body ragdolls or dismembers in a game. Whether you are creating [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories|rigid]] or layered accessories, Studio's [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] (AFT) automatically adds and configures the appropriate [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] with the following specifications:

- **One attachment** - Each layered accessory requires at least one attachment point to its associated body part.
- **Naming convention** - The [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] name must follow a specific naming convention depending on the [[30 Official Roblox Docs/API Reference/Classes/Accessory#AccessoryType|Accessory.AccessoryType]]. The AFT automatically generates an appropriate [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] name.

If setting or configuring attachments manually in Studio, use the following names for your [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] object according to the accessory type:

| Accessory Type | Attachment Name |
| --- | --- |
| Hat | `HatAttachment` |
| Back | `BodyBackAttachment` |
| Waist | `WaistFrontAttachment`, `WaistCenterAttachment`, `WaistBackAttachment` |
| Shoulder | `RightShoulderAttachment`, `RightCollarAttachment`, `NeckAttachment`, `LeftCollarAttachment`, `LeftShoulderAttachment` |
| Face, Eyelash, Eyebrow | `FaceFrontAttachment`, `FaceCenterAttachment` |
| Neck | `NeckAttachment` |
| Front | `BodyFrontAttachment` |
| Layered tops (Shirt, TShirt, Sweater, Jacket) | `BodyFrontAttachment` |
| Layered bottoms (Pants, Shorts, DressSkirt) | `WaistCenterAttachment` |

  > [!info]
  > The Importer automatically recognizes mesh objects as attachment points if the objects include the affix `\_Att`. This only applies when importing meshes with caging data, such as layered accessories or character bodies.

## Face accessories

Face accessories, such as eyebrows and eyelashes, are unique layered accessories that you can bundle with an avatar body upload. Eyebrows and eyelashes cannot be uploaded as standalone accessories and must be bundled either with a [[30 Official Roblox Docs/Avatar/Character Bodies/Character bodies|character body]] or [[30 Official Roblox Docs/Avatar/Makeup/Makeup specifications|makeup assets]]. For more information on bundling your face accessories with avatar models, see [[30 Official Roblox Docs/Art/Accessories/Publish bodies with eyelashes and eyebrows|Publish bodies with eyelashes and eyebrows]].

- **Naming Convention when bundled** - When including these assets with an avatar body upload, the layered accessory objects must use the following name conventions:
  - `EyebrowAccessory`
  - `EyelashAccessory`
  - `HairAccessory`

## Layerable properties

Layered accessories require additional configuration in a 3D modeling software, such as [Blender](https://www.blender.org) or [Maya](https://www.autodesk.com/products/maya/overview). To achieve the layering effect, your layered accessories must meet the following requirements:

- Layered accessories must be [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications#Rigging and skinning|weighted and bound]] to a [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging|R15 rigging armature]].
- Layered accessories must contain an [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications#Inner cage|inner mesh cage]] and an [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications#Outer cage|outer mesh cage]].
- Layered accessories must continue to follow any applicable [[30 Official Roblox Docs/Art/Modeling/General specifications|custom mesh requirements]], such as best practices on watertightness, textures, and polycount budgets.

See [[30 Official Roblox Docs/Art/Accessories/Creating/Create your first layered accessory|Create your first layered accessory]] for a step-by-step tutorial on applying these requirements to a reference asset in Blender. Once the `.fbx` file is [[30 Official Roblox Docs/Avatar/Layered Accessories/Export layered accessories|exported]], see [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] for instructions on converting your model into an [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] object.

### Rigging and skinning

Rigging and skinning layered accessories allows them to move and deform naturally with character bodies as they move in the 3D space. You can rig and skin your layered accessories manually using third-party 3D modeling tooling, or [[30 Official Roblox Docs/Avatar/Automatic Skinning Transfer|use automatic skinning transfer]] to generate an accessory's skinning data at runtime.

When you use third-party 3D modeling tooling to skin your accessories, keep in mind that **Joint Influences** (Maya) or **Bone Assignments** (Blender) per vertex should be limited to **4**.

For more information on basic skinning in a third-party 3D modeling software, such as Blender's [Automatic Weights](https://docs.blender.org/manual/en/latest/animation/armatures/skinning/parenting.html#with-automatic-weights), see the [[30 Official Roblox Docs/Art/Modeling/Skin a simple mesh|Skin a simple mesh]] tutorial for instructions on rigging, applying weights, and skinning a basic mesh.

### Cage meshes

**Cage meshes**, or **cages**, are non-rendered meshes that define the inner and outer surfaces of a layered accessory, and they are fundamental to the layerable properties. For a basic overview on caging, see [[30 Official Roblox Docs/Art/Accessories/Creating/Caging setup|Create your first layered accessory - Caging setup]] and the relevant section of the tutorial video at [8:32](https://www.youtube.com/watch?v=C-DwGRBHvmE&t=512s):

![](https://www.youtube.com/watch?v=C-DwGRBHvmE)

Roblox provides template cages meshes in [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory reference files|layered accessory project files]] for you to use as you create your own custom layered accessories. Note that the outer cage is identical to the inner cage by default and must be the only cage adjusted to fit over your custom layered accessory. As a best practice, the shape of the inner and outer cage should match each other before editing the outer cage to completely cover your asset.

> [!warning]
> The vertexes and UVs of the inner and outer cage meshes should not be deleted or removed, as they are used to match coordinates between other cages.

> [!danger]
> Layered accessories with invalid cage configurations can fail validation and are subject to moderation. For examples and instructions on how to fix caging issues, see [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory caging best practices|Caging best practices]].

#### Inner cage

The inner cage is a mesh that defines the inner surface of your accessory model and how your layered accessory stretches and fits over a character body. The inner cage mesh object must have the same name as the accessory model appended with **\_InnerCage**.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

#### Outer cage

The outer cage is a mesh that defines the outer surface of your accessory model and how other layered accessories can stretch and fit over your layered accessory. The outer cage mesh object must have the same name as the accessory model appended with **\_OuterCage**.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

> [!info]
> Avatar [[30 Official Roblox Docs/Avatar/Character Bodies/Character bodies|character bodies]] must include an outer cage in order to be compatible with layered accessories. All character bodies on the [Marketplace](https://www.roblox.com/catalog) include a properly configured outer cage and are compatible with layered accessories.

## Marketplace requirements

Layered accessories must meet the following requirements before you upload them to the Marketplace:

- Ensure that your layered accessories adhere to [[30 Official Roblox Docs/Marketplace/Marketplace policy|Marketplace policies]].
- Whenever applicable, ensure that your layered accessories adhere to Roblox's [[30 Official Roblox Docs/Art/Modeling/General specifications|custom mesh specifications]].
- Object [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]] is set to `Plastic`.
- Object [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|Transparency]] is set to 0.
- Object [[30 Official Roblox Docs/API Reference/Classes/MeshPart|VertexColor]] is the default `1, 1, 1`.
- Your [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] object does not contain extraneous objects, like [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or additional [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] objects.

---
*Source: [Layered accessory specifications](https://create.roblox.com/docs/avatar/layered-accessories/specifications) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
