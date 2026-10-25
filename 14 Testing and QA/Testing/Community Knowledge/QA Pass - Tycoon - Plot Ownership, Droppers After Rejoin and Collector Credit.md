---
area: "14 Testing and QA"
cluster: "Testing"
title: "QA Pass - Tycoon - Plot Ownership, Droppers After Rejoin and Collector Credit"
tags: [roblox, community-knowledge, testing, qa, genre-qa, tycoon]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/physics/network-ownership
  - https://create.roblox.com/docs/scripting/security/network-ownership
  - https://create.roblox.com/docs/cloud-services/data-stores/best-practices
  - https://devforum.roblox.com/t/tycoon-lag-how-to-fix/387741
  - https://devforum.roblox.com/t/tycoon-deletion-script/2637503
---
# QA Pass - Tycoon - Plot Ownership, Droppers After Rejoin and Collector Credit

A tycoon is a per-player world inside a shared server: a plot that must belong to exactly one player, a list of purchases that must rebuild the same way every time, and droppers whose output must be credited to the right owner. Most tycoon bugs show up only when someone leaves, rejoins, or claims at the same moment as someone else, which is exactly what solo testing never does.

## Bugs this genre always ships with
- **Double claim.** Two players touch the claim pad in the same frame and both get the plot, or one gets it and the other gets a broken half-plot.
- **Plot not freed.** The owner leaves and the plot stays locked (or keeps running) for the rest of the server's life.
- **Ghost droppers.** The previous owner's dropper loops or `Touched` connections were never disconnected, so the new owner's plot spawns twice the parts, or credits the old owner's UserId.
- **Rebuild order.** On rejoin, purchases are rebuilt from the save in table order, not dependency order: a floor-2 dropper appears before floor 2.
- **Collector credit by touch.** The collector pays whoever owns the plot it sits on, so a part pushed (or flung) from another plot pays the wrong player. Dropped parts near a player can be owned by that player's client physics, which makes moving them easy for an exploiter.
- **Part count growth.** Uncollected drops pile up; a DevForum thread on tycoon lag traces a server stall to many money parts spawning at once and points to the MicroProfiler to find it.
- **Leave-time spike.** Destroying a whole plot in one frame when a player leaves causes a hitch for everyone.

## Test checklist
1. Two clients (Studio multi-client server test) walk onto the same claim pad together, ten times. Exactly one owner each time.
2. Claim, buy five things, leave. Check the plot resets to unowned within a few seconds and the next claimer starts clean.
3. Buy every button, leave, rejoin in a new server. Compare a list of built object names with the saved purchase list (helper below).
4. Rejoin in the same server while the old plot is still cleaning up.
5. Leave the game running 30 minutes with all droppers on (see the Soak Tests note). Track part count and server memory.
6. Push a drop from plot A into plot B's collector. Credit must go to plot A's owner or nobody.
7. Claim, then reset character, then die in the void. Ownership should survive all three.

## Exploit angles
- Set network ownership of drop parts to the server (`part:SetNetworkOwner(nil)`) or make them anchored and moved by script, so clients cannot carry them.
- Stamp each drop with an `OwnerUserId` attribute and value at spawn; the collector pays that UserId only, and only if the player is still in the server.
- Button purchases go through one server remote that checks price, prerequisites and ownership. Never trust a "button touched" from the client.

## Balance checks
- Measure income per minute at each button tier and the time to afford the next tier. Look for a flat stretch longer than your target session (often the point players quit).
- Check offline or AFK income caps (time away is measured with the server's clock, but still cap the total).

## Data and save checks
- Save purchases as a set of stable ids (not display names and not table indexes) so renaming a button never deletes progress.
- Save on purchase (debounced) and on leave, and let `game:BindToClose` flush saves when the server shuts down.
- Rebuild sorts purchases by declared dependency before building.

## Debug helper: compare save vs built plot
```lua
-- Server: prints anything saved but not built, or built but not saved.
local function diffPlot(savedIds: {string}, plotFolder: Instance)
	local built = {}
	for _, obj in plotFolder:GetChildren() do
		local id = obj:GetAttribute("PurchaseId")
		if id then built[id] = (built[id] or 0) + 1 end
	end
	for _, id in savedIds do
		if not built[id] then warn("saved but missing:", id) end
	end
	local saved = {}
	for _, id in savedIds do saved[id] = true end
	for id, n in built do
		if not saved[id] then warn("built but not saved:", id) end
		if n > 1 then warn(("built %d times: %s"):format(n, id)) end
	end
end
```
Run it after every rejoin test. "Built 2 times" is the classic ghost-dropper symptom.

## Related
[[Testing - Hub]] - [[Tycoon Plot Layout and Plot Assignment]] - [[Tycoon Genre Breakdown - Droppers, Button Ladders and Pacing]] - [[Test - Join, Leave and Respawn Edge-Case Pass]] - [[Soak Tests - Long-Session Memory and Leak Checks]]
