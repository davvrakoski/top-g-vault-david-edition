---
title: "CCL quick start"
description: "Traditional character abilities (run, climb, jump, swim, etc.) are easily configurable through scripting."
area: "30 Official Roblox Docs"
cluster: "Characters"
source: "https://create.roblox.com/docs/characters/character-controller-library/quick-start"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Traditional character abilities (run, climb, jump, swim, etc.) are easily configurable through scripting.*

In the [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library|Character Controller Library]] (CCL), traditional character abilities (run, climb, jump, swim, etc.) are easily configurable through scripting. For custom character mechanics such as dashing, aiming, wall‑jumping, and more, see [[30 Official Roblox Docs/Characters/Character Controller Library/Custom abilities|custom abilities]].

## Enable CCL

The CCL is **opt-in** through Studio's [[30 Official Roblox Docs/Studio/Avatar Settings|Avatar Settings]] window. To enable it:

1. Enable the CCL beta through **File** ⟩ **Beta Features** ⟩ **AvatarAbilities Character Controller Library**.
1. From the **Avatar** tab, open [[30 Official Roblox Docs/Studio/Avatar Settings|Avatar Settings]].

   *(image in the full Top G Vault)*

1. Select the **Movement** tab on the left side of the window and, in the **Abilities** section, select **Character Controller Library**.

   *(image in the full Top G Vault)*

1. All of the standard abilities like **Running**, **Jumping**, and **Climbing** are enabled by default. To disable any of them at runtime, uncheck the associated box.

   > [!warning]
   > It's not recommended to disable **Running**, as doing so will prevent characters from moving along the ground. Additionally, you should always keep **Getting Up** enabled if **Falling Down** is enabled, as a mismatch will allow characters to fall down (trip) but never get back up.

## Configuration

Through a script that runs from [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]], you can experiment with the built‑in ability [[30 Official Roblox Docs/Characters/Character Controller Library/CCL quick start#Attributes|attributes]]. You can also modify specific [[30 Official Roblox Docs/Characters/Character Controller Library/CCL quick start#Controllers|controllers]] to adjust the physical simulation of the character and its interaction with the environment, such as the character's base movement speed.

### Attributes

At runtime, CCL exposes each built-in ability as a [[30 Official Roblox Docs/API Reference/Classes/Configuration|Configuration]] in the character's `Abilities` folder. This folder usually lives under `AbilityManagerActor`, but it can live directly under the character in setups without an actor. Use `AvatarAbilities.getAbilityConfigurationForCharacter()` to access an ability configuration from either setup.

Each ability contains easy-to-configure [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attributes]] such as those noted in the table below. Some attributes correspond to legacy [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] properties. This relationship identifies equivalent settings, not bidirectional synchronization. The compatibility layer copies changes from these [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] properties to the corresponding ability attributes. Jumping attributes initially use the corresponding [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] character properties.

*(image in the full Top G Vault)*

> [!warning]
> The abilities in a character's `Abilities` folder may vary, depending on which abilities you [[30 Official Roblox Docs/Characters/Character Controller Library/CCL quick start#Enable CCL|enabled/disabled]]. Confirm available abilities and their valid attributes before you attempt to configure them via scripting.

| Ability | Attributes |
| --- | --- |
| `Climbing` | • `SpeedMultiplier` — Multiplier to the [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor\|ClimbController.MoveSpeedFactor]] property when character is climbing. |
| `Crouching` | • `SpeedMultiplier` — Multiplier to the [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor\|GroundController.MoveSpeedFactor]] property when character is crouching. |
| `Dead` | • `BreakJointsOnDeath` — Corresponds to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#BreakJointsOnDeath\|Humanoid.BreakJointsOnDeath]].<br>- `Health` — Corresponds to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health\|Humanoid.Health]].<br>- `MaxHealth` — Corresponds to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxHealth\|Humanoid.MaxHealth]].<br>- `RequiresNeck` — Corresponds to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#RequiresNeck\|Humanoid.RequiresNeck]]. |
| `FallingDown` |  |
| `Freefall` | • `SpeedMultiplier` — Multiplier to the [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor\|AirController.MoveSpeedFactor]] property when character is free‑falling. Note that the effect may be subtle when the character free‑falls for a very short duration. |
| `GettingUp` |  |
| `Jumping` | • `JumpHeight` — Corresponds to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpHeight\|Humanoid.JumpHeight]] and initializes from [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterJumpHeight\|StarterPlayer.CharacterJumpHeight]].<br>- `JumpPower` — Corresponds to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#JumpPower\|Humanoid.JumpPower]] and initializes from [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterJumpPower\|StarterPlayer.CharacterJumpPower]].<br>- `UseJumpPower` — Corresponds to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#UseJumpPower\|Humanoid.UseJumpPower]] and initializes from [[30 Official Roblox Docs/API Reference/Classes/StarterPlayer#CharacterUseJumpPower\|StarterPlayer.CharacterUseJumpPower]]. |
| `NoLocomotion` |  |
| `Running` | • `SpeedMultiplier` — Multiplier to the [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor\|GroundController.MoveSpeedFactor]] property when character is running. |
| `Sitting` |  |
| `Slipping` | • `MaxSlopeAngle` — Corresponds to [[30 Official Roblox Docs/API Reference/Classes/Humanoid#MaxSlopeAngle\|Humanoid.MaxSlopeAngle]]. |
| `Sprinting` | • `SpeedMultiplier` — Multiplier to the [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor\|GroundController.MoveSpeedFactor]] and [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor\|AirController.MoveSpeedFactor]] properties when character is sprinting. |
| `Swimming` | • `EnableFastRise` — Rise to surface more quickly by holding the jump input.<br>- `SpeedMultiplier` — Multiplier to the [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor\|SwimController.MoveSpeedFactor]] property when character is swimming. |
| `Turning` | • `UseLookDirectionInput` — Uses look-direction input instead of movement input to determine the character's facing direction. |

