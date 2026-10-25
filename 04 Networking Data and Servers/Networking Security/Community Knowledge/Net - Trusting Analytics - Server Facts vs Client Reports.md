---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
title: "Trusting Analytics - Server Facts vs Client Reports"
tags: [roblox, community-knowledge, networking, analytics, security, remotes, data-quality]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/analytics/custom-events
  - https://create.roblox.com/docs/production/analytics/funnel-events
  - https://create.roblox.com/docs/production/analytics/economy-events
  - https://create.roblox.com/docs/production/analytics/event-types
  - https://create.roblox.com/docs/reference/engine/classes/AnalyticsService
---
# Trusting Analytics - Server Facts vs Client Reports

Analytics decide what you build next, so poisoned analytics are a quiet but real exploit. Roblox's AnalyticsService only accepts events **from the server, in published games** (stated on the custom, economy and funnel event pages). That is a good default, but many interesting moments only happen on the client: a shop tab opened, a settings toggle, a tutorial popup dismissed, frame rate. The moment you relay those through a RemoteEvent, any exploiter can send a million "tutorial step 3 completed" events or fake your economy charts. This note sorts events by trust level and shows a safe relay.

## Three trust levels

| Level | Source | Examples | Rule |
| --- | --- | --- | --- |
| **Server fact** | Server code that performed the action | Coins granted, item crafted, purchase processed, level reached, match ended | Log where the change happens, never anywhere else |
| **Server-checked claim** | Client says it, server can verify | "I finished tutorial step 2" when the server tracks steps | Verify against server state, then log |
| **Client report** | Only the client knows | UI clicks, camera mode, FPS, input device | Relay with whitelist, clamp, rate limit; label as client-reported |

The best fix is moving events up a level: if the server already owns tutorial progress, the server logs the step when it advances progress, and no remote is needed at all.

## Economy events are server facts only

Log `LogEconomyEvent` inside the function that actually changes the balance (your `grant()`/`spend()` wrappers), right after the save-side change succeeds. Never log economy from a remote handler that merely "requests" a purchase, or a rejected request would still appear as a sink. This also keeps your sources/sinks chart honest when you look for inflation ([[Economy - Inflation, Sources and Sinks]]).

## A safe relay for client reports

The funnel docs show the core idea: a RemoteEvent where the server checks the step number before logging. Extend that into one guarded relay for all client UI events:

```lua
local AnalyticsService = game:GetService("AnalyticsService")
local relay = ReplicatedStorage.Remotes.UiEvent

local ALLOWED = { shop_opened = true, settings_changed = true, codes_tab_opened = true }
local PER_MINUTE = 20
local counts: {[Player]: {n: number, reset: number}} = {}

relay.OnServerEvent:Connect(function(player: Player, name: unknown)
	if type(name) ~= "string" or not ALLOWED[name] then return end
	local now = os.clock()
	local c = counts[player]
	if not c or now >= c.reset then
		c = { n = 0, reset = now + 60 }
		counts[player] = c
	end
	c.n += 1
	if c.n > PER_MINUTE then return end -- drop silently; optionally note a strike
	AnalyticsService:LogCustomEvent(player, "ui_" .. name)
end)

Players.PlayerRemoving:Connect(function(p) counts[p] = nil end)
```

Rules baked in:

- **Whitelist names on the server.** Never `LogCustomEvent(player, nameFromClient)`: event-name cardinality is limited (the docs allow up to 100 custom events and suggest custom fields instead of new names), and an exploiter could exhaust it.
- **No client-supplied values** for anything numeric that matters. If you must accept one (FPS), clamp to a sane range and send it as a custom field bucket ("30-59") rather than a raw value.
- **Rate limit per player** and drop the excess. AnalyticsService itself has a global limit of 120 + 20 x CCU requests per minute (event types page), so a spammer can also starve your legitimate events.
- **Attribute to the player who fired it.** `player` from `OnServerEvent` is the only identity you can trust.

## Batching keeps you under limits

The custom events page suggests sending values in batches, for example one event with value 10 for "zombies killed" instead of ten events. Accumulate per player on the server and flush every 30-60 seconds or on leave.

## Reading suspicious data

- A funnel step with more completions than the step before it usually means a client-reported step without a server check.
- Economy sources that do not match your grant code paths mean logging in the wrong place.
- Sudden spikes from one server: check for one player spamming a relay; your rate-limit drop counter should show it ([[Exploit Strike Scores - Decaying Suspicion, Evidence Logs and Response Ladders]]).

## Checklist

- [ ] Economy and progression events logged in the server functions that change state.
- [ ] One relay remote for client UI events, whitelisted and rate limited.
- [ ] No event names or important values taken from the client.
- [ ] Batching for high-frequency counters.
- [ ] Event QA pass before release ([[QA - Analytics Event QA - Verifying Custom, Funnel and Economy Events]]).

## Related
[[Networking Security - Hub]] · [[Analytics Wrapper]] · [[Analytics Event Naming Standard]] · [[Remote Rate Limiting Pattern]]
