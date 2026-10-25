---
title: "Selfie Mode"
description: "The Selfie Mode module lets players capture screenshots to commemorate fun moments."
area: "30 Official Roblox Docs"
cluster: "Resources"
source: "https://create.roblox.com/docs/resources/modules/selfie-mode"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Selfie Mode module lets players capture screenshots to commemorate fun moments.*

Players already take screenshots to commemorate fun moments in games. The **SelfieMode** [[30 Official Roblox Docs/Resources/Modules/Developer modules|developer module]] lets players capture a cleaner memory of that moment without the chat window or player list, while also supporting filter effects, hiding of other characters, and posing.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/developer-modules/selfie-mode/Showcase.mp4)

## Module Usage

### Installation

To use the **SelfieMode** module in a game:

1. From Studio's **Window** menu or **Home** tab toolbar, open the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) and select the **Creator Store** tab.

   *(image in the full Top G Vault)*

1. Make sure the **Models** sorting is selected, then click the **See All** button for **Categories**.

   *(image in the full Top G Vault)*

1. Locate and click the **Packages** tile.

1. Locate the **Selfie Mode** module and click it, or drag-and-drop it into the 3D view.

   *(image in the full Top G Vault)*

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, move the entire **SelfieMode** package into [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. Upon running the game the module will begin running.

### Configuration

The module is preconfigured to work for most use cases, but you can easily customize it through the [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#configure|configure]] function.

1. In **StarterPlayerScripts**, create a new [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] and rename it to **ConfigureSelfieMode**.
1. Paste the following code into the new script.

   ```lua title="LocalScript - ConfigureSelfieMode" highlight="5-7"
   local ReplicatedStorage = game:GetService("ReplicatedStorage")

   local SelfieMode = require(ReplicatedStorage.SelfieMode)

   SelfieMode.configure({
   	disableCharacterMovement = true
   })
   ```

### Character Movement

It may be advantageous to prevent the player's character from moving while in selfie mode. You can achieve this by setting `disableCharacterMovement` to true in a [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#configure|configure]] call.

```lua title="LocalScript - ConfigureSelfieMode" highlight="6"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

SelfieMode.configure({
	disableCharacterMovement = true
})
```

### Selfie Mode Actions

**SelfieMode** comes with the following [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action|actions]], each of which you can use with the [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#activateAction|activateAction]], [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#deactivateAction|deactivateAction]], and [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#toggleAction|toggleAction]] functions, or detect through the [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#actionActivated|actionActivated]] and [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#actionDeactivated|actionDeactivated]] events.

#### Depth-of-Field

By default, **SelfieMode** shows a generic **depth‑of‑field** effect (subtle blur of the background) when a player toggles the action.

##### Off

*(image in the full Top G Vault)*

##### On

*(image in the full Top G Vault)*

> [!warning]
> This effect does not render on mobile devices such as phones and tablets. As such, it will not be offered as an action on those devices.
>
> On non-mobile devices, the player's graphics quality must be eight or higher to render depth‑of‑field. If their graphics quality is less than eight, they'll be prompted to increase it.

To change the default depth‑of‑field effect, set `depthOfFieldEffect` to your own [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect|DepthOfFieldEffect]] instance in a [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#configure|configure]] call.

```lua title="LocalScript - ConfigureSelfieMode" highlight="5-9, 12"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

local customDepthOfField = Instance.new("DepthOfFieldEffect")
customDepthOfField.NearIntensity = 0
customDepthOfField.FarIntensity = 1
customDepthOfField.FocusDistance = 5
customDepthOfField.InFocusRadius = 5

SelfieMode.configure({
	depthOfFieldEffect = customDepthOfField
})
```

#### Lock Gaze

The **Lock Gaze** toggle causes the player's character to look at the camera while setting up the selfie pose, within a realistic range of how far their neck can turn.

#### Hide Others

By default, other characters are visible alongside the player's character. Players can obtain a perfect solo shot by clicking the **Hide Others** button. When toggled on, other characters fade out of view and remain invisible until the action is toggled off.

#### Filter

The **Filter** action lets the player apply a preset filter from the options **Pop**, **Soft**, **Antique**, **Cute**, **Dramatic**, and **Monochrome**.

##### Soft

*(image in the full Top G Vault)*

##### Dramatic

*(image in the full Top G Vault)*

##### Monochrome

*(image in the full Top G Vault)*

#### Pose

The **Pose** action lets the player select a preset pose from the options **Cheer**, **Clapping**, **Dolphin**, **Flossing**, **Guitar**, **Jump Wave**, **Louder**, **Top Rock**, **Twirl**, and **Wave**.

##### Flossing

*(image in the full Top G Vault)*

##### Louder

*(image in the full Top G Vault)*

##### Twirl

*(image in the full Top G Vault)*

## API Reference

### Types

#### Action

Each action is represented by a dictionary with the following key-value pairs:

| Key | Type | Description |
| --- | --- | --- |
| `name` | string | Name of the action, shown first in tooltips. |
| `description` | string | Description of the action, shown after **name** in tooltips. |
| `icon` | string | Asset ID for the action's icon. |
| `activeIcon` | string | Asset ID for the action's icon in "active" state. Can only be used on parent actions, not sub-actions. |
| `actions` | table | Optional list of sub-actions. This allows you to create submenus of various other actions. |
| `parent` | [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action\|Action]] | The parent of the action; this only applies to a sub-action and points to the action that contains it. |
| `onActivated` | function | Optional callback function that runs when a player activates an action or sub-action. Typically, if an action contains sub-actions, only the sub-actions will need a callback defined as a means of knowing that the player activated the sub-action and did not simply "expand" the parent action. |

```lua title="LocalScript"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

SelfieMode.actionActivated:Connect(function(action)
	print(action.name, "activated")
end)

SelfieMode.actionDeactivated:Connect(function(action)
	print(action.name, "deactivated")
end)
```

### Enums

#### SelfieMode.Action

**SelfieMode** comes with several [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action|actions]]. You can use this enum with the [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#activateAction|activateAction]], [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#deactivateAction|deactivateAction]], and [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#toggleAction|toggleAction]] functions.

| Name | Summary |
| --- | --- |
| `DepthOfField` | Reference to the [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Depth-of-Field\|Depth‑of‑Field]] action. |
| `LockGaze` | Reference to the [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Lock Gaze\|Lock Gaze]] action. |
| `HideOthers` | Reference to the [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Hide Others\|Hide Others]] action. |
| `Filter` | Reference to the [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Filter\|Filter]] action. |
| `Pose` | Reference to the [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Pose\|Pose]] action. |

