---
title: "Identify performance issues"
description: "Explains how to use Roblox tools to identify performance issues."
area: "30 Official Roblox Docs"
cluster: "Performance Optimization"
source: "https://create.roblox.com/docs/performance-optimization/identify"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to use Roblox tools to identify performance issues.*

Identifying performance issues generally means drilling down on one of three categories: frame rate (compute), memory, or load time.

Roblox has a number of tools for identifying performance issues, some of which are available in the Roblox client (and therefore Studio) and some of which are only available in Studio. Whereas you can observe client behavior directly, you must use tools to diagnose server issues.

## Diagnostic tools

| Tool | Description | Location | Keyboard shortcut | Environment |
| --- | --- | --- | --- | --- |
| [[30 Official Roblox Docs/Studio/Developer Console\|Developer Console]] | A console with real-time log messages, errors, and detailed information on memory, networking, and script performance. It's useful for viewing memory consumption, key server health stats, script performance stats, and to launch the client or server MicroProfiler. | **Studio**<br>**In-Game** | <kbd>F9</kbd> | **Studio Testing**<br>**Live Sessions** |
| [[30 Official Roblox Docs/Performance Optimization/Microprofiler/MicroProfiler\|MicroProfiler]] | A debugging tool that breaks down how much computational time is spent on tasks each frame. It can generate dumps for analysis showing a precise breakdown of individual frames, making it helpful for identifying the specific task causing performance issues. You can run the profiler on either the client or the server, depending on which side has an issue. | **Studio**<br>**In-Game** | <kbd><kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>F6</kbd> (<kbd>⌘</kbd><kbd>⌥</kbd><kbd>F6</kbd>)</kbd> | **Studio Testing**<br>**Live Sessions** |
| [[30 Official Roblox Docs/Performance Optimization/Scene Analysis\|Scene Analysis]] | Provides at-a-glance comparative information about the resources your client and server scenes are using and which instances are responsible for that resource usage. | Studio | N/A | **Studio Testing** |
| Performance Stats | A toolbar with basic performance statistics, including memory consumption, CPU, GPU, network data sent and received, and ping time. | **In-Game** | <kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>F7</kbd> (<kbd>⌘</kbd><kbd>⌥</kbd><kbd>F7</kbd>) | **Studio Testing**<br>**Live Sessions** |
| Debug Stats | Overlays with detailed information around graphics, physics, network traffic, and FPS. | **Studio**<br>**In-Game** | <kbd>Shift</kbd><kbd>Ctrl</kbd><kbd>F1</kbd> (<kbd>Shift</kbd><kbd>⌘</kbd><kbd>F1</kbd>), <kbd>Shift</kbd><kbd>Ctrl</kbd><kbd>F2</kbd> (<kbd>Shift</kbd><kbd>⌘</kbd><kbd>F2</kbd>), <kbd>Shift</kbd><kbd>Ctrl</kbd><kbd>F3</kbd> (<kbd>Shift</kbd><kbd>⌘</kbd><kbd>F3</kbd>), <kbd>Shift</kbd><kbd>Ctrl</kbd><kbd>F4</kbd> (<kbd>Shift</kbd><kbd>⌘</kbd><kbd>F4</kbd>), <kbd>Shift</kbd><kbd>Ctrl</kbd><kbd>F5</kbd> (<kbd>Shift</kbd><kbd>⌘</kbd><kbd>F5</kbd>) | **Studio Testing**<br>**Live Sessions** |
| [[30 Official Roblox Docs/Studio/Studio testing modes#Network simulation\|Network Simulation]] | Properties that simulate real-world network conditions like latency, jitter, and packet loss to playtest connections. | **Studio** | <kbd>Alt</kbd><kbd>S</kbd>(<kbd>⌥</kbd><kbd>S</kbd>) | **Studio Testing** |
| [[30 Official Roblox Docs/Production/Analytics/Performance\|Performance Dashboard]] | A dashboard with aggregate charts for client and server memory usage, client frame rate, server heartbeat, and crash rates in real time. It's helpful for analyzing performance patterns over time. See [[30 Official Roblox Docs/Performance Optimization/Monitor performance\|monitoring performance]]. | **Creator Dashboard** | N/A | **Live Sessions** |

## Server compute

Server heartbeat is capped at 60 FPS for all games, so lower values might indicate a performance issue. To check server heartbeat:

- With the [[30 Official Roblox Docs/Studio/Developer Console|Developer Console]] - In the **Server Jobs** tab, expand the **Heartbeat** row and check the **Steps Per Sec** value, which represents the heartbeat of your game.

- With the [[30 Official Roblox Docs/Performance Optimization/Microprofiler/MicroProfiler|MicroProfiler]], you can check the graph to see if the frame takes longer than 16.67 ms.

  > [!info]
  > The MicroProfiler is particularly useful for identifying "spikes" in performance, where some frames take significantly longer than others to process.

Another symptom of degraded server heartbeat is increased latency (commonly known as ping). The longer the server takes to finish computing its tasks each frame, the longer it takes to process network data sent and received from clients. To check average ping for all players connected to a server, go to the **Server Stats** tab in the [[30 Official Roblox Docs/Studio/Developer Console|Developer Console]].

If server heartbeat stays low after you [[30 Official Roblox Docs/Performance Optimization/Improve performance|improve performance]], your game might need more CPU than its servers get by default. You can reserve more with [[30 Official Roblox Docs/Cloud Services/Extended Services#Extended Services for Compute|Extended Services for Compute]].

## Client compute

The default client frame rate cap is 60 FPS. However, users can raise their frame rate cap up to 240 FPS on Windows.

Frame rate differs wildly between devices. For example, a high-end PC might be able to "brute force" a computational issue and only experience an imperceptible frame rate dip. If you [[30 Official Roblox Docs/Performance Optimization/Test on hardware|test on lower-end devices]], problems tend to be more severe and thus easier to notice.

To check the frame rate of your game:

- In the client, press <kbd>Shift</kbd><kbd>F5</kbd> to show the debug stats summary.
- From Studio's **Window** ⟩ **Performance** menu, toggle on **Stats** to enable debug stats.

  > [!warning]
  > Performance stats in Studio are skewed by the Studio application, so you should view the frame rate on the client for accurate numbers.

- With the [[30 Official Roblox Docs/Performance Optimization/Microprofiler/MicroProfiler|MicroProfiler]], you can check the graph to see if the frame takes longer than 16.67 ms.

> [!info]
> When evaluating frame rate, it can help to set the graphics quality to its maximum value to remove the effect of the frame rate manager. In the client, open the menu, click **Settings**, change  **Graphics Mode** to manual, and raise graphics quality.

## Server memory

Try to keep server memory usage below 50%. Total server memory uses the following formula:

`6.25 GiB + (100 MiB * largest_number_of_connected_players)`

> [!info]
> These numbers use powers of 2, so 1 GiB refers to 2^30 bytes and 1 MiB to 2^20 bytes.

For example, a server with 30 connected players has approximately 9.18 GiB of total memory. Servers gain memory when players connect, but **don't** lose it when players disconnect. If 10 players leave, the server still has 9.18 GiB of memory rather than shrinking to 8.2 GiB.

When servers shut down (for example, when they are empty or as part of the [[30 Official Roblox Docs/Projects/Release game updates|update process]]), their replacements start with the base amount of memory and begin scaling up as players connect.

## Client memory

There are several ways to check memory usage for a game:

1. Open the [[30 Official Roblox Docs/Studio/Developer Console|Developer Console]] and switch to the **Memory** tab. This tab gives a breakdown of how memory is being allocated. Use the client rather than Studio to get the most accurate readouts.
2. Enable the **Performance Stats** view from the settings menu in the client to see an overlay with total client memory usage.

High memory usage is not necessarily indicative of a problem, but some indications that you may need to investigate more are:

- A significant percentage of client crashes showing in the **Performance Dashboard**, particularly a sudden uptick that coincides with an update. Some number of crashes are expected, but you should investigate if your crash rates increase above 2-3%.
- A crash occurs while testing on a device that you want your game to support.

A significant portion of a game's memory consumption on the client are from assets, such as images, meshes, and audio files, loaded into memory. In the Developer Console, check the following labels under **PlaceMemory**:

- **GraphicsMeshParts** - Graphics memory consumed by meshes.
- **GraphicsTexture** - Graphics memory consumed by textures.
- **Sounds** - Memory consumed by audio files.

## Load times

Load time, also called join time, is the total time from when a player clicks **Play** to when the world renders and they can begin playing. After the client connects to a server, the join happens in the following order:

1. [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] replicates to the client, and any custom [[30 Official Roblox Docs/Players/Loading screens|loading screen]] inside it appears.
1. The rest of the data model replicates, including everything in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] and [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]]. If you enable [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|instance streaming]], only the area of the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] near the player's spawn point replicates at this stage.
1. The player's avatar loads. Load time ends when the loading screen disappears and the world begins rendering.

