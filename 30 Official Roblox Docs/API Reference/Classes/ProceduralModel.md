---
title: "ProceduralModel"
description: "Procedural models support edit-time procedural generation. Instead of manually constructing model content, a procedural model generates its contents automatically in response to parameter changes."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/ProceduralModel"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Procedural models support edit-time procedural generation. Instead of manually constructing model content, a procedural model generates its contents automatically in response to parameter changes.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] → [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]] → [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** BaseParts

## Description

`ProceduralModel` inherits from [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] and supports edit-time procedural generation of its contents. Instead of manually constructing model content, a procedural model generates its contents automatically in response to parameter changes.

Generation is defined by a **generator module**, a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] referenced by the [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel#Generator|Generator]] property. The engine invokes the module's `OnGenerate` function to produce the model's contents.

A procedural model regenerates when any of the following inputs change:

- The [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel#Size|Size]] property of the procedural model, which defines a bounding box for the model to generate within.
- Any attributes on the procedural mode, as defined by the generator module.
- The generator's module sandboxing configuration (`Sandboxed` and `Capabilities`).
- The source code of the generator module.

When any of these inputs change, the engine schedules regeneration. This scheduled regeneration is performed by calling `OnGenerate` and applying its results once it returns. In most cases, generation happens within the same frame, but can be deferred to maintain performance.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel#GenerationError\|GenerationError]] | string | Stores errors that the generator module might encounter during generation. |
| [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel#Generator\|Generator]] | [[30 Official Roblox Docs/API Reference/Classes/ModuleScript\|ModuleScript]] | A reference to a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript\|ModuleScript]] that contains code which defines how the `ProceduralModel` generates its contents in response to parameter changes. |
| [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel#Size\|Size]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Defines the bounding volume used for generation. |

### Methods

| Method | Returns | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel#ForceGeneration\|ForceGeneration()]] | boolean | Immediately runs any pending generation instead of waiting for the scheduled regeneration. |
| [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel#WaitForGenerationAsync\|WaitForGenerationAsync()]] | boolean | Waits for generation to complete after making parameter changes. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], [[30 Official Roblox Docs/API Reference/Classes/PVInstance|PVInstance]], [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### GenerationError

**Type:** string

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

If the generator module encounters an error during generation, the contents of the `ProceduralModel` are replaced with an error state placeholder. The error is stored in the `GenerationError` property to give you visibility into why the generation failed.

### Generator

**Type:** [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]]

**Thread safety:** ReadSafe · **Category:** Behavior · **Loaded/Saved:** true/true · **Capabilities:** Basic

A reference to a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] containing code that defines how the `ProceduralModel` generates its contents in response to parameter changes.

Setting `Generator` triggers generation using the new generator module. The `Attributes` table exported by the module is automatically applied as default attribute values on the `ProceduralModel`.

Clearing `Generator` preserves the current contents of the `ProceduralModel`, and prevents further generation until a new generator is assigned.

Guidelines for writing the generator module's `OnGenerate` function:

- Only write results into the provided `targetContainer`. `OnGenerate` should not modify the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] directly; writes elsewhere may not interact correctly with engine systems.
- `OnGenerate` is allowed to yield and call yielding methods (for example, [[30 Official Roblox Docs/API Reference/Classes/GeometryService|GeometryService]] CSG APIs). Generation is considered complete whenever `OnGenerate` returns.
- Calling `parameters:Pause()` inside long-running loops lets the engine break up work. It only yields when needed to avoid dropping frames, so calls are low-cost when the frame budget is not exceeded.

*Code samples for this member (`ProceduralModel-Generator-Default`, `ProceduralModel-Generator-Ladder`) are published on the source page; their code is not part of the open-source repo.*

### Size

**Type:** [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]]

**Thread safety:** ReadSafe · **Category:** Transform · **Loaded/Saved:** true/true · **Capabilities:** Basic

The `Size` of a `ProceduralModel` defines the bounding volume used for generation.

In a standard model, size is a derived output value based on its contents and can be queried using [[30 Official Roblox Docs/API Reference/Classes/Model#GetBoundingBox|GetBoundingBox()]]. A procedural model inverts this relationship: `Size` is an **input** that determines how generation occurs, and is explicitly set as a property.

The `Size` property represents the **physical** dimensions of the `ProceduralModel` and is affected by [[30 Official Roblox Docs/API Reference/Classes/Model#ScaleTo|ScaleTo]]. The `OnGenerate` function in a generator module doesn't need to account for position or scaling: it produces a result of the specified `Size` around the origin at a scale of 1, and the procedural model system automatically uses [[30 Official Roblox Docs/API Reference/Classes/PVInstance#PivotTo|PivotTo()]] and [[30 Official Roblox Docs/API Reference/Classes/Model#ScaleTo|ScaleTo()]] to place and scale the output in the `ProceduralModel`.

## Methods

### ForceGeneration

```lua
ProceduralModel:ForceGeneration(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Basic

Generation is normally scheduled soon after a parameter changes so work can be deferred for performance. `ForceGeneration()` instead runs any pending generation synchronously and returns whether the [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel|ProceduralModel]] is up to date.

If nothing is pending, returns `true` without regenerating. Otherwise runs the generator to completion under a hard timeout, then returns `true` only if the model is no longer waiting to regenerate and produced no [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel#GenerationError|GenerationError]]. On failure or timeout, returns `false` and re-queues normal scheduled generation. Unlike scheduled generation, a forced generation doesn't yield to preserve the frame budget, so `parameters:Pause()` inside the generator returns without pausing.

Throws if called from within a generator's `OnGenerate` function.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Whether the `ProceduralModel` is up to date after the call: `true` if generation completed successfully or nothing needed to be regenerated, `false` otherwise. |

### WaitForGenerationAsync

```lua
ProceduralModel:WaitForGenerationAsync(): boolean
```

**Thread safety:** Unsafe · **Capabilities:** Basic · **Tags:** `Yields`

Generation is scheduled to run as soon as possible after a parameter changes, but not immediately. Use `WaitForGenerationAsync()` to wait for generation to complete before parameters are changed.

This method errors if called on a [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel|ProceduralModel]] that is not in the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] because generation isn't performed for instances without a parent.

This method returns `false` if the [[30 Official Roblox Docs/API Reference/Classes/ProceduralModel|ProceduralModel]] is removed from the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]] while generation is in progress, since this cancels the operation.

**Returns**

| Type | Description |
| --- | --- |
| boolean | Was the generation successful? |

*Code samples for this member (`ProceduralModel-WaitForGenerationAsync`) are published on the source page; their code is not part of the open-source repo.*

---
*Source: [ProceduralModel](https://create.roblox.com/docs/reference/engine/classes/ProceduralModel) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
