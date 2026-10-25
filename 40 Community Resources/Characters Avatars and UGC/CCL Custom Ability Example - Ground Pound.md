---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/ccl-ground-pound"
title: "CCL Custom Ability Example - Ground Pound"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", character-controller, ccl, luau]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/characters/character-controller-library
  - https://create.roblox.com/docs/characters/character-controller-library/custom-abilities
---
# CCL Custom Ability Example - Ground Pound

An original example ability for the Character Controller Library (beta), built only from the fields documented on the Creator Hub. The official guide's example is a dash; this one shows an **airborne** ability with a landing window and cooldown. Read [[Humanoid vs Character Controller Library - Choosing a Movement Stack]] first.

## Behavior

- Press **Q** (action slot 6) while in the air.
- The character is slammed downward.
- A short `Pounding` window keeps the ability active; afterwards a cooldown label blocks re-use.
- Other abilities can react to the `Pounding` label (for example, a shockwave on landing).

## ModuleScript: ReplicatedStorage/CustomAbilities/GroundPound

```lua
local AvatarAbilities = require("@rbx/AvatarAbilities")

local Identifiers = AvatarAbilities.Identifiers
local Rule = AvatarAbilities.Rule
local Sensor = Identifiers.Sensor
local All, Not = Rule.All, Rule.Not

local GroundPound: AvatarAbilities.AbilityDefinition = {
	Name = "GroundPound",
	Labels = { "Pounding" },
	-- Only in the air, and not during cooldown.
	StartsWhen = All( Not(Sensor.Ground), Not("PoundCooldown") ),
	RunsWhile = "PoundWindow",
	Input = {
		InputName = "GroundPound",
		Mode = "Press",
		ActionSlot = 6, -- Q / ButtonY / touch slot 6
	},
	TimedLabels = {
		OnStart = { PoundWindow = 0.35 },
		OnStop = { PoundCooldown = 1.5 },
	},
}

function GroundPound.OnStart(managerCtx: AvatarAbilities.ManagerContext, abilityCtx: AvatarAbilities.AbilityContext)
	local root = managerCtx.AbilityOwner.PrimaryPart
	if root then
		-- Cancel upward speed, then push down. Deterministic: no randomness, no yields.
		local velocity = root.AssemblyLinearVelocity
		root.AssemblyLinearVelocity = Vector3.new(velocity.X * 0.2, 0, velocity.Z * 0.2)
		root:ApplyImpulse(Vector3.new(0, -120, 0) * root.AssemblyMass)
	end
end

return GroundPound
```

## Register it on the server

Use the documented registration pattern: a Script in ServerScriptService that waits for each character's `AbilityManagerActor`, then calls `AvatarAbilities.addAbilityForCharacter(character, ReplicatedStorage.CustomAbilities.GroundPound)` for every player character (the official *Custom abilities* page shows the full loop). Pass the module itself, do not `require` it.

## Rules this example follows

- **No yields in callbacks.** No `task.wait`, no `WaitForChild`.
- **Deterministic.** The same input gives the same impulse on client prediction and server simulation.
- **Input stays in `Input`.** `RunsWhile` only holds world conditions; putting the input there throws an error.
- **Labels for coordination.** A separate landing ability could use `StartsWhen = All( Sensor.Ground, "Pounding" )` to trigger an effect the frame you land inside the window.

## Tuning ideas

- Raise the impulse for heavier, faster slams.
- To stop jumps during the window, add `Blocks = { Ability.Jumping }` (with `local Ability = Identifiers.Ability` at the top), the same way the official docs block running.
- Put tunables in `Config` so designers can change them without editing callbacks.

## Credits

- Field names, callback signature and registration flow from Roblox Creator Docs *Character Controller Library* and *Custom abilities* (CC BY 4.0, code samples MIT). The Ground Pound ability itself is original; the CCL is in beta, so re-check field names against the current docs.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Humanoid vs Character Controller Library - Choosing a Movement Stack]] · [[Custom abilities]] · [[CCL quick start]] · [[Character Controller Library - Community First Impressions]]

<!-- TDOD_GRAPH_END -->
