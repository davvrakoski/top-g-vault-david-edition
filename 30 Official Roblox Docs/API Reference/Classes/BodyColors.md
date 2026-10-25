---
title: "BodyColors"
description: "For a Humanoid character, the BodyColors will specify the colors for the different body parts."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/BodyColors"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*For a Humanoid character, the BodyColors will specify the colors for the different body parts.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/CharacterAppearance|CharacterAppearance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances

## Description

BodyColors is a utility object used by Roblox to load avatar body colors from the website. Avatars that are loaded from the website will automatically have a BodyColors object corresponding to said avatar's body color configuration. When parented inside of a character with a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]], it will apply the colors to each specified limb.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BodyColors#HeadColor\|HeadColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | Sets the color of the head, as a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyColors#HeadColor3\|HeadColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the head, as a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyColors#LeftArmColor\|LeftArmColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | Sets the color of the left arm, as a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyColors#LeftArmColor3\|LeftArmColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the left arm, as a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyColors#LeftLegColor\|LeftLegColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | Sets the color of the left leg, as a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyColors#LeftLegColor3\|LeftLegColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the left leg, as a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightArmColor\|RightArmColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | Sets the color of the right arm, as a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightArmColor3\|RightArmColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the right arm, as a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightLegColor\|RightLegColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | Sets the color of the right leg, as a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightLegColor3\|RightLegColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the right leg, as a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyColors#TorsoColor\|TorsoColor]] | [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]] | Sets the color of the torso, as a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor\|BrickColor]]. |
| [[30 Official Roblox Docs/API Reference/Classes/BodyColors#TorsoColor3\|TorsoColor3]] | [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]] | Sets the color of the torso, as a [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/CharacterAppearance|CharacterAppearance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### HeadColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance

Sets the color of the head, as a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

Setting this will also set [[30 Official Roblox Docs/API Reference/Classes/BodyColors#HeadColor3|BodyColors.HeadColor3]].

### HeadColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Sets the color of the head, as a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]].

Setting this will also set HeadColor to the closest [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

### LeftArmColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance

Sets the color of the left arm, as a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

Setting this will also set BodyColors.LeftArmColor3

### LeftArmColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Sets the color of the left arm, as a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]].

Setting this will also set LeftArmColor to the closest [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

### LeftLegColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance

Sets the color of the left leg, as a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

Setting this will also set [[30 Official Roblox Docs/API Reference/Classes/BodyColors#LeftLegColor3|BodyColors.LeftLegColor3]].

### LeftLegColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Sets the color of the left leg, as a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]].

Setting this will also set LeftLegColor to the closest [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

### RightArmColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance

Sets the color of the right arm, as a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

Setting this will also set [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightArmColor3|BodyColors.RightArmColor3]].

### RightArmColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Sets the color of the right arm, as a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]].

Setting this will also set RightArmColor to the closest [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

### RightLegColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance

Sets the color of the right leg, as a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

Setting this will also set [[30 Official Roblox Docs/API Reference/Classes/BodyColors#RightLegColor3|BodyColors.RightLegColor3]].

### RightLegColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Sets the color of the right leg, as a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]].

Setting this will also set RightLegColor to the closest [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

### TorsoColor

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/false · **Capabilities:** AvatarAppearance

Sets the color of the torso, as a [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

Setting this will also set [[30 Official Roblox Docs/API Reference/Classes/BodyColors#TorsoColor3|BodyColors.TorsoColor3]].

### TorsoColor3

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]]

**Thread safety:** ReadSafe · **Category:** Appearance · **Loaded/Saved:** true/true · **Capabilities:** AvatarAppearance

Sets the color of the torso, as a [[30 Official Roblox Docs/API Reference/Datatypes/Color3|Color3]].

Setting this will also set TorsoColor to the closest [[30 Official Roblox Docs/API Reference/Datatypes/BrickColor|BrickColor]].

---
*Source: [BodyColors](https://create.roblox.com/docs/reference/engine/classes/BodyColors) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
