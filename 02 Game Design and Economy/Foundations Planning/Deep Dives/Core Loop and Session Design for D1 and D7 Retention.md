---
area: "02 Game Design and Economy"
cluster: "Foundations Planning"
tags: [deep-dive, roblox, retention, core-loop, session-design]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Core Loop and Session Design for D1 and D7 Retention

## Why this matters
Roblox's Home recommendations rank games on what organically acquired players do after they join: whether they bounce in the first minutes, how many days they come back, and how long they play.
A core loop that is fun but has no session shape (a clear start, a payoff and a reason to return) leaks players at exactly the points the algorithm measures.

---

## 1. What D1 and D7 actually measure on Roblox

Use Roblox's own definitions, not generic mobile ones, so your dashboard and your design talk about the same thing:

| Metric | Roblox definition (Creator Analytics, Retention page) | Design lever |
|---|---|---|
| **D1 retention** | Users who first played on day X and returned the next day | Core loop clarity, first-time user experience (FTUE), performance |
| **D7 retention** | Users who first played on day X and returned on the 8th day | Progression system: short and long goals, content variety, difficulty curve |
| **D30 retention** | Returned on the 31st day | "Ending system": late content, social mechanics, regular updates |

Retention charts are **cohort-based**: the x-axis is the new user's first play date. A dip on one date means the users acquired that day retained worse, often after a traffic spike from an ad or event. Do not read a single cohort as a trend.

The discovery signals Roblox publishes (see [[Home Recommendations - What Roblox Documents About Discovery]]) map directly onto session design:

- **First play bounce rate** is measured in two windows: under 60 seconds and 61–180 seconds. Your first three minutes are graded twice.
- **Play days per user** is split into Day 1, Day 2–7 and Day 8–28. That is a frequency signal, so "come back tomorrow" design matters as much as long sessions.
- **Playtime per user** is capped at 60 minutes per user, per game, per day in the signal. A 4-hour grind session does not count more than 60 minutes; spreading value across days does.

> [!note] What is not documented
> Roblox does not publish "good" D1/D7 numbers. The Retention and Home Recommendations dashboards show benchmarks against similar games; use those, not numbers from forums. Benchmarks do not affect ranking.

---

## 2. The three-layer core loop (Roblox's model, made usable)

Roblox's game-design docs split a core loop into three parts. Write each one down as a single sentence before you build anything:

1. **Minute-to-minute interaction**: the constant verb. *"I run and jump between platforms."*
2. **Most repeated set of actions**: the defining mechanic built from that verb. *"I clear a stage of 6–10 jumps."*
3. **Progression engine**: what makes repetition matter. *"Each clear gives coins that unlock a new world and a trail."*

If you cannot write layer 3, the game will retain on D1 (novelty) and collapse by D7 (no reason to return).

### Loop timing targets you control

There are no official numbers here. These are design budgets to test, not guarantees:

| Loop | Typical length to aim for | Must deliver |
|---|---|---|
| Micro loop (one action set) | 10–60 s | Feedback (sound, VFX, number popup) every repetition |
| Session loop | 8–25 min | At least one visible upgrade or unlock per session |
| Meta loop | Days to weeks | A goal the player can see but not finish today |

---

## 3. Designing the first session minute by minute

The Retention docs say to get users "to the fun as quickly as possible, ideally in 5 minutes or less". Treat that as the upper bound. A working schedule:

| Time in session | Goal | Implementation notes |
|---|---|---|
| 0–10 s | The player can move and sees where to go | Spawn facing the first objective. No modal popups before control. |
| 10–60 s | First core action completed | Proximity prompt or highlighted target. Reward instantly. |
| 1–3 min | First complete micro loop plus the first currency payoff | This window is the 61–180 s bounce bucket. |
| 3–5 min | First progression choice (spend currency, pick an upgrade) | Show the next unlock and its cost so the goal is concrete. |
| 5–15 min | Second system introduced (pets, quests, social) | One new system at a time. |
| Session end | A visible unfinished goal | "2 of 3 daily quests", "380/500 coins to the next zone". |

### Instrument it before you tune it

Log each FTUE step as an onboarding funnel step from the **server** (Analytics events cannot be sent from the client or from Studio; only published games record them):

```lua
-- ServerScriptService/OnboardingFunnel.server.luau
local AnalyticsService = game:GetService("AnalyticsService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local STEPS = {
	[1] = "Joined",
	[2] = "MovedToFirstTarget",
	[3] = "FirstCoreAction",
	[4] = "FirstCurrencyEarned",
	[5] = "FirstUpgradeBought",
	[6] = "SecondSystemOpened",
}

local reached: {[Player]: number} = {}

local function logStep(player: Player, step: number)
	-- Only move forward; funnels ignore repeats but still count them toward the rate limit.
	if (reached[player] or 0) >= step then
		return
	end
	reached[player] = step
	AnalyticsService:LogOnboardingFunnelStepEvent(player, step, STEPS[step])
end

Players.PlayerAdded:Connect(function(player)
	logStep(player, 1)
end)

Players.PlayerRemoving:Connect(function(player)
	reached[player] = nil
end)

-- Server systems call this when the server itself confirms the action.
-- If a client RemoteEvent reports a step, validate the number before logging it.
local remote = Instance.new("RemoteEvent")
remote.Name = "OnboardingStep"
remote.Parent = ReplicatedStorage
remote.OnServerEvent:Connect(function(player, step)
	if typeof(step) ~= "number" or step ~= math.floor(step) or step < 2 or step > #STEPS then
		return
	end
	logStep(player, step)
end)

return logStep
```

