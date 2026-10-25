---
title: "Custom abilities"
description: "Custom abilities in the Character Controller Library (CCL) evaluate what a character can do, as well as enable flexible behavior composition such as a character being able to move while also aiming and crouching."
area: "30 Official Roblox Docs"
cluster: "Characters"
source: "https://create.roblox.com/docs/characters/character-controller-library/custom-abilities"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Custom abilities in the Character Controller Library (CCL) evaluate what a character can do, as well as enable flexible behavior composition such as a character being able to move while also aiming and crouching.*

This guide outlines how to add a custom **dash** ability for all player characters, where activating the ability speeds the character forward in the direction it's facing, followed by a short cooldown before players can dash again.

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

## Ability module

The first step in authoring a custom ability is to create an `AbilityDefinition` inside a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] that can be shared between the server and client.

1.  Create a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] inside [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]/`CustomAbilities` (a [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]]).
2.  Rename it to `Dash` as a unique identity.

    *(image in the full Top G Vault)*

3.  Paste the following supporting code into the new `Dash` script:

        ```lua
        local AvatarAbilities = require("@rbx/AvatarAbilities")

        local Identifiers = AvatarAbilities.Identifiers
        local Rule = AvatarAbilities.Rule
        local Sensor = Identifiers.Sensor
        local All, Any, Not = Rule.All, Rule.Any, Rule.Not
        ```

## Ability definition

The core behavior of any ability is defined through its `AbilityDefinition` (line `8`+), a Luau table that defines its identity, conditions, behavior, and lifecycle.

```lua title="ModuleScript (Dash)"
local AvatarAbilities = require("@rbx/AvatarAbilities")

local Identifiers = AvatarAbilities.Identifiers
local Rule = AvatarAbilities.Rule
local Sensor = Identifiers.Sensor
local All, Any, Not = Rule.All, Rule.Any, Rule.Not

local Dash: AvatarAbilities.AbilityDefinition = {
	Name = "Dash",
	Labels = { "Dashing" },
	StartsWhen = All( Sensor.Ground, Not("DashCooldown") ),
	RunsWhile = "DashWindow",
	Input = {
		InputName = "Dash",
		Mode = "Press",
		ActionSlot = 5
	},
	TimedLabels = {
		OnStart = { DashWindow = 0.2 }, -- Seconds the dash stays "active"
		OnStop = { DashCooldown = 1.0 }, -- Seconds until characters can dash again
	},
}

function Dash.OnStart(managerCtx: AvatarAbilities.ManagerContext, abilityCtx: AvatarAbilities.AbilityContext)
	local rootPart = managerCtx.AbilityOwner.PrimaryPart
	if rootPart then
		rootPart:ApplyImpulse(managerCtx.RootLookVector * 80 * rootPart.AssemblyMass)
	end
end

return Dash
```

The following table outlines every parameter in the dash ability's `AbilityDefinition` table:

| Field | Description |
| --- | --- |
| `Name` | The ability's unique identity; other abilities can reference it in conditions and conflicts. Registering two abilities with the same `Name` throws an error. For a few similar abilities, give each a different `Name` and share a common [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Labels\|label]] in `Labels`. The [[30 Official Roblox Docs/API Reference/Classes/ModuleScript\|ModuleScript]] name, not this field, determines the unique [[30 Official Roblox Docs/API Reference/Classes/Configuration\|Configuration]] key under the character. |
| `Labels` | A [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Labels\|label]] is a named bit in a shared world mask which acts as the coordination bus between abilities. Essentially, an active ability broadcasts its `Labels` to the world mask, while ability [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Conditions\|conditions]] (`StartsWhen` or `RunsWhile`) test the world mask and react. Abilities never call each other; they merely broadcast labels and react to labels. |
| `StartsWhen` | One or more [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Conditions\|conditions]] which are checked every frame while the ability is **inactive**; when they're all `true`, the ability can start. The notation `All()` means that **all** of the nested conditions must be `true`, specifically:<br><br>• `Sensor.Ground` — The character is standing on the ground (no air-dashing).<br>- `Not("DashCooldown")` — The `DashCooldown` label is absent (`Not()` takes exactly one label, not a group). |
| `RunsWhile` | One or more [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Conditions\|conditions]] which are checked every frame while the ability is **active**; the moment they stop being `true`, the ability stops. The sole condition `RunsWhile = "DashWindow"` means the ability keeps running while the `DashWindow` label exists. `RunsWhile` holds world conditions only and input never enters it, so this field exists purely to time out the dash window on its own. See [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Inputs\|inputs]] for how `Input.Mode` (not `RunsWhile`) controls when a `Hold` or `Toggle` ability stops from its input. |
| `Input` | The [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Inputs\|input]] which triggers the ability. The CCL always adds it to `StartsWhen`.<br><br>• `InputName = "Dash"` specifies the input the ability listens to.<br>- `Mode = "Press"` tells the ability to activate when the input is pressed.<br>- `ActionSlot` defines the input's [[30 Official Roblox Docs/Characters/Character Controller Library/Custom abilities#Input definition\|action slot]]. |
| `TimedLabels` | Timed labels appear for a fixed number of seconds and expire on their own, independent of whether the ability is still running. `OnStart`/`OnStop` broadcast their [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Labels\|labels]] when the ability starts/stops, respectively. When the associated duration ends, the label(s) expire. |

