---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Racing - Race Matchmaking, Class Queues and Private Lobbies"
tags: [roblox, community-knowledge, vehicles, racing, matchmaking, teleport, lobbies]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/TeleportService
  - https://create.roblox.com/docs/reference/engine/classes/TeleportOptions
  - https://create.roblox.com/docs/reference/engine/classes/MemoryStoreService
  - https://create.roblox.com/docs/cloud-services/memory-stores
---
# Racing - Race Matchmaking, Class Queues and Private Lobbies

Generic queue and teleport mechanics are covered in [[MemoryStore Queues and Sorted Maps for Matchmaking]] and [[TeleportService Flows With Data and Reserved Servers]]. Racing adds its own rules: players bring a **car class**, they want a **track vote**, friends want **private races with a code**, and a race must start even when the queue is thin. This note is that racing layer.

## 1. Hub plus race servers

A common structure: a free-roam **hub place** (garage, shop, meets) and a separate **race place**. The hub queues players and teleports a group into a reserved race server; the race server sends them back when done. This keeps the hub social and the race server clean (fixed track, no traffic, no free-roam cars).

## 2. Queue keys: mode x class

Queue per `mode .. ":" .. class`, e.g. `circuit:B`, `drift:any`, `kart:any`. Each entry: user id, party id, car id, PI, skill rating, enqueue time. Use a MemoryStore sorted map or queue keyed by that string, with a short expiration so stale entries vanish if a hub server dies.

Relax over time so nobody waits forever:

| Wait | Rule |
|---|---|
| 0-20 s | Same class, skill within +-150 |
| 20-40 s | Same class, any skill |
| 40-60 s | Neighbouring class allowed, car auto-detuned to the lower class cap |
| 60 s+ | Start with bots filling empty grid slots (see [[Racing - AI Racers on a Racing Line Spline]]) |

Minimum group: 2 humans for "multiplayer", or 1 + bots if the player opts in to "quick race".

## 3. Parties stay together

Treat a party as one entry with size N; the matcher fills a race of up to 8-12 slots with whole parties only. When the party leader queues, every member's car must already be eligible for the class, or the hub shows who needs to switch car.

## 4. Starting the race server

One hub server (elected by a MemoryStore lock key) forms groups and does:

```lua
local TeleportService = game:GetService("TeleportService")
local options = Instance.new("TeleportOptions")
options.ShouldReserveServer = true
options:SetTeleportData({ mode = "circuit", class = "B", trackVote = { "Canyon", "Harbour", "Peak" } })
local result = TeleportService:TeleportAsync(RACE_PLACE_ID, playersInThisServer, options)
```

Players spread across several hub servers cannot be teleported by one `TeleportAsync` call. A typical pattern: the matcher reserves one server with `TeleportService:ReserveServerAsync(placeId)`, publishes the access code (MemoryStore or MessagingService) to the hubs that own those players, and each hub teleports its own players with `TeleportOptions.ReservedServerAccessCode`.

Never trust teleport data for rewards; it comes through the client. Use it only for the track vote list or mode; the race server re-reads the player's car and stats from their saved profile.

## 5. Track vote

In the race server's Voting state (see [[Racing - Race Lifecycle, Grid Placement and DNF Timer]]): 3 random tracks valid for the mode, 10 s timer, ties broken randomly, and a "random" option weighted so less-played tracks show up. Load tracks by cloning from `ServerStorage` into `workspace.Track`, then build the gates.

## 6. Private lobbies

- Host clicks "Private race": the hub reserves a server, stores `code -> accessCode` in a MemoryStore sorted map with a 1-2 h expiry, and shows a short 6-character code.
- Friends type the code in their hub; the hub looks it up and teleports them with `ReservedServerAccessCode`.
- The host gets settings in the race server: track, laps, class or "any", items on/off, catch-up on/off, bots on/off.
- Private races should not count for ranked rating or public leaderboards (make that clear), which also stops friends farming each other.

## 7. Returning to the hub

After Results, teleport everyone back to the hub place (public server) and keep the party together by teleporting the party as one group. Save rewards in the race server **before** the teleport.

## Pitfalls

- Matching across classes without detuning: the S-class car wins every race.
- One queue for all modes: drift players get dropped into circuit races.
- Using teleport data as proof of car ownership.

## Related
[[Vehicles - Hub]] · [[MemoryStore Queues and Sorted Maps for Matchmaking]] · [[TeleportService Flows With Data and Reserved Servers]] · [[Matchmaking Blueprint]]
