---
title: "Trail"
description: "Used to create a trail effect between two attachments."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Trail"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Used to create a trail effect between two attachments.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

The **Trail** object is used to create a trail effect between two attachments. As the attachments move through space, a texture is drawn on their defined plane. This is commonly used to create effects that visualize movements like tracer trails behind projectiles, footprints, tire tracks, and similar effects.

See [[30 Official Roblox Docs/Effects/Trails|Trails]] for more information.

*Code samples for this API (`creating-a-part-with-a-basic-trail`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Trail); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#Attachment0\|Attachment0]] | [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] | Along with [[30 Official Roblox Docs/API Reference/Classes/Trail#Attachment1\|Attachment1]], determines where the trail will start drawing its segments. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#Attachment1\|Attachment1]] | [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] | Along with [[30 Official Roblox Docs/API Reference/Classes/Trail#Attachment0\|Attachment0]], determines where the trail will start drawing its segments. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#Brightness\|Brightness]] | float | Scales the light emitted from the trail when [[30 Official Roblox Docs/API Reference/Classes/Trail#LightInfluence\|LightInfluence]] is less than 1. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence\|ColorSequence]] | The color of the trail throughout its lifetime. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#Enabled\|Enabled]] | boolean | Determines whether the trail will be drawn or not. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#FaceCamera\|FaceCamera]] | boolean | Determines whether the trail will always face the camera, regardless of its orientation. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#Lifetime\|Lifetime]] | float | Determines how long each segment in a trail will last, in seconds. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#LightEmission\|LightEmission]] | float | Determines to what degree the colors of the trail are blended with the colors behind it. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#LightInfluence\|LightInfluence]] | float | Determines the degree to which the trail is influenced by the environment's lighting. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#LocalTransparencyModifier\|LocalTransparencyModifier]] | float | Determines a multiplier for [[30 Official Roblox Docs/API Reference/Classes/Trail#Transparency\|Trail.Transparency]] that is only visible to the local client. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#MaxLength\|MaxLength]] | float | Sets the maximum length of the trail. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#MinLength\|MinLength]] | float | Sets the minimum length of the trail. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#Texture\|Texture]] | ContentId | The content ID of the texture to be displayed on the trail. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureContent\|TextureContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The texture displayed on the trail. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md). |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureLength\|TextureLength]] | float | Sets the length of the trail's texture, dependent on [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureMode\|TextureMode]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureMode\|TextureMode]] | [[30 Official Roblox Docs/API Reference/Enums/TextureMode\|TextureMode]] | Determines the manner in which the [[30 Official Roblox Docs/API Reference/Classes/Trail#Texture\|Texture]] scales, repeats, and moves along with the trail's attachments. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#Transparency\|Transparency]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence\|NumberSequence]] | Sets the transparency of the trail's segments over its [[30 Official Roblox Docs/API Reference/Classes/Trail#Lifetime\|Lifetime]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#WidthScale\|WidthScale]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence\|NumberSequence]] | Scales the width of the trail over the course of its lifetime. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Trail#Clear\|Clear()]] | () | Clears the segments of the trail. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Attachment0

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

A [[30 Official Roblox Docs/API Reference/Classes/Trail|Trail]] starts drawing its segments at the positions of its **Attachment0** and [[30 Official Roblox Docs/API Reference/Classes/Trail#Attachment1|Attachment1]]. When the trail is [[30 Official Roblox Docs/API Reference/Classes/Trail#Enabled|Enabled]], it records the positions of its attachments every frame and connects these positions to the attachments' positions on the previous frame, creating a polygon that is then filled in by the trail's [[30 Official Roblox Docs/API Reference/Classes/Trail#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/Trail#Texture|Texture]].

Changing the attachments of a trail while a trail is drawing will remove all of the segments the trail has already drawn.

### Attachment1

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]]

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true · **Capabilities:** Basic

