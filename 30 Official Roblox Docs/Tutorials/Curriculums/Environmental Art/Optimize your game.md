---
title: "Optimize your game"
description: "Explains how to configure your assets and Studio settings to improve frame rate and performance levels."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/curriculums/environmental-art/optimize-your-experience"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to configure your assets and Studio settings to improve frame rate and performance levels.*

![](https://www.youtube.com/watch?v=vuwn2-atYK8)

**Optimizing your game** is the process of configuring your assets and Studio settings to keep your frame rate and performance levels high for devices with memory and graphics processing unit (GPU) limitations. This process ensures that nearly every user has the same gameplay and visual experience while they're viewing your environment.

Using the [Environment Art - Optimizing](https://www.roblox.com/games/14447845297/Environment-Art-Optimizing) `.rbxl` file as a reference, this section of the environmental art curriculum shows you how to review and configure your place file for optimal graphics, including guidance on:

- Reviewing the physics and rendering parameters of each asset to confirm they preserve memory and engine performance.
- Culling excess texture, geometry, or transparencies that unnecessarily increase the amount of calculations the Roblox Engine must perform to render your assets.

While the Roblox Engine handles most optimization work for you, you can assist in these optimization efforts by utilizing the [[30 Official Roblox Docs/Performance Optimization/Microprofiler/MicroProfiler|Microprofiler]] to see where it takes more time to render specific frames. Using this information, you can make informed decisions about what assets need your attention in regards to their parameters or excess content. [[30 Official Roblox Docs/Performance Optimization/Scene Analysis|Scene Analysis]] is another powerful tool for checking resource usage.

*(image in the full Top G Vault)*

## Review physics and render parameters

In [[30 Official Roblox Docs/Tutorials/Curriculums/Environmental Art/Assemble an asset library|Assemble an asset library]], you learned how important it is to set physics and rendering parameters that allow your assets to retain their high visual quality across devices with memory and GPU limitations. However, it's common as you construct your environment to adjust these parameters according to an asset's contextual position and purpose within your game. For example, much of the foliage in the final sample laser tag environment casts shadows despite a performance cost because it adds to the realism of the environment.

When you modify physics and rendering parameters, it's useful near the end of the development process to review all parameters to see where you can optimize a parameter while maintaining aesthetic goals and gameplay requirements. To illustrate, you can disable [[30 Official Roblox Docs/API Reference/Classes/BasePart#CastShadow|BasePart.CastShadow]] property for the foliage near the edges of the gameplay area to save on performance without interfering with a user's gameplay or visual experience.

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/BasePart#CastShadow|BasePart.CastShadow]] = Disabled*

*(image in the full Top G Vault)*

*[[30 Official Roblox Docs/API Reference/Classes/BasePart#CastShadow|BasePart.CastShadow]] = Enabled*

## Cull nonessential content

After you review your physics and rendering parameters, you can review the assets themselves to see where you can cull any nonessential content from the game that doesn't affect your gameplay, such as identical textures with different asset IDs, complex geometry with many vertices, or transparencies that layer on top of each other depending on the camera view. The following sections detail what you can do to review this content, and why it helps optimization efforts.

### Remove duplicate textures

As you transition between developing your assets and constructing your environment, it's common to iterate over meshes or textures as you find what's necessary for your aesthetic goals or gameplay requirements. If you don't convert your assets into [packages](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/packages.md), when you import these iterations into Studio, you're making unique asset IDs that the Roblox Engine needs to reference as it renders your assets within the environment.

For example, if you were to import the following two fire hydrant meshes into Studio separately, even if they are exactly the same in appearance, the Roblox Engine treats them as two objects with unique asset IDs. The more unique calls the engine needs to make, the more of an impact on memory and performance. For this reason, it's important to confirm when you're reusing an asset multiple times, each instance of that asset uses the same asset ID so that the engine only needs to make a single call to render it repeatedly.

*(image in the full Top G Vault)*

### Optimize geometry

If you find that you need to make more adjustments to increase frame rate across devices, it's useful to see where you can optimize your geometry by either:

- Combining groups of meshes into a single asset.
- Decreasing the polygon count of assets with geometric complexity.

Expanding on this first technique, every unique asset in your game represents a draw call on the GPU in which it sends a signal to the GPU to call information in order for the Roblox Engine to render the asset correctly. The more unique assets you have, the more draw calls the system needs to make. For this reason, if you have a group of meshes that make up a larger component in your game, you can group them together in third-party modeling tools to reduce the need for multiple draw calls.

To illustrate this point, the final sample laser tag environment parents multiple parts and meshes together to create the large towers outside of the building. If you were to combine all of these individual components together, you could make it a single asset with only one asset ID, and reduce the number of draw calls from 8 to 1. However, it's important to note that this technique removes your ability to freely change the visual and physical characteristics of each component, such as its position or material.

For example, in the following image, the left tower remains multiple assets under a [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] object, and the right tower is a single asset. You can modify each component of the left tower individually, but when you modify the right tower, such as changing its color to black, it affects the entirety of the object. This is why it's important to only consider this technique near the end of your environment's development when you know where you can improve performance without affecting your aesthetic goals.

*(image in the full Top G Vault)*

Expanding on the second technique, assets with geometric complexity have more polygons, meaning they have more vertices that the engine needs to calculate as it renders their visual appearance. This means that assets with less complexity and fidelity are less costly to render, leading to an improvement in both performance and memory.

> [!warning]
> If you choose to utilize this second technique, after you simplify your geometry in third-party tooling, it's important to remember to update your packages with the new import instead of creating a new asset ID, otherwise the Roblox Engine needs to make two separate calls for each asset ID.

### Delete layered transparencies

To provide a sense of realism to the environment, the final sample laser tag environment includes many meshes with varying levels of transparency, such as the foliage in the outdoor space, glass on the futuristic signage or planter railing. When the camera views multiple semi-transparent objects that are in front or behind each other, the Roblox Engine must render the overlapping pixels multiple times to account for the
transparent areas. This process is called high transparency overdraw, and it comes at a significant impact to performance.

For example, consider the following view of a planter in the sample environment. The engine must render the transparent areas of the leaves between the plant closest to the camera to the plant closest to the outdoor area in layers, equating to hundreds of thousands of overdrawn pixels. To alleviate some of this impact, it's important to review the layout of all semi-transparent objects in your environment, and ensure there aren't too many places where there are many layers of overlap, especially in large areas of the screen.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

When you finish reviewing all of your content to ensure it's optimal across devices, your game is now ready for publication!

> [!info]
> We're interested in hearing from you about your experience following the Environmental Art Curriculum. If you have any questions, concerns, or additional feedback on the process, please comment on our [Environmental Art Curriculum Q&A](https://devforum.roblox.com/t/feedback-on-environmental-art-curriculum/2592218).

---
*Source: [Optimize your game](https://create.roblox.com/docs/tutorials/curriculums/environmental-art/optimize-your-experience) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
