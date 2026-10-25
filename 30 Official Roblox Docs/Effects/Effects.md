---
title: "Effects"
description: "Learn how to add visual effects to your games."
area: "30 Official Roblox Docs"
cluster: "Effects"
source: "https://create.roblox.com/docs/effects"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Learn how to add visual effects to your games.*

You can create special effects by parenting special effect objects to other
objects or attachments.

## Light sources

Light sources let you attach lighting effects to objects or attachments. There
are three types of light sources:

- A [[30 Official Roblox Docs/API Reference/Classes/PointLight|PointLight]]
  emits light spherically from a single point. This object is ideal for
  non-directional lights like bulbs, torches, and fireballs.
- A [[30 Official Roblox Docs/API Reference/Classes/SpotLight|SpotLight]]
  emits light in the shape of a cone with a spherical base. This object is ideal
  for directional lights like street lamps, flashlights, and headlights.
- A [[30 Official Roblox Docs/API Reference/Classes/SurfaceLight|SurfaceLight]] emits light from the face of a BasePart. This object is
  ideal for lighting from TV or computer screens, billboards, and fluorescent
  panels.

*(image in the full Top G Vault)*

*Point lights*

*(image in the full Top G Vault)*

*Spotlights*

*(image in the full Top G Vault)*

*Surface lights*

## Particle emitters

A [[30 Official Roblox Docs/Effects/Particle emitters|particle emitter]] is an object that emits customizable 2D images (particles) into the world, useful for simulating special effects like fire, smoke, and sparks.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/particle-emitter/Showcase.mp4)

## Beams

A [[30 Official Roblox Docs/Effects/Beams|beam]] is an object that renders a texture between two
[[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Beam.Attachment0]] and
[[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Beam.Attachment1]]. By setting beam properties, you can:

- Add a [[30 Official Roblox Docs/Effects/Beams#Texture|texture]] and [[30 Official Roblox Docs/Effects/Beams#Color|color gradient]] to create interesting visuals like waterfalls and force fields.
- Modify a beam's [[30 Official Roblox Docs/Effects/Beams#Transparency|transparency]] so that it fades over time.
- Warp its shape by changing the [[30 Official Roblox Docs/Effects/Beams#Width|width]] or [[30 Official Roblox Docs/Effects/Beams#Curve|curve]] of each attachment point.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/beam/Showcase.mp4)

## Trails

A [[30 Official Roblox Docs/Effects/Trails|trail]] is an object that creates a trail between and behind two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects as they move through space. Trails can help players visualize movement, such as a sword slashing through the air, projectiles flying to their target, or footprints walking away.

By setting trail properties, you can:

- Add a [[30 Official Roblox Docs/Effects/Trails#Texture|texture]] to create interesting visuals.
- Set a constant or gradient [[30 Official Roblox Docs/Effects/Trails#Color|color]].
- Modify a trail's [[30 Official Roblox Docs/Effects/Trails#Lifetime|lifetime]].

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/trail/Showcase.mp4)

## Highlighting

[[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] is a visual effect which you can use to call attention to a specific object within a game, such as to provide visual feedback that the object is important and/or interactable. See [[30 Official Roblox Docs/Effects/Highlighting objects|Highlighting Objects]] for details.

*(image in the full Top G Vault)*

*Base object*

*(image in the full Top G Vault)*

*White outline, 50% red interior*

*(image in the full Top G Vault)*

*Yellow outline, black interior*

---
*Source: [Effects](https://create.roblox.com/docs/effects) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
