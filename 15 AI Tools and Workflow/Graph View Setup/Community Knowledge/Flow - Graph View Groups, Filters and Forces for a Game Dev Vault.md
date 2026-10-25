---
area: "15 AI Tools and Workflow"
cluster: "Graph View Setup"
title: "Graph View Groups, Filters and Forces for a Game Dev Vault"
tags: [roblox, community-knowledge, obsidian, graph-view]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://obsidian.md/help/plugins/graph
  - https://obsidian.md/help/plugins/search
---
# Graph View Groups, Filters and Forces for a Game Dev Vault

With a few hundred notes, Obsidian's graph is a hairball unless you tell it what to show. Tuned well, it becomes a map of your game: systems clustered by area, hubs as big nodes, orphans visible at a glance, and a colour per discipline (scripting, art, design). This note explains every graph setting in practical terms and gives a ready set of **groups** for a Roblox vault. The [[Graph View Setup - Hub]] covers this vault's shipped configuration; this note is how to build or tune your own.

## Where the settings are

Open the graph (ribbon **Open graph view** or the command palette), then the **cog** at the top right. Four sections: **Filters**, **Groups**, **Display**, **Forces**. **Restore default settings** (top right of the panel) undoes your tinkering. The global graph's settings are saved in the vault's `.obsidian` folder, so a team shares them if that folder is in Git.

## Filters: decide what exists on the map

| Filter | Recommended | Why |
|---|---|---|
| **Search files** | e.g. `-path:"30 Official Roblox Docs"` | Hide bulk reference folders that drown your own notes |
| **Tags** | Off | Tag nodes connect hundreds of notes and collapse the layout |
| **Attachments** | Off | Images and PDFs add noise |
| **Existing files only** | On | Hides links to notes that do not exist yet; turn **off** occasionally to find planned-but-missing notes |
| **Orphans** | On while auditing | Shows notes with no links; see [[Flow - Local Graph, Orphans and Unlinked Mentions - Keeping a Vault Connected]] |

The search box uses normal search syntax: `path:`, `file:`, `tag:`, `-` to exclude, quotes for spaces.

## Groups: colour by meaning

Each group is a search query plus a colour. Suggested groups for a Roblox game vault (adjust paths to your folders):

| Group query | Colour idea |
|---|---|
| `file:Hub` | white (hubs pop out) |
| `path:"03 Scripting and Systems" OR path:"04 Networking Data and Servers"` | blue: code |
| `path:"06 Characters and Animation" OR path:"10 3D Art and Materials"` | orange: art |
| `path:"02 Game Design and Economy"` | green: design |
| `path:"13 Growth and Monetization"` | gold: business |
| `path:"15 AI Tools and Workflow"` | purple: tooling |
| `tag:#status/draft` | grey: unfinished |

Group order matters when a note matches several queries; in practice the group higher in the list wins (observed behaviour; unverified in the docs). Put specific groups (hubs, drafts) above broad folder groups.

## Display: make it readable

- **Arrows**: on when checking link direction (does the hub link out, or do notes link in?).
- **Text fade threshold**: slide so names appear only when zoomed in; huge time-saver on big vaults.
- **Node size**: nodes grow with links, so hubs stand out naturally; increase if hubs are hard to spot.
- **Link thickness**: thin for big vaults.
- **Animate**: replays notes in creation order, a fun way to watch a project's knowledge grow (nice for a devlog video).

## Forces: shape the layout

- **Center force**: higher pulls everything into a tight ball; lower spreads clusters out.
- **Repel force**: higher pushes nodes apart; raise it until clusters separate.
- **Link force**: higher pulls linked notes together; good for seeing tight systems.
- **Link distance**: longer links give room for labels.

A setting that often works for 500-2,000 notes: low center force, high repel, medium link force, medium-long link distance. Tweak one slider at a time and let the layout settle.

## Controls worth knowing

Hover to highlight a node's connections; click to open; right-click for a menu; scroll or `+`/`-` to zoom; drag or arrow keys to pan (`Shift` + arrows pans faster).

## A design-review trick

Before a milestone, filter the graph to one system's folder plus the design folder. Any system node with no link to a design note is a feature built without a written reason; any design note with no system link is a plan nobody built.

## Related
[[Graph View Setup - Hub]] · [[Vault Search, Tags, Properties and Conventions]] · [[Obsidian MOCs, Atomic Notes and Links]] · [[Obsidian Vault Structure]]