Knowing which step is slow helps you choose the optimizations with the greatest impact. For common causes and fixes, see [[30 Official Roblox Docs/Performance Optimization/Improve performance#Load times|Improve performance]].

There are no built-in tools for checking load times, but because they don't require millisecond-level precision, a stopwatch is usually all you need to understand your current baseline and check whether you made a substantive improvement. You can use a client script in [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] to get some sense of how your changes impact load times, but this script doesn't provide a complete, end-to-end measurement. It starts timing after [[30 Official Roblox Docs/API Reference/Classes/ReplicatedFirst|ReplicatedFirst]] replicates and stops when initial replication finishes and [[30 Official Roblox Docs/API Reference/Classes/DataModel#Loaded|DataModel.Loaded]] fires, so it doesn't include the time to connect to a server or load the avatar:

```lua
local startTime = os.clock()

game.Loaded:Connect(function()
  local loadTime = os.clock() - startTime
  local roundedLoadTime = math.round(loadTime * 10000) / 10000 -- four decimal places
  print("Game loaded in " .. roundedLoadTime .. " seconds.")
  print("Number of instances loaded: " .. #workspace:GetDescendants())
end)
```

For additional insight, enable **Print Join Size Breakdown** from the **Network** tab of [[30 Official Roblox Docs/Studio/Roblox Studio setup#Customization|Studio Settings]] to print the top 20 instances by size and a percentage breakdown by instance type when you start the game in Studio.

If your load time is unexpectedly high relative to the apparent size of your game, inspect your place for unrecognized or obfuscated scripts. Some free models from the Creator Store contain scripts that generate thousands of extra instances, which dramatically increases the amount of data that must replicate when a player joins.

Measure load time before and after each optimization or update so that you can confirm its impact and catch regressions. A sudden increase often means that content was recently added to [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] or that an asset change increased download size.

## Ping

The two primary measurements of ping (latency) are **network ping** and **data ping**.

Network ping is the round-trip time measured from when the client sends a network data packet to when it receives the server's echo reply. It is similar to what would be reported as `time` by the general purpose ping network utility.

Network ping is visible in the **Performance Stats** bar. It is mostly affected by the length of the network path between the client and server, and is outside your control. However, you can simulate ping and other network conditions using [[30 Official Roblox Docs/Studio/Studio testing modes#Network simulation|network simulation]] when playtesting in Studio.

Data ping is the round-trip time measured from when the client sends data reliably through the replication system to when it receives an echo reply from the server's replication system. It includes time spent in both the client's and server's replication queues, along with TCP-like retransmissions of lost or corrupted packets.

Data ping is similar to sending a reliable remote event from the client, receiving it on the server, and then sending a reliable remote event from the server to the client in response. Because data ping also includes time spent on the network between the client and server, it is greater than or equal to network ping.

Average data ping for all players connected to a server is visible in the **Server Stats** tab of the Developer Console. Data ping for an individual client is visible using <kbd>Shift</kbd><kbd>F3</kbd> to display network debug stats.

Data ping is affected by both the network path and by replication queueing delays. When the server generates replication data faster than the network can send it (or faster than the client can process it), data must wait in replication queues. Some difference between data ping and network ping is normal due to both network retransmissions and the way network data is processed by the Roblox app. However, if data ping is significantly higher than network ping, use the [[30 Official Roblox Docs/Performance Optimization/Microprofiler/Network usage|MicroProfiler]] to view network traffic. For optimization suggestions, see [[30 Official Roblox Docs/Performance Optimization/Improve performance#Networking and replication|networking and replication]].

---
*Source: [Identify performance issues](https://create.roblox.com/docs/performance-optimization/identify) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
