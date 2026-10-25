---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "External Backends with HttpService - Limits, Retries and Idempotency"
tags: [roblox, community-knowledge, data-backend, httpservice, backend, api]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/HttpService
  - https://create.roblox.com/docs/cloud-services/http-service
  - https://create.roblox.com/docs/cloud-services/secrets
  - https://en.wikipedia.org/wiki/Exponential_backoff
---
# External Backends with HttpService - Limits, Retries and Idempotency

Sometimes Roblox services are not enough: cross-game accounts, a web dashboard, a Discord bot, analytics you own, or a custom matchmaker. `HttpService:RequestAsync` lets game servers call your own API. Done carelessly it adds a single point of failure to every server and leaks keys. This note covers the hard limits, a request wrapper, and the design rules that keep the game playable when your backend is down.

## Hard facts (from the docs)

- **Server only.** HttpService requests run from server scripts; "Allow HTTP Requests" must be enabled in Game Settings > Security.
- **500 external requests per minute per server** (all non-Roblox endpoints combined).
- Requests to Roblox **Open Cloud** endpoints from a game server have their **own** limit of 2,500 per minute and do not count against the 500; exceeding it can stall request methods for about 30 seconds.
- The docs recommend exponential backoff on recoverable errors (wait 2 s, then 4, then 8...).
- Keep API keys in **Secrets** (Creator Dashboard > Secrets) and read them with `HttpService:GetSecret`, never in a script or attribute. A `Secret` can only be used in headers/URL building; it cannot be printed as plain text and cannot go in a request body. The secrets store only works on live servers and collaborative testing; for Studio play tests add **Local Secrets** under Experience Settings > Security.

## A small, safe wrapper

```lua
local HttpService = game:GetService("HttpService")
local API = "https://api.example.com" -- your own domain

local function call(method: string, path: string, body: any?, idemKey: string?)
	local headers = {
		["Content-Type"] = "application/json",
		["Idempotency-Key"] = idemKey or HttpService:GenerateGUID(false),
		["Authorization"] = HttpService:GetSecret("backend_key"):AddPrefix("Bearer "),
	}
	for attempt = 1, 4 do
		local ok, res = pcall(HttpService.RequestAsync, HttpService, {
			Url = API .. path, Method = method, Headers = headers,
			Body = body and HttpService:JSONEncode(body) or nil,
		})
		if ok and res.Success then
			return true, res.Body ~= "" and HttpService:JSONDecode(res.Body) or nil
		end
		local code = ok and res.StatusCode or 0
		if ok and code >= 400 and code < 500 and code ~= 429 then
			return false, code -- client error: retrying will not help
		end
		task.wait(2 ^ attempt + math.random())
	end
	return false, "unreachable"
end
```

`Secret:AddPrefix` is the documented way to build an auth header from a secret. The same idempotency key is reused across retries so the backend can drop duplicates.

## Design rules

1. **Never block joining on your backend.** If the profile API is down, load the Roblox DataStore copy and queue the sync for later. Players should not see "server error" because your VPS rebooted.
2. **Idempotency keys on every write.** A timeout does not mean the request failed. The backend stores processed keys for a day and returns the first result on repeats.
3. **Batch and queue.** Analytics or log events go into a per-server buffer flushed every 10-30 s as one request. At 500/min, one request per player action is a fast way to throttle a busy server.
4. **Circuit breaker.** After N consecutive failures, stop calling for 60 s and use fallbacks. This prevents every server retrying at once when the backend recovers.
5. **Validate inbound data.** A JSON response is untrusted input: check types and ranges before granting items from it.
6. **Authenticate the server, not the player.** A request is trusted because it carries your server secret, never because it carries a userId. Clients cannot call HttpService directly, so a backend reachable only with the secret cannot be spammed from exploit clients.
7. **Prefer Roblox services for player data.** DataStores are free, session-lockable and survive your backend going bankrupt; use the external store for things Roblox cannot do.

## When the backend calls you

Your backend cannot open a connection into a game server. To push to live servers, call Open Cloud **Messaging** to publish on a topic that servers subscribe to with MessagingService, or write to a DataStore/MemoryStore through Open Cloud that servers poll.

## Pitfalls

- Discord webhooks used as a logging backend get rate limited or blocked; send through your own relay.
- `JSONEncode` fails on mixed tables, NaN and non-string keys in dictionaries; sanitize first.
- Long HTTP calls inside `BindToClose` can run out the shutdown window; flush critical saves to DataStores first.

## Related
[[Data Backend - Hub]] - [[Open Cloud and External Tooling]] - [[Open Cloud APIs for Live Ops - Worked Examples]] - [[Errors, Observability and Incident Response]]
