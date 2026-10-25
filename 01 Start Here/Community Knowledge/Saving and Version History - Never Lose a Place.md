---
area: "01 Start Here"
cluster: "Start Here"
title: "Saving and Version History - Never Lose a Place"
tags: [roblox, community-knowledge, start-here, saving, version-history, backup]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/version-history
  - https://create.roblox.com/docs/projects/place-files
  - https://create.roblox.com/docs/projects/collaboration
  - https://create.roblox.com/docs/studio/setup
---
# Saving and Version History - Never Lose a Place

Losing a day of building to a crash, a bad free model or a teammate's mistake is a rite of passage nobody needs. Roblox keeps every saved version of every place in the cloud, Studio writes local recovery files, and you can export your own copies. This note explains the three save types, how to make named checkpoints, and exactly how to roll back.

## Three ways your work gets stored

| Method | Where it goes | When to use |
| --- | --- | --- |
| **Save to Roblox** (File menu) | Cloud, as a new place version | Every working session, many times |
| **Publish to Roblox** (`Alt+P`) | Cloud, and becomes the version new servers run | When you want players to get the change |
| **Save to File** (`.rbxl` / `.rbxlx`) | Your disk | Extra backups, Git workflows, sharing a copy |

Key point: **saving is not publishing.** You can save 50 times a day; players only see what you publish.

`.rbxl` is the compact binary format; `.rbxlx` is XML (larger, but text-diffable). Places can be up to 100 MB; beyond that, Save and Publish to Roblox might fail.

## Make named checkpoints

**File > Save to Roblox with Notes** (`Ctrl+Alt+S` / `Cmd+Option+S`) asks for a version name and notes. Use it:
- before inserting free models or running a plugin that edits many objects,
- before a big refactor,
- at the end of each work session ("end of day: stages 1-10 done, checkpoints working").

Publishing **requires** notes. Studio can also draft publish notes by summarising the version notes written since the last publish (**File > Publish with Notes**); you review before anything is saved.

## Find a version

**Window > Version History** opens a dockable panel. You can:
- search across version notes,
- filter by date, auto vs manual saves, published saves, collaborator, and whether notes exist,
- see who was in the session and who saved.

Older versions created before this panel existed lack the new metadata; add notes to them to make them searchable.

## Roll back (two routes)

**From Studio** (safest, lets you inspect first):
1. Version History > the version's **...** menu > **Open Local Copy**.
2. Check it is the one you want.
3. **File > Save to Roblox As** > pick the same game and place > confirm.

**From the Creator Dashboard:**
1. Creations > game > **Configurations > Places** > the place.
2. **Version History** > **Restore** next to the version > confirm.

Either route creates a **new** version; history is never deleted. Restoring does **not** publish. If the game is public, open it, publish, and restart servers.

## Scripts have their own history

In collaborative places every script change (auto-save, save, or a Drafts commit) is logged per script. Right-click a script for its version history to see who changed what and open older copies. Details: [[Team Create for Beginners - Collaborators, Live Scripting and Drafts]].

## When Studio crashes

- If collaboration is **on**, the cloud copy is usually current; failed save attempts are kept as the last three recovery files.
- If collaboration is **off**, Studio uses the **Auto-Recovery** settings (Studio Settings, `Alt+S`, search "auto").
- Recovery files live in `%LOCALAPPDATA%\Roblox\RobloxStudio\AutoSaves` on Windows and `~/Library/Application Support/Roblox/RobloxStudio/AutoSaves/` on Mac. Open them with File > Open from File.

## A simple backup routine

1. Save to Roblox every 15-30 minutes (it is quick; build the habit).
2. Named checkpoint before risky steps.
3. Once a week, **File > Save to File** into a dated folder outside Studio.
4. When code grows, put scripts in Git (Script Sync or Rojo) so you have line-by-line history.

## Pitfalls

- "I restored but players still see the bug": you did not publish the restored version or restart servers.
- A place nearing 100 MB is a warning sign: the docs suggest checking for obfuscated scripts (possible backdoors), duplicate hidden parts, and overly complex terrain.

## Related
[[00 START HERE - Top G Vault]] · [[Publishing Your First Experience - 2026 Release Checklist]] · [[Git Script Sync Rojo Team Workflow]] · [[Rollback Drills - Rehearsing a Bad Release]] · [[30 Official Roblox Docs/Projects/Version History|Version History (official)]]
