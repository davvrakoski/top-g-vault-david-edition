---
area: "03 Scripting and Systems"
cluster: "Scripting"
source_note: "02_Programming_Networking_Security/04_LUAU_PROGRAMMING"
title: "LUAU PROGRAMMING"
tags: [roblox, tdod-vault, reference, "cluster/scripting"]
status: verified-baseline
cssclasses: [tg-a03]
---

# LUAU PROGRAMMING

=================================================

Luau is Roblox's scripting language.

LEARN IN THIS ORDER:
1. variables
2. strings/numbers/booleans
3. tables
4. if/elseif/else
5. loops
6. functions
7. scope
8. events
9. ModuleScripts
10. services
11. instances
12. CFrame
13. Vector2 / Vector3
14. raycasting
15. object-oriented patterns only when useful
16. typed Luau
17. asynchronous patterns
18. parallel Luau for proven heavy workloads

GOOD CODE PRINCIPLES:
- Prefer small functions.
- Give variables meaningful names.
- Avoid duplicated logic.
- Separate data, gameplay logic, UI, and VFX.
- Put reusable logic in ModuleScripts.
- Use --!strict in important modules when practical.
- Validate function inputs.
- Avoid giant 2,000-line god scripts.
- Avoid endless while loops with heavy work.
- Disconnect events when objects are destroyed if connections can live on.
- Clean up temporary instances.
- Do not create/destroy thousands of objects unnecessarily.
- Cache frequently reused references.
- Measure before "optimizing."

MODULE EXAMPLE STRUCTURE:
src/
  client/
    Controllers/
    UI/
    VFX/
  server/
    Services/
    AI/
    Data/
  shared/
    Config/
    Types/
    Utility/

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Scripting - Hub]]

**Related notes:** [[Weighted Random Selection]] · [[Cleanup Bag Pattern]] · [[Remote Protocol Versioning]] · [[Cooldown Module]]

<!-- TDOD_GRAPH_END -->
