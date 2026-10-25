---
area: "15 AI Tools and Workflow"
cluster: "Obsidian Workflow"
title: "Templater for Game Design Notes - Prompts, Folder Templates and Safety"
tags: [obsidian, community-knowledge, templater, templates, game-design, agpl]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://github.com/SilentVoid13/Templater
  - https://silentvoid13.github.io/Templater/
  - https://silentvoid13.github.io/Templater/settings.html
  - https://silentvoid13.github.io/Templater/internal-functions/internal-modules/system-module.html
---
# Templater for Game Design Notes - Prompts, Folder Templates and Safety

Trackers and queries only work when every feature, bug and weapon note has the same properties with the same allowed values. Obsidian's core Templates plugin inserts static text; the community plugin **Templater** adds logic: ask questions when a note is created, pick from a list, insert dates, rename and move the file, and apply a template automatically based on the folder. For a design vault that feeds [[Obsidian Bases for Game Design Trackers]], that consistency is the difference between a working board and a messy one.

**License: AGPL-3.0** (the plugin itself). That is fine for using it in your vault; it matters only if you redistribute modified plugin code. Templater **can run arbitrary JavaScript and system commands**, so treat templates from other people like code ([[Plugin and MCP Supply-Chain Security]]).

## Syntax basics

- Commands live in `<% %>`, e.g. `<% tp.file.title %>`.
- Dates: `<% tp.date.now("YYYY-MM-DD") %>`; the second argument is a day offset (`-1` = yesterday).
- `<% tp.file.creation_date() %>`, `tp.file.last_modified_date(...)`.
- Interactive (use `await`):
  - `tp.system.prompt(text, default?, throw_on_cancel?, multiline?, select_default?)` opens an input box.
  - `tp.system.suggester(labels, values, throw_on_cancel?, placeholder?, limit?, default?)` opens a pick list.
  - `tp.system.clipboard()` pastes the clipboard.

## A feature-note template (own example)

```markdown
---
type: feature
system: <% await tp.system.suggester(["Combat","Economy","Progression","UI","Social","World"], ["combat","economy","progression","ui","social","world"], false, "System") %>
status: idea
owner: "<% await tp.system.prompt("Owner (note name)", "") %>"
priority: <% await tp.system.suggester(["P1 must","P2 should","P3 could"], [1,2,3]) %>
created: <% tp.date.now("YYYY-MM-DD") %>
---
# <% tp.file.title %>

## Player-facing purpose (one sentence)

## Server rules (authoritative)

## Remotes and validation

## Data saved (schema version)

## Open questions
```

The suggester guarantees allowed values (no "Combat" vs "combat" drift), which keeps Bases filters and groupings clean. The body sections mirror the system-spec template in [[Obsidian Workflow for a Roblox Dev Team]].

## Automatic templates per folder

In Templater settings:
- **Trigger Templater on new file creation**: Templater replaces commands in any new file. Needed for automatic templates and for working with the core Daily Notes plugin.
- **Folder templates**: map a folder to a template; the deepest matching folder wins; a `/` rule is a catch-all. Rules only apply to new files with the same extension as the template (`.md`, `.base`, `.canvas`).
- **File regex templates** (alternative mode): first regex matching the new file's path wins; end with `.*` as a catch-all.

Suggested mapping: `Design/Features` -> feature template, `QA/Bugs` -> bug template (severity suggester, platform suggester, repro steps), `Playtests` -> session template with date in the title, `Decisions` -> decision record.

## Safety rules
1. Only run templates you wrote or read line by line. A template can include `tp.user` scripts and **system commands** that run on your PC.
2. Keep "User System Command Functions" **off** unless you need it; if on, it has a timeout (default 5 s) and uses your shell.
3. The settings page itself warns that triggering on file creation is risky if new files can contain untrusted content (for example notes synced from someone else or written by an AI agent). Exclude inbox/import folders from triggering.
4. Don't let AI agents write `<% %>` into notes in folders that auto-trigger.

## Related
[[Obsidian Workflow - Hub]] · [[Obsidian Bases for Game Design Trackers]] · [[Vault Search, Tags, Properties and Conventions]] · [[PROJECT_STATE Template]]
