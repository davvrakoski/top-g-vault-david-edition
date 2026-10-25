---
title: "Materials"
description: "Materials determine objects' visual appearance and physical properties."
area: "30 Official Roblox Docs"
cluster: "Parts"
source: "https://create.roblox.com/docs/parts/materials"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Materials determine objects' visual appearance and physical properties.*

Roblox's materials are unlike materials on other platforms, in that their visual appearance **and** their [[30 Official Roblox Docs/Parts/Materials#Physical properties|physical properties]] reflect those of materials in the real world. For example, concrete is heavier than plastic and sinks faster in water. When you set the material of a part or terrain, Roblox simulates its physical material properties to make this behavior just work.

The Roblox Engine offers a range of [[30 Official Roblox Docs/Parts/Materials#Base materials|base materials]] suitable to build many games, including various categories of metal, rock, and organic materials.

You can also create your own [[30 Official Roblox Docs/Parts/Materials#Custom materials|custom materials]] and apply them to parts or [[30 Official Roblox Docs/Parts/Environmental terrain|terrain]]. Custom materials have an additional [[30 Official Roblox Docs/Parts/Materials#Adaptive materials|adaptive materials]] behavior that lets you adapt any model to use your art style and custom materials, even if someone else created the model.

## Apply materials

You can quickly apply materials to [[30 Official Roblox Docs/Parts/Parts|parts]] through the [[30 Official Roblox Docs/Parts/Materials#Material widget|Material]] widget. The [[30 Official Roblox Docs/Parts/Materials#Material Manager|Material Manager]] offers the same functionality and an additional "paint tool" application mode.

### Material widget

The **Material** widget is accessible from the **Home** or **Model** tab toolbars. Click‑holding over the small corner arrow on the button reveals a material picker. See [[30 Official Roblox Docs/Parts/Parts#Material|Parts]] for more information.

*(image in the full Top G Vault)*

### Material Manager

The **Material Manager** is accessible through **Window** ⟩ **3D** ⟩ **Material** or from the **Material** widget's picker popup. From the manager window, you can apply materials to [[30 Official Roblox Docs/Parts/Parts|parts]] through the following workflows.

#### Apply to Selected

The default [[30 Official Roblox Docs/API Reference/Enums/Material|Enum.Material]] property for new [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] instances is **Plastic**. To apply a different material to parts:

1. In the 3D viewport or [[30 Official Roblox Docs/Studio/Explorer window|Explorer]], select one or more parts.
2. In the **Material Manager** palette, hover your mouse over the desired material (you don't need to select it) and click the **Apply to Selected Parts** button.

   *(image in the full Top G Vault)*

#### Paint Tool

You can also use a material as a painting tool that applies to parts:

1. In the **Material Manager**, select the material you want to apply.
1. In the top-left corner, click the **Paint Parts With Selected Material** button to enable the material as a painting tool.

   *(image in the full Top G Vault)*

1. In the 3D viewport, hover over and click the parts that you want to apply the material to.
1. When you're done painting, click the button again to disable the tool.

## Custom materials

The [[30 Official Roblox Docs/Parts/Materials#Material Manager|Material Manager]] provides a user interface to interact with various aspects of [[30 Official Roblox Docs/API Reference/Classes/MaterialService|MaterialService]], including creating new custom materials and applying them to parts and [[30 Official Roblox Docs/Parts/Environmental terrain|terrain]]. Custom materials are represented by [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] instances within [[30 Official Roblox Docs/API Reference/Classes/MaterialService|MaterialService]].

*(image in the full Top G Vault)*

You can apply custom materials per-part or globally to both parts and terrain, and you can fine-tune how custom materials apply to faces of terrain with [[30 Official Roblox Docs/API Reference/Classes/TerrainDetail|TerrainDetail]] instances. To paint many distinct materials onto terrain in one place, including multiple color variations, see [[30 Official Roblox Docs/Parts/Custom terrain materials|Custom terrain materials]].

> [!info]
> [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] and [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] instances both use [[30 Official Roblox Docs/Art/Modeling/PBR textures|PBR]] textures to customize the appearance of objects. The difference is that [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] is for customizing the appearance of reusable tileable material, whereas [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] is for customizing the visual appearance of a specific mesh with UV mapping. [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] instances also have [[30 Official Roblox Docs/Parts/Materials#Physical properties|physical properties]] that [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] instances don't.

### Create custom materials

You can edit all properties of a custom material in the [[30 Official Roblox Docs/Parts/Materials#Material Manager|Material Manager]] or through the properties of a [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] instance. You can also generate custom materials through the prompt‑based [[30 Official Roblox Docs/Studio/Material Generator|Material Generator]].

To create a custom material in the [[30 Official Roblox Docs/Parts/Materials#Material Manager|Material Manager]]:

1. Click the **base material** from which your custom material will inherit [[30 Official Roblox Docs/Parts/Materials#Physical properties|physical properties]]. If you skip this step, the base material will be **Plastic**, but you can change it later.

   *(image in the full Top G Vault)*

2. In the top-left corner, click **Create Material Variant**.

   *(image in the full Top G Vault)*

   A new variant appears in the palette with an icon in the bottom-right corner, indicating it's a custom material.

   *(image in the full Top G Vault)*

3. In the inspector, rename your custom material to describe its purpose. You can change the name later, but if you do so **after** applying the material to parts, you'll need to re-apply it to those parts.
4. For each **texture map** option such as **Color** or **Normal**, paste an asset ID or import a new texture from your computer. Square textures work best. If you don't specify an asset for a texture map, that texture remains blank.
5. If desired, adjust the **Studs Per Tile** and **Pattern** values to change how the material looks.

> [!info]
> If necessary, you can delete a custom material from the [[30 Official Roblox Docs/Parts/Materials#Material Manager|Material Manager]] by selecting it and clicking the **Delete** button below its preview globe. Alternatively, you can delete its associated [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] instance within **MaterialService** of the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]].

### Apply custom materials

For [[30 Official Roblox Docs/Parts/Parts|parts]], you can use a custom material just like any other material, applying it to selected parts through the [[30 Official Roblox Docs/Parts/Materials#Apply materials|Material]] widget or the [[30 Official Roblox Docs/Parts/Materials#Material Manager|Material Manager]].¹

You can also apply the new material to a part by setting its **MaterialVariant** property in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window. In this case, Studio automatically sets its **Material** property to the base material you chose when creating the material.

*(image in the full Top G Vault)*

> [!warning]
> Note that if you rename a custom material **after** applying it to parts, those parts will not automatically use the custom material with the new name. This behavior allows for [[30 Official Roblox Docs/Parts/Materials#Adaptive materials|Adaptive Materials]]. If you want parts to continue using a custom material after you rename it, you'll need to re-apply the custom material.

*¹ On terrain, you can set a custom material as a [[30 Official Roblox Docs/Parts/Materials#Material overrides|material override]] for an existing base material, or paint many distinct materials with [[30 Official Roblox Docs/Parts/Custom terrain materials|custom terrain materials]] after you enable **Expanded Terrain**.*

### Material overrides

You can set a custom material as a **material override** to make its base material serve as a reference to the custom material. When you do so, Studio will use the custom material for both the textures and [[30 Official Roblox Docs/Parts/Materials#Physical properties|physical properties]] of any part or [[30 Official Roblox Docs/Parts/Environmental terrain|terrain]] that uses the custom material.

> [!info]
> Material overrides apply one custom material to every instance of a base material in a place, including terrain that uses that base material. To paint multiple variants or colors of the same base material onto terrain in one place, use [[30 Official Roblox Docs/Parts/Custom terrain materials|custom terrain materials]].

#### Set overrides

To set a custom material as a material override in the [[30 Official Roblox Docs/Parts/Materials#Material Manager|Material Manager]]:

1. Click the custom material that you want to set as an override.
1. In the inspector, scroll down to **Overrides** and enable **Set as Override**.

   *(image in the full Top G Vault)*

   The new override appears as a property of **MaterialService** in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

   *(image in the full Top G Vault)*

#### Terrain details

By default, applying a custom material to parts or as an override applies that custom material as tiles across each face. For terrain, you can optionally configure [[30 Official Roblox Docs/API Reference/Classes/TerrainDetail|TerrainDetail]] instances to customize the **top**, **side**, and **bottom** of terrain voxels using that custom material.

To customize the faces of terrain using a custom material:

1. In the palette of the [[30 Official Roblox Docs/Parts/Materials#Material Manager|Material Manager]], click the custom material.
1. In the inspector, confirm that its **Set as Override** toggle is enabled.

   *(image in the full Top G Vault)*

1. In the **Terrain Details** section, click **Create** for each face you want to customize.

   *(image in the full Top G Vault)*

1. For each face you enable, expand the arrow to access and edit details such as its name, texture maps, studs per tile, and pattern.

   *(image in the full Top G Vault)*

#### Disable overrides

You can disable an entire material override and all base materials that it's currently overriding, or you can disable the override for a specific base material.

##### Disable Entire Override

1. In the palette of the [[30 Official Roblox Docs/Parts/Materials#Material Manager|Material Manager]], click a **custom material** that's being used as an override.
1. In the inspector, scroll down to **Overrides** and disable **Set as Override**.

   *(image in the full Top G Vault)*

##### Disable Override for Specific Material

1. In the palette of the [[30 Official Roblox Docs/Parts/Materials#Material Manager|Material Manager]], click a **base material** which is being overridden by a custom material.
2. In the inspector, scroll down to **Material Override** and select **None** from the menu.

   *(image in the full Top G Vault)*

## Physical properties

All materials have built-in **physical properties** such as density, elasticity, and friction. Through the application of [[30 Official Roblox Docs/Parts/Materials#Custom materials|custom materials]] with unique physical properties, you can affect global material behavior for all parts and [[30 Official Roblox Docs/Parts/Environmental terrain|terrain]] which use the custom material, such as creating an extremely slippery variant of the **Ice** material.

When factoring physical properties, the engine prioritizes more granular per-part settings over material behaviors to determine the effective physical properties of a surface:

*(image in the full Top G Vault)*

Custom physical properties of the specific part.

*(image in the full Top G Vault)*

Custom physical properties of the part's custom material.

*(image in the full Top G Vault)*

Custom physical properties of the [[30 Official Roblox Docs/Parts/Materials#Set overrides|material override]] of the part's material.

*(image in the full Top G Vault)*

The [[30 Official Roblox Docs/Parts/Materials#Default physical properties|default physical properties]] of the part's material.

### Applying to Custom Materials

To set unique physical properties for any [[30 Official Roblox Docs/Parts/Materials#Custom materials|custom material]] and automatically apply them to all parts and [[30 Official Roblox Docs/Parts/Environmental terrain|terrain]] which use the material:

1. In the palette of the [[30 Official Roblox Docs/Parts/Materials#Material Manager|Material Manager]], click the custom material.
2. In the inspector, scroll down to the **Physics** section and set custom physical properties as detailed in the [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]] reference.

   *(image in the full Top G Vault)*

   For any part that uses the custom material and does **not** have [[30 Official Roblox Docs/Parts/Materials#Physical properties|part-specific]] overrides, the **CurrentPhysicalProperties** branch in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window reveals that its default physical properties are overridden by the custom material's properties.

   *(image in the full Top G Vault)*

### Per-Part Overrides

If you need to override a part's custom material properties and set physical properties for that specific part, you can use its **CustomPhysicalProperties** toggle.

1. With the part selected, enable **CustomPhysicalProperties** in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

   *(image in the full Top G Vault)*

2. Set custom physical properties as detailed in the [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]] reference.

## Adaptive materials

When you apply a custom material to a part, the part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#MaterialVariant|Part.MaterialVariant]] property becomes the name of its [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] rather than its specific instance. This means that when you reuse the part in the same or a different place, as in a model or package, it's easier for you to adapt different custom materials to adjust the part's look. The adaptive behavior of custom materials has the following effects:

- If you create collections of custom materials with the same name but different textures, then you can quickly change the style of a place by changing which collection is a child of [[30 Official Roblox Docs/API Reference/Classes/MaterialService|MaterialService]].
- If you insert a model with parts that use a custom material, then you can modify its look by creating an instance of [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] in [[30 Official Roblox Docs/API Reference/Classes/MaterialService|MaterialService]] and renaming it to the same name as the previous custom material, rather than applying the new material to the parts in the model.

When you reuse custom materials in models and packages, each `MaterialVariant` instance must be in [[30 Official Roblox Docs/API Reference/Classes/MaterialService|MaterialService]] for it to work.

- If you distribute a model to the Creator Store with a custom material, include the [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] instance in the model. For more information about distributing models to the Creator Store, see [[30 Official Roblox Docs/Production/Creator Store|Distributing Assets]].
- If you insert a model from the Creator Store, look for any [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] instances and copy them to [[30 Official Roblox Docs/API Reference/Classes/MaterialService|MaterialService]]. For more information about importing models from the Creator Store, see [[30 Official Roblox Docs/Production/Creator Store|Creator Store]].
- If you want to use custom materials with packages, put the package in [[30 Official Roblox Docs/API Reference/Classes/MaterialService|MaterialService]]. For more information on packages, see [Packages](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/packages.md).

The [[30 Official Roblox Docs/Production/Creator Store|Creator Store]] has a category called Materials for "material packs", models that contain only [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]], [[30 Official Roblox Docs/API Reference/Classes/TerrainDetail|TerrainDetail]], [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]], and [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] instances. The Materials category is a way to promote and discover custom materials by other creators.

> [!success]
> To make the most of adaptive materials, use a consistent naming convention for your [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] instances. For example, you can use `PascalCase` with the base material of the custom material as the first word, as in `GrassWet`, `GrassDry`, and `GrassBurned`.

## Asset and property reference

### Base materials

Shaders generate the look and feel of materials. The base material shaders work differently than the shader which [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] instances use, so you can't create custom materials that look exactly like base materials, but you can still create custom materials that use their textures. The following tables list the asset IDs for material details such as [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#ColorMap|ColorMap]] and [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance#RoughnessMap|RoughnessMap]].

#### Current Base

| Material | ColorMap | Normal | Metalness | Roughness |
| --- | --- | --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Asphalt]] | `9930003046` | `9429449876` |  | `9429450346` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Basalt]] | `9920482056` | `9438412214` |  | `9438412457` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Brick]] | `9920482813` | `9438453152` |  | `9438453413` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Cardboard]] | `14108651729` | `14108654002` |  | `14108654299` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Carpet]] | `14108662587` | `14108663154` |  | `14108663726` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|CeramicTiles]] | `17429425079` | `17429425915` | `17429426100` | `17429426861` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|ClayRoofTiles]] | `18147681935` | `18147683410` |  | `18147684855` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Cobblestone]] | `9919718991` | `9438457162` |  | `9438457470` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Concrete]] | `9920484153` | `9466554006` |  | `9466554186` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|CorrodedMetal]] | `9920589327` | `9439548484` | `9439548749` | `9439556441` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|CrackedLava]] | `9920484943` | `9438508790` |  | `9438509046` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|DiamondPlate]] | `10237720195` | `9438583222` | `9438583347` | `9438583558` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Fabric]] | `9920517696` | `9873280412` |  | `9873282563` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Foil]] | `9466552117` | `9424786192` | `9424786272` | `9424786620` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|ForceField]]² |  |  |  |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Glacier]] | `9920518732` | `9438812958` |  | `9438851286` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Glass]]³ | `9438868521` | `7547304785` |  | `7547304892` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Granite]] | `9920550238` | `9438882935` |  | `9438883109` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Grass]] | `9920551868` | `9438955773` |  | `9438955997` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Ground]] | `9920554482` | `9439043558` |  | `9439043765` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Ice]] | `9920555943` | `9467301039` |  | `9467301203` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|LeafyGrass]] | `9920557906` | `9439080781` |  | `9439080950` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Leather]] | `14108670073` | `14108670486` |  | `14108670748` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Limestone]] | `9920561437` | `9439415191` |  | `9439415495` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Marble]] | `9439430596` | `9439431240` |  | `9439431383` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Metal]] | `9920574687` | `9873295432` | `9873318201` | `9873318890` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Mud]] | `9920578473` | `9439509827` |  | `9439510012` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Neon]]² |  |  |  |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Pavement]] | `9920579943` | `9439519281` |  | `9439519532` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Pebble]] | `9920581082` | `9439528644` |  | `9439537267` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Plaster]] | `14108671255` | `14108671870` |  | `14108672378` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Plastic]]² |  |  |  |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Rock]] | `9920587470` | `9439538417` |  | `9439545859` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|RoofShingles]] | `119722544879522` | `77534750680073` |  | `129397260312247` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Rubber]] | `14108673018` | `14108674698` | `14108674894` | `14108675142` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Salt]] | `9920590225` | `9439565809` |  | 9439566688 |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Sand]] | `9920591683` | `9439577084` |  | `9439577327` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Sandstone]] | `9920596120` | `9439596530` |  | `9439596711` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Slate]] | `9920599782` | `9439612514` |  | `9439612733` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|SmoothPlastic]]² |  |  |  |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Snow]] | `9920620284` | `9439632006` |  | `9439632145` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Wood]] | `9920625290` | `9439641376` |  | `9439648605` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|WoodPlanks]] | `9920626778` | `9439650689` |  | `9439658127` |

