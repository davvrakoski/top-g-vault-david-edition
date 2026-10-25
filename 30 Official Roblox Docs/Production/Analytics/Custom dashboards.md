---
title: "Custom dashboards"
description: "Custom dashboards let you assemble the metrics you care about into a single, shareable view tailored to your experience."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/analytics/custom-dashboards"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Custom dashboards let you assemble the metrics you care about into a single, shareable view tailored to your experience.*

**Custom dashboards** let you build personalized analytics views tailored to your experience. Instead of jumping between multiple pages, you can assemble all the metrics you care about into a single, shareable dashboard, so you don't have to rebuild the same charts for your [[30 Official Roblox Docs/Production/Analytics/Custom events|custom events]] every time you open analytics.

You'll find your dashboards under **Custom dashboards** in the left navigation of your experience.

## Create and publish a dashboard

From the **Custom dashboards** landing page, you can create, edit, rename, and delete dashboards. All published dashboards are visible to anyone on your team with permission to view analytics. For group experiences, see [[30 Official Roblox Docs/Projects/Groups (teams)#Roles and permissions|roles and permissions]] for details on how to grant access to analytics. You can create up to 20 dashboards per experience.

*(image in the full Top G Vault)*

*Create, rename, delete, and pin dashboards from the **Custom dashboards** landing page.*

To create a dashboard:

1. **Open a canvas**: Go to **Custom dashboards** ⟩ **Manage all**, then click **Create**.
2. **Name it**: Group metrics by what matters, for example **Economy Health**, **Live-Ops**, or **Retention**.
3. **Customize widgets**: Add charts, tables, or summary cards. Drag to resize and rearrange them so your most important metrics are front and center.
4. **Set default settings**: Adjust your landing defaults for time range, breakdowns, annotations, and granularity.
5. **Publish to save**: Click **Publish** to save the dashboard.

> [!warning]
> A dashboard is only saved when you publish it. If you leave the page without publishing, you lose your changes.

*(image in the full Top G Vault)*

*A custom dashboard groups related charts and summary cards into a single view.*

## Add charts to a dashboard

There are three ways to add charts to a custom dashboard:

- **From a custom dashboard**: Click **Add widget** to configure a new chart from scratch.
- **From the Explore page**: Click **Add to dashboard** on any chart you build in Explore.
- **From another dashboard**: Click the overflow menu on any existing chart and select **Add to custom dashboard**.

See the [[30 Official Roblox Docs/Production/Analytics/Analytics dashboard#Explore|Explore page]] to learn more about chart customization options.

*(image in the full Top G Vault)*

*Build a chart in Explore, then click **Add to dashboard** to save it to a custom dashboard.*

*(image in the full Top G Vault)*

*Open a chart's overflow menu and select **Add to custom dashboard** to copy it into another dashboard.*

## Add summary cards

Summary cards display a single number for a metric, which makes them ideal for top-of-dashboard KPIs. Summary cards support:

- **Aggregation types**: Average over the time period, the most recent data point, or cumulative over the time period. All time periods reflect the dashboard-level date range selected.
- **Custom names**: A label of your choosing.

Use summary cards to surface your most important numbers, such as daily revenue, D1 retention, or peak CCU.

*(image in the full Top G Vault)*

*Summary cards surface a single KPI value at the top of a dashboard.*

## Pin a dashboard to the navigation

For the views you check every day, pin them to the left navigation so they're always one click away. Enable the **Pin to sidebar** toggle for a dashboard on the **Custom dashboards** landing page, and it appears in the left navigation under **Custom dashboards**.

*(image in the full Top G Vault)*

*Enable **Pin to sidebar** to add a dashboard to the left navigation for one-click access.*

---
*Source: [Custom dashboards](https://create.roblox.com/docs/production/analytics/custom-dashboards) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
