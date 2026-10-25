---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "03_Networking_Security/03_Server_Authoritative_Melee"
title: "Server-Authoritative Melee Pattern"
tags: [roblox, premium, "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Server-Authoritative Melee Pattern

A strong melee system separates **feel** from **truth**.

## Client

- starts anticipation animation immediately
- plays local swing audio
- sends attack ID + approximate aim/origin
- never sends damage amount

## Server

- confirms attack exists in server config
- confirms player can attack in current state
- checks cooldown/stamina
- confirms weapon ownership/equip state
- computes or validates hit volume/raycast
- prevents hitting same target repeatedly during one swing
- applies damage and authoritative status effects
- sends confirmed hit result for cosmetics

```luau
-- simplified server example
local AttackDefinitions = {
    BatLight = {Damage = 25, Range = 8, Cooldown = 0.55},
}

local lastAttack: {[Player]: number} = {}

AttackRemote.OnServerEvent:Connect(function(player, attackId: string, aimPosition: Vector3)
    local def = AttackDefinitions[attackId]
    if not def then return end
    if typeof(aimPosition) ~= "Vector3" then return end

    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid or humanoid.Health <= 0 then return end

    local now = os.clock()
    if now - (lastAttack[player] or -math.huge) < def.Cooldown then return end
    lastAttack[player] = now

    local delta = aimPosition - root.Position
    if delta.Magnitude > def.Range * 2 then return end -- reject absurd claims

    -- Perform server-controlled overlap/raycast here using configured range.
end)
```

Production systems should also handle latency, animation windows, team rules, invulnerability, hit deduplication, and reconciliation.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Combat - Hub]]

**Related notes:** [[Combat Feel Tuning Worksheet]] · [[Feature Flags and Config-Driven Development]] · [[Config-Driven Weapons]] · [[Damage and Status Effects Blueprint]]

<!-- TDOD_GRAPH_END -->