*² Material is unique and/or its texture assets are bundled with Studio instead of being accessible as a typical asset ID.*

<br>

*³ Refraction of light through the glass material is not supported on mobile devices due to computational limitations.*

<br>

#### Pre-2022 Base

| Material | Color | Normal | Metalness | Roughness |
| --- | --- | --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Brick]] | `7546648254` | `7546649654` |  | `7546650017` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Cobblestone]] | `7546651802` | `7546652689` |  | `7546652892` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Concrete]] | `7546653328` | `7546653707` |  | `7546653868` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|CorrodedMetal]] | `7547183598` | `7547181182` | `7547184321` | `7547184588` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|DiamondPlate]] | `7546654401` | `7546654536` | `7547162002` | `7547162137` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Fabric]] | `7547100606` | `7547100915` |  | `7547101072` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Foil]] | `7546644642` | `7546644903` | `7546644642` | `7546644963` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Glass]] | `7547304577` | `7547304785` |  | `7547304892` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Granite]] | `7547164400` | `7546654648` |  | `7547164660` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Grass]] | `7547167347` | `7547168653` |  | `7547169207` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Ice]] | `7546644642` | `7547171198` |  | `7547171276` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Marble]] | `7547174345` | `7547176060` |  | `7547177213` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Metal]] | `7547178395` | `7547287997` | `7547288112` | `7547179082` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Pebble]] | `7547291174` | `7546645052` |  | `7547291306` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Sand]] | `7547294684` | `7547294810` |  | `7547295087` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Slate]] | `7547297050` | `7547297808` |  | `7547298051` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Wood]] | `7547190453` | `7547190548` | `7547190619` | `7547303147` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|WoodPlanks]] | `7547301709` | `7547188159` | `7547188891` | `7547332869` |