Collectively, `StartsWhen`, `RunsWhile`, and `TimedLabels` form the dash ability's entire loop:

1. `StartsWhen = All( Sensor.Ground, Not("DashCooldown") )` — Assuming the character is on the ground and not in a dash cooldown period, `TimedLabels.OnStart` broadcasts the `DashWindow` label for `0.2` seconds.
2. `RunsWhile = "DashWindow"` keeps the dash running.
3. After `0.2` seconds, the `DashWindow` label expires, so

`RunsWhile = "DashWindow"`

 becomes `false` and the ability stops (no need to include an `OnStop` [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Callbacks|callback]] function).
4. `TimedLabels.OnStop` broadcasts the `DashCooldown` label for `1.0` seconds, and because `StartsWhen` contains a `Not("DashCooldown")` condition, players cannot dash again during this cooldown.
5. Once the `DashCooldown` label expires, everything resets automatically and players can attempt another dash.

Following the `AbilityDefinition` table, the `OnStart` [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Callbacks|callback]] function runs **once** at the moment the ability activates. This is where the actual dash happens. The function's first parameter, `managerCtx`, is a `ManagerContext` object with multiple properties, including:

- `managerCtx.AbilityOwner` — The character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]], such that `managerCtx.AbilityOwner.PrimaryPart` is the root part.
- `managerCtx.RootLookVector` — The direction the character is facing.

Dash only needs this one callback, as the impulse is applied in a single instant and the timed labels handle the rest. See [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Callbacks|callbacks]] for info on `OnUpdate`, `OnStop`, `OnSetup`, and `OnTeardown`.

## Ability registration

Registration of custom abilities for each player character must occur on the server:

1. Place a new [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] inside [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]].
2. Rename it to `RegisterCustomAbilities` (this script can be used to register multiple abilities in a loop).
3. Paste the following code into the script. Note that abilities are added per-character by passing the [[30 Official Roblox Docs/Characters/Character Controller Library/Custom abilities#Ability module|ability module]] as the second parameter of `addAbilityForCharacter()`, not by calling [[30 Official Roblox Docs/API Reference/Globals/Luau globals#require|require()]] on the module.

```lua title="Script in ServerScriptService"
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AvatarAbilities = require("@rbx/AvatarAbilities")

local CUSTOM_ABILITIES = {
	ReplicatedStorage.CustomAbilities.Dash,
	-- ...
}

local function onCharacterAdded(character: Model)
	local actor = character:WaitForChild("AbilityManagerActor", 10)
	if not actor then return end
	while not actor:IsDescendantOf(game) do actor.AncestryChanged:Wait() end

	for _, abilityModule in CUSTOM_ABILITIES do
		AvatarAbilities.addAbilityForCharacter(character, abilityModule)
	end
end

local function onPlayerAdded(player: Player)
	player.CharacterAdded:Connect(onCharacterAdded)
	if player.Character then task.spawn(onCharacterAdded, player.Character) end
end
Players.PlayerAdded:Connect(onPlayerAdded)
for _, player in Players:GetPlayers() do
	onPlayerAdded(player)
end
```

Although registration occurs on the server, ability callbacks run in both the predicted client simulation and the authoritative server simulation. Keep callback behavior deterministic so both simulations produce the same result.

## Input definition

As noted in [[30 Official Roblox Docs/Characters/Character Controller Library/Custom abilities#Ability definition|ability definition]], the `Input` definition specifies how the ability is activated. Its `ActionSlot` field defines an **action slot** which is associated with a list of [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputActions]] and [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBindings]].

The CCL always `AND`s the generated input trigger into `StartsWhen`, and `Input.Mode` (not `RunsWhile`) controls how a `Hold` or `Toggle` ability starts and stops from that input. `RunsWhile` holds world conditions only; putting the input itself into `RunsWhile` throws an error. To make a `Hold` or `Toggle` ability outlast its input under a world condition, use `Input.OutlivesInputWhile` instead. For details and an example, see [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Inputs|inputs]].

Several action slot input bindings are predefined by Roblox and, in the future, the [[30 Official Roblox Docs/Input/Input Action System#Input Action Manager|Input Action Manager]] will allow you to reconfigure default input bindings for action slots as desired. Setting `ActionSlot` to `0` will choose the next available empty slot. On mobile devices, slots `1`-`7` populate to buttons on the screen (see diagram below).

| Slot | Keyboard & Mouse | Gamepad | Touch | Default Assignment |
| --- | --- | --- | --- | --- |
| `1` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Space]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonA]] | ① | Jump |
| `2` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|LeftShift]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonL1]] | ② | Sprint |
| `3` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|LeftControl]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonB]] | ③ | Crouch |
| `4` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|R]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonX]] | ④ |  |
| `5` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|MouseLeftButton]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonR2]] | ⑤ |  |
| `6` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Q]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonY]] | ⑥ |  |
| `7` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|X]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonR1]] | ⑦ |  |
| `8` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|C]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|ButtonL2]] |  |  |
| `9` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|F]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|DPadLeft]] |  |  |
| `10` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|G]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|DPadRight]] |  |  |
| `11` | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|V]] | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|DPadDown]] |  |  |

*(image in the full Top G Vault)*

---
*Source: [Custom abilities](https://create.roblox.com/docs/characters/character-controller-library/custom-abilities) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
