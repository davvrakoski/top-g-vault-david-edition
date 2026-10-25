---
title: "Surface Art"
description: "The Surface Art module lets players literally leave their mark in a game."
area: "30 Official Roblox Docs"
cluster: "Resources"
source: "https://create.roblox.com/docs/resources/modules/surface-art"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Surface Art module lets players literally leave their mark in a game.*

Players often enjoy feeling like they're a part of constructing the space they're in. The **SurfaceArt** [[30 Official Roblox Docs/Resources/Modules/Developer modules|developer module]] lets players literally leave their mark in a game.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/developer-modules/surface-art/Showcase.mp4)

> [!warning]
> By default, a player can place 2 pieces of art across all of the tagged surfaces in the workspace. All of a player's art will be removed when they leave the game.

## Module Usage

### Installation

To use the **SurfaceArt** module in a game:

1. From Studio's **Window** menu or **Home** tab toolbar, open the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) and select the **Creator Store** tab.

   *(image in the full Top G Vault)*

1. Make sure the **Models** sorting is selected, then click the **See All** button for **Categories**.

   *(image in the full Top G Vault)*

1. Locate and click the **Packages** tile.

1. Locate the **Surface Art** module and click it, or drag-and-drop it into the 3D view.

   *(image in the full Top G Vault)*

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, move the entire **SurfaceArt** model into [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. Upon running the game the module will begin running.

### Positioning the Canvas

The module comes with one **SurfaceCanvas** model that you can position in the 3D world. This model is what players will interact with to place art on its surface.

1. Locate the **SurfaceCanvas** mesh inside the **Workspace** folder of the module's main folder.

   *(image in the full Top G Vault)*

1. Move it into the top-level **Workspace** hierarchy and position it where desired.

   *(image in the full Top G Vault)*

1. Upon publishing/running a test session, players will be able to interact with the object via a [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] and place art on the defined surface.

   *(image in the full Top G Vault)*

> [!info]
> It is not required that you use the packaged mesh for placing art. The module uses [[30 Official Roblox Docs/API Reference/Classes/CollectionService|CollectionService]] to locate parts tagged as `SurfaceCanvas` and make them operate as canvases. Any tagged canvas must be a [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]] and it should have an [[30 Official Roblox Docs/Studio/Properties window#Instance attributes|attribute]] defining the surface face as outlined in [[30 Official Roblox Docs/Resources/Modules/Surface Art#Changing the Canvas Face|Changing the Canvas Face]].

### Changing the Canvas Face

Under the hood, the module uses a [[30 Official Roblox Docs/API Reference/Classes/SurfaceGui|SurfaceGui]] to display art items. To configure which surface the art appears on:

1. Select the **SurfaceCanvas** mesh.
1. At the bottom of the **Properties** window, locate the **SurfaceCanvasFace** attribute with a default value of **Right**.

   *(image in the full Top G Vault)*

1. Click the attribute and enter one of six values that describe a [[30 Official Roblox Docs/API Reference/Enums/NormalId|Enum.NormalId]].

| Attribute Value | Corresponding Normal ID |
| --- | --- |
| **Front** | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId.Front]] |
| **Back** | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId.Back]] |
| **Right** | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId.Right]] |
| **Left** | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId.Left]] |
| **Top** | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId.Top]] |
| **Bottom** | [[30 Official Roblox Docs/API Reference/Enums/NormalId\|Enum.NormalId.Bottom]] |

### Using Custom Art Assets

> [!info]
> Currently, the surface art module only supports using the same set of assets for all tagged canvases.

