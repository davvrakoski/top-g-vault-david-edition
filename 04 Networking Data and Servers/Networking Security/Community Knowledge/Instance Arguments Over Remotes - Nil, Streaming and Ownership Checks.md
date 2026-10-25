---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
title: "Instance Arguments Over Remotes - Nil, Streaming and Ownership Checks"
tags: [roblox, community-knowledge, networking-security, remotes, instances, streaming, validation]
cssclasses: [tg-a04]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/events/remote
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/reference/engine/classes/Instance#IsDescendantOf
---
# Instance Arguments Over Remotes - Nil, Streaming and Ownership Checks

Passing Instances through remotes is natural ("open this door", "buy from this shop part", "equip this pet"), and it hides three separate problems: the instance may arrive as `nil`, it may be an instance the player should not be able to use, and its properties may not mean what you think. Type checks alone (`typeof(x) == "Instance"`) do not cover any of these. This note is the set of checks to apply to every Instance argument.

## Why instances arrive as nil

The remote events guide's argument rules:

- An instance only visible to the sender is replaced with **`nil`** on the other side. A part a client created locally, or something in `ServerStorage` sent to a client, arrives as nil.
- Tables with non-string keys get their keys converted to strings; mixed tables and `nil` holes are unreliable; **metatables are dropped**; functions do not replicate.

With **StreamingEnabled**, a third case appears: the server sends a reference to a part that has not streamed in on that client yet. Developers report receiving `nil` in that case, which is consistent with the non-replicated rule above (the streaming docs do not state it directly; treat as unverified and test it). In the client-to-server direction, clients can only reference instances they currently have, so a client cannot reference a streamed-out door, which is correct.

Rule: always handle `nil` without erroring, and on the client, prefer sending **IDs** (a string attribute or CollectionService-tagged ID) plus a lookup, so the client can resolve the instance later when it streams in.

## The five server checks

```lua
local CollectionService = game:GetService("CollectionService")
local MAX_USE_DISTANCE = 12

local function validDoor(player: Player, door: any): boolean
	-- 1. type and class
	if typeof(door) ~= "Instance" or not door:IsA("Model") then return false end
	-- 2. it is in the place you expect (not some other model, not a client-only fake)
	if not door:IsDescendantOf(workspace.Doors) then return false end
	-- 3. it is the kind of thing this remote is for
	if not CollectionService:HasTag(door, "Door") then return false end
	-- 4. the player is allowed (ownership, team, unlock state) -- read server data
	local owner = door:GetAttribute("OwnerUserId")
	if owner and owner ~= player.UserId then return false end
	-- 5. the player is close enough to plausibly use it
	local char = player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then return false end
	return (door:GetPivot().Position - root.Position).Magnitude <= MAX_USE_DISTANCE
end
```

Check 2 matters more than it looks: without it, a client can pass **any** replicated instance, including another player's character or a part in ReplicatedStorage, to a remote that then destroys, moves or reparents it.

## Instances that belong to players

For player-owned objects (plots, pets, vehicles, placed furniture):

- Store ownership on the server (attribute set by the server, or a server table). Never trust an `Owner` value the client could have created locally: a locally created value does not replicate, but the server must read its own copy.
- Check the instance is inside **that player's** container (`plot:IsAncestorOf(item)`), not just inside the plots folder.
- For inventory items, pass an item ID (string) and look it up in the player's server-side inventory; do not pass Tool instances as proof of ownership.

## Do not trust instance state the client "saw"

If a client sends `(shopPart, price)`, ignore `price`: read the price from server config by the shop's ID. If it sends `(chest)`, check `chest:GetAttribute("Opened")` on the server before granting loot, and set it on the server immediately to stop double-claims from spam.

## Pitfalls

- `FindFirstChild(name)` with a client-sent string on a sensitive container: validate the name against an allowlist first.
- Assuming `door.Parent` exists: the instance may have been destroyed between the client's click and the server's handler. Check `door.Parent ~= nil` (covered by `IsDescendantOf`).
- Server-to-client: a GUI script that indexes a streamed-out instance errors; use `WaitForChild` with a timeout or listen for it to appear.

## Related
[[Networking Security - Hub]] - [[Remote Type and Allowlist Validation]] - [[Interaction Gate]] - [[Remote Payload Validation]]
