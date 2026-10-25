---
title: "SolverConvergenceMetricType"
description: "Specifies the metric used to identify the least-converged constraint when visualizing physics solver convergence."
api_type: enum
aliases: ["Enum.SolverConvergenceMetricType"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/SolverConvergenceMetricType"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Specifies the metric used to identify the least-converged constraint when visualizing physics solver convergence.*

## Description

Specifies the metric used to determine which constraint is least converged within a solver island when [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#SolverConvergenceVisualizationMode|PhysicsSettings.SolverConvergenceVisualizationMode]] is active. The selected metric controls what data is gathered per constraint and displayed in the per-edge and per-island overlay. The default value, stored on [[30 Official Roblox Docs/API Reference/Classes/PhysicsSettings#SolverConvergenceMetricType|PhysicsSettings.SolverConvergenceMetricType]], is [[30 Official Roblox Docs/API Reference/Enums/SolverConvergenceMetricType|Enum.SolverConvergenceMetricType.AlgorithmAgnostic]].

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `IterationBased` | 0 | Identifies the least-converged constraint using the estimated force change from an additional, non-applied solver iteration. |
| `AlgorithmAgnostic` | 1 | Identifies the least-converged constraint using a residual-based convergence metric supported across solver algorithms. |

---
*Source: [SolverConvergenceMetricType](https://create.roblox.com/docs/reference/engine/enums/SolverConvergenceMetricType) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
