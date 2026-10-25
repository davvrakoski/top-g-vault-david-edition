---
title: "SolverConvergenceVisualizationMode"
description: "Controls whether and at what granularity the physics solver's convergence quality is overlaid as a debug visualization in Studio."
api_type: enum
aliases: ["Enum.SolverConvergenceVisualizationMode"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SolverConvergenceVisualizationMode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Controls whether and at what granularity the physics solver's convergence quality is overlaid as a debug visualization in Studio.*

## Description

Controls whether and at what granularity the physics solver's convergence quality is overlaid as a 3D debug visualization in Roblox Studio. When active, constraint edges connecting assembly root bodies are drawn as colored cylinders; the worst-ranked edge within each simulation island is drawn in red, while all remaining edges stay green. This visualization is only rendered in Studio (not in published experiences). The metric used to rank convergence is selected separately via [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#SolverConvergenceMetricType|PhysicsSettings.SolverConvergenceMetricType]]. Defaults to [[30 Official Roblox Docs/API Reference/Enums/SolverConvergenceVisualizationMode|Enum.SolverConvergenceVisualizationMode.Disabled]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Disabled` | 0 | No solver convergence visualization is rendered; the default state. |
| `PerIsland` | 1 | Renders a single convergence metric label at the center of each simulation island displaying the velocity-stage and position-stage maxima, which may come from different constraints. |
| `PerEdge` | 2 | Renders convergence metrics as text labels on each aggregated body-pair edge between assembly root bodies. |

---
*Source: [SolverConvergenceVisualizationMode](https://create.roblox.com/docs/reference/engine/enums/SolverConvergenceVisualizationMode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
