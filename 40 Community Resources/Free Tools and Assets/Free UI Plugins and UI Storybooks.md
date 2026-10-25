---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/free-ui-plugins-storybooks"
title: "Free UI Plugins and UI Storybooks"
tags: [roblox, community, tools, free-assets, plugins, ui, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "mixed - see table"
sources:
  - https://devforum.roblox.com/t/plugin-auto-scale-for-guis/217704
  - https://devforum.roblox.com/t/roundify-plugin/168608
  - https://github.com/Kampfkarren/hoarcekat
  - https://github.com/PepeElToro41/ui-labs
  - https://github.com/flipbook-labs/flipbook
  - https://devforum.roblox.com/t/-/473076
cssclasses: [tg-a40]
---

# Free UI Plugins and UI Storybooks

Two kinds of tools: **layout helpers** that fix scaling across phone/PC/console, and **storybooks** that preview one UI component at a time without pressing Play. Checked 2026-10-25 (Roblox asset API + GitHub license files).

| Tool | Creator | What it does | License | Bundle-safe? | Link |
|---|---|---|---|---|---|
| AutoScale Lite | ZacBytes | Converts Position/Size between Scale and Offset and adds UIAspectRatioConstraints with the ratio worked out for you | Free Creator Store plugin | No - link only | https://create.roblox.com/store/asset/1496745047 |
| Roundify | Stelrex | Rounded-corner images for UI (older; Studio's UICorner now does this natively) | Free Creator Store plugin | No - link only | https://create.roblox.com/store/asset/2233768483 |
| Hoarcekat | Kampfkarren | Storybook-style previewer for single UI elements; built for Roact but works with any UI code | MPL-2.0 | No - link only | https://create.roblox.com/store/asset/4621580428 |
| UI Labs | PepeElToro41 | Storybook plugin: live previews of UI "stories" without running the game; supports roblox-ts via `@rbxts/ui-labs` | GPL-3.0 | No - link only | https://github.com/PepeElToro41/ui-labs |
| Flipbook | flipbook-labs | Storybook plugin with support for Roact, React-lua and Fusion | MIT | YES (code, keep LICENSE) | https://github.com/flipbook-labs/flipbook |

## Which to pick
- **No UI framework, just Studio frames:** AutoScale Lite + Studio's own layout objects. Read [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]] first; most scaling bugs are fixed there, not by a plugin.
- **React-lua / Fusion / Vide code:** a storybook (Flipbook or UI Labs). Each component gets a `.story` file, so you can check every state (empty, loading, error) in seconds.
- **Previewing on devices:** Studio's built-in [[Device Simulator]] is still required; storybooks don't simulate safe areas.

## Paid tools often mentioned
- **Codify** (converts UI instances to Luau, React, Fusion or Vide code) is **paid**; only a limited demo is free. See [[Paid or Off-Sale Plugins Often Called Free]].
- **uiDesign Plus** (Stelrex) was off sale on 2026-10-25.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[UI Libraries - Fusion, React-lua, Vide and Iris]] · [[Cross-Platform UI System]] · [[UI Design System and Tokens]] · [[Free UI Kits and Mockup Files]]

<!-- TDOD_GRAPH_END -->
