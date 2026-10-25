---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Roblox Built-in AI Tools Timeline 2023-2026 - What Exists and When It Shipped"
tags: [roblox, community-knowledge, ai-workflow, assistant, cube, timeline]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/material-generator-beta/2224446
  - https://devforum.roblox.com/t/what-we-announced-at-rdc-2023/2585405
  - https://devforum.roblox.com/t/texture-generator-beta/2880635
  - https://devforum.roblox.com/t/weekly-recap-gdc-2025-edition/3560345
  - https://about.roblox.com/newsroom/2025/03/introducing-roblox-cube
  - https://github.com/Roblox/cube
  - https://create.roblox.com/docs/ai-data-sharing
  - https://create.roblox.com/docs/studio/script-editor
  - https://create.roblox.com/docs/ai/accelerated-workflows
---
# Roblox Built-in AI Tools Timeline 2023-2026 - What Exists and When It Shipped

Roblox ships AI features fast and renames them often, so tutorials from even a year ago describe menus that moved. This note is a dated map of the first-party AI tools, so you can tell whether a guide is current and know which official doc to open. For *how to use* each tool, follow the links; the per-tool guides already live in the vault.

## Timeline (first public appearance)

| When | Tool | What it does | Status then |
|---|---|---|---|
| Mar 2023 (GDC) | **Code Assist** | Inline code suggestions in the Script Editor from your comments and code | Beta |
| Mar 2023 (GDC) | **Material Generator** | Text prompt to MaterialVariant (color, normal, roughness), 512x512 at launch | Beta |
| Sep 2023 (RDC) | **Assistant** announced | Conversational AI in Studio and Creator Hub; docs answers, scripts, building | Announced, no date |
| Mar 2024 (GDC) | **Texture Generator** | Text prompt to a 1024x1024 texture on a MeshPart (beta post said 5 full textures per day) | Beta |
| Mar 2024 | **Avatar Auto Setup** | Rigs, cages and skins a mesh into an avatar | Alpha/beta (see official doc) |
| Jul 10 2024 | **AI data sharing** settings | Publish dialog toggle; on by default for content published from this date | Live |
| Mar 2025 (GDC) | **Cube 3D v0.1** | Open-weights text-to-shape model; Mesh Generation API beta; Assistant `/generate` | Beta |
| Mar 2025 (GDC) | **Text Generation API** (`TextGenerator`) | LLM text for NPC dialogue inside games | Beta |
| Mar 2025 | **Assistant updates** | Review script changes before apply, undo/redo, script debugging | Rolling out |
| Jul 2025 | **Cube 3D v0.5** | Bounding-box conditioning, better compositions | Open weights update |
| 2025-2026 | **Studio as MCP server** | Outside AI clients (Claude, Cursor, etc.) read and edit the DataModel via MCP | Beta toggle in Assistant menu |
| May 2026 | **CubePart** | Part-aware 3D generation: one mesh per part in a schema | Open release on GitHub |

Exact day-level launch dates for the Assistant beta and the Studio MCP server were not confirmed in this pass (unverified); check the DevForum Announcements category.

## Where each tool lives today (2026 docs)

- **Assistant**: Studio panel; supports Skills, planning mode and MCP server management. See [[Roblox Assistant Skills and Planning Mode - Team Setup]].
- **Studio MCP**: Assistant panel, `...` menu, **Manage MCP Servers**, toggle **Enable Studio as MCP server**; features in beta are under **File > Beta Features**. See [[Claude and the Roblox Studio MCP Server - Responsible Setup]].
- **Material and Texture Generators**: Studio (Texture Generator moved from the Model tab in the beta to **Window > 3D** in current docs). See [[Art - Studio AI Material and Texture Generators - Choosing, Prompting and Cleaning Up]].
- **Cube / Mesh generation**: Assistant `/generate` in Studio, plus `GenerationService` for in-game generation. See [[Model - AI 3D Generators Compared - Roblox Cube, Meshy and Tripo - Cleanup and Licence Caveats]].
- **TextGenerator**: runtime class with `SystemPrompt`, `Temperature`, `TopP`, `Seed` and `GenerateTextAsync`; requests start at 100 per minute and scale with concurrent users. See [[LLM NPC Dialogue with TextGenerator]].

## Licence notes worth knowing

- **Cube 3D v0.1 weights on GitHub** are under the *Cube3D Research-Only RAIL-MS License*: academic and research purposes only, with use restrictions. Using Cube **inside Roblox Studio** is a different thing (Roblox's terms apply). Do not take the open weights into a commercial pipeline outside Roblox without reading the licence. Link only, not bundle-safe.
- **Code Assist privacy**: the Script Editor docs say your code is not used to train the model, with the exception of code posted to free marketplace items.
- **Data sharing**: free Creator Store assets are always shared for training; games and paid assets follow your toggle. Removed data leaves the training set within 30 days; trained models update within 365 days.

## How to read an old tutorial

1. Check the date. Anything before Mar 2025 predates Cube, TextGenerator and Assistant code review.
2. If a menu path does not exist, search the official doc in `30 Official Roblox Docs/` by tool name.
3. If a feature is "beta", look under **File > Beta Features** first.

## Related
[[Claude MCP AI Workflow - Hub]] · [[Moving from studio-rust-mcp-server to the Built-in Studio MCP]] · [[Policy - Generative AI in Games - Disclosure and Maturity Rules]]
