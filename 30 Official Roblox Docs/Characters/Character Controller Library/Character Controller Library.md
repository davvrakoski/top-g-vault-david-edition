---
title: "Character Controller Library"
description: "The Character Controller Library (CCL) is a modular framework for building character movement and behaviors through attributes and Luau scripts."
area: "30 Official Roblox Docs"
cluster: "Characters"
source: "https://create.roblox.com/docs/characters/character-controller-library"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Character Controller Library (CCL) is a modular framework for building character movement and behaviors through attributes and Luau scripts.*

The **Character Controller Library** (CCL) is a modular framework for building character movement and behaviors through attributes and Luau scripts. This architecture replaces rigid [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] state machines with a flexible, extensible system for character mechanics.

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

## Abilities

Abilities evaluate what a character can do, such as the ability to run, jump, climb, and swim. Instead of relying on a fixed set of engine‑defined character states like those in [[30 Official Roblox Docs/API Reference/Enums/HumanoidStateType|Enum.HumanoidStateType]], CCL abilities dynamically determine what a character can do and how it should respond to player input.

Structurally, an ability is a self-contained Luau table that primarily specifies the following:

| Table Fields | Purpose |
| --- | --- |
| `Name` | The ability's unique identity; [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Conditions\|conditions]] and [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Conflicts\|conflicts]] reference it by name. Registering two abilities with the same `Name` throws an error. For a few similar abilities, give each a different `Name` and share a common [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Labels\|label]] in `Labels`. The [[30 Official Roblox Docs/API Reference/Classes/ModuleScript\|ModuleScript]] name determines the unique configuration key. |
| `Labels`, `TimedLabels` | Named bits in a shared 64-bit mask which acts as the coordination bus between abilities; see [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Labels\|labels]]. |
| `StartsWhen`, `RunsWhile` | Conditions which define when to start the ability and when to keep it running, respectively; see [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Conditions\|conditions]]. |
| `Blocks`, `Stops`, `Suspends`, `ExclusiveGroup` | How to handle [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Conflicts\|conflicts]] between abilities that can't be active at once. |
| `Input` | The input which triggers the ability. `Input.Mode` controls how the input starts and stops the ability; `RunsWhile` holds world conditions only, never the input itself; see [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Inputs\|inputs]]. |
| `Config`, `State` | Default configuration values and replicated state for each ability registration. Callbacks read configuration from `abilityCtx.Config` and read or write replicated state through `abilityCtx.State`. |
| `OnSetup`, `OnStart`, `OnStop`, `OnUpdate`, `OnTeardown` | Lifecycle callbacks where the ability's actual behavior is scripted; see [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Callbacks\|callbacks]]. |

### Labels

A **label** is a named bit in a shared 64-bit mask which acts as the coordination bus between abilities. Essentially:

- An active ability **broadcasts** its `Labels` and `TimedLabels` to the world mask.
- Ability [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Conditions|conditions]] (`StartsWhen`, `RunsWhile`) **test** the world mask and react.
- Ability [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Conflicts|conflicts]] define which **other** abilities are blocked, stopped, or suspended upon activation.

In the following setup, the `"CanFallDown"` label is broadcast to the world mask when `Running` is active. The `FallingDown` ability with its [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Conditions|condition]] of

`StartsWhen = All( "CanFallDown", "Stunned" )`

 automatically becomes a candidate, but `"Stunned"` must also be broadcast to the world mask before `FallingDown` occurs.

```lua title="Running Ability"
local AvatarAbilities = require("@rbx/AvatarAbilities")

local Identifiers = AvatarAbilities.Identifiers
local Ability = Identifiers.Ability
local Rule = AvatarAbilities.Rule
local Sensor = Identifiers.Sensor
local All, Any, Not = Rule.All, Rule.Any, Rule.Not

local Running: AvatarAbilities.AbilityDefinition = {
	Name = Ability.Running,
	Labels = { "CanFallDown" }, -- Labels broadcast when ability is active
	StartsWhen = Sensor.Ground,
	RunsWhile = Sensor.Ground,
}
```

```lua title="FallingDown Ability"
local AvatarAbilities = require("@rbx/AvatarAbilities")

local Identifiers = AvatarAbilities.Identifiers
local Ability = Identifiers.Ability
local Rule = AvatarAbilities.Rule
local Sensor = Identifiers.Sensor
local All, Any, Not = Rule.All, Rule.Any, Rule.Not

local FallingDown: AvatarAbilities.AbilityDefinition = {
	Name = Ability.FallingDown,
	StartsWhen = All( "CanFallDown", "Stunned" ), -- Labels necessary for ability to start
	Blocks = { Ability.Running }
}
```

<br>

Labels can also be broadcast or consumed in a **timed** manner using the `TimedLabels` dictionary.

