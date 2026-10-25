---
title: "RTBF and creators"
description: "Explains the right to be forgotten and its impact on creators."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/publishing/RTBF-and-creators"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the right to be forgotten and its impact on creators.*

> [!info] What is RTBF?
> RTBF stands for the **right to be forgotten**, a principle in global privacy law that gives individuals the right to request the deletion of their personal data when it is no longer necessary. Honoring RTBF requests is a legal obligation for data controllers and is critical to maintaining user trust and regulatory compliance.

Global privacy regulations create rules for "controllers" of data, a term that means individuals or organizations that determine why and how data is processed. Privacy rules typically define "personal data" or Personally identifiable information (PII) broadly. It encompasses any information that relates to an identified or identifiable living individual. If a piece of data can be traced back to an individual user, it may be personal data subject to privacy regulations.

A fundamental principle across global frameworks is that controllers should not retain personal data indefinitely. Similarly, users can request the deletion of data that is no longer necessary. If a user requests that Roblox permanently delete their Roblox account, Roblox notifies creators so they can delete information that is no longer needed. The primary rule governing deletion is that personal data must be permanently erased after there is no longer a valid legal or business basis for processing it.

## RTBF notifications and automation

When an RTBF request affects one or more of your games, Roblox helps you identify and process the request in the following ways:

- **Roblox messages** — Roblox sends an automated message each day to your inbox that lists the RTBF requests requiring action and the affected games.
- **Automated data store deletion** — If you configure RTBF deletion templates for a game, Roblox uses them to automatically delete matching keys and data stores when it processes a request. For setup instructions, see [[30 Official Roblox Docs/Cloud Services/Data Stores/Data store right to be forgotten (RTBF)|Data store right to be forgotten (RTBF)]].
- **Creator webhooks** — If you configure a webhook with the **Right to Erasure Request** trigger, Roblox automatically invokes it for affected games. You can use the request payload in your own automation to delete personal data. For setup instructions and a sample workflow, see [[30 Official Roblox Docs/Cloud/Webhooks/Automate right to erasure using webhooks|Automate right to erasure using webhooks]].

For automation, first use automated data store deletion for supported data. Use a creator webhook for more complex cases, such as custom deletion logic, data store schemas that RTBF deletion templates don't support, or personal data stored outside of data stores.

> [!warning]
> Roblox always sends the daily RTBF message for affected games, regardless of whether you configure automated data store deletion or a creator webhook. You remain responsible for permanently deleting all personal data covered by an RTBF request. Review the daily message and verify that data outside configured templates or custom automation is also deleted.

---
*Source: [RTBF and creators](https://create.roblox.com/docs/production/publishing/RTBF-and-creators) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
