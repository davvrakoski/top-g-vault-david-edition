---
title: "Event Sequencer"
description: "Event Sequencer is a powerful framework for building live, cross-server events and cutscenes."
area: "30 Official Roblox Docs"
cluster: "Resources"
source: "https://create.roblox.com/docs/resources/modules/event-sequencer"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Event Sequencer is a powerful framework for building live, cross-server events and cutscenes.*

**EventSequencer** is a powerful framework that enables you to build live, cross-server events and cutscenes on a structured sequence of actions and triggers. More specifically, this module helps you:

- Build an event or cutscene on a structured framework through scheduled configurations of audio, animations, and tweens.
- Transition between multiple scenes across multiple servers, synchronizing complex animations and visuals to a timeline.
- Seek through an event and preview the game for testing and development purposes.

This framework has been battle tested in Roblox events like the [Twenty One Pilots](https://www.youtube.com/watch?v=0fAhhoXK12o) and [24kGoldn](https://www.youtube.com/watch?v=UfzqGkfRKr4) concerts, as well as many highly visited games.

![](https://www.youtube.com/watch?v=0fAhhoXK12o)

To see **EventSequencer** in action within an editable place, check out the [Concert](https://www.roblox.com/games/10275826693/Concert) template in Roblox Studio. This template is a comprehensive starting point for developers to create events/concerts and familiarize themselves with the various features and components involved.

*(image in the full Top G Vault)*

## Module usage

### Installation

To use the **EventSequencer** framework in a game:

1. From Studio's **Window** menu or **Home** tab toolbar, open the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) and select the **Creator Store** tab.

   *(image in the full Top G Vault)*

1. Make sure the **Models** sorting is selected, then click the **See All** button for **Categories**.

   *(image in the full Top G Vault)*

1. Locate and click the **Packages** tile.

1. Locate the **Event Sequencer** module and click it, or drag-and-drop it into the 3D view.

   *(image in the full Top G Vault)*

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, move the entire **EventSequencer** model into [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]]. Upon running the game the module will begin running.

### Framework modes

#### Replace mode

The default framework mode is **replace mode** in which you design unique [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Create scenes|scenes]] by placing [[30 Official Roblox Docs/Parts/Parts|3D objects]], [[30 Official Roblox Docs/Parts/Environmental terrain|terrain]], [[30 Official Roblox Docs/Environment/Global lighting|lighting properties]], [[30 Official Roblox Docs/Environment/Lighting and effects|environmental effects]], and user interface objects into that scene's **Environment** folder. When a scene loads, those objects and properties get distributed into [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]], and [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]], **replacing** existing objects/properties to form a cloned space.

> [!success]
> This mode is best for **new** event games consisting of multiple sequential scenes, such as a pre-show venue to the main concert to a post-show party.

#### Inline mode

An alternate framework mode is **inline mode** in which you similarly design unique [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Create scenes|scenes]] with scripting logic for their flow/events, but the framework will **not** destroy existing [[30 Official Roblox Docs/Parts/Parts|3D objects]], [[30 Official Roblox Docs/Parts/Environmental terrain|terrain]], [[30 Official Roblox Docs/Environment/Global lighting|lighting properties]], [[30 Official Roblox Docs/Environment/Lighting and effects|environmental effects]], and user interface objects in order to clone assets/properties from a scene's **Environment** folder upon loading.

> [!success]
> This mode is best for existing games, as it preserves the design and layout of your place while letting you orchestrate events such as cutscenes.

To enable inline mode:

1. Inside the **EventSequencer** model that you placed in **ServerScriptService**, drill down and select the **Inline** value inside the **ReplicatedStorage** folder.

   *(image in the full Top G Vault)*

2. In the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window, toggle on its **Value** checkbox.

   *(image in the full Top G Vault)*

### Create scenes

A **scene** is essentially part of an overall event or a cutscene wrapped up in a series of folders. Each scene contains scripting logic that defines its flow/events, and a scene can store its own [[30 Official Roblox Docs/Parts/Parts|3D objects]], [[30 Official Roblox Docs/Parts/Environmental terrain|terrain]], [[30 Official Roblox Docs/Environment/Global lighting|lighting properties]], [[30 Official Roblox Docs/Environment/Lighting and effects|environmental effects]], and user interface objects.

To get started quickly, you can find an empty scene inside the module's main folder:

1. Expand the **EventSequencer** folder and locate the **BlankScene** folder.

   *(image in the full Top G Vault)*

