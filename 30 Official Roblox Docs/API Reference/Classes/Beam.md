---
title: "Beam"
description: "Connects two `Attachments` by drawing a texture between them."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/Beam"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Connects two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] by drawing a texture between them.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

A **Beam** object connects two [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] by drawing a texture between them.

To display, a beam must be a descendant of the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] with its [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]] and [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]] properties set to [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]] also descending from the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].

The beam's appearance can be customized using the range of properties outlined below. Also see the [[30 Official Roblox Docs/Effects/Beams|Beams]] guide for visual examples.

#### Beam Curvature

Beams are configured to use a cubic Bézier curve formed by four control points. This means they are not constrained to straight lines and the curve of the beam can be modified by changing [[30 Official Roblox Docs/API Reference/Classes/Beam#CurveSize0|CurveSize0]], [[30 Official Roblox Docs/API Reference/Classes/Beam#CurveSize1|CurveSize1]], and the orientation of the beam's [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]].

- **P0** — The start of the beam; position of [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]].
- **P1** — [[30 Official Roblox Docs/API Reference/Classes/Beam#CurveSize0|CurveSize0]] studs away from [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]], in the positive **X** direction of [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]].
- **P2** — [[30 Official Roblox Docs/API Reference/Classes/Beam#CurveSize1|CurveSize1]] studs away from [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]], in the negative **X** direction of [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]].
- **P3** — The end of the beam; position of [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]]

*(image in the full Top G Vault)*

*Code samples for this API (`Creating-a-Beam-From-Scratch`) are published on the [source page](https://create.roblox.com/docs/reference/engine/classes/Beam); their code is not part of the open-source repo.*

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0\|Attachment0]] | [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] | The [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] the beam originates from. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1\|Attachment1]] | [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] | The [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] the beam ends at. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#Brightness\|Brightness]] | float | Scales the light emitted from the beam when [[30 Official Roblox Docs/API Reference/Classes/Beam#LightInfluence\|LightInfluence]] is less than 1. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#Color\|Color]] | [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence\|ColorSequence]] | Determines the color of the beam across its [[30 Official Roblox Docs/API Reference/Classes/Beam#Segments\|Segments]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#CurveSize0\|CurveSize0]] | float | Determines, along with [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0\|Attachment0]], the position of the second control point in the beam's Bézier curve. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#CurveSize1\|CurveSize1]] | float | Determines, along with [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1\|Attachment1]], the position of the third control point in the beam's Bézier curve. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#Enabled\|Enabled]] | boolean | Determines whether the beam is visible or not. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#FaceCamera\|FaceCamera]] | boolean | Determines whether the [[30 Official Roblox Docs/API Reference/Classes/Beam#Segments\|Segments]] of the beam will always face the camera, regardless of its orientation. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#LightEmission\|LightEmission]] | float | Determines to what degree the colors of the beam are blended with the colors behind it. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#LightInfluence\|LightInfluence]] | float | Determines the degree to which the beam is influenced by the environment's lighting. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#LocalTransparencyModifier\|LocalTransparencyModifier]] | float | Determines a multiplier for [[30 Official Roblox Docs/API Reference/Classes/Beam#Transparency\|Beam.Transparency]] that is only visible to the local client. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#Segments\|Segments]] | int | Sets how many straight segments the beam is made up of. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#Texture\|Texture]] | ContentId | The content ID of the texture to be displayed on the beam. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureContent\|TextureContent]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The texture displayed on the beam. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md). |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureLength\|TextureLength]] | float | Sets the length of the beam's texture, dependent on [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureMode\|TextureMode]]. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureMode\|TextureMode]] | [[30 Official Roblox Docs/API Reference/Enums/TextureMode\|TextureMode]] | Determines the manner in which the [[30 Official Roblox Docs/API Reference/Classes/Beam#Texture\|Texture]] scales and repeats. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureSpeed\|TextureSpeed]] | float | Determines the speed at which the [[30 Official Roblox Docs/API Reference/Classes/Beam#Texture\|Texture]] image moves along the beam. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#Transparency\|Transparency]] | [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence\|NumberSequence]] | Determines the transparency of the beam across its segments. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#Width0\|Width0]] | float | The width of the beam at its origin ([[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0\|Attachment0]]), in studs. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#Width1\|Width1]] | float | The width of the beam at its end ([[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1\|Attachment1]]), in studs. |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#ZOffset\|ZOffset]] | float | The distance, in studs, the beam display is offset relative to the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera\|CurrentCamera]]. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Beam#SetTextureOffset\|SetTextureOffset()]] | () | Sets the current offset of the beam's texture cycle. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### Attachment0

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]]

