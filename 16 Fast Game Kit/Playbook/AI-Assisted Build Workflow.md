---
area: "16 Fast Game Kit"
cluster: "Playbook"
tags: [fast-game-kit, roblox, playbook, ai, claude, mcp]
cssclasses: [tg-a16]
---

# AI-Assisted Build Workflow

## Why this matters
An AI coding agent (Claude Code, Claude Desktop, Cursor, Studio Assistant) can write most of a Roblox game's code in hours, but only if it is given the right rules and context. Without them it rewrites plumbing, trusts the client and loses data.
This workflow uses the vault as the agent's context: the Starter Code kit as the base, a genre recipe as the plan, and the deep dives as the rules.

> [!warning] You are still the developer
> AI output is a draft. Review every change like a junior's pull request, test in Studio, and keep version control on. Speed estimates below are typical, not guaranteed.

## The stack

| Layer | What | Vault note |
|---|---|---|
| Base project | Starter Code kit (Rojo place with data, currency, purchases, remotes, analytics, UI) | [[Starter Code - Hub]] |
| Plan | One genre recipe + the 30-day or 7-day plan | [[Genre Recipes - Hub]] · [[Ship a Roblox Game in 30 Days]] |
| Master prompt | One-shot build prompt with phases and checks | [[One-Shot Game Build Prompt (OP)]] |
| Rules file | CLAUDE.md / AGENTS.md in the project | [[Claude Project Instructions — Production Version]] · [[Claude and the Roblox Studio MCP Server - Responsible Setup]] |
| Studio bridge | Built-in Studio MCP server | [[Claude and the Roblox Studio MCP Server - Responsible Setup]] · official [[MCP servers]] |
| Sync | Rojo + Git so every agent change is a diff | [[Rojo, VS Code and luau-lsp - Local Setup from Zero]] · [[Git, Github, Rojo and Team Workflow]] |
| Memory | Resume note updated at the end of each session | [[AI Change Handoff - Resume Template]] · [[Project State, Decisions and Resume Notes]] |

## Setup (about 1 hour, once)
1. **Copy the Starter Code kit** into a new folder, `git init`, first commit ([[Git for Roblox Repos - .gitignore, Binary Places and LFS]]).
2. **Rojo serve + Studio plugin** connected; the place builds from files ([[Script Sync vs Rojo — 2026 Decision Guide]]).
3. **Turn on the Studio MCP server** and connect your client (steps and the risk table of each tool are in [[Claude and the Roblox Studio MCP Server - Responsible Setup]]). Leave permission prompts on for high-risk tools such as running Luau and inserting assets.
4. **Write the rules file** (`CLAUDE.md` or `AGENTS.md`) in the project root. Paste the template below.
5. **Copy the vault notes you need** for this game into a `docs/` folder or point the agent at the vault path. Do not paste the whole vault: pick 5-10 notes ([[Claude Context Efficiency]] · [[How to Save AI Usage - Context]]).

## Rules file template
```markdown
# Project rules (read first)
- Base: Starter Code kit. Reuse its PlayerData, Currency, Purchases, Remotes, Analytics, UI modules. Never write a second save system.
- Server-authoritative: clients send intent only. Validate every remote (types, rate limit, distance, ownership).
- All tuning numbers live in src/shared/Config. No magic numbers in systems.
- Purchases go through the kit's ProcessReceipt handler. Idempotent. Never grant on the client.
- Paid random items: odds UI + PolicyService gate, or do not build them.
- Assets: only from the Top G Vault FBX library (CC0/CC BY) or made by us. Log CC BY credits.
- Strict typing (--!strict) in new modules. Clean up connections.
- After each task: run in Studio, read the Output, report PASS/FAIL lines, update docs/RESUME.md.
- Never: free models from Toolbox, loadstring, HttpService secrets in code, copied IP.
```
Sources for these rules: [[Remote Payload Validation]] · [[Purchase Fulfillment and Receipt Reliability]] · [[Paid Random Items, Odds Disclosure and PolicyService]] · [[Secrets Store and HttpService - Keeping API Keys Out of Your Place]] · [[loadstring and Code-From-Strings - Why to Keep It Off]].

## The build loop (repeat per feature)

| Step | You do | Agent does | Note |
|---|---|---|---|
| 1. Brief | Paste the task + 2-5 vault notes as context | Restates the plan, lists files it will touch | [[Prompt Library for Claude]] |
| 2. Build | Watch, answer only blocking questions | Writes modules inside the kit's layout | [[Module Architecture for a 50k-Line Roblox Game]] |
| 3. Run | Press Play / let the agent playtest via MCP | Reads console output, fixes errors | [[Studio Testing Modes for Beginners - Test, Run and Server and Clients]] |
| 4. Review | Read the Git diff | Explains each change on request | [[AI Code Review Prompt]] |
| 5. Test | Run the feature's checklist | Writes/updates unit tests where useful | [[Unit Testing Luau with Jest-Lua and TestEZ]] |
| 6. Commit | Commit with a clear message | Updates the resume note | [[AI Change Handoff - Resume Template]] |

