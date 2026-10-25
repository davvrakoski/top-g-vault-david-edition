---
title: "Customize and share"
description: "Learn how to modify a Luau script in Roblox Studio to customize how your spaceship handles and flies in the Build It Play It Galactic Speedway challenge."
area: "30 Official Roblox Docs"
cluster: "Education"
source: "https://create.roblox.com/docs/education/build-it-play-it-galactic-speedway/customize-and-share"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Learn how to modify a Luau script in Roblox Studio to customize how your spaceship handles and flies in the Build It Play It Galactic Speedway challenge.*

*(image in the full Top G Vault)*

This last lesson is all about putting the final touches on the driftspeeder, such as making it faster or quicker to turn. Once finished, take flight and share your work with friends.

## Modify the Engine

To change a driftspeeder's speed or how quickly it can turn, you'll open the **_Settings_** script. In Roblox, code is typed inside of scripts using the coding language [Luau](https://luau.org). Games often have separate scripts for each thing the game needs to do.

1. Click on your speeder.
1. In the **Explorer** window, look for the **Garage** folder and your driftspeeder.
1. Next to the driftspeeder's name, click the ▸ arrow to expand it. Then, find **Body** and click the ▸ to see the attached script.

   *(image in the full Top G Vault)*

1. Double-click the **Settings** script to open it.

## The Settings script

In the script, you'll see words like `DefaultSpeed` or `BoostSpeed`. These words are **variables**. Variables are placeholders for information that can be changed as needed.

```lua
-- ================================================================================
-- Settings
-- ================================================================================

local Settings = {}

Settings.DefaultSpeed = 100		-- Speed when not boosted [Studs/second, Range 50-300]
Settings.BoostSpeed = 200		-- Speed when boosted [Studs/second, Maximum: 400]
Settings.BoostAmount = 10		-- Duration of boost in seconds
Settings.Steering = 5			-- How quickly the speeder turns [Range: 1-10]
-- ================================================================================

return Settings
```

Make your speeder the fastest on the track by increasing the default speed setting.

1. Change the number in the line `Settings.DefaultSpeed = 100` to any number between `50` (slower) and `300` (faster).

   ```lua
   Settings.DefaultSpeed = 100		-- Speed when not boosted [Studs/second, Range 50-300]
   Settings.BoostSpeed = 200		-- Speed when boosted [Studs/second, Maximum: 400]
   Settings.BoostAmount = 10		-- Duration of boost in seconds
   Settings.Steering = 5			-- How quickly the speeder turns [Range: 1-10]
   ```

1. Playtest and see how the change feels. Ask yourself if the speed fits the driftspeeder's design and if you'd be excited using it in a race.

   [Video: speed50.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-galactic-speedway/customize-and-share/speed50.mp4)

   *`Settings.DefaultSpeed = 50`*

   [Video: speed300.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/build-it-play-it-galactic-speedway/customize-and-share/speed300.mp4)

   *`Settings.DefaultSpeed = 300`*

1. Stop the playtest when finished. Remember, because you can't use your mouse while flying, press <kbd>E</kbd> to exit the speeder so you can stop the playtest.

   > [!info] Making multiple speeders
   > If you make multiple speeders, make each one feel unique by giving them different strengths and weaknesses. One speeder might be slower normally, but have a faster boost. Another speeder might be very fast, but slow to turn.

---
*Source: [Customize and share](https://create.roblox.com/docs/education/build-it-play-it-galactic-speedway/customize-and-share) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