2. Move or copy the entire **BlankScene** folder into **ReplicatedStorage**.

   *(image in the full Top G Vault)*

   > [!warning]
   > While developing an event, you can alternatively place scenes elsewhere in the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy and tag them with **SequencerScene** using the [[30 Official Roblox Docs/Studio/Properties window#Instance tags|Tags]] section of their properties (**BlankScene** is already tagged as such). However, you'll need to move all event-ready scenes to **ReplicatedStorage** in order for them to work within the overall event flow.

#### Time length

Each scene should have a **time length**, in seconds, defining its duration — just like a movie or concert has a set duration. Time length is defined as a numeric [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attribute]] on the scene's folder named **TimeLength** which you can set directly in Studio or programmatically through [[30 Official Roblox Docs/API Reference/Classes/Instance#SetAttribute|Instance:SetAttribute()]].

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

#### Environment

A scene's **Environment** folder contains everything that users see and hear, including [[30 Official Roblox Docs/Parts/Parts|3D objects]], [[30 Official Roblox Docs/Parts/Environmental terrain|terrain]], [[30 Official Roblox Docs/Environment/Global lighting|lighting properties]] and [[30 Official Roblox Docs/Environment/Lighting and effects|environmental effects]], and user interface objects. When a scene loads, those objects and properties get distributed into [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]], and [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]], replacing existing objects/properties to form a cloned space.

> [!warning]
> This folder is not intended for usage with [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Inline mode|Inline Mode]], as that mode expects you to use existing assets and global property settings for the place, not load in scene-specific assets/properties.

The **Environment** folder contains the following containers:

| Container | Description |
| --- | --- |
| **Client** | Contains all assets to load when any user (client) joins the event, such as user interface objects or an animation rig. |
| **PlayerSpawns** | Contains parts where users spawn upon joining. Any part in this folder behaves similar to a [[30 Official Roblox Docs/API Reference/Classes/SpawnLocation\|SpawnLocation]]. |
| **Server** | Contains all assets to load when a scene is first created on a server. It's recommended that most visual assets go here. |
| **Terrain** | Contains scene terrain. |
| **Lighting** | Contains global [[30 Official Roblox Docs/Environment/Global lighting\|lighting properties]] as attributes, as well as modifiers like [[30 Official Roblox Docs/Environment/Atmospheric effects\|atmospheric effects]] and [[30 Official Roblox Docs/Environment/Post-processing effects\|post-processing]] effects. |

#### Events

A scene's **Events** folder is purely a placeholder for [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvents]] that communicate between the [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Client|Client]] and [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Server|Server]] modules. It's not a requirement to place anything in this folder.

#### Client

This script executes [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Scene schemas|schema]] logic on the client.

#### Server

This script executes [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Scene schemas|schema]] logic on the server.

### Scene schemas

A scene's **schema** defines what happens at what point in the scene's timeline. You should define a scene's schema in both its [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Client|Client]] and [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Server|Server]] modules and include **lifecycle hooks** to manage when **configurations** occur.

#### Lifecycle hooks

Schema [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Schema lifecycle hooks|lifecycle hooks]] let you manage when scene operations occur. A scene in production will typically run in the most simple flow:

- [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnSetup|OnSetup]] → [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnRun|OnRun]] → [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnEndScene|OnEndScene]]

[[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnRun|OnRun]] may be interrupted when seeking:

- [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnSetup|OnSetup]] → [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnRun|OnRun]]… **seek** → [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnRun|OnRun]]… **seek** → [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnRun|OnRun]] → [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnEndScene|OnEndScene]]

All three hooks can also repeat if the scene is replayed:

- [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnSetup|OnSetup]] → [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnRun|OnRun]] → [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnEndScene|OnEndScene]]… **replay** → [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnSetup|OnSetup]] → [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnRun|OnRun]] → [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnEndScene|OnEndScene]]

#### Configurations

Schema [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Schema configurations|configurations]] define the core operations of a scene, for example [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#audio|playing audio]] at 00:32, queuing an [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#animate|animation]] to sync with that audio, [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#schedule|scheduling a scene event]] like a fireworks show, and more. Every configuration supports certain callback functions where the first parameter (`self`) is the configuration instance.

> [!info]
> You can use configurations in both the [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Client|Client]] and [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Server|Server]] module schemas, but it's recommended that you perform operations like [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#audio|audio]] and [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#animate|animations]] on the client side, just like in a typical game.

### Seek scenes

A unique feature of **EventSequencer** is the ability to "seek" around scenes as you might seek through a video. In [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Replace mode|Replace Mode]], you can also switch between scenes to preview an entire multi-scene event before deploying it to production.

[Video: Seek-Bar.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/developer-modules/event-sequencer/Seek-Bar.mp4)

**Scene seeking is not accessible to everybody** since users simply enjoying the event should not have the ability to control its time flow. Instead, you must grant seeking permission based on the event's [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId|PlaceId]] as well as specific [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]] and/or [[30 Official Roblox Docs/Projects/Groups (teams)|groups]] and roles within them.

1. Create a new [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] within [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]].
1. Paste the following code into the new script.

   ```lua title="Script - Set Seeking Permissions"
   local ReplicatedStorage = game:GetService("ReplicatedStorage")

   local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

   EventSequencer.setSeekingPermissions({
   	placeIDs = {},
   	userIDs = {},
   	groups = {
   		{GroupID = , MinimumRankID = },
   	}
   })
   ```

