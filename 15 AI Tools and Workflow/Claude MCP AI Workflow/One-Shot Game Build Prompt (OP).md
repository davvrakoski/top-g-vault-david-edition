---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
source_note: "inbox/one-shot-game-build-prompt"
title: "One-Shot Game Build Prompt (OP)"
tags: [roblox, ai, prompt, workflow, one-shot]
verified: 2026-10-25
author: "TDOD"
cssclasses: [tg-a15]
---

# One-Shot Game Build Prompt (OP)

> [!topg] Made by TDOD
> One prompt that takes a game idea to a **playable, shippable build**. Fill the 6 lines in **INPUT**, paste the whole block into your AI coding agent (Claude Code, Cursor, etc.), and let it run. Works for Roblox by default; change `ENGINE` for anything else.

## How to use (30 seconds)
1. Copy everything inside the code block below.
2. Fill the **INPUT** lines (one sentence each is enough).
3. Paste into your agent with the project folder open. Say nothing else.
4. When it stops, run the game. It must already be playable; if not, reply only: `Fix the failing checks and continue.`

```text
You are a senior game developer shipping a complete, playable game in ONE pass. No questions, no placeholders, no "TODO", no "left as an exercise". Make every decision yourself and write it down.

INPUT
- ENGINE: Roblox (Luau, Rojo-style file layout)        <- or Unity C# / Godot GDScript / Unreal C++ / web (TypeScript)
- GAME: <one sentence: what the player does>
- GENRE + FEEL: <e.g. fast arcade shooter, cozy tycoon, horror survival>
- CORE LOOP: <action -> reward -> upgrade -> repeat>
- MONETIZATION: <none / game passes + dev products / ads>
- SCOPE: <small (1 map, 1 mode) | medium | large>

RULES
1. Plan first, then build. Output a short Design Doc (loop, controls, progression, economy numbers, win/lose, 10-minute first session) before code.
2. Server-authoritative: the client only sends intent; the server validates every request (rate limits, distance/ownership checks, sanity bounds). Never trust client values for money, damage, position or inventory.
3. Data: save with session locking, retries with backoff, versioned schema + migration, save on leave/shutdown/autosave. Never lose a player's data.
4. Performance: no per-frame allocations in hot paths, pool frequently spawned objects, stream/limit what each client sees, cap particles/lights, budget memory. Target 60 FPS on a low-end phone.
5. Code: small single-purpose modules, typed (--!strict / C# types), clear names, no globals, one source of truth per system, cleanup on destroy (no leaked connections).
6. Every number that tunes the game (costs, damage, cooldowns, XP curve, drop rates) lives in ONE config module, with comments.
7. UX: readable on phone + PC + console, input-agnostic controls, clear feedback for every action (sound, VFX, UI), onboarding in the first 30 seconds, settings (audio, sensitivity, graphics).
8. Use only original code and assets you create or that are licensed for free use (CC0 / engine marketplace free). Generate simple placeholder art with primitives if needed: the game must run with zero missing assets.
9. Monetization is optional to win, never pay-to-win; purchases are validated server-side and receipts are idempotent.
10. Accessibility: colour-blind safe UI, no flashing over 3 Hz, text scaling.

BUILD ORDER (finish each phase fully, then run its checks before moving on)
P1 Skeleton: file tree, bootstrap scripts, config module, remote/event layer with validation, logger.
P2 Core loop playable end to end (start -> play -> reward -> repeat) with placeholder visuals.
P3 Progression + economy + saving (data layer from rule 3), leaderboards if relevant.
P4 Content: map/levels, enemies/NPC AI (state machine), items, abilities, balancing pass from config.
P5 Juice: VFX, SFX, camera shake/FOV kicks, UI animations, hit-stop, music by context.
P6 UI/UX: HUD, menus, shop, settings, onboarding, mobile buttons.
P7 Security + anti-exploit pass, performance pass (profile, fix the top 5 costs).
P8 Ship: release checklist, analytics events (session start, funnel steps, purchases), live-ops hooks (events, codes), thumbnail/icon brief, store description.

CHECKS (run or simulate after each phase; fix before continuing)
- Boots with zero errors/warnings in the output.
- A full first session works from join to first upgrade in under 3 minutes.
- Leave + rejoin keeps progress; two players at once do not interfere.
- Spamming every remote at 50x speed changes nothing (validation holds).
- No memory growth over 10 minutes of play; FPS stable.

OUTPUT FORMAT
- Design Doc (short).
- File tree.
- Every file in full, in build order, with its path as a heading. Never abbreviate a file.
- "How to run" (exact steps) and "How to extend" (where to add a new item/enemy/level in one place).
- Final checklist with every CHECK marked PASS, plus the 5 best next features ranked by player impact.

Start now with the Design Doc, then build P1-P8 without stopping.
```

## Why it works
- **Decides instead of asking**: no back-and-forth, the agent commits to numbers and writes them down.
- **Phases + checks**: each phase must pass before the next, so you get a playable build early and bugs don't stack.
- **Server-authoritative + data rules up front**: the two things that kill Roblox games (exploits, lost data) are non-negotiable from line one.
- **One config module**: you can rebalance the whole game without touching code.

## Tips
- Big game? Run it once with `SCOPE: small`, ship that, then paste: `Continue with the next 5 features from your list, same rules and checks.`
- Pair it with [[Legendary Release Standard]] for the release bar and the area hubs for deep dives.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Claude MCP AI Workflow - Hub]]

**Related notes:** [[Legendary Release Standard]] · [[Production NPC State Machine]] · [[DataStore Session Locking, Retries, Versioning and Erasure]]

<!-- TDOD_GRAPH_END -->
