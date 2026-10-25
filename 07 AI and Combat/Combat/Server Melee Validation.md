---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "26_Practical_Luau_Library/07_Server_Melee_Validation"
title: "Server Melee Validation"
tags: ["roblox", "legendary", "production", "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Server Melee Validation

A client can request an attack and play anticipation immediately, but the server decides whether damage is legal.

```lua
local function tryMelee(player, weaponId)
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if not CombatState:CanAttack(player, weaponId) then return end

    CombatState:CommitCooldown(player, weaponId)
    local hits = HitQuery:BoxFromWeapon(root.CFrame, weaponId)
    for _, target in hits do
        if DamageRules:CanDamage(player, target) then
            DamageService:Apply(player, target, WeaponDefs[weaponId].Damage)
        end
    end
end
```

The exact hit-query strategy depends on game feel. The security idea is invariant: never accept arbitrary client-supplied damage or distant target truth.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Combat - Hub|Combat]]

**Related:** [[Practical Luau Pattern Library]]