| Key | Description |
| --- | --- |
| `TimedLabels.OnStart` | Dictionary containing labels (keys) and associated durations. Label(s) are broadcast when the ability starts and automatically expire when their duration ends. For example, `OnStart = { Dashing = 1 }` broadcasts the `Dashing` label for 1 second when the ability starts. |
| `TimedLabels.OnStop` | Dictionary containing labels (keys) and associated durations. Label(s) are broadcast when the ability stops and automatically expire when their duration ends. For example, `OnStop = { DashCooldown = 2 }` broadcasts the `DashCooldown` label for 2 seconds when the ability stops. |
| `TimedLabels.Consumes` | List of labels to remove (consume) when the ability activates. For example, if a fighting game allows players to counter‑attack after blocking an opponent's attack, the `CounterAttack` ability may contain both `StartsWhen = "AfterBlock"` and `TimedLabels = { Consumes = { "AfterBlock" } }` to prevent double‑triggering of the `CounterAttack` ability. |

```lua title="Timed Labels"
local AvatarAbilities = require("@rbx/AvatarAbilities")

local Identifiers = AvatarAbilities.Identifiers
local Rule = AvatarAbilities.Rule
local Sensor = Identifiers.Sensor
local All, Any, Not = Rule.All, Rule.Any, Rule.Not

local Dash: AvatarAbilities.AbilityDefinition = {
	Name = "Dash",
	StartsWhen = All( Sensor.Ground, Not("DashCooldown") ),
	RunsWhile = "Dashing",
	TimedLabels = {
		OnStart = { Dashing = 1 },
		OnStop = { DashCooldown = 2 },
	},
}
```

### Conditions

A **condition** is one or more [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Labels|labels]], [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Sensors|sensors]], or an input reference, used by `StartsWhen` and `RunsWhile`. Conditions compile to bitmask operations at runtime and evaluation is integer math — no table walks and no string comparisons.

| Goal | Syntax | Example |
| --- | --- | --- |
| One required condition. |  | `StartsWhen = Sensor.Ground` |
| `AND` logic for when **all** of the labels exist in the world mask and **all** of the sensors are active. | `All()` | `StartsWhen = All( "CanFallDown", "Stunned" )` |
| `OR` logic for when **any** of the labels exist in the world mask or **any** of the sensors are active. | `Any()` | `StartsWhen = Any( "WallClimbing", "Climbing" )` |
| Negation such that the labels can **not** exist in the world mask and the sensors can **not** be active. | `Not()` | `RunsWhile = Not("Stunned")` |

> [!info]
> `Not()` takes exactly **one** label/sensor, not a group. To negate multiple, use
>
> `All( Not(), Not() )`
>
> .

Conditional evaluation can be combined for more complex logic, such as `All()` chaining plus `Not()` to indicate that a sensor must be active while a label must be nonexistent:

```lua
local AvatarAbilities = require("@rbx/AvatarAbilities")

local Identifiers = AvatarAbilities.Identifiers
local Rule = AvatarAbilities.Rule
local Sensor = Identifiers.Sensor
local All, Any, Not = Rule.All, Rule.Any, Rule.Not

local Dive: AvatarAbilities.AbilityDefinition = {
	Name = "Dive",
	StartsWhen = All( Sensor.WaterSurface, Not("Recovering") ),
}
```

### Conflicts

Some abilities cannot be active when another ability is; for example, characters can't jump while swimming, and they can't run while falling. The engine resolves these conflicts declaratively inside an ability's definition:

| Conflict Key | Purpose |
| --- | --- |
| `Blocks` | While the owning ability is active, the listed other abilities cannot start. For example, a `ScopeAim` ability might contain `Blocks = { Ability.Running, Ability.Jumping }` to prevent characters from running or jumping while carefully aiming through their weapon's scope. |
| `Stops` | When the owning ability starts, the listed other abilities **force‑stop** and must re‑trigger. For instance, a `Hover` ability might contain `Stops = { Ability.Running }` to immediately stop a character's running motion when they start hovering. |
| `Suspends` | When the owning ability starts, the listed other abilities **pause** and then **auto-resume** when the owning ability stops. For example, a custom sprint ability might contain `Suspends = { Ability.Running }` so that running 🄐 pauses on sprint start, 🄑 is blocked mid‑sprint, and 🄒 resumes on sprint stop. |

Another unique conflict key is `ExclusiveGroup` which places multiple abilities into a group, each with a `Priority` value. Only one ability per group can be active and higher priority wins. However, if a challenger declares `Stops` targeting the holder's name/label, it wins regardless of priority.

In the following setup, three abilities (`Sprinting`, `Crouching`, `Stagger`) are added to a `Locomotion` exclusive group. `Sprinting` has the highest priority (`200`) so it wins over `Crouching` (`100`) and the two never run at the same time. However, `Stagger` forcibly stops sprinting (

`Stops = { Ability.Sprinting }`

), so it can interrupt and supersede `Sprinting` even though its priority (`150`) is lower.

