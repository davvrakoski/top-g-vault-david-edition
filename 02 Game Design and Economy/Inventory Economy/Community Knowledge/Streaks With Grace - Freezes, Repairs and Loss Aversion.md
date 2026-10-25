---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
title: "Streaks With Grace - Freezes, Repairs and Loss Aversion"
tags: [roblox, community-knowledge, retention, daily-rewards, streaks, liveops]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://blog.duolingo.com/improving-the-streak
  - https://blog.duolingo.com/how-duolingo-streak-builds-habit
  - https://making.duolingo.com/how-streaks-keep-duolingo-learners-committed-to-their-language-goals
  - https://create.roblox.com/docs/resources/feature-packages/engagement-rewards
  - https://create.roblox.com/docs/production/analytics/retention
---
# Streaks With Grace - Freezes, Repairs and Loss Aversion

Daily login streaks are the most copied retention feature on Roblox, and the most often done badly: miss one day, lose a 40-day streak, quit forever. The best public data on streaks comes from Duolingo, which A/B tests its streak constantly and blogs about it. Their lessons transfer directly to games.

## What Duolingo found (their own reported numbers)

- **Make the daily bar low.** Duolingo once required the full daily goal to extend a streak. They changed it so **one lesson** extends the streak (the goal is tracked separately). In their A/B test this raised day-14 retention by 3.3% and daily active learners by 1% (relative).
- **Streaks become loss aversion over time.** Early on, extending the streak feels like progress; for long streaks the motivation shifts to not wanting to lose it.
- **Add slack.** The Streak Freeze exists so a missed day doesn't destroy the habit.
- They report learners with a 7-day streak were 2.4x more likely to come back the next day than learners without one.

Take the direction, not the exact numbers: these are self-reported results from a language app.

## Translating to a Roblox game

1. **The streak action should take under 2 minutes.** "Join and claim" or "complete 1 match", not "play 30 minutes". Put the heavy goals in daily quests instead.
2. **Use UTC day boundaries** from server `os.time()` / `os.date("!*t")`, and show a countdown ("Next reward in 05:12:40"). Never use the client clock.
3. **Grace mechanics** (pick one or two):
   - Free **streak freeze** earned every 7 days, max 2 stored.
   - **Repair**: within 48 h of a break, restore by finishing a harder task (avoid selling repairs for Robux to young players; it reads as pressure).
   - **Soft reset**: drop to the start of the current week (day 8 -> day 7) instead of to zero.
4. **Rewards curve:** small daily, a bigger day 7, a cosmetic or title at day 30. Make the big reward visible from day 1.
5. **Claim button, not auto-grant.** Roblox's own season pass guidance favours manual claiming so players see what they got and return to the UI.

## State model

```lua
-- Own example: saved fields + day math (server)
-- profile.Streak = { day = 0, lastClaimDay = -1, freezes = 0 }
local function utcDay(t: number): number
	return t // 86400
end

local function onClaim(profile)
	local today = utcDay(os.time())
	local s = profile.Streak
	if s.lastClaimDay == today then return false end
	local gap = today - s.lastClaimDay
	if gap == 2 and s.freezes > 0 then
		s.freezes -= 1                -- freeze covers the one missed day
	elseif gap > 1 and s.lastClaimDay >= 0 then
		s.day = math.max(0, s.day - (s.day % 7)) -- soft reset to week start
	end
	s.day += 1
	s.lastClaimDay = today
	if s.day % 7 == 0 then s.freezes = math.min(2, s.freezes + 1) end
	return true
end
```

## Measure it

- Retention dashboard: D1/D7 for players who claimed day 1 vs those who didn't.
- Custom event on streak break and on freeze use. If many players break at the same day, that reward is too weak or the bar is too high.

## Pitfalls

- Streak notifications that guilt young players ("Your pet is sad!") can cross into manipulative design; keep tone positive.
- Time zones: a UTC reset lands mid-afternoon for some regions. That is fine as long as the countdown is visible.

## Related
[[Inventory Economy - Hub]] - [[Daily and Weekly Reward Blueprint]] - [[Core Loop and Session Design for D1 and D7 Retention]] - [[LiveOps Calendar and Update Cadence Planner]]
