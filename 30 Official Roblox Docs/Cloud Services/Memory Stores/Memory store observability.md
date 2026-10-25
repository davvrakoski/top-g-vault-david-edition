---
title: "Memory store observability"
description: "Explains how to use the observability dashboard for memory stores."
area: "30 Official Roblox Docs"
cluster: "Cloud Services"
source: "https://create.roblox.com/docs/cloud-services/memory-stores/observability"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to use the observability dashboard for memory stores.*

The memory stores observability dashboard provides real-time charts on your memory usage and API requests. It also has a built-in alert system that notifies you by email when an issue arises to help you troubleshoot in sync. For further information about specific errors, you can view your [[30 Official Roblox Docs/Production/Analytics/Error Report|Error Report]] to find the error logs.

## Access the dashboard

The memory stores observability dashboard is available for any game using [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreService|MemoryStoreService]], but you must either be the game owner or have [[30 Official Roblox Docs/Production/Analytics/Analytics dashboard|analytics group permissions]] to access the dashboard.

To access the dashboard:

1. Navigate to the [Creations](https://create.roblox.com/dashboard/creations) page on the **Creator Dashboard**.
2. Expand the account switcher in the upper-left and select your account or the group owning the target game.
3. Select the game.
4. In the **Monitoring** dropdown, select **Memory Stores**.

## Available charts

The dashboard includes two categories of line graphs:

- **Quota Usage** charts for tracking your usage compared to the [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores#Limits and quotas|dynamically allocated quotas]], which are calculated based on the number of users in your game.
  - **Memory Usage** on your memory usage per minute in bytes compared to how much your allocated quota left.
  - **API Request Unit** on your total request units per minute compared to how much your allocated quota left. This chart can be broken down by each API method.
- **API Usage and Performance** charts for monitoring the API usage pattern and performance based on API method and response status.
  - **Request Count by API** on API request count per minute by API method, such as [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreQueue#ReadAsync|MemoryStoreQueue:ReadAsync()]] or [[30 Official Roblox Docs/API Reference/Classes/MemoryStoreSortedMap#UpdateAsync|MemoryStoreSortedMap:UpdateAsync()]].
  - **Request Count by Status** on API request count by [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory store observability#Response status codes|response status]].
  - **Request by API x Status** on response statuses returned by all or a specific API method.

The chart contains data for the past 30 days, and you can select to view a custom time range with the selector at the top of the page. If you select a time range earlier than 30 days, the system returns a **Request Failed** error.

## Response status codes

The Observability Dashboard's **Request Count by Status** and **Requests by API x Status** charts include status codes of API responses that you can use to understand and troubleshoot errors. For a table that lists and describes all of these status codes, see [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores#Observability|Observability]]. In addition, for information on how to resolve these errors, or the specific quota or limit that an error relates to, see [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores#Troubleshooting|Troubleshooting]] and [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores#Limits and quotas|Limits and Quotas]], respectively.

## Notification alerts

The email alert system automatically detects and sends you alerts of memory store usage issues that can harm the performance of your game. There are two types of alerts:

- **Warnings** are alerts with lower priority about issues that can potentially impact your game. You should resolve them before they become critical issues. The dashboard flags these alerts by highlighting the chart in yellow with a warning message.
- **Criticals** are alerts with higher priority on issues directly impacting your game. You should resolve these issues as soon as possible to prevent degraded performance. The dashboard flags these alerts by highlighting the chart in red with an error message.

When your game triggers two types of alerts at the same time, the dashboard displays the alert header message and highlights the chart region for your attention as **Critical**.

Currently, the system has four built-in alerts for memory usage and API requests.  If your game exceeds an alerting threshold, the system notifies you at most once a day for each alert. When receiving an email alert, you should view the dashboard and take actions to prevent degraded performance.

### Memory usage alerts

The system sends the following memory usage alerts:

- A **Warning** alert when your game's memory usage has exceeded 70% of the total quota within the past hour.

   *(image in the full Top G Vault)*
- A **Critical** alert when your game exceeded the memory size quota for the past hour.

   *(image in the full Top G Vault)*

These issues usually occur when you overpopulate a memory store data structure with too much data, which can consume the quota quickly even if you only send requests on a few keys. For example, if you set a long expiration time on keys or don't clean up processed data, extra data can fill up your memory quota.

To prevent and resolve these issues, apply [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores#Best practices|best practices]] to keep track of data structures you're actively using and set up a mechanism for cleaning up processed data.

### API request alerts

The system sends the following API request alerts:

- A **Critical** alert when the number of your memory store request failures has exceeded 20% within the past hour.

   *(image in the full Top G Vault)*
- A **Critical** alert when more than 10% of your memory store requests are being throttled for the past hour.
  - This alert is based on the number of **DataStructureRequestsOverLimit** + **TotalRequestsOverLimit**, which are error responses indicating that your game is throttled because it sends too many requests.
  - This alert isn't related to the request size, only quantity.

   *(image in the full Top G Vault)*

  All API requests have corresponding [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory store observability#Response status codes|response status codes]], so you can view the ratio of **Success** responses to all error responses using the **Request Count by Status** chart for [[30 Official Roblox Docs/Cloud Services/Memory Stores/Memory stores#Troubleshooting|troubleshooting]].

---
*Source: [Memory store observability](https://create.roblox.com/docs/cloud-services/memory-stores/observability) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