To better fit the theme of your game, you may use your own set of custom assets instead of the defaults. This can be done via the [[30 Official Roblox Docs/Resources/Modules/Surface Art#configure|configure]] function, called from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] in **ServerScriptService**.

```lua title="Script" highlight="5-14, 16-18"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SurfaceArt = require(ReplicatedStorage.SurfaceArt)

local customAssets = {
	CustomAsset1 = {
		name = "Custom Asset 1",
		assetId = "rbxassetid://7322508294",
	},
	CustomAsset2 = {
		name = "Custom Asset 2",
		assetId = "rbxassetid://7322547665",
	},
}

SurfaceArt.configure({
	assets = customAssets,
})
```

### Clearing All Canvases

To remove all existing art from all canvases in the world, call the [[30 Official Roblox Docs/Resources/Modules/Surface Art#removeAllArt|removeAllArt]] function from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

```lua title="Script" highlight="5"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SurfaceArt = require(ReplicatedStorage.SurfaceArt)

SurfaceArt.removeAllArt()
```

### Showing Custom Effects

There may be cases where you'd like to include additional visual effects when an artwork is placed. This module exposes an event called [[30 Official Roblox Docs/Resources/Modules/Surface Art#artChanged|artChanged]] on the client that you can connect to and add your own logic.

```lua title="LocalScript" highlight="22"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SurfaceArt = require(ReplicatedStorage.SurfaceArt)

local function createParticleEmitter(canvas, position)
	local attachment = Instance.new("Attachment")
	attachment.Position = canvas.CFrame:PointToObjectSpace(position)
	attachment.Axis = Vector3.new(0, 0, 1)
	attachment.SecondaryAxis = Vector3.new(1, 0, 0)
	attachment.Parent = canvas

	local particleEmitter = Instance.new("ParticleEmitter")
	particleEmitter.Speed = NumberRange.new(50)
	particleEmitter.Rate = 50
	particleEmitter.Color = ColorSequence.new(Color3.fromRGB(128, 254, 7))
	particleEmitter.SpreadAngle = Vector2.new(35, 35)
	particleEmitter.Parent = attachment

	return attachment
end

SurfaceArt.artChanged:Connect(function(canvas, spot, spotPosition, artId, ownerId)
	if artId then
		-- Show some sparkles for 3 seconds
		task.spawn(function()
			local emitterAttachment = createParticleEmitter(canvas, spotPosition)
			task.wait(3)
			emitterAttachment:Destroy()
		end)
	end
end)
```

## API Reference

### Types

#### SurfaceArtAsset

Images to be used as art for the canvas are represented by a table with two values.

| Key | Description |
| --- | --- |
| `name` | Metadata display name. |
| `assetId` | Asset ID of the image to include. |

### Functions

#### configure

*configure(config: [[30 Official Roblox Docs/API Reference/Libraries/table|table]])*

Overrides default configuration options through the following keys/values in the `config` table. This function can only be called from a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]].

##### General

| Key | Description | Default |
| --- | --- | --- |
| `enabled` | Toggles the module's functionality on or off. | true |
| `assets` | List of [[30 Official Roblox Docs/Resources/Modules/Surface Art#SurfaceArtAsset\|SurfaceArtAsset]] types. | (see code below) |
| `quotaPerPlayer` | Maximum number of art pieces that can be placed by each player. | 2 |

##### Appearance

| Key | Description | Default |
| --- | --- | --- |
| `rowsPerCanvas` | Number of rows in the canvas grid. | 2 |
| `colsPerCanvas` | Number of columns in the canvas grid. | 5 |
| `itemsPerPage` | Number of items to skip when paging left and right. | 3 |
| `canvasPaddingLeft` | Left padding for the surface canvas ([[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]]). | (0, 8) |
| `canvasPaddingRight` | Right padding for the surface canvas ([[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]]). | (0, 8) |
| `canvasPaddingTop` | Top padding for the surface canvas ([[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]]). | (0, 8) |
| `canvasPaddingBottom` | Bottom padding for the surface canvas ([[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]]). | (0, 8) |
| `promptImage` | Icon shown in the proximity prompt to enter art selection view. | "rbxassetid://8076723774" |
| `leftArrowPageImage` | Image for the left arrow to flip to the previous page. | "rbxassetid://6998633654" |
| `leftArrowItemImage` | Image for the left arrow to select the previous art item. | "rbxassetid://8072765021" |
| `rightArrowPageImage` | Image for the right arrow to flip to the next page. | "rbxassetid://6998635824" |
| `rightArrowItemImage` | Image for the right arrow to select the next art item. | "rbxassetid://8072764852" |

##### Interaction

| Key | Description | Default |
| --- | --- | --- |
| `promptKeyCode` | Keyboard shortcut used to activate the prompt to enter art selection ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]]). | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|E]] |
| `promptRequiresLineOfSight` | Boolean value that determines if the proximity prompt has to be in line of sight between user and canvas. | true |
| `promptMaxActivationDistance` | Maximum distance a player's character can be from the canvas for the prompt to appear. | 10 |
| `promptExclusivity` | [[30 Official Roblox Docs/API Reference/Enums/ProximityPromptExclusivity\|Enum.ProximityPromptExclusivity]] specifying which prompts can be shown at the same time. | [[30 Official Roblox Docs/API Reference/Enums/ProximityPromptExclusivity\|OnePerButton]] |
| `usePageHotkeys` | Whether page hotkeys are used. If true, `nextPageKey` and `prevPageKey` are used to cycle between pages. | true |
| `nextPageKey` | Key used to cycle to the next page of artwork ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]]). | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|E]] |
| `nextItemKey` | Key used to cycle to the next item of artwork ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]]). | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Right]] |
| `prevPageKey` | Key used to cycle to the previous page of artwork ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]]). | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Q]] |
| `prevItemKey` | Key used to cycle to the previous item of artwork ([[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode]]). | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Left]] |

```lua title="Script" highlight="5-9"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SurfaceArt = require(ReplicatedStorage.SurfaceArt)

SurfaceArt.configure({
	quotaPerPlayer = 4,
	promptKeyCode = Enum.KeyCode.T,
	promptMaxActivationDistance = 8,
})
```

