---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/ui-libraries"
title: "UI Libraries - Fusion, React-lua, Vide and Iris"
tags: [roblox, community, tools, ui, libraries, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "MIT (all four)"
sources:
  - https://github.com/dphfox/Fusion
  - https://github.com/jsdotlua/react-lua
  - https://github.com/centau/vide
  - https://github.com/SirMallard/Iris
cssclasses: [tg-a40]
---

# UI Libraries - Fusion, React-lua, Vide and Iris

Code-first UI libraries that keep coming up when developers ask "how do you build UI that doesn't turn into spaghetti?". All four are **MIT**, so you can ship them inside your game (keep the license text in the module).

| Library | Maintainer | Style | GitHub status 2026-10-25 | License | Bundle-safe? | Link |
|---|---|---|---|---|---|---|
| **Fusion** | dphfox | Reactive state (values, computeds, observers) + declarative instances | Pushed 2026-02, ~800 stars | MIT | YES (keep LICENSE) | https://github.com/dphfox/Fusion |
| **React-lua** | jsdotlua | Translation of upstream ReactJS 17.x into Luau: components, hooks. Roblox's deprecated Roact repo points here | Pushed 2025-05, ~580 stars | MIT | YES (keep LICENSE) | https://github.com/jsdotlua/react-lua |
| **Vide** | centau | Small reactive library, fine-grained updates, light on boilerplate | Pushed 2026-10, ~350 stars | MIT | YES (keep LICENSE) | https://github.com/centau/vide |
| **Iris** | SirMallard | Immediate-mode GUI based on Dear ImGui, for **debug and dev tools**, not player UI | Pushed 2026-10, ~360 stars | MIT | YES (keep LICENSE) | https://github.com/SirMallard/Iris |

## Choosing
| Situation | Pick |
|---|---|
| You know React from web work, or want the biggest ecosystem of patterns | React-lua |
| You want reactive state without a component tree mindset | Fusion or Vide |
| Small team, want minimal code and fast updates | Vide |
| You need an in-game debug panel (sliders for tuning, live stats) | Iris, only in dev builds |
| Simple game with a few menus | Plain Studio UI + [[UI Design System and Tokens]]; no library needed |

## Notes
- Every library here works with a storybook plugin for previewing components: see [[Free UI Plugins and UI Storybooks]].
- Install via Wally or by copying the release model; pin a version. Breaking changes between major versions are common in UI libraries.
- Roact (the older Roblox library) is marked deprecated and unmaintained in its own README, which sends you to react-lua. New projects should not start on Roact.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[Cross-Platform UI System]] · [[UI Design System]] · [[Open-Source Roblox Shortlist — Reviewed Starting Points]] · [[Free UI Plugins and UI Storybooks]]

<!-- TDOD_GRAPH_END -->
