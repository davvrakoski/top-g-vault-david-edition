---
area: "15 AI Tools and Workflow"
cluster: "Obsidian Workflow"
tags: [deep-dive, roblox, obsidian, documentation, team-workflow, templates]
verified: 2026-10-25
cssclasses: [tg-a15]
---

# Obsidian Workflow for a Roblox Dev Team

## Why this matters
Roblox teams are often small, remote and part-time, and they increasingly include AI agents. Knowledge lives in Discord threads, Studio comments and people's heads, so every handoff loses the decisions behind the code. A shared Obsidian vault with a few strict note types makes "why is it like this?" answerable in seconds.
This note is a practical team setup: folder layout, note types with properties, templates, queries, sync options and the weekly rituals that keep it alive. It is about *your game's* vault, separate from this knowledge vault.

---

## 1. Principles
1. **Small number of note types**, each with a template and properties. Freeform notes rot.
2. **One fact, one place.** Link to it; don't copy it.
3. **Decisions are first-class.** Record *what* was decided, *why*, and *what we rejected*.
4. **Code is the source of truth for behaviour; the vault is the source of truth for intent.** Link to script paths, PRs and place versions instead of pasting code.
5. **Write for the next person, and for the next AI session.** Short, dated, linked.

---

## 2. Folder layout for a game vault

```
GameName Vault/
  00 Start Here.md            ← what the game is, how to navigate, current state
  01 Design/                  ← pillars, core loop, systems specs
  02 Systems/                 ← one spec per system (Inventory, Combat, Shop…)
  03 Decisions/               ← ADR-style decision records
  04 Releases/                ← one note per release (changelog, version, results)
  05 LiveOps/                 ← events, calendar, experiments
  06 QA/                      ← test plans, playtest reports, bug triage notes
  07 Art and Audio/           ← style guide, asset log, budgets
  08 Analytics/               ← event catalogue, dashboards, KPI reviews
  09 Community/               ← comms templates, feedback digests
  99 Templates/
```

Windows-safe names: no `< > : " / \ | ? * # ^ [ ]` in file names, and keep basenames unique so wikilinks never become ambiguous.

---

## 3. Note types and properties

Use Obsidian **Properties** (YAML frontmatter) so notes can be filtered and listed.

| Type | Key properties | Example title |
|---|---|---|
| `system` | `status` (draft/live/deprecated), `owner`, `scripts`, `remotes`, `datastores` | Shop System |
| `decision` | `date`, `status` (proposed/accepted/superseded), `deciders`, `supersedes` | 2026-10-12 Event currency instead of coins |
| `release` | `version` (place version), `date`, `type` (hotfix/cadence/event/major), `result` | Release v214 Frozen Caverns |
| `experiment` | `key`, `hypothesis`, `goal_metric`, `start`, `end`, `decision` | EXP-03 Zone 2 cost |
| `event` | `start`, `end`, `currency`, `kpi`, `config_keys` | Harvest Hunt 2026 |
| `playtest` | `date`, `build`, `participants`, `top_findings` | Playtest 2026-10-20 FTUE round 2 |
| `bug-digest` | `week`, `s1`, `s2`, `notable` | Bug digest 2026-W43 |
| `asset` | `source`, `license`, `author`, `used_in` | Asset - Kenney Modular Buildings |

### Template: decision record
```markdown
---
type: decision
date: {{date}}
status: proposed
deciders: []
supersedes:
tags: [decision]
---
# {{title}}

## Context
What problem, which data (link dashboards/notes).

## Decision
One paragraph.

## Alternatives considered
- Option B: why not
- Option C: why not

## Consequences
What gets easier/harder; what we must monitor.

## Links
Systems: [[ ]] · Release: [[ ]] · Experiment: [[ ]]
```

### Template: system spec
```markdown
---
type: system
status: draft
owner:
scripts: ["ServerScriptService/Shop", "ReplicatedStorage/Shared/ShopConfig"]
remotes: ["Shop.RequestPurchase"]
datastores: ["PlayerData v3: Inventory, PurchaseIds"]
tags: [system]
---
# {{title}}

## Purpose (player-facing, one sentence)
## Rules (server-authoritative behaviour)
## Data (what is saved, schema version, migration notes)
## Remotes and validation
## Analytics events (names + custom fields)
## Config keys
## Edge cases / known issues
## Tests (link regression cases)
```

Turn on the core **Templates** plugin (or the community *Templater* plugin) and point it at `99 Templates/`.

