---
area: "13 Growth and Monetization"
cluster: "LiveOps Social"
tags: [deep-dive, roblox, liveops, events, update-cadence, calendar, planning]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# LiveOps Calendar and Update Cadence Planner

## Why this matters
Roblox's own guidance is blunt: Roblox players expect regular updates, it is "much harder to regain a user's interest than it can be to maintain active ones", and a **weekly** cadence is ideal, **monthly** at minimum. Updates also feed discovery: the recommendation system explores new cohorts after content updates.
A calendar that mixes small cadence drops, events and big updates, built on reusable systems, is how small teams keep that pace without burning out.

---

## 1. What Roblox recommends (quoted guidance, Creator Docs)

| Source page | Guidance |
|---|---|
| Monetization › Live ops | **Weekly cadence is ideal; at minimum monthly.** Keep each update focused on one **theme**. Let players **earn** access to new content |
| Content updates | Cadence content should take **fewer than three weeks' effort**; many games release cadence updates **every two weeks to one month** |
| Retention › D30 | Smaller updates on existing mechanics **every 2–4 weeks**; bigger feature updates **every 2–3 months** |
| LiveOps planning | Two interleaved types: **events** (temporary) and **content updates** (permanent). Plan → Communicate → Monitor |
| Discovery FAQ | Home traffic peaks are weekly (usually **Saturday**) plus summer/back-to-school and holiday seasonality |

---

## 2. Three content tiers

| Tier | Example | Effort | Frequency to aim for | Built from |
|---|---|---|---|---|
| **Cadence drop** | 5 new pets, 3 skins, 1 map variant, a quest chain | Days, < 3 weeks | Weekly to bi-weekly | Existing systems + art variants |
| **Event** | Weekend double XP, a 2-week Halloween hunt with event currency | 1–3 weeks | Monthly, around seasons | Event framework + Configs |
| **Major update** | New zone, new mode, new system | 4–12 weeks | Every 2–3 months | New code and art |

The rule from *Content updates*: cadence content must use systems that **already support variations**. If a drop needs a new system, it is an expansion, and treating it as a "weekly drop" is how teams burn out.

**Make content last:** gate drops behind progression or event currency so most players need **weeks** to finish them. Otherwise players exhaust a drop in a day and you're forced to release faster.

---

## 3. A 12-week calendar template

| Week | Cadence drop (Thu) | Event | Major | Comms |
|---|---|---|---|---|
| 1 | Pet set A | — | Zone 4 in production | Dev log teaser |
| 2 | Skin set A | Weekend 2× coins (Config) | | Discord poll for next set |
| 3 | Quest chain | — | | |
| 4 | Pet set B | **Event: Harvest Hunt** (2 weeks, event currency) | | Experience Event created ≥ 7 days before, Off-Platform submit |
| 5 | Event shop rotation | Harvest Hunt week 2 | | Update announcement (≤ 60 chars) |
| 6 | Map variant | — | Zone 4 playtests | |
| 7 | Skin set B | — | Zone 4 lock | Teaser thumbnails prepared |
| 8 | — (buffer) | — | **Zone 4 release** | Thumbnail personalization refresh; Event "Zone 4 Launch" |
| 9 | Zone 4 cosmetics | — | Hotfix window | Patch notes |
| 10 | Pet set C | Weekend event | Next major starts | |
| 11 | Quest chain | — | | |
| 12 | Retro / buffer | Holiday event prep | | Quarterly roadmap post |

Build in **buffer weeks**. Missing a cadence beat is better than shipping broken content (see [[Release Readiness Runbook 2026]]).

---

## 4. Running an event end to end

### Plan
- **One KPI per event** (D7 of returning players, DAU, or event-currency spend), but expect several to move.
- **Economy impact first:** model sources and sinks with participation multipliers; prefer a **separate event currency** with an event shop (see [[Economy Sources and Sinks Spreadsheet Model]]).
- **Switch it with Configs**, not a publish: `events.harvestEnabled`, `events.harvestDropRate`, start/end times as JSON. You can then stage, test and publish in about a minute, and roll back from History (see [[Experiments and Configs - In-Game A-B Testing]]).

```lua
-- Server: time-boxed event driven by a JSON config
-- Config "events.harvest" = {"start": 1762300800, "finish": 1763510400, "dropRate": 0.15}
local Config = require(script.Parent.Config)

local function harvestActive(): boolean
	local cfg = Config.get("events.harvest")
	if type(cfg) ~= "table" then return false end
	local now = workspace:GetServerTimeNow()
	return now >= cfg.start and now < cfg.finish
end
```

