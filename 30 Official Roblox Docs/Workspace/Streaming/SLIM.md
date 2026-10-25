---
title: "SLIM"
description: "SLIM (Scalable Lightweight Interactive Models) automatically generates optimized, cloud-transcoded representations of models and avatars for improved performance and visual quality."
area: "30 Official Roblox Docs"
cluster: "Workspace"
source: "https://create.roblox.com/docs/workspace/streaming/slim"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*SLIM (Scalable Lightweight Interactive Models) automatically generates optimized, cloud-transcoded representations of models and avatars for improved performance and visual quality.*

**SLIM** (Scalable Lightweight Interactive Models) is an automatic optimization system that generates lightweight, optimized representations of [[30 Official Roblox Docs/API Reference/Classes/Model|Models]] and platform avatars using cloud-based transcoding (converting assets into more efficient formats). When enabled, SLIM combines multiple parts into fewer draw calls (rendering commands sent to the GPU) and generates multiple levels of detail, allowing the engine to intelligently select the best representation based on distance, device capability, and available resources.

*(image in the full Top G Vault)*

*Without SLIM — streamed-out models are invisible*

*(image in the full Top G Vault)*

*With SLIM — optimized stand-ins remain visible*

SLIM provides three key benefits:

- **Visual quality** — Distant models appear more detailed than the legacy model level‑of‑detail system, maintaining closer fidelity to the original.
- **Consistent transitions** — All parts within a model switch detail levels simultaneously, eliminating jarring per-part transitions.
- **Performance** — Composite meshes dramatically reduce draw calls, triangle counts, and memory usage, enabling richer scenes across all device tiers.

Explore SLIM in these published games:

[*(image in the full Top G Vault)*](https://www.roblox.com/games/135885449743134/CPC-Slim-Template)

*[**City People Cars SLIM Template**](https://www.roblox.com/games/135885449743134/CPC-Slim-Template) — World models with SLIM enabled*

[*(image in the full Top G Vault)*](https://www.roblox.com/games/81704282913046/SLIM-Platform-Avatars)

*[**SLIM Platform Avatars**](https://www.roblox.com/games/81704282913046/SLIM-Platform-Avatars) — 200 animated avatars rendered with SLIM*

## Prerequisites

SLIM requires the following:

1. [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|StreamingEnabled]] must be enabled on the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] object. See also [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Streaming properties|streaming properties]] for related recommended settings.
2. The place must be **saved to Roblox** (not a local `.rbxl` file), as SLIM uses cloud transcoding to generate optimized assets. If you're testing locally, publish the place and then enable SLIM.
3. [[30 Official Roblox Docs/Projects/Collaboration|Team Create]] must be enabled for the game, as SLIM relies on associated properties for cloud asset generation.

## Technical behavior

When you publish or playtest a game with SLIM-enabled models, the engine uploads model data to a cloud service that generates optimized composite meshes with multiple levels of detail. At runtime, clients fetch these assets from the CDN and the engine selects the appropriate detail level based on distance and device capability, classifying each SLIM model into rendering zones based on distance from the camera:

*(image in the full Top G Vault)*

| Range | Data Model State | Rendering |
| --- | --- | --- |
| `rgb(86,180,233)` | Full instances streamed in. | Traditional part-by-part rendering. |
| `rgb(0,158,115)` | Full instances streamed in. | The engine renders the SLIM composite when more efficient. |
| `rgb(240,228,66)` | Instances streamed out. Only a minimal placeholder exists in the [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]], not the full model hierarchy. | SLIM composite rendering. |
| `rgb(213,94,0)` | Minimal placeholder in the [[30 Official Roblox Docs/API Reference/Classes/DataModel\|DataModel]]. | Not rendered. |

## SLIM for models

SLIM works best on models that represent **static world geometry** — buildings, props, vehicles, terrain features, and other environment objects that don't change at/during runtime. Adding or removing parts, changing materials, or modifying geometry at runtime prevents SLIM from rendering the model correctly. See [[30 Official Roblox Docs/Workspace/Streaming/Techniques and conversion#Model structure|model structure]] for general model structure guidance and [[30 Official Roblox Docs/Workspace/Streaming/SLIM#Limitations|limitations]] for the full list of exclusions.

