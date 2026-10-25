---
area: "01 Start Here"
cluster: "Start Here"
title: "Install Studio and Your First Hour - Interface Tour"
tags: [roblox, community-knowledge, start-here, studio, beginner]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/tutorials/curriculums/studio/install-studio
  - https://create.roblox.com/docs/tutorials/curriculums/studio/explore-ui
  - https://create.roblox.com/docs/studio/overview
  - https://create.roblox.com/docs/studio/setup
---
# Install Studio and Your First Hour - Interface Tour

Every Roblox game is built in **Roblox Studio**, a free Windows/Mac app that ships with the same engine players run. Your first hour should not be spent building anything big. It should be spent learning where things are, so later tutorials make sense. This note is a guided first session: install, open a template, learn the six areas of the screen, and set three settings you will want forever.

## 1. Install (10 minutes)

| | Minimum | Recommended |
| --- | --- | --- |
| OS | Windows 10 / macOS 10.14 | Windows 11 / macOS 14+ |
| RAM | 3 GB | 8 GB |
| Screen | - | 1600x900 or higher |

1. Make a Roblox account at roblox.com if you have none.
2. Download Studio from the Creator Hub. The installer is `RobloxStudio.exe` (Windows) or `RobloxStudio.dmg` (Mac).
3. Run it, click **Launch Studio**, sign in.
4. Use a **2-button mouse with a scroll wheel**. The docs strongly recommend it; a trackpad makes 3D navigation painful.

Every game always runs on the latest engine, so keep Studio updated. When an **Update** button appears top-right, save and click it.

## 2. Open a template, not a blank file

From **Open a Template** pick **Baseplate** (a floor plus a SpawnLocation). Later try **Platformer** and **Racing**, which ship working mechanics you can read.

## 3. The six areas of the screen

| Area | What it is for |
| --- | --- |
| **Mezzanine** (top strip) | Playtest buttons on the left, tool tabs in the middle (Home, Model, Avatar, UI, Script, Plugins), Collaborate / Assistant / account on the right |
| **Toolbar** | The tools of the active tab. Home holds move/scale/rotate, Part, color, material, group, lock, anchor and the Terrain Editor |
| **3D viewport** | The world. Click inside it before using camera keys |
| **Explorer** | The tree of every object and service in the place (the "data model") |
| **Properties** | Settings of whatever is selected |
| **Toolbox** | Creator Store models, images, audio, plugins, plus your own Inventory |

If a window is missing, reopen it from the **Window** menu. Studio windows are dockable, so drag them wherever you like.

## 4. Camera drill (do this for 5 minutes)

- Hold **right mouse** and drag to look; **WASD** to fly; **Q / E** down / up.
- **Shift** with a movement key changes camera speed.
- Select a part and press **F** to focus it. Then **,** and **.** orbit around it.
- **Middle mouse** drag pans. Scroll wheel zooms.

Practice until you can fly to any part and back without thinking. Every later task assumes this.

## 5. Three settings worth changing on day one

1. **Studio Settings** (`Alt+S` / `Option+S`): search `theme` to pick light or dark, and search `auto` to review auto-save and recovery behaviour.
2. **File > Customize Shortcuts**: see every key binding and bind actions that have none.
3. **Toolbar right-click > Compact toolbar** on a laptop screen, so the viewport gets more room.

## 6. Your first-hour checklist

- [ ] Studio installed, signed in, updated
- [ ] Baseplate template open
- [ ] Inserted a Part from the Home tab, moved, scaled and rotated it
- [ ] Found that Part in Explorer and changed its `BrickColor` and `Material` in Properties
- [ ] Pressed **Test** (F5), walked around, pressed **Stop** (Shift+F5)
- [ ] Saved the place to Roblox (**File > Save to Roblox**)

## Pitfalls

- **Editing during a playtest:** changes made while testing are thrown away when you press Stop. Check for the coloured viewport border (blue = client, green = server) before editing.
- **Trusting the Toolbox by default:** free models can hide scripts. Read [[Free Model Backdoors - Spot and Remove Them]] before inserting anything.

## Related
[[00 START HERE - Top G Vault]] · [[Roblox Studio Basics]] · [[Explorer, Properties and Toolbox - Beginner Field Guide]] · [[Studio Keyboard Shortcuts Cheat Sheet]] · [[30 Official Roblox Docs/Studio/Studio interface|Studio interface (official)]]
