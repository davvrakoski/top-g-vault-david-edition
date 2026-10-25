---
title: "Design for performance"
description: "Outlines performance best practices to follow as you build a new game."
area: "30 Official Roblox Docs"
cluster: "Performance Optimization"
source: "https://create.roblox.com/docs/performance-optimization/design"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Outlines performance best practices to follow as you build a new game.*

Designing for performance means following a handful of best practices **as you build** your game. Compared to finding and fixing performance issues later in the development process, designing for performance early can save you a lot of time and effort.

## Low-end devices

Lower-end devices, particularly mobile devices, have severe memory limitations and are susceptible to crashes due to out of memory (OOM) errors:

- If you want to support lower-end devices, choose at least one "baseline" device, [[30 Official Roblox Docs/Performance Optimization/Test on hardware|test your game on it]] throughout the development process, and pay close attention to frame rate and memory usage. As you find problem areas in your game, use those areas to identify the limits of your device.

  For example, you might test a game with the **Render** (<kbd>Shift</kbd><kbd>F2</kbd>) and **Summary** (<kbd>Shift</kbd><kbd>F2</kbd>) debug stats enabled. If the frame rate starts to drop in a particularly cluttered area, you could examine the **Draw (scene)** numbers and determine that you need to stay below 1,000 draw calls and 1,000,000 triangles for the game to run well on your baseline device.

  Or you could examine the **Developer Console** (<kbd>F9</kbd>) and note that memory usage is a bit high unless you enable [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|streaming]]. Having a clear understanding of device limits can help you stay under them as you continue to build your game.

  *(image in the full Top G Vault)*

- The device emulator in Roblox Studio is useful for checking aspect ratio and controls, but isn't accurate for memory usage; when you test a game in Studio, it runs the server and the client, so memory usage is significantly higher.

> [!info]
> Roblox does not have access to all of a device's memory. Some amount is required for the operating system and other applications.

More generally, [[30 Official Roblox Docs/Performance Optimization/Test on hardware|testing on a variety of devices]] can help you check that the game matches your visual and performance expectations at different graphics quality levels. For a much more detailed example of how you might think about optimizing your game for low-end mobile devices, see [Real World Building and Scripting Optimization](https://devforum.roblox.com/t/real-world-building-and-scripting-optimization-for-roblox/3127146).

## Streaming and teleportation

- [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|Instance streaming]] lets Roblox dynamically load and unload 3D content and is a great option for most places, especially larger ones. Streaming improves join times, reduces memory footprint, and increases frame rate.

  For example, when you enable [[30 Official Roblox Docs/API Reference/Classes/Workspace#EnableSLIMAvatars|Workspace.EnableSLIMAvatars]] and set your world models' [[30 Official Roblox Docs/API Reference/Classes/Model#LevelOfDetail|LevelOfDetail]] property to [[30 Official Roblox Docs/API Reference/Enums/ModelLevelOfDetail|SLIM]], you can create worlds with social spaces and crowded events that remain visually populated while scaling across a wide range of device capabilities. For more information, see [[30 Official Roblox Docs/Workspace/Streaming/SLIM|SLIM]] and [[30 Official Roblox Docs/Performance Optimization/Improve performance#Instance streaming|Improve performance]].

- Consider breaking large places into more manageable ones and using [[30 Official Roblox Docs/Projects/Teleport between places|teleportation]] to move players between them. This approach can reduce **initial** join times, but imposes additional join times as players teleport from place to place. Benefits to memory usage vary depending on the size of the place and whether you've enabled streaming.

  Even ignoring performance considerations, you might find that having multiple places simplifies the development process, especially if you regularly add new content to your game or are part of a larger team.

## Materials and duplication

- Built-in materials use far less memory than custom textures, but might not match your artistic vision. Try to use materials whenever possible in order to conserve memory budget for the textures that are central to your game.

- As you create assets, convert them into [packages](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/packages.md). Making packages part of your workflow helps avoid the common issue of duplicate assets with different IDs, which can hurt performance.

- When you add meshes and textures, use and reuse them rather than importing duplicate copies. By resizing, rotating, and overlapping, you can create rich, varied environments that require very few [[30 Official Roblox Docs/Performance Optimization/Improve performance#Draw calls|draw calls]]. For more information, see [[30 Official Roblox Docs/Tutorials/Curriculums/Environmental Art/Optimize your game#Remove duplicate textures|Remove duplicate textures]].

## Transparency

- Avoid transparency values other than 0 (visible) and 1 (invisible). When you use partial transparency, be especially careful to avoid [[30 Official Roblox Docs/Tutorials/Curriculums/Environmental Art/Optimize your game#Delete layered transparencies|high transparency overdraw]].

## Scripting

- Whenever possible, write event-driven code rather than per-frame calculations. At 60 FPS, the total budget for each frame is 16.67 milliseconds (ms). Even seemingly minor per-frame calculations can use a significant portion of that budget.

- Find ways to break long-running code into manageable chunks. If a piece of code takes 100 ms to execute and you run it every frame, your game can only run at 10 FPS. If you decide to only run the code once per second in a game that otherwise runs at 60 FPS, 59 of your frames arrive after 16.67 ms... and then one after 100 ms, which causes a jarring stutter.

  Instead, investigate how you can break up the code. Maybe you can perform 5 ms of work per frame, use [[30 Official Roblox Docs/API Reference/Libraries/task#wait|task.wait()]], and have the completed calculation every 20 frames while still maintaining 60 FPS. [[30 Official Roblox Docs/Scripting/Parallel Luau|Multithreading]], sometimes called Parallel Luau, can also help.

- Use the [[30 Official Roblox Docs/API Reference/Datatypes/RBXScriptConnection#Disconnect|RBXScriptConnection:Disconnect()]] method to stop functions from being called unnecessarily the next time an event fires.

- Don't call the same method every time you need a value. Call the method once, store the value, and then overwrite it later as necessary.

- Don't store everything in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. The client loads everything that is in this container. Instead, use [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]] for anything that the client does not need access to.

---
*Source: [Design for performance](https://create.roblox.com/docs/performance-optimization/design) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
