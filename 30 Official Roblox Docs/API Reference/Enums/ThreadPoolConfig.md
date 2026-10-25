---
title: "ThreadPoolConfig"
description: "Thread pooling scheme for the task scheduler."
api_type: enum
aliases: ["Enum.ThreadPoolConfig"]
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/enums/ThreadPoolConfig"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/enum]
cssclasses: [tg-a30]
---

*Thread pooling scheme for the task scheduler.*

## Description

Controls the thread pooling scheme used by [[30 Official Roblox Docs/API Reference/Classes/TaskScheduler|TaskScheduler]]. The selected value determines how many worker threads the task scheduler allocates for background work. [[30 Official Roblox Docs/API Reference/Classes/TaskScheduler#ThreadPoolConfig|TaskScheduler.ThreadPoolConfig]] defaults to `Auto`.

The `PerCore` variants scale the thread count with the number of physical CPU cores reported by the operating system. The `Threads` variants use an absolute count regardless of hardware. `Auto` lets the scheduler choose internally.

## Items

| Name | Value | Summary |
| --- | --- | --- |
| `Auto` | 0 | Let task scheduler make a decision internally. |
| `Threads1` | 1 | Utilize 1 worker thread, ignore the physical CPU core count. |
| `Threads2` | 2 | Utilize 2 worker threads, ignore the physical CPU core count. |
| `Threads3` | 3 | Utilize 3 worker threads, ignore the physical CPU core count. |
| `Threads4` | 4 | Utilize 4 worker threads, ignore the physical CPU core count. |
| `Threads8` | 8 | Utilize 8 worker threads, ignore the physical CPU core count. |
| `Threads16` | 16 | Utilize 16 worker threads, ignore the physical CPU core count. |
| `PerCore1` | 101 | Utilize 1 worker thread per available physical CPU core. |
| `PerCore2` | 102 | Utilize 2 worker threads per available physical CPU core. |
| `PerCore3` | 103 | Utilize 3 worker threads per available physical CPU core. |
| `PerCore4` | 104 | Utilize 4 worker threads per available physical CPU core. |

---
*Source: [ThreadPoolConfig](https://create.roblox.com/docs/reference/engine/enums/ThreadPoolConfig) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