#### Current Terrain

| Material | Terrain Face | Color | Normal | Roughness |
| --- | --- | --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Asphalt]] | Top | `9930003046` | `9429449876` | `9429450346` |
| Side | `9930005689` | `9429465046` | `9429466226` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Basalt]] | (all) | `9920482056` | `9438412214` | `9438412457` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Brick]] | (all) | `9920482813` | `9438453152` | `9438453413` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Cobblestone]] | (all) | `9919718991` | `9438457162` | `9438457470` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Concrete]] | (all) | `9920484153` | `9466554006` | `9466554186` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|CrackedLava]] | (all) | `9920484943` | `9438508790` | `9438509046` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Glacier]] | Top | `9920518732` | `9438812958` | `9438851286` |
| Side | `9920520269` | `9438853412` | `9438853585` |  |
| Bottom | `9920521000` | `9438867267` | `9438867465` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Grass]] | Top | `9920551868` | `9438955773` | `9438955997` |
| Side | `9932815307` | `9438958337` | `9439010060` |  |
| Bottom | `9932815307` | `9439011893` | `9439012136` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Ground]] | (all) | `9920554482` | `9439043558` | `9439043765` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Ice]] | Top | `9920555943` | `9467301039` | `9467301203` |
| Side | `9920556722` | `9439071195` | `9439071371` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|LeafyGrass]] | Top | `9920557906` | `9439080781` | `9439080950` |
| Side | `9932815307` | `9439151713` | `9439151929` |  |
| Bottom | `9932815307` | `9439151713` | `9439151929` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Limestone]] | Top | `9920561437` | `9439415191` | `9439415495` |
| Side | `9920562675` | `9439417923` | `9439418334` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Mud]] | (all) | `9920578473` | `9439509827` | `9439510012` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Pavement]] | Top | `9920579943` | `9439519281` | `9439519532` |
| Side | `9920580293` | `9439527387` | `9439527572` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Rock]] | (all) | `9920587470` | `9439538417` | `9439545859` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Salt]] | Top | `9920590225` | `9439565809` | `9439566688` |
| Side | `9920590689` | `9439568299` | `9439575868` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Sand]] | Top | `9920591683` | `9439577084` | `9439577327` |
| Side | `9920592270` | `9439586304` | `9439593887` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Sandstone]] | Top | `9920596120` | `9439596530` | `9439596711` |
| Side | `9920628274` | `9439605275` | `9439605506` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Slate]] | Top | `9920599782` | `9439612514` | `9439612733` |
| Side | `9920614158` | `9439615040` | `9439621979` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Snow]] | Top | `9920620284` | `9439632006` | `9439632145` |
| Side | `9920620898` | `9439639648` | `9439640077` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|WoodPlanks]] | (all) | `9920626778` | `9439650689` | `9439658127` |

