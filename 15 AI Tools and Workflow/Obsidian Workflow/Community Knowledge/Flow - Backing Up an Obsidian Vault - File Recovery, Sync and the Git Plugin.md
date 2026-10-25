---
area: "15 AI Tools and Workflow"
cluster: "Obsidian Workflow"
title: "Backing Up an Obsidian Vault - File Recovery, Sync and the Git Plugin"
tags: [roblox, community-knowledge, obsidian, backups, git]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://obsidian.md/help/plugins/file-recovery
  - https://obsidian.md/help/sync
  - https://github.com/Vinzent03/obsidian-git
---
# Backing Up an Obsidian Vault - File Recovery, Sync and the Git Plugin

A game design vault slowly becomes the only copy of your design decisions, balance notes, asset licences and resume notes for AI agents. Losing it hurts more than losing a week of code, because code is in Git and the reasons behind it are not. Obsidian vaults are plain folders of Markdown, so backing them up is easy, but the built-in safety net is **not** a backup. This note sorts the options.

## Layer 1: File recovery (core plugin) is an undo, not a backup

- Saves snapshots at least **5 minutes** apart and keeps them **7 days** by default (both adjustable in **Settings > Core plugins > File recovery**).
- Restore: **Snapshots > View**, pick the file, pick a snapshot, **Copy** or **Restore**; **Show changes** shows a diff.
- Limits from the docs: only `.md` and `.canvas` files; snapshots stay on each device and do not sync; they are stored outside the vault keyed by its absolute path, so moving the vault hides old snapshots; clearing history deletes them permanently. The docs state it is not a complete backup solution.

Use it for "I overwrote that paragraph an hour ago". Do not rely on it for anything else.

## Layer 2: Sync (devices) is also not a backup

Obsidian Sync (paid) or a cloud folder (OneDrive, Dropbox, iCloud) keeps devices in step. Sync services replicate deletions too, so a deleted folder disappears everywhere. Obsidian Sync keeps version history for a period depending on plan (check the current Sync docs); cloud folders have their own version history. Never put the same vault in two sync systems at once (for example Obsidian Sync inside a OneDrive folder); conflicts and duplicates follow.

## Layer 3: Git, a real history

Because the vault is text, Git is a natural fit, and it can live in the same GitHub account as your game.

**Option A, the Obsidian Git community plugin** (MIT licence):
- Automatic commit-and-sync on a schedule, auto-pull on startup, a **Source Control View** (stage, commit, diff) and a **History View**.
- The author describes mobile support as very unstable (no SSH, memory limits, possible crashes on large vaults). Use it on desktop; on phones, sync another way.

**Option B, Git by hand or a scheduled script** if you prefer not to install plugins.

A starter `.gitignore` for a vault:

```
.obsidian/workspace.json
.obsidian/workspace-mobile.json
.trash/
.DS_Store
```

Keep the rest of `.obsidian/` (plugins list, graph settings, hotkeys) in Git so teammates get the same setup. Large images and videos: consider Git LFS or keep them in an attachments folder backed up separately ([[Git for Roblox Repos - .gitignore, Binary Places and LFS]]).

**Private repo only.** Design vaults contain unreleased plans, revenue numbers and sometimes player reports.

## Layer 4: an off-site copy

Once a month, zip the vault to an external drive or a different cloud. If your Git host account is lost, this is your last line.

## Recommended setup for a Roblox dev

| Need | Tool |
|---|---|
| Undo recent edit | File recovery |
| Same vault on PC and laptop | Obsidian Sync or one cloud folder |
| History, review, blame, share with team | Git (plugin or manual), private repo |
| Disaster | Monthly zip off-site |

## Team vaults

- Pull before you edit, commit small, push often; merge conflicts in Markdown are easy, conflicts in `workspace.json` are noise (hence ignoring it).
- One person owns plugin choices; plugin folders in Git mean everyone runs the same code, so review them like any third-party code ([[Plugin and MCP Supply-Chain Security]]).

## Related
[[Obsidian Workflow - Hub]] · [[Obsidian Vault Structure]] · [[Obsidian Workflow for a Roblox Dev Team]] · [[Flow - Disaster Recovery for a Roblox Game - Places, Code, Assets, Data and Accounts]]
