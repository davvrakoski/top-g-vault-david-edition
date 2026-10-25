---
area: "13 Growth and Monetization"
cluster: "Analytics Discovery"
tags: [deep-dive, roblox, experiments, ab-testing, configs, configservice, liveops]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Experiments and Configs - In-Game A-B Testing

## Why this matters
Roblox now ships first-party **Experience Configs** (change live values without restarting servers) and **Experiments** (A/B tests that measure D1/D7 retention, playtime and revenue per variant, with statistical significance). Together they replace a lot of homemade feature-flag and A/B code.
Used well, they let you tune a live game safely and prove which change helped. Used badly (enrolling everyone at join, peeking early, changing content mid-test), they produce confident wrong answers.

---

## 1. Configs: live values without a publish

From Creator Docs › Experience configs:

| Fact | Detail |
|---|---|
| Value types | string, number, boolean, JSON object |
| Size limits | String and JSON up to **100,000 characters**; numbers are doubles (exact integers up to ±2^53) |
| Count | Up to **1,000 active configs** |
| Lifecycle | Create → **staged** (visible in your team's Studio play sessions only) → **Publish now** (~15 s to 1 min) or **Publish over 15 min** (gradual) |
| History | Every publish logged with author and message; **Restore** stages the previous value (discarding other staged changes) |
| Studio | **File › Open Configs**; **Publish As** copies all configs to another experience (fully overwriting it), handy for staging → live |
| Targeting | Conditional values by Country, Language, New vs returning, Source, When first played, In-experience payer status, In-experience activity status, User engagement, Platform spender status, Platform activity status |
| Targeting limits | **100 conditions per game**, **20 per key**; rules are ordered **globally** (top-down, first match wins) |

Code rules:
- `ConfigService` is **server-only**; client calls error.
- `ConfigService:GetConfigAsync()` gives a global snapshot (no targeting, no experiments).
- `ConfigService:GetConfigForPlayerAsync(player)` gives a per-player snapshot (targeting **and** experiments).
- Snapshots are **point-in-time**. Updates don't apply until you call `snapshot:Refresh()`. Listen to `UpdateAvailable`, then `GetValueChangedSignal(key)`.
- If configs have never loaded, `GetConfigAsync` **throws**; if the connection drops later, it returns the last values and reconnects. Wrap it in `pcall` and keep code defaults.
- Test without affecting players: `ConfigService:SetTestingValue(key, value)` (this server only, or this Studio session) and `ClearTestingValue`.

```lua
-- ServerScriptService/Config.luau: safe global config access with defaults
local ConfigService = game:GetService("ConfigService")

local DEFAULTS = {
	["economy.zone2Cost"] = 500,
	["events.halloweenEnabled"] = false,
	["ftue.firstRewardCoins"] = 50,
}

local Config = {}
local snapshot

local ok, result = pcall(ConfigService.GetConfigAsync, ConfigService)
if ok then
	snapshot = result
	snapshot.UpdateAvailable:Connect(function()
		-- Refresh at a safe moment; for round-based games, between rounds
		snapshot:Refresh()
	end)
else
	warn("[Config] using defaults:", result)
end

function Config.get(key: string)
	local v = snapshot and snapshot:GetValue(key)
	if v == nil then
		return DEFAULTS[key]
	end
	return v
end

function Config.onChanged(key: string, fn: (any) -> ())
	if snapshot then
		snapshot:GetValueChangedSignal(key):Connect(function()
			fn(Config.get(key))
		end)
	end
end

return Config
```

**Good config candidates:** event on/off switches, drop rates, prices of soft-currency items, boss health, XP curves, featured shop items, MOTD text (JSON), kill switches for risky features.

**Not for configs:** secrets (use the secrets store), anything the client must not know (snapshots are server-side, so keep it that way), and Robux prices (those live in Creator Hub and Managed Pricing).

---

## 2. Experiments: real A/B tests

Two types:
- **In-game**: variants are alternative **config values**. Up to **two variants + control**.
- **Matchmaking**: variants are custom matchmaking configurations (up to **three variants**, split equally); **one at a time**; Roblox highly recommends **100% rollout**. No code changes needed.

Setup (in-game):
1. Have a config key (for example `ftue.firstRewardCoins`, control 50).
2. **Experiments › Create experiment › In-experience**: name, **goal metric**, duration **14–60 days**.
3. **Rollout %**: share of players included. The rest get control and are excluded from results.
4. Variants and split. *Example from the docs:* 40% rollout with a 50/50 split means about 20% control-in-experiment and 20% variant.
5. Optional **targeting** (same attributes as conditional configs).
6. Schedule. After scheduling you **can't change** duration, rollout or variants, only reschedule.

Metrics tracked for every experiment: **D1 retention, D7 retention, Playtime, ARPU, ARPPU, Payer conversion rate, Session time**.

### Enrollment happens on the first `GetValue`, not at join

```lua
-- Only enroll players who actually reach the tested feature
local ConfigService = game:GetService("ConfigService")

local function firstRewardFor(player: Player): number
	local ok, snap = pcall(ConfigService.GetConfigForPlayerAsync, ConfigService, player)
	if not ok then return 50 end
	-- Calling GetValue enrolls this player in the experiment for this key (first call is random; later calls are stable)
	return snap:GetValue("ftue.firstRewardCoins") or 50
end
```

- Call `GetValue` **when the player reaches the tested system**. Early calls enroll people who never see the change and dilute results.
- Enrollment is per key and sticky for the experiment's duration. Experiments also enroll **existing** players, not just new ones.
- **Custom enrollment** by in-game state (only players with ≥20 wins): check your condition first, then call `GetValue`.
- Targeting is evaluated **per session**. If a player stops matching, they fall back to standard config values while their data stays attributed to their original variant. For multi-session tests (a new onboarding), **persist the assigned value** in a data store.
- While running, the **config key is locked** (including referenced global conditions). One active experiment per key.

### Reading results the way Roblox intends

| Phase | What to look at | Action allowed |
|---|---|---|
| First 24 h | **Early harm** (updates every 5 min): Playtime threshold −10%, ARPU −20%, Payer conversion −20%. Flagged only if the *entire* confidence interval is below the threshold; no decisions under 10,000 enrolled players per comparison | Stop early **only** for critical harm or **Sample Ratio Mismatch (SRM)** |
| Daily (after 24 h) | Results with confidence intervals; significant = CI doesn't cross 0% | Wait for the full duration |
| Decision date | **Make decision** guided rollout: keep control, or promote a variant (Roblox rewrites the config accordingly) | Ship the winner or keep control |

Best practices straight from the docs:
- Check the **Minimum Detectable Effect (MDE)** at creation. If MDE is huge (for example >100%), you won't reach significance. **Games under about 1,000 DAU may struggle** to get useful results.
- Write a **hypothesis** first (change → expected effect → why).
- Let tests run their **full duration**; novelty effects swing early results.
- **Don't act without significance.**
- **Avoid content changes during the test**, even ones that seem unrelated. Only run simultaneous experiments you're confident don't interact.
- If one metric rises and another falls, you have to judge the trade-off.
- **Document** findings and decisions.

---

## 3. Experiment backlog template

| ID | Hypothesis | Key | Control → Variant | Goal metric | Rollout | Days | Status |
|---|---|---|---|---|---|---|---|
| EXP-01 | A bigger first reward makes the first loop feel rewarding → higher D1 | `ftue.firstRewardCoins` | 50 → 120 | D1 retention | 50% | 21 | Draft |
| EXP-02 | Showing the shop button after the first upgrade (not at spawn) reduces early bounce without hurting conversion | `ui.shopButtonDelayStep` | 0 → 3 | Playtime | 50% | 28 | Draft |
| EXP-03 | A cheaper zone 2 increases D7 | `economy.zone2Cost` | 500 → 350 | D7 retention | 50% | 28 | Draft |

Keep this table in the team vault; link results back to the decision log ([[Project State, Decisions and Resume Notes]]).

**Don't** use Experiments to test **Robux prices** of passes or dev products. Managed Pricing runs those tests (see [[Managed Pricing, Price Tests and Regional Pricing]]). Use Experiments for the *surrounding* design: starter-pack contents, shop placement, bundle composition.

---

## Common mistakes
- Calling `GetConfigForPlayerAsync(...):GetValue()` for every key on join, which enrolls everyone in everything.
- Using `GetConfigAsync` for an experiment key (experiments only apply through per-player snapshots).
- Not persisting a variant for multi-session flows, so players flip variants between sessions.
- Stopping a test on day 3 because a chart looks good.
- Shipping a content update mid-experiment.
- Running an experiment with an MDE far above any realistic effect.
- No code defaults, so a config outage breaks the game.
- Refreshing snapshots mid-round in competitive games.

## Checklist
- [ ] Config module with `pcall`, defaults and controlled `Refresh()` timing
- [ ] Staged values tested in Studio (and with `SetTestingValue` on a live server) before publishing
- [ ] Publish messages written; History used for rollback
- [ ] Each experiment has a written hypothesis, a goal metric and an acceptable MDE
- [ ] Enrollment happens at the point of use
- [ ] Multi-session variants persisted
- [ ] No content changes planned during the test window
- [ ] Early harm and SRM checked in the first 24 h; decision only after the full duration
- [ ] Results and decisions documented

---

**Sources checked (2026-10-25):** Creator Docs: Production › Experience configs; Production › Experiments; Game design › Balance virtual economies (Experiments/Configs note); Engine API: ConfigService (GetConfigAsync, GetConfigForPlayerAsync, SetTestingValue, ClearTestingValue), ConfigSnapshot.

**Related:** [[Analytics Discovery - Hub]] · [[Experiment Design for Roblox Games]] · [[Analytics Instrumentation Plan]] · [[LiveOps Social - Hub]] · [[Release Rings and Rollback Strategy]] · [[Core Loop and Session Design for D1 and D7 Retention]]
