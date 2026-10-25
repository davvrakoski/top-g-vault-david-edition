---
area: "40 Community Resources"
cluster: "Open Source Games"
source_note: "community/open-source-games/legal-basics"
title: "How to legally build on an open-source Roblox game"
tags: [roblox, community, open-source, games, "cluster/open-source-games", licensing, mit, apache-2.0, mpl-2.0, cc0, unlicense, uncopylocked]
verified: 2026-10-25
license: "n/a (guide)"
sources:
  - https://choosealicense.com/licenses/
  - https://create.roblox.com/docs/projects/configure-games-and-places
  - https://create.roblox.com/docs/resources/limited-use-license
cssclasses: [tg-a40]
---
# How to legally build on an open-source Roblox game

Plain-language basics for using any game in [[Open Source Games - Hub]] as the base of your own game. This is not legal advice; for a commercial launch with real money at stake, ask a lawyer.

## 1. Know what the license actually covers
A license covers **what the author owns**: usually the code, and sometimes the art they made. It does not cover:
- Toolbox models, audio or animations someone else uploaded that ended up inside a `.rbxl`.
- Assets loaded by ID from the author's Roblox account (they may not even load in your game; private audio and animations are blocked for other owners).
- Names, logos and characters (trademarks). No common license grants these.

## 2. What each license lets you do
| License | Use in a paid / monetized game | What you must do | Watch out |
|---|---|---|---|
| **MIT** | Yes | Keep the copyright line and license text with the code (a `LICENSE` ModuleScript or a credits screen is the usual Roblox way) | Nothing else; no warranty |
| **Apache-2.0** | Yes | Keep LICENSE and any NOTICE file, mark files you changed | Grants patents, but not the project's names or logos |
| **MPL-2.0** | Yes | Files you take **and modify** stay MPL-2.0; make their source available (a public repo of those files is the simple way). Your own new files can be closed | Keep MPL code in separate files so the rest of your game stays yours |
| **Unlicense / CC0** | Yes | Nothing (credit is still good manners) | CC0 explicitly excludes trademark and patent rights |
| **GPL-2.0 / GPL-3.0** | Risky on Roblox | Whole-work copyleft: the combined game would need to be GPL with source offered | Left out of this catalogue on purpose |
| **No license file** | No | You have no permission, even if the README says "free" | Ask the author to add a license, or skip it |

## 3. Uncopylocked places
- Uncopylocking is a Roblox place setting: the owner lets other creators open an editable copy of the place in Studio. It is **not** a separate license; Roblox's Terms of Use govern it.
- Only trust uncopylocked places published by the real creator or by Roblox. Copies of popular games uploaded by random accounts are usually stolen; using them can get your game taken down.
- Roblox's own templates say to publish them as your own game, which is about as clear a permission as Roblox gives.

## 4. Roblox Limited Use License (official kits)
Used by the Battle Royale kit, Weapons Kit and NPC Kit. It lets you put the kit into your own Roblox experiences and modify it for that, but it is revocable, Roblox-only and non-transferable, and you must keep attribution. Do not resell the kit code itself. Full text: [[Limited use license]].

## 5. A safe checklist before you publish
1. Save the LICENSE (and NOTICE) from the source repo into your project and your [[Asset and License Log Template]].
2. Add a credits entry, for example: "Uses code from Slither by littensy (MIT)".
3. Rename the game and replace the logo, icon, thumbnails and UI branding.
4. Open the Explorer and audit every model, decal, sound and animation: keep only what the author made, what you made, or what has its own clear license. Replace the rest.
5. Re-upload art and audio under your own account or group so nothing depends on another creator's asset permissions.
6. Make it yours: change the core loop or content enough that it is not a re-upload. Several authors here ask for exactly that.
7. Keep a dated copy of the license page you relied on.

## 6. Never
- Use leaked, stolen or "uncopylocked" copies of other people's games.
- Use ripped assets from other commercial games, even inside an otherwise MIT project.
- Remove someone's copyright notice or claim their project as your own.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Games - Hub]]

**Related notes:** [[IP, Licensing and Asset Due Diligence]] · [[Open-Source Evaluation Rubric]] · [[Asset and License Log Template]] · [[Reference IP, Originality and Asset Rights]] · [[Configure games and places]] · [[Free Tools and Assets - License Rules for This Folder]]

<!-- TDOD_GRAPH_END -->