To set ability configurations for all characters through a script:

1.  Create a new server-side [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] within [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] and rename it to `AbilitiesScript`.
2.  Copy and paste the following code into the new script. This example multiplies the base movement speed for the `Running` ability by `2`. Feel free to adjust other ability attributes such as those described in the table above.

		```lua title="Script in ServerScriptService"
		local Players = game:GetService("Players")
		local AvatarAbilities = require("@rbx/AvatarAbilities")

		local function waitForAbilityConfiguration(character, abilityName, timeout)
			local deadline = time() + timeout
			while character.Parent and time() < deadline do
				local ability = AvatarAbilities.getAbilityConfigurationForCharacter(character, abilityName)
				if ability then
					return ability
				end
				task.wait()
			end
			return nil
		end

		local function onCharacterAdded(character)
			local running = waitForAbilityConfiguration(character, "Running", 10)
			if running then
				-- Double base movement speed
				running:SetAttribute("SpeedMultiplier", 2)
			end
		end

		local function onPlayerAdded(player)
			if player.Character then
				onCharacterAdded(player.Character)
			end
			player.CharacterAdded:Connect(onCharacterAdded)
		end

		Players.PlayerAdded:Connect(onPlayerAdded)
		for _, player in Players:GetPlayers() do
			onPlayerAdded(player)
		end
		```

### Controllers

In the CCL, a core [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] instance within the character model, alongside child controllers such as a [[30 Official Roblox Docs/API Reference/Classes/GroundController|GroundController]], handle the physical simulation of the character and its interaction with the environment. Abilities then interact with the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] and its descendants to modify controller behaviors or switch between controllers.

*(image in the full Top G Vault)*

Properties for the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] and its controller descendants are summarized in the tables below, although these tables are not exhaustive; please consult the API [[30 Official Roblox Docs/API Reference/Classes/_Index - Classes|classes documentation]] for additional property options.

#### ControllerManager

