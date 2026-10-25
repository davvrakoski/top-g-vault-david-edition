---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - Azul - Studio-First Two-Way Sync for VS Code (GPL-3.0)"
tags: [roblox, community-knowledge, studio, external-editor, sync, vscode, open-source]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/Ransomwave/azul
  - https://azul.ransomwave.games
  - https://create.roblox.com/docs/scripting/sync
---
# Studio Tools - Azul - Studio-First Two-Way Sync for VS Code (GPL-3.0)

Rojo assumes **the files are the truth** and Studio is a mirror. That is great for code-heavy teams and painful for builders, whose game lives in Studio as thousands of parts, not as JSON. **Azul** turns this around: **Studio is the source of truth**, and your folder is a live 1:1 mirror of the DataModel. You still get VS Code, luau-lsp type checking, Git diffs of scripts and AI coding agents working on real files, without "Rojo-ifying" an existing place. This note covers what it is, how to set it up, and where it fits next to Rojo, Argon and Studio's Script Sync.

## Facts (checked 2026-10-25)

| Item | Value |
| --- | --- |
| Repo | https://github.com/Ransomwave/azul (created Dec 2025, active: last push 2026-10-25) |
| License | **GPL-3.0**. Fine to **use** as a tool; **link only**, don't copy its code into your own plugins or games |
| Install | Node.js, then `npm install azul-sync -g`, plus the **Azul Companion Plugin** in Studio |
| Docs | https://azul.ransomwave.games |

## What it does

- **Two-way sync**: Studio changes update the files; file edits update Studio.
- **DataModel mirroring**: the instance tree maps 1:1 to folders. No project file and no required structure, so it works on old places as they are.
- `azul build`: push your local files into Studio (rebuild from Git).
- `azul push`: push selected files, for example packages installed with **Wally** or pesde.
- `azul pack`: serialise instance properties for repeatable builds (the README calls these "hermetic builds").
- **Console streaming**: the Studio output appears in your terminal during playtests, with tracebacks pointing at local files.
- **Rojo compatibility**: import Rojo projects with `--rojo` / `--rojo-project <file>`.
- **Writes a Rojo-style `sourcemap.json`**, so luau-lsp understands `script.Parent.Module` paths.

## Setup in five minutes

1. Install Node.js LTS and run `npm install azul-sync -g`.
2. Install the companion plugin (see the repo's plugin install guide). Check the plugin's creator against the repo before you click Install ([[Plugin and Free Model Safety Checklist]]).
3. Make an empty folder for the project, open it in VS Code, and run `azul` in its terminal.
4. In Studio, click **Connect** in the Azul plugin. The folder fills with your place's scripts and hierarchy.
5. In VS Code, install the **Luau Language Server** extension. The README suggests these user settings: `luau-lsp.plugin.enabled: true`, `luau-lsp.sourcemap.enabled: true`, `luau-lsp.sourcemap.autogenerate: false`, `luau-lsp.sourcemap.sourcemapFile: "sourcemap.json"`, `luau-lsp.sourcemap.includeNonScripts: true`.

## Choosing a sync tool

| Tool | Source of truth | Best for | Covered in |
| --- | --- | --- | --- |
| **Rojo** | Files | Code-first teams, CI builds, open-source libraries | [[Rojo, VS Code and luau-lsp - Local Setup from Zero]] |
| **Argon** | Files, two-way | Rojo-style projects with sync back from Studio | [[Argon - Two-Way Sync Alternative to Rojo]] |
| **Script Sync** (built in) | Both, selected scripts/folders | Small edits in an external editor with no extra installs | [[Script Sync vs Rojo — 2026 Decision Guide]] |
| **Azul** | **Studio** | Builder-heavy places, existing games, AI agents editing scripts in a Studio-first project | this note |

## Good habits

- **Commit the mirror to Git** often. You get a readable history of every script, even though the map stays in Studio.
- Keep the place in **version history** as well. Azul mirrors the hierarchy, but large binary content (meshes, terrain) stays in the place ([[Saving and Version History - Never Lose a Place]]).
- **One sync tool per place.** Running Rojo and Azul (or Script Sync) on the same scripts at once causes edit fights.
- Pair it with an AI agent carefully: an agent editing files that sync live into Studio is changing your place. Use a test place first ([[Claude and the Roblox Studio MCP Server - Responsible Setup]]).

## Risks

- Young project (about 10 months old). Pin a version (`npm install azul-sync@<version> -g`) for team consistency (unverified that older versions stay on npm).
- A Studio plugin that syncs to a local server needs a lot of trust. It reads and writes your scripts. Prefer the official plugin linked from the repo.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Git for Roblox Repos - .gitignore, Binary Places and LFS]] · [[Wally Package Manager - Manifest, Realms and Commands]] · [[Moving an Existing Place to Rojo - syncback and rbxlx-to-rojo]]
