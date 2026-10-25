---
area: "15 AI Tools and Workflow"
cluster: "Open Source Licensing"
title: "Code Licenses Compared for Roblox Devs - MIT, Apache, MPL, GPL, AGPL"
tags: [roblox, community-knowledge, licensing, open-source, mit, apache, mpl, gpl, agpl]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://choosealicense.com/licenses/
  - https://choosealicense.com/appendix/
  - https://www.mozilla.org/en-US/MPL/2.0/FAQ/
---
# Code Licenses Compared for Roblox Devs - MIT, Apache, MPL, GPL, AGPL

Every open-source Roblox library, kit or uncopylocked game you pull in comes with a license, and the license decides what you must do when your game ships. A Roblox game is distributed to players (client scripts are downloaded to their devices), so "distribution" conditions generally matter. This note compares the licenses you will actually meet on GitHub and the DevForum, in plain terms. It is general information, not legal advice; for a commercial project with real money at stake, ask a lawyer.

**This vault's rule:** only **CC0, CC BY 4.0 and MIT** count as *bundle-safe*. Everything else is *link only* (use it as an installed dependency with its notices, or study it, but do not paste it into our shared libraries).

## The table (permissions/conditions per choosealicense.com)

| License | Must keep notice | Must share your source | Scope of "share alike" | Patent grant | Typical Roblox examples |
| --- | --- | --- | --- | --- | --- |
| **MIT** | yes | no | none | not explicit | Promise, Fusion, Trove, Janitor, Iris, Cmdr, luau-lsp |
| **BSL-1.0** | for source copies | no | none | not explicit | rare |
| **Unlicense / CC0** | no | no | none | no (CC0's legal code says patent rights are not waived or licensed) | some templates and art |
| **Apache-2.0** | yes, plus NOTICE file, and **state changes** | no | none | **yes** | Rodux, ReplicaService |
| **MPL-2.0** | yes | **only for MPL files you modify** | **per file** | yes | Wally (the tool), Zombie Strike source, Imperium |
| **LGPL-3.0** | yes, state changes | yes for the library | the library | yes | rare in Luau |
| **GPL-3.0** | yes, state changes | **yes, whole combined work** | whole program | yes | some plugins and chassis kits |
| **AGPL-3.0** | yes, state changes | yes, and network use counts as distribution | whole program | yes | Templater (Obsidian plugin) |

## What each means for a Roblox game

**MIT / BSL / Unlicense / CC0.** Use freely, commercially. Keep the copyright and license text (MIT/BSL). Easiest: a `THIRD_PARTY_LICENSES.md` in your repo and a credits entry ([[Attribution in Practice - Credits Screens and License Files]]).

**Apache-2.0.** Like MIT plus: keep any NOTICE file, mark files you changed, and you get an explicit patent licence. Fine to depend on; this vault calls it link-only only because of the stricter notice duties.

**MPL-2.0 (file-level copyleft).** You can combine MPL files with your closed game code. If you **modify an MPL-licensed file**, that file's source must stay available under MPL; your other files stay yours. Keep MPL files separate and unmodified when possible.

**GPL-3.0 (strong copyleft).** If you distribute a work that includes GPL code, the whole combined work must be offered under GPL with source. Roblox games are not usually open-sourced, so GPL code inside a closed game is a real compliance problem. Practical rule: **don't put GPL code in a closed-source game**; use it only to learn from, or in projects you intend to open-source under GPL ([[Entity RA - GPL Land Vehicle Chassis From the A-Chassis Line]] is an example of a GPL kit).

**AGPL-3.0.** GPL plus "users interacting over a network count as distribution". Avoid in game code entirely.

**No license at all.** Code on GitHub or the forum with no license is **all rights reserved**: you may read it, not copy it. "It's public" is not permission ([[Common Bad Advice to Avoid]]).

## Roblox-specific notes
- Creator Store assets use Roblox's own terms, not these licenses; check each asset ([[Using Creator Store VFX Packs Safely]]).
- Roblox's official kits often use a "limited use" license that allows use only on Roblox ([[Roblox Battle Royale Kit - Official (Limited Use License)]]).
- Roblox Creator Docs text is CC BY 4.0 and code samples MIT (stated on every mirrored doc page in this vault).

## Choosing a license for your own open-source library
- Want maximum adoption: **MIT**.
- Want patent clarity and a NOTICE file: **Apache-2.0**.
- Want improvements to your files to stay open, but allow closed games: **MPL-2.0**.
- Want everything built on it to stay open: **GPL-3.0** (expect few Roblox games to use it).

## Related
[[Open Source Licensing - Hub]] · [[IP, Licensing and Asset Due Diligence]] · [[Open-Source Evaluation Rubric]] · [[How to legally build on an open-source Roblox game]]
