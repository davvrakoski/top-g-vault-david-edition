---
area: "16 Fast Game Kit"
cluster: "Genre Recipes"
tags: [fast-game-kit, roblox, genre-recipe, open-world, city, vehicles]
cssclasses: [tg-a16]
---

# Genre Recipe - GTA-Lite City

## Why this matters
A "GTA-lite" city game (drive cars, take jobs, earn cash, run from police, in the tradition of Jailbreak and Da Hood rather than a real crime sim) is one of Roblox's most replayable formats because players make their own stories.
It needs vehicles, a city and a wanted system, which sounds huge. The vault's City Kits, Car Kit and vehicle deep dives cut it down to one district you can ship.

## Core loop in 3 lines
1. **Earn:** do a job (delivery, taxi, robbery, police patrol) for cash.
2. **Spend:** buy cars, upgrades, outfits, a garage or apartment.
3. **Chase:** risky jobs raise a wanted level; police (players or NPCs) chase you; escape or get arrested; repeat.

Deeper breakdown: [[Open World RPG Starter Architecture]] · [[Case Study - Jailbreak]] · [[Case Study - Da Hood]] · [[Case Study - Brookhaven RP]].

## MVP feature list
- [ ] One city district (about 4x4 blocks) with roads, shops, a bank, a police station.
- [ ] 3 drivable cars (starter, sports, police) with a spawner at a garage.
- [ ] 2 jobs: one legal (delivery/taxi) and one criminal (store robbery).
- [ ] Wanted level (1-3 stars) and arrest/jail with a timer.
- [ ] Police team (player cops) **or** simple NPC police; pick one for v1.
- [ ] Cash, car ownership saved, car shop.
- [ ] Minimap + objective markers.
- [ ] Mobile driving controls.
- [ ] Saving, currency, gamepasses, codes, settings: from [[Starter Code - Hub]].

## Realistic timeline (estimates)

| Team | MVP (1 district, 3 cars, 2 jobs) | 2 districts, heists, houses |
|---|---|---|
| Solo, with the Starter Code kit | 6-10 weeks | 4-6 months |
| Small team (2 scripters, builder, UI) | 4-6 weeks | 2-4 months |

Vehicles and streaming are the long poles; start them first.

## Build order, week by week

| Week | Build | Done when |
|---|---|---|
| 1 | One car: chassis, seat entry, camera, network ownership, spawner | Car drives well on phone + PC; no jitter with 2 players |
| 2 | City blockout on a road grid with the City Kits; StreamingEnabled on | You can drive the district at 60 FPS on a phone |
| 3 | Job 1 (delivery) + cash + car shop with 3 cars | Earn → buy car → drive loop saves |
| 4 | Job 2 (robbery), wanted level, police team, arrest/jail | A full chase ends in escape or arrest |
| 5 | Minimap, markers, HUD, juice (sirens, lights, skid marks) | New players find jobs without help |
| 6 | Art pass, night lighting, NPC traffic (optional) | Screenshots sell the fantasy |
| 7-8 | Anti-exploit (speed, teleport), performance, shop, soft launch | [[Launch Week Checklist]] done |

## Systems from the vault

| System | Notes |
|---|---|
| Car chassis | [[Choosing a Roblox Car Chassis - VehicleSeat, Constraint, Raycast or Server Authority]] · [[Constraint Car Build - CylindricalConstraint, SpringConstraint and VehicleSeat]] · [[Raycast Suspension Car - Spring-Damper Pattern and Pitfalls]] |
| Handling | [[Arcade Handling and Drifting Without Fighting Physics]] · [[Center of Mass, Anti-Flip and Self-Righting]] · [[Drift and Handling Tuning - Community Tips for Constraint Cars]] |
| Entering / seats | [[Seat Entry with ProximityPrompt - No More Accidental Sits]] · [[Vehicle Enter - Exit, Seats and Camera]] · [[Ride - Multi-Seat Vehicles - Passenger, Gunner and Commander Roles]] |
| Spawner / garage | [[Vehicle Spawner and Garage System - Server Flow]] · [[Vehicle Customisation - Paint, Parts and Saved Loadouts]] |
| Ownership / exploits | [[Vehicle Network Ownership Recipes - Drivers, Passengers and Exit Jolts]] · [[Vehicle Anti-Exploit - Server Sanity Checks for Client-Owned Cars]] · [[Vehicle jitters - wrong player controls physics]] |
| Mobile driving | [[Mobile Vehicle Controls - Community Findings]] · [[Vehicle Input Actions - Keyboard, Gamepad Triggers and Touch Pedals]] |
| Police / wanted | [[Racing - Police Chases and Wanted Levels]] · [[Ride - Roleplay Traffic Laws - Speed Zones, Parking Spots, Tickets and Impound]] · [[First Team Game - Teams and SpawnLocations]] |
| Car theft | [[Ride - Vehicle Locks, Keys and Theft - Lockpicks, Hotwiring and Server Checks]] |
| City layout | [[World - City Blocks and Road Grids]] · [[Map - Roleplay Town Layout - Civic Core, Job Buildings, Homes and Road Loops]] · [[Roads, Paths and Rivers on Terrain - Carving Along a Curve]] |
| Streaming | [[Vehicles and StreamingEnabled - Atomic Cars and Streaming Ahead]] · [[Large World Streaming Architecture]] · [[Zone Visibility Culling for Indoor and City Maps]] |
| NPC traffic (later) | [[Traffic, NPC Vehicles and Road Graphs]] · [[NPC Traffic - Community Approaches and the City People Cars Demo]] |
| Jobs / interactions | [[World Interaction System Blueprint]] · [[First Interaction with ProximityPrompt]] · [[Recipe - Keycard Door with ProximityPrompt]] |
| Map UI | [[Map - Minimap and World Map UI - Projection, Rotation, Clipping and Fog of War]] · [[Map - Objective Markers and Off-Screen Arrows - BillboardGui, Edge Clamping and Distance]] · [[Speedometer and Vehicle HUD - Studs to km-h and mph]] |
| Car feel | [[Engine and Tyre Audio Driven by RPM and Slip]] · [[Vehicle Lights - Headlights, Brake Lights and Indicators]] · [[Vehicle Dust, Mud and Tire Trail VFX]] · [[Racing - Chase Camera and Speed Effects - FOV, Shake and Speed Lines]] |
| Night city look | [[FX - Neon City at Night - Signs, Light Pools and Fake Wet Reflections]] · [[Lighting Presets by Genre - LightingStyle, Atmosphere and Post]] |
| Physics budget | [[Physics Budget for Vehicle Games - Assemblies, Sleep, Timestepping and Collisions]] · [[Collision Groups for Vehicles - Wheels, Riders and Traffic]] |
| QA | [[Vehicle QA Test Pass - Before Shipping a Car]] |
| Ready chassis (check license) | [[A-Chassis - Community Car Chassis Kit]] · [[Server-Authoritive-Vehicle - MIT Server Authority Car Kit]] |

