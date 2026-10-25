---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/slither"
title: "Slither - roblox-ts Casual Snake Game (MIT)"
tags: [roblox, community, open-source, games, "cluster/open-source-games", mit, roblox-ts, io-game, react]
verified: 2026-10-25
license: "MIT"
sources:
  - https://github.com/littensy/slither
  - https://www.roblox.com/games/14162747150
cssclasses: [tg-a40]
---
# Slither - roblox-ts Casual Snake Game (MIT)

**Author:** littensy (credits @Inversion for pull requests and @pashleyy for the concept) · **License:** MIT (LICENSE.md) · **GitHub:** about 203 stars, last push 1 March 2026, not archived · **Live game:** roblox.com/games/14162747150

## What it is
A complete, published snake game in the slither.io style (the repo marks it with a snake emoji and calls it a casual game with a calm pastel palette). It was the most-starred full open-source Roblox game found in this sweep and is a good reference for a modern roblox-ts stack. Play the live game first to see the exact rules.

**Genre:** casual multiplayer / io arena.

## What you can reuse
- A full roblox-ts game layout (client, server, shared) with React (`@rbxts/react`), Reflex state, Remo remotes, Lapis data saving and Ripple animation.
- Release tooling: Mantle deploy configs for a canary and a production place, Tarmac asset sync.
- The UI style (Catppuccin pastel palette) and server-side snake/collision logic as a pattern for any arena game.

## How to run it
1. Install Node.js, pnpm and Rokit. Run `rokit install` (pins Rojo 7.5.1, Tarmac, Mantle).
2. `pnpm install`
3. `pnpm compile` (runs `rbxtsc`), or `pnpm watch` while editing.
4. `pnpm serve` (Rojo serve) and connect the Rojo plugin in Studio, or `pnpm build` to produce `place.rbxlx`.
5. Skip `pnpm tarmac` and `deploy:*` unless you set up your own Roblox places and auth.

## Caveats
- The README credits kenney.nl assets (Kenney packs are CC0) and Microsoft Fluent Emoji (only in badges). Check `assets/` before shipping anything taken from it.
- Assets referenced by Roblox ID belong to the author's uploads; re-upload your own art and sounds.
- Rename and re-theme: shipping a straight copy as "Slither" competes with the author's live game and adds nothing.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[How to legally build on an open-source Roblox game]] · [[Round PvP Starter Architecture]] · [[Charm Example Game - roblox-ts State Sync Demo (MIT)]] · [[Git, Github, Rojo and Team Workflow]]

<!-- TDOD_GRAPH_END -->
