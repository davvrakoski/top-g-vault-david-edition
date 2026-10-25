---
title: "Layered accessory caging best practices"
description: "In-depth description and images of various caging best practices for layered accessories."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/layered-accessories/caging-best-practices"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*In-depth description and images of various caging best practices for layered accessories.*

![](https://www.youtube.com/watch?v=QwZaA9Gc-WQ)

Caging is a complex process required to define the inner and outer surface of a layered accessory. Properly caged assets allow your layered accessories to stretch and layer in combination with each other. Cages that are improperly configured can lead to cosmetic issues with the look and feel of your layered accessory.

*(image in the full Top G Vault)*

*A properly configured cage typically includes a tight layering of the inner cage, clothing mesh, and the outer cage.*

*(image in the full Top G Vault)*

*The t-shirt stretches and fits naturally over a base body.*

*(image in the full Top G Vault)*

*Other layered accessories, such as a jacket, should stretch and fit naturally over a target body and any other caged assets.*

In extreme cases, improper cages may interfere with gameplay or social elements on Roblox. If your asset includes improper cages, Roblox may prevent you from uploading them to the Marketplace and may remove existing assets with improper cages from the catalog.

> [!warning]
> Roblox is enforcing a stricter set of validation rules to improve the overall quality of layered accessories in the Marketplace.

The following [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory caging best practices#Best practices|best practices]] and [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory caging best practices#Common issues|common issues]] are useful for avatar asset creators of all levels and can elevate the quality of your layered accessory creations and save time with troubleshooting.

## Best practices

Always start any caging work with one of Roblox's [provided caging templates](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/meshes/reference-files/Clothing_Cage_Templates.zip). These templates include an inner cage and outer cage with properly set UVs.

> [!danger]
> You should not edit the cage UVs since this will introduce visual artifacts.

When caging your layered accessories, use these important universal guidelines:

- Any clothing mesh positioned between the inner cage and outer cage will be deformed by the layering system. This is the typical configuration for nearly all layered accessory assets.

  *(image in the full Top G Vault)*

  *The t-shirt mesh fits snugly between the inner and outer cage.*

  *(image in the full Top G Vault)*

  *The correctly configured t-shirt naturally stretches over a target body.*

  *(image in the full Top G Vault)*

  *Other layered accessory assets should stretch and fit naturally over a target body and any equipped caged assets.*

- You must follow the [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory specifications#Cage meshes|naming conventions]] for the layered accessory geometry and the cage.
- Many caging issues start from incorrect outer cage setup. See [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory caging best practices#Working with outer cages|working with outer cages]] for specific details.
- Do not modify areas of your cage that are unrelated to the layered accessory you are caging. For example, do not modify the inner or outer cages of the lower leg areas when caging a t-shirt.
- Review any specific best practices for [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory caging best practices#Caging form-fitting clothing|form-fitting clothes]], [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory caging best practices#Caging bulky clothing|bulky clothes]], and [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory caging best practices#Caging protrusions|clothing with protrusions]].
- If troubleshooting any issues, review [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory caging best practices#Common issues|common issues]] to help identify problematic layered accessories or specific validation errors.

### Working with outer cages

As long as the clothing mesh properly fits **over the inner cage** and **under the outer cage**, you can edit the outer cage in various ways depending on the final visual effect you intend to achieve.

When working with the outer cage, use the following guidelines when possible:

- Move vertices outwards in the normal's direction.
  *(image in the full Top G Vault)*
- Keep the outer cage as close to the clothing mesh as possible.
- Work symmetrically as much as possible to save time.
- Do not alter the UVs in any way.
- Do not stack your vertices.

   *(image in the full Top G Vault)*

   *Two vertices stacked directly over each other. This will introduce visual artifacts when layering other layered accessories on top.*

- Keep the vertex, edge, and face count exactly the same as when you started.
- Keep your cage's edge spacing as evenly as possible.

    *(image in the full Top G Vault)*

  *Outer cage with even spacing whenever possible on the faces.*

    *(image in the full Top G Vault)*

  *Outer cage with uneven spacing throughout the torso area. Uneven cages can create visual artifacts and uneven deformations.*

- Keep your cage's break lines between body parts lined up to the joint's position as possible. For example, try to align the elbow to where the LowerArm joint is located.

  *(image in the full Top G Vault)*

  *Proportional changes can help improve animation and posing quality.*

### Caging form-fitting clothing

Form-fitting clothing, like t-shirts, yoga pants, shorts, sweaters and slim jackets, are the most common type of layered accessory.

In this case, the outer cage needs to completely envelop the layered accessory with minimal gaps between inner cage, clothing mesh, and outer cage.

- Move outer cage vertices outwards to completely cover the layered accessory, while maintaining the silhouette of the clothing mesh as much as possible.
- Do not move outer cage vertices that don't contribute to covering the layered accessory. For example, don't move outer cage vertices in the lower leg when the layered accessory is a t-shirt.
- The entire layered accessory should be located in-between the outer and inner cages.

### Caging bulky clothing

Bulky clothing, like puffy jackets, sweat pants, and hoodies, require additional displacement of the outer cage vertices to envelop the bulky asset. The outer cage should still completely wrap the external surface of a bulky item.

- Pay special attention to the direction neighboring outer cage vertices are moved.
- Move along vertex normal directions as much as possible.
- Move vertices nearby each other more or less along the same directions (smooth relative displacements).
- Avoid moving vertices that are not covered by the layered accessory, such as moving vertices in the arm region if you are making pants.

### Caging protrusions

Some clothing items have assets that protrude or extend past the rest of the clothing. Examples include clothing with puffy hoods, shoulder pads, and spikes.

*(image in the full Top G Vault)*

*Like all layered accessories, clothing with protrusions should fit over inner cages.*

*(image in the full Top G Vault)*

*Setting the outer cage below the puffy hood allows the hood to be visible even when equipping other layered accessories.*

*(image in the full Top G Vault)*

*Setting the outer cage above the puffy hood causes additional layered accessories to stretch and cover the protrusion which is often undesired.*

To ensure that the protruded region stays visible independent of the number of layers:

- Leave the protruded region outside the outer cage. Alternatively, edit the outer cage to pass under the regions that are meant to be visible and undeformed.
- Avoid moving vertices that are not covered by the layered accessory.

## Common issues

Improper caging can cause various rendering and deformation issues. The following common examples can help diagnose and troubleshoot any caging issues you may encounter.

### Uneven caging

Unexpected outer cage shapes cause issues when other layered accessories are equipped. While the layered accessory may fit correctly on a target body, any additional layers will fail to stretch and deform appropriately.

*(image in the full Top G Vault)*

*The outer cage of the black shirt is set up with uneven vertices producing an undulated caging surface.*

*(image in the full Top G Vault)*

*Any layered accessory fit on top will have visual artifacts even if the layered accessory itself looks fine.*

### Identical inner and outer cage

If the inner cage and outer cage are exactly the same, the layered accessory system cannot properly determine the accessory and may not deform or deform unexpectedly.

*(image in the full Top G Vault)*

*An example of an identical inner and outer cages.*

*(image in the full Top G Vault)*

*The tshirt deforms in an unexpected manner and fails to render in its original shape or placement.*

### Clothing inside inner cage

Any part of the clothing mesh positioned **inside** the **inner cage** will introduce visual artifacts when the layered accessory is layered on top of other clothing. You should always avoid this type of configuration.

*(image in the full Top G Vault)*

*The clothing mesh intersects and is positioned within the inner cage at the shoulders and abdomen areas.*

*(image in the full Top G Vault)*

*When equipped, the t-shirt does not fit properly, exposing the problematic areas in the shoulders and abdomen.*

### Clothing partially outside outer cage

Any part of the clothing mesh positioned **outside** the **outer cage** will not be deformed by the layered system. This configuration can sometimes be intentional for effect, such as when [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory caging best practices#Caging protrusions|caging layered accessories that include protrusions]].

*(image in the full Top G Vault)*

*The outer cage of the tshirt is positioned within the clothing mesh near the abdomen.*

*(image in the full Top G Vault)*

*When equipped, layered accessories fail to fit properly at the affected areas.*

### Oversized outer cage

Ensure that the gap between the layered accessory and the outer cage is not too large. This can cause severe deformation issues when combined with other layered accessories.

*(image in the full Top G Vault)*

### Collapsed cage vertices

When cage vertices are collapsed into one vertex or a small region, any additional layer placed on top of your layered accessory will have weird artifacts near the collapsed region.

*(image in the full Top G Vault)*

*Most 3D applications can indicate if vertices are directly overlapping*

> [!warning]
> This setup will be rejected during validation.

### Cages with missing limbs

*(image in the full Top G Vault)*

The cage is meant to match the shape of the template body used to model your layered accessory. Cages without heads or missing limbs won't work properly with the layered accessory system.

> [!warning]
> This setup will be rejected during validation.

### Outer cage inside the inner cage

Setting the outer cage inside the inner cage creates a layered accessory that can't properly layer with other assets.

*(image in the full Top G Vault)*

> [!warning]
> This setup will be rejected during validation.

### Mesh outside of outer cage

Layered accessories placed outside their outer cages do not deform. If the layered accessory is completely outside then it will behave similar to a rigid accessory.

*(image in the full Top G Vault)*

*Layered accessories outside of their cage meshes are not supported.*

*(image in the full Top G Vault)*

*Even with a correct hierarchy, layered accessories outside the cages will not deform.*

> [!warning]
> This setup will be rejected during validation.

---
*Source: [Layered accessory caging best practices](https://create.roblox.com/docs/avatar/layered-accessories/caging-best-practices) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