To enable SLIM on a model, set its [[30 Official Roblox Docs/API Reference/Classes/Model#LevelOfDetail|LevelOfDetail]] property to [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|SLIM]] in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

*(image in the full Top G Vault)*

When SLIM is set on a model, the engine:

1. Serializes the model's rendering-relevant properties (geometry, materials, textures, transforms) into a compact representation. Supported instance types within the model include [[30 Official Roblox Docs/API Reference/Classes/Part|Part]], [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], [[30 Official Roblox Docs/API Reference/Classes/Decal|Decal]], [[30 Official Roblox Docs/API Reference/Classes/Texture|Texture]], [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]], [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]], [[30 Official Roblox Docs/API Reference/Classes/NegateOperation|NegateOperation]], and [[30 Official Roblox Docs/API Reference/Classes/SpecialMesh|SpecialMesh]].
2. Uploads this data to the cloud transcoding service on first publish or play.
3. The cloud service generates a composited mesh with multiple levels of detail, removing hidden internal geometry and optimizing textures.
4. At runtime, clients fetch the optimized SLIM asset and render it when the engine streams out the original model or when SLIM is more efficient than the full model.

> [!info]
> Initial SLIM generation might take a few moments for complex models. The cloud service processes assets in the background, so if a model doesn't appear as SLIM immediately after enabling, wait 1–2 minutes and rejoin; the transcoded asset persists on the CDN and the client fetches it on the next session.

> [!note]- **Converting from Streaming Mesh**
> If your game uses the legacy [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|StreamingMesh]] setting for [[30 Official Roblox Docs/API Reference/Classes/Model#LevelOfDetail|Model.LevelOfDetail]], you can convert individual models by selecting them and changing the property in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, or you can batch-convert multiple models at once using a script like the following in the [[30 Official Roblox Docs/Studio/Studio interface#Command Bar|Command Bar]]. Note that some models which worked with [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|StreamingMesh]] might need adjustments for SLIM, particularly those with overlapping parts or complex [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] hierarchies.
>
> ```lua title="Batch-Convert StreamingMesh to SLIM"
> for _, descendant in workspace:GetDescendants() do
>     if descendant:IsA("Model") and descendant.LevelOfDetail ==
>         Enum.ModelLevelOfDetail.StreamingMesh then
>         descendant.LevelOfDetail = Enum.ModelLevelOfDetail.SLIM
>     end
> end
> ```

## SLIM for avatars

Platform avatars outside of the currently streamed area are not visible by default. Enabling SLIM avatars renders [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications|standard]] player characters — regardless of how many accessories or clothing layers they have — as lightweight, animated stand‑ins that maintain visual fidelity at a fraction of the rendering cost.

### Audience in Far Distance

*(image in the full Top G Vault)*

> [!success] SLIM Enabled
> **~170,000 triangles**<br>
> **~4,000 client instances**

*(image in the full Top G Vault)*

> [!danger] SLIM Disabled
> **~2,600,000 triangles**<br>
> **~60,000 client instances**

### Audience in Near Proximity

*(image in the full Top G Vault)*

> [!success] SLIM Enabled
> **~100,000 triangles**<br>
> **~31,000 client instances**

*(image in the full Top G Vault)*

> [!danger] SLIM Disabled
> **~670,000 triangles**<br>
> **~60,000 client instances**

<br>

The key SLIM-specific property for avatars is [[30 Official Roblox Docs/API Reference/Classes/Workspace#EnableSLIMAvatars|Workspace.EnableSLIMAvatars]] which should be set to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enabled]] in the **Properties** window, alongside [[30 Official Roblox Docs/API Reference/Classes/Model#LevelOfDetail|LevelOfDetail]] set to [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|SLIM]] on your non‑avatar world models.

*(image in the full Top G Vault)*

With [[30 Official Roblox Docs/API Reference/Classes/Workspace#EnableSLIMAvatars|EnableSLIMAvatars]] enabled, the engine:

- Renders a SLIM version when an actual avatar model streams out.
- Swaps between SLIM and full-resolution representations based on available resources, even inside the streaming radius.
- Throttles SLIM animations based on scene importance and available bandwidth.

> [!success] Supported Avatars
> - R15 avatars with a body, dynamic head, [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Standard R15 rigs|standard]] or [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Advanced R15 rigs|advanced]] R15 rig, and rigid/layered accessories.
> - Avatar changes made between the [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAdded|CharacterAdded]] event and [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAppearanceLoaded|CharacterAppearanceLoaded]] event.
> - Avatars defined by `StarterHumanoid` or `StarterCharacter` under the [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] service.

> [!danger] Excluded Avatars
> - R6 avatars.
> - NPC characters (even those with a standard or advanced R15 rig).
> - Avatars with custom proportions, body scaling, or experience-applied avatar settings.
> - Avatar changes made after the [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAppearanceLoaded|CharacterAppearanceLoaded]] event (equipping tools, accessory changes, [[30 Official Roblox Docs/API Reference/Classes/Highlight|Highlight]] additions, etc.).
> - Avatar changes made by [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]].

