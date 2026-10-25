---
title: "Textures and decals"
description: "Textures and decals are images you can place on object surfaces."
area: "30 Official Roblox Docs"
cluster: "Parts"
source: "https://create.roblox.com/docs/parts/textures-decals"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Textures and decals are images you can place on object surfaces.*

A [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] is an image you can place on any face of a [[30 Official Roblox Docs/Parts/Parts|part]] or [[30 Official Roblox Docs/Parts/Solid modeling|union]] that **repeats** both horizontally and vertically on the size of the surface. In contrast, a [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] is an image that **stretches** to fit the area of a part or union's surface. After you
add a [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] or [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] object to a part or union, you can:

- Change the texture or decal [[30 Official Roblox Docs/API Reference/Classes/Decal#Color3|Color3]] property to set a color tint using RGB color codes.

- Change the texture or decal [[30 Official Roblox Docs/API Reference/Classes/Decal#Transparency|Transparency]] property to a value between the default of **0** (fully visible) and **1** (invisible).

- For a texture, set its [[30 Official Roblox Docs/Parts/Textures and decals#Scale textures|scale]] and [[30 Official Roblox Docs/Parts/Textures and decals#Offset textures|offset]].

    *(image in the full Top G Vault)*

		*Texture image*

*(image in the full Top G Vault)*

*Texture applied to a part (repeating)*

*(image in the full Top G Vault)*

*Decal image*

*(image in the full Top G Vault)*

*Decal applied to a part (stretched)*

## Create textures or decals

To create a texture or decal, you must add either a [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] or [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] object to a part or union. You can [import](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) images for textures and decals to Studio for use between games, and [[30 Official Roblox Docs/Production/Creator Store|distribute]] them to the [[30 Official Roblox Docs/Production/Creator Store|Creator Store]]. Once you import the image, Studio assigns it a unique asset ID.

> [!info]
> Every texture or decal image that you create and import to Roblox must adhere to the [Community Rules](https://en.help.roblox.com/hc/articles/203313410) and [Terms of Use](https://en.help.roblox.com/hc/articles/115004647846).

To add a texture or decal to a [[30 Official Roblox Docs/Parts/Parts|part]] or [[30 Official Roblox Docs/Parts/Solid modeling|union]]:

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, add a [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]] or [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]] to the part or union. An empty texture or decal object displays on the part or union with orange outlining.

2. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, navigate to the [[30 Official Roblox Docs/API Reference/Classes/FaceInstance#Face|Face]] property and choose a face ([[30 Official Roblox Docs/API Reference/Enums/NormalId|Top]], [[30 Official Roblox Docs/API Reference/Enums/NormalId|Bottom]], [[30 Official Roblox Docs/API Reference/Enums/NormalId|Front]], [[30 Official Roblox Docs/API Reference/Enums/NormalId|Back]], [[30 Official Roblox Docs/API Reference/Enums/NormalId|Left]], or [[30 Official Roblox Docs/API Reference/Enums/NormalId|Right]]).

   - **OPTIONAL** To assist in choosing the correct face, right-click the part/union and select **Show Orientation Indicator**. This displays a circle **🅕**, a blue line attached to the object's front face, and a green arrow that points in the direction of the object's top face.

     *(image in the full Top G Vault)*

3. Select the [[30 Official Roblox Docs/API Reference/Classes/Decal#ColorMapContent|ColorMapContent]] property and apply an image through any of the following methods:

   - Select any texture or decal you've uploaded previously.
   - Enter an [asset ID](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/index.md) into the field.

4. **OPTIONAL** Set a color tint by clicking the small box to the left of the [[30 Official Roblox Docs/API Reference/Classes/Decal#Color3|Color3]] property or by entering a RGB color code.

   *(image in the full Top G Vault)*

   *(image in the full Top G Vault)*

   *(image in the full Top G Vault)*

   *[[30 Official Roblox Docs/API Reference/Classes/Decal#Color3|Color3]]: [255, 255, 255]*

   *(image in the full Top G Vault)*

   *[[30 Official Roblox Docs/API Reference/Classes/Decal#Color3|Color3]]: [255, 0, 100]*

5. **OPTIONAL** Set the [[30 Official Roblox Docs/API Reference/Classes/Decal#Transparency|Transparency]] property to any value between the default of `0` (fully visible) and `1` (invisible).

   *(image in the full Top G Vault)*

   *[[30 Official Roblox Docs/API Reference/Classes/Decal#Transparency|Transparency]]: 0*

   *(image in the full Top G Vault)*

   *[[30 Official Roblox Docs/API Reference/Classes/Decal#Transparency|Transparency]]: 0.6*

## Customize textures

Unlike decals, **textures** provide further functionality to scale, offset, and animate the source image.

### Scale textures

The size of the part doesn't affect the texture. Instead, scaling a part only increases or decreases the number of times the texture repeats.

The [[30 Official Roblox Docs/API Reference/Classes/Texture#StudsPerTileU|StudsPerTileU]] and [[30 Official Roblox Docs/API Reference/Classes/Texture#StudsPerTileV|StudsPerTileV]] properties determine the size of each "tile" in studs. [[30 Official Roblox Docs/API Reference/Classes/Texture#StudsPerTileU|StudsPerTileU]] determines the texture's horizontal size while [[30 Official Roblox Docs/API Reference/Classes/Texture#StudsPerTileV|StudsPerTileV]] determines the texture's vertical size.

#### StudsPerTileU & StudsPerTileV = 2

*(image in the full Top G Vault)*

#### StudsPerTileU & StudsPerTileV = 4

*(image in the full Top G Vault)*

### Offset textures

If you want more control over a texture's position, offset the texture by adjusting the [[30 Official Roblox Docs/API Reference/Classes/Texture#OffsetStudsU|OffsetStudsU]] (horizontal) and [[30 Official Roblox Docs/API Reference/Classes/Texture#OffsetStudsV|OffsetStudsV]] (vertical) properties. This is also helpful for [[30 Official Roblox Docs/Parts/Textures and decals#Animate textures|animation]].

#### OffsetStudsU & OffsetStudsV = 0

*(image in the full Top G Vault)*

#### OffsetStudsU & OffsetStudsV = 0.5

*(image in the full Top G Vault)*

### Animate textures

Using [[30 Official Roblox Docs/API Reference/Classes/TweenService|TweenService]], you can tween texture properties like [[30 Official Roblox Docs/API Reference/Classes/Texture#OffsetStudsU|OffsetStudsU]] and [[30 Official Roblox Docs/API Reference/Classes/Texture#StudsPerTileV|StudsPerTileV]] to achieve animated surfaces. For example, if you apply two fog textures to one container and animate them with the following script, you can achieve the appearance of a layered moving fog.

[Video: Animated-Textures.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/modeling/textures-decals/Animated-Textures.mp4)

*Two animated textures near the floor to simulate a moving fog effect*

```lua
local TweenService = game:GetService("TweenService")

local texture1 = script.Parent.Texture1
local texture2 = script.Parent.Texture2

local tweenInfo1 = TweenInfo.new(8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1)
local tween1 = TweenService:Create(texture1, tweenInfo1, {OffsetStudsV=50})
local tweenInfo2 = TweenInfo.new(7, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local tween2 = TweenService:Create(texture2, tweenInfo2, {OffsetStudsU=50, StudsPerTileU=55, StudsPerTileV=45})

tween1:Play()
tween2:Play()
```

## Texture streaming

**Texture streaming** dynamically loads textures based on distance and camera view, which lets you use textures more freely without worrying about scaling across devices. The engine loads baseline-quality textures first, in order of importance, and then progressively raises the quality of each texture up to the memory available on the device. Texture streaming is enabled automatically, so you don't have to take any action to benefit from it.

*(image in the full Top G Vault)*

*The same scene with and without texture streaming*

### Benefits

- **Faster perceived load times and smaller downloads**: Textures appear almost immediately at a baseline quality, and the engine downloads only the detail it needs, compressing it both in transit and on the local disk cache.
- **Higher quality where it matters**: The engine continuously estimates how important each object is, such as by how much screen space it occupies, and uses the memory budget on those textures so that the most prominent objects get the highest detail.
- **Fewer out-of-memory crashes**: Because the engine stays within a memory budget and can lower texture quality when memory runs low, players are much less likely to crash from texture memory spikes.

Texture streaming works with [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] (skinned and unskinned), [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]], [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]], [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]], [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]], [[30 Official Roblox Docs/API Reference/Classes/Beam|Beam]], [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]], and the base materials applied to [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] and [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] instances.

### Best practices

- Favor unique, individual textures over texture atlases unless the atlas is applied to batchable parts; requesting a high resolution for one texture in an atlas streams in the entire atlas at that resolution.
- Use near-uniform texel density in your UV-mapped meshes so that the engine can select the best resolution for each texture.
- Continue to manage texture memory carefully for instance types that texture streaming doesn't support yet.

---
*Source: [Textures and decals](https://create.roblox.com/docs/parts/textures-decals) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
