---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Humanoid Cost Knobs for NPCs - States, EvaluateStateMachine and Humanoid-Free Rigs"
tags: [roblox, community-knowledge, performance, npc, humanoid]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/enums/HumanoidStateType
  - https://create.roblox.com/docs/reference/engine/classes/AnimationController
---
# Humanoid Cost Knobs for NPCs - States, EvaluateStateMachine and Humanoid-Free Rigs

A Humanoid is a whole character controller: a state machine, floor detection, climbing and swimming checks, health, name display and physics. That is worth it for players and for NPCs that walk, but it is expensive to multiply by 50 or 200. Roblox's own "Improve performance" guide lists Humanoid overuse as a common problem and names the `stepHumanoid` and `stepAnimation` MicroProfiler labels as where you see it. This note is the list of knobs, from smallest change to biggest.

## 1. Turn off states the NPC never uses

`Humanoid:SetStateEnabled(state, false)` removes a state from consideration. The official guide calls out Climbing specifically; for a typical ground enemy also consider Swimming, Seated, Flying, Ragdoll/FallingDown (if you ragdoll yourself) and GettingUp.

```lua
local DISABLED = {
    Enum.HumanoidStateType.Climbing,
    Enum.HumanoidStateType.Swimming,
    Enum.HumanoidStateType.Seated,
    Enum.HumanoidStateType.Flying,
}

local function slimHumanoid(hum: Humanoid)
    for _, s in DISABLED do
        hum:SetStateEnabled(s, false)
    end
end
```

State enables are applied where the Humanoid is simulated: for an NPC whose network owner is the server, do it on the server.

## 2. Freeze idle NPCs: EvaluateStateMachine

`Humanoid.EvaluateStateMachine = false` disables the Humanoid's internal physics and state machine (per the API reference). Use it for NPCs that are standing still (shopkeepers, guards on idle, sleeping zombies far from players) and switch it back on when they need to move. Combine with anchoring the HumanoidRootPart for NPCs that should not be pushed. Test animations afterwards, since the Animator still plays tracks but locomotion logic no longer runs.

## 3. Drop the Humanoid for static or scripted NPCs

The guide is direct: static NPCs that do not move generally do not need a Humanoid. Options:
- **AnimationController + Animator** for rigs that only play animations (mannequins, crowd members, turrets, animals moved by your own code).
- **Anchored model moved with `PivotTo` or BulkMoveTo** for NPCs on rails or driven by a custom steering loop.
- Show health and names with your own BillboardGui instead of Humanoid display properties.

One exception from the same guide: for **skinned MeshParts in a Model without a Humanoid**, movement can force the engine to rebuild spatial clusters each move; adding a Humanoid to that Model makes it use a single cluster. If you have moving skinned creatures without Humanoids and see cluster cost, a Humanoid (with states trimmed) may be the cheaper option. Measure both.

## 4. Pool instead of respawn

Instantiating and respawning Humanoid models (or skinned MeshParts) frequently is listed as a cost in its own right. Keep a pool of dead NPC models, reset Health, `ChangeState(Enum.HumanoidStateType.GettingUp)` or rebuild state, and reposition them. See [[Object Pooling Without Making a Mess]].

## 5. Cheaper settings on every Humanoid

| Property | Cheap setting | Effect |
|---|---|---|
| `DisplayDistanceType` | `None` | No built-in name/health display |
| `BreakJointsOnDeath` | `false` when you ragdoll or pool | Avoids joint teardown you would rebuild |
| `RequiresNeck` | `false` for non-standard rigs | Prevents unexpected deaths when a neck is missing |

## Measure

Spawn 100 NPCs in an empty baseplate, record `stepHumanoid` time in the MicroProfiler, then apply one knob at a time. Keep the change only if the number drops; budgets vary by device, so test on a phone too.

## Related
[[Performance - Hub]] - [[NPC Crowds, Animation LOD and Server Budgets]] - [[NPC Animation at Scale - Where to Play Tracks and Animator LOD]] - [[MicroProfiler Reading Guide]]