1. Fill in the following tables within the [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#setSeekingPermissions|setSeekingPermissions]] call as follows:

   | | |
   | --- | --- |
   | `placeIDs` | Comma-delimited list of [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId\|PlaceId]] values to support seeking within. |
   | `userIDs` | Comma-delimited list of [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserIds]] for those who can seek within the supported places. |
   | `groups` | Comma-delimited list of tables, each containing a [[30 Official Roblox Docs/Projects/Groups (teams)\|group]] ID and the minimum rank of that group's members who can seek within the supported places. |

## Scene manager plugin

The [Scene Manager](https://www.roblox.com/library/9995053698/Scene-Manager) plugin is a useful tool for loading and unloading scenes, [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Save and load lighting|lighting]], and [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Save and load terrain|terrain]]. Unless you're using [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Inline mode|Inline Mode]], it's highly recommended that you use this plugin instead of manually placing/editing scene objects and properties.

> [!warning]
> This plugin is not intended for usage with [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Inline mode|Inline Mode]], as that mode expects you to use existing assets and global property settings for the place, not load in scene-specific assets/properties from the scene's [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Environment|Environment]] folder.

To install the plugin:

1. From Studio's **Window** menu or **Home** tab toolbar, open the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md).
2. With the **Creator Store** tab selected, select **Plugins** from the dropdown menu.
3. In the search field, type **Scene Manager** and press <kbd>Enter</kbd> to locate the plugin.

   *(image in the full Top G Vault)*

4. Click the plugin's icon to view its details and then click the **Install** button.
5. Once the plugin is installed, it appears in Studio's **Plugins** tab.

### Load and unload scenes

As outlined in [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Create scenes|creating scenes]], a scene's **Environment** folder contains everything that users see and hear, including [[30 Official Roblox Docs/Parts/Parts|3D objects]]. The plugin helps you quickly load a scene's assets into or out of organized folders within the workspace.

> [!danger]
> Scenes must be tagged with **SequencerScene** for the plugin to recognize them (**BlankScene** is already tagged as such). If you've created a scene but it doesn't appear in the plugin, make sure that it's tagged, then save and reopen the place.

| Plugin action | Description |
| --- | --- |
| **Load Client** | If the scene's client content is unloaded, moves its **Environment**/**Client** folder into the **Workspace**/**ScenesClient** folder. |
| **Load Server** | If the scene's server content is unloaded, moves its **Environment**/**Server** folder into the **Workspace**/**ScenesServer** folder. |
| **Unload Client** | If the scene's client content is loaded, moves its **Client** folder from **Workspace**/**ScenesClient** back to the **[Scene]**/**Environment** folder. |
| **Unload Server** | If the scene's server content is loaded, moves its **Server** folder from **Workspace**/**ScenesServer** back to the **[Scene]**/**Environment** folder. |
| **Unload All Scenes** | Moves every loaded scene's **Client** and **Server** folder back to its **Environment** folder. |

### Save and load lighting

