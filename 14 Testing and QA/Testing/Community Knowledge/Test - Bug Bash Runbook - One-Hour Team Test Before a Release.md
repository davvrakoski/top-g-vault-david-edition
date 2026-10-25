---
area: "14 Testing and QA"
cluster: "Testing"
title: "Bug Bash Runbook - One-Hour Team Test Before a Release"
tags: [roblox, community-knowledge, testing, bug-bash, team, release]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/studio/testing-modes
  - https://create.roblox.com/docs/education/developer/beta-testing-experiences
  - https://create.roblox.com/docs/production/analytics/error-report
---
# Bug Bash Runbook - One-Hour Team Test Before a Release

A bug bash is a short, focused session where the **whole team** (programmers, builders, artists, the community manager) plays the release candidate at the same time and files bugs. It works on Roblox because multiplayer bugs need many real people in one server, and a 4-8 person team rarely gets that otherwise. Unlike a playtest with outside players ([[Playtest Scripts and Session Facilitation]]), the goal is not feedback on fun; it is **finding defects before players do**, in one hour, with a clean list at the end. Run one a day or two before every significant release.

## Before (organiser, 30 minutes)

1. **Build**: publish the release candidate to the staging or test universe. Write the place version in the invite.
2. **Areas**: split the release into 4-6 areas (new feature, shop, saving, mobile, first-time experience, old core loop). Assign one or two people per area, deliberately putting people on areas they did **not** build.
3. **Accounts**: each tester has a fresh-ish account plus their main. Give testers QA command access ([[QA Test Commands - Gated Cheats for Testers]]) so they can skip grinding.
4. **Devices**: make sure at least one phone, one tablet and one gamepad are in the session.
5. **Filing**: one shared place for bugs (GitHub issue form, see [[Test - Bug Tracker Setup for Small Teams - GitHub Issue Forms and Labels]], or a shared sheet). Agree the minimum: title, steps, device, place version, severity guess, screenshot or clip.
6. **Server**: everyone joins the same server (join a friend or use a private/reserved server on staging) so multiplayer cases get real load.

## The hour

| Minutes | What happens |
| --- | --- |
| 0-5 | Organiser reads the release notes aloud: what changed, what is risky, the areas and who has which |
| 5-35 | Area testing. Stay in your area; file as you go. Shout S1s in voice chat immediately |
| 35-45 | **Chaos round**: everyone in one place does the same thing at once (all buy, all trade, all reset, all leave and rejoin) |
| 45-55 | Free roam: try to break anything, especially across areas |
| 55-60 | Stop filing. Organiser counts bugs per area and calls out S1s |

The chaos round is the part teams skip and should not: simultaneous actions are where race conditions, dupes and server spikes appear. Have the organiser watch the server's Developer Console (memory, script activity) during it.

## Rules that keep it useful

- **File, don't fix.** Developers who start fixing during the bash stop testing. Fixes come after.
- **Duplicates are fine.** The organiser merges them later; two people hitting the same bug is useful data.
- **One bug per report.** "Shop is buggy" is not a report.
- **Clip everything odd.** Short recordings make repro steps far less important.
- **Note the place version** in every bug, because a hotfix publish mid-bash changes the build.

## After (organiser, 30-60 minutes, same day)

1. Merge duplicates, set severity, assign owners.
2. Check the **Error Report** for the staging game during the bash window: errors nobody noticed in game still count. Use **New errors since** the release candidate version.
3. Decide: ship as planned, ship after fixing S1/S2, or delay.
4. Post a short summary to the team: number of bugs by area and severity, the go/no-go decision, and what will be re-tested.
5. Add every S1/S2 to the relevant regression checklist so it is checked on future releases.

## Signs the bash worked

- Bugs spread across areas, not all in the newest feature.
- At least one bug found by a non-programmer.
- The chaos round found something, or confirmed with data (memory, errors) that it was fine.

## Related

[[Testing - Hub]] · [[Team Test - Collaborative Playtesting in Studio]] · [[Test - Exploratory Testing Charters and Session-Based Test Management]] · [[Release Readiness Runbook 2026]]