Rules from the funnel docs that change how you read this data:
- Repeated steps only count the first time. Skipped steps auto-complete earlier steps, so log the final step only when it truly happened.
- Funnels are attributed to the cohort and device of the **first** step.
- If you change a step definition, set the dashboard date range to start after the change.

Better still, log steps from server code that already knows the action happened (coin granted, upgrade purchased) rather than trusting a client message.

---

## 4. Designing return hooks that Roblox players accept

The Roblox monetization docs warn that "appointment mechanics and timers which can be removed or brought forward" (pay-to-skip energy and wait timers) are **unpopular with Roblox users**. Build return hooks that create anticipation, not friction:

| Hook | Works because | Avoid |
|---|---|---|
| Daily quests (3 short tasks) | Gives Day 2–7 play days a purpose | Quests that need 2 hours to finish |
| Visible next unlock with progress bar | The player leaves knowing what they will do next | Hiding the next goal behind menus |
| Growth while offline (plants, eggs, factories) | A reason to check in | Selling skips as the main monetization |
| Rotating shop or weekly content | Novelty for returning players | Fake "limited" stock that never changes (Roblox treats this as misleading) |
| Social commitments (party goals, co-op events) | Co-play days are a documented "important" signal | Forcing invites to progress |
| Streak rewards with grace days | Builds habit | Wiping streaks harshly, which teaches players to quit |

### Save a "next goal" at the end of every session

```lua
-- Inside your existing data-save flow (pseudocode around your own DataStore wrapper).
local function computeNextGoal(profile)
	if profile.Coins < profile.NextZoneCost then
		return { kind = "Zone", need = profile.NextZoneCost - profile.Coins }
	end
	return { kind = "DailyQuest", need = 3 - profile.DailyQuestsDone }
end

Players.PlayerRemoving:Connect(function(player)
	local profile = Profiles[player]
	if profile then
		profile.Data.NextGoal = computeNextGoal(profile.Data)
		-- The save itself happens in your DataStore module, ideally session-locked.
	end
end)
```

On the next join, show that goal first ("You were 120 coins from the Lava Zone"). Players who return need a re-entry point, not the same tutorial.

---

## 5. D1 and D7 diagnosis table

Run this with the Retention cohort table plus your funnel and custom events (see [[Analytics Custom Events, Funnels and Dashboards Setup]]):

| Symptom | Likely cause | First fix to try |
|---|---|---|
| High bounce under 60 s | Long load, unreadable spawn, UI wall, thumbnail promised something else | Load the spawn area first, remove pre-control popups, compare the thumbnail to the first 30 seconds |
| Bounce in the 61–180 s window | First loop is unclear or unrewarding | Shorten time-to-first-reward, add feedback juice, test with 5 new players (see [[Playtest Scripts and Session Facilitation]]) |
| Good D1, poor D7 | Progression too flat or exhausted in session 1 | Add a 3-day and 7-day goal; slow the first-session unlock rate |
| D7 fine but play days per user low | Long sessions, no daily reason | Daily quests, offline growth, weekly rotation |
| Mobile retains worse than PC | Controls, UI scale or performance | Device pass (see [[Device, Network and Controller Simulation Test Pass]]) |
| Retention drops after an update | Regression or a disliked change | Check alerts and crash rate; roll back configs; compare cohort before and after |

---

## 6. Using Configs and Experiments to tune loops safely

Don't hard-code pacing numbers. Put them in Experience Configs (`ConfigService`) so you can change them without a server restart, and A/B test the important ones with in-game Experiments, which track D1 and D7 retention, playtime and payer conversion per variant. See [[Experiments and Configs - In-Game A-B Testing]]. Typical candidates:

- `ftue.firstRewardCoins`
- `progression.zone2Cost`
- `daily.questCount`
- `offline.growthHours`

Experiments run 14–60 days, so do not change the tested system mid-run.

---

## Common mistakes
- Designing a great 30-minute session with no reason to return tomorrow, which earns D1 but not play days.
- Front-loading every system in the first 5 minutes; new players need one verb, one reward, one goal.
- Sending onboarding analytics from the client or testing them in Studio and wondering why the dashboard is empty.
- Logging a funnel step when the player attempts an action instead of when the server confirms it.
- Copying mobile pay-to-skip timers; Roblox's docs say this pattern is unpopular with its audience.
- Reading one dipped cohort after an ad burst as "the game got worse".
- Chasing forum retention numbers instead of the similar-game benchmark in your own dashboard.
- Making the long grind the only goal; playtime above 60 minutes per day doesn't add to the recommendation signal.

## Checklist
- [ ] The three core-loop layers are written in one sentence each
- [ ] The player can move within seconds of spawning, with no blocking modal
- [ ] First reward lands inside 60 seconds; first progression choice inside 5 minutes
- [ ] Onboarding funnel steps are logged server-side, validated, from a published build
- [ ] Every session ends with a visible, unfinished goal saved to the profile
- [ ] There is at least one daily and one weekly return hook that does not depend on a pay-to-skip timer
- [ ] Pacing numbers live in Configs, not constants
- [ ] The Retention cohort table and Home Recommendations signals are reviewed weekly
- [ ] One experiment at a time on the loop, run for its full duration

---

**Sources checked (2026-10-25):** Creator Docs: Analytics › Retention; Analytics › Funnel events; Game design › Core loops; Monetization (strategies section); Discovery and Discovery FAQ.

**Related:** [[Foundations Planning - Hub]] · [[First 10 Minutes Retention Design]] · [[Tutorial, Onboarding and FTUE]] · [[Game Design, Balancing and Difficulty]] · [[Discovery, Retention and Analytics]] · [[Daily and Weekly Reward Blueprint]]