The top-level [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service stores all of a place's lighting properties and visual effects. Since it's a top-level service, you cannot manually move it to a particular scene's **Environment**/**Server** or **Environment**/**Client** folder. Instead, you can utilize the plugin to copy its properties and children to the scene's **Environment**/**Lighting** folder.

1. Configure the scene's [[30 Official Roblox Docs/Environment/Global lighting|lighting properties]], [[30 Official Roblox Docs/Environment/Post-processing effects|post-processing]] effects, [[30 Official Roblox Docs/Environment/Atmospheric effects|atmospheric effects]], and [[30 Official Roblox Docs/Environment/Skyboxes|skyboxes]] through the top-level [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service.

   *(image in the full Top G Vault)*

1. In the **Scene Manager** plugin window, click **Save Lighting** for the desired scene.
1. Select and expand that scene's **Environment**/**Lighting** configuration and you'll see the same lighting properties as [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attributes]] of the folder, as well as cloned children of the top-level [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service.

   *(image in the full Top G Vault)*

   *Cloned instances*

   *(image in the full Top G Vault)*

   *Saved attributes*

   Once lighting properties and children are saved for a scene, you can quickly load them back into the top-level [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service by clicking **Load Lighting** from the plugin window.

> [!info]
> If you want an environmental lighting effect like [[30 Official Roblox Docs/API Reference/Classes/Atmosphere|Atmosphere]] to persist between scenes of a multi-scene event, place it in the top-level [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service and assign it a boolean [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attribute]] of **SceneFrameworkIgnore** set to **true**.
>
>
> The framework also applies a **UseCurrentLighting** attribute to the top-level [[30 Official Roblox Docs/API Reference/Classes/Lighting|Lighting]] service with a default of **false**. If set to **true**, the service's lighting overrides all scene-specific lighting during playtesting — however, scene lighting always takes precedence in a published event. As a real world analogy, this lets you stage a concert in full light before "turning down the lights" as the show begins.

### Save and load terrain

Since [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] is a top-level class within [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], you cannot manually move generated or sculpted terrain to a particular scene's **Environment**/**Server** or **Environment**/**Client** folder. Instead, you can utilize the plugin to copy it to the scene's **Environment**/**Terrain** folder.

1. Configure the scene's terrain through the top-level **Terrain** service.

   *(image in the full Top G Vault)*

1. In the **Scene Manager** plugin window, click **Save Terrain** for the desired scene.
1. Select and expand that scene's **Environment**/**Terrain** folder and you'll see a **TerrainRegion** object which represents the saved terrain.

   *(image in the full Top G Vault)*

   Once terrain is saved for a scene, you can quickly load it back into the top-level [[30 Official Roblox Docs/API Reference/Classes/Terrain|Terrain]] service by clicking **Load Terrain** from the plugin window.

> [!warning]
> If a scene contains absolutely no terrain, you should still click **Save Terrain** for it. This saves an "empty" terrain region for the scene and effectively clears all terrain from any scene shown before it.

## API reference

### Schema lifecycle hooks

#### OnSetup

The **OnSetup** lifecycle hook is intended for initializing assets and variables that will be referenced in [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnRun|OnRun]] or [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnEndScene|OnEndScene]], setting up [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptSignal#Connect|connections]] that are intended to last for the duration of the scene, etc. This hook receives the `timePositionObject` parameter which lets you read the current time at setup.

> [!warning]
> It's recommended that you do **not** call [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#wait|wait()]] or [[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]] within **OnSetup**, as it will delay the [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnRun|OnRun]] start while the scene's timer continues to count up.

```lua title="Client Schema" highlight="11,21"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

local Schema = EventSequencer.createSchema()

local clientEnvironment
local serverEnvironment
local dummy

Schema.OnSetup = function(timePositionObject)
	print("OnSetup (Client)")

	-- Access scene environments; does not apply to Inline Mode
	clientEnvironment = EventSequencer.getCurrentSceneEnvironment()
	serverEnvironment = EventSequencer.getCurrentServerEnvironmentFromClient()
	-- Wait for assets
	dummy = clientEnvironment:WaitForChild("Dummy")

	print("Current time is:", timePositionObject.Value)
end
```

```lua title="Server Schema" highlight="11,21"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

local Schema = EventSequencer.createSchema()

local serverEnvironment
local partColorConnection
local changePartColorEvent = script.Parent.Events.ChangePartColor

Schema.OnSetup = function(timePositionObject)
	print("OnSetup (Server)")

	-- Access scene environment; does not apply to Inline Mode
	serverEnvironment = EventSequencer.getCurrentSceneEnvironment()
	partColorConnection = changePartColorEvent.OnServerEvent:Connect(function(player, changedPart, newColor)
		serverEnvironment.changedPart.Color = newColor
	end)

	print("Current time is:", timePositionObject.Value)
end
```

#### OnRun

**OnRun** is the main operational lifecycle hook within a [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Scene schemas|schema]]. It should contain all timed [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Schema configurations|configurations]] for the scene, from playing [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#audio|audio]] or an [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#animate|animation]] to [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#schedule|scheduling an event]] like a fireworks display.

> [!warning]
> It's recommended that you do **not** call [[30 Official Roblox Docs/API Reference/Globals/Roblox globals#wait|wait()]] or [[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]] within **OnRun**, as it will delay the scene's orchestration while the scene's timer continues to count up.

```lua title="Client Schema" highlight="1,14"
Schema.OnRun = function()
	print("OnRun (Client)")

	local MainAudio = Schema:audio({
		StartTime = 1,
		SoundId = "rbxassetid://1838673350",
		OnStart = function(self)
			print("Audio playing")
		end,
		OnEnd = function(self)
			print("Audio ended")
		end
	})
end
```

#### OnEndScene

The **OnEndScene** lifecycle hook is useful for cleaning up anything outstanding in the scene, such as disconnecting connections created in [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnSetup|OnSetup]] or [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnRun|OnRun]] that remain for the duration of the scene.

```lua title="Server Schema" highlight="1,8"
Schema.OnEndScene = function()
	print("OnEndScene (Server)")

	if partColorConnection then
		partColorConnection:Disconnect()
		partColorConnection = nil
	end
end
```

