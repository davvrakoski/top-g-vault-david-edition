---
area: "01 Start Here"
cluster: "Start Here"
title: "First Character Tweaks - WalkSpeed, JumpHeight, Health and Sprint"
tags: [roblox, community-knowledge, start-here, humanoid, character, movement]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/StarterPlayer
  - https://create.roblox.com/docs/reference/engine/classes/Players
  - https://create.roblox.com/docs/reference/engine/classes/ContextActionService
---
# First Character Tweaks - WalkSpeed, JumpHeight, Health and Sprint

Changing how the player moves is the quickest way to make a Roblox game feel like yours: faster runs for an obby, floaty jumps for a moon level, more health for a boss game, a sprint key for a horror game. All of it lives on the **Humanoid** inside each character, with game-wide defaults on **StarterPlayer**. This note covers the safe places to change each value and the respawn trap that catches every beginner.

## Game-wide defaults (no code): StarterPlayer

Select **StarterPlayer** in Explorer:

| Property | Sets the starting value of | Notes |
| --- | --- | --- |
| `CharacterWalkSpeed` | `Humanoid.WalkSpeed` | Studs per second; the engine's reference speed is 16 |
| `CharacterUseJumpPower` | Which jump property is used | Off = use JumpHeight (studs), On = JumpPower (force) |
| `CharacterJumpHeight` / `CharacterJumpPower` | `Humanoid.JumpHeight` / `JumpPower` | Only one is visible, depending on the toggle |
| `CharacterMaxSlopeAngle` | `Humanoid.MaxSlopeAngle` | Steepest walkable slope |
| `CameraMaxZoomDistance` / `CameraMode` | Camera limits / first-person lock | `LockFirstPerson` for horror |

These apply to characters spawned **after** the change, so set them in edit mode.

Other useful defaults on **Players**: `RespawnTime` (seconds before respawn), `CharacterAutoLoads` (turn off if you spawn players yourself, e.g. after a menu).

## Per-player changes: server Script

```lua
local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")
		humanoid.MaxHealth = 150
		humanoid.Health = 150
		if player:GetAttribute("VIP") then
			humanoid.WalkSpeed = 20
		end
	end)
end)
```

The **respawn trap:** every death creates a brand-new character with a brand-new Humanoid. Values set once on join vanish on the first respawn. Always apply them inside `CharacterAdded`.

## Sprint key: LocalScript in StarterCharacterScripts

```lua
local ContextActionService = game:GetService("ContextActionService")
local humanoid = script.Parent:WaitForChild("Humanoid")

local WALK, RUN = 16, 26

local function sprint(_, state)
	if state == Enum.UserInputState.Begin then
		humanoid.WalkSpeed = RUN
	elseif state == Enum.UserInputState.End then
		humanoid.WalkSpeed = WALK
	end
	return Enum.ContextActionResult.Pass
end

ContextActionService:BindAction("Sprint", sprint, true, Enum.KeyCode.LeftShift, Enum.KeyCode.ButtonL3)
```

- The `true` argument creates an on-screen touch button for phones.
- Scripts in **StarterCharacterScripts** are copied into each new character, so it rebinds after every respawn automatically.
- Movement speed set on the client still replicates, because the player owns their character's physics. That is also why exploiters can speed-hack; serious games check speed on the server ([[Server-Side Movement Validation and Anti-Exploit Checks]]).

## Health basics

| Want | Use |
| --- | --- |
| Damage that respects spawn ForceFields | `humanoid:TakeDamage(20)` |
| Instant kill | `humanoid.Health = 0` |
| Heal | `humanoid.Health = math.min(humanoid.Health + 25, humanoid.MaxHealth)` |
| React to death | `humanoid.Died:Connect(function() ... end)` |
| Turn off natural regeneration | Replace the default `Health` script by putting an empty Script named `Health` in StarterCharacterScripts (well-known community technique; not documented on the pages we checked, unverified) |

Do damage and healing in **server** Scripts so the numbers are real.

## Other handy Humanoid properties

`DisplayName` (name above head), `NameDisplayDistance` and `HealthDisplayDistance` (0 hides them), `AutoRotate` (character faces movement direction), `PlatformStand` (stops walking control, used for ragdoll-style falls), `UseJumpPower` (per character).

## Tuning tips

- Change one value at a time and test on a phone.
- Raising WalkSpeed a lot breaks obbies designed for default jumps; design stages after you pick final movement numbers.
- Big speed or jump boosts make the default camera and animations look odd; small changes (16 to 20) feel good.

## Related
[[00 START HERE - Top G Vault]] · [[Player and Character Lifecycle Without Race Conditions]] · [[Character Controllers]] · [[StarterCharacter Setup Checklist]] · [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid (official)]]
