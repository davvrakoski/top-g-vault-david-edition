---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
title: "Server-Owned NPCs - Network Ownership for Moving NPCs"
tags: [roblox, community-knowledge, networking, network-ownership, npc, exploits, physics]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/reference/engine/classes/BasePart#SetNetworkOwner
  - https://create.roblox.com/docs/reference/engine/classes/BasePart#CanSetNetworkOwnership
  - https://devforum.roblox.com/t/how-to-prevent-npc-network-receive/4214247
---
# Server-Owned NPCs - Network Ownership for Moving NPCs

Unanchored NPCs (Humanoid enemies, pets, physics mounts, carts pushed by players) are handed to whichever nearby client the engine picks. The Roblox docs say this outright: ownership is assigned automatically by proximity and client hardware, and when a client owns a part "Roblox cannot verify physics calculations". For NPCs that means the owning client can teleport, freeze or fling them, and their `Touched` events can be faked. It also means the NPC stutters whenever ownership hops between players as they walk past. This note is the ownership policy for moving NPCs in big worlds.

## The default and why it bites

- Server owns everything by default, **and** always owns anchored parts.
- Unanchored parts near a player's character tend to become **that player's**.
- An assembly (parts joined by welds or Motor6Ds) has one owner. Setting ownership on one assembly of a mechanism with no anchored parts sets it for the whole mechanism.
- Anchoring a lone assembly gives it to the server and **forgets** any manual setting; unanchoring returns it to automatic.

Symptoms of leaving NPCs on automatic: enemies that pause or jitter when a new player comes close (ownership handoff), bosses that "lag back" for everyone except one player, and exploiters walking a boss into the void.

## Policy: server owns every gameplay NPC

After the NPC model is parented to Workspace and unanchored, set the server as owner on its root assembly:

```lua
local function claimForServer(model: Model)
	local root = model.PrimaryPart or model:FindFirstChild("HumanoidRootPart")
	if not root then return end
	local ok, reason = root:CanSetNetworkOwnership()
	if ok then
		root:SetNetworkOwner(nil) -- nil = server
	else
		warn("ownership not settable", model:GetFullName(), reason)
	end
end
```

`CanSetNetworkOwnership()` returns false plus a reason string instead of throwing; typical reasons are an anchored part in the assembly or a part not in Workspace yet. Call it after spawning and **again after anything that rebuilds the assembly**: ragdoll (joints broken, new assemblies), re-anchoring for a cutscene, welding a carried item or rider.

## The cost and how to soften it

The docs warn to use server ownership conservatively, because client interactions with server-owned physics can look jittery. You pay in two places:

1. **Server CPU** for physics of every NPC. Mitigate by anchoring idle or far NPCs and moving them kinematically (`PivotTo`/`BulkMoveTo`), which is cheap, and only unanchoring when physics matters (knockback, ragdoll) ([[NPC Crowds, Animation LOD and Server Budgets]]).
2. **Feel when players push NPCs**: the player sees the NPC react one round trip late. Avoid gameplay that depends on bumping NPCs; use server-driven knockback (impulse applied on the server) instead ([[Smooth Knockback - What Works for All Clients]]).

## When client ownership is fine

- **Purely cosmetic** followers (a pet that only follows and never blocks or scores). Better still: make it client-side only, spawned by each client from replicated state.
- **A player's own mount or vehicle while they ride it**: give ownership to the rider for responsiveness, revert with `SetNetworkOwnershipAuto()` or `SetNetworkOwner(nil)` on exit ([[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]]). Validate speed and position on the server.

## Large worlds and streaming

- With StreamingEnabled, an NPC streamed out for a player is gone on that client, but a server-owned NPC keeps simulating on the server. Sleep or anchor NPCs with no player within your AI radius to save CPU.
- Automatic ownership follows character proximity, so it is mostly a near-player problem; server ownership removes the handoff edge cases entirely.
- For hundreds of NPCs, stop replicating NPC physics at all and switch to data-only entities ([[Net - Custom Entity Replication - Server Data, Client Models]]).

## Security checks that still apply

- Never trust `Touched` damage from NPC weapons or player tools without a server distance check; the docs note owners can fire Touched remotely.
- Use Studio's network ownership visualization (colored outlines during playtest, described on the docs page) to confirm every enemy shows server ownership while a client walks among them.

## Related
[[Networking Security - Hub]] · [[Network Ownership and Physics Replication]] · [[What a Client Controls on Its Own Character - Replication Exceptions]] · [[Touched Events - Network Delay and Reliability]]
