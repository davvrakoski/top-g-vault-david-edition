---
title: "Loading screens"
description: "Explains the process of customizing the loading screen when users are connecting to your game."
area: "30 Official Roblox Docs"
cluster: "Players"
source: "https://create.roblox.com/docs/players/loading-screens"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the process of customizing the loading screen when users are connecting to your game.*

Roblox displays a default loading screen when users are connecting to a game, but you can personalize your game with a custom loading screen that contains static or animated content.

> [!info]
> This article covers the loading screens that display when a user initially joins a game. To customize loading screens that display when a user teleports between places, see [[30 Official Roblox Docs/Projects/Teleport between places#Create custom teleport screens|Teleport between places]].

## Implementation

To display a custom loading screen, you can either design a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] instance directly within a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], or you can reference a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] object in your place hierarchy. Both options utilize [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]], as this service that replicates instances to clients before anything else is replicated. This ensures that your loading screen is the first thing users see when they enter your game.

### From script

To design and display a custom loading screen entirely from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]:

1. In [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]], create a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].
2. Paste in the following code sample to create and customize a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] object. You can modify the following code with your own values to create your design.

```lua title="Script-Created Loading Screen"
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local loadingScreen = Instance.new("ScreenGui")
loadingScreen.IgnoreGuiInset = true
loadingScreen.Parent = playerGui

-- Replace ScreenGui values with your own
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(0, 20, 40)
textLabel.Font = Enum.Font.DenkOne
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading"
textLabel.TextSize = 32
textLabel.Parent = loadingScreen

-- Remove the default loading screen
ReplicatedFirst:RemoveDefaultLoadingScreen()

task.wait(5)  -- Force custom loading screen to appear for a minimum time

if not game:IsLoaded() then
	game.Loaded:Wait()
end

loadingScreen:Destroy()
```

### From existing GUI

Instead of creating a loading screen [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] entirely through a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]], you can also reference an existing [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] in your place hierarchy. Ensure that your game includes the referenced [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] within [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] and that the [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] includes UI elements like [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabels]] and [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabels]].

To demonstrate this process, the following [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] references a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] named **LoadingScreen** within [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]], then it removes the default loading screen so the only loading screen a player can see is your own custom loading screen.

> [!success]
> Remember that you can design your loading screen [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] within the [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]] container to preview it, then move it to [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] once you're satisfied with the result.

```lua title="Reference Existing Loading Screen"
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local loadingScreen = ReplicatedFirst:FindFirstChild("LoadingScreen")
if loadingScreen then
	loadingScreen.IgnoreGuiInset = true
	loadingScreen.Parent = playerGui

	-- Remove the default loading screen
	ReplicatedFirst:RemoveDefaultLoadingScreen()

	task.wait(5)  -- Force screen to appear for a minimum number of seconds

	if not game:IsLoaded() then
		game.Loaded:Wait()
	end

	loadingScreen:Destroy()
end
```

## Add animations

In addition to static custom loading screens, you can add animations to enhance the loading screen and indicate loading progress. The easiest way to do this is to create a UI element, such as a [[30 Official Roblox Docs/API Reference/Classes/TextLabel|TextLabel]] or [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]], then to animate it using [[30 Official Roblox Docs/API Reference/Classes/TweenService|TweenService]]. For example, the following code sample creates a new [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] with a child [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]], removes the default loading screen, then [[30 Official Roblox Docs/API Reference/Classes/TweenService|TweenService]] fades in and rotates the central elements until the game loads.

[Video: Loading-Animation.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/ui/misc/Loading-Animation.mp4)

```lua title="Script-Created Loading Screen (Animated)"
local Players = game:GetService("Players")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local loadingScreen = Instance.new("ScreenGui")
loadingScreen.IgnoreGuiInset = true
loadingScreen.Parent = playerGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(0, 20, 40)
textLabel.Font = Enum.Font.DenkOne
textLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
textLabel.Text = "Loading"
textLabel.TextSize = 32
textLabel.TextTransparency = 1
textLabel.Parent = loadingScreen

local loadingRing = Instance.new("ImageLabel")
loadingRing.Size = UDim2.new(0, 256, 0, 256)
loadingRing.BackgroundTransparency = 1
loadingRing.Image = "rbxassetid://4965945816"
loadingRing.AnchorPoint = Vector2.new(0.5, 0.5)
loadingRing.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingRing.ImageTransparency = 1
loadingRing.Parent = loadingScreen

-- Remove the default loading screen
ReplicatedFirst:RemoveDefaultLoadingScreen()

-- Initiate and start fade-in tweens
local fadeTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 2)
local fadeTween1 = TweenService:Create(textLabel, fadeTweenInfo, {TextTransparency = 0})
local fadeTween2 = TweenService:Create(loadingRing, fadeTweenInfo, {ImageTransparency = 0})
fadeTween1:Play()
fadeTween2:Play()

-- Initiate and start rotation tween
local tweenInfo = TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
local tween = TweenService:Create(loadingRing, tweenInfo, {Rotation = 360})
tween:Play()

task.wait(5)  -- Force screen to appear for a minimum number of seconds

if not game:IsLoaded() then
	game.Loaded:Wait()
end

loadingScreen:Destroy()
```

---
*Source: [Loading screens](https://create.roblox.com/docs/players/loading-screens) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
