---
area: "15 AI Tools and Workflow"
cluster: "Obsidian Workflow"
title: "Obsidian Bases for Game Design Trackers"
tags: [obsidian, community-knowledge, bases, properties, game-design, tracking]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://obsidian.md/help/bases
  - https://obsidian.md/help/bases/syntax
---
# Obsidian Bases for Game Design Trackers

A game design vault quickly fills with notes that are really **records**: features, bugs, weapons, enemies, quests, assets with licenses, playtest findings. Bases is Obsidian's **core plugin** (no community install) that turns those notes into database views (table, list, cards, kanban, map) driven by note **properties**. Unlike Dataview's code blocks, Bases views are editable: you can change a property right in the table. For a Roblox team this replaces a lot of spreadsheets while keeping everything in plain Markdown files that Git and AI agents can read.

## The model

- Data stays in each note's YAML properties (frontmatter), e.g. `status`, `owner`, `system`, `priority`.
- A view is defined in **Bases syntax** (YAML), saved as a `.base` file or embedded in a note inside a `base` code block.
- Top-level keys: `filters`, `formulas`, `properties` (display names), `summaries`, `views`.
- Views: **Table**, **List**, **Cards**, **Kanban** (cards grouped into columns by a property), **Map**. Community plugins can add more.
- Global filters and per-view filters combine with AND.

## Step 1: give notes consistent properties

```yaml
---
type: feature
system: combat
status: in-progress     # idea | planned | in-progress | testing | live
owner: "[[Sam]]"
priority: 2
target_update: 2026-11-08
---
```
Consistency is everything: decide allowed values once and put them in a template ([[Templater for Game Design Notes - Prompts, Folder Templates and Safety]]).

## Step 2: a feature tracker base (own example)

```yaml
filters:
  and:
    - file.inFolder("Design/Features")
    - 'type == "feature"'
formulas:
  days_left: '(date(target_update) - today()).days'
properties:
  formula.days_left:
    displayName: "Days left"
views:
  - type: table
    name: "Open features"
    filters:
      and:
        - 'status != "live"'
    order:
      - file.name
      - system
      - status
      - owner
      - priority
      - formula.days_left
    groupBy:
      property: system
      direction: ASC
  - type: kanban
    name: "Board"
```

The filter functions `file.inFolder(...)`, `file.hasTag(...)` and `file.hasLink(...)` and comparison strings like `'status != "done"'` come straight from the syntax reference. Date math such as `now() - "1 week"` is supported; the exact duration and date helper functions used in `days_left` above should be checked against the Bases functions page for your Obsidian version (unverified).

## Useful bases for a Roblox project

| Base | Notes it reads | Key properties |
| --- | --- | --- |
| Feature board | `Design/Features` | status, owner, system, target_update |
| Bug triage | `QA/Bugs` | severity, platform (PC/mobile/console), repro_rate, fixed_in |
| Weapon/enemy stats | `Content/Weapons` | damage, fire_rate, range, unlock_level |
| Asset license log | `Assets/` | source_url, license, author, used_in, credited |
| Playtest findings | `Playtests/` | session_date, issue_type, players_affected |
| Decision records | `Decisions/` | status (proposed/accepted/superseded), date |

The asset license base pairs with [[Asset and License Log Template]]: filter `license` values not in the bundle-safe list to see what needs review.

## Bases vs Dataview

| | Bases | Dataview |
| --- | --- | --- |
| Install | core plugin | community plugin (MIT) |
| Edit values in the view | yes | no (read-only output) |
| Query language | YAML filters + formulas | DQL (`TABLE ... FROM ... WHERE ...`) and JavaScript |
| Views | table, list, cards, kanban, map | list, table, task, calendar |
| Best for | trackers people edit | complex reports, task roll-ups |

Many vaults use both: Bases for living trackers, Dataview for reports. See [[Obsidian Workflow for a Roblox Dev Team]] for Dataview examples.

## Pitfalls
1. **Property type drift**: `priority: "2"` (text) and `priority: 2` (number) sort differently. Set property types in Obsidian's properties view.
2. **Big vaults**: scope every base with `file.inFolder` so it doesn't scan thousands of notes.
3. **Links vs text**: use `"[[Sam]]"` links for owners so the graph and backlinks work.

## Related
[[Obsidian Workflow - Hub]] · [[Vault Search, Tags, Properties and Conventions]] · [[Obsidian Workflow for a Roblox Dev Team]] · [[Obsidian Canvas for Level Flow and System Maps]]
