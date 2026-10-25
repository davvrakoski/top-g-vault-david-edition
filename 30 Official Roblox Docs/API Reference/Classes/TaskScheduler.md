---
title: "TaskScheduler"
description: "Collection of settings for the _Task Scheduler_ feature."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/TaskScheduler"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*Collection of settings for the _Task Scheduler_ feature.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

TaskScheduler is a read-only settings class responsible for the Task Scheduler feature. Can be found in Roblox Studio's settings with the name _Task Scheduler_.

## Summary

### Properties

| Property | Type | Summary |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/TaskScheduler#SchedulerDutyCycle\|SchedulerDutyCycle]] | double | The average time divided by the average interval of the duty cycle. |
| [[30 Official Roblox Docs/API Reference/Classes/TaskScheduler#SchedulerRate\|SchedulerRate]] | double | The current average rate of the task scheduler. |
| [[30 Official Roblox Docs/API Reference/Classes/TaskScheduler#ThreadPoolConfig\|ThreadPoolConfig]] | [[30 Official Roblox Docs/API Reference/Enums/ThreadPoolConfig\|ThreadPoolConfig]] | The specified thread pooling configuration for the task scheduler. |
| [[30 Official Roblox Docs/API Reference/Classes/TaskScheduler#ThreadPoolSize\|ThreadPoolSize]] | int | The current size of the thread pool. |

*Inherited members are documented on the parent classes: [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]], [[30 Official Roblox Docs/API Reference/Classes/Object|Object]].*

## Properties

### SchedulerDutyCycle

**Type:** double

**Thread safety:** ReadSafe · **Category:** Diagnostics · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

The average time divided by the average interval of the duty cycle.

### SchedulerRate

**Type:** double

**Thread safety:** ReadSafe · **Category:** Diagnostics · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

The current average rate of the task scheduler.

### ThreadPoolConfig

**Type:** [[30 Official Roblox Docs/API Reference/Enums/ThreadPoolConfig|ThreadPoolConfig]]

**Thread safety:** ReadSafe · **Category:** Configuration · **Loaded/Saved:** true/true · **Capabilities:** Basic

The specified thread pooling configuration for the task scheduler.

### ThreadPoolSize

**Type:** int

**Thread safety:** ReadSafe · **Category:** Diagnostics · **Loaded/Saved:** false/true · **Capabilities:** Basic · **Tags:** `ReadOnly`, `NotReplicated`

The current size of the thread pool.

---
*Source: [TaskScheduler](https://create.roblox.com/docs/reference/engine/classes/TaskScheduler) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
