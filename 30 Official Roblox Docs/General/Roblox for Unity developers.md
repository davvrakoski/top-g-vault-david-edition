---
title: "Roblox for Unity developers"
description: "If you're an experienced Unity developer, use this page to get oriented with Roblox."
area: "30 Official Roblox Docs"
cluster: "General"
source: "https://create.roblox.com/docs/unity"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*If you're an experienced Unity developer, use this page to get oriented with Roblox.*

This page contains information to help experienced Unity developers get started with Roblox, including basic orientation, a conceptual comparison, and key differences between the two platforms.

## Get oriented

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

Unity's **Hierarchy** window and Roblox Studio's [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] are the primary windows for organizing elements in 3D scenes:

- Both allow you to manage and organize objects (for example, characters and environmental assets).
- Both use a tree structure for the parent-child relationships between objects.

However, the **Hierarchy** window has no predefined structure, whereas the **Explorer** window has a strict structure. It might help to think of the **Explorer** window as a combination of Unity's **Hierarchy** and **Project** windows, with the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] folder as the most recognizable element.

Similarly, the Roblox Studio [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) and [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) overlap with the Unity **Project** window. The **Asset Manager** lets you manage all assets within your game, whereas the **Toolbox** lets you access any assets you've published. The **Toolbox** also lets you search the [[30 Official Roblox Docs/Production/Creator Store|Creator Store]] for assets from Roblox or the community, similar to the Unity **Asset Store**.

## Philosophical differences

Roblox is a "simulation engine" rather than a traditional game engine. Unity `GameObjects` and Roblox [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] both serve as the fundamental building blocks for creating objects in a 3D environment, but in practice, the two are quite different:

- **Representation**: `GameObjects` in Unity are a higher-level concept for any object in a scene, whereas `Parts` in Roblox are designed to represent physical objects like wooden blocks and plastic spheres, rather than abstract geometry like primitive objects in Unity.
- **Physics**: To perform physics simulations in Unity, you attach components like `Rigidbody` and `Collider` to a `GameObject`. In Roblox, physics are built into the `Parts` data type; the engine handles interactions automatically.

You can see the difference immediately if you create a `GameObject` and a `Part`. The `GameObject` has nothing more than a position, rotation, and scale. The `Part` has that same information—plus a material and color, values for reflectance and transparency, mass and shape, and much more. Turning a `Part` into something more akin to an empty `GameObject` means **removing** a lot of built-in properties. Conversely, you can make a `GameObject` that looks a lot like a `Part` by adding `MeshFilter`, `MeshRenderer`, `Collider`, and `Rigidbody` components to it.

From a scripting perspective, `GameObject` is most similar to the Roblox [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], the base class for all other Roblox classes, but because you don't (and can't) create objects of type `Instance`, the comparison isn't especially practical.

Another comparison is the Unity `GameObject` to the Roblox [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]. Models act as a container for a collection of interconnected parts in the same way that you might establish a parent-child relationship between many `GameObjects` in Unity. You specify one of the model's parts as its [[30 Official Roblox Docs/Parts/Models#Set a primary part|primary part]] to define the pivot point. Models also hold scripts, animations, sound effects, prompts, constraints, particle emitters, and more.

For example, a Unity `GameObject` might have components for `ParticleSystem`, `Physics3D`, `SpringConstraint`, and a script. In the Hierarchy window, you see a single `GameObject` named `SpringyFireball`. The Inspector window shows the collection of components and properties.

In Roblox, a comparable `SpringyFireball` model in the **Explorer** window might look something like this:

```text
Model
|- ParticleEmitter
|- MeshPart
|- SpringConstraint
|- ClickDetector
|  |- Script
```

Roblox's physics-by-default philosophy extends to the process of building 3D models. In Roblox, welding multiple parts together into an [[30 Official Roblox Docs/Physics/Assemblies|assembly]] is an excellent way to quickly build things, because Roblox treats the welded parts as a single rigid body. This approach isn't available in Unity.

Rather than using standard metric units for length and mass, Roblox uses notional units called studs and Roblox Mass Units (RMUs). For approximate metric conversions and recommendations around use, see [[30 Official Roblox Docs/Physics/Roblox units|Units]].

## Location matters

