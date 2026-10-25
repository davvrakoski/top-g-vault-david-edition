---
title: "MaterialService"
description: "The game service responsible for managing materials."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/MaterialService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*The game service responsible for managing materials.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`

## Description

MaterialService is the game service responsible for managing materials. It is the container for global [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] instances. [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] can be child or descendant of MaterialService. For each base Material type, MaterialService internally keeps a set of MaterialVariant references. [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|MaterialVariant.Name]] is the key to access it. The [[30 Official Roblox Docs/API Reference/Classes/Instance#Name|MaterialVariant.Name]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] are combined to work as an identifier. If more than one MaterialVariant object has the same name and BaseMaterial under MaterialService, only one of them can be used.

MaterialService has some (Material)Name properties. Assigning a MaterialVariant Name replaces the built-in material with the specified MaterialVariant. If the MaterialService can't find a matching MaterialVariant, it falls back to built-in material. Note BaseMaterial should also match, for example, a MaterialVariant with BaseMaterial Grass can only be assigned to MaterialService.GrassName, not AsphaltName or any other names. These properties are not scriptable but can read and write using [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] function.

MaterialService has a [[30 Official Roblox Docs/API Reference/Classes/MaterialService#Use2022Materials|MaterialService.Use2022Materials]] property that switches between legacy materials and new materials introduced in year 2022. Because legacy and user-generated (new) terrain materials use different encoding, using legacy terrain materials and MaterialVariant at the same time has a performance penalty. If your game is using pre-2022 terrain materials, avoid overriding any built-in materials. Migrate to 2022 materials if possible.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#AsphaltName\|AsphaltName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Asphalt. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#BasaltName\|BasaltName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Basalt. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#BrickName\|BrickName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Brick. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#CardboardName\|CardboardName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Cardboard. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#CarpetName\|CarpetName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Carpet. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#CeramicTilesName\|CeramicTilesName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in CeramicTiles. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#ClayRoofTilesName\|ClayRoofTilesName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in ClayRoofTiles. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#CobblestoneName\|CobblestoneName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Cobblestone. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#ConcreteName\|ConcreteName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Concrete. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#CorrodedMetalName\|CorrodedMetalName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in CorrodedMetal. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#CrackedLavaName\|CrackedLavaName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in CrackedLava. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#DiamondPlateName\|DiamondPlateName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in DiamondPlate. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#FabricName\|FabricName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Fabric. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#FoilName\|FoilName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Foil. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GlacierName\|GlacierName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Glacier. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GraniteName\|GraniteName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Granite. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GrassName\|GrassName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Grass. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GroundName\|GroundName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Ground. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#IceName\|IceName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Ice. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#LeafyGrassName\|LeafyGrassName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in LeafyGrass. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#LeatherName\|LeatherName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Leather. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#LimestoneName\|LimestoneName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Limestone. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#MarbleName\|MarbleName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Marble. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#MetalName\|MetalName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Metal. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#MudName\|MudName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Mud. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#PavementName\|PavementName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Pavement. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#PebbleName\|PebbleName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Pebble. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#PlasterName\|PlasterName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Plaster. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#PlasticName\|PlasticName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Plastic. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#RockName\|RockName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Rock. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#RoofShinglesName\|RoofShinglesName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in RoofShingles. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#RubberName\|RubberName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Rubber. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SaltName\|SaltName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Salt. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SandName\|SandName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Sand. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SandstoneName\|SandstoneName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Sandstone. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SlateName\|SlateName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Slate. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SmoothPlasticName\|SmoothPlasticName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in SmoothPlastic. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SnowName\|SnowName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Snow. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#Use2022Materials\|Use2022Materials]] | boolean | Switch built-in material pack. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#WoodName\|WoodName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in Wood. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#WoodPlanksName\|WoodPlanksName]] | string | Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name to override built-in WoodPlanks. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride\|GetBaseMaterialOverride()]] | string | Get the override [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name of specified Material type. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetMaterialVariant\|GetMaterialVariant()]] | [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] | Get the effective MaterialVariant reference given a name and Material. |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride\|SetBaseMaterialOverride()]] | () | Set a [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] name that overrides a built-in material. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### AsphaltName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Asphalt. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Asphalt. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### BasaltName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Basalt. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Basalt. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### BrickName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Brick. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Brick. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### CardboardName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Cardboard. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Cardboard. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### CarpetName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Carpet. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Carpet. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### CeramicTilesName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in CeramicTiles. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to CeramicTiles. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### ClayRoofTilesName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in ClayRoofTiles. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to ClayRoofTiles. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### CobblestoneName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Cobblestone. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Cobblestone. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### ConcreteName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Concrete. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Concrete. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### CorrodedMetalName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in CorrodedMetal. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to CorrodedMetal. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### CrackedLavaName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in CrackedLava. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to CrackedLava. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### DiamondPlateName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in DiamondPlate. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to DiamondPlate. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### FabricName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Fabric. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Fabric. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### FoilName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Foil. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Foil. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### GlacierName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Glacier. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Glacier. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### GraniteName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Granite. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Granite. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### GrassName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Grass. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Grass. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### GroundName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Ground. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Ground. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### IceName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Ice. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Ice. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### LeafyGrassName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in LeafyGrass. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to LeafyGrass. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### LeatherName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Leather. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Leather. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### LimestoneName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Limestone. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Limestone. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### MarbleName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Marble. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Marble. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### MetalName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Metal. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Metal. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### MudName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Mud. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Mud. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### PavementName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Pavement. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Pavement. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### PebbleName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Pebble. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Pebble. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### PlasterName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Plaster. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Plaster. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### PlasticName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Plastic. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Plastic. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### RockName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Rock. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Rock. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### RoofShinglesName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in RoofShingles. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to RoofShingles. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### RubberName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Rubber. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Rubber. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### SaltName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Salt. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Salt. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### SandName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Sand. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Sand. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### SandstoneName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Sandstone. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Sandstone. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### SlateName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Slate. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Slate. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### SmoothPlasticName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in SmoothPlastic. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to SmoothPlastic. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### SnowName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Snow. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Snow. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### Use2022Materials

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Material Pack · **Loaded/Saved:** false/false · **Capabilities:** Material · **Tags:** `NotReplicated`

When it's false, built-in materials use the material pack before 2022. When it's true, built-in materials use the material pack released in 2022.

### WoodName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in Wood. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to Wood. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

### WoodPlanksName

**Type:** string

**Security:** read RobloxEngineSecurity / write RobloxEngineSecurity · **Thread safety:** ReadSafe · **Category:** Material Overrides · **Loaded/Saved:** true/true · **Capabilities:** Material · **Tags:** `NotScriptable`

Specify [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name to override built-in WoodPlanks. The Specified MaterialVariant must have [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant#BaseMaterial|MaterialVariant.BaseMaterial]] set to WoodPlanks. This property is not scriptable; use [[30 Official Roblox Docs/API Reference/Classes/MaterialService#GetBaseMaterialOverride|MaterialService:GetBaseMaterialOverride()]] and [[30 Official Roblox Docs/API Reference/Classes/MaterialService#SetBaseMaterialOverride|MaterialService:SetBaseMaterialOverride()]] to access it from scripts.

## Methods

### GetBaseMaterialOverride

```lua
MaterialService:GetBaseMaterialOverride(material: Material): string
```

**Thread safety:** Unsafe · **Capabilities:** Material

Get the override [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name of specified Material type.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] |  | Material type to be fetched. |

**Returns**

| Type | Description |
| --- | --- |
| string | MaterialVariant name currently set as override. |

### GetMaterialVariant

```lua
MaterialService:GetMaterialVariant(material: Material, name: string): MaterialVariant
```

**Thread safety:** Unsafe · **Capabilities:** Material

Get the effective MaterialVariant reference given a MaterialVariant name and BaseMaterial. This MaterialVariant must be a descendant of MaterialService. Returns `nil` if no matching instance exists.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] |  | BaseMaterial of MaterialVariant. |
| `name` | string |  | Name of MaterialVariant. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant\|MaterialVariant]] | A MaterialVariant instance that matches parameters. |

### SetBaseMaterialOverride

```lua
MaterialService:SetBaseMaterialOverride(material: Material, name: string): ()
```

**Thread safety:** Unsafe · **Capabilities:** Material

Set a [[30 Official Roblox Docs/API Reference/Classes/MaterialVariant|MaterialVariant]] name that overrides a built-in material.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `material` | [[30 Official Roblox Docs/API Reference/Enums/Material\|Material]] |  | The Material type to be changed. |
| `name` | string |  | Name of the MaterialVariant object. |

**Returns**

| Type | Description |
| --- | --- |
| () |  |

---
*Source: [MaterialService](https://create.roblox.com/docs/reference/engine/classes/MaterialService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
