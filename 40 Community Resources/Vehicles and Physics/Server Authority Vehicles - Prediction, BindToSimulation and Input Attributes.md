---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/server-authority-vehicles"
title: "Server Authority Vehicles - Prediction, BindToSimulation and Input Attributes"
tags: [roblox, community, vehicles, server-authority, networking, anti-exploit, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/projects/server-authority
  - https://create.roblox.com/docs/projects/server-authority/techniques
  - https://create.roblox.com/docs/scripting/security/network-ownership
  - https://github.com/VanillaEdge/Server-Authoritive-Vehicle
  - https://www.roblox.com/games/134686834388911/Racing-Server-Authority-Template
---
# Server Authority Vehicles - Prediction, BindToSimulation and Input Attributes

Roblox's **server authority** model makes the server the only source of truth; clients only report their **inputs**. For vehicles this closes the biggest hole of the classic setup, where the driver's client owns the car and can teleport or speed-hack it. The official docs say this prevents whole classes of cheats like fly and speed hacks.

Full reference: [[Server authority model]] and [[Server authority techniques]]. This note pulls out what matters for cars.

## Turn it on (from the docs)
Set `Workspace.AuthorityMode = Server`. That also switches on what it needs:
- `NextGenerationReplication`
- `PlayerScriptsUseInputActionSystem`
- `SignalBehavior = Deferred`
- `UseFixedSimulation`
- `StreamingEnabled`

## How it stays responsive
| Concept | What it means for a car |
|---|---|
| **Client prediction** | Your client runs your car a few frames ahead of the last server state, so steering reacts instantly |
| **Misprediction** | The server disagrees (another car hit you) |
| **Rollback and resimulation** | Your client rewinds to the server state and replays your inputs; small corrections should be invisible |
| `RunService:BindToSimulation()` | Where your car logic must live, in a ModuleScript run on **both** client and server, so it can be replayed |
| `time()` | Synchronized and fixed-step under server authority; use it, not `os.clock()`, inside simulation code |
| Simulation Access label | Only API members with this label (for example `BasePart.CFrame`) can be used inside bound functions |
| RenderStepped | Effects (sounds, particles, camera) go here, reading the simulation's result, never inside the simulation |

## The racing-specific gotcha: other players' throttles
By default Roblox does not forward each client's inputs to every other client. The techniques page uses a racing game as the example: other cars may look **behind** you even when they are ahead, because your client does not know they are holding the throttle. The fix shown in the docs: every simulation step, write each player's inputs to **attributes** (the server forwards them to everyone, each client writes its own), then drive every car from those attributes inside `BindToSimulation`. The official Racing Server Authority Template demonstrates this.

## Architecture sketch
```
ReplicatedStorage/CarSim (ModuleScript, required by client AND server)
  BindToSimulation(dt):
    for each car:
      read Throttle / Steer from attributes (or InputActions)
      update the car using Simulation Access members only
RenderStepped (client only):
  wheel spin visuals, engine sound pitch, speedometer
```
Read inputs from **InputActions** (the server can read each player's actions too; the docs sample reads them from the player's `PlayerGui`). Bindings are covered in [[Vehicle Input Actions - Keyboard, Gamepad Triggers and Touch Pedals]].

## Debugging tools (from the docs)
- **Server authority visualizer:** Ctrl+Shift+F6 (Cmd+Shift+F6 on Mac). Watch prediction success rate, input accept rate, and server heartbeat FPS (below 59 means the server cannot keep up).
- **Prediction radius:** enable Are Regions Enabled in Studio settings to see the green cylinder of predicted instances around your character.

## Open-source starting points
- [[Server-Authoritive-Vehicle - MIT Server Authority Car Kit]] (MIT, bundle-safe): minimal car built for `AuthorityMode = Server`. Its README lists current engine bugs on enter / exit.
- Official **Racing Server Authority Template** (use only): https://www.roblox.com/games/134686834388911/Racing-Server-Authority-Template

## Should you switch?
| Stay with client-owned cars + checks | Move to server authority |
|---|---|
| Casual hangout or roleplay driving | Competitive racing, ranked modes, money rewards for wins |
| You rely on an existing kit like A-Chassis | You are starting fresh and can write simulation-safe code |
| You need features the server authority path does not support yet | You want cheat resistance without hand-written speed checks |

Check the docs' current status before committing: the security page described server authority as beta when it was written.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Vehicle Anti-Exploit - Server Sanity Checks for Client-Owned Cars]] · [[Roblox Racing Template - Dune Buggy Chassis and Server Authority Version]] · [[Network Ownership and Physics Replication]] · [[Server authority techniques]]

<!-- TDOD_GRAPH_END -->
