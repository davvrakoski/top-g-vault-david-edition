---
title: "SceneAnalysisService"
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/SceneAnalysisService"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Provides programmatic access to the [[30 Official Roblox Docs/Performance Optimization/Scene Analysis|Scene Analysis]] tool's underlying performance data.

## Summary

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/SceneAnalysisService#GetAnimationMemoryAsync\|GetAnimationMemoryAsync()]] | AnimationMemoryResult |  |
| [[30 Official Roblox Docs/API Reference/Classes/SceneAnalysisService#GetAudioMemoryAsync\|GetAudioMemoryAsync()]] | AudioMemoryResult |  |
| [[30 Official Roblox Docs/API Reference/Classes/SceneAnalysisService#GetInstanceCompositionAsync\|GetInstanceCompositionAsync()]] | InstanceCompositionResult |  |
| [[30 Official Roblox Docs/API Reference/Classes/SceneAnalysisService#GetScriptMemoryAsync\|GetScriptMemoryAsync()]] | ScriptMemoryResult |  |
| [[30 Official Roblox Docs/API Reference/Classes/SceneAnalysisService#GetTriangleCompositionAsync\|GetTriangleCompositionAsync()]] | TriangleCompositionResult |  |
| [[30 Official Roblox Docs/API Reference/Classes/SceneAnalysisService#GetUnparentedInstancesAsync\|GetUnparentedInstancesAsync()]] | UnparentedInstancesResult |  |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Methods

### GetAnimationMemoryAsync

```lua
SceneAnalysisService:GetAnimationMemoryAsync(): AnimationMemoryResult
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Returns loaded animation clip memory. The same asset shared by multiple Animators appears only once, with all owners listed.

#### Root dictionary

| Key        | Type   | Description                                                      |
| ---------- | ------ | ---------------------------------------------------------------- |
| `Name`     | string | Always `"AnimationMemory"`.                                      |
| `Size`     | number | Total loaded clip memory in bytes.                               |
| `Children` | array  | Array of clip entries and optionally an out-of-data model group. |

#### Clip entry

Each child in `Children` is either a clip entry or the "not in data model" group (see below).

| Key       | Type   | Description                                                 |
| --------- | ------ | ----------------------------------------------------------- |
| `Name`    | string | The asset ID (e.g. `"rbxassetid://111"`).                   |
| `Size`    | number | Clip memory in bytes.                                       |
| `AssetId` | string | The asset ID string (same value as `Name`).                 |
| `Owners`  | array  | Array of owner entries for all Animators playing this clip. |

#### Owner entry

| Key         | Type   | Description                                                                  |
| ----------- | ------ | ---------------------------------------------------------------------------- |
| `Name`      | string | Full path to the owning Animator (e.g. `"Workspace.NPC.Humanoid.Animator"`). |
| `ClassName` | string | Class name of the owner (e.g. `"Animator"`).                                 |

#### "Not in data model" group

Clips from Animators held only by Lua (not parented in the data model) are collected into a single group entry.

| Key        | Type   | Description                                   |
| ---------- | ------ | --------------------------------------------- |
| `Name`     | string | Always `"Not In DataModel"`.                  |
| `Size`     | number | Sum of clip bytes in this group.              |
| `Children` | array  | Array of clip entries (same schema as above). |

#### Example

```lua
{
  Name = "AnimationMemory",
  Size = 1048576,
  Children = {
    { Name = "rbxassetid://111", Size = 32768, AssetId = "rbxassetid://111",
      Owners = {
        { Name = "Workspace.Player.Humanoid.Animator", ClassName = "Animator" },
    }},
    { Name = "rbxassetid://444", Size = 65536, AssetId = "rbxassetid://444",
      Owners = {
        { Name = "Workspace.NPC1.Humanoid.Animator", ClassName = "Animator" },
        { Name = "Workspace.NPC2.Humanoid.Animator", ClassName = "Animator" },
    }},
    { Name = "Not In DataModel", Size = 32768, Children = {
        { Name = "rbxassetid://555", Size = 32768, AssetId = "rbxassetid://555",
          Owners = {
            { Name = "Animator", ClassName = "Animator" },
        }},
    }},
  }
}
```

**Returns**

| Type | Description |
| --- | --- |
| AnimationMemoryResult | A dictionary tree of loaded animation clip memory, deduplicated by clip. |

### GetAudioMemoryAsync

```lua
SceneAnalysisService:GetAudioMemoryAsync(): AudioMemoryResult
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Returns loaded audio asset memory, deduplicated by asset ID. Assets whose owners share the same parent are organized under that parent path — flattened when there is one child, nested when there are several. Assets whose owners span different parents appear as shared entries with an `Owners` array.

#### Root dictionary

| Key        | Type   | Description                                             |
| ---------- | ------ | ------------------------------------------------------- |
| `Name`     | string | Always `"AudioMemory"`.                                 |
| `Size`     | number | Total loaded audio memory in bytes.                     |
| `Children` | array  | Mix of flat entries, parent groups, and shared entries. |

#### Flat asset entry

Emitted when a parent has exactly one audio child.

| Key       | Type   | Description                                          |
| --------- | ------ | ---------------------------------------------------- |
| `Name`    | string | Full instance path (e.g. `"Workspace.Map.BGMusic"`). |
| `Size`    | number | Asset memory in bytes.                               |
| `AssetId` | string | The audio asset ID.                                  |

#### Parent group

Emitted when a parent has multiple audio children.

| Key        | Type   | Description                                                        |
| ---------- | ------ | ------------------------------------------------------------------ |
| `Name`     | string | Parent path (e.g. `"Workspace.Map.SFX"`).                          |
| `Size`     | number | Sum of child asset bytes.                                          |
| `Children` | array  | Array of flat asset entries (each with `Name`, `Size`, `AssetId`). |

#### Shared asset entry

Emitted when an asset's owners are under different parents.

| Key       | Type   | Description                                 |
| --------- | ------ | ------------------------------------------- |
| `Name`    | string | The asset ID.                               |
| `Size`    | number | Asset memory in bytes.                      |
| `AssetId` | string | The asset ID string (same value as `Name`). |
| `Owners`  | array  | Array of owner entries.                     |

#### Owner entry

| Key         | Type   | Description                                            |
| ----------- | ------ | ------------------------------------------------------ |
| `Name`      | string | Full instance path (e.g. `"Workspace.Zone1.Ambient"`). |
| `ClassName` | string | `"Sound"` or `"AudioPlayer"`.                          |

#### Example

```lua
{
  Name = "AudioMemory",
  Size = 5242880,
  Children = {
    -- Single audio under unique parent (flat)
    { Name = "Workspace.Map.BGMusic", Size = 2097152,
      AssetId = "rbxassetid://111" },

    -- Multiple audio under same parent (grouped)
    { Name = "Workspace.Map.SFX", Size = 1048576, Children = {
        { Name = "Workspace.Map.SFX.Explosion", Size = 524288, AssetId = "rbxassetid://222" },
        { Name = "Workspace.Map.SFX.Gunshot",   Size = 524288, AssetId = "rbxassetid://333" },
    }},

    -- Shared asset (owners in different locations)
    { Name = "rbxassetid://444", Size = 2097152, AssetId = "rbxassetid://444",
      Owners = {
        { Name = "Workspace.Zone1.Ambient", ClassName = "Sound" },
        { Name = "Workspace.Zone2.Ambient", ClassName = "Sound" },
    }},
  }
}
```

**Returns**

| Type | Description |
| --- | --- |
| AudioMemoryResult | A dictionary tree of loaded audio asset memory, deduplicated by asset ID. |

### GetInstanceCompositionAsync

```lua
SceneAnalysisService:GetInstanceCompositionAsync(): InstanceCompositionResult
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Returns instance counts by category and class from the data model tree. Scans descendants of Workspace, Players, Lighting, MaterialService, ReplicatedFirst, ReplicatedStorage, ServerScriptService, ServerStorage, StarterGui, StarterPack, StarterPlayer, Teams, SoundService, and TextChatService. Each instance is classified into one of the categories below based on its class hierarchy.

#### Root dictionary

| Key        | Type   | Description                                       |
| ---------- | ------ | ------------------------------------------------- |
| `Name`     | string | Always `"InstanceComposition"`.                   |
| `Size`     | number | Total instance count across all scanned services. |
| `Children` | array  | Array of category entries.                        |

#### Category entry

| Key        | Type   | Description                       |
| ---------- | ------ | --------------------------------- |
| `Name`     | string | Category name (see table below).  |
| `Size`     | number | Total instances in this category. |
| `Children` | array  | Array of class entries.           |

#### Class entry (leaf)

| Key    | Type   | Description                                            |
| ------ | ------ | ------------------------------------------------------ |
| `Name` | string | The class name (e.g. `"Part"`, `"Script"`, `"Frame"`). |
| `Size` | number | Number of instances of this class.                     |

#### Categories

| Category           | Representative Types                                                                 |
| ------------------ | ------------------------------------------------------------------------------------ |
| 3D Objects         | BasePart, Model, Camera                                                              |
| Physics            | Attachment, Constraint, JointInstance, WeldConstraint, ControllerManager, SensorBase |
| UI                 | GuiBase, BasePlayerGui, UIBase, ProximityPrompt, ClickDetector, TextChannel          |
| Lights             | Light                                                                                |
| PostProcessing     | PostEffect, Highlight, Atmosphere, Sky, Clouds                                       |
| Scripts            | LuaSourceContainer, BindableEvent, RemoteEvent, RemoteFunction                       |
| Audio              | Sound, SoundEffect, AudioPlayer, Wire, SoundGroup, AudioEmitter                      |
| Animation          | Animator, AnimationController, Animation, KeyframeSequence, IKControl                |
| Values             | ValueBase                                                                            |
| Character          | CharacterAppearance, Humanoid, HumanoidDescription, BaseWrap, FaceControls           |
| Textures           | FaceInstance, SurfaceAppearance, MaterialVariant                                     |
| Meshes             | DataModelMesh                                                                        |
| Particles          | ParticleEmitter, Fire, Trail, Beam, Explosion                                        |
| Services & Storage | Player, Folder, Configuration                                                        |
| Misc               | Tool, Backpack, Team, ForceField, PathfindingModifier, PackageLink, HapticEffect     |
| Unclassified       | Anything not matching the above                                                      |

#### Example

```lua
{
  Name = "InstanceComposition",
  Size = 12450,
  Children = {
    { Name = "3D Objects", Size = 5200, Children = {
        { Name = "Part", Size = 3100 },
        { Name = "MeshPart", Size = 1800 },
        { Name = "Model", Size = 300 },
    }},
    { Name = "UI", Size = 2100, Children = {
        { Name = "Frame", Size = 900 },
        { Name = "TextLabel", Size = 700 },
        { Name = "UIListLayout", Size = 500 },
    }},
  }
}
```

**Returns**

| Type | Description |
| --- | --- |
| InstanceCompositionResult | A dictionary tree of instance counts grouped by category and class name. |

### GetScriptMemoryAsync

```lua
SceneAnalysisService:GetScriptMemoryAsync(): ScriptMemoryResult
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Returns per-script Luau VM heap memory usage in bytes. Scripts are grouped first by their containing service (derived from the first segment of the dotted path), then split into `"ModuleScripts"` and `"Scripts"` subgroups based on the instance's class.

#### Root dictionary

| Key        | Type   | Description                        |
| ---------- | ------ | ---------------------------------- |
| `Name`     | string | Always `"ScriptMemory"`.           |
| `Size`     | number | Total Luau VM memory in bytes.     |
| `Children` | array  | Array of service category entries. |

#### Service category entry

| Key        | Type   | Description                                                                  |
| ---------- | ------ | ---------------------------------------------------------------------------- |
| `Name`     | string | Service name (e.g. `"ServerScriptService"`, `"ReplicatedStorage"`).          |
| `Size`     | number | Sum of all script memory in this service, in bytes.                          |
| `Children` | array  | One or two script-type group entries (`"ModuleScripts"` and/or `"Scripts"`). |

#### Script-type group entry

| Key        | Type   | Description                                        |
| ---------- | ------ | -------------------------------------------------- |
| `Name`     | string | Either `"ModuleScripts"` or `"Scripts"`.           |
| `Size`     | number | Sum of memory for scripts in this group, in bytes. |
| `Children` | array  | Array of individual script entries.                |

#### Script entry (leaf)

| Key    | Type   | Description                                                            |
| ------ | ------ | ---------------------------------------------------------------------- |
| `Name` | string | Dotted path to the script (e.g. `"ServerScriptService.Shared.Utils"`). |
| `Size` | number | Heap memory used by this script, in bytes.                             |

#### Example

```lua
{
  Name = "ScriptMemory",
  Size = 8388608,
  Children = {
    { Name = "ServerScriptService", Size = 524288, Children = {
        { Name = "ModuleScripts", Size = 409600, Children = {
            { Name = "ServerScriptService.Shared.Utils", Size = 204800 },
            { Name = "ServerScriptService.Shared.Config", Size = 204800 },
        }},
        { Name = "Scripts", Size = 114688, Children = {
            { Name = "ServerScriptService.MainScript", Size = 114688 },
        }},
    }},
    { Name = "ReplicatedStorage", Size = 262144, Children = {
        { Name = "ModuleScripts", Size = 262144, Children = {
            { Name = "ReplicatedStorage.SharedModule", Size = 262144 },
        }},
    }},
  }
}
```

**Returns**

| Type | Description |
| --- | --- |
| ScriptMemoryResult | A dictionary tree of per-script Luau VM heap memory grouped by service and script type. |

### GetTriangleCompositionAsync

```lua
SceneAnalysisService:GetTriangleCompositionAsync(): TriangleCompositionResult
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Returns triangle and draw call counts by render pass, sourced from `StatsService` performance data. Unlike other queries, this uses a `Sizes` dictionary (with `Triangles` and `Drawcalls` keys) instead of a single `Size` field. Render pass entries with zero triangles and zero draw calls are omitted.

#### Root dictionary

| Key        | Type       | Description                                                            |
| ---------- | ---------- | ---------------------------------------------------------------------- |
| `Name`     | string     | Always `"TriangleComposition"`.                                        |
| `Sizes`    | dictionary | `{ Triangles: number, Drawcalls: number }` — totals across all passes. |
| `Children` | array      | Array of render pass entries.                                          |

#### Render pass entry (leaf)

| Key     | Type       | Description                                               |
| ------- | ---------- | --------------------------------------------------------- |
| `Name`  | string     | Render pass type (see table below).                       |
| `Sizes` | dictionary | `{ Triangles: number, Drawcalls: number }` for this pass. |

#### Render pass types

| Name               | Description                    |
| ------------------ | ------------------------------ |
| Opaque             | Opaque geometry                |
| Transparent        | Transparent geometry           |
| Terrain            | Voxel/smooth terrain           |
| Grass              | Terrain grass decoration       |
| UI                 | Screen-space UI                |
| Decal              | Decal rendering                |
| Cloud              | Volumetric clouds              |
| GenericPostProcess | Generic post-processing        |
| SSAO               | Screen-space ambient occlusion |
| DOF                | Depth of field                 |
| Particles          | Particle systems               |
| Sky                | Skybox                         |
| Shadows            | Shadow map rendering           |
| Undefined          | Uncategorized                  |

#### Example

```lua
{
  Name = "TriangleComposition",
  Sizes = { Triangles = 245000, Drawcalls = 1200 },
  Children = {
    { Name = "Opaque",      Sizes = { Triangles = 180000, Drawcalls = 800 } },
    { Name = "Transparent", Sizes = { Triangles = 25000,  Drawcalls = 150 } },
    { Name = "Shadows",     Sizes = { Triangles = 30000,  Drawcalls = 200 } },
    { Name = "UI",          Sizes = { Triangles = 10000,  Drawcalls = 50  } },
  }
}
```

**Returns**

| Type | Description |
| --- | --- |
| TriangleCompositionResult | A dictionary tree of triangle and draw call counts broken down by render pass type. |

### GetUnparentedInstancesAsync

```lua
SceneAnalysisService:GetUnparentedInstancesAsync(): UnparentedInstancesResult
```

**Thread safety:** Unsafe · **Tags:** `Yields`

Returns instances held by Luau but no longer in the data model, grouped by host script. Each unparented instance is traced back to the script that holds the reference.

Unparented instances that are flagged for garbage collection but not yet deleted are temporarily shown with a parent of `Unknown`. This is a side effect of how garbage collection is intended to work and not indicative of any problems.

#### Root dictionary

| Key        | Type   | Description                          |
| ---------- | ------ | ------------------------------------ |
| `Name`     | string | Always `"UnparentedInstances"`.      |
| `Size`     | number | Total count of unparented instances. |
| `Children` | array  | Array of host script entries.        |

#### Host script entry

| Key        | Type   | Description                                                                                 |
| ---------- | ------ | ------------------------------------------------------------------------------------------- |
| `Name`     | string | Script path (e.g. `"ServerScriptService.Gameplay.Combat"`) or `"(unknown)"` if untraceable. |
| `Size`     | number | Count of unparented instances held by this script.                                          |
| `Children` | array  | Array of class entries.                                                                     |

#### Class entry (leaf)

| Key    | Type   | Description                                                                  |
| ------ | ------ | ---------------------------------------------------------------------------- |
| `Name` | string | Class name of the unparented instance (e.g. `"Part"`, `"Frame"`, `"Sound"`). |
| `Size` | number | Count of unparented instances of this class from this host script.           |

#### Example

```lua
{
  Name = "UnparentedInstances",
  Size = 47,
  Children = {
    { Name = "ServerScriptService.Gameplay.Combat", Size = 30, Children = {
        { Name = "Part", Size = 22 },
        { Name = "Attachment", Size = 8 },
    }},
    { Name = "(unknown)", Size = 17, Children = {
        { Name = "Frame", Size = 12 },
        { Name = "Sound", Size = 5 },
    }},
  }
}
```

**Returns**

| Type | Description |
| --- | --- |
| UnparentedInstancesResult | A dictionary tree of unparented instances grouped by the host script holding the reference. |

---
*Source: [SceneAnalysisService](https://create.roblox.com/docs/reference/engine/classes/SceneAnalysisService) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
