---
title: "Script types and locations"
description: "How scripts run in Roblox, and how location impacts that behavior."
area: "30 Official Roblox Docs"
cluster: "Scripting"
source: "https://create.roblox.com/docs/scripting/locations"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*How scripts run in Roblox, and how location impacts that behavior.*

![](https://www.youtube.com/watch?v=jLNgutvbALY)

For many developers, the fundamental challenge of adapting to Roblox scripting is the importance of file location and the [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|Script.RunContext]] property. Depending on script type, location in the **Explorer**, and run context, scripts can behave very differently. Certain method calls might fail, objects in your game might be inaccessible, or scripts might not run at all.

The reason for this complexity is that Roblox games are multiplayer by default. Scripts need the ability to only run on the server, only run on the client, or be shared across both. The evolution of the Roblox platform over time has further complicated the situation.

## Script types

Roblox has three types of scripts:

- [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] - Code that runs on either the server or the client, depending on its location and [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|Script.RunContext]] property.
- [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] - Code that runs only on the client. Does not have a run context.
- [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] - Code that you can reuse in other scripts. Does not have a run context.

When you create a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]], its default run context is `Legacy`, meaning that it a) is a server-side script and b) only runs if it is in a server container, such as [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]] or [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]].

- If you change the script's run context to `Server`, it can now also run in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]], but we don't recommend it. The contents of that location are replicated to clients, so it's a poor location for server-side scripts.
- If you change the script's run context to `Client`, it can run in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. It can also run in [[30 Official Roblox Docs/API Reference/Classes/StarterCharacterScripts|StarterCharacterScripts]] and [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]]. Starter containers are copied to clients, though, so the original script **and** the copy run, which isn't desirable.

To change a script run context, select it in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] and change the value in the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window.

*(image in the full Top G Vault)*

## Recommendations

- Put a single [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with a `RunContext` of `Client` into [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]].
- Put a single [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with a `RunContext` of `Server` into [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]].
- Use [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] for as much client and server code as possible. Require these modules from your client script and your server script.

  This approach gives your code a single entry point on the client and server sides, which simplifies organization and makes it easy to isolate or disable problematic modules. Add a `start()` function to each [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] so that all modules can load before you begin executing their code:

  ```lua title="Sample server script"
  --!strict
  local ServerScriptService = game:GetService("ServerScriptService")
  local SampleModule = require(ServerScriptService.SampleModule)
  local AnotherSampleModule = require(ServerScriptService.AnotherSampleModule)
  SampleModule.start()
  AnotherSampleModule.start()
  ```

  ```lua title="Sample module"
  --!strict
  local CollectionService = game:GetService("CollectionService")

  local NPC_TAG = "npc"

  local SampleModule = {}

  local function setUpNpc(npc: Instance)
      -- initialize each NPC
  end

  local function cleanUpNpc(npc: Instance)
      -- run when event fires
  end

  function SampleModule.start() -- add the function to the table
      -- example loop for setup based on tags
      for _, npc in CollectionService:GetTagged(NPC_TAG) do
          setUpNpc(npc)
      end

      -- run functions when events fire
      CollectionService:GetInstanceAddedSignal(NPC_TAG):Connect(setUpNpc)
      CollectionService:GetInstanceRemovedSignal(NPC_TAG):Connect(cleanUpNpc)
  end

  return SampleModule
  ```

- To share code, use [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] in `ReplicatedStorage` and require them in both your client script and your server script.
- If necessary for your game, repeat the same pattern in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] with a single client script and a minimal number of [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]] to implement a loading screen. To learn more about `ReplicatedFirst`, see [[30 Official Roblox Docs/Scripting/Properties and attributes#Replication order|Replication order]].
- Use [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] sparingly. If you must use them, put them in `StarterCharacterScripts`, `StarterPlayerScripts`, `StarterGui`, or `StarterPack`.

  Scripts in these containers clone to player containers rather than running from one location, which can complicate debugging. Using `ReplicatedStorage` for client code lets you click lines in the **Output** window and go to `ReplicatedStorage.YourScript` (the stable location of the script) rather than `Players.YourName.PlayerScripts.YourLocalScript` (the ephemeral location that the script was copied to at runtime).

- Avoid attaching scripts directly to instances in [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. Instead, [[30 Official Roblox Docs/Studio/Properties window#Instance tags|tag instances]] and use [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]] to work with them from a single [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]].

  The key exception is if you distribute models or packages on the Creator Store. In that case, you might need to include scripts within the instance hierarchy; specify a `RunContext` for each script to remove ambiguity from how it runs. Explicitly setting this property makes models and packages more likely to work properly from a variety of locations.

### Example project structure

The [[30 Official Roblox Docs/Resources/Plant reference project|Plant]] reference project shows how you might organize your code in a large, complex game. It stores the vast majority of its code as reusable [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScripts]].

## Script locations

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

This image shows which **Explorer** window locations can contain client scripts. Remember, `ReplicatedFirst` and `ReplicatedStorage` can contain [[30 Official Roblox Docs/API Reference/Classes/Script|Scripts]] with a [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] of [[30 Official Roblox Docs/API Reference/Enums/RunContext|Client]], whereas the `Starter[]` containers should use [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]].

*(image in the full Top G Vault)*

---
*Source: [Script types and locations](https://create.roblox.com/docs/scripting/locations) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
