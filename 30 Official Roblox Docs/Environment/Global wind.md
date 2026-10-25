---
title: "Global wind"
description: "The global wind vector sets the direction and strength that wind blows through a game, affecting terrain grass, dynamic clouds, and particles."
area: "30 Official Roblox Docs"
cluster: "Environment"
source: "https://create.roblox.com/docs/environment/global-wind"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The global wind vector sets the direction and strength that wind blows through a game, affecting terrain grass, dynamic clouds, and particles.*

The [[30 Official Roblox Docs/API Reference/Classes/Workspace#GlobalWind|GlobalWind]] vector sets the direction and strength that wind blows through a game, affecting [[30 Official Roblox Docs/Parts/Environmental terrain#Grass animation|terrain grass]] and [[30 Official Roblox Docs/Environment/Dynamic clouds|dynamic clouds]]. You can set it as a [[30 Official Roblox Docs/Environment/Global wind#Global wind vector|constant vector]], or adjust it through [[30 Official Roblox Docs/Environment/Global wind#Scripted effects|scripting]] to create cyclical gusts of wind. Additionally, you can influence [[30 Official Roblox Docs/Environment/Global wind#Particle Influence|particles]] to follow the global wind vector.

[Video: Global-Wind-Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/aero-fluid-dynamics/Global-Wind-Showcase.mp4)

## Global wind vector

Global wind is controlled through The [[30 Official Roblox Docs/API Reference/Classes/Workspace#GlobalWind|GlobalWind]] vector is a property of [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] and you can edit it directly in Studio, or set it through [[30 Official Roblox Docs/Environment/Global wind#Scripted effects|scripting]].

To set the global wind vector in Studio:

1. In the **Explorer** window, select the top-level [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] service.

   *(image in the full Top G Vault)*

1. In the **Properties** window, locate the [[30 Official Roblox Docs/API Reference/Classes/Workspace#GlobalWind|GlobalWind]] property and set an **X**, **Y**, and **Z** value for its direction and strength.

   *(image in the full Top G Vault)*

> [!info]
> Note that the speed of [[30 Official Roblox Docs/Parts/Environmental terrain#Grass animation|animated grass]] — but not its vector direction — will be reduced if the player has toggled on the **Reduce Motion** [[30 Official Roblox Docs/Production/Publishing/Accessibility guidelines#Reduced motion|accessibility]] setting from the Roblox or in-game **Settings** menu.

## Particle Influence

Particles emitted by a [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter|ParticleEmitter]] will follow the global wind vector as long as the emitter's [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#WindAffectsDrag|WindAffectsDrag]] property is enabled and its [[30 Official Roblox Docs/API Reference/Classes/ParticleEmitter#Drag|Drag]] property is greater than `0`, which is useful for [[30 Official Roblox Docs/Effects/Particle emitters#Simulate rain|simulating rain]]. [[30 Official Roblox Docs/API Reference/Classes/Fire|Fire]] and [[30 Official Roblox Docs/API Reference/Classes/Smoke|Smoke]] instances follow the wind vector by default.

*(image in the full Top G Vault)*

[Video: Global-Wind-Particles.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/aero-fluid-dynamics/Global-Wind-Particles.mp4)

## Wind direction widget

To make it easier to tune global wind, you can use the **Wind Direction** widget, accessible from Studio's **View** menu. The widget lets you visualize how wind is blowing using a wind sock model, and you can dynamically set the wind's **Speed**, **Yaw**, and **Pitch** by clicking the desired aspect name and sliding the slider along the bottom, or you can adjust yaw or pitch by manipulating the green ring and blue arrow on the animated portion. You can also click and drag the widget to reposition it anywhere in the 3D viewport.

*(image in the full Top G Vault)*

## Scripted effects

Scripting of the [[30 Official Roblox Docs/API Reference/Classes/Workspace#GlobalWind|GlobalWind]] property opens up a whole range of possibilities. For example, you can use the following code sample to cause cyclical gusts of wind that ease in and out using the [[30 Official Roblox Docs/API Reference/Libraries/math#sin|math.sin()]] function.

```lua title="Script - Cyclical Wind Gusts"
local gustCycleDelay = 5  -- Max duration between gust cycles in seconds
local gustCycleDuration = 3.5  -- Duration of each gust cycle in seconds

-- During each gust cycle, a portion of "gust" will be added to "baseWind" in a ramped fashion
local baseWind = Vector3.new(5, 0, 2)  -- Base wind speed and direction
local gust = Vector3.new(25, 0, 10)  -- Gust speed and direction
local gustIntervals = 100  -- Number of iterations used to calculate each gust interval
local dg = gustCycleDuration / gustIntervals
local dgf = dg / gustCycleDuration

-- Set global wind to base wind initially
workspace.GlobalWind = baseWind

-- Wait delay amount before starting gusts
task.wait(gustCycleDelay)

while true do
	for i = 1, gustIntervals do
		local f = math.sin(math.pi * dgf * i)  -- Use sin() function to ramp gust
		workspace.GlobalWind = baseWind + f * gust  -- Set global wind to base wind + gust
		task.wait(dg)
	end
	workspace.GlobalWind = baseWind  -- Reset global wind to base wind at end of gust cycle
	task.wait(math.random() * gustCycleDelay)  -- Wait a random fraction of delay before next gust cycle
end
```

[Video: Global-Wind-Gusts.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/lighting-and-effects/aero-fluid-dynamics/Global-Wind-Gusts.mp4)

---
*Source: [Global wind](https://create.roblox.com/docs/environment/global-wind) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
