---
title: "StudioService"
description: "Provides access to configuration of Roblox Studio and allows importing files from the user's file system."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StudioService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Provides access to configuration of Roblox Studio and allows importing files from the user's file system.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

**StudioService** provides access to configuration of Roblox Studio, allows importing files from the user's file system, and other miscellaneous information. It is intended to be used by [[30 Official Roblox Docs/API Reference/Classes/Plugin|Plugins]] in order to provide a consistent user experience.

- Plugins that allow the user to move objects may find [[30 Official Roblox Docs/API Reference/Classes/StudioService#GridSize|GridSize]], [[30 Official Roblox Docs/API Reference/Classes/StudioService#RotateIncrement|RotateIncrement]] and [[30 Official Roblox Docs/API Reference/Classes/StudioService#UseLocalSpace|UseLocalSpace]] useful.
- Plugins that require the user to import files should use [[30 Official Roblox Docs/API Reference/Classes/StudioService#PromptImportFileAsync|PromptImportFileAsync]] or [[30 Official Roblox Docs/API Reference/Classes/StudioService#PromptImportFilesAsync|PromptImportFilesAsync]] in order to receive [[30 Official Roblox Docs/API Reference/Classes/File|File]] objects.
- Plugins that display icons of Instance classes can use [[30 Official Roblox Docs/API Reference/Classes/StudioService#GetClassIcon|GetClassIcon]].
- Plugins that care about which script is currently being edited (if any) can read this from [[30 Official Roblox Docs/API Reference/Classes/StudioService#ActiveScript|ActiveScript]].

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#ActiveScript\|ActiveScript]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Reflects the [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer\|LuaSourceContainer]] currently being edited (if any). |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#DraggerSolveConstraints\|DraggerSolveConstraints]] | boolean | Reflects whether Studio's draggers solve constraints while moving objects. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#DrawConstraintsOnTop\|DrawConstraintsOnTop]] | boolean | **Deprecated.** Deprecated property that previously controlled whether constraints were drawn on top of other objects in the viewport. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#GridSize\|GridSize]] | float | Determines the distance in studs by which Studio's drag and move tools move objects each tick. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#RotateIncrement\|RotateIncrement]] | float | Determines the degrees by which Studio's rotation tool will rotate selected objects each tick. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#Secrets\|Secrets]] | string | A JSON string storing the local secrets for the current experience, used by Studio to support HttpService:GetSecret(). |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#ShowConstraintDetails\|ShowConstraintDetails]] | boolean | Reflects whether constraint details are drawn in the 3D viewport. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#ShowWeldDetails\|ShowWeldDetails]] | boolean | Reflects whether weld details are drawn in the 3D viewport. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#StudioLocaleId\|StudioLocaleId]] | string | The locale currently in-use by Studio, e.g. `en_US`. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#UseLocalSpace\|UseLocalSpace]] | boolean | Determines whether Studio tools will use local space of an object or global space. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#GetClassIcon\|GetClassIcon()]] | Dictionary | Provides a dictionary that allows the display of a class' Explorer window icon. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#GetUserId\|GetUserId()]] | int64 | Returns the Studio user's userId if they're logged in, otherwise returns 0. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#PromptImportFile\|PromptImportFile()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | **Deprecated.** Prompts the current Studio user to select one file to add as a [[30 Official Roblox Docs/API Reference/Classes/File\|File]]. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#PromptImportFileAsync\|PromptImportFileAsync()]] | [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | Prompts the current Studio user to select one file to add as a [[30 Official Roblox Docs/API Reference/Classes/File\|File]]. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#PromptImportFiles\|PromptImportFiles()]] | Instances | **Deprecated.** Prompts the current Studio user to select files to add as [[30 Official Roblox Docs/API Reference/Classes/File\|Files]]. |
| [[30 Official Roblox Docs/API Reference/Classes/StudioService#PromptImportFilesAsync\|PromptImportFilesAsync()]] | Instances | Prompts the current Studio user to select files to add as [[30 Official Roblox Docs/API Reference/Classes/File\|Files]]. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### ActiveScript

**Type:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]]

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

**ActiveScript** refers to the [[30 Official Roblox Docs/API Reference/Classes/LuaSourceContainer|LuaSourceContainer]] currently being edited by the user. If the user is not editing a script, this will be `nil`. Below is an example that shows how you can use this property to measure for how long a script was active.

*Code samples for this member (`StudioService-ActiveScript`) are published on the source page; their code is not part of the open-source repo.*

### DraggerSolveConstraints

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

Reflects whether Studio's move, scale, and rotate draggers solve constraints while dragging, so that manipulating one part of a constrained mechanism moves the connected parts according to their constraints. This property is read-only and defaults to `false`. Plugins that implement their own dragging tools can read it to match the user's current dragger behavior.

### DrawConstraintsOnTop

> [!warning] Deprecated
> This property is deprecated; constraints can no longer be drawn "on top"
> of other objects.

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`, `Deprecated`

This property is deprecated and no longer has any effect: constraints can no longer be drawn "on top" of other objects in the 3D viewport.

### GridSize

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

**GridSize** determines the distance in studs by which Studio's drag and move tools move objects each tick. This is set in the user's toolbar's **Model** tab.

### RotateIncrement

**Type:** float

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

**RotateIncrement** determines the angle in degrees by which Studio's rotation tool will rotate selected objects each tick. This is set in the user's toolbar's **Model** tab.

### Secrets

**Type:** string

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/true

**Secrets** stores the [[30 Official Roblox Docs/Cloud Services/Secrets stores|local secrets]] configured for the current experience. This property is not accessible to creators; secrets are consumed at runtime through `HttpService:GetSecret()`.

### ShowConstraintDetails

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

Reflects whether Studio draws constraint details in the 3D viewport, mirroring the **Constraint Details** toggle in the toolbar's **Model** tab. When enabled, constraints such as [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] and [[30 Official Roblox Docs/API Reference/Classes/NoCollisionConstraint|NoCollisionConstraints]] are drawn and become selectable in the viewport. This property is read-only and defaults to `false`.

### ShowWeldDetails

**Type:** boolean

**Security:** read RobloxScriptSecurity / write RobloxScriptSecurity · **Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

Reflects whether Studio draws weld details in the 3D viewport. When enabled, [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] between parts are visualized. This property is read-only and defaults to `false`.

### StudioLocaleId

**Type:** string

**Thread safety:** ReadSafe · **Category:** State · **Loaded/Saved:** false/false · **Tags:** `ReadOnly`, `NotReplicated`

The **StudioLocaleId** property contains the locale currently in-use by Studio, e.g. `en_US`. It is useful when localizing plugins.

Below is a trivial example of localization based on the value returned by this function.

*Code samples for this member (`StudioService-StudioLocaleId`) are published on the source page; their code is not part of the open-source repo.*

### UseLocalSpace

**Type:** boolean

**Thread safety:** ReadSafe · **Category:** Data · **Loaded/Saved:** true/false · **Tags:** `NotReplicated`

**UseLocalSpace** determines whether the Studio movement/rotation tools will manipulate a part's [[30 Official Roblox Docs/API Reference/Classes/BasePart#CFrame|CFrame]] using the local space of an object or global space. By default, this setting is toggled with <kbd>Ctrl</kbd><kbd>L</kbd> or <kbd>⌘</kbd><kbd>L</kbd>. Plugins can read from this property if they implement their own object movement tools.

## Methods

### GetClassIcon

```lua
StudioService:GetClassIcon(className: string): Dictionary
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

**GetClassIcon** provides a dictionary that allows the display of a class' Explorer window icon, e.g. calling this function with "Part" returns property values that display the part icon from the Explorer window.

Below is a literal table representation of the value returned when this function is called with `"Part"`.

```
{
	Image = "rbxasset://textures/ClassImages.png",
	ImageRectOffset = Vector2.new(16, 0),
	ImageRectSize = Vector2.new(16, 16)
}
```

The utility function below may prove useful when displaying class icons:

```lua
local StudioService = game:GetService("StudioService")
local imageLabel = script.Parent
local function displayClassIcon(image, className)
	for k, v in StudioService:GetClassIcon(className) do
		image[k] = v -- Set property
	end
end
displayClassIcon(imageLabel, "Part")
```

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `className` | string |  | The name of the Roblox class to retrieve the Explorer window icon for. |

**Returns**

| Type | Description |
| --- | --- |
| Dictionary | A dictionary containing `Image`, `ImageRectOffset`, and `ImageRectSize` fields that can be applied to an [[30 Official Roblox Docs/API Reference/Classes/ImageLabel\|ImageLabel]] to display the class icon. |

### GetUserId

```lua
StudioService:GetUserId(): int64
```

**Security:** PluginSecurity · **Thread safety:** Unsafe

Returns the Studio user's userId if they're logged in, otherwise returns 0.

**Returns**

| Type | Description |
| --- | --- |
| int64 | The UserId of the logged-in Studio user, or 0 if the user is not logged in. |

*Code samples for this member (`studioservice-getuserid`) are published on the source page; their code is not part of the open-source repo.*

### PromptImportFile

> [!warning] Deprecated
> This member is deprecated.

```lua
StudioService:PromptImportFile(fileTypeFilter: Array = {}): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

This function prompts the current Studio user to select one file, which will then be loaded as a [[30 Official Roblox Docs/API Reference/Classes/File|File]].

See also:

- [[30 Official Roblox Docs/API Reference/Classes/StudioService#PromptImportFiles|StudioService:PromptImportFiles()]], the same function but for loading a list of files instead of a single file

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `fileTypeFilter` | Array | `{}` | A list of file types that the user is allowed to select. File types are formatted without a period. For example, jpg", "png would allow only a JPG or PNG file to be selected. If no filter is provided, the filter is `nil` and allows the user to select any file type. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The imported [[30 Official Roblox Docs/API Reference/Classes/File\|File]]. Returns `nil` if no files were selected, or if the selected file was too large (FileSize greater than 100 megabytes). |

### PromptImportFileAsync

```lua
StudioService:PromptImportFileAsync(fileTypeFilter: Array = {}): Instance
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

This function prompts the current Studio user to select one file, which will then be loaded as a [[30 Official Roblox Docs/API Reference/Classes/File|File]].

See also:

- [[30 Official Roblox Docs/API Reference/Classes/StudioService#PromptImportFilesAsync|StudioService:PromptImportFilesAsync()]], the same function but for loading a list of files instead of a single file

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `fileTypeFilter` | Array | `{}` | A list of file types that the user is allowed to select. File types are formatted without a period. For example, jpg", "png would allow only a JPG or PNG file to be selected. If no filter is provided, the filter is `nil` and allows the user to select any file type. |

**Returns**

| Type | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/Instance\|Instance]] | The imported [[30 Official Roblox Docs/API Reference/Classes/File\|File]]. Returns `nil` if no files were selected, or if the selected file was too large (FileSize greater than 100 megabytes). |

### PromptImportFiles

> [!warning] Deprecated
> This member is deprecated.

```lua
StudioService:PromptImportFiles(fileTypeFilter: Array = {}): Instances
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`, `Deprecated`

This function prompts the current Studio user to select one or more files, which will then be loaded as [[30 Official Roblox Docs/API Reference/Classes/File|Files]].

Throws an error if the fileTypeFilter was an empty list.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/StudioService#PromptImportFilesAsync|StudioService:PromptImportFilesAsync()]], the same function but for loading a list of files instead of a single file

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `fileTypeFilter` | Array | `{}` | A list of file types that the user is allowed to select. File types are formatted without a period. For example, jpg", "png would allow only JPG and PNG files to be selected. If no filter is provided, the filter is `nil` and allows the user to select any file type. |

**Returns**

| Type | Description |
| --- | --- |
| Instances | The imported [[30 Official Roblox Docs/API Reference/Classes/File\|Files]]. Returns an empty list if no files were selected. Returns `nil` if the user selected one or more files that were too large (FileSize greater than 100 megabytes). |

### PromptImportFilesAsync

```lua
StudioService:PromptImportFilesAsync(fileTypeFilter: Array = {}): Instances
```

**Security:** PluginSecurity · **Thread safety:** Unsafe · **Tags:** `Yields`

This function prompts the current Studio user to select one or more files, which will then be loaded as [[30 Official Roblox Docs/API Reference/Classes/File|Files]].

Throws an error if the fileTypeFilter was an empty list.

See also:

- [[30 Official Roblox Docs/API Reference/Classes/StudioService#PromptImportFileAsync|StudioService:PromptImportFileAsync()]], the same function but for loading a single file instead of a list of files

**Parameters**

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `fileTypeFilter` | Array | `{}` | A list of file types that the user is allowed to select. File types are formatted without a period. For example, jpg", "png would allow only JPG and PNG files to be selected. If no filter is provided, the filter is `nil` and allows the user to select any file type. |

**Returns**

| Type | Description |
| --- | --- |
| Instances | The imported [[30 Official Roblox Docs/API Reference/Classes/File\|Files]]. Returns an empty list if no files were selected. Returns `nil` if the user selected one or more files that were too large (FileSize greater than 100 megabytes). |

---
*Source: [StudioService](https://create.roblox.com/docs/reference/engine/classes/StudioService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
