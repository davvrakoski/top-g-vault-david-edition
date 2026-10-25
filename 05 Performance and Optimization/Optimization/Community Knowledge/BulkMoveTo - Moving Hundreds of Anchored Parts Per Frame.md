---
area: "05 Performance and Optimization"
cluster: "Optimization"
title: "BulkMoveTo - Moving Hundreds of Anchored Parts Per Frame"
tags: [roblox, community-knowledge, optimization, cframe, rendering]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/WorldRoot
  - https://create.roblox.com/docs/reference/engine/enums/BulkMoveMode
  - https://devforum.roblox.com/t/worldrootbulkmoveto-is-weirdly-inconsistent-with-seemingly-the-amount-same-parts-each-time/4008273
  - https://devforum.roblox.com/t/how-we-are-developing-an-rts-game-with-good-performance-for-more-than-200-units/3281168
---
# BulkMoveTo - Moving Hundreds of Anchored Parts Per Frame

Client-rendered crowds, RTS units, projectile visuals, conveyor items and tower-defense enemies often end up as hundreds of anchored parts whose `CFrame` is set every frame. Each separate assignment fires property-changed signals and pays its own engine call. `WorldRoot:BulkMoveTo` moves a whole array in one call and can skip most of those signals. It is the standard tool once part movement shows up as the top cost in the MicroProfiler.

## The API (Engine API)

```lua
WorldRoot:BulkMoveTo(partList: {BasePart}, cframeList: {CFrame}, eventMode: Enum.BulkMoveMode?)
```

- Both arrays are sequential (index 1..n) and must be the same length; part `i` goes to CFrame `i`.
- Default mode `FireAllEvents` fires Changed for `Position`, `Orientation` and `CFrame`.
- `Enum.BulkMoveMode.FireCFrameChanged` fires only the `CFrame` Changed event. This is the mode most people want.
- Not thread safe (cannot be called from a desynchronized Actor thread).
- The docs warn that plain `CFrame` sets are fast enough in most cases. Use it only when profiling proves movement is the bottleneck.

## A reusable pattern

```lua
local RunService = game:GetService("RunService")

local parts: {BasePart} = {}
local targets: {CFrame} = {}

local function add(part: BasePart)
    part.Anchored = true
    part.CanCollide, part.CanTouch, part.CanQuery = false, false, false
    table.insert(parts, part)
    table.insert(targets, part.CFrame)
end

RunService.PreRender:Connect(function(dt)
    local t = os.clock()
    for i = 1, #parts do
        -- compute where each visual should be (your simulation lives elsewhere)
        targets[i] = targets[i] * CFrame.Angles(0, dt, 0)
    end
    workspace:BulkMoveTo(parts, targets, Enum.BulkMoveMode.FireCFrameChanged)
end)
```

Keep `parts` and `targets` as long-lived arrays and overwrite entries; building fresh tables each frame adds garbage. When removing a unit, swap it with the last entry and pop both arrays so indices stay aligned.

## What the community measured

- An RTS team on the DevForum (thread 3281168) reported a large FPS gain when moving 1000 unit root parts with one `BulkMoveTo` call, and described it as an informal test. They kept simulation in plain Luau tables and only pushed final CFrames to parts.
- Another thread (4008273) moving about 5000 parts saw the same call cost very different times on different frames. Replies suggested splitting into batches of roughly 500-1000 parts per call; the author later switched approach. Treat both figures as anecdotes and measure your own case.

## Where it fits and where it does not

| Situation | Better tool |
| --- | --- |
| Hundreds of independent anchored visuals | `BulkMoveTo` |
| A welded model moving as one | Set the root's CFrame or `PivotTo` once |
| Animated rig limbs | Animator / `Motor6D.Transform` |
| Physically simulated parts | Leave to physics; do not teleport every frame |
| Server-side movement visible to all | Usually move on each client instead; server CFrame sets replicate every change |

## Pitfalls

- Moving anchored parts on the server replicates every update to every client; for pure visuals, simulate on the server in data and render with `BulkMoveTo` on each client.
- `FireCFrameChanged` still fires `CFrame` changed; anything listening with `GetPropertyChangedSignal("Position")` will stop updating.
- Parts outside streaming radius may be missing on the client. Skip nil entries or rebuild the arrays on stream in/out.
- Pair it with pooling: destroying and creating parts costs more than moving them.

## Related
[[Optimization - Hub]] · [[Object Pooling Without Making a Mess]] · [[Script Profiler, Native Code Gen and Luau Hot Paths]] · [[Server-Side Tweens and Property Churn - Hidden Replication Cost]]
