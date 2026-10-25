---
title: "3D art and Studio"
description: "An overview of fundamental 3D art tools, concepts, workflows, and resources for Roblox Studio."
area: "30 Official Roblox Docs"
cluster: "Art"
source: "https://create.roblox.com/docs/art/overview-studio"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*An overview of fundamental 3D art tools, concepts, workflows, and resources for Roblox Studio.*

[[30 Official Roblox Docs/Studio/Roblox Studio setup|Roblox Studio]] includes free powerful 3D creation tools that enable you to effectively contribute to asset creation, world building, and more. Whether you are just getting started, or are looking for a refresher on Studio tools, this guide provides an overview on using Studio for 3D art creation.

Each of the following sections include a brief description as well as additional links for further learning:

- [[30 Official Roblox Docs/Art/3D art and Studio#Studio interface|Basic layout of Studio's interface]] — Familiarize yourself with the various panels and tools available in Studio to navigate effectively.
- [[30 Official Roblox Docs/Art/3D art and Studio#Assets and packages|How to use assets and packages]] — Learn to import, edit, and share assets and packages to enhance your workflow and collaboration.
- [[30 Official Roblox Docs/Art/3D art and Studio#3D modeling|3D modeling within Studio]] — Explore the fundamentals of creating and importing 3D models within Studio.
- [[30 Official Roblox Docs/Art/3D art and Studio#Materials and textures|Materials and textures]] — Discover how Roblox uses materials and textures with your models to enhance the surface appearance of your objects.
- [[30 Official Roblox Docs/Art/3D art and Studio#Environments|Environments]] — Craft immersive environments using terrain tools, lighting effects, and atmospheric elements.

## Studio interface

After [[30 Official Roblox Docs/Studio/Roblox Studio setup|installing Studio]], familiarize yourself with Studio's many 3D art tools and interfaces. While you can customize Studio to show various layouts and tools, Studio opens with the most commonly used windows by default.

*(image in the full Top G Vault)*

- [[30 Official Roblox Docs/Studio/Studio interface#3D viewport|Viewport]] — Represents the workspace of a place. The items here are rendered similarly to how a user may view the environment they were to play your game.

- [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] — Shows a hierarchical list of all objects and services in a place. This includes visible objects, like parts and lights, and non-rendered objects like scripts, sounds, and folders.

- [[30 Official Roblox Docs/Studio/Properties window|Properties]] — Populates all the properties of a selected object such as size, position, material, and much more. Many properties can be set through this window, or programmatically through a script.

- [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) — Contains a selection of [[30 Official Roblox Docs/Parts/Models|models]], [[30 Official Roblox Docs/Parts/Textures and decals|images]], [[30 Official Roblox Docs/Parts/Meshes|meshes]], [[30 Official Roblox Docs/Audio/Audio assets|audio]], [[30 Official Roblox Docs/Studio/Studio plugins|plugins]], [[30 Official Roblox Docs/UI/Video frames|videos]], and fonts made by Roblox or Roblox community members.

- [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) — Lets you manage [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places|places]] and bulk import assets into your game.

- [[30 Official Roblox Docs/Studio/Output|Output]] — Displays all error, warning, or manually returned messages from the Roblox engine. This window is useful for troubleshooting behavior in your game.

For more information on the Studio interface and individual tools, see the [[30 Official Roblox Docs/Studio/Roblox Studio|Studio overview]].

## Assets and packages

Before you begin creating, it's important to understand how Roblox handles **assets** and **packages**, the most basic object or group of objects that you can save, use, and share.

- [Assets](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) are a cloud-based version of an object that you can access any time to use, share, and modify. You can make nearly any object into an asset, such as a prop, building, character, sound, image, script, and more.

- [Packages](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/packages.md) are the Roblox equivalent of Unity **Prefabs** or Unreal **Blueprints**, or a group of assets bundled together to reuse in one or more games. Packages can update and propagate their changes to any of their copies across one or more games, letting you take advantage of powerful versioning and asset management controls. Roblox recommends that most developers work with packages whenever possible.

All assets and packages save to your account's [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) for you or any associated [[30 Official Roblox Docs/Projects/Groups (teams)|groups]] to access. You can also manage your saved assets and packages in the **Creations** section of your [Creator Dashboard](https://create.roblox.com/dashboard/creations?activeTab=Model).

You can also upload your assets to share on the [[30 Official Roblox Docs/Art/3D art and Studio#Creator Store|Creator Store]], and sell certain avatar assets to Roblox's [[30 Official Roblox Docs/Art/3D art and Studio#Marketplace|Marketplace]] for users to purchase and equip.

### Creator Store

The [[30 Official Roblox Docs/Production/Creator Store|Creator Store]], accessible through the [web](https://create.roblox.com/store/) and directly inside Studio's [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md), contains millions of assets by Roblox and the Roblox community for use in Studio and your games. Anyone can contribute their assets to the store, including models, images, meshes, audio, plugins, and more.

Roblox also provides [free high quality assets](https://create.roblox.com/store/models?creatorName=Roblox), many of which are used in the following showcases:

#### [Mystery of Duvall Drive](https://www.roblox.com/games/7902470429/The-Mystery-of-Duvall-Drive)

*(image in the full Top G Vault)*

*⟩  [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/The Mystery of Duvall Drive|Behind-the-scenes]]*

*⟩  [Official model packs](https://create.roblox.com/store/models?creatorName=Roblox&includeOnlyVerifiedCreators=true&keyword=duvall+drive&pageNumber=1&querySource=0)*

#### [Beyond the Dark](https://www.roblox.com/games/7208091524/Beyond-the-Dark-Vistech-Showcase)

*(image in the full Top G Vault)*

*⟩  [[30 Official Roblox Docs/Resources/Beyond the Dark/Beyond the Dark|Behind-the-scenes]]*

*⟩  [Official model packs](https://create.roblox.com/store/models?creatorName=Roblox&includeOnlyVerifiedCreators=true&keyword=beyond+the+dark&pageNumber=1&querySource=0)*

#### [Realistic Forest Demo](https://www.roblox.com/games/5326950832/Roblox-Realistic-Forest-Demo)

*(image in the full Top G Vault)*

### Marketplace

The **Marketplace** is where all Roblox users can purchase virtual cosmetics, such as accessories and clothing, and various character bodies that they can save to their Roblox account and set as their Roblox avatar character.

To sell assets on the Marketplace, your creation must follow specific avatar specifications and meet certain policies and guidelines. For more information, see [[30 Official Roblox Docs/Avatar/Avatar, a system of expression|Avatar]] and [[30 Official Roblox Docs/Marketplace/Marketplace overview|Marketplace]].

## 3D modeling

3D modeling is the process of creating three-dimensional digital representations of objects or environments. Roblox supports [[30 Official Roblox Docs/Art/3D art and Studio#Basic parts|basic 3D modeling]] in Studio, using primitive parts and allowing you to combine, subtract, and intersect the basic parts into more complex models.

Roblox also supports [[30 Official Roblox Docs/Art/3D art and Studio#Mesh parts|custom 3D models]] created from 3D modeling software such as Maya and Blender. This includes advanced support for custom models and meshes that include modern textures, animation, and avatar-related features.

*(image in the full Top G Vault)*

*Basic sphere part*

*(image in the full Top G Vault)*

*Bowl created with solid modeling*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/Art/3D art and Studio#Mesh parts|Mesh]] with texture*

### Basic parts

Studio natively supports basic parts that allow you to quickly add simple geometry to your game. This is ideal for creating simple environments or even greyboxing or prototyping a more complex 3D space.

Basic parts include the following benefits:

- You can quickly add and modify parts directly in Studio.
- Parts are performant and work well with Roblox's native physics behavior.
- You can quicly modify the surface appearance of parts using materials and textures.
- In many cases, a mix of basic parts and advanced custom mesh and models can work together to quickly create an immersive and performant environment.

For more information on using basic parts, as well as solid modeling operations, see [[30 Official Roblox Docs/Parts/Parts|Parts]].

### Mesh parts

Meshes are collections of vertices, edges, and faces that make up a 3D object. Unlike parts, which you can directly create in Studio, you first create meshes in a third-party modeling application like Blender or Maya before importing the model file into Studio. After importing a mesh, Studio represents the mesh object as a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]].

*(image in the full Top G Vault)*

*Create custom accessories, clothing, and characters that anyone can wear and use.*

*(image in the full Top G Vault)*

*Design a custom character unique to your game.*

*(image in the full Top G Vault)*

*Use custom meshes and models to give your environments ambiance and depth.*

For more information on creating custom meshes, see [[30 Official Roblox Docs/Art/Modeling/Custom 3D assets|Custom meshes]].

## Materials and textures

It's always important to consider the surface appearance of your objects, as this empowers you to create cohesive and engaging assets and environments. Studio includes many tools to manage the look and feel of your assets, primarily by customizing your objects with [[30 Official Roblox Docs/Art/3D art and Studio#Materials|materials]] and [[30 Official Roblox Docs/Art/3D art and Studio#Textures|textures]].

### Materials

Materials allow you to quickly set the visual and physical properties of objects. While Roblox provides dozens of preset materials that you can set your parts to, you can also use the [[30 Official Roblox Docs/Parts/Materials|Material Generator]] to create your own custom materials using a prompt.

*(image in the full Top G Vault)*
*(image in the full Top G Vault)*
*(image in the full Top G Vault)*
*(image in the full Top G Vault)*

*Materials generated by [[30 Official Roblox Docs/Parts/Materials|Material Generator]] using a natural language prompt*

Materials also affect physical properties beyond appearance. See [[30 Official Roblox Docs/Parts/Materials|Materials]] for more information.

### Textures

Textures are 2D images that you can apply to the surface of an object to change its appearance. Unlike materials, textures are purely visual and never affect the physical properties of the object. In general, you create texture images with third-party software and import them into Studio directly as image files, or baked-in with an imported custom 3D object. You can also use Studio's [[30 Official Roblox Docs/Studio/Texture Generator|Texture Generator]] to create brand new textures for your mesh using a natural language prompt.

*(image in the full Top G Vault)*

*A mesh object sets the shape and geometry of the 3D object*

*(image in the full Top G Vault)*

*A texture image map applies a surface appearance and color*

*(image in the full Top G Vault)*

*The mesh and texture combine to make a unique custom 3D object*

> [!info]
> Textures are different from user interface objects which can apply customizable text or an image to the [[30 Official Roblox Docs/UI/In-game UI containers|surface]] of a part, like a billboard or computer screen.

There are two types of textures in Roblox, single image **basic textures** and **advanced PBR textures** that dynamically react to different lighting and environment scenarios. Whether creating assets directly for the [[30 Official Roblox Docs/Art/3D art and Studio#Creator Store|Creator Store]] or [[30 Official Roblox Docs/Art/3D art and Studio#Marketplace|Marketplace]] or designing content for a game, you should incorporate PBR textures whenever you need realistic and impressive surface textures.

> [!warning]
> Loading many unique PBR textures at once can affect performance in your game. When working with many similar meshes, you can save processing power and memory by using a single set of PBR textures and [modifying alpha channels in combination with your mesh object base colors](https://devforum.roblox.com/t/using-alpha-masks-in-color-maps-to-customizetint-base-colors).
>
> For additional tips on improving performance with your assets, see [[30 Official Roblox Docs/Performance Optimization/Improve performance#Rendering|Improve performance]].

*(image in the full Top G Vault)*

*A character model wearing cosmetic assets with PBR textures.*

*(image in the full Top G Vault)*

*An environmental prop with PBR textures.*

For more information see [[30 Official Roblox Docs/Parts/Textures and decals|Textures and decals]] and [[30 Official Roblox Docs/Art/Modeling/PBR textures|PBR textures]].

## Environments

Environments refer to the visual and spatial world within your game. Environments are a combination of elements, such as [[30 Official Roblox Docs/Art/3D art and Studio#Terrain|terrain]], [[30 Official Roblox Docs/Art/3D art and Studio#Lighting|lighting]], architecture, effects, and more. Roblox provides many tools and services to quickly create high definition environments to elevate your games.

### Terrain

[Video: Global-Wind-Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/aero-fluid-dynamics/Global-Wind-Showcase.mp4)

**Terrain** refers to the landscape or outdoor environment of a Roblox game. Features such as mountains, valleys, hills, bodies of water, and vegetation all make up terrain. To quickly generate terrain, Studio provides a [[30 Official Roblox Docs/Studio/Terrain Editor|Terrain Editor]] that allows you to quickly create various types of environments, such as mountains, grass-colored hills, deserts and more.

While many games include interior spaces, such as a city building or spaceship, it's important to use terrain for outdoor environments whenever possible to ensure performance and expected lighting and environmental behavior.

For more information, see [[30 Official Roblox Docs/Parts/Environmental terrain|Environmental terrain]].

### Lighting

*(image in the full Top G Vault)*

**Lighting** refers to the illumination and visual effect applied to the environment and objects in your game. It plays a crucial role in setting the mood, atmosphere, and general visual quality of your creations.

Lighting can be categorized into the following:

- **Global lighting** — Refers to the luminescence from either the sun or moon in an outdoor environment. You can set the properties of your global lighting by adjusting the [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service. For additional hands-on instructions on adjusting global lighting, see the [[30 Official Roblox Docs/Tutorials/Curriculums/Core/Building/Customize global lighting|Customize global lighting]] lesson of our Core Curriculum.
- **Local lighting** — Refers to light sources placed within your games, such as pointlights, spotlights, and surface lights. You can modify lighting scenarios based on different interior rooms or sections of your game by using one or more light sources.

For additional information on modifying your environment's lighting, see [[30 Official Roblox Docs/Environment/Global lighting|Global lighting]].

---
*Source: [3D art and Studio](https://create.roblox.com/docs/art/overview-studio) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