### Communicate
- **Experience Events** (Creator Hub › Engagement › Events & Updates): up to **10** ongoing/upcoming events; title, subtitle, description, category, up to 5 event thumbnails, start/end, optional event place, public or private. Players see a **Notify Me** button and get stream (and optional push) notifications at start.
- **Trending Events in Experiences** chart: the event must have **started in the last 7 days**, have **≥1,000 RSVPs** and be **public**.
- **Update announcements:** up to **60 characters**, at most **once every three days**, sent to opted-in followers. Be specific: "New ice zone + 12 pets", not "bug fixes".
- **Off-Platform Featuring:** toggle *Submit for Featuring* when creating the event, **at least 7 days before** start. The docs say the best events run **7–30 days**; avoid editing after submitting.
- **Experience notifications** for personal moments ("Your egg hatched") (see [[Invites, Referrals, Share Links and Notifications]]).
- Community channels: Discord and social (see [[Community Management Playbook - Discord, Feedback and Crisis Comms]]).

### Identify event players
Players who join from an event surface (event notification, event page Join button) carry the event ID in their join data, so you can show an event welcome:

```lua
-- Server (from the Experience events docs)
game:GetService("Players").PlayerAdded:Connect(function(player)
	local joinData = player:GetJoinData()
	local eventId = joinData and joinData.GameJoinContext and joinData.GameJoinContext.EventId
	if eventId then
		player:SetAttribute("JoinedFromEvent", eventId) -- show an event welcome on the client
	end
end)
```

### Monitor and analyze
- **Hourly, same-day data** during launch: are prizes being granted too fast, can players complete the objectives?
- Compare the **week before vs the week after**. Did the event lift retention and sales beyond the event itself, or just pull purchases forward?
- Use a LiveOps custom dashboard: participation funnel, event currency sources/sinks, D7 of the event cohort, revenue by SKU (see [[Analytics Custom Events, Funnels and Dashboards Setup]]).

---

## 5. Choosing release days

| Consideration | Implication |
|---|---|
| Home traffic peaks on **Saturday** | Releasing **Thursday/Friday** puts fresh content in front of the weekend audience |
| Your team needs to watch the release | Avoid releasing right before nobody is available; pair the release day with an on-call window |
| Teleports and server versions | Old servers keep running old code until shut down or migrated; plan migrations (see the runbook) |
| Global audience | "Morning" differs by region; check your Analytics breakdown by country before picking an hour |

---

## 6. Sustainability rules for small teams
- **Template everything:** event framework, shop rotation, quest chains, pet/skin pipelines. Each new drop should be data, not code.
- **One theme per update** (the docs' "Zoo" example): makes art and comms coherent and helps returning players see what's new.
- **Ration novelty:** don't spend three systems in one update when you could ship them across three.
- **Weekly ritual:** Monday metrics review (30 min) → Tuesday content lock → Wednesday QA → Thursday release → Friday watch + community.
- **Retro every 4 weeks:** what slipped, what retained, what to cut.

---

## Common mistakes
- No cadence for months, then one giant update (hard to regain lapsed players).
- Events that pour main currency into the economy.
- Event switches that require a publish and a server restart, instead of Configs.
- Creating the Experience Event the day before (no Notify Me audience, too late for featuring).
- Vague update announcements ("bug fixes") or announcing more often than every three days.
- Cadence drops that need new systems.
- Measuring events only during the event, not the week after.
- Holiday themes that don't fit your global audience; the docs note holidays aren't universal.

## Checklist
- [ ] 12-week calendar with tiers, buffer weeks and comms columns
- [ ] Every event modelled for economy impact; separate event currency where possible
- [ ] Event toggles and timings in Configs, tested staged, history-backed
- [ ] Experience Event created ≥ 7 days ahead (+ Off-Platform submission if eligible)
- [ ] Update announcement drafted (≤ 60 chars, specific)
- [ ] LiveOps dashboard ready before launch; hourly checks on day 1
- [ ] Week-before/after comparison written up
- [ ] Monthly retro done

---

**Sources checked (2026-10-25):** Creator Docs: Monetization (Live ops section); Game design › Content updates; LiveOps planning; Analytics › Retention (D30); Promotion › Experience events and updates; Production › Experience configs; Discovery FAQ (seasonality).

**Related:** [[LiveOps Social - Hub]] · [[LiveOps and Content Rotation]] · [[LiveOps, Events and Content Rotation]] · [[Daily and Weekly Reward Blueprint]] · [[Release Rings and Rollback Strategy]]
