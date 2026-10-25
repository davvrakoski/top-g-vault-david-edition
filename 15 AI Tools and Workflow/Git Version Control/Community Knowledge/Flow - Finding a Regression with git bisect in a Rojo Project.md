---
area: "15 AI Tools and Workflow"
cluster: "Git Version Control"
title: "Finding a Regression with git bisect in a Rojo Project"
tags: [roblox, community-knowledge, git, debugging, rojo]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://git-scm.com/docs/git-bisect
  - https://rojo.space/docs/v7/
---
# Finding a Regression with git bisect in a Rojo Project

"It worked last week" is one of the most expensive bug reports in game dev: fifty commits landed since, several written by AI, and nobody knows which one broke the shop. `git bisect` turns that into a binary search: with 50 commits it needs about 6 tests, with 1,000 about 10. In a Rojo project every commit can be built into a place file, so you can bisect gameplay bugs, not just code errors. This only works if your code lives in Git ([[Git, Github, Rojo and Team Workflow]]).

## Manual bisect (bug needs a playtest)

```sh
git bisect start
git bisect bad                 # current commit has the bug
git bisect good v1.3.0         # last tag you know was fine
# Git checks out a commit in the middle
rojo serve                     # or: rojo build -o bisect.rbxl and open it
# test in Studio, then mark:
git bisect good                # or: git bisect bad
# repeat until Git prints "<sha> is the first bad commit"
git bisect reset               # back to where you started
```

Tips for the Studio part:

- Keep Studio open on a **test place** connected to `rojo serve`; each checkout syncs automatically, so a test round is "wait for sync, press Play".
- Write the exact repro steps before starting ("buy sword in shop, rejoin, sword missing"). Vague tests produce wrong marks.
- If a commit does not build or is untestable, run `git bisect skip`.
- Made a wrong mark? `git bisect log > bisect.txt`, delete the bad line, `git bisect reset`, `git bisect replay bisect.txt`.

## Automatic bisect (bug shows up in a test)

If the bug can be caught by a script, Git can run the whole search alone. The exit-code contract of `git bisect run`:

| Exit code | Meaning |
|---|---|
| 0 | good |
| 125 | skip this commit (cannot test) |
| 1-127 except 125 | bad |
| anything else | abort bisect |

Example with a Lune test for a pure-logic module:

```sh
git bisect start HEAD v1.3.0 --
git bisect run sh -c "rojo build -o /tmp/b.rbxl || exit 125; lune run tests/shop_price"
git bisect reset
```

The `|| exit 125` makes commits that fail to build count as "skip" instead of "bad", which would otherwise send the search the wrong way.

Write the failing test **first** (outside the repo history, e.g. in `/tmp`), because old commits do not contain it. Run it by path from the script.

## Bisect for "when did this change?"

Not every search is a bug. To find when a value changed (say, walk speed felt slower), use custom terms so you do not confuse yourself with good/bad:

```sh
git bisect start --term-old fast --term-new slow
git bisect slow HEAD
git bisect fast v1.2.0
```

## Making repos bisect-friendly

- **Small commits that each build.** A commit that only works with the next one breaks bisect. CI on every PR helps ([[GitHub Actions CI for Rojo Projects - Lint, Format, Build]]).
- **Squash or merge?** With merged feature branches containing broken work-in-progress commits, use `git bisect start --first-parent` to test only the mainline merges.
- **Tags at every release** give you known-good points ([[Build Versioning - Git Tags, PlaceVersion and an In-Game Build Label]]).
- **Place content is not in Git.** If the regression is in parts or terrain changed in Team Create, bisect cannot see it; use Studio Version History ([[Saving and Version History - Never Lose a Place]]).
- **Data shape changes.** Old commits may not read your current test save data; use a disposable test DataStore or mock.

## Related
[[Git Version Control - Hub]] · [[Branching for Small Roblox Teams - Trunk-Based with Feature Flags]] · [[Lune - Run Luau Outside Studio]] · [[Flow - Undoing Git Mistakes - restore, revert, reflog and stash]]
