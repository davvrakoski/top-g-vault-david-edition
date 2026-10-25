---
area: "01 Start Here"
cluster: "Start Here"
title: "Your First Custom Assets - Images, Meshes and the Asset ID Mix-Up"
tags: [roblox, community-knowledge, start-here, assets, images, meshes, importer]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/assets
  - https://create.roblox.com/docs/studio/importer
  - https://create.roblox.com/docs/projects/assets/manager
  - https://create.roblox.com/docs/projects/assets/privacy
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://devforum.roblox.com/t/image-not-appearing/1592977
  - https://devforum.roblox.com/t/image-changing-issue/2064842
---
# Your First Custom Assets - Images, Meshes and the Asset ID Mix-Up

Free models get a game started, but your game starts to look like *yours* when you upload your own logo, button icons, signs and props. Uploading is easy; the beginner traps are elsewhere: images that show in Studio but not from a script, assets that are invisible in the live game because of **ownership**, and meshes rejected for size. This note covers the path for images and meshes. Audio has its own rules; see [[Roblox Audio Rules - Uploads, Privacy and Creator Store Sounds]].

## How to import

- **One or many files:** Studio **File > Import**, or the **Asset Manager** (Window menu or Home tab) > import. The Importer handles 3D models, images, sounds and video, and has a queue for many files at once.
- **Choose the creator** in the import queue: your **user** or a **group**. This matters later (see Ownership).
- New uploads go through **moderation**. If an asset is still in the queue when you publish, players cannot see it until it is approved, so upload a little ahead of release.

## Asset IDs and the rbxassetid format

Every uploaded asset gets a number. Properties that take an asset (an ImageLabel's `Image`, a Decal's texture, a ParticleEmitter's `Texture`) expect it written as:

```
rbxassetid://123456789
```

In code:

```lua
imageLabel.Image = "rbxassetid://123456789"
```

## The decal ID vs image ID mix-up

This catches nearly every beginner once. If an image was uploaded as a **Decal** (for example on the website or found in the Toolbox), it has **two** IDs: the decal's ID and the ID of the image inside it. They are different numbers.

- When you paste the decal ID into a property **in Studio**, Studio swaps it for the image ID behind it. It works, and you may not even notice the number changed.
- When a **script** sets `Image = "rbxassetid://<decal ID>"`, nothing is swapped, and the image stays blank. DevForum threads on this keep reaching the same fix.

**Fix:** paste the ID into the property once in Studio, then copy the number Studio put there and use *that* in your script. Images imported through the Importer or Asset Manager give you the image ID directly.

## Ownership: why it works in Studio but not live

Roblox's **Asset Privacy** system gives Images, Decals and Meshes one of two states: **Restricted** (only creators and games the owner granted can use it) or **Open Use** (anyone can). Your own assets always work in your own games. Trouble starts when owners do not match:

- A **group** game using a Restricted image or mesh uploaded to your **user** account (or a friend's) needs that game granted permission. If it is missing, the asset does not load and the Output shows a clickable error; clicking it can offer to grant the game access.
- Grant access later on the Creator Dashboard, or avoid the problem: **upload assets to the same owner as the game.** If your game is going to move into a group, start uploading to the group now.
- **Open Use cannot be undone.** Only switch an asset to Open Use if you are happy for anyone to reuse it.
- Audio and video follow their own separate privacy rules; read the audio note above.

## Meshes: the short checklist

1. Model in Blender or similar, apply scale, keep the pivot sensible (bottom centre for props). See [[FBX Import Settings, Scale and Collision Fidelity]].
2. Each mesh must stay at or under **20,000 triangles**. Split big objects into several meshes.
3. Export `.fbx` or `.glb` / `.gltf`, then **File > Import**. Check the preview for scale and missing textures before confirming.
4. After import, set the MeshPart's **CollisionFidelity** (`Box` or `Hull` for most props is cheaper than `Default`/`PreciseConvexDecomposition`) and **Anchored** as needed.
5. Reuse: one mesh inserted 50 times costs much less than 50 different meshes. Turn repeated props into a model you copy, or a Package ([[Packages for Beginners - Reuse One Asset Everywhere]]).

## Images: quick tips

- Button icons and logos: PNG with transparency, square, and only as big as they show on screen (256 or 512 px is plenty for most UI).
- A thumbnail or game icon is uploaded on the Creator Dashboard, not through Studio; see [[Publishing Your First Experience - 2026 Release Checklist]].
- Text inside images cannot be translated or resized; prefer real TextLabels for words.

## Rights

Only upload what you made or have the rights to. Ripped game art, logos of brands, and images from search engines can get assets removed and your account warned. For safe sources and licenses, see [[Creative Commons for Game Assets - What Each License Allows]].

## Related
[[00 START HERE - Top G Vault]] · [[Roblox Audio Rules - Uploads, Privacy and Creator Store Sounds]] · [[FBX Import Settings, Scale and Collision Fidelity]] · [[Texture vs Decal vs SurfaceAppearance - Which Surface Tool to Use]] · [[Asset Manager]]
