---
area: "01 Start Here"
cluster: "Start Here"
title: "Packages for Beginners - Reuse One Asset Everywhere"
tags: [roblox, community-knowledge, start-here, packages, workflow]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/assets/packages
  - https://create.roblox.com/docs/projects/assets/toolbox
  - https://create.roblox.com/docs/projects/game-ownership-transfer
---
# Packages for Beginners - Reuse One Asset Everywhere

You build a nice lamp post and copy it 80 times across your map. Then you want to change the bulb colour. Without packages, that is 80 edits. With a **package**, you edit one copy, publish, and every copy (even in other places or games) updates. Packages are the beginner-friendly answer to "how do big games keep hundreds of props, doors and checkpoints consistent".

## What a package is

A package is a reusable object or object tree (a Model with children, a door with its script, a checkpoint pad) stored as an asset with its own version history. Each copy in your places is linked to it through a child **PackageLink** object, and shows a chain-link icon in Explorer.

Benefits:
- Update all copies, or only some, to the latest version.
- Optional **AutoUpdate** so copies pull new versions automatically.
- Give collaborators **Edit** or **Use** permission on the package itself.
- Full version history with compare and restore.

## Create one (2 minutes)

1. Group the thing first (`Ctrl+G`), even if it is a single part, so you can add children later.
2. Right-click it in Explorer > **Convert to Package**.
3. Fill in details. **Pick the owner carefully** (you or your group): the asset system does not support transferring package ownership later.
4. Submit. A **PackageLink** appears inside it.
5. Optional: select the PackageLink and enable **AutoUpdate**.

**Never delete or move the PackageLink.** Doing so turns that copy back into a normal model and it stops updating.

## Insert it elsewhere

The first time in a new place, insert it from the **Toolbox**:
- **Inventory > My Packages** for your own (or ones a friend shared with you),
- **Creations > Group Packages** for group packages.

After that, duplicate it like any model; copies stay linked.

## Edit and publish changes

1. Edit any copy like a normal model. It gets a "modified" icon and stops auto-updating until you publish or revert.
2. Right-click > **Publish to Package**. Other copies update (immediately if AutoUpdate is on, otherwise when you choose to update them).

Not counted as a modification: renaming the root, moving or rotating the root (for BasePart/Model/GuiObject roots), toggling `Enabled` on a root ScreenGui/SurfaceGui/BillboardGui, and welds that point outside the package. So you can place copies freely without "modifying" them.

## Per-copy settings with attributes

Add **attributes** to the package root (for example `Color`, `Speed`). When you publish, those become the defaults. Each copy can override them. A script inside the package reads `script.Parent:GetAttribute("Speed")` at runtime. This is how one "Door" package can have doors with different speeds.

## Good first packages

| Package | Why |
| --- | --- |
| Checkpoint pad (with script) | Fix a bug once, fixed on every stage |
| Kill brick / lava | Same |
| Street lamp, bench, tree | Art passes become one edit |
| Shop stand | Reused in lobby and other places |

## Pitfalls

- **Inserting other people's packages blindly:** packages can contain scripts. Save first, then read every script inside (see [[Plugin and Free Model Safety Checklist]]).
- **Private assets:** a package can include assets you do not have permission to use; those parts may not load for others.
- **User-owned packages in a game you later move to a group:** you may need to recreate them under the group.
- **Two people editing one package:** agree who publishes, or one will overwrite the other's changes.

## Related
[[00 START HERE - Top G Vault]] · [[Explorer, Properties and Toolbox - Beginner Field Guide]] · [[Modular Environment Kit Blueprint]] · [[Asset Naming and Project Hygiene]] · [[30 Official Roblox Docs/Projects/Assets/Packages|Packages (official)]]