```lua
local AvatarAbilities = require("@rbx/AvatarAbilities")

local Identifiers = AvatarAbilities.Identifiers
local Ability = Identifiers.Ability
local Rule = AvatarAbilities.Rule
local Sensor = Identifiers.Sensor
local All, Any, Not = Rule.All, Rule.Any, Rule.Not

local Sprinting: AvatarAbilities.AbilityDefinition = {
	Name = Ability.Sprinting,
	ExclusiveGroup = { Name = "Locomotion", Priority = 200 },
}
local Crouching: AvatarAbilities.AbilityDefinition = {
	Name = Ability.Crouching,
	ExclusiveGroup = { Name = "Locomotion", Priority = 100 },
}
-- A lower-priority ability can override a higher-priority ability by stopping it
local Stagger: AvatarAbilities.AbilityDefinition = {
	Name = "Stagger",
	ExclusiveGroup = { Name = "Locomotion", Priority = 150 },
	Stops = { Ability.Sprinting },
}
```

### Inputs

An ability's `Input` definition specifies the input used to attempt to activate the ability. It takes key-value pairs that configure the input behavior, action slot, and optional touch button icons.

```lua
local AvatarAbilities = require("@rbx/AvatarAbilities")

local Identifiers = AvatarAbilities.Identifiers
local Rule = AvatarAbilities.Rule
local Sensor = Identifiers.Sensor
local All, Any, Not = Rule.All, Rule.Any, Rule.Not

local Dash: AvatarAbilities.AbilityDefinition = {
	Name = "Dash",
	Input = { InputName = "Dash", Mode = "Press", ActionSlot = 5 }
}
```

- `InputName` is a logical name, not a key. The CCL generates an input sensor and always ANDs it into `StartsWhen`.

- `Mode` defines how this input starts and stops the ability. `RunsWhile` never contains the input itself; it holds only world conditions, such as being on the ground or in water, so `Mode` is the sole source of input-driven starting and stopping:

  | Mode | Starts | Stops From Input |
  | --- | --- | --- |
  | `Press` | On press. | Never. The ability ends itself through a conflict, its own `RunsWhile`, or by calling `Stop()`. |
  | `Hold` | On press. | On release. |
  | `Hold` with `Repeats` | On press. | Release ends the re-fire, not the cycle already in flight. |
  | `Toggle` | On toggle-on. | On toggle-off. |

  `Press` suits discrete actions like dash, attack, and throw. `Hold` and `Toggle` suit sustained actions like sprint, aim, block, crouch, and levitate. `Hold` with `Repeats` suits actions that self-stop and re-fire while held, such as repeated jumping.

- `Repeats` (boolean, `Hold` only) makes the ability self-terminate each cycle and re-fire while the input stays held, instead of running continuously for the whole hold.

- `OutlivesInputWhile` (`Hold`/`Toggle` only) is a [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library#Conditions|condition]] under which the ability keeps running past release or toggle-off, stopping once the condition clears. Use it when an ability should outlast its input under a specific world condition.

- `ActionSlot` defines an **action slot** which is associated with a list of [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputActions]] and [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBindings]] within the [[30 Official Roblox Docs/Input/Input Action System|Input Action System]].

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

- `CustomIcon`, `CustomIconActive`, and `CustomIconInvalid` specify Roblox asset IDs for the touch button when the ability is idle, active, or unavailable, respectively.

