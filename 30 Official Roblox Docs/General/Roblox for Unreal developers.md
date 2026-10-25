---
title: "Roblox for Unreal developers"
description: "If you're an experienced Unreal developer, use this page to get oriented with Roblox."
area: "30 Official Roblox Docs"
cluster: "General"
source: "https://create.roblox.com/docs/unreal"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*If you're an experienced Unreal developer, use this page to get oriented with Roblox.*

This page contains information to help experienced Unreal Engine developers get started with Roblox, including basic orientation, a conceptual comparison, and key differences between the two platforms.

## Get oriented

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

Unreal's **Outliner** and Roblox Studio's [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] are the primary windows for organizing elements in 3D spaces. Both display a hierarchy of objects and folders. However, **Outliner** has a flatter, less defined structure and only shows `Actors`. The **Explorer** window has a deeply nested, strict structure and displays all objects as part of the hierarchy, even objects that would be considered components in Unreal.

The Roblox Studio [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) and [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) overlap with the Unreal **Content Browser**. The **Asset Manager** lets you manage all assets within your game, whereas the **Toolbox** lets you access any assets you've published. The **Toolbox** also lets you search the [[30 Official Roblox Docs/Production/Creator Store|Creator Store]] for assets from Roblox or the community, similar to the Unreal Engine **Marketplace** but accessible directly from the Studio user interface.

## Philosophical differences

Roblox is a "simulation engine" rather than a traditional game engine. Unreal `Actors` and Roblox [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] both serve as fundamental building blocks, but in practice, the two are quite different:

- **Representation**: `Actors` in Unreal are a higher-level concept for any object in a level, whereas [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] in Roblox are designed to represent physical objects like wooden blocks and plastic spheres.
- **Physics**: To perform physics simulations in Unreal, you enable physics within certain components (such as the `StaticMeshComponent`) or by adding components to `Actors`, such as physics constraints. In Roblox, physics are built into the [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] data type; the engine handles interactions automatically.

You can see the difference immediately if you create an `Actor` and a [[30 Official Roblox Docs/API Reference/Classes/Part|Part]]. The `Actor` has little more than a location, rotation, and scale. The [[30 Official Roblox Docs/API Reference/Classes/Part|Part]] has that same information, plus a material and color, values for reflectance and transparency, mass and shape, and much more. The two only start to share similar properties when you compare a `StaticMeshActor` in Unreal to a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] in Roblox.

*(image in the full Top G Vault)*

*Unreal Editor Details panel*

*(image in the full Top G Vault)*

*Roblox Studio Properties window*

Another useful comparison is the Unreal `Actor` to the Roblox [[30 Official Roblox Docs/API Reference/Classes/Model|Model]]. Models act as a container for a collection of interconnected parts in the same way that `Actors` in Unreal are containers for components. You specify one of the model's parts as its [[30 Official Roblox Docs/Parts/Models#Set a primary part|primary part]] to define the pivot point. Models also hold scripts, animations, sound effects, prompts, constraints, particle emitters, and more.

For example, an Unreal `Actor` might have a `NiagaraComponent` that uses several emitters to achieve the desired visual effect, a mesh for the shape, a physics constraint to add springiness, and a script for player interactivity. In Outliner, you see a single `Actor` named `SpringyFireball`.

In Roblox, a comparable `SpringyFireball` model in the **Explorer** window might look something like this:

```text
Model
|- ParticleEmitter
|- MeshPart
|- SpringConstraint
|- ClickDetector
|  |- Script
```

Roblox's physics-by-default philosophy extends to the process of building 3D models. In Roblox, welding multiple parts together into an [[30 Official Roblox Docs/Physics/Assemblies|assembly]] is an excellent way to quickly build things, because Roblox treats the welded parts as a single rigid body. This approach isn't practical in Unreal.

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

Unreal doesn't have the concept of different script types. If you choose to make a multiplayer game, you write additional code to synchronize game state between the server and the clients.

In Unreal, much of the engine's functionality is available by extending built-in classes like `UObject`, `ACharacters`, `ULevel`, and `UWorld` in C++ or Blueprint. Unreal supports custom events, but many classes include events that the engine automatically invokes as part of the natural life cycle of the level.

Compared to the Unreal "ticking" system, Roblox scripts are much more event-driven. You access similar engine functionality by subscribing to services and listening for updates.

### C++ and Luau

