---
area: "15 AI Tools and Workflow"
cluster: "Obsidian Workflow"
title: "Weekly Planning and Timeboxing for Solo Roblox Devs"
tags: [roblox, community-knowledge, planning, solo-dev, scoping]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/lost-the-fun-in-learning-lua/3837008
  - https://devforum.roblox.com/t/what-to-do-about-motivation-issues/863818
---
# Weekly Planning and Timeboxing for Solo Roblox Devs

Solo Roblox projects rarely die from one hard bug; they die from a slow drift where every week adds features and nothing ships. A light weekly plan with fixed time boxes fixes that, because it forces you to choose. This note is a planning rhythm sized for someone working evenings and weekends, using the vault you already have. For deciding *what the game is*, see [[Starter - Scoping Your First Real Game - One Loop and a Cut List]]; this note is about *running the weeks*.

## The three horizons

| Horizon | Length | Output |
|---|---|---|
| Milestone | 4-6 weeks | One playable result: "vertical slice", "closed test", "public launch" |
| Week | 7 days | Top 3 tasks that move the milestone, written down |
| Session | 1-3 hours | One task, with a "done" definition |

Never plan more than one milestone ahead in detail. Further milestones are one line each.

## Weekly planning (15 minutes)

1. Open last week's review ([[Flow - Daily Devlog and Weekly Review in Obsidian]]).
2. Write your **available hours** honestly (school, work, family). Plan for 70% of that; the rest disappears into bugs and life. (70% is a rule of thumb, not data.)
3. Pick **three** tasks. Each must be finishable in the week and visible in a playtest ("shop UI buys and saves an item" not "work on shop").
4. Estimate each in sessions, not hours. If the total exceeds your 70%, cut, do not squeeze.
5. Put a fourth slot for **bugs and polish**. It is always used.

## Timeboxing a session

- Start with the "next session starts with" line from your last devlog.
- Set a timer for the session (60-90 minutes works for many people).
- At the end, **stop even if close**. Write the next step in the devlog. Stopping mid-flow makes the next start easy.
- Hard problem eating the whole box? Write the question down, timebox research to 30 minutes, then ask the DevForum, a friend or an AI with a minimal repro instead of grinding alone.

## Rules that stop scope creep

- **New idea = new note, not new task.** Ideas go to an `Ideas` note with no date. Only the weekly plan can promote them.
- **Feature flags over branches**: half-done features can ship disabled ([[Branching for Small Roblox Teams - Trunk-Based with Feature Flags]]).
- **One system at a time.** Two half-built systems are worth less than one finished one.
- **Ship to a test place weekly**, even if only friends play. A weekly build is the best progress measure there is.
- **Cut list.** Keep a visible list of things you decided not to build. Re-reading it is surprisingly calming.

## Using AI without losing the week

AI makes starting cheap, which makes over-scoping easier. Before asking an AI to build something, check it is on this week's list. Generated features you did not plan still need testing, balancing and support.

## A simple Obsidian board

Use a Bases view or a plain note with three headings: **This week**, **Next**, **Done**. Move lines between them; at the weekly review, clear Done into the review note. See [[Obsidian Bases for Game Design Trackers]] for a kanban-style view.

## Signs your plan is too big

- Top 3 missed two weeks in a row.
- You are avoiding opening the project.
- "Almost done" for a third week.

The fix is always the same: smaller tasks, fewer of them, ship something playable this week. Community advice on the DevForum says much the same: start smaller and master basics before ambitious builds.

## Related
[[Obsidian Workflow - Hub]] · [[Starter - Scoping Your First Real Game - One Loop and a Cut List]] · [[Marketing - Content Calendar for a Solo Dev Creator]] · [[Flow - Sustainable Dev Pace - Spotting and Avoiding Burnout]]