**Thread safety:** ReadSafe · **Category:** Shape · **Loaded/Saved:** true/true · **Capabilities:** Basic

The [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] the beam originates from. This attachment is the first control point on the beam's cubic Bézier curve; its orientation, alongside the [[30 Official Roblox Docs/API Reference/Classes/Beam#CurveSize0|CurveSize0]] property, determines the position of the second control point. See [[30 Official Roblox Docs/Effects/Beams#Curve|Beams]] for more details.

For the [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] where the beam ends, see [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]].

### Attachment1

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]]

**Thread safety:** ReadSafe · **Category:** Shape · **Loaded/Saved:** true/true · **Capabilities:** Basic

The [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] the beam ends at. This attachment is the fourth and final control point on the beam's cubic Bézier curve; its orientation, alongside the [[30 Official Roblox Docs/API Reference/Classes/Beam#CurveSize1|CurveSize1]] property, determines the position of the third control point. See [[30 Official Roblox Docs/Effects/Beams#Curve|Beams]] for more details.

For the [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] where the beam originates from, see [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]].

### Brightness

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Scales the light emitted from the beam when [[30 Official Roblox Docs/API Reference/Classes/Beam#LightInfluence|LightInfluence]] is less than 1. This property is 1 by default and can set to any number within the range of 0 to 10000. Increasing the value of [[30 Official Roblox Docs/API Reference/Classes/Beam#LightInfluence|LightInfluence]] decreases the effect of this property's value.

### Color

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines the color of the beam across its [[30 Official Roblox Docs/API Reference/Classes/Beam#Segments|Segments]]. If [[30 Official Roblox Docs/API Reference/Classes/Beam#Texture|Texture]] is set, this color will be applied to the beam's texture. If no [[30 Official Roblox Docs/API Reference/Classes/Beam#Texture|Texture]] is set, the [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] will appear as a solid line colored in accordance with this property.

This property is a [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]], allowing the color to be configured to vary across the length of the beam. Consider the following [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]] which, when applied to a beam, would yield the pictured result.

```lua
local colorSequence = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), -- Red
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 188, 203)), -- Cyan
		ColorSequenceKeypoint.new(1, Color3.fromRGB(196, 0, 255)), -- Purple
	}
)
```

*(image in the full Top G Vault)*

Note the beam's coloration also depends on the number of [[30 Official Roblox Docs/API Reference/Classes/Beam#Segments|Segments]] the [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] has. Each segment of the beam can only show a transition between two colors. Therefore a [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] will need to have at least `n-1` segments in order for the color to display correctly, where `n` is the number of [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequenceKeypoint|ColorSequenceKeypoints]] in the [[30 Official Roblox Docs/API Reference/Datatypes/ColorSequence|ColorSequence]].

### CurveSize0

**Type:** float

**Thread safety:** ReadSafe · **Category:** Shape · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines, along with [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]], the position of the second control point in the beam's Bézier curve. See [[30 Official Roblox Docs/Effects/Beams#Curve|Beams]] for more details.

The position of this point can be determined by the following equation:

*Code samples for this member (`Beam-CurveSize0`) are published on the source page; their code is not part of the open-source repo.*

### CurveSize1

**Type:** float

**Thread safety:** ReadSafe · **Category:** Shape · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines, along with [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]], the position of the third control point in the beam's Bézier curve. See [[30 Official Roblox Docs/Effects/Beams#Curve|Beams]] for more details.

The position of this point can be determined by the following equation:

*Code samples for this member (`Beam-CurveSize1`) are published on the source page; their code is not part of the open-source repo.*

### Enabled

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines whether the beam is visible or not.

When this property is set to false, the beam's [[30 Official Roblox Docs/API Reference/Classes/Beam#Segments|Segments]] will not be displayed.

### FaceCamera

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Shape · **Loaded/Saved:** true/true · **Capabilities:** Basic

A [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] is a 2D projection existing in 3D space, meaning that it may not be visible from every angle. The **FaceCamera** property, when set to `true`, ensures that the beam always faces the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|CurrentCamera]], regardless of its orientation.

### LightEmission

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines to what degree the colors of the beam are blended with the colors behind it. It should be set in the range of 0 to 1. A value of 0 uses normal blending modes and a value of 1 uses additive blending.

