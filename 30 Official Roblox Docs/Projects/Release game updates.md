---
title: "Release game updates"
description: "Explains how to release updates for games."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects/update-games"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to release updates for games.*

When you publish an updated version of a game to Roblox, players aren't immediately removed from old versions of the game. Instead, you can migrate players to the updated version by restarting all of your outdated servers.

If you don't restart servers, players transition to the new version of the game as the servers running old versions eventually empty and shut down. This option is non‑disruptive, but your player base might be playing different versions of the game for a prolonged period of time; if your underlying player data format changes, you should probably restart servers.

For time-sensitive updates, you might prefer to deploy early, hide content behind a [[30 Official Roblox Docs/Production/Experience configs|config]], and then change the config value to release your new content.

## Restart servers

To restart servers for release updates:

1. Go to [Creations](https://create.roblox.com/dashboard/creations) and select the game you want to restart servers for.
1. In the left-hand navigation, navigate to **Configurations** > **Server management**.
1. Select the places you want to restart.
1. Click **Restart Servers**.
1. In the **Confirm Server Restart** dialog:
   1. Select one or both of the following restart options:
      - **Restart only servers with outdated versions** to avoid restarting servers that are running the latest published place version.
      - **Delay server restart** to delay the shutdown of servers and allow players a set time between 1 and 60 minutes to leave the game on their own instead of being temporarily disconnected. This is also known as server bleed-off.
   1. Click **Restart**.

> [!warning]
> Unless you have a game update workflow that is independent of place version, it's recommended that you always select **Restart only servers with outdated versions** to avoid unnecessarily disconnecting players.

After you restart servers, Roblox:

1. Stops all matchmaking to servers designated for shutdown. Players who join your game by clicking the **Play** button will not be matched to these servers, but they can still join them by accepting invites, teleporting, or joining another user from their profile.
1. Waits for the configured delay time, if you selected the **Delay server restart** option.
1. Automatically teleports players to the updated version of the game. All players on the same old server are sent to the same replacement server running the new version.

> [!info]
> If you want to completely shut down your game and not allow players to reconnect after you restart your servers, you must revoke access to your game from the [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places#Target audience|public]].

## Notifications on servers

When you launch a delayed server restart, the [[30 Official Roblox Docs/API Reference/Classes/DataModel#ServerRestartScheduled|DataModel.ServerRestartScheduled]] event will fire on affected servers with the following arguments:

- `restartTime` — A [[30 Official Roblox Docs/API Reference/Datatypes/DateTime|DateTime]]. The earliest time the server is scheduled to shut down.
- `source` — This will always be [[30 Official Roblox Docs/API Reference/Enums/CloseReason|Enum.CloseReason.DeveloperUpdate]] for your published updates.
- `attributes` — An optional JSON object you can use to provide custom information about the restart, such as the update reason, urgency, etc.

In your server scripts, you can subscribe to this event to provide players with information about the upcoming restart. You might choose to provide a countdown timer in your UI, prompt players to save their progress, or teleport them to updated servers at the most convenient time.

Servers will also be notified when Roblox needs to restart servers for infrastructure maintenance reasons. The same [[30 Official Roblox Docs/API Reference/Classes/DataModel#ServerRestartScheduled|DataModel.ServerRestartScheduled]] event fires, with `source` as [[30 Official Roblox Docs/API Reference/Enums/CloseReason|Enum.CloseReason.RobloxMaintenance]] and `attributes` as an empty dictionary.

---
*Source: [Release game updates](https://create.roblox.com/docs/projects/update-games) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
