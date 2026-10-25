---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Speed - Transparent Batching - Concurrent Marketplace and Catalog Lookups"
tags: [roblox, community-knowledge, performance, web-calls, marketplace, rate-limits, shop]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/transparent-batching
  - https://create.roblox.com/docs/production/analytics/performance
  - https://create.roblox.com/docs/reference/engine/classes/MarketplaceService
---
# Speed - Transparent Batching - Concurrent Marketplace and Catalog Lookups

Shops, gamepass menus and avatar catalogues often loop over 20 to 100 IDs and call a web-backed API for each one, one after another. Every call waits for its own HTTP round trip, so the shop takes seconds to fill and the server edges toward rate limits. Roblox now batches some of these calls automatically, but only if you start them **at the same time**. This is one of the cheapest speed-ups available: same API, same arguments, different loop.

## What transparent batching is

For supported methods, the engine merges calls that start close together into fewer HTTP requests behind the scenes. The docs' example: 20 product lookups started together can become one or two HTTP requests instead of 20. Calls started one after the other (each waiting for the previous) get no batching.

## Supported methods (per the docs, October 2026)

| Service | Method |
|---|---|
| MarketplaceService | `GetProductInfoAsync` for `Enum.InfoType.Product`, `GamePass` and `Bundle` |
| MarketplaceService | `UserOwnsGamePassAsync` |
| AvatarEditorService | `GetItemDetailsAsync` |
| AssetService | `GetBundleDetailsAsync` |

The list may grow; recheck the page before relying on a method not listed.

## The pattern: fan out, then wait

```lua
local MarketplaceService = game:GetService("MarketplaceService")

local function fetchAll(ids: { number }, infoType: Enum.InfoType)
	local results, pending = {}, #ids
	local done = Instance.new("BindableEvent")
	for _, id in ids do
		task.spawn(function()
			local ok, info = pcall(MarketplaceService.GetProductInfoAsync, MarketplaceService, id, infoType)
			results[id] = ok and info or nil
			pending -= 1
			if pending == 0 then done:Fire() end
		end)
	end
	if pending > 0 then done.Event:Wait() end
	done:Destroy()
	return results
end
```

Using a BindableEvent to wake the caller avoids a `while ... task.wait()` poll; the official sample uses a polling loop, which also works. Empty `ids` returns immediately.

## Where it helps in a real game

- **Shop open**: fetch all gamepass and developer product prices concurrently at server start, cache them, and serve the cache to clients. Prices rarely change; refresh every few minutes.
- **Gamepass ownership on join**: check every gamepass for a joining player concurrently with `UserOwnsGamePassAsync`, instead of one by one. Join completes sooner.
- **Avatar shops / try-on menus**: `GetItemDetailsAsync` for a whole page of items at once.
- **Bundle showcases**: `GetBundleDetailsAsync` for the visible bundles together.

## Best practices from the docs, plus ours

- Start calls close together; calls started much later go into a separate batch.
- Wrap each call in `pcall`; one failure should not abort the page.
- Let the engine choose batch sizes; do not build your own chunking.
- Repeated requests for the same data can be served from cache, but your own cache (a table keyed by ID with a timestamp) avoids the call completely.
- Do the fetching on the server at startup when possible and replicate a compact result, rather than every client fetching on its own.
- Keep these calls **out of the first seconds after join** if they are not needed yet. The Performance dashboard's *Client API Calls in First 60s After Join* metric flags games whose most-called service during join is not asset delivery.

## Pitfalls

- Spawning hundreds of threads at once for a giant catalogue: batch it by page (for example the 30 items on screen), not the whole catalogue.
- Assuming batching applies to every web API: it applies only to the listed methods. DataStores, HttpService and others follow their own limits.
- Forgetting results arrive out of order: index by ID, not by insertion order.

## Related
[[Performance - Hub]] · [[Speed - Initial Join Time - From Clicking Play to Player Control]] · [[Speed - DataStore Request Budgeting at Scale - Server and Experience Limits]] · [[Performance Audit Procedure]]
