---
area: "40 Community Resources"
cluster: "Vehicles and Physics"
source_note: "community/vehicles-physics/a-chassis"
title: "A-Chassis - Community Car Chassis Kit"
tags: [roblox, community, vehicles, chassis, "cluster/vehicles-and-physics"]
cssclasses: [tg-a40]
verified: 2026-10-25
license: "MPL-2.0"
sources:
  - https://github.com/lisphm/A-Chassis
  - https://github.com/OpenChassis/OpenChassis
  - https://devforum.roblox.com/t/how-do-you-make-a-car/1675381
  - https://devforum.roblox.com/t/how-to-make-a-car-drift/1183217
---
# A-Chassis - Community Car Chassis Kit

| | |
|---|---|
| **What** | The best-known free Roblox car / motorcycle chassis kit, with a tune file and a plugin system |
| **Maintainer** | `lisphm` (GitHub repo that calls itself the official page). The OpenChassis README credits the original A-Chassis and SS6 line to **Inspare** |
| **Latest seen** | `v1.7.2-stable` (repo checked 2026-10-25, ~107 stars) |
| **License** | MPL-2.0 (shown in the repo sidebar) |
| **Bundle-safe?** | No - **use only / link only**. MPL-2.0 is not one of our bundle licenses (CC0, CC BY 4.0, MIT) |
| **Link** | https://github.com/lisphm/A-Chassis |

## What it gives you
- A ready chassis you drop under your car model, then tune with a settings module instead of writing physics code.
- A **plugin system** so add-ons (lights, sounds, gauges, seat locks) hook in without editing the core.
- Cars **and** bikes (the repo topics list car and motorcycle).
- A Discord for support; the README says hundreds of experiences use it.

## Install (from the README)
1. **Manual:** download the `.rbxm` from the GitHub Releases page and insert it into your place.
2. **Toolbox:** take the model from the Creator Store, then insert it from the Toolbox Inventory tab.

Only take the model from the official listing linked by the repo. Car kits are a common place for hidden backdoor scripts, so search any free copy for `require(` with a number before you publish.

## Known issues (listed by the repo)
- The whole car shifts when steering with the "New" steering type.
- The bike animation breaks layered clothing.

## What the community says
- A DevForum reply calls it a very good open-source steering car, but points out it simulates on the **driver's client**, so car-to-car crashes can look odd for other players. That is a network-ownership trade-off, not an A-Chassis bug. See [[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]].
- For drifting, DevForum replies suggest tuning A-Chassis (rear grip, power split) before writing your own drift chassis. See [[Drift and Handling Tuning - Community Tips for Constraint Cars]].

## When to pick it
| Pick A-Chassis when... | Pick something else when... |
|---|---|
| You want realistic-feeling road cars fast and can live with a big, opinionated codebase | You need server-authoritative anti-cheat cars (see [[Server-Authoritive-Vehicle - MIT Server Authority Car Kit]]) |
| You want a large community of tunes and plugins | You want to ship the chassis code inside a paid kit (license does not allow our bundle) |
| Your game is driving-first | You need arcade karts (see [[Arcade Handling and Drifting Without Fighting Physics]]) |

## Forks and helpers
- **Entity RA** continues the A-Chassis 6C line under GPL-3.0: [[Entity RA - GPL Land Vehicle Chassis From the A-Chassis Line]].
- `ehenry344/A-Chassis-Debug-Tool-` (MIT, last pushed 2021) is a Studio plugin for finding broken scripts inside A-Chassis cars. Old, so test it first.

## Credit line
"A-Chassis" by lisphm and contributors (original line by Inspare), MPL-2.0, https://github.com/lisphm/A-Chassis

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Vehicles and Physics - Hub]]

**Related notes:** [[Choosing a Roblox Car Chassis - VehicleSeat, Constraint, Raycast or Server Authority]] · [[Vehicle Framework]] · [[Vehicle Suspension, Chassis and Grip]] · [[Constraint Car Build - CylindricalConstraint, SpringConstraint and VehicleSeat]]

<!-- TDOD_GRAPH_END -->
