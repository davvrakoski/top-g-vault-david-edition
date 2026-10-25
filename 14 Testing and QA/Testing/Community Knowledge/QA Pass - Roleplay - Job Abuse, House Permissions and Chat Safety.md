---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Roleplay - Job Abuse, House Permissions and Chat Safety"
tags: [roblox, community-knowledge, testing, qa, genre-qa, roleplay, permissions, safety]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/security/access-control
  - https://create.roblox.com/docs/chat/in-experience-text-chat
  - https://create.roblox.com/docs/reference/engine/classes/TextService
  - https://create.roblox.com/docs/reference/engine/classes/TextFilterResult
  - https://create.roblox.com/docs/reference/engine/classes/PolicyService
  - https://devforum.roblox.com/t/2641276
  - https://devforum.roblox.com/t/help-creating-a-rank-only-door/857653
---
# QA Pass - Roleplay - Job Abuse, House Permissions and Chat Safety

Roleplay games hand players power over each other: police can cuff, owners can lock doors, everyone can name things and talk. Each of those powers is a permission check, and a single missing check becomes a griefing tool. Roleplay also has more free text than any other genre (house names, pet names, signs, job titles), which puts it first in line for text-filtering mistakes.

## Bugs this genre always ships with
- **Job-hop pay farming.** Pay ticks every N minutes for the current job; switching jobs right before the tick, or being in two jobs at once after a fast switch, pays twice.
- **Job tools kept.** Switching from police to civilian leaves handcuffs in the Backpack or in `StarterGear`, so a civilian can still arrest.
- **Arrest abuse.** Cuffs work at any distance, in safe zones, on players already cuffed, or on players in a menu.
- **House locked forever.** The owner leaves, the house stays locked with a guest trapped inside, or unlocks for everyone.
- **Name-based permission lists.** Roommates are stored by username; a name change drops them, and a new account with the old name inherits access. Use `UserId`.
- **Unchecked door remotes.** The client fires "lock door 12" and the server obeys. A DevForum housing thread is blunt: keep ownership on the server and verify it before any unlock.
- **Prop and vehicle spam.** No per-player cap, so one player fills the server with furniture or cars.
- **Unfiltered custom text.** House signs, nameplates or pet names shown to others without passing through the text filter.

## Test checklist
1. Switch jobs every second for a minute with a fuzz script. Pay must follow the job held at each tick, once.
2. Switch from each tooled job to civilian. Backpack, character and `StarterGear` must hold no job tools.
3. Try every police action at max range + 10 studs, in each safe zone, and on a player in a menu or seat.
4. Owner locks a house with a guest inside, then leaves. Guest must be able to leave; house resets for the next owner.
5. Add a roommate, then have the roommate rejoin. Access must survive the rejoin (stored by `UserId`).
6. Fire lock, unlock, kick-guest and furniture remotes for a house you do not own. All rejected.
7. Spawn props and cars until something stops you. There must be a cap per player and per server.
8. Type a test phrase that the filter blocks into every text box in the game (sign, name, pet name, job title). Other players must see it filtered.

## Exploit angles
- Keep one permissions module on the server (owner, roommates, job, group rank) and call it from every remote; the DevForum examples of rank-only doors use the group rank from 0 to 255 on the server.
- Rate-limit "request" remotes (trade, invite, arrest) per player and per target to stop harassment spam.

## Chat and text safety
- Text typed by one player and shown to others goes through `TextService:FilterStringAsync`; for text broadcast to everyone (a house sign) use the result's `GetNonChatStringForBroadcastAsync`.
- In-experience chat should use `TextChatService`, which filters chat for you. Custom chat channels (job radio, house chat) still go through `TextChatService` channels rather than your own remotes.
- Roleplay games attract dating roleplay. Check your Community Standards and content maturity answers, and give players a block and report path that works in the custom UI. The child safety note covers filter coverage in depth.
- Use `PolicyService` results where a feature (like paid trading of items) is gated per region or age group.

## Balance checks
- Compare income per hour across jobs. A job that pays far more for standing still empties every other job.
- Check that the best house is reachable without Robux in a reasonable time, or that its price is clearly a cosmetic choice.

## Data and save checks
- Houses, furniture layouts and roommate lists save by `UserId` with a schema version.
- Furniture positions save relative to the plot or house origin so a house moving in a map update does not scatter furniture.

## Debug helper: one permission check for every remote
```lua
-- Server ModuleScript: the only place that answers "may this player do this?"
local Perms = {}

function Perms.canUseHouse(player: Player, house: Instance, action: string): boolean
	local ownerId = house:GetAttribute("OwnerUserId")
	if ownerId == player.UserId then return true end
	local roommates = house:GetAttribute("Roommates") or "" -- e.g. ",123,456,"
	local isRoommate = string.find(roommates, "," .. player.UserId .. ",", 1, true) ~= nil
	if action == "open" then return isRoommate end
	return false -- lock, kick, edit: owner only
end

return Perms
```
QA tip: log every `false` result with player and action during a playtest; a burst of denials from one player is a probing exploiter.

## Related
[[Testing - Hub]] - [[Roleplay and Life Sim Genre Breakdown - Roles, Props and Homes]] - [[Test - Child Safety QA - Filter Coverage, Chat Permissions and Policy Flags]] - [[Exploit QA - Testing Like an Exploiter Inside Studio]]
