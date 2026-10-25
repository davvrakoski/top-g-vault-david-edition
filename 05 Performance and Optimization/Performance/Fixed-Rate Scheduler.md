---
area: "05 Performance and Optimization"
cluster: "Performance"
source_note: "26_Practical_Luau_Library/03_Fixed_Rate_Scheduler"
title: "Fixed-Rate Scheduler"
tags: ["roblox", "legendary", "production", "cluster/performance"]
verified: 2026-10-25
cssclasses: [tg-a05]
---

# Fixed-Rate Scheduler

Many systems do not need a 60 Hz callback. A scheduler can distribute work at 2, 5, 10 or 20 Hz depending on importance.

```lua
local RunService = game:GetService("RunService")
local jobs = {}

local function addJob(hz, callback)
    table.insert(jobs, {step = 1/hz, acc = 0, fn = callback})
end

RunService.Heartbeat:Connect(function(dt)
    for _, job in jobs do
        job.acc += dt
        if job.acc >= job.step then
            local elapsed = job.acc
            job.acc %= job.step
            job.fn(elapsed)
        end
    end
end)
```

For large job counts, do not put everything in one naive loop; bucket/stagger jobs. Measure scheduler overhead versus the work saved.

## Test checklist
- [ ] Normal input works.
- [ ] Invalid/malformed input fails safely.
- [ ] Cleanup path is tested.
- [ ] Performance impact is measured if this runs frequently.
- [ ] The example is adapted to the project rather than pasted blindly.

## Knowledge graph connections

**Primary cluster:** [[Performance - Hub|Performance]]

**Related:** [[Practical Luau Pattern Library]]
