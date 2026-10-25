---
title: "TextService"
description: "Service internally responsible for handling the display of text."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TextService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Service internally responsible for handling the display of text.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

`TextService` is internally responsible for handling the display of text.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterAndTranslateStringAsync\|FilterAndTranslateStringAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult\|TextFilterTranslatedResult]] | **Deprecated.** Filters and translates a string. |
| [[30 Official Roblox Docs/API Reference/Classes/TextService#FilterStringAsync\|FilterStringAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult\|TextFilterResult]] | Filters a string being received from a user and returns a |
| [[30 Official Roblox Docs/API Reference/Classes/TextService#GetFamilyInfoAsync\|GetFamilyInfoAsync()]] | Dictionary | Returns a table containing the name and faces of a font family. |
| [[30 Official Roblox Docs/API Reference/Classes/TextService#GetTextBoundsAsync\|GetTextBoundsAsync()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Computes the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] dimensions (in pixels) that will be taken up with text when using a [[30 Official Roblox Docs/API Reference/Classes/GetTextBoundsParams\|GetTextBoundsParams]] object. |
| [[30 Official Roblox Docs/API Reference/Classes/TextService#GetTextSize\|GetTextSize()]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | Computes the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] dimensions (in pixels) that will be taken up with text when using the specified formatting parameters and size constraints. |
| [[30 Official Roblox Docs/API Reference/Classes/TextService#GetTextSizeOffsetAsync\|GetTextSizeOffsetAsync()]] | float | Returns the offset used to up-scale text based on the current [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize\|GuiService.PreferredTextSize]] setting. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### FilterAndTranslateStringAsync

> [!warning] Deprecated
> This method is no longer supported and should not be used. All calls
> return an empty object.

```lua
TextService:FilterAndTranslateStringAsync(stringToFilter: string, fromUserId: int64, targetLocales: Array, textContext: TextFilterContext = PrivateChat): TextFilterTranslatedResult
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Yields`

This method is no longer supported and should not be used. Translating chat messages is only available via [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `stringToFilter` | string |  |  |
| `fromUserId` | int64 |  |  |
| `targetLocales` | Array |  |  |
| `textContext` | [[30 Official Roblox Docs/API Reference/Enums/TextFilterContext\|TextFilterContext]] | `PrivateChat` |  |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextFilterTranslatedResult\|TextFilterTranslatedResult]] |  |

### FilterStringAsync

```lua
TextService:FilterStringAsync(stringToFilter: string, fromUserId: int64, textContext: TextFilterContext = PrivateChat): TextFilterResult
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Yields`

This method filters a string being received from a user and returns a [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult|TextFilterResult]] which can be used to distribute the correctly filtered text accordingly.

This method should be called once each time a user submits a message. If it fails, do not display the text to any user.

See [[30 Official Roblox Docs/UI/Text filtering|text filtering]] for usage guidelines and examples.

#### Notes

- This method always yields to make a text filtering service call.
- This method may throw if there is a service error that cannot be resolved. In such cases, do not retry the request, as this method implements its own retry logic internally.
- This method currently throws if `fromUserId` is not online on the current server.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `stringToFilter` | string |  | The text to be filtered. |
| `fromUserId` | int64 |  | The [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|Player.UserId]] of the player filtering the text. |
| `textContext` | [[30 Official Roblox Docs/API Reference/Enums/TextFilterContext\|TextFilterContext]] | `PrivateChat` | The context that the filtered message will be used in. This parameter does not impact the filtered result of the query and is only used to improve Roblox's text filtering. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult\|TextFilterResult]] | A [[30 Official Roblox Docs/API Reference/Classes/TextFilterResult\|TextFilterResult]] that wraps the filtered text and exposes methods for retrieving it in the form appropriate for each audience. |

*Code samples for this member (`pet-name-filter-example`) are published on the source page; their code is not part of the open-source repo.*

### GetFamilyInfoAsync

```lua
TextService:GetFamilyInfoAsync(assetId: ContentId): Dictionary
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Yields`

Returns a table containing the name and faces of a font family. If the font family has already been loaded by a previous call to `GetFamilyInfoAsync()`, [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#PreloadAsync|ContentProvider:PreloadAsync()]], or a text object with the [[30 Official Roblox Docs/API Reference/Classes/TextLabel#FontFace|TextLabel.FontFace]] property set, then the method returns without yielding.

This method can fail because of network errors and should be wrapped in [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] to catch and handle errors.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `assetId` | ContentId |  | Asset ID of the font family to look up. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | The information about the font family. |

*Code samples for this member (`TextService-GetFamilyInfoAsync-1`) are published on the source page; their code is not part of the open-source repo.*

### GetTextBoundsAsync

```lua
TextService:GetTextBoundsAsync(params: GetTextBoundsParams): Vector2
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Yields`

Computes the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] dimensions (in pixels) that will be taken up with text when using parameters defined in a [[30 Official Roblox Docs/API Reference/Classes/GetTextBoundsParams|GetTextBoundsParams]] object. This method is similar to [[30 Official Roblox Docs/API Reference/Classes/TextService#GetTextSize|GetTextSize()]] but uses the [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]] object which has access to more fonts than [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]].

This method is a useful alternative to the `TextBounds` property of the [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]]/[[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] objects, since `GetTextBoundsAsync()` can calculate the dimensions required by a particular text string in a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] or [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] before such an object is created or text property set.

This is a yielding method because some fonts may need to be loaded in order to measure them. As a result, it should be wrapped in [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] to catch and handle errors. If the font is already loaded, it will not yield; [[30 Official Roblox Docs/API Reference/Classes/ContentProvider#PreloadAsync|ContentProvider:PreloadAsync()]] can be used to make sure a font is loaded.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `params` | [[30 Official Roblox Docs/API Reference/Classes/GetTextBoundsParams\|GetTextBoundsParams]] |  | A reference to a [[30 Official Roblox Docs/API Reference/Classes/GetTextBoundsParams\|GetTextBoundsParams]] object. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The size of the text as a [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]]. |

*Code samples for this member (`TextService-GetTextBoundsAsync-1`) are published on the source page; their code is not part of the open-source repo.*

### GetTextSize

```lua
TextService:GetTextSize(string: string, fontSize: int, font: Enum.Font, frameSize: Vector2): Vector2
```

**Thread safety:** Unsafe · **Capabilities:** UI

Computes the [[30 Official Roblox Docs/API Reference/Datatypes/Vector2|Vector2]] dimensions (in pixels) that will be taken up with text when using the specified formatting parameters and size constraints.

This method is a useful alternative to the `TextBounds` property of the [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]]/[[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] objects, since `GetTextSize()` can calculate the dimensions required by a particular text string in a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] or [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] before such an object is created or text property set.

This method is limited to fonts under [[30 Official Roblox Docs/API Reference/Enums/Font|Enum.Font]]. To access more fonts under [[30 Official Roblox Docs/API Reference/Datatypes/Font|Font]], use [[30 Official Roblox Docs/API Reference/Classes/TextService#GetTextBoundsAsync|GetTextBoundsAsync()]] instead.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `string` | string |  | The string for which the text size is to be calculated. |
| `fontSize` | int |  | The integer representing the font size used. Does not accept an [[30 Official Roblox Docs/API Reference/Enums/FontSize\|Enum.FontSize]] value. |
| `font` | [[30 Official Roblox Docs/API Reference/Enums/Font\|Enum.Font]] |  | The font used. |
| `frameSize` | [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] |  | The [[30 Official Roblox Docs/API Reference/Classes/GuiBase2d#AbsoluteSize\|GuiBase2d.AbsoluteSize]] of the text object to be used. Required to compute how the text will wrap. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Datatypes/Vector2\|Vector2]] | The size of the space required, in pixels, by the string with the specified formatting. |

*Code samples for this member (`textservice-getting-the-text-size`) are published on the source page; their code is not part of the open-source repo.*

### GetTextSizeOffsetAsync

```lua
TextService:GetTextSizeOffsetAsync(fontSize: int, font: Datatype.Font): float
```

**Thread safety:** Unsafe · **Capabilities:** UI · **Tags:** `Yields`

Returns the offset used to up-scale text based on [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize|GuiService.PreferredTextSize]], a property which may change through the player's setting in the Roblox or in‑experience **Settings** menus.

This offset can be used as an additive value to adjust the core height value of a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] or [[30 Official Roblox Docs/API Reference/Classes/TextButton|TextButton]] based on [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize|PreferredTextSize]].

Note that, currently, the `fontSize` and `font` parameters do not affect the outcome and this method returns merely the offset as described above. Also note that this method can fail because of network errors and should be wrapped in [[30 Official Roblox Docs/API Reference/Globals/Luau globals#pcall|pcall()]] to catch and handle errors.

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `fontSize` | int |  | The font size, in offsets. This parameter currently does not affect the returned offset. |
| `font` | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] |  | The font. This parameter currently does not affect the returned offset. |

**Returns**

| Type | Description |
| --- | --- |
| float | The offset, in pixels, to add to the height of a [[30 Official Roblox Docs/API Reference/Classes/TextLabel\|TextLabel]] or [[30 Official Roblox Docs/API Reference/Classes/TextButton\|TextButton]] to up-scale it for the player's current [[30 Official Roblox Docs/API Reference/Classes/GuiService#PreferredTextSize\|PreferredTextSize]] setting. |

*Code samples for this member (`TextService-GetTextSizeOffsetAsync`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [TextService](https://create.roblox.com/docs/reference/engine/classes/TextService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
