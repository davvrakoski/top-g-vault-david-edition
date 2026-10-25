---
area: "04 Networking Data and Servers"
cluster: "Data Backend"
title: "Mixed-Version Servers - Forward-Compatible Saves During Updates"
tags: [roblox, community-knowledge, data-backend, updates, schema, placeversion, migration]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/update-games
  - https://create.roblox.com/docs/reference/engine/classes/DataModel#PlaceVersion
  - https://create.roblox.com/docs/reference/engine/classes/DataModel#ServerRestartScheduled
  - https://devforum.roblox.com/t/soft-shutdown-script/47588
---
# Mixed-Version Servers - Forward-Compatible Saves During Updates

When you publish, old servers keep running the old code. The Roblox docs are explicit: if you do not restart servers, players drift to the new version as old servers empty, and "if your underlying player data format changes, you should probably restart servers". Even when you do restart, the docs note that servers marked for shutdown stop receiving matchmaking but **can still be joined through invites, teleports and joining a friend from their profile**, and a delayed restart (bleed-off) keeps them alive for up to 60 minutes. So for a while, the same player can save from a new server and then load in an old one. Old code reading new data is how saves get wiped.

## The failure, step by step

1. Update 14 renames `coins` to `wallet.coins` and bumps `schemaVersion` to 14.
2. Player joins a new server, data migrates to v14, saves.
3. Player follows a friend into an old v13 server (still alive during bleed-off).
4. v13 code sees no `coins`, reconciles a default `coins = 0`, ignores `wallet`, and **saves**. Or worse, its migration code does not know v14 and resets the profile.

## Rule 1: an older server must never write newer data

Stamp each save with the schema version **and** the code that wrote it:

```lua
local SCHEMA_VERSION = 14

local function canWrite(data): boolean
	return (data.schemaVersion or 0) <= SCHEMA_VERSION
end

-- On load:
if (data.schemaVersion or 0) > SCHEMA_VERSION then
	-- This server is outdated for this player.
	session.readOnly = true
	-- Option A: teleport the player to a fresh server (see below).
	-- Option B: let them play, but never save and never grant purchases.
end
```

Read-only sessions must also refuse to process developer product receipts (return `NotProcessedYet` so Roblox retries later on a current server). Granting into a read-only profile would lose the purchase.

## Rule 2: make additions tolerant, not breaking

Most updates only **add** fields. Design so that old code ignores unknown fields instead of deleting them:

- Never rebuild the save from a whitelist of known keys. Load the table, change what you know, write back the whole table. Unknown keys survive the round trip.
- Reconcile fills only missing fields; it never removes extras ([[Net - Player Data Schema Design - Keys, Defaults and Size Budget]]).
- Renames and type changes are **breaking**: keep the old field for one release (write both), then remove it in the next. Two-step changes let a v13 server still read something sensible.

With tolerant additions you only need Rule 1's hard stop for the rare breaking change.

## Rule 3: move players off old servers on purpose

- **Restart only outdated servers** from Creator Dashboard > Server management (the docs recommend this option). Roblox teleports everyone from one old server into the same new server.
- Listen to `DataModel.ServerRestartScheduled` for a countdown and a final save ([[Server Restart Notices with ServerRestartScheduled]]).
- For players who land on an old server via a friend join, Option A above: detect `schemaVersion` too new on load, show "Updating you to the latest version", and `TeleportAsync` them to the same place; matchmaking will not pick a server marked for shutdown.
- The classic community soft-shutdown script (bounce everyone through a reserved server) is, per its own thread, unnecessary since March 2024 because the platform now migrates players; keep it only if you need custom behaviour ([[BindToClose and Server Shutdown Save Flush]]).

## Know which version a server runs

`game.PlaceVersion` gives the published place version of the running server. Include it in your logs, your server browser entries and your debug overlay so you can see mixed fleets ([[Build Versioning - Git Tags, PlaceVersion and an In-Game Build Label]]). Note that place version and schema version are different numbers; a content-only publish should not bump the schema.

Ship the "save newer than code" guard **one release before** the first breaking change that relies on it; otherwise the old servers that need the guard do not have it. How to test this whole scenario on staging is in [[Test - Save Migration Tests - Fixture Saves, Golden Files and Mixed-Version Servers]].

## Release checklist for a data-format change

- [ ] Change is additive, or split into two releases (write both, then drop old).
- [ ] `SCHEMA_VERSION` bumped; migration for previous version tested on real exported saves.
- [ ] Load path goes read-only when save is newer than code.
- [ ] Receipts refused in read-only sessions.
- [ ] Publish, then restart **outdated** servers; watch error rates by place version.

## Related
[[Data Backend - Hub]] · [[Save Schema Migration Blueprint]] · [[Release Rings and Rollback Strategy]] · [[Open Cloud APIs for Live Ops - Worked Examples]]
