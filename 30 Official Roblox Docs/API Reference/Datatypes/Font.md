---
title: "Font"
description: "Describes the font used to render text."
api_type: datatype
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/datatypes/Font"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/datatype]
cssclasses: [tg-a30]
---

*Describes the font used to render text.*

## Description

Describes the font used to render text. Every font consists of a **font family**, a **weight** like [Enum.FontWeight.Bold](https://create.roblox.com/docs/reference/engine/enums/FontWeight), and a **style** like [[30 Official Roblox Docs/API Reference/Enums/FontStyle|Enum.FontStyle.Italic]].

Font families are a type of asset, like images or meshes. Each font family contains a number of font faces, and each face has a different weight and style.

[[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]] is used by the [[30 Official Roblox Docs/API Reference/Classes/TextLabel#FontFace|TextLabel.FontFace]], [[30 Official Roblox Docs/API Reference/Classes/TextButton#FontFace|TextButton.FontFace]], [[30 Official Roblox Docs/API Reference/Classes/TextBox#FontFace|TextBox.FontFace]], and similar properties. See also [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]] as an older alternative to this datatype that is required by some methods and properties.

| Name | Asset ID / Weights / Appearance |
| --- | --- |
| Accanthis ADF Std | `rbxasset://fonts/families/AccanthisADFStd.json`<br><br>*(image in the full Top G Vault)* |
| Amatic SC | `rbxasset://fonts/families/AmaticSC.json`<br><br>*(image in the full Top G Vault)* |
| Arimo | `rbxasset://fonts/families/Arimo.json`<br><br>*(image in the full Top G Vault)* |
| Balthazar | `rbxasset://fonts/families/Balthazar.json`<br><br>*(image in the full Top G Vault)* |
| Bangers | `rbxasset://fonts/families/Bangers.json`<br><br>*(image in the full Top G Vault)* |
| Builder Extended | `rbxasset://fonts/families/BuilderExtended.json`<br><br>*(image in the full Top G Vault)* |
| Builder Mono | `rbxasset://fonts/families/BuilderMono.json`<br><br>*(image in the full Top G Vault)* |
| Builder Sans | `rbxasset://fonts/families/BuilderSans.json`<br><br>*(image in the full Top G Vault)* |
| Comic Neue Angular | `rbxasset://fonts/families/ComicNeueAngular.json`<br><br>*(image in the full Top G Vault)* |
| Creepster | `rbxasset://fonts/families/Creepster.json`<br><br>*(image in the full Top G Vault)* |
| Denk One | `rbxasset://fonts/families/DenkOne.json`<br><br>*(image in the full Top G Vault)* |
| Fondamento | `rbxasset://fonts/families/Fondamento.json`<br><br>*(image in the full Top G Vault)* |
| Fredoka One | `rbxasset://fonts/families/FredokaOne.json`<br><br>*(image in the full Top G Vault)* |
| Grenze Gotisch | `rbxasset://fonts/families/GrenzeGotisch.json`<br><br>*(image in the full Top G Vault)* |
| Guru | `rbxasset://fonts/families/Guru.json`<br><br>*(image in the full Top G Vault)* |
| Highway Gothic | `rbxasset://fonts/families/HighwayGothic.json`<br><br>*(image in the full Top G Vault)* |
| Inconsolata | `rbxasset://fonts/families/Inconsolata.json`<br><br>*(image in the full Top G Vault)* |
| Indie Flower | `rbxasset://fonts/families/IndieFlower.json`<br><br>*(image in the full Top G Vault)* |
| Josefin Sans | `rbxasset://fonts/families/JosefinSans.json`<br><br>*(image in the full Top G Vault)* |
| Jura | `rbxasset://fonts/families/Jura.json`<br><br>*(image in the full Top G Vault)* |
| Kalam | `rbxasset://fonts/families/Kalam.json`<br><br>*(image in the full Top G Vault)* |
| Luckiest Guy | `rbxasset://fonts/families/LuckiestGuy.json`<br><br>*(image in the full Top G Vault)* |
| Merriweather | `rbxasset://fonts/families/Merriweather.json`<br><br>*(image in the full Top G Vault)* |
| Michroma | `rbxasset://fonts/families/Michroma.json`<br><br>*(image in the full Top G Vault)* |
| Montserrat | `rbxasset://fonts/families/Montserrat.json`<br><br>*(image in the full Top G Vault)* |
| Nunito | `rbxasset://fonts/families/Nunito.json`<br><br>*(image in the full Top G Vault)* |
| Oswald | `rbxasset://fonts/families/Oswald.json`<br><br>*(image in the full Top G Vault)* |
| Patrick Hand | `rbxasset://fonts/families/PatrickHand.json`<br><br>*(image in the full Top G Vault)* |
| Permanent Marker | `rbxasset://fonts/families/PermanentMarker.json`<br><br>*(image in the full Top G Vault)* |
| Press Start 2P | `rbxasset://fonts/families/PressStart2P.json`<br><br>*(image in the full Top G Vault)* |
| Roboto | `rbxasset://fonts/families/Roboto.json`<br><br>*(image in the full Top G Vault)* |
| Roboto Condensed | `rbxasset://fonts/families/RobotoCondensed.json`<br><br>*(image in the full Top G Vault)* |
| Roboto Mono | `rbxasset://fonts/families/RobotoMono.json`<br><br>*(image in the full Top G Vault)* |
| Roman Antique | `rbxasset://fonts/families/RomanAntique.json`<br><br>*(image in the full Top G Vault)* |
| Sarpanch | `rbxasset://fonts/families/Sarpanch.json`<br><br>*(image in the full Top G Vault)* |
| Source Sans Pro | `rbxasset://fonts/families/SourceSansPro.json`<br><br>*(image in the full Top G Vault)* |
| Special Elite | `rbxasset://fonts/families/SpecialElite.json`<br><br>*(image in the full Top G Vault)* |
| Titillium Web | `rbxasset://fonts/families/TitilliumWeb.json`<br><br>*(image in the full Top G Vault)* |
| Ubuntu | `rbxasset://fonts/families/Ubuntu.json`<br><br>*(image in the full Top G Vault)* |
| Zekton | `rbxasset://fonts/families/Zekton.json`<br><br>*(image in the full Top G Vault)* |

## Summary

### Constructors

| Constructor | Parameters | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Font#new\|new()]] | `family`, `weight`, `style` | Creates a new [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]]. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Font#fromEnum\|fromEnum()]] | `font` | Creates a [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] from an [[30 Official Roblox Docs/API Reference/Enums/Font\|Enum.Font]] value. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Font#fromName\|fromName()]] | `name`, `weight`, `style` | Creates a [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] from a name like `FredokaOne`. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Font#fromId\|fromId()]] | `id`, `weight`, `style` | Creates a [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] from a numerical asset ID. |

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Font#Family\|Family]] | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] | The asset ID for the font family. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Font#Weight\|Weight]] | FontWeight | How thick the text is. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Font#Style\|Style]] | [[30 Official Roblox Docs/API Reference/Enums/FontStyle\|FontStyle]] | Whether the font is italic. |
| [[30 Official Roblox Docs/API Reference/Datatypes/Font#Bold\|Bold]] | bool | Whether the font is bold. |

## Constructors

### new

```lua
Font.new(family: Content, weight: FontWeight = Enum.FontWeight.Regular, style: FontStyle = Enum.FontStyle.Normal): Font
```

Creates a new [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `family` | [[30 Official Roblox Docs/API Reference/Datatypes/Content\|Content]] |  | The asset ID for the font family, starting with `rbxasset://` or `rbxassetid://`. |
| `weight` | FontWeight | `Enum.FontWeight.Regular` | How thick the text is. |
| `style` | [[30 Official Roblox Docs/API Reference/Enums/FontStyle\|FontStyle]] | `Enum.FontStyle.Normal` | Whether the text is normal or italic. |

*Code samples for this member (`datatype-Font-new`) are published on the source page; their code is not part of the open-source repo.*

### fromEnum

```lua
Font.fromEnum(font: Font): Font
```

Creates a [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]] from an [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]] value. Throws an error when called with [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font.Unknown]].

The following table indicates how each [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]] value maps to a font [[30 Official Roblox Docs/API Reference/Datatypes/Font#Family|Family]].

| Font Enums | Equivalent Family |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|AmaticSC]] | `rbxasset://fonts/families/AmaticSC.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Antique]] | `rbxasset://fonts/families/RomanAntique.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Arcade]] | `rbxasset://fonts/families/PressStart2P.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Arimo]], [[30 Official Roblox Docs/API Reference/Enums/Font\|ArimoBold]] | `rbxasset://fonts/families/Arimo.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Bangers]] | `rbxasset://fonts/families/Bangers.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Bodoni]] | `rbxasset://fonts/families/AccanthisADFStd.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|BuilderSans]], [[30 Official Roblox Docs/API Reference/Enums/Font\|BuilderSansMedium]], [[30 Official Roblox Docs/API Reference/Enums/Font\|BuilderSansBold]], [[30 Official Roblox Docs/API Reference/Enums/Font\|BuilderSansExtraBold]] | `rbxasset://fonts/families/BuilderSans.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Cartoon]] | `rbxasset://fonts/families/ComicNeueAngular.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Code]] | `rbxasset://fonts/families/Inconsolata.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Creepster]] | `rbxasset://fonts/families/Creepster.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|DenkOne]] | `rbxasset://fonts/families/DenkOne.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Fantasy]] | `rbxasset://fonts/families/Balthazar.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Fondamento]] | `rbxasset://fonts/families/Fondamento.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|FredokaOne]] | `rbxasset://fonts/families/FredokaOne.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Garamond]] | `rbxasset://fonts/families/Guru.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|GrenzeGotisch]] | `rbxasset://fonts/families/GrenzeGotisch.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Highway]] | `rbxasset://fonts/families/HighwayGothic.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|IndieFlower]] | `rbxasset://fonts/families/IndieFlower.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|JosefinSans]] | `rbxasset://fonts/families/JosefinSans.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Jura]] | `rbxasset://fonts/families/Jura.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Kalam]] | `rbxasset://fonts/families/Kalam.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Legacy]] | `rbxasset://fonts/families/LegacyArial.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|LuckiestGuy]] | `rbxasset://fonts/families/LuckiestGuy.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Merriweather]] | `rbxasset://fonts/families/Merriweather.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Michroma]] | `rbxasset://fonts/families/Michroma.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Nunito]] | `rbxasset://fonts/families/Nunito.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Oswald]] | `rbxasset://fonts/families/Oswald.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|PatrickHand]] | `rbxasset://fonts/families/PatrickHand.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|PermanentMarker]] | `rbxasset://fonts/families/PermanentMarker.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Roboto]] | `rbxasset://fonts/families/Roboto.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|RobotoCondensed]] | `rbxasset://fonts/families/RobotoCondensed.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|RobotoMono]] | `rbxasset://fonts/families/RobotoMono.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Sarpanch]] | `rbxasset://fonts/families/Sarpanch.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|SciFi]] | `rbxasset://fonts/families/Zekton.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|SourceSans]], [[30 Official Roblox Docs/API Reference/Enums/Font\|SourceSansBold]], [[30 Official Roblox Docs/API Reference/Enums/Font\|SourceSansItalic]], [[30 Official Roblox Docs/API Reference/Enums/Font\|SourceSansLight]], [[30 Official Roblox Docs/API Reference/Enums/Font\|SourceSansSemibold]] | `rbxasset://fonts/families/SourceSansPro.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|SpecialElite]] | `rbxasset://fonts/families/SpecialElite.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|TitilliumWeb]] | `rbxasset://fonts/families/TitilliumWeb.json` |
| [[30 Official Roblox Docs/API Reference/Enums/Font\|Ubuntu]] | `rbxasset://fonts/families/Ubuntu.json` |

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `font` | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] |  | The enum value of the font to use. |

*Code samples for this member (`datatype-Font-fromEnum`) are published on the source page; their code is not part of the open-source repo.*

### fromName

```lua
Font.fromName(name: string, weight: FontWeight = Enum.FontWeight.Regular, style: FontStyle = Enum.FontStyle.Normal): Font
```

This is a convenience method for creating fonts from the content folder. The name you pass in will be converted into an asset ID like `rbxasset://fonts/families/BuilderSans.json`.

The name can only contain alphabetical characters, digits, `_` (underscore), and `-` (hyphen). It can't contain any spaces.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `name` | string |  | The name of the font. |
| `weight` | FontWeight | `Enum.FontWeight.Regular` | How thick the text is. |
| `style` | [[30 Official Roblox Docs/API Reference/Enums/FontStyle\|FontStyle]] | `Enum.FontStyle.Normal` | Whether the text is normal or italic. |

*Code samples for this member (`datatype-Font-fromName`) are published on the source page; their code is not part of the open-source repo.*

### fromId

```lua
Font.fromId(id: number, weight: FontWeight = Enum.FontWeight.Regular, style: FontStyle = Enum.FontStyle.Normal): Font
```

This is a convenience method for creating fonts from an asset ID number.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `id` | number |  | The asset ID of the font as a number. |
| `weight` | FontWeight | `Enum.FontWeight.Regular` | How thick the text is. |
| `style` | [[30 Official Roblox Docs/API Reference/Enums/FontStyle\|FontStyle]] | `Enum.FontStyle.Normal` | Whether the text is normal or italic. |

*Code samples for this member (`datatype-Font-fromId`) are published on the source page; their code is not part of the open-source repo.*

## Properties

### Family

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Content|Content]]