#### Pre-2022 Terrain

| Material | Terrain Face | Color | Normal | Roughness |
| --- | --- | --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Asphalt]] | Top | `7547349715` | `7547350415` | `7551984908` |
| Side | `7551989667` | `7547322693` | `7547350597` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Basalt]] | (all) | `7551975939` | `7547348152` | `7551977581` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Brick]] | (all) | `7547631333` | `7547633037` | `7546657679` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Cobblestone]] | Top | `7551992689` | `7547351364` | `7547351553` |
| Side | `7547648825` | `7547352096` | `7547649793` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Concrete]] | Top | `7547196561` | `7547337919` | `7547197958` |
| Side | `7547628584` | `7547199386` | `7547310473` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|CrackedLava]] | (all) | `7551980711` | `7547320674` | `7551982079` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Glacier]] | Top | `7547646888` | `7551930815` | `7551932698` |
| Side | `7551937696` | `7551940030` | `7551941712` |  |
| Bottom | `7551946144` | `7551948150` | `7551932698` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Grass]] | Top | `7547307376` | `7547336606` | `7547308019` |
| Side | `7547621556` | `7547191705` | `7547622691` |  |
| Bottom | `7551927733` | `7547193357` | `7547625590` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Ground]] | (all) | `7547348623` | `7547348887` | `7547349016` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Ice]] | Top | `7547352634` | `7547651999` | `7547652934` |
| Side | `7547656350` | `7547657495` | `7546663210` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|LeafyGrass]] | Top | `7546663659` | `7546664288` | `7546664614` |
| Side | `7546665232` | `7546666003` | `7546666120` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Limestone]] | Top | `7547206319` | `7547670319` | `7547671387` |
| Side | `7547206579` | `7547674533` | `7547206799` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Mud]] | (all) | `7551972606` | `7552022188` | `7552023936` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Pavement]] | Top | `7547678151` | `7547207799` | `7547207869` |
| Side | `7547680765` | `7547208846` | `7547682025` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Rock]] | (all) | `7546659890` | `7546660701` | `7547643804` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Salt]] | Top | `7546666647` | `7547660879` | `7547661939` |
| Side | `7547665222` | `7547667170` | `7547668252` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Sand]] | Top | `7547635114` | `7547311493` | `7546658153` |
| Side | `7546658461` | `7546659003` | `7546659187` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Sandstone]] | Top | `7547202858` | `7547204511` | `7551954003` |
| Side | `7551958805` | `7551960790` | `7551962377` |  |
| Bottom | `7551967204` | `7551968869` | `7551970693` |  |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Slate]] | (all) | `7547309616` | `7546656859` | `7547626537` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Snow]] | (all) | `7547315875` | `7547201338` | `7547316776` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|WoodPlanks]] | (all) | `7547637836` | `7547639230` | `7547640511` |