> [!note]- **Testing SLIM Avatars**
> Unlike [[30 Official Roblox Docs/Workspace/Streaming/SLIM#SLIM for models|model SLIM]] which you can test alone by moving far from a model until it streams out, SLIM avatars require multiple players in the game to observe. Use one of these [[30 Official Roblox Docs/Studio/Studio testing modes|testing modes]] to test SLIM avatars:
>
> - [[30 Official Roblox Docs/Studio/Studio testing modes#Collaborative testing|Team Test]] — Join with friends or alternate accounts to see SLIM avatars at distance.
> - [[30 Official Roblox Docs/Studio/Studio testing modes#Multi-client simulation|Server and Clients]] — Launch two or more client windows where each client displays avatar copies that the others render as SLIM when at distance.
>
> Note that avatars must have been transcoded in a SLIM-enabled game before they appear as SLIM. If avatars don't render as SLIM in your first test, rejoin the game after a moment to allow transcoding to complete.

## Limitations

| Limitation | Details |
| --- | --- |
| **Streaming required** | SLIM only functions with [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled\|StreamingEnabled]] set to `true`. Without streaming, SLIM‑eligible models fall back to traditional level‑of‑detail rendering. |
| **Static models only** | [[30 Official Roblox Docs/Workspace/Streaming/SLIM#SLIM for models\|Model SLIM]] does not support models modified at runtime (parts added/removed, properties changed) or models that play animations. |
| **Humanoid instances** | The engine excludes models containing a [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] from static [[30 Official Roblox Docs/Workspace/Streaming/SLIM#SLIM for models\|model SLIM]] processing. Use [[30 Official Roblox Docs/Workspace/Streaming/SLIM#SLIM for avatars\|SLIM avatars]] for animated player characters. |
| **Avatar restrictions** | [[30 Official Roblox Docs/Workspace/Streaming/SLIM#SLIM for avatars\|SLIM avatars]] only support R15 player characters. R6 rigs, NPCs, and avatars with custom proportions fall back to default rendering. |
| **Cloud dependency** | The cloud service generates and stores SLIM assets on the CDN. Offline or local testing without a published place does not produce SLIM results. |
| **Zero-scale models** | The engine excludes models with a [[30 Official Roblox Docs/API Reference/Classes/Model#Scale\|Scale]] of `0` from SLIM processing. |
| **Platform availability** | On platforms where SLIM is not yet supported, models set to [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail\|SLIM]] fall back to [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail\|Disabled]]. |

## Debugging

To better understand the status of SLIM models, Roblox provides several **debug tint modes** in the **DebugVisualizations** ⟩ **SlimTintMode** dropdown of the [[30 Official Roblox Docs/Studio/Developer Console|Developer Console]]. Note that this menu is only available to creators who have **Edit** permissions for the game.

*(image in the full Top G Vault)*

There are multiple tint modes to select from. See [[30 Official Roblox Docs/API Reference/Enums/SlimTintMode|Enum.SlimTintMode]] for the color mappings of each mode.

### LOD

[[30 Official Roblox Docs/API Reference/Enums/SlimTintMode|LOD]] colors each mesh by its current level of detail using a blue-to-red heatmap. Blue indicates the lowest detail and warmer colors indicate higher detail.

[Video: SLIM-Tint-Mode-LOD.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/optimization/debug-visualizations/SLIM-Tint-Mode-LOD.mp4)

### Data Model State

[[30 Official Roblox Docs/API Reference/Enums/SlimTintMode|DataModelState]] colors meshes by streaming state of the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]]. Teal indicates the high-fidelity zone where the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] is present; yellow indicates the low-fidelity zone where the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] is absent.

[Video: SLIM-Tint-Mode-DataModel.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/optimization/debug-visualizations/SLIM-Tint-Mode-DataModel.mp4)

<br>

You can also see SLIM debug visualizations in Studio by selecting a tint mode from the [[30 Official Roblox Docs/Studio/Studio interface#Visualization options|Visualization Options]] menu:

*(image in the full Top G Vault)*

In addition to the [[30 Official Roblox Docs/API Reference/Enums/SlimTintMode|LOD]]/[[30 Official Roblox Docs/API Reference/Enums/SlimTintMode|DataModelState]] tint modes, Studio offers the [[30 Official Roblox Docs/API Reference/Enums/SlimTintMode|TranscoderStatus]] tint mode. While editing, only this tint mode is available in the visualization options menu; while playing, all the tint modes are available. See [[30 Official Roblox Docs/API Reference/Enums/SlimTranscoderStatus|Enum.SlimTranscoderStatus]] for the color mappings of each status.

[Video: SLIM-Tint-Mode-Transcoder.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/optimization/debug-visualizations/SLIM-Tint-Mode-Transcoder.mp4)

## Troubleshooting

> [!note]- **SLIM model not appearing**
> - Verify that [[30 Official Roblox Docs/API Reference/Classes/Workspace#StreamingEnabled|StreamingEnabled]] is `true`.
> - Confirm the place is published to Roblox and [[30 Official Roblox Docs/Projects/Collaboration|Team Create]] is enabled.
> - Check that [[30 Official Roblox Docs/API Reference/Classes/Model#LevelOfDetail|LevelOfDetail]] is set to [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|SLIM]] for the model.
> - Wait 1–2 minutes after first publish for cloud transcoding to complete, then rejoin.
> - Ensure the model doesn't contain a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] instance.

> [!note]- **Solid modeling operations not rendering correctly in SLIM**
> [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] instances for [[30 Official Roblox Docs/Parts/Solid modeling|solid modeling]] (unions, intersections, negations) might not render correctly in some SLIM models. If a union appears missing or distorted in the SLIM representation, try separating the affected [[30 Official Roblox Docs/API Reference/Classes/PartOperation|PartOperation]] into its own model or simplifying the CSG operation.

> [!note]- **Z-fighting or flickering on SLIM models**
> Z-fighting can occur when parts in the original model have overlapping or coplanar faces. To resolve:
>
> - Move overlapping parts slightly apart (even `0.01` studs is sufficient).
> - Avoid perfectly flush surfaces between adjacent parts in the same model.

> [!note]- **Texture or UV shifts on SLIM models**
> SLIM regenerates UV mappings (how textures are projected onto 3D surfaces) during transcoding. Default Roblox materials might show slightly different tiling patterns compared to the original. To mitigate:
>
> - Use custom textures via [[30 Official Roblox Docs/API Reference/Classes/SurfaceAppearance|SurfaceAppearance]] for important surfaces.
> - Group visually related parts into the same model to ensure consistent texturing.

> [!note]- **SLIM avatars not rendering**
> - Verify [[30 Official Roblox Docs/API Reference/Classes/Workspace#EnableSLIMAvatars|Workspace.EnableSLIMAvatars]] is set to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enabled]].
> - Test with multiple clients using [[30 Official Roblox Docs/Studio/Studio testing modes#Multi-client simulation|Server and Clients]] test mode (requires at least 2 clients).
> - Ensure the avatar uses a [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Standard R15 rigs|standard]] or [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Advanced R15 rigs|advanced]] R15 rig without custom proportions.
> - Confirm the game doesn't modify the avatar after the [[30 Official Roblox Docs/API Reference/Classes/Player#CharacterAppearanceLoaded|Player.CharacterAppearanceLoaded]] event.

> [!note]- **Visual glitches on animated SLIM avatars**
> Full-body or finger animations might occasionally show visual artifacts due to bone replication timing. This is a known issue being actively improved. If the issue is severe, verify that animation scripts aren't modifying bone transforms outside of the standard animation pipeline.

> [!note]- **Inaccurate triangle count in rendering stats**
> The rendering stats panel might report incorrect triangle counts when SLIM avatars are enabled. This is a known reporting bug and does not affect actual rendering performance.

---
*Source: [SLIM](https://create.roblox.com/docs/workspace/streaming/slim) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
