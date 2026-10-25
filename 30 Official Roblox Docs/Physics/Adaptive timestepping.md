---
title: "Adaptive timestepping"
description: "Adaptive timestepping automatically assigns physical parts to varying simulation timesteps."
area: "30 Official Roblox Docs"
cluster: "Physics"
source: "https://create.roblox.com/docs/physics/adaptive-timestepping"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Adaptive timestepping automatically assigns physical parts to varying simulation timesteps.*

The Roblox physics engine simulates all parts inside the 3D workspace through Newton's second law of motion. This law of motion is solved over time via **timesteps** and a single timestep is done within a **worldstep** in Roblox.

By default, Roblox simulates physics at 240 Hz. Given cycles of approximately 60 frames per second, around 4 worldsteps are advanced per frame. With **adaptive timestepping**, the physics engine automatically assigns parts to three "solver islands" by varying their simulation timestep, with an emphasis on 60 Hz for best performance. However, parts that are "harder" to solve will use a faster timestep like 240 Hz to ensure physical stability.

*(image in the full Top G Vault)*

Assignment criterions are subject to change, but parts assigned to the 240 Hz island include [[30 Official Roblox Docs/Physics/Assemblies|assemblies]] with high velocity values, high acceleration values, and complex mechanisms that are hard to solve.

## Enable adaptive mode

To enable adaptive timestepping in Studio:

1. In the **Explorer** window, select the **Workspace** object.

   *(image in the full Top G Vault)*

2. In the **Properties** window, locate **PhysicsSteppingMethod** and select **Adaptive**.

   *(image in the full Top G Vault)*

To observe the timestepping process in action, you can open the Studio **Microprofiler** (<kbd>Ctrl</kbd><kbd>F6</kbd>; <kbd>⌘</kbd><kbd>F6</kbd>). Once the game is running, press <kbd>Ctrl</kbd><kbd>P</kbd> (<kbd>⌘</kbd><kbd>P</kbd>) to pause at the current frame.

Under the scope named **physicsStepped**, observe that the scope name of **worldStep** now reads **worldStep - Adaptive**.

*(image in the full Top G Vault)*

Hovering your cursor above **LDLPGSSolver::solve** will reveal the status of how many islands belong in each frequency bucket; **1dt Islands** (240 Hz), **2dt Islands** (120 Hz) and **4dt Islands** (60 Hz).

*(image in the full Top G Vault)*

## Debug visualization

During testing, it may be useful to visualize frequencies for simulated parts. To enable this option:

1. Open [[30 Official Roblox Docs/Studio/Roblox Studio setup#Customization|Studio Settings]].
2. From the **Physics** tab, enable **Are Timesteps Shown**.

Once enabled, simulated parts will be outlined by their current simulation rate. If a part stops being simulated, either via the [[30 Official Roblox Docs/Physics/Sleep system|sleep system]] or a network ownership change, the part will no longer be outlined.

*(image in the full Top G Vault)*

[Video: Adaptive-Timestepping.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/physics/adaptive-timestepping/Adaptive-Timestepping.mp4)

*Simulated parts outlined by the color representing their current simulation rate*

## Fixed-rate scenarios

Adaptive timestepping can improve physics performance by up to 2.5 times and it is recommended in most cases. However, some games should use **Fixed** mode (240 Hz), including:

Games that require highly accurate simulations and stability, such as racing games, "destruction" simulations, or games featuring complex mechanisms like tanks.

Simulations where most parts default to the 240 Hz solver island (red outlines during [[30 Official Roblox Docs/Physics/Adaptive timestepping#Debug visualization|debugging]]). When 240 Hz islands interact with islands of different frequencies (60–120 Hz), those islands are converted to 240 Hz with an overhead that may negate any performance gains resulting from adaptive timestepping.

---
*Source: [Adaptive timestepping](https://create.roblox.com/docs/physics/adaptive-timestepping) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
