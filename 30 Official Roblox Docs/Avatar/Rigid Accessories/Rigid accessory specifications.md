---
title: "Rigid accessory specifications"
description: "Rigid accessory specifications lists the specific technical requirements necessary for Studio compatibility."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/rigid-accessories/specifications"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Rigid accessory specifications lists the specific technical requirements necessary for Studio compatibility.*

Rigid accessories require a specific set of components and configuration standards to ensure they are able to attach to character bodies and include optimizations for performance and quality. Because you must apply many of these requirements as you're designing and modeling the rigid accessory in a third-party modeling program like [Blender](https://www.blender.org/) or [Maya](https://www.autodesk.com/products/maya/overview), it's important to review these specifications early and often as you work.

When you're ready to export your rigid accessory, reference all [[30 Official Roblox Docs/Avatar/Rigid Accessories/Export rigid accessories|export setting requirements]] for Blender and Maya.

> [!info] For other types of 3D models:
> - [[30 Official Roblox Docs/Art/Modeling/General specifications|General mesh]] specifications.
> - [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications|Layered accessory]] specifications.

## Geometry and budgets

- **Single Mesh** - Rigid accessories must be a single mesh.
- **Budgets** - Rigid accessories can't exceed **4k** triangles.
- **Watertight** - All geometry must be watertight without exposed holes or backfaces.
- Use **quads** whenever possible. Avoid faces with 5 or more sides.
- **Mesh Size** - Meshes must adhere to maximum size requirements (in studs, centered on attachment point) according to the type of rigid accessory you're designing and the [[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessory specifications#Body scale|body scale]] you're designing the rigid accessory for.

### Body scale

Roblox supports 3 types of character body scales: `Normal`, `Slender`, and `Classic`. When designing a rigid accessory, the size of the accessory cannot exceed the following sizes based on body scale and rigid accessory asset type. A rigid accessory's size is measured based attachment orientation.

When modeling rigid accessories, it's important to use a [[30 Official Roblox Docs/Avatar/Resources#Mannequin models|mannequin]] to help ensure your proportions fit. When using the [[30 Official Roblox Docs/Studio/Importer|Importer]] to import a mannequin:

- Use **Rig Scale** > **Rthro** to import your model as a `Normal` body scale.
- Use **Rig Scale** > **Rthro Narrow** to import your model as a `Slender` body scale.
- Use **Rig Scale** > **Default** to import your model as a `Classic` body scale.