For scripting, Unreal uses C++. Roblox uses [[30 Official Roblox Docs/Luau/Luau|Luau]], a scripting language derived from [Lua 5.1](https://www.lua.org/manual/5.1/).

Compared to Luau, C++ has an overall performance advantage, which might or might not be relevant to the kinds of games you want to build. Luau is gradually typed and has a less verbose syntax. In larger projects, however, gradual typing can introduce categories of bugs that strongly typed languages like C++ avoid, so consider enabling [[30 Official Roblox Docs/Luau/Type checking#Inference modes|strict type checking]] in Roblox scripts.

Unreal also includes a visual scripting system called **Blueprints**. Roblox has third-party plugins that offer similar functionality, but no comparable system built-in.

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

The Roblox script can be relatively concise because Roblox has many built-in assumptions: a [[30 Official Roblox Docs/API Reference/Classes/Player|Player]] with a [[30 Official Roblox Docs/API Reference/Classes/Humanoid|Humanoid]] character connected to the server and can equip [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]]. These assumptions don't exist in Unreal, so the implementation would be very different.

## Assets

Unreal and Roblox both support importing custom meshes and models in `.fbx` format. Certain types of assets may require specific configurations and export settings from your third-party modeling software. For more information, see the following pages:

- [[30 Official Roblox Docs/Studio/Importer|Importer]]
- [[30 Official Roblox Docs/Art/Modeling/General specifications|3D modeling specifications]]
- [[30 Official Roblox Docs/Art/Modeling/Export settings|Blender and Maya export requirements]]

In Unreal, assets import into your `Content` directory, visible in the **Content Browser**. In Roblox, assets import into your Workspace and into the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) or [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md).

Roblox also offers an open-source [[30 Official Roblox Docs/Art/Modeling/Roblox Blender plugin|Blender plugin]] to streamline the import process, similar to the **Send to Unreal** feature of Blender Tools.

## Transforms

's transforms and Roblox's [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]] serve similar purposes in representing 3D transformations of objects:

- Both transforms and [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrames]] represent the position and rotation of an object in 3D space. Transforms include scale, whereas Roblox uses a [[30 Official Roblox Docs/API Reference/Classes/BasePart#Size|BasePart.Size]] property that isn't part of the [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]].
- Both support multiplication for complex transformations and have built-in methods for other manipulations.

## Collaboration

In Unreal, you collaborate with version control systems like Perforce or SVN, generally through Unreal's built-in user interface. These version control systems use the centralized "checkout" model that locks files while one person works on them.

Roblox files live in the cloud (although you can export copies), so Roblox Studio provides built-in collaboration workflows for simultaneous editing, group management, permissions, script drafting, and more. See [[30 Official Roblox Docs/Projects/Collaboration|Collaboration]].

> [!info]
> Cloud syncing provides further benefits with [packages](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/packages.md), the Roblox equivalent of Unreal Blueprint classes. Converting an asset or asset hierarchy to a package helps with local reusability, but also with collaboration. When you or your collaborators publish a new version of a package, you can quickly update existing instances of that package within a game or set them to auto-update.

## Plugins

Similar to Unreal, Roblox Studio supports [[30 Official Roblox Docs/Studio/Studio plugins|plugins]], which can simplify or give you additional control over various aspects of the development process. Plugins are available in the [[30 Official Roblox Docs/Production/Creator Store|Creator Store]], just like assets, many for free.

## Glossary

| Unreal          | Roblox                                                                               | Notes                                                                               |
| :-------------- | :----------------------------------------------------------------------------------- | :---------------------------------------------------------------------------------- |
| Level           | [[30 Official Roblox Docs/Projects/Projects#Places\|Place]]                                                          |                                                                                     |
| Actor           | [[30 Official Roblox Docs/API Reference/Classes/Part\|Part]] or [[30 Official Roblox Docs/API Reference/Classes/Model\|Model]]                                                        | See [[30 Official Roblox Docs/General/Roblox for Unreal developers#Philosophical differences\|Philosophical differences]].                        |
| Blueprint Class | [Package](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/packages.md)                                               |                                                                                     |
| Transform       | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]]                                                                    | [[30 Official Roblox Docs/API Reference/Datatypes/CFrame\|CFrame]] doesn't include scale information. See [[30 Official Roblox Docs/General/Roblox for Unreal developers#Transforms\|Transforms]]. |
| Outliner        | [[30 Official Roblox Docs/Studio/Explorer window\|Explorer]]                                                       |                                                                                     |
| Details panel   | [[30 Official Roblox Docs/Studio/Properties window\|Properties]]                                                   |                                                                                     |
| Level Viewport  | [[30 Official Roblox Docs/Studio/Studio interface#3D viewport\|3D viewport]]                                        |                                                                                     |
| Content Browser | [Asset Manager](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/manager.md) or [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) |                                                                                     |
| Landscape Mode  | [[30 Official Roblox Docs/Studio/Terrain Editor\|Terrain Editor]]                                           |                                                                                     |
| PlayerStart     | [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]]                                                                |                                                                                     |
| Output Log      | [[30 Official Roblox Docs/Studio/Output\|Output]]                                                           |                                                                                     |
| Marketplace     | [[30 Official Roblox Docs/Production/Creator Store\|Creator Store]]                                         |                                                                                     |
| Menu bar        | [[30 Official Roblox Docs/Studio/Studio interface#Toolbar and mezzanine\|Toolbar]]                                  |                                                                                     |
| Plugin          | [[30 Official Roblox Docs/Studio/Studio plugins\|Plugin]]                                                          |                                                                                     |

---
*Source: [Roblox for Unreal developers](https://create.roblox.com/docs/unreal) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
