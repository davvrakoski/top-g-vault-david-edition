---
area: "04 Networking Data and Servers"
cluster: "Networking Security"
source_note: "26_Practical_Luau_Library/14_Interaction_Gate"
title: "Interaction Gate"
tags: ["roblox", "legendary", "production", "cluster/networking-security"]
verified: 2026-10-25
cssclasses: [tg-a04]
---

# Interaction Gate

For doors, pickups, terminals and prompts, the server should re-check whether interaction is still valid.

```lua
local function canInteract(player, target)
    local char=player.Character
    local root=char and char:FindFirstChild("HumanoidRootPart")
    if not root or not target:IsDescendantOf(workspace) then return false end
    if (root.Position-target.Position).Magnitude > 12 then return false end
    if target:GetAttribute("Disabled") then return false end
    return true
end
```

Add ownership, line-of-sight, quest state, cooldown and one-time claim checks as the design requires.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Networking Security - Hub|Networking Security]]

**Related:** [[Practical Luau Pattern Library]]
