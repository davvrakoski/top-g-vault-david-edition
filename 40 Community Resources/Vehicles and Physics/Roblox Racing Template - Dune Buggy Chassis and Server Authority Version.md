---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/racing-template"
title: "Roblox Racing Template - Dune Buggy Chassis and Server Authority Version"
tags: [roblox, community, vehicles, racing, template, official, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "Roblox Studio template (no open license stated) - use inside Roblox"
sources:
  - https://devforum.roblox.com/t/new-studio-racing-template/2805745
  - https://devforum.roblox.com/t/new-studio-racing-template/2805745/64
  - https://devforum.roblox.com/t/new-studio-racing-template/2805745?page=2
  - https://devforum.roblox.com/t/2024-h1-physics-recap/3118248
  - https://create.roblox.com/docs/projects/server-authority
  - https://www.roblox.com/games/134686834388911/Racing-Server-Authority-Template
---
# Roblox Racing Template - Dune Buggy Chassis and Server Authority Version

| | |
|---|---|
| **What** | Roblox's official Studio **Racing** template: an updated endorsed dune buggy, a multi-race system and a PBR driving map |
| **Announced** | DevForum, 2024-01-23, posted by MintyUltra for the template team |
| **License** | A Roblox Studio template; no open-source license is stated |
| **Bundle-safe?** | No - **use only** (open it from Studio's template list; link to it, do not repackage it) |
| **Server authority version** | Linked from the official server authority docs: https://www.roblox.com/games/134686834388911/Racing-Server-Authority-Template |

## What the template contains (from the announcement)
- **Car:** an updated endorsed dune buggy with better model, PBR materials and gameplay features. You tune it by changing **attributes** on its components.
- **Races:** several races per place, each with its own min / max players and lap count. Checkpoint visuals appear when a race starts. New race = duplicate the `Race` folder and place parts named `Checkpoint1` ... `CheckpointN` in order.
- **Map:** custom PBR terrain and modular track pieces.
- **Known issue:** with the aerodynamics beta switched on, the car can sometimes fling out of the world (see [[Aerodynamic Fluid Forces Beta - Planes, Gliders and Wind]]).
- The older **Classic Racing** template left the Studio template screen on 2024-05-01.

## Driving it with AI
The template has no AI racers. MintyUltra's reply: remove the client control scripts and let an AI script drive the car through its **Controller module** and the attributes on the **Input** configuration object. In other words the car reads abstract inputs, so a player script and an AI script are interchangeable. That is the same split recommended in [[Vehicle Input Actions - Keyboard, Gamepad Triggers and Touch Pedals]].

## Resizing the chassis safely (post #64 and replies)
The buggy is a full constraint rig (steering rack, steering rods, anti-roll bar springs). Most breakage comes from **attachments drifting out of line** when you resize or move parts.
- **Rear wheels:** select both rear wheels, the anti-roll bar and the matching chassis attachment, and move them together.
- **Front wheels:** same, plus the steering rack part and its chassis attachment; then change the **steering rod length**.
- **Wider wheels:** set the matching anti-roll bar spring's `FreeLength` to its `CurrentLength`.
- Community reports: widening the front track can lock the front wheels; scaling down for an ATV made it unstable; one user found scaling the **whole model at once** worked better than scaling single parts.

## Other community notes
- Some replies reported problems with `StreamingEnabled` (checkpoints outside the stream radius not existing on the client), others said the car only worked with streaming on. Test with your own streaming settings and give the car model an atomic / persistent streaming setup if parts go missing.
- Nitro use runs on the client in this template, so a reply warned that moving it server-side needs a remote you must validate.
- Roblox's physics team later used the Racing Template as a benchmark: a StepContacts optimization saved about 0.1 ms per frame in it (2024 H1 Physics Recap).

## Server Authority Racing template
The official server authority docs link a separate **Racing** template built for `Workspace.AuthorityMode = Server`. The docs also show how to copy each player's throttle into attributes so other clients see who is pressing the throttle. See [[Server Authority Vehicles - Prediction, BindToSimulation and Input Attributes]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Kart Racing Systems - Checkpoints, Laps, Boost Pads and Respawn]] · [[Choosing a Roblox Car Chassis - VehicleSeat, Constraint, Raycast or Server Authority]] · [[Server authority model]] · [[Vehicle Suspension, Chassis and Grip]]

<!-- TDOD_GRAPH_END -->