> [!info]
> In cases like a post-show venue which may be considered "endless," omit the **OnEndScene** lifecycle event and make the [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Time length|TimeLength]] value as long as needed to accommodate all of your schema [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Configurations|configurations]]. Also, do not [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#inform|inform]] anything to the schema, as those things will be cleaned up when the scene reaches its time length.

### Schema configurations

#### audio

Creates a [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object in the workspace which plays at a certain time. The sound is then deleted after the scene is over or after the [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] object finishes playing.

| Configuration Key | Description |
| --- | --- |
| `StartTime` | When to play the audio in relation to the scene duration, in seconds. |
| `SoundId` | Asset ID of the audio to play. |
| `OnStart` | Custom function to fire when the audio begins playing. |
| `OnEnd` | Custom function to fire when the audio finishes playing. |
| `Volume` | Volume of the [[30 Official Roblox Docs/API Reference/Classes/Sound\|Sound]] object; default is 0.5. |

```lua title="Client Schema" highlight="4,13"
Schema.OnRun = function()
	print("OnRun (Client)")

	local MainAudio = Schema:audio({
		StartTime = 1,
		SoundId = "rbxassetid://1838673350",
		OnStart = function(self)
			print("Audio playing")
		end,
		OnEnd = function(self)
			print("Audio ended")
		end
	})
end
```

> [!info]
> You can access `[audio].CurrentSoundIntensityRatio` as the sound intensity ratio of an audio configuration for use in your intervals. This acts like a pseudo pulse/tempo of a song based on how loud it has been so far.

#### animate

Creates an [[30 Official Roblox Docs/API Reference/Classes/Animation|Animation]] which plays at a certain time.

| Configuration Key | Description |
| --- | --- |
| `StartTime` | When to play the animation in relation to the scene duration, in seconds. |
| `EndTime` | Optional time when to end the animation in relation to the scene duration, in seconds. |
| `Rig` | The animation rig to play the animation on. |
| `AnimationId` | Asset ID of the animation to play. |
| `Speed` | Playback speed of the animation; default is 1. |
| `FadeInTime` | Amount of time to fade in the animation, in seconds; default is 0.2 (seconds). |
| `FadeOutTime` | Amount of time to fade out the animation, in seconds; default is 0.2 (seconds). |
| `OnStart` | Custom function to fire when the animation begins playing. |
| `OnEnd` | Custom function to fire when the animation finishes playing. |
| `Looped` | Whether to loop the animation; default is `false`. |
| `SyncToAudio` | Table defining whether to sync the animation to an [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#audio\|audio]] configuration. Accepts the following keys:• `Audio` – Reference to an [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#audio\|audio]] configuration.<br>• `StartAtAudioTime` – When to play the animation in relation to the audio's duration.<br>• `EndAtAudioTime` – Optional time at which to end the animation in relation to the audio's duration. |

```lua title="Client Schema" highlight="9,25"
Schema.OnRun = function()
	print("OnRun (Client)")

	local MainAudio = Schema:audio({
		StartTime = 1,
		SoundId = "rbxassetid://1838673350",
	})

	local DanceAnimation = Schema:animate({
		AnimationId = "rbxassetid://3695333486",
		Rig = Dummy,
		Speed = 1,
		FadeInTime = 0.1,
		FadeOutTime = 0.3,
		SyncToAudio = {
			Audio = MainAudio,
			StartAtAudioTime = 5,
		},
		OnStart = function(self)
			print("Animation playing")
		end,
		OnEnd = function(self)
			print("Animation stopped")
		end
	})
end
```

#### tween

Creates a configurable [[30 Official Roblox Docs/API Reference/Classes/Tween|Tween]] which is preserved in seeking and in dynamic join, meaning you can chain tweens at separate points in time and everything should play and sync as expected.

| Configuration Key | Description |
| --- | --- |
| `StartTimes` | Table of start times in relation to the scene duration, in seconds. |
| [[30 Official Roblox Docs/API Reference/Classes/Tween\|Tween]] | Table defining the object and properties to tween. Accepts the following keys:• `Object` – The object to tween.<br>• `Info` – [[30 Official Roblox Docs/API Reference/Datatypes/TweenInfo\|TweenInfo]] instance for the tween, defining its duration, [[30 Official Roblox Docs/API Reference/Enums/EasingStyle\|Enum.EasingStyle]], [[30 Official Roblox Docs/API Reference/Enums/EasingDirection\|Enum.EasingDirection]], etc.<br>• `Properties` – Object properties and associated target values for the tween. |
| `OnStart` | Custom function to fire when the tween begins playing. |
| `OnHeartbeat` | Custom function to fire on every [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat\|Heartbeat]]; receives the tween alpha as its second parameter. |
| `OnEnd` | Custom function to fire when the tween finishes playing. |
| `SyncToAudio` | Table defining whether to sync the tween to an [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#audio\|audio]] configuration. Accepts the following keys:• `Audio` – Reference to an [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#audio\|audio]] configuration.<br>• `StartAtAudioTimes` – Table of start times defining when to play the tween in relation to the audio's duration. |

```lua title="Client Schema" highlight="9,31"
Schema.OnRun = function()
	print("OnRun (Client)")

	local MainAudio = Schema:audio({
		StartTime = 1,
		SoundId = "rbxassetid://1838673350",
	})

	local LightFadeOut = Schema:tween({
		StartTimes = {29.884},
		Tween = {
			Object = game:GetService("Lighting"),
			Info = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
			Properties = {
				Brightness = 0,
			}
		},
		SyncToAudio = {
			Audio = MainAudio,
			StartAtAudioTimes = {5, 7.2, 9.4, 11.6},
		},
		OnStart = function(self)
			print("Tween playing")
		end,
		OnHeartbeat = function(self, alpha)
			print("Tween alpha", alpha)
		end,
		OnEnd = function(self)
			print("Tween completed")
		end,
	})
end
```

#### interval

Executes a custom callback function over a specified duration on a specified frequency, in seconds. Useful for repeating events like flashing lights, pulsing an audio's intensity, etc. The lowest possible frequency is 0 seconds, but technically the minimum frequency is always clamped to [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|Heartbeat]].

| Configuration Key | Description |
| --- | --- |
| `StartTime` | Beginning of the interval duration in relation to the scene duration, in seconds. |
| `EndTime` | End of the interval duration in relation to the scene duration, in seconds. |
| `Frequency` | How often the `OnInterval` function should fire, in seconds, with the first execution being at `StartTime`. |
| `OnStart` | Custom function to fire when the series of intervals begins. |
| `OnInterval` | Custom function to fire at every interval within the specified duration (`StartTime` to `EndTime`). |
| `OnEnd` | Custom function to fire when the series of intervals ends. |
| `SyncToAudio` | Table defining whether to sync the interval duration to an [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#audio\|audio]] configuration. Accepts the following keys:• `Audio` – Reference to an [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#audio\|audio]] configuration.<br>• `StartAtAudioTime` – When to start the interval duration in relation to the audio's duration.<br>• `EndAtAudioTime` – Optional time at which to end the interval duration in relation to the audio's duration. |

```lua title="Client Schema" highlight="9,19"
Schema.OnRun = function()
	print("OnRun (Client)")

	local MainAudio = Schema:audio({
		StartTime = 1,
		SoundId = "rbxassetid://1838673350",
	})

	local ClientTimerUpdate = Schema:interval({
		Frequency = 1,
		SyncToAudio = {
			StartAtAudioTime = 2.5,
			EndAtAudioTime = 10,
			Audio = MainAudio
		},
		OnInterval = function(self)
			print(MainAudio.Sound.TimePosition, MainAudio.CurrentSoundIntensityRatio)
		end,
	})
end
```

#### schedule

Similar to [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#interval|interval]] except that you can define multiple specific starting times for the same event, such as scheduling a fireworks display twice in a scene.

| Configuration Key | Description |
| --- | --- |
| `StartTimes` | Table of start times in relation to the scene duration, in seconds. |
| `OnStart` | Custom function to fire at every specified time in the `StartTimes` table. |
| `Skippable` | Boolean defining whether the scheduled event can be skipped for users who join late, or for when seeking ahead of a scheduled start time. If set to `false`, all event start times scheduled before the join/seek time will occur at that join/seek time. If set to `true`, only the start times scheduled **after** join/seek will occur. Default is `false`. |
| `SyncToAudio` | Table defining whether to sync the schedule to an [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#audio\|audio]] configuration. Accepts the following keys:• `Audio` – Reference to an [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#audio\|audio]] configuration.<br>• `StartAtAudioTimes` – Table of start times defining when to fire the `OnStart` function in relation to the audio's duration. |

```lua title="Client Schema" highlight="4,14"
Schema.OnRun = function()
	print("OnRun (Client)")

	Schema:schedule({
		StartTimes = {5, 27.25},
		OnStart = function(self)
			-- Initialize temporary heartbeat connection
			local tempConnection = RunService.Heartbeat:Connect(function()

			end)
			-- Inform framework of connection
			Schema:inform(tempConnection)
		end
	})
end
```

#### inform

Informs the framework of any modules, UI objects, connections, etc. which are created in the [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnRun|OnRun]] lifecycle hook, ensuring they are properly cleaned up when [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Seek scenes|seeking]]. Use cases include:

- Informing the framework of a temporary ad-hoc connection such as [[30 Official Roblox Docs/API Reference/Classes/RunService#Heartbeat|RunService.Heartbeat]] so that the connection is cleaned up when seeking to an earlier point in the scene's duration.

  ```lua title="Server Schema" highlight="8-10,12"
  Schema.OnRun = function()
  	print("OnRun (Server)")

  	Schema:schedule({
  		StartTimes = {5},
  		OnStart = function(self)
  			-- Initialize temporary heartbeat connection
  			local tempConnection = RunService.Heartbeat:Connect(function()

  			end)
  			-- Inform framework of connection
  			Schema:inform(tempConnection)
  		end
  	})
  end
  ```

- Calling a custom "cleanup" function in a [[30 Official Roblox Docs/API Reference/Classes/ModuleScript|ModuleScript]] that initializes a connection or other reference during the [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnRun|OnRun]] lifecycle hook.

  ```lua title="Server Schema" highlight="4,17,19"
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local RunService = game:GetService("RunService")

  local customModule = require(ReplicatedStorage:WaitForChild("CustomModule"))

  local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

  local Schema = EventSequencer.createSchema()

  Schema.OnRun = function()
  	print("OnRun (Server)")

  	Schema:schedule({
  		StartTimes = {5},
  		OnStart = function(self)
  			-- Call "init" function in custom module
  			customModule.init()
  			-- Call "clean" function in custom module on scene cleanup
  			Schema:inform(customModule, customModule.clean)
  		end,
  	})
  end
  ```

  ```lua title="ModuleScript - CustomModule" highlight="5,7-10,12,14-18"
  local RunService = game:GetService("RunService")

  local CustomModule = {}

  CustomModule.init = function()
  	-- Initialize heartbeat connection
  	CustomModule.connection = RunService.Heartbeat:Connect(function()

  	end)
  end

  CustomModule.clean = function()
  	-- Disconnect and clear heartbeat connection
  	if CustomModule.connection then
  		CustomModule.connection:Disconnect()
  		CustomModule.connection = nil
  	end
  end

  return CustomModule
  ```

> [!warning]
> While **inform** is critical for [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Seek scenes|seeking]] support, you should only use it to inform the framework of any module, UI object, connection, etc. that is created/initialized during the [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnRun|OnRun]] lifecycle hook. If you want to reference something throughout the entirety of the scene, simply initialize it in [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnSetup|OnSetup]] and clean it up in [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#OnEndScene|OnEndScene]].

### Functions

#### loadScene

*loadScene(sceneName: [[30 Official Roblox Docs/API Reference/Libraries/string|string]], startTime: `number` ?)*

Programmatically loads a scene by `sceneName` and starts it at `startTime` from its beginning. There will be a 5 second "grace period" for the scene to load from the server before the seek occurs and the scene starts playing. This means that if you call `loadScene("[SceneName]", 20)` at exactly 4:15:00 PM, the framework will wait 5 seconds in addition to the requested 20, kicking off the scene at 4:15:25 PM.

```lua title="Script" highlight="9,12,15"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

-- Figure out next scene to load when current scene finishes
EventSequencer.onOrchestrationFinished:Connect(function(endedSceneName)
	if endedSceneName == "PreShow" then
		-- "PreShow" ended; load the first scene in the concert
		EventSequencer.loadScene("Track1")
	elseif endedSceneName == "Track1" then
		-- "Track1" ended; load the second scene in the concert
		EventSequencer.loadScene("Track2")
	else
		-- Loop back to the pre-show scene
		EventSequencer.loadScene("PreShow")
	end
end)
```

> [!warning]
> Do not call `loadScene` from within a schema [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Schema lifecycle hooks|lifecycle hook]], as **EventSequencer** expects that scene transitions and the overall sequence of multi-scene events is handled outside of individual scenes.

#### createSchema

*createSchema(): [[30 Official Roblox Docs/API Reference/Libraries/table|table]]*

Returns an instance of the scene [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Scene schemas|schema]] to create logic for the scene.

```lua title="Client Schema" highlight="5"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

local Schema = EventSequencer.createSchema()

Schema.OnSetup = function(timePositionObject)
	print("OnSetup (Client)")
end
```

#### seek

*seek(time: `number`)*

Seeks to the `time` value, in seconds, from the currently loaded scene's beginning.

```lua title="Script" highlight="5"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

EventSequencer.seek(95.58)
```

> [!warning]
> Do not call `seek` from within a schema [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Schema lifecycle hooks|lifecycle hook]], as **EventSequencer** expects that scene seeking and [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#loadScene|loading]] is handled outside of individual scenes.

#### setSceneWarningTime

*setSceneWarningTime(endSceneTimeWindow: `number`)*

Sets the amount of time from the **end** of all scenes at which a warning is dispatched. You can detect the warning either client-side through [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#onSceneEndingWarningForClient|onSceneEndingWarningForClient]] or server-side through [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#onSceneEndingWarningForServer|onSceneEndingWarningForServer]].

```lua title="Script" highlight="9"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

-- Load scene
EventSequencer.loadScene("BeautifulScene")

-- Set warning time to 5 seconds before the scene ends
EventSequencer.setSceneWarningTime(5)

-- Detect when scene is about to end
EventSequencer.onSceneEndingWarningForServer:Connect(function()
	warn("Scene is about to end!")
end)
```

#### setSeekingPermissions

*setSeekingPermissions(permissions: [[30 Official Roblox Docs/API Reference/Libraries/table|table]])*

Grants seeking permission based on the event's [[30 Official Roblox Docs/API Reference/Classes/DataModel#PlaceId|PlaceId]] as well as specific [[30 Official Roblox Docs/API Reference/Classes/Player#UserId|UserIds]] and/or [[30 Official Roblox Docs/Projects/Groups (teams)|groups]] and roles within them. See [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Seek scenes|seek and switch scenes]] for more information.

#### getCurrentSceneEnvironment

*getCurrentSceneEnvironment(): [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] **(YIELDS)***

Returns the current scene's client-side or server-side [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Environment|Environment]] folder, depending on whether it's called from the [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Client|Client]] schema script or [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Server|Server]] schema script respectively.

