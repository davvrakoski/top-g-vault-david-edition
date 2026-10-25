---
title: "Avatar, a system of expression"
description: "Create and upload avatar characters, cosmetics, clothing, and accessories to the Marketplace."
area: "30 Official Roblox Docs"
cluster: "Avatar"
source: "https://create.roblox.com/docs/avatar"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Create and upload avatar characters, cosmetics, clothing, and accessories to the Marketplace.*

Every Roblox user is represented by an **avatar** — a fully customizable 3D character with cosmetics, clothing, and accessories that persist across games on the platform. At their core, avatars are deeply personal because they symbolize one's digital identity, uniquely crafted by individual purchases on the [Marketplace](https://www.roblox.com/catalog) or in games, or from giveaways.

Each avatar is a system of components that work together to create a character that can interact with objects in the 3D space and wear cosmetics, clothing, and accessories. Broadly speaking, you can separate these components into those that make up **who you are** and **what you wear**. Let's break it down.

## Who you are

There are four main layers of the avatar body that structure how the character looks and moves on the platform:

[[30 Official Roblox Docs/Avatar/Avatar, a system of expression#Geometry|Geometry]]<br>

The avatar's visual appearance.

[[30 Official Roblox Docs/Avatar/Avatar, a system of expression#Rigging armature|Rigging armature]]<br>

How the avatar moves.

[[30 Official Roblox Docs/Avatar/Avatar, a system of expression#Animations|Animations]]<br>

How the avatar expresses their personality.

[[30 Official Roblox Docs/Avatar/Avatar, a system of expression#Attachment points and cage meshes|Attachment points and cage meshes]]<br>

How the avatar attaches accessories and wears clothing.

<br>

While you can create each of these layers manually, some have strict configuration requirements to meet Roblox's technical [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|character specifications]] that guarantee your avatar behaves consistently from game to game. To assist your creative process and ensure your avatars meet these specifications, Roblox provides the following:

- [[30 Official Roblox Docs/Avatar Setup/Avatar Setup|Avatar Setup]] - Automatically processes 3D custom assets into avatar assets with all essential components for publishing to the Marketplace.
- [[30 Official Roblox Docs/Avatar/Resources#References|Avatar references]] with geometry and rigging armatures.
- [[30 Official Roblox Docs/Avatar/Resources#Project files|Project files]] for base rigs, attachment points, and cage meshes you can use in third-party modeling software.
- [[30 Official Roblox Docs/Avatar/Resources#Mannequin models|Mannequins]] you can use as a sizing reference.
- [[30 Official Roblox Docs/Avatar/Resources#Templates|Customizable character templates]] with pre-baked avatar components.

### Geometry

The avatar's [[30 Official Roblox Docs/Avatar/Character Bodies/Character bodies|physical body]] geometry is made up of 15 separate mesh body parts that define the shape and contours of the character:

- Head
- Upper and lower torso
- Left upper arm, lower arm, and hand
- Right upper arm, lower arm, and hand
- Left upper leg, lower leg, and foot
- Right upper leg, lower leg, and foot

When users purchase an avatar body, they can either equip it as a set or mix-and-match individual body parts from other purchases.

> [!info]
> In Studio, these body parts are represented as [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects and are nested under a single [[30 Official Roblox Docs/API Reference/Classes/Model|Model]].

[[30 Official Roblox Docs/Art/Characters/Creating/Modeling best practices|Create your first avatar body]]

*(image in the full Top G Vault)*

### Rigging armature

Inside of the avatar's physical body is a non-rendered [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Rigging|rigging armature]] that allows the character to articulate its limbs. Often referred to as joints or bones, rigging armature includes skinning data that allows connections between limbs to bend organically, such as the character's knees and elbows.

**Standard avatar rigs** require 15 poseable joints to articulate the character's 15 body parts. However, if you want to create higher-fidelity characters with a greater level of realism, there are up to 37 additional optional joints for **advanced R15 rigs** that you can create for articulated hands, shoulders, and spine movements. Each joint must follow a specific hierarchy and naming convention for the avatar to function properly in Studio and on the Marketplace.

If your avatar's geometry doesn't have a rigging armature, Roblox provides [[30 Official Roblox Docs/Avatar Setup/Avatar Setup|Avatar Setup]], a tool that automatically generates a Marketplace-ready rig to the character's body model to enable movement and animation.

> [!info]
> In Studio, each joint of the rigging armature is represented by [[30 Official Roblox Docs/API Reference/Classes/Bone|Bone]] objects that connect the character's [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] objects together.

[[30 Official Roblox Docs/Art/Accessories/Rigging and caging models (Blender)|Create your first character rig on an existing model]]

*(image in the full Top G Vault)*

### Animations

Using the avatar's rigging armature or face bones with [[30 Official Roblox Docs/Avatar/Dynamic Heads/FACS poses reference|Facial Action Coding System]] (FACS) data, you can create poses and interpolate between them to create the following types of custom animations:

- **Emotes** - [[30 Official Roblox Docs/Avatar/Emotes/Emotes|Full body animations]] that players purchase from the Marketplace to communicate and celebrate with others in a game, such as gestures, reactions, and dances.
- **Facial expressions** - [[30 Official Roblox Docs/Art/Characters/Facial Animation/Animate heads|Facial animations]] with the character's eyes, mouth, and teeth that players use to express emotions.

Roblox provides the following tooling to make the avatar animation process easier:

- [[30 Official Roblox Docs/Avatar Setup/Avatar Setup|Avatar Setup]] - Automatically generate FACS poses, facial rigging, skinning, and animation data required for facial animation and avatar chat.
- [[30 Official Roblox Docs/Characters/Adaptive Animation|Adaptive Animation]] - Customize, modify, and map joints so that animations can play seamlessly between characters with unique body types, rigging armatures, and proportions.
- [[30 Official Roblox Docs/Animation/Animation Editor|Animation Editor]] - Manually animate the rig by creating poses on different keyframes.
- [[30 Official Roblox Docs/Animation/Animation capture|Animation Capture]] - Record or upload video content to capture movement and expressions as keyframes.
- [[30 Official Roblox Docs/Art/Characters/Facial Animation/Animate heads#Use the Face Animation Editor|Face Animation Editor]] - Use facial sliders to automatically create keyframes as you adjust sliders for different facial features.

> [!info]
> In Studio, each emote is represented by an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] object with its [[30 Official Roblox Docs/API Reference/Classes/Animation#AnimationId|AnimationId]] property set to the assetID of your animation sequence, and FACS values map directly to a dynamic head's [[30 Official Roblox Docs/API Reference/Classes/FaceControls|FaceControls]] object values.

[[30 Official Roblox Docs/Tutorials/Use Case Tutorials/Animation/Create character animations|Create your first full body animation]]

[[30 Official Roblox Docs/Art/Characters/Facial Animation/Create basic dynamic heads|Create your first dynamic head]]

*(image in the full Top G Vault)*

### Attachment points and cage meshes

Outside of the avatar's physical body are two types of non-rendered components that allow the character to attach accessories to the body and wear clothing:

- **Attachment points** - Sets the specific points where accessories and in-game equipable objects attach to the character's body.
- **Cage meshes** - Sets the outer boundary for clothing to stretch and fit over the character's body.

If your avatar's geometry doesn't have attachment points or cage meshes, Roblox provides [[30 Official Roblox Docs/Avatar Setup/Avatar Setup|Avatar Setup]], a tool that automatically adds the required attachment points and cage meshes to your avatar. In addition, there are downloadable Blender, Maya, and `.fbx` [[30 Official Roblox Docs/Avatar/Resources#Project files|project files]] you can use to ensure you're using standard attachment points and cage meshes for humanoid bodies.

> [!info]
> In Studio, outer cage mesh objects are represented by a [[30 Official Roblox Docs/API Reference/Classes/WrapTarget|WrapTarget]] object, and attachment points are represented as [[30 Official Roblox Docs/API Reference/Classes/Attachment|Attachment]] objects.

[[30 Official Roblox Docs/Art/Accessories/Rigging and caging models (Blender)|Edit your first cage meshes on an existing model]]

*(image in the full Top G Vault)*

## What you wear

There are four main layers of what avatars can wear to express their unique style:

[[30 Official Roblox Docs/Avatar/Avatar, a system of expression#Makeup|Makeup]]<br>

2D cosmetic items you can apply to the character's face.

[[30 Official Roblox Docs/Avatar/Avatar, a system of expression#Rigid accessories|Rigid accessories]]<br>

3D cosmetic items that attach on the character's body, such as hats, weapons, and props.

[[30 Official Roblox Docs/Avatar/Avatar, a system of expression#Layered accessories|Layered accessories]]<br>

3D cosmetic items that stretch and fit over the character's body, such as pants, t-shirts, and jackets.

[[30 Official Roblox Docs/Avatar/Avatar, a system of expression#Classic clothing|Classic clothing]]<br>

2D cosmetic images that wrap around the character's body.

<br>

Each of these layers have strict requirements so that users can equip these items to characters of various shapes and sizes.

### Makeup

[[30 Official Roblox Docs/Avatar/Makeup/Makeup|Makeup]] is a facial cosmetic item for additional creative expression, such as face paint, battle markings, camouflage, and traditional makeup art like eyeshadow, lipstick, and blush. Users can purchase makeup as a set on the Marketplace and apply it as a complete cohesive look, or swap out individual makeup components for others that match their own avatar's style.

Roblox provides [[30 Official Roblox Docs/Avatar/Makeup/Makeup#Resources|makeup templates]] that you can use within your creation process, such as:

- Template textures that you can use in 2D editing software to author makeup.
- Template heads that you can use to view and test your makeup before export.
- A reference experience you can use to import and test your makeup assets on characters with different skin tones and body types.

You can either use these templates as a pure reference to see how everything works, or you can use all of them at each step of your creation process.

> [!info]
> In Studio, makeup is made up of multiple specialized texture layers baked into a [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] object, and each texture layer contains a unique makeup component like the lips or eyes region.

[[30 Official Roblox Docs/Avatar/Makeup/Makeup|Create your first makeup look]]

### Rigid accessories

[[30 Official Roblox Docs/Avatar/Rigid Accessories/Rigid accessories|Rigid accessories]] attach to the avatar according to the attachment points around the character's body. When users purchase rigid accessories on the Marketplace, they can adjust the position and rotation of the item away from the attachment point according to their avatar's body type.

Roblox provides a [[30 Official Roblox Docs/Art/Accessories/Creating Rigid/Create your first rigid accessory|step-by-step tutorial]] on how to convert your custom 3D models into rigid accessories, as well as the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] in Studio to test and edit your custom 3D models on multiple combinations of character bodies, animations, and accessories.

> [!info]
> In Studio, rigid accessories are represented as [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] objects.

[[30 Official Roblox Docs/Art/Accessories/Creating Rigid/Create your first rigid accessory|Create your first rigid accessory]]

### Layered accessories

[[30 Official Roblox Docs/Avatar/Layered Accessories/Layered accessories|Layered accessories]], often referred to as layered clothing, stretch and fit on the avatar according to their rigging armature and cage meshes. When users purchase layered accessories on the Marketplace, they expect it to move with the character's animations and layer appropriately on top of existing clothing the character is wearing.

Roblox provides a [[30 Official Roblox Docs/Art/Accessories/Creating/Create your first layered accessory|step-by-step tutorial]] on how to create a Studio-ready layered t-shirt in Blender, as well as the [[30 Official Roblox Docs/Avatar/Accessory Fitting Tool|Accessory Fitting Tool]] in Studio to test and edit your custom 3D models on multiple combinations of character bodies, animations, and accessories.

> [!info]
> In Studio, layered accessories are represented as [[30 Official Roblox Docs/API Reference/Classes/Accessory|Accessory]] objects with a child [[30 Official Roblox Docs/API Reference/Classes/WrapLayer|WrapLayer]] object.

[[30 Official Roblox Docs/Art/Accessories/Creating/Create your first layered accessory|Create your first layered accessory]]

*(image in the full Top G Vault)*

### Classic clothing

[[30 Official Roblox Docs/Avatar/Classic clothing|Classic clothing]] wraps around specific areas of the avatar's body, such as their front torso for t-shirts or their torso and legs for pants. This is the most basic type of avatar item to sell on Roblox as you just need an image editor and web browser for the creation process.

Roblox provides a [step-by-step video tutorial](https://www.youtube.com/watch?v=r_unfGZT5Ps) on how to create a Studio-ready classic t-shirt using GNU Image Manipulation Program (GIMP), a free, third-party image editor.

> [!info]
> In Studio, classic clothing is represented as [[30 Official Roblox Docs/API Reference/Classes/ShirtGraphic|ShirtGraphic]] objects for t-shirts, [[30 Official Roblox Docs/API Reference/Classes/Shirt|Shirt]] objects for shirts, and [[30 Official Roblox Docs/API Reference/Classes/Pants|Pants]] objects for pants.

[[30 Official Roblox Docs/Avatar/Classic clothing|Create your first classic clothing item]]

<br><br><br><br><br><br><br>

---
*Source: [Avatar, a system of expression](https://create.roblox.com/docs/avatar) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
