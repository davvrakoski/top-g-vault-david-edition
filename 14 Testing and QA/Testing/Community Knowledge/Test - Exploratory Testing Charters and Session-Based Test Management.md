---
area: "14 Testing and QA"
cluster: "Testing"
title: "Exploratory Testing Charters and Session-Based Test Management"
tags: [roblox, community-knowledge, testing, exploratory-testing, sbtm, charters]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://www.satisfice.com/download/session-based-test-management
  - https://pragprog.com/titles/ehxta/explore-it/
  - https://create.roblox.com/docs/studio/testing-modes
---
# Exploratory Testing Charters and Session-Based Test Management

Checklists catch regressions in things you already thought of. Exploratory testing finds the bugs nobody wrote down: the wall you can climb with a jump-pad and a speed potion, the shop that breaks when you buy with exactly zero coins left. The risk is that "just play the game and look for bugs" turns into unfocused play with nothing to show for it. **Session-based test management** (SBTM), developed by James and Jon Bach, fixes that by putting exploration into short, chartered, reported sessions. Elisabeth Hendrickson's book *Explore It!* (2013) adds a simple way to write the charters. Both fit a small Roblox team that cannot afford a full QA department.

## The charter

A charter is one line that sets a mission without scripting steps. A form widely cited from *Explore It!* (exact book wording unverified; the book's page confirms it teaches charter writing):

> Explore **(target)** with **(resources)** to discover **(information)**

Roblox examples:

- Explore **the new pet trading window** with **two accounts and a laggy network preset** to discover **ways to lose or duplicate pets**.
- Explore **the obby stages 10-20** with **a phone in portrait and a gamepad** to discover **jumps that are impossible or skippable**.
- Explore **the first five minutes** with **a fresh account and no tutorial knowledge** to discover **where new players get confused**.
- Explore **the shop UI** with **Player Emulator elongated German text** to discover **clipped or overlapping labels**.
- Explore **vehicle spawning** with **many cars and StreamingEnabled at a small radius** to discover **cars that fall through the map or lose parts**.

Good charters are narrow enough to finish in one session and name the risk, not the steps.

## The session

- **Time box**: 45-90 minutes, uninterrupted. Shorter for a quick probe, but always fixed in advance.
- **One tester, one charter.** Pairing (one drives, one notes) works very well for game testing.
- **Notes as you go**: what you tried, what you saw, questions, bugs. Timestamps help match against server logs.
- **Stay roughly on charter.** If you find a great unrelated lead, write it down as a new charter instead of chasing it.

## The session sheet

Keep a short template (a markdown file or a form):

```
Charter: Explore trading window with 2 accounts + laggy preset to discover dupes/loss
Tester: ___   Date: ___   Build/place version: ___
Duration: 60 min    Time split: test __% / bug investigation __% / setup __%
Areas covered: trade request, accept spam, leave mid-trade, rejoin
Bugs filed: #142 (S1), #143 (S3)
Issues/questions: Is a trade allowed while the other player is in a cutscene?
New charter ideas: trades during server restart notice
```

The test / bug / setup split is the useful metric: if setup eats half of every session, invest in QA commands and test places before running more sessions.

## The debrief (10 minutes)

Right after each session, the tester and the lead talk through: what was covered, what was not, bugs found, what made testing hard, and whether a follow-up charter is needed. The debrief is what turns sessions into coverage you can reason about.

## Planning a release with charters

1. List the risky changes in the release (new system, refactor, new platform).
2. Write 1-3 charters per risk.
3. Assign sessions across the team over a few days; mix devices.
4. Track charters as done / follow-up needed. Anything that found an S1 gets a regression checklist entry afterwards.

For a 3-person team, four or five 60-minute sessions per release is a realistic, high-value budget.

## Roblox-specific tips

- Run sessions on a published test place when the charter touches teleports, purchases, filtering or anything Studio does not emulate.
- Use multi-client **Server and Clients** testing in Studio for interaction charters; it is cheaper than coordinating real people.
- Record the session (OBS or any screen recorder) for any S1-hunting charter; videos settle "how did you do that?" quickly.

## Related

[[Testing - Hub]] · [[Playtest Scripts and Session Facilitation]] · [[Bug Report Template]] · [[QA Test Plan Template for Roblox Experiences]]