A [[30 Official Roblox Docs/API Reference/Classes/Trail|Trail]] starts drawing its segments at the positions of its [[30 Official Roblox Docs/API Reference/Classes/Trail#Attachment0|Attachment0]] and **Attachment1**. When the trail is [[30 Official Roblox Docs/API Reference/Classes/Trail#Enabled|Enabled]], it records the positions of its attachments every frame and connects these positions to the attachments' positions on the previous frame, creating a polygon that is then filled in by the trail's [[30 Official Roblox Docs/API Reference/Classes/Trail#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/Trail#Texture|Texture]].

Changing the attachments of a trail while a trail is drawing will remove all of the segments the trail has already drawn.

### Brightness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Scales the light emitted from the trail when [[30 Official Roblox Docs/API Reference/Classes/Trail#LightInfluence|LightInfluence]] is less than 1. This property is 1 by default and can set to any number within the range of 0 to 10000. Increasing the value of [[30 Official Roblox Docs/API Reference/Classes/Trail#LightInfluence|LightInfluence]] decreases the effect of this property's value.

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines the color of the trail throughout its lifetime. If [[30 Official Roblox Docs/API Reference/Classes/Trail#Texture|Texture]] is set, this color will tint the texture.

This property is a [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]], allowing the color to be configured to vary across the length of the trail. If the color changes after some of the trail segments have been drawn, all of the old segments will be updated to match the new colors.

*Code samples for this member (`creating-a-trail-with-a-color-gradient`) are published on the source page; their code is not part of the open-source repo.*

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property determines whether the trail will be drawn or not.

If set to `false` while a trail is drawing, no new segments will be drawn, but any existing segments will be cleaned up naturally when they reach the end of their [[30 Official Roblox Docs/API Reference/Classes/Trail#Lifetime|Lifetime]]. To forcibly clean up existing segments, call the [[30 Official Roblox Docs/API Reference/Classes/Trail#Clear|Clear()]] method at the same time.

### FaceCamera

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

A [[30 Official Roblox Docs/API Reference/Classes/Trail|Trail]] is a 2D projection existing in 3D space, meaning that it may not be visible from every angle. The **FaceCamera** property, when set to `true`, ensures that the trail always faces the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|CurrentCamera]], regardless of its orientation.

Changing this property immediately affects all existing and future trail segments.

### Lifetime

**Type:** float

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Basic

The **Lifetime** property determines how long each segment in a trail will last, in seconds, before it disappears. Defaults to 2 seconds but can be set anywhere between 0.01 and 20.

The lifetime of a trail is also used by that effect's [[30 Official Roblox Docs/API Reference/Classes/Trail#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/Trail#Transparency|Transparency]] properties to determine how each segment is drawn. Both of these properties are sequences, meaning that they define their values at certain keypoints in the segment's lifetime and then interpolate between the values as the segment ages.

If a trail's lifetime changes, existing segments will immediately behave as if they always had the new lifetime, meaning that if they've existed for longer than the new lifetime, they will be removed immediately.

### LightEmission

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines to what degree the colors of the trail are blended with the colors behind it. It should be set in the range of 0 to 1. A value of 0 uses normal blending modes and a value of 1 uses additive blending.

This property should not be confused with [[30 Official Roblox Docs/API Reference/Classes/Trail#LightInfluence|LightInfluence]] which determines how the trail is affected by environmental light.

Changing this property immediately affects all existing and future segments of the trail.

This property does **not** cause the trail to light the environment.

### LightInfluence

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines the degree to which the trail is influenced by the environment's lighting, clamped between 0 and 1. When 0, the trail will be unaffected by the environment's lighting. When 1, it will be fully affected by lighting as a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] would be.

Changing this property immediately affects all existing and future segments of the trail.

See also [[30 Official Roblox Docs/API Reference/Classes/Trail#LightEmission|LightEmission]] which specifies to what degree the colors of the trail are blended with the colors behind it.

### LocalTransparencyModifier

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`

The `LocalTransparencyModifier` property is a multiplier applied to the trail's [[30 Official Roblox Docs/API Reference/Classes/Trail#Transparency|Transparency]] that is only visible to the local client. It does not replicate from client to server and is useful for when a trail should not render for a specific client.

Uses the same formula as [[30 Official Roblox Docs/API Reference/Classes/BasePart#LocalTransparencyModifier|BasePart.LocalTransparencyModifier]]:

`1` - ((`1` - [[30 Official Roblox Docs/API Reference/Classes/Trail#Transparency|Transparency]]) × (`1` - `LocalTransparencyModifier`))

A value of `0` (default) has no effect on the trail's transparency. A value of `1` makes the trail completely invisible to the local client regardless of its [[30 Official Roblox Docs/API Reference/Classes/Trail#Transparency|Transparency]] value.

### MaxLength

**Type:** float

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property determines the maximum length of the trail, in studs. Its value defaults to 0, meaning that the trail will not have a maximum length and trail segments will expire in their [[30 Official Roblox Docs/API Reference/Classes/Trail#Lifetime|Lifetime]].

This property can be used alongside the [[30 Official Roblox Docs/API Reference/Classes/Trail#MinLength|MinLength]] property which determines the minimum length a trail must be before it's drawn.

### MinLength

**Type:** float

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property determines the minimum length of the trail, in studs. If neither of the trail's attachments have moved at least this value, no new segments will be created and the endpoints of the current segment will be moved to the current position of the attachments.

Note that changing this property will only affect **new** segments that are drawn; any old segments that have already been drawn will maintain their current length.

This property can be used alongside the [[30 Official Roblox Docs/API Reference/Classes/Trail#MaxLength|MaxLength]] property which determines the maximum trail length before its oldest segments are erased.

### Texture

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The content ID of the texture to be displayed on the trail. If this property is not set, the trail will be displayed as a solid plane; this also occurs when the texture is set to an invalid content ID or the image associated with the texture has not yet loaded.

The appearance of the texture can be further modified by other trail properties including [[30 Official Roblox Docs/API Reference/Classes/Trail#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/Trail#Transparency|Transparency]].

Scaling of the texture is determined by the distance between [[30 Official Roblox Docs/API Reference/Classes/Trail#Attachment0|Attachment0]] and [[30 Official Roblox Docs/API Reference/Classes/Trail#Attachment1|Attachment1]], as well as the [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureMode|TextureMode]], [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureLength|TextureLength]], and [[30 Official Roblox Docs/API Reference/Classes/Trail#WidthScale|WidthScale]] properties.

*Code samples for this member (`creating-a-trail-with-a-pawprint-texture`) are published on the source page; their code is not part of the open-source repo.*

### TextureContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The texture displayed on the trail. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md).

This property is the [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]] equivalent of [[30 Official Roblox Docs/API Reference/Classes/Trail#Texture|Texture]]. Assigning `TextureContent` updates `Texture`.

If this property is set to [[30 Official Roblox Docs/API Reference/Datatypes/Content#none|Content.none]], the trail displays as a solid plane colored by its [[30 Official Roblox Docs/API Reference/Classes/Trail#Color|Color]] property. The appearance of the texture can be further modified by [[30 Official Roblox Docs/API Reference/Classes/Trail#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/Trail#Transparency|Transparency]]. Scaling of the texture is determined by the distance between [[30 Official Roblox Docs/API Reference/Classes/Trail#Attachment0|Attachment0]] and [[30 Official Roblox Docs/API Reference/Classes/Trail#Attachment1|Attachment1]], as well as [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureMode|TextureMode]], [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureLength|TextureLength]], and [[30 Official Roblox Docs/API Reference/Classes/Trail#WidthScale|WidthScale]].

### TextureLength

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets the length of the trail's texture, dependent on [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureMode|TextureMode]]. Changing this property immediately affects all existing and future trail segments.

### TextureMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TextureMode|TextureMode]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property, alongside [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureLength|TextureLength]], determines how a trail's [[30 Official Roblox Docs/API Reference/Classes/Trail#Texture|Texture]] scales, repeats, and moves along with the trail's attachments. Changing this property immediately affects all existing and future trail segments.

#### Scale and Repetition

When **TextureMode** is set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Wrap]] or [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Static]], the [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureLength|TextureLength]] property sets the length of the texture as it repeats across the trail's length.

*(image in the full Top G Vault)*

When **TextureMode** is set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Stretch]], the texture will repeat [[30 Official Roblox Docs/API Reference/Classes/Trail#TextureLength|TextureLength]] times across the trail's overall length.

*(image in the full Top G Vault)*

#### Movement

The **TextureMode** property also affects the **movement** of the trail's texture as follows:

- If set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Stretch]], the texture will stretch out based on the lifetime of the trail, and shrink inwards if the trail's attachments stop moving.

- If set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Wrap]], the texture will be tiled as the length of the trail changes, but the textures will remain stationary relative to their attachments.

- If set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Static]], the texture will be rolled out as the attachments move, and they will remain in place until their lifetime is met. This setting is ideal for trail textures that should appear "stamped" where rendered, such as paw prints or tire tracks.

### Transparency

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets the transparency of the trail's segments over its [[30 Official Roblox Docs/API Reference/Classes/Trail#Lifetime|Lifetime]]. This value is a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]], meaning it can be a static value or can change throughout the lifetime of the trail segments.

### WidthScale

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]]

**Thread safety:** ReadSafe · **Category:** Emission · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property is a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] that scales the width of the trail over the course of its lifetime. Values can range between 0 and 1, acting as a multiplier on the distance between the trail's attachments. For example, if the trail's attachments are 2 stud's apart and the value of this property is 0.5, the trail's width will be 1 stud and the trail will be centered between the two attachments.

## Methods

### Clear

```lua
Trail:Clear(): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

This method immediately clears all segments of the trail and is useful for cleaning up trails with longer lifetimes or for cases where the trail should be removed because of a specific action.

Calling this method only affects existing segments. To clear existing trail segments **and** temporarily prevent new segments from being drawn, toggle the trail's [[30 Official Roblox Docs/API Reference/Classes/Trail#Enabled|Enabled]] property to `false` at the same time.

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [Trail](https://create.roblox.com/docs/reference/engine/classes/Trail) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
