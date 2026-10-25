---
area: "14 Testing and QA"
cluster: "Testing"
title: "UI State Regression Checklist - Menus, Modals, Respawn and Live Data"
tags: [roblox, community-knowledge, testing, ui, regression, checklist, gamepad]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/ScreenGui
  - https://create.roblox.com/docs/reference/engine/enums/ScreenInsets
  - https://create.roblox.com/docs/reference/engine/classes/GuiService
  - https://create.roblox.com/docs/studio/testing-modes
---
# UI State Regression Checklist - Menus, Modals, Respawn and Live Data

Cross-device layout is covered by [[Platform - Cross-Platform Parity Checklist]]. This checklist covers the other half of UI bugs: **state**. Menus that open on top of each other, a shop that keeps showing yesterday's coins, a modal that leaves the character frozen, or a menu that resets every time you die. These come back every time someone refactors a menu, adds a new window or changes how data reaches the client, so the checklist is meant to be run after any UI change, in Studio with Device Emulation plus one real phone. Mark every menu you touched; run sections A-C on all of them.

## A. Open / close

- [ ] Each menu opens from every entry point (HUD button, keybind, gamepad button, ProximityPrompt, NPC).
- [ ] Each menu closes via its close button, the back/B button, the keybind again and Escape where applicable.
- [ ] Opening menu B while A is open follows one rule (replace, or stack with back returning to A). Test every pair you changed.
- [ ] Spamming the open button 10 times leaves exactly one instance and a correct open/closed state.
- [ ] Closing a menu restores character input and camera. No stuck mouse lock or frozen walk.
- [ ] Opening the Roblox menu (Escape) and returning does not break your menu state (`GuiService.MenuOpened` / `MenuClosed` if you react to it).

## B. Respawn and teleport

- [ ] For each ScreenGui, `ResetOnSpawn` is set deliberately: HUDs that hold state usually want `false`; one-life overlays may want `true`.
- [ ] Die with the menu open: after respawn the menu is either closed cleanly or still open and working, never half-built.
- [ ] Scripts inside a ScreenGui with `ResetOnSpawn = true` do not create duplicate connections to remotes after each respawn (respawn 20 times, fire the event once, count reactions).
- [ ] After a teleport to another place, the arrival UI shows correct state (no flash of default values).

## C. Live data binding

- [ ] Currency, XP and inventory labels update on change, not only when the menu opens.
- [ ] Values are correct on first open after a slow join (data arrives late).
- [ ] Lists (inventory, shop, friends) handle 0 items with an empty state, 1 item, and the maximum.
- [ ] Removing an item while its detail panel is open does not error.
- [ ] Prices and owned/not-owned state refresh after a purchase.

## D. Input focus and selection

- [ ] On gamepad, opening a menu sets `GuiService.SelectedObject` to a sensible first button; closing it clears selection or returns it to the HUD.
- [ ] Selection never lands on an invisible or disabled button.
- [ ] TextBoxes: typing in a TextBox does not trigger gameplay keybinds; focus lost submits or cancels as designed.
- [ ] Touch: buttons behind a modal cannot be pressed through it.

## E. Layering and safe area

- [ ] Modals use a consistent `DisplayOrder` above HUDs; notifications above modals if that is the design.
- [ ] `ScreenGui.ScreenInsets` is `CoreUISafeInsets` (or `DeviceSafeInsets` where you deliberately go full screen), so menus are not under the top bar or notch.
- [ ] Full-screen backgrounds use `None` insets on purpose, with their content in a safe-area child.

## F. Accessibility toggles (quick)

- [ ] Largest text size setting (`GuiService.PreferredTextSize`) does not hide buttons.
- [ ] Reduced motion (`GuiService.ReducedMotionEnabled`) disables big tweens if you honour it.

## Automation hook

Sections A and C are easy to script with VirtualInput click-throughs ([[VirtualInput UI Automation - Click-Through Tests for Menus]]); keep one scripted "open every menu, close every menu" smoke test in CI so A regresses loudly.

## Related

[[Testing - Hub]] · [[Platform - Cross-Platform Parity Checklist]] · [[VirtualInput UI Automation - Click-Through Tests for Menus]] · [[Test - Join, Leave and Respawn Edge-Case Pass]]
