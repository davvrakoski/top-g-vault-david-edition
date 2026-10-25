---
area: "01 Start Here"
cluster: "Start Here"
title: "First ClickDetector - Click a Part to Toggle a Light"
tags: [roblox, community-knowledge, start-here, clickdetector, input, interaction]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ClickDetector
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/reference/engine/classes/PointLight
---
# First ClickDetector - Click a Part to Toggle a Light

A **ClickDetector** makes any part clickable: a light switch, a doorbell, a button on a control panel, a collectible you tap. It is the simplest way to react to a player pointing at something in the 3D world, and it already works with mouse, touch and gamepad. This note builds a lamp you click on and off, adds hover feedback, and explains when a [[First Interaction with ProximityPrompt|ProximityPrompt]] is the better choice.

## Build the lamp

1. Insert a **Part** called `Lamp`, anchored. Set **Material** to `Neon` and **Color** to a warm yellow.
2. Inside `Lamp`, insert a **PointLight**. Set `Range` to about 16 and `Brightness` to 2.
3. Inside `Lamp`, insert a **ClickDetector**. In its properties, `MaxActivationDistance` is the farthest a player's character can be and still click (32 studs by default). Set 16 so players must walk up to it.
4. Inside `Lamp`, insert a **Script** (a server Script, so everyone sees the change).

## The script

```lua
local lamp = script.Parent
local light = lamp:WaitForChild("PointLight")
local detector = lamp:WaitForChild("ClickDetector")

local ON_COLOR = Color3.fromRGB(255, 214, 120)
local OFF_COLOR = Color3.fromRGB(70, 70, 70)

local function setOn(on: boolean)
	light.Enabled = on
	lamp.Material = if on then Enum.Material.Neon else Enum.Material.SmoothPlastic
	lamp.Color = if on then ON_COLOR else OFF_COLOR
	lamp:SetAttribute("On", on)
end

detector.MouseClick:Connect(function(player)
	print(player.Name, "clicked the lamp")
	setOn(not light.Enabled)
end)

setOn(true)
```

`MouseClick` passes the **player who clicked**, which is how you give a reward to the right person or check if they are allowed to use the switch.

## Hover feedback

Players need to know something is clickable. Three easy options:

- **Cursor:** set the ClickDetector's `CursorIcon` to an image asset ID so the mouse changes over the lamp.
- **Highlight on hover:** `MouseHoverEnter` and `MouseHoverLeave` fire when the pointer moves on and off. Do the visual part in a **LocalScript** (in `StarterPlayerScripts`) so only the hovering player sees it:

```lua
local lamp = workspace:WaitForChild("Lamp")
local detector = lamp:WaitForChild("ClickDetector")
local highlight = Instance.new("Highlight")
highlight.FillTransparency = 1
highlight.Enabled = false
highlight.Parent = lamp

detector.MouseHoverEnter:Connect(function() highlight.Enabled = true end)
detector.MouseHoverLeave:Connect(function() highlight.Enabled = false end)
```

- **A label:** a small BillboardGui reading "Click" above the part.

The docs warn that hover enter and leave do not always arrive in pairs, so never let your game logic depend on them; use them only for looks.

## Devices

- **Touch:** tapping the part fires `MouseClick`.
- **Gamepad:** the default control scripts bind the right trigger (`ButtonR2`) to click, aiming with the screen-centre dot.
- **ClickDetectors work inside a BasePart, a Model or a Folder.** Put one in a Model and the whole model is clickable.

## ClickDetector or ProximityPrompt?

| Use a ClickDetector when | Use a ProximityPrompt when |
| --- | --- |
| Many small clickable things (buttons on a panel) | One clear action per object (open, talk, buy) |
| Clicking from a distance is the fun part | Players should walk up first |
| Desktop-first, point-and-click games | You want a key hint shown on screen (E, X, tap) |

On phones and consoles prompts are usually easier to discover, because the on-screen hint tells players what to press.

## Pitfalls

- **A LocalScript inside the part does nothing:** LocalScripts do not run in Workspace. Use a server Script there, or put the LocalScript in `StarterPlayerScripts` and point at the part.
- **Nothing happens on click:** check `MaxActivationDistance` (too small?), and that no invisible part sits in front of the lamp catching the click.
- **Spam clicking:** add a short debounce if the click triggers a sound, reward or animation (see [[Events and Connections for Beginners - Connect, Once, Wait and Debounce]]).
- **Trusting the click for rewards:** fine for a light. For money, still check on the server that the player is close and allowed.

## Related
[[00 START HERE - Top G Vault]] · [[First Interaction with ProximityPrompt]] · [[Highlight Instance - Outlines, X-Ray and the 255 Limit]] · [[ClickDetector]] · [[Starter - First Key Press - UserInputService, ContextActionService and Input Actions]]