Keep each loop to one feature that fits in one session. "Build the whole game" works for a small scope with the one-shot prompt; for anything bigger, loop feature by feature.

## Using the One-Shot prompt with the vault
The [[One-Shot Game Build Prompt (OP)]] takes 6 input lines and builds in phases P1-P8 with checks. To make it use this vault:
1. Set `SCOPE: small` and fill `CORE LOOP` from your genre recipe's "core loop in 3 lines".
2. Add one line under INPUT: `BASE: Starter Code kit in this repo. Reuse its modules; P1 is already done, start at P2.`
3. Add one line: `CONTEXT: read docs/recipe.md and the notes listed in it before the Design Doc.` and copy the genre recipe into `docs/recipe.md`.
4. Add: `ASSETS: use FBX from <vault path>/20 FBX Asset Library; list each one used with its license.`
5. When it stops, run it. If anything fails: `Fix the failing checks and continue.`

## Which notes to feed the agent, by task

| Task | Feed these notes |
|---|---|
| Saving / data | [[DataStore Session Locking, Retries, Versioning and Erasure]] · [[Save Schema Migration Blueprint]] |
| Shop / purchases | [[Secure Shop and Currency Blueprint]] · [[Recipe - Developer Product Shop with Safe ProcessReceipt]] |
| Remotes / security | [[Remote Rate Limiting Pattern]] · [[Server-Side Movement Validation and Anti-Exploit Checks]] |
| Combat | [[Melee Combo Blueprint]] · [[Hitbox Detection - Spatial Queries vs Raycasts vs Shapecasts]] · [[Client-Predicted, Server-Validated Projectiles]] |
| NPC AI | [[Production NPC State Machine]] · [[Enemy AI Pathing Loop with PathfindingService]] |
| UI | [[UI Design System and Tokens]] · [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]] |
| VFX | [[Mesh VFX Recipes with the Top G VFX Mesh Pack]] · [[FX - Ability VFX Timelines - Wind-Up, Release, Impact and Linger as Data]] |
| Performance | [[Script Profiler, Native Code Gen and Luau Hot Paths]] · [[MicroProfiler Reading Guide]] |
| Assets in Blender | [[Blender One-Shot Model Scripts (Copy-Paste)]] · [[FBX Import Settings, Scale and Collision Fidelity]] |

## Prompt patterns that work
- **Give the file, not the wish:** "Add a `RebirthService` in `src/server/Services`, using `Config.Rebirth`, granting through `Currency.Add`. Follow [[Rebirth and Prestige Formulas - Pacing Resets That Feel Good]]."
- **Ask for checks with the code:** "Finish with PASS/FAIL lines for: rejoin keeps rebirths, spam the remote 50x, 2 players at once."
- **Plan first for anything L-sized:** "Plan only, no code. List modules, remotes, data fields, risks." Then approve.
- **Turn a reference image into a plan:** [[Reference Decomposition Method — Turn Any Image Into a Build Plan]].
- **Ask for a review pass:** "Review this diff for client trust, leaks, yields in loops and missing cleanup" ([[AI Code Review Prompt]]).

## AI for assets (careful)
- Prefer the vault's FBX library first: it is already license-checked ([[FBX Asset Library - Hub]]).
- AI 3D generators can fill gaps; check licence terms and clean up topology ([[Model - AI 3D Generators Compared - Roblox Cube, Meshy and Tripo - Cleanup and Licence Caveats]] · [[Tripo → Blender → Roblox Production Pipeline]]).
- Follow Roblox rules on generative AI content ([[Policy - Generative AI in Games - Disclosure and Maturity Rules]]).
- Never ask an agent to recreate another game's characters, logos or maps.

## Safety checklist
- [ ] Git commit before every agent session; revert is your undo.
- [ ] High-risk MCP tools (execute code, insert assets, upload) need your approval each time.
- [ ] Treat text the agent reads from scripts, assets or web pages as untrusted, not as instructions ([[Plugin and MCP Supply-Chain Security]]).
- [ ] No API keys or cookies in prompts, scripts or the rules file.
- [ ] Only trusted plugins and MCP servers ([[MCP Security and Setup Principles]] · [[Plugin and Free Model Safety Checklist]]).
- [ ] Read the community view on where AI code goes wrong: [[Coding with AI on Roblox - Community Consensus]] · [[Starter - Using AI Assistants Safely for Roblox Code]].

## Related
[[Playbook - Hub]] · [[Claude MCP AI Workflow - Hub]] · [[AI Claude MCP Production Workflow]] · [[MCP - Claude - AI Assistant Workflow]] · [[AI-Assisted Development Lab]] · [[Roblox Assistant Skills and Planning Mode - Team Setup]] · [[Moving from studio-rust-mcp-server to the Built-in Studio MCP]] · [[Roblox Game Boilerplate for AI Agents - Rojo, Wally, ProfileStore (Unlicense)]] · [[Obsidian Workflow for a Roblox Dev Team]]