| Property | Description |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseMoveSpeed\|BaseMoveSpeed]] | The **base** linear movement speed used by all controllers. Controllers individually customize movement speed through their `MoveSpeedFactor` property. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseTurnSpeed\|BaseTurnSpeed]] | The **base** angular turning speed used by all controllers to align the character to face the desired direction. Some controllers individually customize turn speed through their `TurnSpeedFactor` property. |
| [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#UpDirection\|UpDirection]] | [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] which indicates the upward-facing vector for the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#RootPart\|ControllerManager.RootPart]]. |

#### Individual Controllers

| Controller | Properties |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/GroundController\|GroundController]] | • [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor\|MoveSpeedFactor]] — Multiplier factor for the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseMoveSpeed\|ControllerManager.BaseMoveSpeed]] property while character is on the ground.<br>- [[30 Official Roblox Docs/API Reference/Classes/GroundController#AccelerationTime\|AccelerationTime]] and [[30 Official Roblox Docs/API Reference/Classes/GroundController#DecelerationTime\|DecelerationTime]] — Time in seconds for character to accelerate to full speed and decelerate to full stop, respectively.<br>- [[30 Official Roblox Docs/API Reference/Classes/GroundController#TurnSpeedFactor\|TurnSpeedFactor]] — Multiplier factor for the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseTurnSpeed\|ControllerManager.BaseTurnSpeed]] property (max angular velocity of a turn while character is on the ground). |
| [[30 Official Roblox Docs/API Reference/Classes/AirController\|AirController]] | • [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor\|MoveSpeedFactor]] — Multiplier factor for the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseMoveSpeed\|ControllerManager.BaseMoveSpeed]] property while character is in the air.<br>- [[30 Official Roblox Docs/API Reference/Classes/AirController#MoveMaxForce\|MoveMaxForce]] and [[30 Official Roblox Docs/API Reference/Classes/AirController#TurnMaxTorque\|TurnMaxTorque]] — How quickly the character can accelerate and change direction in the air.<br>- [[30 Official Roblox Docs/API Reference/Classes/AirController#TurnSpeedFactor\|TurnSpeedFactor]] — Multiplier factor for the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseTurnSpeed\|ControllerManager.BaseTurnSpeed]] property (max angular velocity of a turn while character is in the air). |
| [[30 Official Roblox Docs/API Reference/Classes/ClimbController\|ClimbController]] | • [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor\|MoveSpeedFactor]] — Multiplier factor for the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseMoveSpeed\|ControllerManager.BaseMoveSpeed]] property while character is climbing. |
| [[30 Official Roblox Docs/API Reference/Classes/SwimController\|SwimController]] | • [[30 Official Roblox Docs/API Reference/Classes/ControllerBase#MoveSpeedFactor\|MoveSpeedFactor]] — Multiplier factor for the [[30 Official Roblox Docs/API Reference/Classes/ControllerManager#BaseMoveSpeed\|ControllerManager.BaseMoveSpeed]] property while character is swimming.<br>- [[30 Official Roblox Docs/API Reference/Classes/SwimController#PitchMaxTorque\|PitchMaxTorque]] — The maximum torque used to rotate on the local **X** axis to the desired pitch orientation.<br>- [[30 Official Roblox Docs/API Reference/Classes/SwimController#RollMaxTorque\|RollMaxTorque]] — The maximum torque applied to rotate on the local **Z** axis to the desired roll orientation. |

To set controller configurations for all characters through a script:

1.  Create a new server-side [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] within [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] and rename it to `ControllerScript`.
2.  Copy and paste the following code into the new script. This example increases ground‑based moving/turning speed as well adds a slight acceleration and deceleration time. Feel free to adjust other properties such as those described in the tables above or for each class as documented ([[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]]; [[30 Official Roblox Docs/API Reference/Classes/GroundController|GroundController]]; [[30 Official Roblox Docs/API Reference/Classes/AirController|AirController]]; [[30 Official Roblox Docs/API Reference/Classes/ClimbController|ClimbController]]; [[30 Official Roblox Docs/API Reference/Classes/SwimController|SwimController]]).

```lua title="Script in ServerScriptService"
local Players = game:GetService("Players")
local AvatarAbilities = require("@rbx/AvatarAbilities")

local function waitForAbilityConfiguration(character, abilityName, timeout)
	local deadline = time() + timeout
	while character.Parent and time() < deadline do
		local ability = AvatarAbilities.getAbilityConfigurationForCharacter(character, abilityName)
		if ability then
			return ability
		end
		task.wait()
	end
	return nil
end

local function waitForChildOfClass(parent, className, timeout)
	local deadline = time() + timeout
	local child = parent:FindFirstChildOfClass(className)
	while not child and parent.Parent and time() < deadline do
		task.wait()
		child = parent:FindFirstChildOfClass(className)
	end
	return child
end

local function onCharacterAdded(character)
	-- Running provisions the ground controller when it registers
	if not waitForAbilityConfiguration(character, "Running", 10) then
		return
	end

	local controllerManager = waitForChildOfClass(character, "ControllerManager", 10)
	if controllerManager then
		local groundController = waitForChildOfClass(controllerManager, "GroundController", 10)
		if groundController then
			-- Double the move and turn speeds
			groundController.MoveSpeedFactor *= 2
			groundController.TurnSpeedFactor *= 2
			-- Add slight acceleration and deceleration
			groundController.AccelerationTime = 0.2
			groundController.DecelerationTime = 0.4
		end
	end
end

local function onPlayerAdded(player)
	if player.Character then
		onCharacterAdded(player.Character)
	end
	player.CharacterAdded:Connect(onCharacterAdded)
end

Players.PlayerAdded:Connect(onPlayerAdded)
for _, player in Players:GetPlayers() do
	onPlayerAdded(player)
end
```

---
*Source: [CCL quick start](https://create.roblox.com/docs/characters/character-controller-library/quick-start) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
