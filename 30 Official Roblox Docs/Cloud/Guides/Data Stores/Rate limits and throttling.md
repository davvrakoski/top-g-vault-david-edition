---
title: "Rate limits and throttling"
description: "Covers rate limits for the Open Cloud v2 Data Stores API."
area: "30 Official Roblox Docs"
cluster: "Cloud"
source: "https://create.roblox.com/docs/cloud/guides/data-stores/throttling"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Covers rate limits for the Open Cloud v2 Data Stores API.*

> [!info]
> The below limits apply only to [Open Cloud v1](https://create.roblox.com/docs/cloud/reference/features/storage#Datastores_ListDatastoresAsync) endpoints. For [Open Cloud v2](https://create.roblox.com/docs/cloud/reference/features/storage#Cloud_ListDataStores) rate limits, see [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store error codes and limits#Access limits|Data store error codes and limits]].

The [Data Stores API](https://create.roblox.com/docs/cloud/reference/features/storage) enforces two types of throttling: **requests per minute** and **throughput**. Each game allows a certain number of requests per minute and a certain amount of data per minute. These limits are enforced for the universe (experience / game) regardless of the number of API keys used.

Unlike the Engine API, these limits do **not** scale based on user count. Exceeding either one causes the endpoint to return `429 Too Many Requests`.

## Legacy standard data stores throttling limits

These limits apply to the legacy `/datastores/v1/` endpoints.

| Request type | Method | Throttle limits |
| --- | --- | --- |
| Write | • Create Data Store Entry<br>• Delete Data Store Entry<br>• Update Data Store Entry<br>• Increment Data Store Entry | • 10 MB/minute/universe write throughput<br>• 300 requests/minute/universe |
| Read | • List Data Stores<br>• List Data Store Entries<br>• Get Data Store Entry<br>• List Data Store Entry Revisions | • 20 MB/minute/universe read throughput<br>• 300 requests/minute/universe |
| Delete | • Delete Data Store<br>• Undelete Data Store | • 300 requests/minute/universe |

## Legacy ordered data stores throttling limits

These limits apply to the legacy `/ordered-data-stores/v1/` endpoints.

| Request type | Method | Throttle limits |
| --- | --- | --- |
| Write | • Create Ordered Data Store Entry<br>• Delete Ordered Data Store Entry<br>• Update Ordered Data Store Entry<br>• Increment Ordered Data Store Entry | • 300 requests/minute/universe |
| Read | • List Ordered Data Store Entries<br>• Get Ordered Data Store Entry | • 300 requests/minute/universe |

---
*Source: [Rate limits and throttling](https://create.roblox.com/docs/cloud/guides/data-stores/throttling) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
