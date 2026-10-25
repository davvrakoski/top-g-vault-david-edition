---
area: "04 Networking Data and Servers"
cluster: "Server Engineering"
title: "Server Region Labels - Locating Servers for a Server Browser"
tags: [roblox, community-knowledge, server-engineering, server-browser, region, httpservice, latency]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/how-to-get-server-region/3804224
  - https://devforum.roblox.com/t/gamegethostlocation/49488
  - https://devforum.roblox.com/t/2526452
  - https://devforum.roblox.com/t/ip-api-usage-allowed/2182246
  - https://devforum.roblox.com/t/all-roblox-server-locations/1753936
  - https://create.roblox.com/docs/reference/engine/classes/LocalizationService#GetCountryRegionForPlayerAsync
  - https://create.roblox.com/docs/reference/engine/classes/Player#GetNetworkPing
  - https://create.roblox.com/docs/matchmaking/attributes-and-signals
---
# Server Region Labels - Locating Servers for a Server Browser

Server browsers in competitive and roleplay games often show "US East" or "EU" next to each server, so players can pick a nearby one. Roblox does **not** expose a server's datacenter: a long-standing devforum feature request for a `GetHostLocation`-style API exists, and a recent help thread treats a supposed built-in "RegionService" as a fake, AI-generated answer. What developers do instead is geolocate the server's own public IP over HTTP. This note covers the approach, its limits, and when you should not bother.

## First ask: do you need it?

- Roblox matchmaking already prefers low-latency servers: the **Latency** signal scores each server by the joiner's delta ping above their best datacenter (default weight 3), and you can raise its weight ([[Net - Custom Matchmaking - Signals, Weights and Server Attributes]]).
- If your browser exists to let players pick *a nearby server*, raising the Latency weight may solve the real problem without any HTTP calls.
- A region label is still useful for **reserved-server** flows your own matchmaker controls, and for players who want to join friends abroad knowingly.

## The approach (community, server-side only)

1. At server start, call an IP lookup from the **server** with HttpService (HTTP Requests must be enabled for the game). The devforum answer first fetches the server's public IP from an "echo my IP" service, then asks a geolocation API for that IP, reading fields like country code and region.
2. Map the result to a coarse label (`NA-East`, `NA-West`, `EU`, `Asia`, `SA`, `OCE`). Coarse labels hide geolocation inaccuracy.
3. Store it once: put it on your server browser entry in the MemoryStore registry ([[Custom Server Browser with MemoryStore and TeleportAsync]]) and as a server attribute for your debug overlay.

```lua
local HttpService = game:GetService("HttpService")

local function lookupRegion(): string
	local ok, body = pcall(HttpService.GetAsync, HttpService, GEO_URL) -- your chosen provider
	if not ok then return "Unknown" end
	local okDecode, info = pcall(HttpService.JSONDecode, HttpService, body)
	if not okDecode or type(info) ~= "table" then return "Unknown" end
	return toCoarseLabel(info.country_code, info.region) -- your own mapping table
end

local SERVER_REGION = lookupRegion() -- once per server, never per player
```

Choose a provider whose terms allow your use; many free geolocation tiers restrict commercial use or rate-limit aggressively (the devforum thread reports HTTP 429 from one), so call once per server and cache.

## Accuracy caveats from the threads

- The IP seen by an outside service can differ from the in-game server IP shown in the stats overlay (one thread found only the first three octets matched), because outbound HTTP may leave through different infrastructure.
- Geolocation databases can be off by a city or state (a server-locations thread noted IPs resolving to Reston, Virginia rather than Washington, D.C.). Region-level labels survive this; city labels do not.
- Roblox may place servers in other regions for operational reasons, so do not promise players a location.

## Privacy and policy

- You only ever geolocate the **server**. HttpService runs on the server, so it cannot see player IPs, and devforum replies are clear that Roblox does not give developers player IP addresses; trying to obtain one would be exploiting a vulnerability.
- For a player's country (for example to pick a default server tab), use `LocalizationService:GetCountryRegionForPlayerAsync(player)`, which returns a country/region code from Roblox's own geolocation. One devforum reply cautions that going beyond coarse location may conflict with Roblox's terms ([[Policy - Regional Rules - Belgium, Brazil, Korea and Country Blocks]]).

## Show ping, not just region

`Player:GetNetworkPing()` returns the player's round-trip time to the **current** server in seconds. You cannot measure ping to other servers before joining, but you can show the current server's ping in the browser header and let players compare after a hop. Combine: region label for the list, live ping for the server they are in.

## Checklist

- [ ] Considered raising the Latency matchmaking weight instead.
- [ ] One lookup per server, cached, `pcall` wrapped, "Unknown" fallback.
- [ ] Coarse labels only; provider terms checked.
- [ ] No player IP handling of any kind.

## Related
[[Server Engineering - Hub]] · [[External Backends with HttpService - Limits, Retries and Idempotency]] · [[Detecting Server Type - Public, Private, Reserved and Studio]] · [[Server Heartbeat, Ping and Bandwidth Monitoring]]
