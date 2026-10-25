---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/studio-api-access-data-safety"
title: "Studio API Access and Data Safety During Testing"
tags: [roblox, community, "cluster/testing-qa-and-devops", datastore, testing, safety]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/cloud-services/data-stores
  - https://create.roblox.com/docs/cloud-services/choose-between-cloud-services
  - https://create.roblox.com/docs/reference/engine/classes/RunService
---
# Studio API Access and Data Safety During Testing

**The risk:** one playtest with the wrong setting can overwrite real players' saves, duplicate currency in a live economy, or wipe a leaderboard. Most "my data got reset" incidents in small studios start in Studio.

## What the docs say
- By default, games tested in Studio **cannot** use data stores; you enable it with **Experience Settings > Security > Enable Studio Access to API Services**.
- Studio then uses **the same data stores as the live game**. Roblox's guidance is not to enable it for live games and to use a separate test version instead.
- Data stores (and memory stores) are shared across **every place** in the same experience, so a "test place" in the live universe is not isolation ([[Test Places, Staging Universes and Places in a Universe]]).

## Defence in depth (original pattern)
Even with a staging universe, add a code-level guard so a mistake fails safe:

```luau
--!strict
-- ServerScriptService/Data/StoreFactory.luau
local DataStoreService = game:GetService("DataStoreService")
local RunService = game:GetService("RunService")

local PRODUCTION_UNIVERSE = 1111111111 -- your live universe id

local StoreFactory = {}

-- Returns a real store, or nil when this server must not touch real data.
function StoreFactory.get(name: string): DataStore?
	if RunService:IsStudio() and game.GameId == PRODUCTION_UNIVERSE then
		warn("[Data] Studio session on the PRODUCTION universe: saving disabled for", name)
		return nil
	end
	return DataStoreService:GetDataStore(name)
end

return StoreFactory
```

Your data service treats `nil` as "use the in-memory fake" (the fake from [[Unit Testing Luau with Jest-Lua and TestEZ]] works). Show a visible on-screen banner such as "SAVES OFF (Studio)" so testers know progress will not persist.

## Other habits
- **Name stores with a schema version** (`PlayerData_v3`) and keep test universes on their own copies, so migrations can be rehearsed without touching anything live.
- **Never run destructive Open Cloud scripts** (DataStore delete/list-and-fix) without a dry-run flag and a backup; see [[Open Cloud APIs for Live Ops - Worked Examples]].
- **Purchases in Studio** are test purchases, but your grant code still runs. Make sure the receipt handler writes to the same guarded stores.
- **Luau Execution tasks** can also call DataStores. Point CI keys at the test universe only ([[Engine Tests in CI with Open Cloud Luau Execution]]).

## Checklist
- [ ] Production experience: Studio API access **off**.
- [ ] Staging/test universes: on, with seeded fake players.
- [ ] Data layer refuses real stores in Studio on the production universe.
- [ ] On-screen "saves off" indicator in that mode.
- [ ] Destructive data tools have dry-run and backup steps.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[DataStore Session Locking, Retries, Versioning and Erasure]] · [[Test Places, Staging Universes and Places in a Universe]] · [[Unit Testing Luau with Jest-Lua and TestEZ]] · [[Bug Triage, Severity and Regression Workflow]]

<!-- TDOD_GRAPH_END -->
