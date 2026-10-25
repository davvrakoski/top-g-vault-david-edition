---
area: "09 Maps and Worlds"
cluster: "Maps"
title: "Packages for Map Kits - Shared Props Across Places Without Drift"
tags: [roblox, community-knowledge, maps, packages, modular-kits, workflow]
cssclasses: [tg-a09]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/projects/assets/packages
  - https://create.roblox.com/docs/reference/engine/classes/PackageLink
  - https://create.roblox.com/docs/tutorials/curriculums/environmental-art/assemble-an-asset-library
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://devforum.roblox.com/t/announcing-feature-packages/3301611
  - https://devforum.roblox.com/t/how-to-automatically-publish-changes-to-packages-before-publishing-the-game/1421535
---
# Packages for Map Kits - Shared Props Across Places Without Drift

A map built from a modular kit (walls, doors, lamps, crates) quickly ends up with hundreds of copies of each piece, often spread across a lobby place, several match places and a test place. Without packages, fixing a lamp's collision or swapping a texture means hunting every copy by hand, and copies slowly drift apart. Packages turn each kit piece into a versioned asset whose copies can update together. They also help performance: the Improve Performance guide lists packages as a way to reuse one mesh asset everywhere, which keeps instancing intact.

## How packages behave (Creator Docs)

- Right-click an object > **Convert to Package**. A `PackageLink` child appears; never delete or move it, or the copy becomes a normal object again.
- Edits flag a copy as **modified** and turn off auto-update for that copy until you publish or revert.
- Not counted as modifications: renaming the root, moving or rotating the root of a BasePart / Model / GuiObject, and toggling `Enabled` on a root GuiObject. This is why you can place hundreds of copies without "modifying" them.
- `PackageLink.AutoUpdate = true` pulls the newest version when the place is opened in Studio. With nested packages, only the top-level parent's setting matters.
- **Update All** (mass update) saves the chosen places in the universe but does not publish them, and skips modified copies.
- Root attributes become per-copy **configurations**; scripts inside the package read them at runtime.

## A kit structure that works

```
ServerStorage/Kit (or a separate "Kit Library" place)
  Kit_Wall_8x12      (package, AutoUpdate on)
  Kit_Door_Single    (package, attributes: Locked=false, KeyId="")
  Kit_Lamp_Street    (package, contains a nested package Kit_LampHead)
  Kit_Crate_Small    (package)
```

1. Build each piece at the kit's grid size, set collision and render settings once (CollisionFidelity, CastShadow, CanTouch).
2. Convert to package, enable AutoUpdate, share with the group or collaborators.
3. Assemble maps only from copies. Move and rotate the root; do not edit children.
4. Per-copy differences go in root attributes (door lock id, lamp color), not in child edits.
5. When a piece needs a fix, edit one copy, **Publish to Package**, then use **Update All** for other places.

## Community cautions

- The Feature Packages announcement thread (3301611) warns against auto-update on packages whose config scripts you edit per place, because updates can overwrite your local changes. Keep configuration outside the package or in attributes.
- References from inside a package to objects outside it do not survive auto-update well (same thread). Design kit pieces to be self-contained.
- The thread on publishing package changes before publishing the game (1421535) is a reminder that a modified copy is saved with the place even if not published as a package, so other places will not see the fix until you publish the package.

## Performance notes

- One package = one mesh asset reused, so copies can be instanced. Avoid "Separate" then rebuild workflows that create new mesh IDs.
- Packages do not make anything stream differently; still group large map sections into Models for streaming.
- Scripts inside every lamp package copy run once per copy. Prefer one tagged system script (CollectionService) that drives every lamp over a script inside each package.

## Checklist

- [ ] Every repeated prop is a package with AutoUpdate on
- [ ] No child edits on placed copies (Explorer shows no modified icons)
- [ ] Per-copy settings stored as root attributes
- [ ] No scripts inside high-count props; tags instead
- [ ] After a kit fix: Publish to Package, Update All, then publish each place

## Related
[[Maps - Hub]] · [[Modular Kits from the Kenney FBX Library]] · [[Map Blockout to Art Pass Workflow]] · [[Modular Kit Grid Audit - Module Sizes and an Off-Grid Finder]]
