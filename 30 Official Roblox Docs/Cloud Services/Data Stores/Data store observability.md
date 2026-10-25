---
title: "Data store observability"
description: "Explains how to use the observability dashboard for data stores (DataStores)."
area: "30 Official Roblox Docs"
cluster: "Cloud Services"
source: "https://create.roblox.com/docs/cloud-services/data-stores/observability"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to use the observability dashboard for data stores (DataStores).*

The data stores observability dashboard provides real-time charts on your request counts and on your usage against future data store limits, and allows you to filter the request data by standard or ordered data stores.

*(image in the full Top G Vault)*

## Access the dashboard

The data stores dashboard is available for any game that uses [[30 Official Roblox Docs/API Reference/Classes/DataStoreService|DataStoreService]], but you must either be the game owner or have [[30 Official Roblox Docs/Production/Analytics/Analytics dashboard|analytics group permissions]] to access the dashboard.

1. Navigate to the [Creations](https://create.roblox.com/dashboard/creations) page on the **Creator Hub**.
2. Under the **Creator Hub** dropdown, select your account or the group owning the target game.
3. Select the game.
4. In the **Monitoring** dropdown, select **Data Stores**.

## Available charts

- **Storage Usage Bytes** on amount of data store storage and limit currently available for the selected universe.
- **Request Count by API** on API request count per minute by API method, such as [[30 Official Roblox Docs/API Reference/Classes/GlobalDataStore#SetAsync|DataStore:SetAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/OrderedDataStore#GetSortedAsync|OrderedDataStore:GetSortedAsync()]].
- **Request Count by Status** on API request count by [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store observability#Response status codes|response status]].
- **Request by API x Status** on response statuses returned by all or a specific API method.
- **Read Request Type Quota Usage** on number of read API method calls against future read category limits.
- **Write Request Type Quota Usage** on number of write API method calls against future write category limits.
- **List Request Type Quota Usage** on number of list API method calls against future list category limits.
- **Remove Request Type Quota Usage** on number of remove API method calls against future remove category limits.

Use the selector at the top of the page to filter by standard or ordered data stores. The default view includes standard data store only.

Use the **Explore** button next to each chart to deep dive into that metric, compare the current period against past periods, or break down that metric by its available categories.

Each chart contains data for the past 30 days, and you can select to view a custom time range with the selector at the top of the page. If you select a time range earlier than 30 days, the system returns a **Request Failed** error.

Data from the most recent three minutes might be incomplete, so it's normal to see a drop at the end of the charts.

Storage usage and limit are displayed in bytes, where 1 kilobyte is 1024 bytes.

## Response status codes

The dashboard's **Request Count by Status** and **Requests by API x Status** charts include status codes of API responses that you can use to understand usage and troubleshoot errors. For a table that lists and describes all of these status codes (aside from `200 OK`), see [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store error codes and limits#Error code reference|Error codes]].

## Service limits

For information on current limits, usage quotas, and future limits, see [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store error codes and limits#Limits|Limits]].

---
*Source: [Data store observability](https://create.roblox.com/docs/cloud-services/data-stores/observability) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
