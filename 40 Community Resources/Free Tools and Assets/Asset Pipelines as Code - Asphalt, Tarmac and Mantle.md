---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/asset-pipelines"
title: "Asset Pipelines as Code - Asphalt, Tarmac and Mantle"
tags: [roblox, community, tools, assets, open-cloud, toolchain, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "MIT (all three)"
sources:
  - https://github.com/jackTabsCode/asphalt
  - https://github.com/Roblox/tarmac
  - https://github.com/blake-mealey/mantle
cssclasses: [tg-a40]
---

# Asset Pipelines as Code - Asphalt, Tarmac and Mantle

When a game has hundreds of icons and sounds, uploading by hand and pasting `rbxassetid://` numbers into scripts breaks fast. These tools keep assets as **files in your repo** and generate the IDs for you.

| Tool | Maintainer | What it does | Status (2026-10-25) | License | Bundle-safe? | Link |
|---|---|---|---|---|---|---|
| **Asphalt** | jackTabsCode | Uploads images, audio, video, animations and models from a folder; generates Luau or TypeScript that maps file names to asset IDs; converts SVG to PNG and alpha-bleeds images | Active (pushed 2026-07) | MIT | YES (code) | https://github.com/jackTabsCode/asphalt |
| Tarmac | Roblox | "Resource compiler and asset manager": reference assets from code for hermetic Rojo builds; installed via Foreman | Last push 2025-07 | MIT | YES (code) | https://github.com/Roblox/tarmac |
| Mantle | blake-mealey | Infrastructure-as-code deployment for Roblox experiences | **No longer maintained** (README) | MIT | YES (code) | https://github.com/blake-mealey/mantle |

## Asphalt in short
- Config lives in **`asphalt.toml`**.
- Needs an **Open Cloud API key** with `asset:read` and `asset:write`, passed with `--api-key` or the `ASPHALT_API_KEY` environment variable. Keep the key out of Git (use a `.env` or CI secret). See [[Open Cloud and External Tooling]].
- Can upload to a user or a group. Upload to the **group that owns the game**, or the assets may not load in the live game (see [[Asset privacy]]).

## Why "alpha bleed" matters
Transparent PNG icons can show a dark or white fringe when scaled in Roblox. Alpha bleeding fills the invisible pixels with nearby colours so edges stay clean. Asphalt does this on upload; otherwise do it in your image editor.

## Pick one
- New project, code-first team: **Asphalt**.
- Already on Tarmac and it works: fine to keep, but new features land in Asphalt.
- Avoid starting on Mantle: it is unmaintained.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[Open Cloud and External Tooling]] · [[Asset privacy]] · [[Toolchain Managers - Rokit, Foreman and Aftman]] · [[Free Icon Sets for Roblox UI - License Table]]

<!-- TDOD_GRAPH_END -->
