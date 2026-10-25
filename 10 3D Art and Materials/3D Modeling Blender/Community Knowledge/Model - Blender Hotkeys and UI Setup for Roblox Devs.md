---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Blender Hotkeys and UI Setup for Roblox Devs"
tags: [roblox, community-knowledge, 3d-art, blender, hotkeys, beginner]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://docs.blender.org/manual/en/latest/interface/keymap/introduction.html
  - https://docs.blender.org/manual/en/latest/interface/keymap/blender_default.html
  - https://docs.blender.org/manual/en/latest/scene_layout/scene/properties.html
  - https://create.roblox.com/docs/art/modeling/specifications
---
# Blender Hotkeys and UI Setup for Roblox Devs

Most Roblox developers open Blender for one job (a prop, an accessory, a cleanup) and lose time hunting menus. Blender is built around the keyboard: about 30 shortcuts cover nearly all game-asset work. This page lists those shortcuts for the default Blender keymap (4.x/5.x) plus a one-time setup that makes exports match Roblox. Studio's own shortcuts are in [[Studio Keyboard Shortcuts Cheat Sheet]].

## One-time setup

1. *Edit > Preferences > Input:* turn on **Emulate 3 Button Mouse** if you use a laptop trackpad, and **Emulate Numpad** if you have no numpad (then 1-3 on the number row change views).
2. *Preferences > Interface:* consider a larger **Resolution Scale** on small screens.
3. *Scene Properties > Units:* pick one export scale and write it down. Many devs keep metric and let the Importer convert; others set Unit Scale so 1 unit = 1 stud. Consistency matters more than the choice ([[FBX Import Settings, Scale and Collision Fidelity]]).
4. Viewport Overlays > **Statistics**: shows triangle count live. Roblox caps one mesh at 20,000 triangles.
5. Viewport Overlays > **Face Orientation**: back faces turn red; fix them before export (Roblox culls back faces by default).
6. *File > Defaults > Save Startup File* to keep this.

## Navigation

| Key | Action |
|---|---|
| Middle mouse drag / Shift+MMB / Ctrl+MMB | Orbit / pan / zoom |
| Numpad . (period) | Frame selected |
| Home | Frame all |
| Numpad 1 / 3 / 7 (Ctrl for opposite) | Front / Right / Top view |
| Numpad 5 | Toggle perspective/orthographic |
| Numpad / | Local view (isolate selection) |
| ` (backtick) | View pie menu |

## Selecting and transforming

| Key | Action |
|---|---|
| G / R / S | Grab, rotate, scale; then X/Y/Z to lock an axis, type a number for exact values |
| A / Alt+A | Select all / none |
| B / C | Box select / circle select |
| Alt+click | Select an edge loop |
| Ctrl+I | Invert selection |
| H / Alt+H | Hide / unhide |
| Shift+D / Alt+D | Duplicate / linked duplicate |
| Shift+S | Snap menu (cursor to selected, selection to cursor) |
| Ctrl+A | Apply transforms (do this before export) |

## Modeling (Edit Mode)

| Key | Action |
|---|---|
| Tab | Object / Edit Mode |
| 1 / 2 / 3 | Vertex / edge / face select |
| E | Extrude |
| I | Inset faces |
| Ctrl+R | Loop cut |
| Ctrl+B | Bevel (Ctrl+Shift+B vertex bevel) |
| K | Knife |
| F | Fill face / edge |
| M | Merge (By Distance cleans duplicates) |
| P | Separate (by selection, by material, by loose parts) |
| Ctrl+J (Object Mode) | Join objects |
| Alt+N | Normals menu (flip, recalculate) |
| Ctrl+T | Triangulate faces |

## UV and export

| Key | Action |
|---|---|
| U | UV unwrap menu |
| Ctrl+E > Mark Seam | Mark seams for unwrapping |
| F3 | Search any command by name (the lifesaver) |
| Ctrl+S | Save; Ctrl+Shift+S save as |

Export through *File > Export > FBX* (or glTF) with "Selected Objects" on so you export only what you mean to. Then audit in the Studio Importer preview.

## Habits that prevent Roblox problems

- Apply scale and rotation (*Ctrl+A > All Transforms*) before every export: unapplied scale is the top cause of tiny or giant imports.
- Set the origin deliberately (*Object > Set Origin*) because it becomes the pivot in Studio ([[Art - Pivots for Moving Props - Blender Origins, PivotOffset and Hinges]]).
- Merge by distance after mirroring or booleans to remove duplicate vertices.
- Name objects before export; names carry into Studio ([[Art - Naming Conventions for Meshes, Materials and Textures]]).

## Related
[[3D Modeling Blender - Hub]] - [[Studio Keyboard Shortcuts Cheat Sheet]] - [[FBX Import Settings, Scale and Collision Fidelity]] - [[Blender Game-Ready Audit]]
