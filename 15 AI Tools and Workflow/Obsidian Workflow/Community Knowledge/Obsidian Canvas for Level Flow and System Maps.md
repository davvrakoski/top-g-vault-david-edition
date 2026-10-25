---
area: "15 AI Tools and Workflow"
cluster: "Obsidian Workflow"
title: "Obsidian Canvas for Level Flow and System Maps"
tags: [obsidian, community-knowledge, canvas, level-design, system-design, diagrams]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://obsidian.md/help/plugins/canvas
  - https://jsoncanvas.org/
---
# Obsidian Canvas for Level Flow and System Maps

Game design is spatial: a level is rooms connected by paths, a game loop is a cycle of activities, a codebase is services talking over remotes. **Canvas** is Obsidian's core plugin for an infinite 2D board where you place notes, images, web pages and text cards and connect them with labelled arrows. Because cards can be **real vault notes**, the diagram and the design docs stay the same thing: open the "Shop" card and you are editing the Shop spec. Canvases are saved as `.canvas` files in the open **JSON Canvas** format, so they diff in Git and other tools can read them.

## Card types (from the Obsidian help)

| Card | Use in game design |
| --- | --- |
| Text | quick sticky notes, Markdown supported; convert to a note later |
| Note | an existing note, optionally narrowed to one heading or block |
| Media | screenshots, concept art, PDFs, audio references |
| Web page | embedded URL (a DevForum thread, a reference video page) |
| Base | a Bases view inside the canvas (live tracker next to the diagram) |
| Folder | drop a folder to add all its files |

Plus **groups** (named, coloured, can have a background image) and **connections** (labels, colours, direction: none, one-way, both).

## Three canvases every Roblox project benefits from

**1. Core loop map.** Text cards for each player activity (spawn, gather, upgrade, fight, cash out), arrows labelled with the reward or trigger, a group for "first session (0-5 min)". Link each card to its feature note. Compare with [[Core Loop and Session Design for D1 and D7 Retention]].

**2. Level / map flow.** Paste a top-down screenshot of the map as a media card, then place note cards on POIs and connect them with arrows labelled travel time ("~25 s on foot"). Group areas by danger level with colours. This is the quickest way to spot dead ends and too-long walks ([[Open World Layout - POIs, Triangle Rule and Travel Time]]).

**3. Architecture map.** Groups for Server, Client and Shared; note cards for each service/controller spec; arrows labelled with the RemoteEvent name and direction. Colour remotes that carry money or inventory red so reviewers check validation ([[Service and Controller Boundaries]]).

## Keyboard and handling tips (from the help page)
- Pan: hold Space and drag; Shift+scroll pans horizontally.
- Zoom: Ctrl/Cmd+scroll; **Shift+1** zoom to fit, **Shift+2** zoom to selection.
- Alt/Option+drag duplicates; Shift constrains movement or keeps aspect ratio; holding Space disables snapping.
- "Follow connection" jumps to the card at the other end of an arrow.
- Embed a canvas into a note with the normal embed syntax so the design doc shows the diagram.

## Working with AI agents
Because `.canvas` is JSON (nodes with ids, positions, sizes, and edges between node ids), an agent can read a canvas to understand a system, or generate a first-draft canvas from a spec. Review generated canvases for invented connections, and keep the authoritative rules in the linked notes, not in card text ([[AI-Assisted Development Lab]]).

## Pitfalls
1. **Text-card graveyards.** Text cards don't show in backlinks; convert important ones to notes.
2. **Giant canvases** get slow and unreadable; one canvas per question (loop, map, architecture), linked from a hub note.
3. **Stale diagrams.** Add the canvas to your release checklist or decision records so it is updated when systems change ([[Project State, Decisions and Resume Notes]]).

## Related
[[Obsidian Workflow - Hub]] · [[Obsidian MOCs, Atomic Notes and Links]] · [[Obsidian Bases for Game Design Trackers]] · [[Obsidian Workflow for a Roblox Dev Team]]
