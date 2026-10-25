---
area: "15 AI Tools and Workflow"
cluster: "Git Version Control"
title: "Rojo, VS Code and luau-lsp - Local Setup from Zero"
tags: [roblox, community-knowledge, rojo, vscode, luau-lsp, tooling, setup]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://rojo.space/docs/v7/getting-started/installation/
  - https://rojo.space/docs/v7/sync-details/
  - https://github.com/JohnnyMorganz/luau-lsp
  - https://create.roblox.com/docs/scripting/sync
---
# Rojo, VS Code and luau-lsp - Local Setup from Zero

Writing Roblox code in VS Code gives you Git, real search, multi-cursor editing, AI agents in the terminal, and type checking that understands your whole game tree. The classic stack is **Rojo** (syncs files into Studio), the **luau-lsp** language server (autocomplete, types, diagnostics), and a toolchain manager to pin versions. Roblox's built-in **Script Sync** is now an alternative to Rojo for scripts ([[Script Sync vs Rojo — 2026 Decision Guide]]); luau-lsp works with either. This note is the first-hour setup.

## 1. Pin tools with Rokit

Rojo's install docs recommend **Rokit**:

```bash
rokit init
rokit add rojo-rbx/rojo
rokit install
```

This writes a `rokit.toml` you commit, so every teammate and CI gets the same Rojo version. Add StyLua, selene and Wally the same way ([[Toolchain Managers - Rokit, Foreman and Aftman]]). Alternatives: GitHub release binaries, or `cargo install rojo --version ^7`.

## 2. Studio plugin

Run `rojo plugin install` (also upgrades it), or install the Rojo 7 plugin from the Creator Store. Each major Rojo version has its own plugin; versions must match.

## 3. Project layout and file rules

`default.project.json` maps folders to services. Rojo's sync rules:

| File | Becomes |
| --- | --- |
| folder | `Folder` |
| `name.server.lua` / `.server.luau` | `Script` |
| `name.client.lua` / `.client.luau` | `LocalScript` |
| `name.lua` / `.luau` | `ModuleScript` |
| `init.server.luau`, `init.client.luau`, `init.luau` | turns the **parent folder** into that script type (one init per folder) |
| `.json` (non-project) / `.toml` | ModuleScript returning the table |
| `.txt` | `StringValue` |
| `.csv` | `LocalizationTable` |
| `.rbxm` / `.rbxmx` | model file contents |
| `.model.json` | instances described in JSON |
| `.meta.json` / `init.meta.json` | extra properties or `className` for a sibling or folder |

(Rojo's sync-details page lists the `.lua` forms; Rojo 7 also accepts the `.luau` extension, which most new projects use.)

A minimal project:
```json
{
  "name": "MyGame",
  "tree": {
    "$className": "DataModel",
    "ReplicatedStorage": { "Shared": { "$path": "src/shared" }, "Packages": { "$path": "Packages" } },
    "ServerScriptService": { "Server": { "$path": "src/server" } },
    "StarterPlayer": { "StarterPlayerScripts": { "Client": { "$path": "src/client" } } }
  }
}
```

Run `rojo serve`, then press **Connect** in the Studio plugin.

## 4. VS Code extensions

- **Rojo** (`evaera.vscode-rojo`): start/stop serve from VS Code. It does not put `rojo` on your PATH; the CLI from step 1 is still needed for the terminal.
- **luau-lsp** (JohnnyMorganz): language server. Install from the VS Code Marketplace or OpenVSX.
- Optional: StyLua and selene extensions.

## 5. Make luau-lsp understand your game tree

luau-lsp reads `sourcemap.json` to know that `ReplicatedStorage.Shared.Inventory` is `src/shared/Inventory.luau`. Requires Rojo 7.3+.

- Default settings already auto-generate it: `luau-lsp.sourcemap.enabled` and `luau-lsp.sourcemap.autogenerate` are on, using `default.project.json`.
- Manual: `rojo sourcemap --watch default.project.json --output sourcemap.json`.
- Add `sourcemap.json` to `.gitignore` ([[Git for Roblox Repos - .gitignore, Binary Places and LFS]]).
- Roblox API types and docs are preloaded by default.
- Instances that only exist in Studio (parts in Workspace, UI built by designers) are unknown to the sourcemap; install the **luau-lsp Studio companion plugin** to send DataModel info.
- By default DataModel types resolve to `any` in diagnostics to avoid false positives; turn on `luau-lsp.diagnostics.strictDatamodelTypes` once your tree is stable.

## 6. Strictness and aliases with .luaurc

```json
{
  "languageMode": "strict",
  "aliases": { "Shared": "src/shared", "Packages": "Packages" }
}
```
Start new modules with `--!strict` even if the project default is non-strict ([[Luau Strict Mode and Type Checking in Practice]]).

## 7. Same checks in CI
`luau-lsp analyze` runs the same type checking headless; see [[luau-lsp analyze and Rojo Sourcemaps in CI]] and [[GitHub Actions CI for Rojo Projects - Lint, Format, Build]].

## Common first-day problems
- **Plugin says version mismatch**: reinstall with `rojo plugin install` from the pinned CLI.
- **Everything is `any`**: sourcemap missing or stale; check that `sourcemap.json` exists at the workspace root.
- **Scripts duplicated in Studio**: the same folder is synced by both Rojo and Script Sync; pick one per folder.
- **Edits in Studio lost**: Rojo is one-way (files to Studio) for synced paths; edit synced scripts in VS Code only, or use two-way tools such as Argon ([[Argon - Two-Way Sync Alternative to Rojo]]).

## Related
[[Git Version Control - Hub]] · [[Git, Github, Rojo and Team Workflow]] · [[Script Sync vs Rojo — 2026 Decision Guide]] · [[Toolchain Managers - Rokit, Foreman and Aftman]]
