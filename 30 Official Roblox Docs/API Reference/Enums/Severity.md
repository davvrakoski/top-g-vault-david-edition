---
title: "Severity"
description: "Classifies the severity level of a Luau LSP diagnostic reported by a Script Analysis callback."
api_type: enum
aliases: ["Enum.Severity"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/Severity"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Classifies the severity level of a Luau LSP diagnostic reported by a Script Analysis callback.*

## Description

`Severity` is used in the diagnostics table returned by Script Analysis callbacks registered with [[30 Official Roblox Docs/API Reference/Classes/ScriptEditorService#RegisterScriptAnalysisCallback|ScriptEditorService:RegisterScriptAnalysisCallback()]]. Each diagnostic entry can include a `severity` field set to one of these values to control how the diagnostic is categorized in the **Script Analysis** tool and how the corresponding source range is highlighted in the Script Editor.

The enum maps directly to the [Language Server Protocol `DiagnosticSeverity` specification](https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#diagnosticSeverity).

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Error` | 1 | Reports a critical error that indicates a definite problem in the script. |
| `Warning` | 2 | Reports a potential problem that can cause incorrect behavior but does not prevent the script from running. |
| `Information` | 3 | Conveys informational context about the script without indicating a problem. |
| `Hint` | 4 | Provides a subtle suggestion, such as a style improvement or an unused-variable notice. |

---
*Source: [Severity](https://create.roblox.com/docs/reference/engine/enums/Severity) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
