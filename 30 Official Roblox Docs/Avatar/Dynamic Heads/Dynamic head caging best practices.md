---
title: "Dynamic head caging best practices"
description: "Tips on optimizing face cages for your avatars."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar/dynamic-heads/caging-best-practices"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Tips on optimizing face cages for your avatars.*

> [!info]
> The following information applies to character creators who are looking to improve or resolve errors with their character head cages. This improves compatibility with Marketplace items, such as accessories and makeup.

A character's dynamic head cage helps define the surface of the 3D model. The cage also plays an important role in Marketplace [[30 Official Roblox Docs/Avatar/Dynamic Heads/Dynamic head validation|head validation]], so it's important to properly construct cages to ensure accurate fitting with head accessories and animations.

The following information and examples are best practices that are applicable to face caging as well as other caging processes. For additional best practices for caging, see [[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessory caging best practices|Layered accessory caging best practices]].

## General

*(image in the full Top G Vault)*

*Realistic face model reference*

*(image in the full Top G Vault)*

*Realistic face model caging reference*

### Equidistant geometry

Try to keep geometry equidistant whenever possible. This helps mitigate texture and layered accessory distortion. Keep in mind that this isn't always possible.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

### Vertex colored areas

The template file includes vertex colors in the cages at important areas. Lining up vertex colored areas to the lips, eyebrows, and hairline areas help ensure quality makeup transfer and additionally any hair, facial hair, eyebrows, or eyelash accessories.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

### Important non-vertex colored areas

Line up areas that aren't as obviously defined to the nose, eyes, and ear areas to correctly ensure quality makeup transfer and any hair, facial hair, eyebrows and eyelash accessory fit.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

### Middle axis at origin

Try to keep it at origin if possible. This just keeps some consistency in the middle.

*(image in the full Top G Vault)*

### Line up neck cage part

Cage parts need to line up to the render mesh objects. This doesn't have to be exact but should be close. This ensures that HSR (Hidden Surface Removal) can accurately hide the underlying surface when layered accessories are worn on top.

Not something you have to worry about if using auto-setup, but may help with troubleshooting issues near the neck. Keep in mind that HSR is disabled on the head, but not on the body where the neck attaches.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

### Cage should barely cover render mesh

The cage needs to be close to the render mesh without actually intersecting it. Because the cage is a different topology and lower resolution than your render mesh, this can be difficult. This helps with the fit of layered accessories and with the accuracy of the makeup transfer.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

## Eyes

### Establish the inner and outer eye

You should have three verts for the upper eyelid and three verts for the lower eyelid, and they should be equidistant from each other.

*(image in the full Top G Vault)*

### Enclose the cage

When applicable enclose the open edge of the eye section right up to the eye mesh.

*(image in the full Top G Vault)*

## Eyebrows

It's a little easier to visualize the eyebrow shape using the vertex color provided in the template. Once you've established the head and tail of the eyebrow, you should place the three upper and lower verts equidistant from each other.

*(image in the full Top G Vault)*

### Establish the head and tail

It's a little easier to visualize the eyebrow shape because of the vertex color. Once you've established the head and tail of the eyebrow, you should place the three upper and lower verts equidistant from each other.

*(image in the full Top G Vault)*

### Missing eyebrows

For missing eyebrows, it's important to rely on basic rules of facial proportions to figure out the placement. Take in account of stylization and face shape to account for how to shape them.

*(image in the full Top G Vault)*

### Layered clothing eyebrows

For layered eyebrows try to match up the vertex colored area as best as possible to the shape of the eyebrow.

*(image in the full Top G Vault)*

### Textured eyebrows

Similar rule to layered eyebrows, try to match up the vertex colored area as best as possible to the shape of the eyebrow. Equipable eyebrows should fit right on top.

 *(image in the full Top G Vault)*

## Mouth

Outline the outside and inside of the lips. Green vertex color should be on the upper lip, and purple on the lower lip with an equidistant spacing.

 *(image in the full Top G Vault)*

## Nose

The bridge of the nose starts at the inner part of the eyes and ends two faces above the lips. Try to keep this generally in the area of where the nose should be.

 *(image in the full Top G Vault)*

## Ears

Establish the top of the ear with the triangle portion of the ear, the bottom with the quad. Keep the shape of the hair line around the ear.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

## Hairline

Establish from eyebrows the forehead shape and hairline.

 *(image in the full Top G Vault)*

If working with sideburns, define the shape of the sideburns in front and around the ears and consider where the hairline should end at the base of the neck. This will help determine how layered hair accessories fits to the head.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

## Caging examples of other facial types

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

## Missing features

For faces that are missing major facial features, use the following guidance. These tips may not always applicable, but they provide a good framework to understand how to cage faces with missing features.

- The face is divided horizontally into three equal parts
  - Hairline to eyebrows
  - Eyebrows to the bottom of the nose
  - Bottom of the nose to the bottom of the chin.
- Eyes are halfway down the head
- Space between eyes is approximately eye width
- The head is about five eyes wide
- Tear ducts of the eyes line up with the edges of the nostrils
- The corners of the mouth and pupils of the eyes are aligned
- The bottom of the ears lines up With the bottom of the nose

*(image in the full Top G Vault)*

---
*Source: [Dynamic head caging best practices](https://create.roblox.com/docs/avatar/dynamic-heads/caging-best-practices) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
