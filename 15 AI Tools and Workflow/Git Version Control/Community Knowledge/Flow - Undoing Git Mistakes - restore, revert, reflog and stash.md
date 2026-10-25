---
area: "15 AI Tools and Workflow"
cluster: "Git Version Control"
title: "Undoing Git Mistakes - restore, revert, reflog and stash"
tags: [roblox, community-knowledge, git, recovery]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://git-scm.com/docs/git-restore
  - https://git-scm.com/docs/git-revert
  - https://git-scm.com/docs/git-reflog
  - https://git-scm.com/docs/git-stash
  - https://git-scm.com/docs/git-reset
---
# Undoing Git Mistakes - restore, revert, reflog and stash

New Roblox devs avoid Git because they are scared of breaking it, and AI agents make that fear worse: an agent can rewrite twenty files in a minute. The good news is that Git almost never loses committed work, and it gives you a precise tool for each kind of "undo". This note is a lookup table of common mistakes and the safest command for each, plus the rule that keeps you out of trouble: **commit before you let anything (or anyone) make big changes.**

## The golden rule

Before an AI agent, a big refactor or a risky merge: `git add -A && git commit -m "wip: before X"` or create a branch. Committed work can be recovered for weeks via the reflog; uncommitted changes that get overwritten are often gone.

## Mistake to fix lookup

| Situation | Command | Safe? |
|---|---|---|
| Messed up one file, not committed, want the last committed version | `git restore src/server/Shop.luau` | Discards those edits |
| Staged a file by accident | `git restore --staged file` | Yes, keeps the edits |
| Agent changed many files, you want them all gone (uncommitted) | `git stash push -m "agent attempt"` first, then decide | Yes, recoverable via `git stash list` |
| Last commit message is wrong, not pushed | `git commit --amend` | Rewrites local history only |
| Bad commit already pushed to `main` | `git revert <sha>` | Yes, adds a new undo commit; never rewrites shared history |
| Want to drop the last local commit but keep the changes | `git reset --soft HEAD~1` | Yes |
| "I reset/rebased and my commits vanished" | `git reflog` then `git branch rescue <sha>` | Yes |
| Deleted a branch | `git reflog`, find its tip, `git branch name <sha>` | Yes |
| Need to switch task mid-change | `git stash push -m "half shop UI"` then `git stash pop` later | Yes |

Avoid on shared branches: `git reset --hard` on `main`, `git push --force`. If you must force-push your own branch, use `git push --force-with-lease`, which refuses if someone else pushed meanwhile. Branch protection can block force pushes entirely ([[Flow - GitHub Branch Protection and CODEOWNERS for Roblox Repos]]).

## Reflog in practice

`git reflog` lists every place `HEAD` has been, newest first:

```
a1b2c3d HEAD@{0}: reset: moving to HEAD~3
9f8e7d6 HEAD@{1}: commit: shop: add daily deals
```

To get back the "daily deals" commit: `git branch rescue 9f8e7d6`, check it, then merge or reset to it. Reflog entries do expire: by default 90 days (`gc.reflogExpire`) and 30 days for commits no longer on any branch (`gc.reflogExpireUnreachable`), so rescue lost work soon.

## Stash habits

- Always name stashes (`-m`); `stash@{3}` means nothing a week later.
- `git stash push -- src/client` stashes just one folder.
- `git stash show -p stash@{0}` previews before popping.
- Stash is not a backup: it lives only on your machine.

## Roblox-specific notes

- **Rojo serve keeps syncing.** If Studio is connected while you restore or switch branches, Studio updates instantly. That is usually what you want, but do not publish from Studio in the middle of a recovery.
- **Studio edits made during sync.** Changes made directly in Studio to synced scripts are overwritten by the files (one-way sync) unless you use a two-way tool; copy them out first.
- **Place files and models.** Binary `.rbxl`/`.rbxm` can be restored to an older version but not merged; see [[Git for Roblox Repos - .gitignore, Binary Places and LFS]].
- **Things Git cannot undo:** a publish to the live place (use Version History), DataStore writes, and Developer Product purchases.

## Related
[[Git Version Control - Hub]] · [[Git, Github, Rojo and Team Workflow]] · [[Flow - Finding a Regression with git bisect in a Rojo Project]] · [[Saving and Version History - Never Lose a Place]]
