---
area: "14 Testing and QA"
cluster: "Testing"
title: "Teleport and Multi-Place Flow Test Pass"
tags: [roblox, community-knowledge, testing, teleport, multi-place, reserved-servers]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/teleport
  - https://create.roblox.com/docs/reference/engine/classes/TeleportService
  - https://create.roblox.com/docs/reference/engine/enums/TeleportResult
  - https://create.roblox.com/docs/reference/engine/classes/TeleportOptions
---
# Teleport and Multi-Place Flow Test Pass

Teleport bugs are the ones you cannot find in Studio. Roblox states plainly that TeleportService does not work during Studio playtesting, so every lobby-to-match, hub-to-dungeon or chapter-select flow has to be tested in a **published** build in the Roblox client. Teleports also fail in ways that do not throw: the call succeeds, then the player is left standing in the old server. This note is a repeatable test pass for multi-place games, to run in a staging universe before every release that touches places, matchmaking or teleport data.

## Setup (once)

1. Publish every place in the **staging universe** (same place list as production, see [[Test Places, Staging Universes and Places in a Universe]]).
2. Keep place IDs in one environment table keyed by `game.GameId`, so staging never teleports into production.
3. Add a debug line to each place's QA overlay: place name, `game.PlaceId`, `game.JobId` (short), `game.PrivateServerId ~= ""` (reserved/private), and whether teleport data arrived.
4. Log every teleport attempt on the server: target place, player count, options used, attempt number and the `TeleportResult` from `TeleportInitFailed`.

## Settings to check before the pass

| Setting | Where | What to verify |
| --- | --- | --- |
| Access Control for Places | Creator Dashboard, Audience, Access Settings | Matches design: Fully open, Limited to same universe, or Secure within universe only |
| Direct Access Control | Per-place access | Test/admin places are not joinable from outside |
| Allow Third Party Teleports | Studio Experience Settings, Security | Off unless you teleport to games you do not own |

With "Secure within universe only", only server-initiated teleports into non-start places work, so a test should prove that a friend-join into a match place lands the player in the start place instead.

## Core cases

Run each case with 1 player, then with a party of 2-4 (use alt accounts or teammates).

1. **Happy path**: lobby to match via `TeleportAsync`, all players arrive in the same server.
2. **Reserved server**: `TeleportOptions.ShouldReserveServer = true`; party arrives together, `PrivateServerId` is non-empty, and strangers cannot join.
3. **Rejoin a specific server**: send a second party to a stored `ReservedServerAccessCode` or `ServerInstanceId`; confirm they reach the same match.
4. **Teleport data**: set data with `TeleportOptions:SetTeleportData()`, read it with `Player:GetJoinData().TeleportData` on the server. Then join the match place *without* teleporting (deep link or direct join on staging) and confirm the place handles **missing** data instead of erroring.
5. **Tampered data**: teleport data is visible to the client and unencrypted. Confirm the destination never grants currency, items or ranks from it; anything valuable must come from DataStores or MemoryStores.
6. **Return trip**: match back to lobby, and confirm the save written in the match is the one loaded in the lobby (save before teleport, session lock released).

## Failure cases

| Case | How to cause it | Expected |
| --- | --- | --- |
| Full target | Teleport into a server at max players | `GameFull`, player gets a message and stays usable |
| Flooded | Spam the teleport trigger | `Flooded` handled with a longer wait, no infinite loop |
| Already teleporting | Fire the trigger twice quickly | Second request ignored (`IsTeleporting`) |
| Bad place ID | Point a test pad at a wrong ID | `pcall` catches it, warn logged, no stuck UI |
| Player leaves mid-teleport | Close the client during the loading screen | Party members still arrive; no ghost slot held |
| Server closes during teleport | Restart servers while a party is in transit | Players land in a fresh server or the start place |

The official pattern is `pcall` around `TeleportAsync` with a capped retry, plus a `TeleportInitFailed` handler that waits longer on `Flooded` and retries on `Failure`. Test that the retry cap is actually reached and the player sees a clear error, rather than an endless "Teleporting..." screen.

## Things testers forget

- **Custom teleport GUI**: `SetTeleportGui` is called on the client and scripts inside that ScreenGui do not run, so animated loading screens built with scripts will freeze. Check it looks fine static.
- **Character state on arrival**: tools, health, team and camera are all reset by the new server. Check spawn placement for every arrival route.
- **Mobile backgrounding**: switch apps during the teleport on a phone and come back.
- **Analytics**: confirm funnel steps survive the place change (session events logged in both places).

## Pass criteria

- Every core case passes with a party of 3 on at least two device types.
- No case leaves a player stranded without UI feedback for more than about 20 seconds.
- Logs show every failure with a result enum, attempt count and target place.

## Related

[[Testing - Hub]] · [[TeleportService Flows With Data and Reserved Servers]] · [[Test Places, Staging Universes and Places in a Universe]] · [[Release Readiness Runbook 2026]]
