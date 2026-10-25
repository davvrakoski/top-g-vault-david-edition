---
area: "07 AI and Combat"
cluster: "Combat"
source_note: "15_Code_Patterns/04_Config_Driven_Weapons"
title: "Config-Driven Weapons"
tags: [roblox, premium, "cluster/combat"]
verified: 2026-10-25
cssclasses: [tg-a07]
---

# Config-Driven Weapons

Do not duplicate an entire combat script for every weapon.

```luau
local Weapons = {
    BaseballBat = {
        Damage = 30,
        Range = 8,
        Cooldown = 0.65,
        Stamina = 12,
        Hitbox = Vector3.new(5, 5, 7),
        Animation = "rbxassetid://...",
        HitSoundSet = "WoodHeavy",
        ImpactVFX = "BluntHeavy",
    },
    Katana = {
        Damage = 42,
        Range = 9,
        Cooldown = 0.72,
        Stamina = 15,
        Hitbox = Vector3.new(4, 5, 9),
        Animation = "rbxassetid://...",
        HitSoundSet = "Blade",
        ImpactVFX = "Slash",
    },
}
```

The system reads data; the config defines identity. Unique weapons can still have custom handlers when genuinely necessary.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Combat - Hub]]

**Related notes:** [[Feature Flags and Config-Driven Development]] · [[Server-Authoritative Melee Pattern]] · [[Damage and Status Effects Blueprint]] · [[Hitscan and Projectile Weapon Blueprint]]

<!-- TDOD_GRAPH_END -->
