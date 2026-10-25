---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/humanoid-vs-ccl"
title: "Humanoid vs Character Controller Library - Choosing a Movement Stack"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", character-controller, ccl, movement]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/characters/character-controller-library
  - https://create.roblox.com/docs/characters/character-controller-library/custom-abilities
  - https://create.roblox.com/docs/studio/avatar-settings
  - https://create.roblox.com/docs/reference/engine/classes/ControllerManager
---
# Humanoid vs Character Controller Library - Choosing a Movement Stack

In 2026 a Roblox character can move three ways. Community reactions to the CCL release are already in [[Character Controller Library - Community First Impressions]]; this note compares the architectures so you can pick one.

## The three stacks

| Stack | What it is | Best for |
| --- | --- | --- |
| **Legacy Humanoid** | Fixed state machine (`HumanoidStateType`: Running, Jumping, Freefall, Climbing, Swimming, Seated...) | Existing games, R6 games, anything tuned for years |
| **Character Controller Library (CCL)** | Opt-in (beta) Luau framework, package `@rbx/AvatarAbilities`. Behaviors are **abilities** that start and stop on conditions | New R15 games with custom movement (dash, slide, wall-run, stagger) |
| **Raw ControllerManager** | Lower-level physics controllers (`ControllerManager` with ground, air, climb and swim controllers and sensors) | Fully custom controllers; the CCL uses it under the hood |

## How the CCL thinks

- An ability is a Luau table: `Name`, `Labels`, `StartsWhen`, `RunsWhile`, conflict keys (`Blocks`, `Stops`, `Suspends`, `ExclusiveGroup` with `Priority`), `Input`, `Config`, `State`, and callbacks `OnSetup`, `OnStart`, `OnUpdate`, `OnStop`, `OnTeardown`.
- **Labels** are bits in a shared 64-bit world mask. Active abilities broadcast labels; other abilities test them. Abilities never call each other directly.
- **Timed labels** (`OnStart = { Dashing = 1 }`, `OnStop = { DashCooldown = 2 }`, `Consumes`) give windows and cooldowns without timers.
- Conditions use `All()`, `Any()` and `Not()` over labels and **sensors** (Ground, Water, WaterSurface, Climb, Ceiling, Sit, Tipped, MoveInput, IsMoving and others). They compile to bitmask math.
- **Inputs** bind to numbered action slots (slot 1 Space or ButtonA is Jump, 2 LeftShift is Sprint, 3 LeftControl is Crouch; 4 to 11 are free by default).
- Callbacks run in **both** the predicted client simulation and the authoritative server simulation, so they must be deterministic and must **never yield**.
- Custom abilities are registered per character on the server with `AvatarAbilities.addAbilityForCharacter(character, module)`.

## Enabling

1. File, Beta Features, **AvatarAbilities Character Controller Library**.
2. Avatar Settings, Movement, Abilities: **Character Controller Library**.
3. Default abilities (Running, Jumping, Climbing...) can be toggled. Keep Running on, and keep Getting Up on whenever Falling Down is on, or characters can trip and never stand.

## Decision guide

- **Shipping soon, R6, or heavily tuned Humanoid movement**: stay on Legacy Humanoid.
- **New R15 action game with many movement verbs**: prototype in CCL; its label system replaces piles of state flags.
- **Using Server Authority**: CCL abilities are built for prediction and rollback (`abilityCtx.State` is restored during resimulation); see [[Server Authority 2026 - What the Community Learned]].
- **Vehicles, creatures, non-humanoid rigs**: raw ControllerManager or your own physics.

## Migration traps

- Code that reads `Humanoid:GetState()` or listens to `StateChanged` will not describe CCL behavior; read labels and abilities instead.
- Shift-lock is turned off in CCL places (community report); build your own camera lock.
- Animation scripts keyed to Humanoid states need rewiring.

Worked custom ability: [[CCL Custom Ability Example - Ground Pound]].

## Credits

- Roblox Creator Docs: *Character Controller Library*, *Custom abilities*, *Avatar Settings*, ControllerManager reference (CC BY 4.0). Summarized in our own words.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Character Controller Library - Community First Impressions]] · [[Character Controller Library]] · [[Custom abilities]] · [[Character Controllers]] · [[Avatar Settings vs Scripts - Who Controls the Player Avatar]]

<!-- TDOD_GRAPH_END -->
