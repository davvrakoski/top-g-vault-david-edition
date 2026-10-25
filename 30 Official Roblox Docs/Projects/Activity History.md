---
title: "Activity History"
description: "Activity History is a log of key configuration, publish, and edit activities within a place."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects/activity-history"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Activity History is a log of key configuration, publish, and edit activities within a place.*

**Activity History** is a shared log of key changes within a game. Each entry tells you what changed, who changed it, and when they made the change.

1. From Studio's **Window** menu, open **Activity History**. Events are displayed in chronological order, with the most recent appearing first.

   *(image in the full Top G Vault)*

1. If you have a large number of events, you can filter them by type or collaborator.
1. If you want to manage the configuration or get more details on a change, use the **⋯** menu next to each event to get a link to the setting in either Studio or the Creator Hub.

## Event reference

Most events are visible in both Studio and the game's **Activity History** page on the [Creator Dashboard](https://create.roblox.com/dashboard/creations), although some are only visible in one location or the other.

### Place configuration

Event | Shown in Studio | Shown in Creator Hub
:--- | :---: | :---:
Place published | ✓ | ✓
Place name changed | ✓ | ✓
Place description changed | ✓ | ✓
Place added to game | | ✓
Place removed from game | | ✓
**Allow place to be copied as a template using Create Place API** changed | ✓ | ✓
**Allow place to be updated using Save Place API** changed | ✓ | ✓

### Place edits

Event | Shown in Studio | Shown in Creator Hub
:--- | :---: | :---:
Script draft committed | ✓ |

### Game configuration

Event | Shown in Studio | Shown in Creator Hub
:--- | :---: | :---:
Audience access changed | ✓ | ✓
Game name changed | ✓ | ✓
Game description changed | ✓ | ✓
Game archived | ✓ | ✓
Age recommendation questionnaire updated | ✓ | ✓
**Shut down all servers** used | ✓ | ✓
Playable devices changed | ✓ | ✓
**Enable Studio Access to API Services** enabled or disabled | ✓ | ✓

### Monetization settings

Event | Shown in Studio | Shown in Creator Hub
:--- | :---: | :---:
**Paid Access** enabled or disabled | ✓ | ✓
Paid access price changed | ✓ | ✓
**Allow Private Servers** enabled or disabled | ✓ | ✓
Private servers price changed | ✓ | ✓

### Notifications

Event | Shown in Studio | Shown in Creator Hub
:--- | :---: | :---:
Notification string created | | ✓
Notification string deleted | | ✓
Notification string updated | | ✓

For more information, see [[30 Official Roblox Docs/Production/Promotion/Experience notifications|Experience notifications]].

### Collaboration permissions

Event | Shown in Studio | Shown in Creator Hub
:--- | :---: | :---:
Collaborator added with edit or play permissions | ✓ | ✓
Collaborator permissions level changed | ✓ | ✓
Collaborator removed | ✓ | ✓
Group given play permissions | ✓ | ✓
Group with play permissions removed | ✓ | ✓
Group role's permissions to this game changed | ✓ | ✓

For more information, see [[30 Official Roblox Docs/Projects/Groups (teams)#Roles and permissions|Roles and permissions]].

---
*Source: [Activity History](https://create.roblox.com/docs/projects/activity-history) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