`RunsWhile` holds world conditions only. The compiler composes the input's effect into the ability's actual continuation behind the scenes based on `Mode`, so putting the input itself into `StartsWhen` or `RunsWhile` throws an error (don't reference `Rule.Input` there). `Hold` and `Toggle` abilities already stop on release or toggle-off by default, so you don't need to duplicate that in `RunsWhile`:

```lua
local AvatarAbilities = require("@rbx/AvatarAbilities")

local Rule = AvatarAbilities.Rule
local Sensor = AvatarAbilities.Identifiers.Sensor
local All, Any, Not = Rule.All, Rule.Any, Rule.Not

local Glide: AvatarAbilities.AbilityDefinition = {
	Name = "Glide",
	Input = { InputName = "Glide", Mode = "Hold", ActionSlot = 6 },
	StartsWhen = Not(Sensor.Ground),
	RunsWhile = Not(Sensor.Ground),
}
```

To make a `Hold` or `Toggle` ability outlast its input under a world condition, set `OutlivesInputWhile` instead of adding the input to `RunsWhile`. The following `Crouching` ability keeps crouching after the player releases the crouch input, as long as something remains overhead:

```lua
local AvatarAbilities = require("@rbx/AvatarAbilities")

local Identifiers = AvatarAbilities.Identifiers
local Sensor = Identifiers.Sensor

local Crouching: AvatarAbilities.AbilityDefinition = {
	Name = "Crouching",
	Input = { InputName = "Crouch", Mode = "Hold", OutlivesInputWhile = Sensor.Ceiling, ActionSlot = 3 },
	RunsWhile = Sensor.Ground,
}
```

### Sensors

A **sensor** is a named value about the world that the engine reads for you. You'll typically read sensors rather than write them. For convenience, several sensors are pre-registered:

| Sensor | Description |
| --- | --- |
| `Sensor.Ground` | Standing on a surface |
| `Sensor.IsMoving` | Movement input is being applied |
| `Sensor.MoveInput` | The movement vector itself |
| `Sensor.Ceiling` | Something is directly overhead |
| `Sensor.Climb` | A climbable surface is in range |
| `Sensor.Water` / `Sensor.WaterSurface` | In water / at the surface |
| `Sensor.Sit` | Seated |
| `Sensor.Tipped` | Fallen over |
| `Sensor.Tool` | Holding a [[30 Official Roblox Docs/API Reference/Classes/Tool\|Tool]] |
| `Sensor.LookDirectionInput` | The commanded look direction |
| `Sensor.RotateToLookDirectionInput` | Whether the character should rotate to the commanded look direction |

### Callbacks

Ability **callback functions** let you script specific behavior:

Although you register custom abilities on the server, their callbacks run in both the predicted client simulation and the authoritative server simulation. Keep callback behavior deterministic so both simulations produce the same result.

| Callback | Runs | Use Cases |
| --- | --- | --- |
| `OnSetup(managerCtx, abilityCtx)` | Once, when the ability is registered. | Cache references, initialize state, etc. |
| `OnStart(managerCtx, abilityCtx, hadLabel)` | Each time the ability is activated. | Apply an effect such as an impulse. The `hadLabel()` function reports whether a specified label was present when activation began, before conflict resolution. |
| `OnUpdate(managerCtx, abilityCtx)` | Each active frame. | Continuous work such as timers or per‑frame forces. |
| `OnStop(managerCtx, abilityCtx)` | Each deactivation, voluntary or forced. | Undo what `OnStart()` did. |
| `OnTeardown(managerCtx, abilityCtx)` | On ability removal. | Disconnect connections, destroy instances, etc. |

Each callback function's first parameter, `managerCtx`, is a `ManagerContext` object with shared character and manager properties, including:

- `managerCtx.AbilityOwner` — The character [[30 Official Roblox Docs/API Reference/Classes/Model|Model]] such that `managerCtx.AbilityOwner.PrimaryPart` is the root part.
- `managerCtx.AbilityManager` — A cut-down view of the manager so that an ability can add, remove and query abilities from inside its own callbacks.
- `managerCtx.BodyParts` — The character's body parts, with helpers for turning collision on and off per limb.
- `managerCtx.ControllerManager` — The character's [[30 Official Roblox Docs/API Reference/Classes/ControllerManager|ControllerManager]] for physics control. It can be `nil` when no registered ability requires physics.
- `managerCtx.RootCFrame` — The root part's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]], snapshotted once at the start of the frame so callbacks don't each go and fetch it themselves.
- `managerCtx.RootLookVector` — Direction the character's root part is facing.
- `managerCtx.RootUpVectorY` — The **Y** component of the root part's up vector.
- `managerCtx.TaskSynchronize()` — Synchronizes a callback before DataModel access when parallel callback support is enabled. Currently, `OnUpdate` doesn't run in a parallel context, so this function has no effect. Full Parallel Luau support is planned for a future update.

The second parameter, `abilityCtx`, is an `AbilityContext` object with engine-managed tables for the current ability registration:

- `abilityCtx.Config` — Read-only configuration values for this ability registration.
- `abilityCtx.State` — Mutable state that replicates through the DataModel. [[30 Official Roblox Docs/Projects/Server Authority/Server authority model|Server Authority]] restores these values during rollback and resimulation.
- `abilityCtx.Local` — Mutable scratch state that doesn't replicate or participate in rollback.

Store custom callback data in `abilityCtx.State` or `abilityCtx.Local`. Writing custom fields directly to `abilityCtx` is an error.

> [!warning]
> Callbacks must **never** yield as they run inside the engine's synchronous step and yielding breaks the frame. Do **not** include any yielding functions such as [[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]] or [[30 Official Roblox Docs/API Reference/Classes/Instance#WaitForChild|WaitForChild()]]. Simulation callbacks also restrict some DataModel operations, including [[30 Official Roblox Docs/API Reference/Classes/Instance#Destroy|Destroy()]]. You can set attributes and update physics in a callback. For instance lifecycle or other restricted work, set an attribute in the callback and respond to it from a regular script.

---
*Source: [Character Controller Library](https://create.roblox.com/docs/characters/character-controller-library) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
