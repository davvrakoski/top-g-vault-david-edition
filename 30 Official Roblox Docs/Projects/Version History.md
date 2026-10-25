---
title: "Version History"
description: "Manage saved and published versions of a place with Version History."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects/version-history"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Manage saved and published versions of a place with Version History.*

**Version History** lets you track, manage, and restore saved and published versions of a place. You can use it to create and find development checkpoints, collaborate with other creators, and quickly roll back to a known good state when needed.

With Version History, you have access to the following:

- **Version notes**: Descriptive notes you can add to your saved and published places to create clear checkpoints for development milestones.
- **Search**: Search across version notes to more easily find the place version you're looking for.
- **Advanced filtering**: Filter by date range, save type (auto or manual), published saves, collaborator, and whether a save has version notes attached to it.
- **Tracking collaborators**: Track who was in a place edit session and who saved the place.
- **Dockable widget**: A Version History widget you can position anywhere in your Studio layout for easier access. You can access this widget by going to **Window** > **Version History**.

   *(image in the full Top G Vault)*

> [!info]
> Place versions created before Version History was introduced do not include the new metadata fields and cannot be searched or filtered by them. Add notes to older versions to make them searchable.

## Create a save with version notes

1. Go to **File** > **Save to Roblox with Notes**.
2. Enter a version name and any notes you might have.
3. Click **Save**.

  *(image in the full Top G Vault)*

You can also use the following keyboard shortcuts to save your current place version with version notes:

- Windows: <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>S</kbd>
- macOS: <kbd>Cmd</kbd> + <kbd>Option</kbd> + <kbd>S</kbd>

## Publish with version notes

Version notes are required when publishing so you can clearly track what changes were released to your players. To publish with version notes:

1. Go to **File** > **Publish**.
2. Select **Publish**.
3. Enter a version name and any notes you might have.
4. Click **Publish**.

## Generate publish notes

Studio can automatically draft publish notes for you by summarizing all of the version notes your team wrote between the previous publish and the current one. Because the summary is generated only from those version notes, no notes between the two publishes means no summary is generated; the more consistently your team logs notes on their saves, the more complete the summary is.

Generated notes are always optional and are never saved without your approval. You can edit, keep, or dismiss any summary before writing it to the version notes. To generate publish notes, use either of the following methods:

- Go to **File** > **Publish with Notes**, review and edit the drafted summary, then publish.
- Go to **Window** > **Version History**, then click **Edit Notes** on a published version.

## Restore to a previous version

You can restore to a previous place version through Studio or the Creator Dashboard. This action creates a new version of the place.

> [!info]
> Restoring a place to a previous version does **not** automatically publish the changes. If the place is [[30 Official Roblox Docs/Production/Publishing/Create and publish games and places#Release games|public]] and you want the restored version to replace the live version, open the place in Studio, publish it, and [[30 Official Roblox Docs/Projects/Release game updates#Restart servers|restart your servers]].

Through Studio:

1. Go to **Window** > **Version History** to open the Version History window.
2. Click **⋮** next to the version you want to restore to.
3. Click **Open Local Copy** to open a copy of the place in a new Studio session.
4. In the new Studio session, go to **File** > **Save to Roblox As**.
5. Select the game and place you want to overwrite.
6. Confirm the action to restore to that version.

Through the Creator Dashboard:

1. Go to [Creations](https://create.roblox.com/dashboard/creations) and select a game.
2. In the left-hand navigation, navigate to **Configurations** > **Places**.
3. Select the place you want to restore to a previous version.
4. Go to **Version History**.
5. Click **Restore** next to the version you want to restore to.
6. Confirm the action to restore to that version.

---
*Source: [Version History](https://create.roblox.com/docs/projects/version-history) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