> [!warning]
> Do not use this function with [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Inline mode|Inline Mode]], as that mode expects you to use existing assets and global property settings for the place, not load in scene-specific assets/properties from the scene's [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Environment|Environment]] folder. This function will **infinitely yield** if the folder doesn't exist.

```lua title="Client Schema" highlight="7, 14"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

local Schema = EventSequencer.createSchema()

local clientEnvironment
local serverEnvironment

Schema.OnSetup = function(timePositionObject)
	print("OnSetup (Client)")

	-- Access scene environments; does not apply to Inline Mode
	clientEnvironment = EventSequencer.getCurrentSceneEnvironment()
	serverEnvironment = EventSequencer.getCurrentServerEnvironmentFromClient()

	print("Current time is:", timePositionObject.Value)
end
```

```lua title="Server Schema" highlight="7,14"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

local Schema = EventSequencer.createSchema()

local serverEnvironment
local partColorConnection
local changePartColorEvent = script.Parent.Events.ChangePartColor

Schema.OnSetup = function(timePositionObject)
	print("OnSetup (Server)")

	serverEnvironment = EventSequencer.getCurrentSceneEnvironment()

	partColorConnection = changePartColorEvent.OnServerEvent:Connect(function(player, changedPart, newColor)
		serverEnvironment.changedPart.Color = newColor
	end)
end
```

