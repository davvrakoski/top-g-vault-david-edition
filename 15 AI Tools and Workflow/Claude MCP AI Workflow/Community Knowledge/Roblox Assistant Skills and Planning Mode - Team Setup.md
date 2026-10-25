---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Roblox Assistant Skills and Planning Mode - Team Setup"
tags: [roblox, community-knowledge, ai, assistant, skills, planning, workflow]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/assistant/skills
  - https://create.roblox.com/docs/assistant/guide
  - https://create.roblox.com/docs/assistant/prompt-engineering
  - https://create.roblox.com/docs/assistant/mcp
---
# Roblox Assistant Skills and Planning Mode - Team Setup

Studio's built-in Assistant got two features that change how a team should use it: **Skills** (Markdown instruction files Assistant loads when a request matches) and **Planning Mode** (an editable plan that only executes when you press Build). Together they let you encode your project's conventions once instead of re-typing "use task.wait, validate remotes, PascalCase modules" in every prompt, and they put a human approval step in front of multi-step edits. This note is how to set them up for a real project. For connecting external agents like Claude Code, see [[Claude and the Roblox Studio MCP Server - Responsible Setup]].

## What a skill is

A single Markdown document: frontmatter (`name`, `description`, `enabled`) plus an instruction body. Assistant decides to load it **from the description**, so the description must say both what the skill does and when to use it. Keep name and description to one line each.

Key facts from the docs:
- Skills belong to your **Roblox account**, so they apply in every place you open, not per project.
- Built-in Roblox skills use the reserved `rbx-` prefix. Current ones include `rbx-create-skill`, `rbx-debug` (breakpoints, call stacks), `rbx-device-simulator-lua` (UI across device presets), `rbx-docs-search`, `rbx-perf-profiling` (MicroProfiler traces), `rbx-scene-analysis` (SceneAnalysisService audit, leaks, memory) and `rbx-unit-test` (Jest-Lua/TestEZ detection).
- Built-in skills are read-only; **Duplicate** one to customize it.
- Load manually with `/` in the composer (chips), or let them auto-load. A "Loaded skill" indicator shows which were used.
- Manage via Assistant > ... > Assistant Settings > Skills; create with **Add** (manual) or **Create New** (Assistant interviews you and writes it).

## Skills worth writing for a game team (own examples)

**1. Luau house style**
```markdown
---
name: house-luau-style
description: Apply our Luau conventions whenever writing or editing any script in this game.
enabled: true
---
- Use task.wait/task.spawn/task.delay, never wait/spawn/delay.
- Use LinearVelocity/AlignPosition/AlignOrientation, never Body movers.
- ModuleScripts are PascalCase; locals camelCase; add --!strict to new modules.
- Every RemoteEvent handler validates argument types, ranges and rate on the server.
- Never parent new instances before setting their properties.
```

**2. Remote review** - description: "Use when creating or reviewing RemoteEvents or RemoteFunctions". Body: checklist for server validation, rate limits, no client-trusted prices or damage.

**3. Data change guard** - description: "Use whenever editing DataStore or save-data code". Body: never change key formats without a migration, always `UpdateAsync`, bump schema version.

Because skills are per account, put the **source of truth in your repo** (for example `docs/assistant-skills/*.md`) and paste updates into each teammate's Skills tab. That also gives you version history and review.

## Planning Mode

From the Assistant docs:
- Assistant writes an **editable Markdown plan**; open it with **Open Plan**.
- Plans are stored in the cloud, tied to the experience and your creator profile, private (collaborators don't see them).
- Edit the plan and **Save** to push your changes back into Assistant's task list; chatting also updates the plan.
- **Plans never auto-execute.** Nothing runs until you click **Build**.

Team rule that works: for anything touching more than one script or any data/remote code, ask for a plan first, edit it (remove scope creep, add "do not touch X"), then Build. Save before Build and commit afterwards so you can roll back ([[Git for Roblox Repos - .gitignore, Binary Places and LFS]]).

## Prompting tips from the official guide
- Use exact instance names and say which type you mean (part, model).
- Use the Explorer selection to point at objects.
- **Edit time vs run time:** "make it 8 AM" changes the place now; "add a script that sets the time to 8 AM" creates runtime code. Say which you want.
- Separate a pasted script from the question with `###` for step-by-step explanations.

## Bring your own model
Assistant can use your own API key for Anthropic, OpenAI or Google Gemini (Assistant > ... > Manage API Keys, then pick the model). Keys are secrets: never paste them into scripts or prompts ([[Secrets Store and HttpService - Keeping API Keys Out of Your Place]]).

## Related
[[Claude MCP AI Workflow - Hub]] · [[Claude and the Roblox Studio MCP Server - Responsible Setup]] · [[Prompt Library for Claude]] · [[Deprecated Roblox APIs and Their Modern Replacements]]
