---
area: "13 Growth and Monetization"
cluster: "Publishing Release"
title: "Soft Launch Playbook - Private Test to Public in Four Stages"
tags: [roblox, community-knowledge, publishing, launch, playtest, analytics, ads]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/publishing/publish-games-and-places
  - https://create.roblox.com/docs/projects/groups
  - https://create.roblox.com/docs/production/promotion/ads-manager
  - https://create.roblox.com/docs/production/analytics/retention
  - https://create.roblox.com/docs/production/experiments
  - https://create.roblox.com/docs/production/publishing/kids-and-select
---
# Soft Launch Playbook - Private Test to Public in Four Stages

Roblox's discovery gives a new game a short window to prove itself, and community postmortems (see the launch teardowns in Community Resources) keep repeating the same lesson: launch publicly before the first session works, and the first wave of players never returns. A **soft launch** means getting real players and real numbers in small, controlled steps before you spend on ads or call in YouTubers.

## Stage 0: internal (team only)

- Game private; team members access via group roles (**Universe Player** lets members play unreleased group games).
- Goal: no blockers, saves work across servers, purchases fulfill in a test place.
- Exit: one full session from spawn to first major reward without help.

## Stage 1: friends and testers (10-50 people)

- Invite testers into a **Tester** role in your Roblox Community; mirror it to a Discord channel.
- Watch people play (screen share or in person). Note every moment they stop or ask "what now?".
- Add analytics now: onboarding funnel steps, a custom event per core loop action, economy events.
- Exit: testers voluntarily play a second day.

## Stage 2: small public (organic only, 1-2 weeks)

- Publish publicly with honest thumbnails and a clear description; don't promote yet.
- Remember the Kids/Select framework: new games first reach **age-checked 16+ users** until evaluated; plan your test audience accordingly.
- Read the **Retention** dashboard by daily cohort, and the funnel. Fix the biggest drop-off, ship, compare the next cohorts.
- Run one **Experiment** if you have the traffic (e.g. tutorial variant) rather than guessing.
- Exit criteria (yours to set), e.g. D1 trend rising for 2 weeks and median session > 10 minutes.

## Stage 3: paid trickle (small ad budget)

- Ads Manager **Plays** goal with a small **daily budget**. Ignore the first 24 h (**Learning** status).
- Judge by **CPP** and by the retention of the ad cohort, not by total visits.
- Test 2-3 thumbnails via thumbnail personalization while traffic flows.
- Exit: ad cohort retention close to organic; payback math acceptable (see Unit Economics note).

## Stage 4: launch push

- Schedule an **Experience Event** for launch day, prepare share links for creators, announce in your Community and Discord.
- Have a rollback plan and someone online for the first 48 hours.

## Things to fix before Stage 2 (checklist)

- [ ] Mobile controls and UI scale tested on a real phone.
- [ ] First reward within ~1-2 minutes.
- [ ] Data saving tested with leave/rejoin and server shutdown.
- [ ] Maturity questionnaire completed honestly.
- [ ] Genre chosen (it's locked for three months after changes).
- [ ] Error report dashboard clean of top crashes.

## Pitfalls

- Treating Stage 2 numbers from 30 players as truth; wait for enough cohorts.
- Buying ads before D1 is acceptable: you pay to show players a broken first session.
- Changing many things per update so you can't tell what helped.

## Related
[[Publishing Release - Hub]] - [[Release Checklist]] - [[Turning a Weak Launch Around - The Honeymoon Window]] - [[Fantasy Forest Launch Postmortem - 0 to 2000 CCU in 4 Weeks]]