This property should not be confused with [[30 Official Roblox Docs/API Reference/Classes/Beam#LightInfluence|LightInfluence]] which determines how the beam is affected by environmental light.

This property does **not** cause the beam to light the environment.

### LightInfluence

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines the degree to which the beam is influenced by the environment's lighting, clamped between 0 and 1. When 0, the beam will be unaffected by the environment's lighting. When 1, it will be fully affected by lighting as a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] would be.

See also [[30 Official Roblox Docs/API Reference/Classes/Beam#LightEmission|LightEmission]] which specifies to what degree the colors of the beam are blended with the colors behind it.

### LocalTransparencyModifier

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** false/false · **Capabilities:** Basic · **Tags:** `Hidden`, `NotReplicated`

The `LocalTransparencyModifier` property is a multiplier applied to the beam's [[30 Official Roblox Docs/API Reference/Classes/Beam#Transparency|Transparency]] that is only visible to the local client. It does not replicate from client to server and is useful for when a beam should not render for a specific client.

Uses the same formula as [[30 Official Roblox Docs/API Reference/Classes/BasePart#LocalTransparencyModifier|BasePart.LocalTransparencyModifier]].

A value of `0` (default) has no effect on the beam's transparency. A value of `1` makes the beam completely invisible to the local client regardless of its [[30 Official Roblox Docs/API Reference/Classes/Beam#Transparency|Transparency]] value.

### Segments

**Type:** int

**Thread safety:** ReadSafe · **Category:** Shape · **Loaded/Saved:** true/true · **Capabilities:** Basic

Rather than being a perfect curve, a beam is made up of straight segments. The more segments, the higher the resolution of the curve. The **Segments** property sets how many straight segments the beam is made up of, with a default value of 10.

Note that the [[30 Official Roblox Docs/API Reference/Classes/Beam#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/Beam#Transparency|Transparency]] properties require a certain number of segments to display correctly. This is because each segment can only show a transition between two colors or transparencies. Therefore a [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]] requires at least `n-1` segments to display correctly, where `n` is the number of keypoint associated with the beam's [[30 Official Roblox Docs/API Reference/Classes/Beam#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/Beam#Transparency|Transparency]].

### Texture

**Type:** ContentId

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The content ID of the texture to be displayed on the beam. If this property is not set, the beam will be displayed as a solid line; this also occurs when the texture is set to an invalid content ID or the image associated with the texture has not yet loaded.

The appearance of the texture can be further modified by other beam properties including [[30 Official Roblox Docs/API Reference/Classes/Beam#Color|Color]] and [[30 Official Roblox Docs/API Reference/Classes/Beam#Transparency|Transparency]].

Scaling of the texture is determined by the [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureMode|TextureMode]], [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureLength|TextureLength]], [[30 Official Roblox Docs/API Reference/Classes/Beam#Width0|Width0]], and [[30 Official Roblox Docs/API Reference/Classes/Beam#Width1|Width1]] properties.

### TextureContent

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The texture displayed on the beam. Supports [asset URIs](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md).

If this property is set to [[30 Official Roblox Docs/API Reference/Datatypes/Content#none|Content.none]], the beam displays as a solid line colored by its [[30 Official Roblox Docs/API Reference/Classes/Beam#Color|Color]] property. The appearance of the texture can be further modified by [[30 Official Roblox Docs/API Reference/Classes/Beam#Color|Color]], [[30 Official Roblox Docs/API Reference/Classes/Beam#Transparency|Transparency]], and scaling is determined by [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureMode|TextureMode]], [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureLength|TextureLength]], [[30 Official Roblox Docs/API Reference/Classes/Beam#Width0|Width0]], and [[30 Official Roblox Docs/API Reference/Classes/Beam#Width1|Width1]].

### TextureLength

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets the length of the beam's texture, dependent on [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureMode|TextureMode]].

### TextureMode

**Type:** [[30 Official Roblox Docs/API Reference/Enums/TextureMode|TextureMode]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

This property, alongside [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureLength|TextureLength]], determines how a beam's [[30 Official Roblox Docs/API Reference/Classes/Beam#Texture|Texture]] repeats.

When set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Wrap]] or [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Static]], the texture repetitions will equal the beam's overall length (in studs) divided by its [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureLength|TextureLength]].

*(image in the full Top G Vault)*

When set to [[30 Official Roblox Docs/API Reference/Enums/TextureMode|Enum.TextureMode.Stretch]], the texture will repeat [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureLength|TextureLength]] times across the beam's overall length.

*(image in the full Top G Vault)*

### TextureSpeed

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Sets the number of texture cycles per second at which the [[30 Official Roblox Docs/API Reference/Classes/Beam#Texture|Texture]] image moves along the beam, where one cycle is a full traversal of the texture's UV range. When this property is a positive value, the beam's texture will move from [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]] to [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]]. This direction can be inverted by setting this property to a negative number. The default value is `1`.

How far one cycle travels along the beam in studs depends on [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureMode|TextureMode]] and [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureLength|TextureLength]].

#### Examples

- `-2` — Texture scrolls from [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]] toward [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]], completing two cycles per second.
- `0` — Texture is static.
- `1` — Texture scrolls from [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]] toward [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]], completing one cycle per second (default).
- `2` — Texture scrolls from [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]] toward [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]], completing two cycles per second.

### Transparency

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

Determines the transparency of the beam across its segments. This property is a [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]], allowing the transparency to be configured to vary across the length of the beam.

