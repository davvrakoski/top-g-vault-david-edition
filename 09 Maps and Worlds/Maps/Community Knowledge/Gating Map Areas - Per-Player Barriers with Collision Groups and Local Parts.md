---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Gating Map Areas - Per-Player Barriers with Collision Groups and Local Parts"
tags: [roblox, community-knowledge, maps, gating, progression, collision-groups]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/workspace/collisions
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://devforum.roblox.com/t/player-only-barrier/1747799
  - https://devforum.roblox.com/t/local-collision-filtering/493897
  - https://devforum.roblox.com/t/understanding-collision-groups/828363
---
# Gating Map Areas - Per-Player Barriers with Collision Groups and Local Parts

Simulators, tycoons and adventure maps lock areas behind levels, rebirths, keys or game passes: "Zone 2 needs 5,000 coins". The gate must block players who have not unlocked it while letting others walk through, on the same server. That per-player rule is the tricky part, because a part's `CanCollide` is a single value shared by everyone. This note covers the three approaches the community uses and which one to trust.

## Approach 1: client-side barrier (cosmetic gate)

Each client decides whether the gate is solid for its own character.

```lua
-- LocalScript in StarterPlayerScripts
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gate = workspace:WaitForChild("Gates"):WaitForChild("Zone2Gate")

local function refresh()
    local unlocked = (player:GetAttribute("Zone") or 1) >= 2
    gate.CanCollide = not unlocked
    gate.Transparency = unlocked and 1 or 0.4
end

player:GetAttributeChangedSignal("Zone"):Connect(refresh)
refresh()
```

Why it works: the client simulates its own character, so a local `CanCollide = false` lets that character pass. The server never sees the change. **It is not security**: an exploiter can delete the barrier locally. Always pair it with Approach 3.

## Approach 2: collision groups (one group per gate)

The Collisions guide says parts in non-colliding groups pass through each other even when both have `CanCollide = true`. Use that to make one gate group and one "pass" group per unlocked tier.

```lua
-- Server
workspace:RegisterCollisionGroup("Gate2")
workspace:RegisterCollisionGroup("Zone2Pass")
workspace:CollisionGroupSetCollidable("Gate2", "Zone2Pass", false)

local function setPass(character: Model, groupName: string)
    for _, d in character:GetDescendants() do
        if d:IsA("BasePart") then d.CollisionGroup = groupName end
    end
end
```

Reapply the group on every `CharacterAdded` and on `DescendantAdded` (accessories load later). The DevForum tycoon answer in "Player only barrier" (1747799) recommends this per-gate group setup over looping `CanCollide` on the client. Collision groups are limited: check `workspace:GetMaxCollisionGroups()` and do not create a group per player or per object. A character can only be in one group, so this approach suits linear tiers (Zone2Pass also passes Gate1) better than independent keys.

## Approach 3: server enforcement (the real lock)

Whatever blocks the player visually, the server must also check position:

- Mark each locked zone with an invisible anchored box (`CanCollide`, `CanTouch`, `CanQuery` false).
- Every 0.5-1 s, use `workspace:GetPartBoundsInBox` with an `OverlapParams` that only includes character root parts, or check root positions against the box in Luau.
- A player inside a zone they have not unlocked is moved back to the zone's entrance spawn.

This also catches players who glitch through walls or get flung over the gate.

## Design guidance

| Gate type | Feel | Use |
| --- | --- | --- |
| Hard wall with price sign | Clear goal, "I want that" | Simulator zones |
| Soft gate (dangerous enemies, no wall) | Player chooses risk | Open worlds |
| Visible but unreachable reward | Motivation before the ask | Behind the gate, in sight |
| Locked door with interaction | Story pacing | Adventure, horror |

Show what is behind the gate (glass, open fence, preview area) so the requirement reads as a promise, not a wall. Put the purchase prompt at the gate itself, with the requirement in the same place every time.

## Pitfalls

- Server-side `CanCollide` changes affect everyone; never toggle the shared gate for one player.
- With streaming on, the gate may not exist on the client yet; use `WaitForChild` with a timeout or tag-based binding.
- Teleporting into a locked area through a friend-join or a vehicle bypasses walls; the server zone check covers it.

## Related
[[Maps - Hub]] · [[Zone Detection - ZonePlus, QuickZone and Doing It Yourself]] · [[Collision Property Tuning - CanCollide, CanQuery, CanTouch and CollisionFidelity]] · [[Tycoon Plot Layout and Plot Assignment]]
