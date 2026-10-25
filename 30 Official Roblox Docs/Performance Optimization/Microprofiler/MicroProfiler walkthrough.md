---
title: "MicroProfiler walkthrough"
description: "Explains how using the MicroProfiler can help you optimize portions of your game."
area: "30 Official Roblox Docs"
cluster: "Performance Optimization"
source: "https://create.roblox.com/docs/performance-optimization/microprofiler/use-microprofiler"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how using the MicroProfiler can help you optimize portions of your game.*

This walkthrough shows how to use the MicroProfiler to find a problematic aspect of a game and identify the root cause. Download the game, **Open from File** in Studio, and follow along.

[**Download the game**](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/optimization/microprofiler/RaycastSpam.rbxl)

<br>

## Identify the issue

1. After you open the game in Studio, start testing it with <kbd>F5</kbd> or the **Play** button.

1. The frame rate feels decent, but not as smooth as it should be for a game of this size and scope. Press <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>F5</kbd> (<kbd>⌘</kbd><kbd>Shift</kbd><kbd>F5</kbd>) to show the **Performance Summary** overlay.

   *(image in the full Top G Vault)*

   Note that the frame rate is below 60 frames per second (FPS).

1. Open the MicroProfiler by pressing <kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>F6</kbd> (<kbd>⌘</kbd><kbd>⌥</kbd><kbd>F6</kbd>).

   *(image in the full Top G Vault)*

   Note that the frame times are **consistent**—the bars are roughly the same height—so whatever is causing the low frame rate is running every single frame as opposed to running occasionally and causing frame time spikes.

1. Pause the MicroProfiler by pressing <kbd>Ctrl</kbd><kbd>P</kbd> (<kbd>⌘</kbd><kbd>P</kbd>). Pausing with the keyboard shortcut opens [[30 Official Roblox Docs/Performance Optimization/Microprofiler/MicroProfiler modes|detailed mode]].

1. Click and drag to pan the graph. Note how one particular task in the worker threads seems to be using a lot of processing time compared to the main thread. Hover over [[30 Official Roblox Docs/API Reference/Classes/RunService#Stepped|RunService.Stepped]] and note how long it's taking to render.

   *(image in the full Top G Vault)*

1. Stacked bars in the timeline indicate a hierarchy of code, so keep hovering on lower and lower layers to try and identify the issue.

   *(image in the full Top G Vault)*

   *(image in the full Top G Vault)*

   Note the `LocalScript` label, which indicates the name of the script, and the `Raycast` label, which indicates that the problem might be related to raycasting.

## Create troubleshooting labels

Now that the MicroProfiler has provided a starting point, you can troubleshoot the problematic code.

1. Stop the play test and filter the Explorer window for `localscript` to find the file.

   *(image in the full Top G Vault)*

   A search for `raycast` indicates that this portion of code is probably the culprit for the game's poor performance:

   ```lua
   local RAYS_PER_SECOND = 1500

   local function onStepped()

   	for _ = 1, RAYS_PER_SECOND do
   		local startPosition = getRandomPosition()
   		local endPosition = getRandomPosition()
   		local direction = endPosition - startPosition

   		Workspace:Raycast(
            startPosition,
            endPosition
         )
   	end

   end

   RunService.Stepped:Connect(onStepped)
   ```

   Specifically, you can see that the code is casting 1,500 rays per second in random directions.

1. To verify that this portion of code is causing the rendering delay, wrap the contents of the function with [[30 Official Roblox Docs/API Reference/Libraries/debug#profilebegin|debug.profilebegin()]] and [[30 Official Roblox Docs/API Reference/Libraries/debug#profileend|debug.profileend()]]:

   ```lua
   local function onStepped()

      debug.profilebegin("Raycast Spam")

      for _ = 1, RAYS_PER_SECOND do
         local startPosition = getRandomPosition()
         local endPosition = getRandomPosition()
         local direction = endPosition - startPosition

         Workspace:Raycast(
            startPosition,
            endPosition
         )
      end

      debug.profileend()

   end
   ```

## Confirm and fix the issue

1. Start testing the game, and open the MicroProfiler again.

1. Note how the MicroProfiler now shows the custom label, indicating that this function was indeed the root cause.

   *(image in the full Top G Vault)*

1. Stop the play test.

1. Delete or comment out the `onStepped()` function and the `RunService.Stepped:Connect(onStepped)` connection.

1. Start testing the game again, and check the **Performance Summary** again.

   *(image in the full Top G Vault)*

   Note the huge improvement to frame rate and corresponding drop in frame times on the MicroProfiler graph.

---
*Source: [MicroProfiler walkthrough](https://create.roblox.com/docs/performance-optimization/microprofiler/use-microprofiler) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