#### getCanvases

*getCanvases(): [[30 Official Roblox Docs/API Reference/Libraries/table|table]]*

Returns all of the canvases tagged with the `SurfaceCanvas` tag.

```lua title="Script" highlight="5"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SurfaceArt = require(ReplicatedStorage.SurfaceArt)

local canvases = SurfaceArt.getCanvases()
```

#### placeArt

*placeArt(player: [[30 Official Roblox Docs/API Reference/Classes/Player|Player]], canvas: [[30 Official Roblox Docs/API Reference/Classes/BasePart|BasePart]])*

Places an art piece programmatically on behalf of a player. Note that the `canvas` object must be tagged with the `SurfaceCanvas` tag when the server is initialized. It is recommended to use this only with a canvas returned from [[30 Official Roblox Docs/Resources/Modules/Surface Art#getCanvases|getCanvases]].

```lua title="Script" highlight="9-10"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SurfaceArt = require(ReplicatedStorage.SurfaceArt)

local remoteEvent = ReplicatedStorage:WaitForChild("SurfaceArtRemoteEvent")

remoteEvent.OnServerEvent:Connect(function(player)
	-- Place the Bloxy Award from default art assets into the first canvas
	local canvases = SurfaceArt.getCanvases()
	SurfaceArt.placeArt(player, canvases[1], "BloxyAward")
end)
```

#### removeAllArt

*removeAllArt()*

Removes all artwork from all surfaces.

```lua title="Script" highlight="5"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SurfaceArt = require(ReplicatedStorage.SurfaceArt)

SurfaceArt.removeAllArt()
```

### Events

#### artChanged

Fires when an artwork is changed at a particular location on a canvas. When an artwork is removed, `artId` will be `nil`. Note that a [[30 Official Roblox Docs/API Reference/Datatypes/Vector3|Vector3]] value is passed as the third parameter to the event handler so that you can position a [[30 Official Roblox Docs/Resources/Modules/Surface Art#Showing Custom Effects|custom effect]] at the exact position where the artwork is placed. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

| Parameters |  |
| --- | --- |
| canvas: [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | Canvas upon which the artwork was changed. |
| spot: [[30 Official Roblox Docs/API Reference/Classes/Frame\|Frame]] | Internal [[30 Official Roblox Docs/API Reference/Classes/Frame\|Frame]] that contains the artwork [[30 Official Roblox Docs/API Reference/Classes/ImageLabel\|ImageLabel]]. |
| spotPosition: [[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]] | Exact position where the artwork was placed. |
| artId: [[30 Official Roblox Docs/API Reference/Libraries/string\|string]] | Asset ID of the new artwork. |
| ownerUserId: `number` | [[30 Official Roblox Docs/API Reference/Classes/Player#UserId\|UserId]] of the player who placed the art. |

```lua title="LocalScript" highlight="5-9"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SurfaceArt = require(ReplicatedStorage.SurfaceArt)

SurfaceArt.artChanged:Connect(function(canvas, spot, spotPosition, artId, ownerId)
	print("Art placed at:", spotPosition)
	print("Art asset ID:", artId)
	print("Art placed by:", ownerId)
end)
```

#### promptShown

Fires when a canvas interaction prompt is shown to a player. The connected function receives the canvas upon which the prompt is showing. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

| Parameters |  |
| --- | --- |
| canvas: [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | Canvas upon which the prompt is showing. |

```lua title="LocalScript" highlight="6-8"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local SurfaceArt = require(ReplicatedStorage.SurfaceArt)

SurfaceArt.promptShown:Connect(function(canvas)
	print(Players.LocalPlayer, canvas)
end)
```

#### promptHidden

Fires when a canvas interaction prompt is hidden. The connected function receives the canvas upon which the prompt was showing. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

| Parameters |  |
| --- | --- |
| canvas: [[30 Official Roblox Docs/API Reference/Classes/BasePart\|BasePart]] | Canvas upon which the prompt was showing. |

```lua title="LocalScript" highlight="6-8"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local SurfaceArt = require(ReplicatedStorage.SurfaceArt)

SurfaceArt.promptClosed:Connect(function(canvas)
	print(Players.LocalPlayer, canvas)
end)
```

#### selectorShown

Fires when the surface art selector UI is shown to a player. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="6-8"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local SurfaceArt = require(ReplicatedStorage.SurfaceArt)

SurfaceArt.selectorShown:Connect(function()
	print(Players.LocalPlayer, "opened surface art selector")
end)
```

#### selectorHidden

Fires when the surface art selector UI is hidden for a player. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="6-8"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local SurfaceArt = require(ReplicatedStorage.SurfaceArt)

SurfaceArt.selectorHidden:Connect(function()
	print(Players.LocalPlayer, "closed surface art selector")
end)
```

---
*Source: [Surface Art](https://create.roblox.com/docs/resources/modules/surface-art) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