```lua title="LocalScript" highlight="6"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

-- Activate "Filter" action
SelfieMode.activateAction(SelfieMode.Action.Filter)
```

### Functions

#### configure

*configure(config: [[30 Official Roblox Docs/API Reference/Libraries/table|table]])*

Overrides default configuration options through the following keys/values in the `config` table. This function can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

| Key | Description | Default |
| --- | --- | --- |
| `disableCharacterMovement` | If true, prevents character from moving while selfie mode is open. | false |
| `depthOfFieldEffect` | Optional custom [[30 Official Roblox Docs/API Reference/Classes/DepthOfFieldEffect\|DepthOfFieldEffect]] instance that appears when the player toggles the [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Depth-of-Field\|Depth of Field]] action. |  |

```lua title="LocalScript - ConfigureSelfieMode" highlight="6"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

SelfieMode.configure({
	disableCharacterMovement = true
})
```

#### openSelfieMode

*openSelfieMode()*

A player will typically open selfie mode with the "camera" button on the right side of the screen, but this function lets you open it through code. When implementing a custom button as shown below, you should disable the default button through [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#setHudButtonEnabled|setHudButtonEnabled]]. This function can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="8, 12"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

local button = script.Parent

-- Remove the default button
SelfieMode.setHudButtonEnabled(false)

-- Connect the custom button
button.Activated:Connect(function()
	SelfieMode.openSelfieMode()
end)
```

#### closeSelfieMode

*closeSelfieMode()*

A player will typically close selfie mode with the **⊗** button at the bottom of the screen, but this function lets you close it through code. Can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="5"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

SelfieMode.closeSelfieMode()
```

#### isSelfieModeOpen

*isSelfieModeOpen(): `boolean`*

Returns `true` if selfie mode is open as a result of player action or through [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#openSelfieMode|openSelfieMode]]. This function can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="7"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

SelfieMode.openSelfieMode()

print(SelfieMode.isSelfieModeOpen())
```

#### setHudButtonEnabled

*setHudButtonEnabled()*

Sets whether the default button to enter selfie mode is shown. Useful when implementing [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#openSelfieMode|openSelfieMode]] through a custom UI button. This function can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="8, 12"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

local button = script.Parent

-- Remove the default button
SelfieMode.setHudButtonEnabled(false)

-- Connect the custom button
button.Activated:Connect(function()
	SelfieMode.openSelfieMode()
end)
```

#### getAction

*getAction(action: [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#SelfieMode.Action|SelfieMode.Action]]): [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action|Action]]*

Gets an [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action|Action]] type through a [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#SelfieMode.Action|SelfieMode.Action]] enum.

```lua title="LocalScript" highlight="5"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

local lockGazeAction = SelfieMode.getAction(SelfieMode.Action.LockGaze)
```

#### activateAction

*activateAction(action: [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action|SelfieMode.Action]])*

Programmatically activates one of the default [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Selfie Mode Actions|actions]]. This is the same as when a player toggles the action on from the action bar. Can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="6"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

-- Activate "Filter" action
SelfieMode.activateAction(SelfieMode.Action.Filter)
```

#### deactivateAction

*deactivateAction(action: [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action|SelfieMode.Action]])*

Programmatically deactivates one of the default [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Selfie Mode Actions|actions]]. This is the same as when a player toggles the action off from the action bar. Can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="6"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

-- Deactivate "Filter" action
SelfieMode.deactivateAction(SelfieMode.Action.Filter)
```

#### toggleAction

*toggleAction(action: [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action|SelfieMode.Action]]): `boolean`*

Toggles an [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Selfie Mode Actions|action]] on if it's off, or toggles it off if it's on. This is the same as when a player clicks the action from the action bar. Returns the new "is toggled on" state as a boolean. Can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="5, 7"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

