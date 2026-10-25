---
title: "StopWatchReporter"
description: "A service that times named tasks and reports their durations, classified by device platform and country code. Not available to creator scripts."
api_type: class
area: "30 Official Roblox Docs"
cluster: "API Reference"
source: "https://create.roblox.com/docs/reference/engine/classes/StopWatchReporter"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox, api-reference, api/class]
cssclasses: [tg-a30]
---

*A service that times named tasks and reports their durations, classified by device platform and country code. Not available to creator scripts.*

- **Inherits:** [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] → [[30 Official Roblox Docs/API Reference/Classes/Object|Object]]
- **Memory category:** Instances
- **Tags:** `NotCreatable`, `Service`, `NotReplicated`

## Description

Not available to creator scripts. [[30 Official Roblox Docs/API Reference/Classes/StopWatchReporter|StopWatchReporter]] is used by the Roblox app to measure the duration of logic flows. Each measurement is classified by device platform and country code.

The service groups timing measurements into named reports. Starting a task begins timing a named task within a report and returns an integer task ID; finishing a task stops that task's timer; and sending a report finalizes it, submitting the elapsed time of each finished task and preventing any further tasks from being added to that report.

Timing is only collected on the Android and iOS clients; on other platforms these methods do nothing and starting a task returns `-1`.

---
*Source: [StopWatchReporter](https://create.roblox.com/docs/reference/engine/classes/StopWatchReporter) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