Roblox games are multiplayer by default, so Roblox Studio includes many different storage locations with specific behaviors. For more information, see [[30 Official Roblox Docs/Projects/Client-server runtime|client-server runtime]] and [[30 Official Roblox Docs/Projects/Data model#Object organization|object organization]].

Location | Description
:--- | :---
[[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] | Represents the game's 3D world. Can run server scripts that attach directly to objects and control their behavior.
[[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] | Contains objects that replicate to the client before anything else. This location is ideal for the absolute minimum set of objects and client scripts necessary to display a loading screen.
[[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] | Contains objects that are replicated to both the client and the server. This location is ideal for [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] with a [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Client]], client [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]], and [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] that you want to use on both the server and the client. [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] do not run from this location.
[[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] | Contains server scripts. This location is ideal for scripts that need to access server-side functionality or objects, such as game logic and cloud storage.
[[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]] | Contains server-side objects. This location is ideal for large objects that don't need to be immediately replicated to clients when they join a game. Scripts do not run from this location, but you can store server-side [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] here.
[[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] ⟩ [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]] | Contains [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] that run when the character spawns.
[[30 Official Roblox Docs/API Reference/Classes/StarterPlayer|StarterPlayer]] ⟩ [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] | Contains [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] that run when the player joins the game.
[[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] | Contains GUI elements that the client displays when it loads the game. [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] can run from this location.
[[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]] | Generally only contains [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]], but can also include [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] for setting up player backpacks.

## Scripting

Roblox games support three different types of Luau scripts:

- **Client scripts**

  These scripts run on the client, and the server has no visibility into their behavior. For legacy reasons, these scripts can take the form of [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] or [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] with a [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] value of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Client]]. Client scripts typically live in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]], [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]], or [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]].

- **Server scripts**

  These scripts run on the server, and the client has no visibility into their behavior. Server scripts have a [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] value of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Server]] and typically live in [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]], the contents of which are not replicated to the client.

- **Module scripts**

  These scripts are reusable pieces of code that return exactly one value, typically a function or table (or a table of functions). Rather than duplicating code in client and server scripts, use module scripts to share code and data between the two. Module scripts often live in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]], but can live elsewhere if you want to share code between scripts on the same side of the client-server boundary.

Unity doesn't have the concept of different script types. If you choose to make a multiplayer game, Unity uses its networking libraries to indicate when a `GameObject` (and its scripts) should be exclusive to the server.

In Unity, much of the engine's functionality is available through the methods of `MonoBehaviour`. For example, to run code before the render loop, you add code to the `Update()` method. To handle physics collision events, you add code to the `OnCollideEnter()` method.

Roblox scripts are more event-driven. You access similar functionality by subscribing to services and listening for updates.

### C# and Luau

For scripting, Unity uses C#. Roblox uses [[30 Official Roblox Docs/Luau/Luau|Luau]], a scripting language derived from [Lua 5.1](https://www.lua.org/manual/5.1/).

Compared to C#, Luau is gradually typed and generally has a less verbose syntax. In larger projects, however, gradual typing can introduce categories of bugs that strongly typed languages like C# avoid, so consider enabling [[30 Official Roblox Docs/Luau/Type checking#Inference modes|strict type checking]] in Roblox scripts.

For basic syntax differences between the scripting languages, see [[30 Official Roblox Docs/Luau/Luau and C comparison|Luau and C# comparison]].

### Luau code sample

The following Luau code sample demonstrates how to, after a player equips a fishing pole, listen for user input (in this case, the <kbd>E</kbd> key) and call additional functions:

```lua
local ContextActionService = game:GetService("ContextActionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get a module script from ReplicatedStorage that returns a single function
local performSomeAction = require(ReplicatedStorage.performSomeAction)

-- Assumes that this script is a child of the fishing pole
local fishingPole = script.Parent
local ACTION_CAST = "Cast"

-- Check that the key is down, then call another function
local function castLine(_actionName, inputState, _inputObject)
	if inputState == Enum.UserInputState.Begin then
		performSomeAction()
	end
end

-- Only enable the action when the player equips the fishing pole
fishingPole.Equipped:Connect(function()
	ContextActionService:BindAction(ACTION_CAST, castLine, true, Enum.KeyCode.E)
end)

-- Disable the action when the player unequips the fishing pole
fishingPole.Unequipped:Connect(function()
	ContextActionService:UnbindAction(ACTION_CAST)
end)
```

The Roblox script can be relatively concise because Roblox has many built-in assumptions: a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] with a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] character connected to the server and can equip [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]]. These assumptions don't exist in Unity, so the implementation would be very different.