## Assets from the vault

| Need | Use | Notes |
|---|---|---|
| Cars | [[Kenney - Car Kit]] | Sedan, sports, SUV, taxi, police, ambulance, firetruck, delivery, garbage truck + debris parts |
| Roads | [[Kenney - City Kit (Roads)]] | 95 road pieces: straights, junctions, ramps |
| Downtown | [[Kenney - City Kit (Commercial)]] · [[Kenney - Modular Buildings]] | Shops, offices, bank |
| Industrial edge | [[Kenney - City Kit (Industrial)]] | Warehouses, hideouts |
| Suburbs | [[Kenney - City Kit (Suburban)]] | Houses for later updates |
| Retro/stylised option | [[Kenney - Retro Urban Kit]] · [[More Free Sources - KayKit]] (City Builder Bits) | Pick one style family |
| Street props, interiors | [[Poly Haven Roblox-Ready - Catalog]] (Props, Furniture, Lighting) · [[Kenney - Mini Market]] · [[Kenney - Furniture Kit]] | Store interiors to rob |
| Barriers, cones | [[More Free Sources - OpenGameArt CC0]] (Concrete Barriers, Trash Bins and Bags) | Police roadblocks |
| Pedestrian NPC walks | [[100STYLE Mocap - Catalog]] | `OnPhoneLeft`, `HandsInPockets`, `Rushed`, `Old` for varied crowds; credit required |
| VFX | [[Top G Originals - VFX Mesh Pack]] | `VFX_Cone_Burst` muzzle/explosion, `VFX_Shockwave_Ring_Wide` crash dust |

![[20 FBX Asset Library/Kenney/City Kit (Commercial)/Preview.png|300]] ![[20 FBX Asset Library/Kenney/Car Kit/Preview.png|300]]

## Monetization that fits

| Item | Type | Notes |
|---|---|---|
| Premium cars | Pass or dev product | Cosmetic + small speed tier; keep starter cars viable |
| 2x cash | Pass | Classic |
| Garage slots | Pass | Quality of life |
| Car paint, rims, neon | Dev product | Cosmetic |
| Cash packs | Dev product | [[Currency Pack Ladders - Bonus Percentages and Anchoring]] |
| VIP / private servers | Pass / built-in | Roleplay groups like private servers |

## Don't copy
- Do not use "GTA", "Grand Theft Auto", Rockstar names, "Los Santos"/"Vice City" or recreations of their maps, logos, loading art or radio stations.
- No real car brand names or logos; Kenney cars are generic, keep your names generic ("Coupe", "Cruiser").
- Do not copy Jailbreak's or another city game's map, UI or branding.
- Crime and weapons need honest maturity answers; avoid realistic gore and drug references for a broad audience ([[Maturity Questionnaire Walkthrough - Common Genre Answers]] · [[Policy - Age-Restricted Content - 16+ and 18+ Rules]]).
- Notes: [[Policy - Using Brands, the Roblox Name and Licensed IP]] · [[Reference IP, Originality and Asset Rights]].

## Top 5 time-wasters
1. **A whole city before one good car.** If driving is not fun, nothing else matters.
2. **Realistic physics simulation.** Arcade handling feels better and is easier to secure ([[Arcade Handling and Drifting Without Fighting Physics]]).
3. **NPC traffic in v1.** Expensive on servers and full of edge cases; player traffic is enough at launch.
4. **No streaming plan.** A city without StreamingEnabled and atomic car models breaks on phones.
5. **Ten jobs.** Two jobs with a working wanted loop beat ten jobs with no tension.

## Related
[[Genre Recipes - Hub]] · [[Genre Recipe - Arena Shooter]] · [[Vehicles - Hub]] · [[Vehicles and Physics - Hub]] · [[Maps - Hub]] · [[Scope Cutter - What to Build First]]