Consider the following [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]] which, when applied to a beam, would yield the pictured result.

```lua
local numberSequence = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0), -- Opaque
		NumberSequenceKeypoint.new(0.5, 1), -- Transparent
		NumberSequenceKeypoint.new(1, 0), -- Opaque
	}
)
```

*(image in the full Top G Vault)*

Note that the beam's transparency also depends on the number of [[30 Official Roblox Docs/API Reference/Classes/Beam#Segments|Segments]]. Each segment of the beam can only show a transition between two transparencies. Therefore a beam will need to have at least `n-1` segments in order to display correctly, where `n` is the number of [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequenceKeypoint|NumberSequenceKeypoints]] in the [[30 Official Roblox Docs/API Reference/Datatypes/NumberSequence|NumberSequence]].

### Width0

**Type:** float

**Thread safety:** ReadSafe · **Category:** Shape · **Loaded/Saved:** true/true · **Capabilities:** Basic

The width of the beam at its origin ([[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]]), in studs. The beam's width will change linearly to [[30 Official Roblox Docs/API Reference/Classes/Beam#Width1|Width1]] studs at its end ([[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]]).

### Width1

**Type:** float

**Thread safety:** ReadSafe · **Category:** Shape · **Loaded/Saved:** true/true · **Capabilities:** Basic

The width of the beam at its end ([[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]]), in studs. The beam's width will change linearly from [[30 Official Roblox Docs/API Reference/Classes/Beam#Width0|Width0]] studs at its origin ([[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]]).

### ZOffset

**Type:** float

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** Basic

The distance, in studs, the beam display is offset relative to the [[30 Official Roblox Docs/API Reference/Classes/Workspace#CurrentCamera|CurrentCamera]]. When 0, the beam will be displayed in its standard position between [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment0|Attachment0]] and [[30 Official Roblox Docs/API Reference/Classes/Beam#Attachment1|Attachment1]]. **ZOffset** can be either positive or negative.

This property is particularly useful to avoid "Z‑fighting" when using multiple [[30 Official Roblox Docs/API Reference/Classes/Beam|Beams]] between the same [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachments]].

*Code samples for this member (`Beam-ZOffset`) are published on the source page; their code is not part of the open-source repo.*

## Methods

### SetTextureOffset

```lua
Beam:SetTextureOffset(offset: float = 0): ()
```

**Thread safety:** Unsafe · **Capabilities:** Basic

The offset of a beam's texture cycle represents the progress of its texture animation. This method sets the current offset of the beam's texture cycle; hence, it can be used to reset the cycle by passing `0` as the `offset` parameter.

#### Notes

- The given `offset` parameter is expected to be a value between 0 and 1, but greater values can be used.
- The texture cycle wraps at 0 and 1, meaning the texture is in the same position when the offset is at 0 or 1.
- If the [[30 Official Roblox Docs/API Reference/Classes/Beam#Texture|Texture]] property is not set, this method does nothing.
- Increasing the offset will act in the inverse direction to the [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureSpeed|TextureSpeed]] property, meaning it will move the texture in the opposite direction to the direction the texture animates when [[30 Official Roblox Docs/API Reference/Classes/Beam#TextureSpeed|TextureSpeed]] is greater than 0.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `offset` | float | `0` | The desired offset of the texture cycle. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [Beam](https://create.roblox.com/docs/reference/engine/classes/Beam) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
