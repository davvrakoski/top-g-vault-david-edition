---
area: "15 AI Tools and Workflow"
cluster: "Open Source Licensing"
title: "Attribution in Practice - Credits Screens and License Files"
tags: [roblox, community-knowledge, licensing, attribution, credits, tasl, compliance]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://wiki.creativecommons.org/wiki/Best_practices_for_attribution
  - https://choosealicense.com/licenses/mit/
  - https://choosealicense.com/licenses/apache-2.0/
---
# Attribution in Practice - Credits Screens and License Files

Using MIT code and CC BY assets is free, but "free" comes with one duty most Roblox games skip: **attribution**. MIT requires the copyright and license notice to travel with the code; CC BY requires reasonable credit to the author; Apache-2.0 adds a NOTICE file. Doing this properly takes an hour once, protects you from takedowns, and is good manners toward the people whose work you used. This note gives a concrete system for a Roblox project. (General information, not legal advice.)

## Two places credits live

1. **In the repository** (for code): a `THIRD_PARTY_LICENSES.md` (or a `licenses/` folder) with the full license text and copyright line of every bundled library. For Wally packages, the package folders usually include a LICENSE; keep them, and list them in the file anyway.
2. **In the game** (for assets and, ideally, code): an in-game **Credits** panel, plus a link to a credits page (game description, group page, or a public doc).

For code inside a Luau module you copied (MIT), keep the license header comment at the top of the file. Deleting it is the most common violation.

## TASL: the CC attribution formula

Creative Commons recommends four elements:
- **T**itle of the work (optional under CC 4.0, required in 3.0 and earlier)
- **A**uthor, using the name or pseudonym they ask for
- **S**ource, a link to the original page (not a shortened URL)
- **L**icense, named and linked (for example "CC BY 4.0")

If you modified it, say so: "Cropped and recoloured from original." For several assets, give each its own line so it's clear which credit belongs to which work.

Example credit lines:
```
"Rusty Metal 03" by J. Doe - https://example-texture-site/rusty-03 - CC BY 4.0 (recoloured)
Explosion sound "boom_big" by SomeAuthor - https://freesound.org/... - CC0 (credit appreciated)
Promise library (c) evaera - https://github.com/evaera/roblox-lua-promise - MIT
```

## Fitting credits into a Roblox UI

Roblox screens are small and players skip credits, but the CC guidance says reasonable attribution depends on the medium. A workable pattern:

- A **Credits** button in the settings or main menu opens a scrolling list grouped by type (Code, Art, Audio, Music, Fonts).
- Each entry: work name, author, license short name. Put full URLs in a public credits page and say "Full links: see game description / group page".
- Keep the list as data (a ModuleScript table) generated from your asset log, so it never drifts from reality.

```lua
-- ReplicatedStorage/Shared/CreditsData.luau (own example)
return {
	{ kind = "Code", work = "Promise", author = "evaera", license = "MIT" },
	{ kind = "Audio", work = "boom_big", author = "SomeAuthor", license = "CC0" },
}
```

Note that Roblox text filtering does not apply to developer-authored static text, but anything players type (for example "credit your builder" fields) does need filtering.

## Apache-2.0 extras
Keep the project's NOTICE file contents with your third-party licenses, and if you modified Apache-licensed files, add a "changed by" note in those files.

## Keep the log first, credits second
Credits are only as good as the asset log. Record every external asset when you add it (source URL, license, date, screenshot of the license page, where it is used) using [[Asset and License Log Template]]. Before each release, regenerate the credits data from the log.

## Checklist
- [ ] License headers intact in copied code.
- [ ] `THIRD_PARTY_LICENSES.md` lists every library and asset with full license text or link.
- [ ] In-game Credits panel with TASL-style lines.
- [ ] Modified assets say "modified".
- [ ] NC/ND assets: none in the game ([[Creative Commons for Game Assets - What Each License Allows]]).

## Related
[[Open Source Licensing - Hub]] · [[Asset and License Log Template]] · [[Free Animation Credits - Attribution Lines]] · [[Code Licenses Compared for Roblox Devs - MIT, Apache, MPL, GPL, AGPL]]