> [!info]
> You can use tools like the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] to help visualize and adjust the scale of your mesh on a mannequin within a visualized boundary before uploading and publishing the asset to the Marketplace. For a demonstration, see [[30 Official Roblox Docs/Avatar/Rigid Accessories/Import rigid accessories#Convert rigid accessories|Convert rigid accessories]].

#### Normal

*(image in the full Top G Vault)*

*A Rthro Normal body scale [[30 Official Roblox Docs/Avatar/Resources#References|downloadable mannequin]] that's roughly 5.75-6.5 studs tall.*

| Asset Type | Width (X) | Height (Y) | Depth (Z) |
| --- | --- | --- | --- |
| Hat | 1.87 | 2.5 | 1.87 |
| Hair | 1.87 | 3.12* <br> (Not centered: 1.25 up, 1.875 down) | 2.18* <br> (Not centered: 0.9375 front, 1.25 behind) |
| Face | 1.87 | 1.25 | 1.25 |
| Eyebrow and Eyelashes | 1.5 | 0.5 | 0.5 |
| Neck | 2.95 | 3.68 | 2.16 |
| Shoulder (attached to NeckAttachment) | 6.90 | 3.68 | 3.24 |
| Shoulder (attached to RightCollarAttachment, LeftCollarAttachment) | 2.95 | 3.68 | 3.24 |
| Shoulder (attached to RightShoulderAttachment, LeftShoulderAttachment) | 2.67 | 4.40 | 3.09 |
| Front | 2.95 | 3.68 | 3.24 |
| Back | 9.86 | 8.59 | 4.87* <br> (Not centered: 1.623 front, 3.246 behind) |
| Waist | 3.94 | 4.29* <br> (Not centered: 1.842 up, 2.457 down) | 7.57 |

#### Slender

*(image in the full Top G Vault)*

*A Rthro Slender (Narrow) body scale [[30 Official Roblox Docs/Avatar/Resources#References|downloadable mannequin]] that's roughly 5.25-6.25 studs tall.*

| Asset Type | Width (X) | Height (Y) | Depth (Z) |
| --- | --- | --- | --- |
| Hat | 1.78 | 2.5 | 1.78 |
| Hair | 1.78 | 3.12* <br> (Not centered: 1.25 up, 1.875 down) | 2.08* <br> (Not centered: 1.892 front, 1.189 behind) |
| Face | 1.78 | 1.25 | 1.18 |
| Eyebrow and Eyelashes | 1.5 | 0.5 | 0.5 |
| Neck | 2.59 | 3.39 | 1.92 |
| Shoulder (attached to NeckAttachment) | 6.05 | 3.39 | 2.88 |
| Shoulder (attached to RightCollarAttachment, LeftCollarAttachment) | 2.59 | 3.39 | 2.88 |
| Shoulder (attached to RightShoulderAttachment, LeftShoulderAttachment) | 2.37 | 3.96 | 2.75 |
| Front | 2.59 | 3.39 | 2.88 |
| Back | 8.64 | 7.91 | 4.32* <br> (Not centered: 1.443 front, 2.886 behind) |
| Waist | 3.76 | 3.29* <br> (Not centered: 1.414 up, 1.885 down) | 6.73 |

#### Classic

*(image in the full Top G Vault)*

*A Classic body scale [[30 Official Roblox Docs/Avatar/Resources#References|downloadable mannequin]] that's roughly 4.75 studs tall.*

| Asset Type | Width (X) | Height (Y) | Depth (Z) |
| --- | --- | --- | --- |
| Hat | 3 | 4 | 3 |
| Hair | 3 | 5* <br> (Not centered: 2 up, 3 down) | 3.5* <br> (Not centered: 1.5 front, 2 behind) |
| Face | 3 | 2 | 2 |
| Eyebrow and Eyelashes | 1.5 | 0.5 | 0.5 |
| Neck | 3 | 3 | 2 |
| Shoulder (attached to NeckAttachment) | 7 | 3 | 3 |
| Shoulder (other) | 3 | 3 | 3 |
| Front | 3 | 3 | 3 |
| Back | 10 | 7 | 4.5* <br> (Not centered: 1.5 front, 3 behind) |
| Waist | 4 | 3.5* <br> (Not centered: 1.5 up, 2 down) | 7 |

### AvatarPartScaleType

Roblox represents body scale in the engine by an `AvatarPartScaleType` [[30 Official Roblox Docs/API Reference/Classes/StringValue|StringValue]] object within each avatar character part and associated accessory. In most cases, asset creators do not need to directly access or modify this value object since tools like the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] automatically generate the appropriate value object on accessory creation.

In cases where you need to identify the current body scale of a body part or accessory, the following table defines the `AvatarPartScaleType` value for each type of body size. When importing your rigid accessory, use the Importer's [[30 Official Roblox Docs/Studio/Importer|Rig Scale]] to automatically apply a scale to your accessory.

| Body Scale | AvatarPartScaleType value |
| --- | --- |
| Classic | `Classic` |
| Normal | `ProportionsNormal` |
| Slender | `ProportionsSlender` |

## Textures

- Rigid accessory textures must meet Roblox's general [[30 Official Roblox Docs/Art/Modeling/Texture specifications|texture specifications]]. High resolution textures are automatically converted to lower-resolution textures to optimize performance.
- Rigid accessory textures for Marketplace assets cannot exceed 2048x2048 resolution.

## Attachment points

[[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects determine where an accessory model attaches to a point on a character body. Whether you are creating rigid or [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories|layered]] accessories, Studio's [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] (AFT) automatically adds and configures the appropriate [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] with the following specifications:

- **One attachment** - Each rigid accessory requires at least one attachment point to its associated body part.
- **Naming convention** - The [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] name must follow a specific naming convention depending on the [[30 Official Roblox Docs/API Reference/Classes/Accessory#AccessoryType|Accessory.AccessoryType]]. The AFT automatically generates an appropriate [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] name.
- **Head placement** - For accessories that attach to the head, such as hats and hair, position the attachment point so it fits on the visible surface of the head mesh. Attachment points that float away from the visible head violate [[30 Official Roblox Docs/Marketplace/Marketplace policy#General creation guidelines|Marketplace policy]].

If setting or configuring attachments manually in Studio, use the following names for your [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] object according to the accessory type:

| Accessory type | Attachment name |
| --- | --- |
| Hat | `HatAttachment` |
| Hair | `HairAttachment` |
| Back | `BodyBackAttachment` |
| Waist | `WaistFrontAttachment`, `WaistCenterAttachment`, `WaistBackAttachment` |
| Shoulder | `RightShoulderAttachment`, `RightCollarAttachment`, `NeckAttachment`, `LeftCollarAttachment`, `LeftShoulderAttachment` |
| Face, Eyelash, Eyebrow | `FaceFrontAttachment`, `FaceCenterAttachment` |
| Neck | `NeckAttachment` |
| Front | `BodyFrontAttachment` |

  > [!warning]
  > Importing attachment objects from a third-party tool is not supported for rigid accessories, but is supported for [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Attachments|character bodies]].

- **Shoulders and Collars** - Even though they are in similar locations, Shoulder and Collar attachment points interact with character body armature rigs differently for rigid accessories.
  - Items using `RightShoulderAttachment` or `LeftShoulderAttachment` move with the character's arm.
  - Items using `RightCollarAttachment` or `LeftCollarAttachment` do not move with the character's arm.

## Marketplace requirements

Rigid accessories must meet the following requirements before you upload them to the Marketplace:

- Ensure that your rigid accessories adhere to [[30 Official Roblox Docs/Marketplace/Marketplace policy|Marketplace policies]].
- Whenever applicable, ensure that your rigid accessories adhere to Roblox's [[30 Official Roblox Docs/Art/Modeling/General specifications|custom mesh specifications]].
- Object [[30 Official Roblox Docs/API Reference/Classes/BasePart#Material|Material]] is set to `Plastic`.
- Object [[30 Official Roblox Docs/API Reference/Classes/BasePart#Transparency|Transparency]] is set to 0.
- Object [[30 Official Roblox Docs/API Reference/Classes/MeshPart|VertexColor]] is the default `1, 1, 1`.
- Your [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] object does not contain extraneous objects, like [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] or additional [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] objects.

---
*Source: [Rigid accessory specifications](https://create.roblox.com/docs/avatar/rigid-accessories/specifications) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
