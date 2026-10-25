---
title: "MicroProfiler modes"
description: "The MicroProfiler includes several different modes, all of which offer different ways to understand your game's performance profile."
area: "30 Official Roblox Docs"
cluster: "Performance Optimization"
source: "https://create.roblox.com/docs/performance-optimization/microprofiler/modes"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The MicroProfiler includes several different modes, all of which offer different ways to understand your game's performance profile.*

The MicroProfiler includes several modes, which can help you visualize your game's performance characteristics in different ways. After opening the MicroProfiler, use the **Modes** menu to switch between them.

**Frame mode** and **detailed mode** are covered under [[30 Official Roblox Docs/Performance Optimization/Microprofiler/MicroProfiler#MicroProfiler basics|MicroProfiler basics]].

## Timers mode

**Timers mode** is an alternative way of visualizing the data in the detailed view: as a list of labels with processing times and call counts. Horizontal bar graphs in some columns help you spot the busiest tasks.

*(image in the full Top G Vault)*

Controls are similar to detailed view:

- Left-click and hold to pan up and down.
- Left-click a label to add it to the line graph in the lower-right.
- Use the **Groups** menu to filter the list.
- Use the **Timers** menu to customize the columns.

> [!info]
> All of the information in this view is visible when you hover over a label in the detailed view.

## Counters mode

Counters mode is a lengthy list of categories and statistics, including instance count and memory usage (in bytes) for the various tasks.

*(image in the full Top G Vault)*

- Just like the detailed view, left-click and hold to pan up and down.
- Left-click in the **Graph** column to add a small usage graph with minimum and maximum values. Left-click the graph again to expand it.
- Right-click a graph to close it.
- You can't filter this view, but you can left-click on a category (for example, `memory`) to collapse it.

While counters mode can be useful, the [[30 Official Roblox Docs/Studio/Optimization/Memory usage|Developer Console]] is the best way to [[30 Official Roblox Docs/Performance Optimization/Identify performance issues#Client memory|identify memory issues]]. You might also find the [[30 Official Roblox Docs/Performance Optimization/Microprofiler/MicroProfiler#Web-only features|X-ray view]] helpful for identifying when problematic memory allocation occurs.

## Groups mode

Only available in the web UI. Similar to timers mode, groups mode provides average, max, and total task times for each group, broken down by thread, to help you identify how broad categories of tasks are impacting your frame times.

*(image in the full Top G Vault)*

## Threads mode

Only available in the web UI. Similar to timers mode, threads mode provides average and total task times for each thread, broken down by group, to help you identify how your game is distributing tasks across threads.

*(image in the full Top G Vault)*

## Hidden mode

Only available in the desktop UI. Hidden mode keeps the MicroProfiler menu open, but hides the bar graph. It's useful for reducing visual clutter, [[30 Official Roblox Docs/Performance Optimization/Microprofiler/MicroProfiler#Save frame data|saving frame data]], and pausing and unpausing while you observe the line graph.

---
*Source: [MicroProfiler modes](https://create.roblox.com/docs/performance-optimization/microprofiler/modes) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