The asset ID for the font family. These start with either `rbxasset://` or `rbxassetid://`.

### Weight

**Type:** FontWeight

How thick the text is. The default value is [Enum.FontWeight.Regular](https://create.roblox.com/docs/reference/engine/enums/FontWeight).

When set, [[30 Official Roblox Docs/API Reference/Datatypes/Font#Bold|Font.Bold]] is updated and becomes `true` if the weight is [Enum.FontWeight.SemiBold](https://create.roblox.com/docs/reference/engine/enums/FontWeight) or thicker.

### Style

**Type:** [[30 Official Roblox Docs/API Reference/Enums/FontStyle|FontStyle]]

Whether the font is italic. The default value is [[30 Official Roblox Docs/API Reference/Enums/FontStyle|Enum.FontStyle.Normal]].

### Bold

**Type:** bool

Whether the font is bold. Sets [[30 Official Roblox Docs/API Reference/Datatypes/Font#Weight|Font.Weight]] to [Enum.FontWeight.Bold](https://create.roblox.com/docs/reference/engine/enums/FontWeight) when `true`, or to [Enum.FontWeight.Regular](https://create.roblox.com/docs/reference/engine/enums/FontWeight) otherwise.

---
*Source: [Font](https://create.roblox.com/docs/reference/engine/datatypes/Font) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
