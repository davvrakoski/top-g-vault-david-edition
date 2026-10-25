---
area: "08 Vehicles"
cluster: "Vehicles"
title: "Ride - Vehicle Locks, Keys and Theft - Lockpicks, Hotwiring and Server Checks"
tags: [roblox, community-knowledge, vehicles, roleplay, security, theft]
cssclasses: [tg-a08]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://devforum.roblox.com/t/car-locking-system-issue/1928897
  - https://forum.cfx.re/t/release-esx-t1ger-keys-with-npc-vehicles-lock-locking-unlocking-vehicles-lockpicking-hotwire-search-and-more/4766312
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/reference/engine/classes/Seat
  - https://create.roblox.com/docs/scripting/security/security-tactics
---
# Ride - Vehicle Locks, Keys and Theft - Lockpicks, Hotwiring and Server Checks

In roleplay and crime games, a car is property: you lock it, give keys to friends, and criminals try to steal it. In every other game, locks stop random players from jumping into your car. Both cases come down to one rule: **the server owns the lock state and checks it on every sit**. The DevForum "Car locking system issue" thread is the classic bug: one shared RemoteEvent with no car identity, so locking one car locked every copy of it.

## Data per car
Store on the car model as attributes (server-set only):
- `OwnerUserId` (number)
- `Locked` (bool)
- `KeyHolders` kept in a server table, not attributes, so clients cannot read who has keys if that matters.

## Lock and unlock
- A `ProximityPrompt` near the door (or a key fob button) sends `LockToggle(carModel)` to the server.
- Server checks: car exists, player is owner or key holder, player is within about 20 studs of the car. Then flips `Locked`.
- One RemoteEvent for all cars is fine (the thread's advice) as long as **the car is an argument** and the server validates it.
- Feedback: flash indicators, beep sound, lock icon on the prompt (`ActionText` "Unlock").

## Enforcing the lock
Prompts and UI are not security. The real gate is the seat:

```lua
seat:GetPropertyChangedSignal("Occupant"):Connect(function()
	local hum = seat.Occupant
	if not hum then return end
	local plr = Players:GetPlayerFromCharacter(hum.Parent)
	if car:GetAttribute("Locked") and not canDrive(plr, car) then
		hum.Sit = false -- kick them out immediately
	end
end)
```
Also set `seat.Disabled = true` while locked so touch-sitting does not even start, and re-enable for owners when they use the door prompt.

## Keys
- Owner can give a key to a player (copy key) or to their party. Revoke on car sell or on demand.
- Keys can be items in the inventory for crime games: lose the key, lose access.
- Valet / shared family cars: key holders can drive, only the owner can sell or customise.

## Theft systems (crime RP)
FiveM key scripts (for example T1GER Keys) show the usual feature set: lockpicking, hotwiring, searching cars for spare keys, and stealing keys from NPC drivers. A Roblox version:
1. **Lockpick** (item, consumed on failure): a timing minigame on the client; the server only accepts a success after a minimum time (e.g. 6 s) and with a chance roll done on the server.
2. **Hotwire** after entering: another 5-10 s action while seated; engine stays off until it succeeds.
3. **Alarm**: failed picks set off a horn and lights loop and alert the owner and police with the location.
4. **Tracker** upgrade: owner can see a stolen car on the map for a while.

Stolen cars should not move ownership in saved data. They return to the owner's garage when abandoned or impounded.

## Security checklist
- [ ] Server validates distance, ownership and car identity on every lock request
- [ ] Seat Occupant check kicks out non-owners of locked cars
- [ ] Theft success rolled and timed on the server, not the client
- [ ] Rate limit lock toggles (alarm spam)
- [ ] Ownership never changes from theft in DataStores

The Roblox security tactics page says to treat every client request as untrusted and validate on the server; locks are a textbook case.

## Related
[[Vehicles - Hub]] - [[Vehicle Anti-Exploit - Server Sanity Checks for Client-Owned Cars]] - [[Seat Entry with ProximityPrompt - No More Accidental Sits]] - [[Ride - Roleplay Traffic Laws - Speed Zones, Parking Spots, Tickets and Impound]]