#### getCurrentServerEnvironmentFromClient

*getCurrentServerEnvironmentFromClient(): [[30 Official Roblox Docs/API Reference/Classes/Folder|Folder]] **(YIELDS)***

Returns the current scene's **server-side** [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Environment|Environment]] folder. Unlike [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#getCurrentSceneEnvironment|getCurrentSceneEnvironment]], you can call this from the [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Client|Client]] schema script.

> [!warning]
> Do not use this function with [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Inline mode|Inline Mode]], as that mode expects you to use existing assets and global property settings for the place, not load in scene-specific assets/properties from the scene's [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Environment|Environment]] folder. This function will **infinitely yield** if the folder doesn't exist.

```lua title="Client Schema" highlight="8,15"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

local Schema = EventSequencer.createSchema()

local clientEnvironment
local serverEnvironment

Schema.OnSetup = function(timePositionObject)
	print("OnSetup (Client)")

	-- Access scene environments; does not apply to Inline Mode
	clientEnvironment = EventSequencer.getCurrentSceneEnvironment()
	serverEnvironment = EventSequencer.getCurrentServerEnvironmentFromClient()

	print("Current time is:", timePositionObject.Value)
end
```

#### isLoadingScene

*isLoadingScene(): `boolean`*

Called from the server to know if a scene is currently loading.