### Default colors

The following table lists the default RGB values for each base material. For information on how to color parts and terrain, see [[30 Official Roblox Docs/Parts/Parts#Color|Parts]] and [[30 Official Roblox Docs/Parts/Environmental terrain#Custom terrain colors|Environmental Terrain]].

| Material | RGB Value | Color |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Asphalt]] | `[80, 84, 84]` | `rgb(80,84,84)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Basalt]] | `[75, 74, 74]` | `rgb(75,74,74)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Brick]] | `[138, 97, 73]` | `rgb(138,97,73)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Cardboard]] | `[255, 206, 152]` | `rgb(255,206,152)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Carpet]] | `[163, 162, 165]` | `rgb(163,162,165)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|CeramicTiles]] | `[181, 173, 156]` | `rgb(181,173,156)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|ClayRoofTiles]] | `[255, 142, 87]` | `rgb(255,142,87)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Cobblestone]] | `[134, 134, 118]` | `rgb(134,134,118)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Concrete]] | `[152, 152, 152]` | `rgb(152,152,152)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|CorrodedMetal]] | `[104, 140, 173]` | `rgb(104,140,173)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|CrackedLava]] | `[255, 24, 67]` | `rgb(255,24,67)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|DiamondPlate]] | `[168, 175, 176]` | `rgb(168,175,176)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Fabric]] | `[194, 193, 168]` | `rgb(194,193,168)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Foil]] | `[168, 175, 176]` | `rgb(168,175,176)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|ForceField]] | `[163, 162, 165]` | `rgb(163,162,165)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Glacier]] | `[221, 228, 229]` | `rgb(221,228,229)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Glass]] | `[138, 167, 168]` | `rgb(138,167,168)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Granite]] | `[149, 146, 139]` | `rgb(149,146,139)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Grass]] | `[111, 126, 62]` | `rgb(111,126,62)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Ground]] | `[140, 130, 104]` | `rgb(140,130,104)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Ice]] | `[204, 210, 223]` | `rgb(204,210,223)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|LeafyGrass]] | `[106, 134, 64]` | `rgb(106,134,64)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Leather]] | `[110, 73, 53]` | `rgb(110,73,53)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Limestone]] | `[255, 243, 192]` | `rgb(255,243,192)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Marble]] | `[122, 122, 122]` | `rgb(122,122,122)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Metal]] | `[168, 175, 176]` | `rgb(168,175,176)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Mud]] | `[121, 112, 98]` | `rgb(121,112,98)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Neon]] | `[163, 162, 165]` | `rgb(163,162,165)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Pavement]] | `[143, 144, 135]` | `rgb(143, 144, 135)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Pebble]] | `[122, 122, 118]` | `rgb(122,122,118)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Plaster]] | `[204, 142, 105]` | `rgb(204,142,105)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Plastic]] | `[163, 162, 165]` | `rgb(163,162,165)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Rock]] | `[99, 100, 102]` | `rgb(99,100,102)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|RoofShingles]] | `[66, 66, 66]` | `rgb(66,66,66)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Rubber]] | `[32, 32, 32]` | `rgb(32,32,32)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Salt]] | `[255, 255, 254]` | `rgb(255,255,254)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Sand]] | `[207, 203, 167]` | `rgb(207,203,167)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Sandstone]] | `[148, 124, 95]` | `rgb(148,124,95)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Slate]] | `[88, 89, 86]` | `rgb(88,89,86)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|SmoothPlastic]] | `[163, 162, 165]` | `rgb(163,162,165)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Snow]] | `[235, 253, 255]` | `rgb(235,253,255)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Wood]] | `[172, 148, 108]` | `rgb(172,148,108)` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|WoodPlanks]] | `[172, 148, 108]` | `rgb(172,148,108)` |

### Default physical properties

The following table lists each material's default physical properties as detailed in the [[30 Official Roblox Docs/API Reference/Datatypes/PhysicalProperties|PhysicalProperties]] reference. For information on customizing physical properties, see [[30 Official Roblox Docs/Parts/Materials#Physical properties|physical properties]].

| Material | Density | Elasticity | ElasticityWeight | Friction | FrictionWeight |
| --- | --- | --- | --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Asphalt]] | `2.36` | `0.2` | `1` | `0.8` | `0.3` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Basalt]] | `2.691` | `0.15` | `1` | `0.7` | `0.3` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Brick]] | `1.922` | `0.15` | `1` | `0.8` | `0.3` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Cardboard]] | `0.7` | `0.05` | `2` | `0.5` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Carpet]] | `1.1` | `0.25` | `2` | `0.4` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|CeramicTiles]] | `2.4` | `0.2` | `1` | `0.51` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|ClayRoofTiles]] | `2` | `0.2` | `1` | `0.51` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Cobblestone]] | `2.691` | `0.17` | `1` | `0.5` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Concrete]] | `2.403` | `0.2` | `1` | `0.7` | `0.3` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|CorrodedMetal]] | `7.85` | `0.2` | `1` | `0.7` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|CrackedLava]] | `2.691` | `0.15` | `1` | `0.65` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|DiamondPlate]] | `7.85` | `0.25` | `1` | `0.35` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Fabric]] | `0.7` | `0.05` | `1` | `0.35` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Foil]] | `2.7` | `0.25` | `1` | `0.4` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|ForceField]] | `2.403` | `0.2` | `1` | `0.25` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Glacier]] | `0.919` | `0.15` | `1` | `0.05` | `2` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Glass]] | `2.403` | `0.2` | `1` | `0.25` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Granite]] | `2.691` | `0.2` | `1` | `0.4` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Grass]] | `0.9` | `0.1` | `1.5` | `0.4` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Ground]] | `0.9` | `0.1` | `1` | `0.45` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Ice]] | `0.919` | `0.15` | `1` | `0.02` | `3` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|LeafyGrass]] | `0.9` | `0.1` | `2` | `0.4` | `2` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Leather]] | `0.86` | `0.25` | `1` | `0.35` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Limestone]] | `2.691` | `0.15` | `1` | `0.5` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Marble]] | `2.563` | `0.17` | `1` | `0.2` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Metal]] | `7.85` | `0.25` | `1` | `0.4` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Mud]] | `0.9` | `0.07` | `4` | `0.3` | `3` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Neon]] | `0.7` | `0.2` | `1` | `0.3` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Pavement]] | `2.691` | `0.17` | `1` | `0.5` | `0.3` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Pebble]] | `2.403` | `0.17` | `1.5` | `0.4` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Plaster]] | `0.75` | `0.2` | `1` | `0.6` | `0.3` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Plastic]] | `0.7` | `0.5` | `1` | `0.3` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Rock]] | `2.691` | `0.17` | `1` | `0.5` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|RoofShingles]] | `2.36` | `0.2` | `1` | `0.8` | `0.3` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Rubber]] | `1.3` | `0.95` | `2` | `1.5` | `3` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Salt]] | `2.165` | `0.05` | `1` | `0.5` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Sand]] | `1.602` | `0.05` | `2.5` | `0.5` | `5` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Sandstone]] | `2.691` | `0.15` | `1` | `0.5` | `5` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|SmoothPlastic]] | `0.7` | `0.5` | `1` | `0.2` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Slate]] | `2.691` | `0.2` | `1` | `0.4` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Snow]] | `0.9` | `0.03` | `4` | `0.3` | `3` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|Wood]] | `0.35` | `0.2` | `1` | `0.48` | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/Material\|WoodPlanks]] | `0.35` | `0.2` | `1` | `0.48` | `1` |

---
*Source: [Materials](https://create.roblox.com/docs/parts/materials) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
