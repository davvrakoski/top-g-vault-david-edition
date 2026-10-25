---
area: "02 Game Design and Economy"
cluster: "Inventory Economy"
source_note: "26_Practical_Luau_Library/10_Idempotent_Transaction_Ledger"
title: "Idempotent Transaction Ledger"
tags: ["roblox", "legendary", "production", "cluster/inventory-economy"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Idempotent Transaction Ledger

Operations that can retry—purchases, trade commits, external callbacks—need duplicate protection.

```lua
local function applyOnce(profile, transactionId, apply)
    profile.Processed = profile.Processed or {}
    if profile.Processed[transactionId] then
        return false, "duplicate"
    end
    apply(profile)
    profile.Processed[transactionId] = os.time()
    return true
end
```

A real implementation must bound/compact ledger growth and make the persistence operation conflict-safe. The core property is that replaying the same transaction does not grant the reward twice.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Inventory Economy - Hub|Inventory Economy]]

**Related:** [[Practical Luau Pattern Library]]