> [!warning]
> Do not use this function with [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Inline mode|Inline Mode]], as that mode expects you to use existing assets and global property settings for the place, not load in scene-specific assets/properties from the scene's [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Environment|Environment]] folder.

```lua title="Script" highlight="5"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

print(EventSequencer.isLoadingScene())

while EventSequencer.isLoadingScene() do
	task.wait()
end
print("Scene loaded")
```

### Events

#### onSceneEndingWarningForClient

Fires on the client before the scene is about to end. The default time is 3 seconds, but you can configure it through [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#setSceneWarningTime|setSceneWarningTime]]. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="6,8"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

-- Detect when scene is about to end (client-side)
EventSequencer.onSceneEndingWarningForClient:Connect(function()
	warn("Scene is about to end!")
end)
```

#### onSceneEndingWarningForServer

Fires on the server before the scene is about to end. The default time is 3 seconds, but you can configure it through [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#setSceneWarningTime|setSceneWarningTime]]. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

```lua title="Script" highlight="6,8"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

-- Detect when scene is about to end (server-side)
EventSequencer.onSceneEndingWarningForServer:Connect(function()
	warn("Scene is about to end!")
end)
```

#### onSceneLoadedForClient

Fires on the client when the scene is starting. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

> [!warning]
> Don't use this event for [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Inline mode|Inline Mode]] because that mode expects you to use existing assets and global property settings for the place, not load in scene-specific assets/properties from the scene's [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Environment|Environment]] folder.

```lua title="LocalScript" highlight="6,8"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

-- Detect when scene is starting (client-side)
EventSequencer.onSceneLoadedForClient:Connect(function()
	warn("Scene is starting!")
end)
```

#### onOrchestrationFinished

Fires on the server when a scene has reached its [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#Time length|time length]] and has effectively ended. This event receives an `endedSceneName` string name argument for the scene that just finished and you can chain off this event to conditionally [[30 Official Roblox Docs/Resources/Modules/Event Sequencer#loadScene|load another scene]]. Can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

```lua title="Script" highlight="6,17"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local EventSequencer = require(ReplicatedStorage:WaitForChild("EventSequencer"))

-- Figure out next scene to load when current scene finishes
EventSequencer.onOrchestrationFinished:Connect(function(endedSceneName)
	if endedSceneName == "PreShow" then
		-- "PreShow" ended; load the first scene in the concert
		EventSequencer.loadScene("Track1")
	elseif endedSceneName == "Track1" then
		-- "Track1" ended; load the second scene in the concert
		EventSequencer.loadScene("Track2")
	else
		-- Loop back to the pre-show scene
		EventSequencer.loadScene("PreShow")
	end
end)
```

---
*Source: [Event Sequencer](https://create.roblox.com/docs/resources/modules/event-sequencer) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
