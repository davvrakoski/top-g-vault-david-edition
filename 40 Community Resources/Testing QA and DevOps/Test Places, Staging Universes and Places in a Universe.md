---
area: "40 Community Resources"
cluster: "Testing QA and DevOps"
source_note: "community/testing-devops/test-places-staging-universes"
title: "Test Places, Staging Universes and Places in a Universe"
tags: [roblox, community, "cluster/testing-qa-and-devops", environments, staging, beta]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/cloud-services/choose-between-cloud-services
  - https://create.roblox.com/docs/cloud-services/data-stores
  - https://create.roblox.com/docs/cloud/guides/usage-place-publishing
  - https://create.roblox.com/docs/education/developer/beta-testing-experiences
---
# Test Places, Staging Universes and Places in a Universe

## The one fact that decides everything
A Roblox **experience (universe)** can hold several **places** (one start place plus others you teleport into). Per the cloud services docs, **data stores are shared by every server of every place in the same experience**, and memory stores work the same way. So:

> A "test place" inside your live experience reads and writes **live player data**.

The Data Stores docs say the same about Studio: with "Enable Studio Access to API Services" on, Studio uses the same data stores as the live game, and they advise enabling it only on a separate test version. See [[Studio API Access and Data Safety During Testing]].

## Recommended environment layout

| Environment | What it is | Who plays | Data |
|---|---|---|---|
| **Dev** | Your local Rojo build in Studio | You | Studio API access **off**, or on only in a dev universe |
| **Test / CI** | Separate universe (private) | Nobody; CI runs Luau Execution here | Throwaway; safe to wipe |
| **Staging** | Separate universe, same places as prod | Team + trusted testers | Fake or seeded data; wiped between seasons |
| **Production** | The public experience | Players | Real data; only touched by reviewed releases |

Each universe has its own universe ID and place IDs. Keep them in CI variables per environment ([[Deploying with GitHub Actions - Test Place First, Production on Approval]]).

## Mirror the place structure
If production has a Lobby place and a Match place, staging needs both too, and your **teleport code must not hard-code place IDs**. Keep a small config module keyed by environment:

```luau
--!strict
-- ReplicatedStorage/Shared/PlaceIds.luau (original)
local ENVIRONMENTS = {
	[1111111111] = { name = "production", lobby = 2222222221, match = 2222222222 },
	[3333333333] = { name = "staging",    lobby = 4444444441, match = 4444444442 },
}

local current = ENVIRONMENTS[game.GameId]
if not current then
	-- Unpublished Studio file or an unknown universe: fail loudly, never guess.
	current = { name = "local", lobby = 0, match = 0 }
	warn("[PlaceIds] unknown universe", game.GameId, "- teleports disabled")
end

return table.freeze(current)
```

`game.GameId` is the universe ID of the running experience, so the same build behaves correctly in every environment. (Replace the numbers with your own IDs.)

## Restricting who can play staging
- Keep the staging experience **private**, or use the closed-beta pattern from Roblox's beta-testing guide: testers join a group and get a role with access to a group-owned game.
- Paid access and limited-time tests are other options from the same guide, for open betas.
- Turn on **Team Test** in Studio for quick multi-person checks inside the staging file ([[Studio testing modes]]).

## Separate places inside production are still useful
- A "Tutorial" or "Event" place that only some players teleport to is a fine **staged rollout**, as long as it is production-quality: it shares production data.
- Never put debug tools or admin commands in such a place on the assumption that "nobody can reach it".

## Checklist
- [ ] Test/CI and staging are separate universes, not extra places in production.
- [ ] Studio API access is off for the production experience.
- [ ] Place IDs come from an environment table keyed by `game.GameId`.
- [ ] Staging has the same set of places as production.
- [ ] One API key per universe; production key only in the approved deploy job.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing QA and DevOps - Hub]]

**Related notes:** [[Teleport between places]] · [[Beta test games]] · [[Studio API Access and Data Safety During Testing]] · [[DataStore Session Locking, Retries, Versioning and Erasure]] · [[Configure games and places]]

<!-- TDOD_GRAPH_END -->