local lockGazeAction = SelfieMode.getAction(SelfieMode.Action.LockGaze)

local isEnabled = SelfieMode.toggleAction(lockGazeAction)

if isEnabled then
	print("Activated", lockGazeAction.name)
else
	print("Deactivated", lockGazeAction.name)
end
```

#### setTheme

*setTheme(theme: [[30 Official Roblox Docs/API Reference/Libraries/table|table]])*

Configures the selfie mode theme, including text size, font, button/tooltip colors, and more. This function can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

##### General

| Key | Description | Default |
| --- | --- | --- |
| `textSize` | Size of all text. | 16 |
| `font` | Font used across all UI ([[30 Official Roblox Docs/API Reference/Enums/Font\|Enum.Font]]). | [[30 Official Roblox Docs/API Reference/Enums/Font\|GothamMedium]] |
| `padding` | Main padding used for laying out UI elements ([[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]]). | (0, 12) |
| `paddingSmall` | Smaller padding used for applying subtle margins between elements ([[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]]). | (0, 6) |
| `paddingScreen` | Padding used around the screen edges to give selfie mode some breathing room ([[30 Official Roblox Docs/API Reference/Datatypes/UDim\|UDim]]). | (0, 24) |
| `backgroundColor` | Background color used for the bar that displays the actions ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). | [0, 0, 0] |
| `scrollBarColor` | Color of the scrollbar used in [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame\|ScrollingFrame]] elements of the module ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). | [255, 255, 255] |

##### Buttons and Tooltips

| Key | Description | Default |
| --- | --- | --- |
| `openButtonBackgroundColor` | Background color of the HUD button on the right side of the screen used to open selfie mode ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). | [255, 255, 255] |
| `openButtonIconColor` | Color of the HUD button's camera icon ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). | [0, 0, 0] |
| `closeButtonBackgroundColor` | Background color of the "close" button ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). | [0, 0, 0] |
| `closeButtonIconColor` | Icon color for the "close" button ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). | [255, 255, 255] |
| `actionButtonBackgroundColor` | Background color of the various action buttons used for toggling actions ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). | [255, 255, 255] |
| `actionButtonIconColor` | Icon color for the various action buttons ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). | [0, 0, 0] |
| `tooltipBackgroundColor` | Background color of tooltips and notifications ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). | [0, 0, 0] |
| `tooltipNameColor` | Text color of tooltip names ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). Also used as the text color for notifications. | [255, 255, 255] |
| `tooltipDescriptionColor` | Color of tooltip descriptions, slightly faded to give focus to tooltip names ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). Not used for notifications. | [169, 169, 169] |

```lua title="LocalScript" highlight=""
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