## Assets

Unity and Roblox both support importing custom meshes and models in `.fbx` format. Certain types of assets may require specific configurations and export settings from your third-party modeling software. For more information, see the following pages:

- [[30 Official Roblox Docs/Studio/Importer|Importer]]
- [[30 Official Roblox Docs/Art/Modeling/General specifications|General specifications]]
- [[30 Official Roblox Docs/Art/Modeling/Export settings|Blender and Maya export requirements]]

In Unity, objects import into your `Assets` directory, visible in the **Project** window. In Roblox, assets import into your [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] and into the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) or [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md).

Roblox also offers an open-source [[30 Official Roblox Docs/Art/Modeling/Roblox Blender plugin|Blender plugin]] to streamline the import process.

## Transforms

's transforms and Roblox's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]] serve similar purposes in representing 3D transformations of objects:

- Both transforms and [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]] represent the position and rotation of an object in 3D space. Transforms include scale, whereas Roblox uses a [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|BasePart.Size]] property that isn't part of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]].
- Both support multiplication for complex transformations and have built-in methods for other manipulations.

## Collaboration

In Unity, you collaborate with standard version control systems or paid services like Unity Version Control.

Roblox files live in the cloud (although you can export copies), so Roblox Studio provides built-in collaboration workflows for simultaneous editing, group management, permissions, script drafting, and more. See [[30 Official Roblox Docs/Projects/Collaboration|Collaboration]].

> [!info]
> Cloud syncing provides further benefits with [packages](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/packages.md), the Roblox equivalent of Unity prefabs. Converting an asset or asset hierarchy to a package helps with local reusability, but also with collaboration. When you or your collaborators publish a new version of a package, you can quickly update existing instances of that package within a game or set them to auto-update.

## Plugins

Similar to Unity tools, Roblox Studio supports [[30 Official Roblox Docs/Studio/Studio plugins|plugins]], which can simplify or give you additional control over various aspects of the development process. Plugins are available in the [[30 Official Roblox Docs/Production/Creator Store|Creator Store]], just like assets, many for free.

## Glossary

| Unity             | Roblox                                                                               | Notes                                                                               |
| :---------------- | :----------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------- |
| Scene             | [[30 Official Roblox Docs/Projects/Projects#Places\|Place]]                                                          |                                                                                     |
| GameObject        | [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]] or [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]                                                        | See [[30 Official Roblox Docs/General/Roblox for Unity developers#Philosophical differences\|Philosophical differences]].                        |
| Prefab            | [Package](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/packages.md)                                               |                                                                                     |
| Transform         | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]                                                                    | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] doesn't include scale information. See [[30 Official Roblox Docs/General/Roblox for Unity developers#Transforms\|Transforms]]. |
| Hierarchy         | [[30 Official Roblox Docs/Studio/Explorer window\|Explorer]]                                                       |                                                                                     |
| Inspector         | [[30 Official Roblox Docs/Studio/Properties window\|Properties]]                                                   |                                                                                     |
| Scene view        | [[30 Official Roblox Docs/Studio/Studio interface#3D viewport\|3D viewport]]                                        |                                                                                     |
| Game view         | [[30 Official Roblox Docs/Studio/Studio interface#3D viewport\|3D viewport]]                                        | The viewport transitions into a gameplay view when you test your game.              |
| Project window    | [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) or [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) |                                                                                     |
| Terrain Inspector | [[30 Official Roblox Docs/Studio/Terrain Editor\|Terrain Editor]]                                           |                                                                                     |
| Spawn point       | [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]]                                                                |                                                                                     |
| Console           | [[30 Official Roblox Docs/Studio/Output\|Output]]                                                           |                                                                                     |
| Asset Store       | [[30 Official Roblox Docs/Production/Creator Store\|Creator Store]]                                         |                                                                                     |
| Overlays          | [[30 Official Roblox Docs/Studio/Studio interface#Toolbar and mezzanine\|Toolbar]]                                  |                                                                                     |
| Tool              | [[30 Official Roblox Docs/Studio/Studio plugins\|Plugin]]                                                          |                                                                                     |

---
*Source: [Roblox for Unity developers](https://create.roblox.com/docs/unity) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
