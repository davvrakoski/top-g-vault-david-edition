---
area: "02 Game Design and Economy"
cluster: "Top G Vault"
source_note: "26_Practical_Luau_Library/02_Finite_State_Machine"
title: "Finite State Machine"
tags: ["roblox", "legendary", "production", "cluster/scripting"]
verified: 2026-10-25
cssclasses: [tg-a02]
---

# Finite State Machine

Centralize legal transitions instead of spreading booleans through scripts.

```lua
--!strict
local Machine = {}
Machine.__index = Machine

function Machine.new(initial: string, allowed: {[string]: {[string]: boolean}})
    return setmetatable({state=initial, allowed=allowed}, Machine)
end

function Machine:can(nextState: string): boolean
    local row = self.allowed[self.state]
    return row ~= nil and row[nextState] == true
end

function Machine:set(nextState: string): (boolean, string?)
    if nextState == self.state then return true end
    if not self:can(nextState) then
        return false, (`illegal transition {self.state} -> {nextState}`)
    end
    self.state = nextState
    return true
end

return Machine
```

Add enter/exit hooks only when you have clear cleanup needs. Keep the transition table visible so designers/engineers can audit it.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Top G Vault - Home|Top G Vault]]

**Related:** [[Practical Luau Pattern Library]]