SelfieMode.setTheme({
	textSize = 20,
	font = Enum.Font.Michroma,
	backgroundColor = Color3.fromRGB(0, 40, 75),
})
```

#### setEnabled

*setEnabled(isEnabled: `boolean`)*

Sets whether selfie mode is enabled or not. When disabled, all UI for the module is removed and all events are disconnected. This function can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="5"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

SelfieMode.setEnabled(false)
```

### Events

#### selfieModeOpened

Fires when the player opens selfie mode or when [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#openSelfieMode|openSelfieMode]] is called. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="5-7"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

SelfieMode.selfieModeOpened:Connect(function()
	print("Selfie mode open")
end)
```

#### selfieModeClosed

Fires when the player closes selfie mode or when [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#closeSelfieMode|closeSelfieMode]] is called. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="5-7"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

SelfieMode.selfieModeClosed:Connect(function()
	print("Selfie mode closed")
end)
```

#### actionActivated

| Parameters |  |
| --- | --- |
| action: [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action\|SelfieMode.Action]] | The activated [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action\|Action]]. |

Fires when an action is activated; this may be one of the primary actions like [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Depth-of-Field|Depth of Field]], [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Lock Gaze|Lock Gaze]], or [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Hide Others|Hide Others]]; alternatively it may be a sub-action like a [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Filter|filter]] or [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Pose|pose]]. The connected function receives the activated [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action|Action]]. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="5-7"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

SelfieMode.actionActivated:Connect(function(action)
	print(action.name, "activated")
end)
```

#### actionDeactivated

| Parameters |  |
| --- | --- |
| action: [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action\|SelfieMode.Action]] | The deactivated [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action\|Action]]. |

Fires when a primary action or sub-action is deactivated. The connected function receives the deactivated [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Action|Action]]. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="5-7"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

SelfieMode.actionDeactivated:Connect(function(action)
	print(action.name, "deactivated")
end)
```

#### filterChanged

| Parameters |  |
| --- | --- |
| newFilter: [[30 Official Roblox Docs/API Reference/Libraries/string\|string]] | The new filter. |
| oldFilter: [[30 Official Roblox Docs/API Reference/Libraries/string\|string]] | The previous filter. |

Fires when a [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Filter|filter]] is applied or removed. The connected function receives the new filter name and the old filter name. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="5-7"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

SelfieMode.filterChanged:Connect(function(newFilter, oldFilter)
	print("Filter changed from", oldFilter, "to", newFilter)
end)
```

#### poseChanged

| Parameters |  |
| --- | --- |
| newPose: [[30 Official Roblox Docs/API Reference/Libraries/string\|string]] | The new pose. |
| oldPose: [[30 Official Roblox Docs/API Reference/Libraries/string\|string]] | The previous pose. |

Fires when a [[30 Official Roblox Docs/Resources/Modules/Selfie Mode#Pose|pose]] is applied or removed. The connected function receives the new pose name and the old pose name. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

```lua title="LocalScript" highlight="5-7"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SelfieMode = require(ReplicatedStorage.SelfieMode)

SelfieMode.poseChanged:Connect(function(newPose, oldPose)
	print("Pose changed from", oldPose, "to", newPose)
end)
```

---
*Source: [Selfie Mode](https://create.roblox.com/docs/resources/modules/selfie-mode) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