---

## 4. Views and queries

**Core options:** search operators (`tag:#decision`, `path:"03 Decisions"`, `[status:accepted]`), Backlinks, Graph and Canvas for system diagrams. Recent Obsidian versions also include **Bases**, a core plugin for table views over note properties; check the Obsidian help for current syntax.

**Dataview** (community plugin) is widely used for live lists:

````markdown
```dataview
TABLE status, owner, file.mtime AS "Updated"
FROM "02 Systems"
WHERE type = "system"
SORT status ASC
```
````

````markdown
```dataview
TABLE date, status
FROM "03 Decisions"
WHERE status = "accepted"
SORT date DESC
LIMIT 15
```
````

Put these on `00 Start Here.md` so the start page is always current. Only install community plugins your team agrees on, and review them like any third-party code.

---

## 5. Sync and collaboration options

| Option | Pros | Cons |
|---|---|---|
| **Obsidian Sync** (paid, official) | Easiest, end-to-end encrypted, version history | Subscription |
| **Git repo** (often the same repo as the game, `/docs`) | Diffs, reviews, history next to the code | Merge conflicts in busy notes; non-technical members need help |
| Cloud drive folder | Free, simple | Conflict copies when two people edit offline; avoid for busy teams |

Rules that prevent conflicts: one owner per note at a time; append-only "log" sections with dated entries at the **top**; small notes over giant ones.

**Linking code and builds:** reference scripts by path (`ServerScriptService/Shop/Receipt.luau`), PRs or commit hashes, and **place versions** from Version History ("live = v214"). Roblox's publish flow requires version notes, so put the release note's title there too.

---

## 6. Working with AI agents

- Keep a **state note** (what's done, in progress and next, with file paths) and a **resume note** for new sessions. See [[Project State, Decisions and Resume Notes]] and [[PROJECT_STATE Template]].
- Agents follow **short rule files** best. Keep the project's agent instructions (CLAUDE.md / AGENTS.md) under 1–2 screens and link to vault notes for details (see [[Claude and the Roblox Studio MCP Server - Responsible Setup]]).
- Ask agents to **append dated entries** to the relevant system or release note after verified work, not to create new notes for every task (which fragments the vault).
- Never store secrets, API keys or player personal data in the vault, because agents and sync services read it.

---

## 7. Rituals that keep the vault alive

| When | Ritual | Output |
|---|---|---|
| Every merged feature | Update the system note (rules, data, events, config keys) | Spec matches code |
| Every decision | Decision record, even a 5-line one | Searchable "why" |
| Every release | Release note: version, changes, config flips, known issues, results at T+2 days | Release history |
| Weekly (30 min) | KPI review note + bug digest | Trends with context |
| Monthly | Prune: mark deprecated systems, supersede old decisions, fix orphan notes | Vault stays trustworthy |

Orphan check: Obsidian's graph or a Dataview query for notes with no incoming links. Every orphan should link to a hub or be deleted.

---

## Common mistakes
- A sprawling, typeless vault, so nothing can be queried.
- Copying code into notes, where it goes stale; link to paths and commits instead.
- Decisions recorded only in Discord.
- Cloud-drive sync with five simultaneous editors (conflict copies everywhere).
- Duplicate basenames ("Shop.md" in three folders), which makes links ambiguous.
- Letting agents create a new note for every task.
- Secrets in notes.

## Checklist
- [ ] Folder layout and note types agreed; templates in `99 Templates/`
- [ ] Properties on every typed note; Start Here page uses live queries
- [ ] Sync method chosen with conflict rules
- [ ] System notes link script paths, remotes, DataStores, analytics events and config keys
- [ ] Decision records for every non-trivial choice
- [ ] Release notes reference place versions
- [ ] Agent rules file short and linked to the vault
- [ ] Monthly prune scheduled

---

**Sources checked (2026-10-25):** Roblox Creator Docs: Projects › Version History (publish notes); AI › Build with a coding harness (Git + Script Sync). Obsidian features (Properties, Templates, search operators, Canvas, Bases, Sync) and the Dataview community plugin are described from their public documentation; verify current syntax in Obsidian's help.

**Related:** [[Obsidian Workflow - Hub]] · [[Obsidian Vault Structure]] · [[Obsidian MOCs, Atomic Notes and Links]] · [[Vault Search, Tags, Properties and Conventions]] · [[Git Version Control - Hub]] · [[Studio Collaboration and Team Workflow]]
