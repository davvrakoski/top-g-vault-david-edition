---
title: "Free camera mode"
description: "Free camera mode allows free roam of the local camera around the scene."
area: "30 Official Roblox Docs"
cluster: "Workspace"
source: "https://create.roblox.com/docs/workspace/camera/free-camera"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Free camera mode allows free roam of the local camera around the scene.*

Roblox provides a custom debug **free camera mode** (freecam) to experience owners and editors, which detaches the camera from your character so you can fly it freely through your experience for capturing scenes the default camera can't reach. It's especially useful for capturing cinematic screenshots and videos, as well as spectating players in live games and debugging issues.

[Video: Freecam-Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-Showcase.mp4)

## Availability

You can use free camera mode in two places:

- **Roblox Studio** - freecam is available during [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|playtesting]] sessions.
- **The live client** - you must be the experience owner, or be granted edit permissions in the experience.

> [!info]
> Currently, freecam can only be toggled on with a keyboard (<kbd>Left Shift</kbd> + <kbd>P</kbd>). Once active, it can be controlled with either keyboard and mouse or a gamepad.

## How to toggle

Press <kbd>Left Shift</kbd> + <kbd>P</kbd> to toggle free camera mode on or off. When enabled, the camera detaches from your character and your on-screen UI is automatically hidden so you get an unobstructed view of the scene.

[Video: Freecam-Toggle.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-Toggle.mp4)

## Input Action System

The enhanced free camera capabilities described on this page — including the [[30 Official Roblox Docs/Workspace/Camera/Free camera mode#Configuration menu|configuration menu]] and [[30 Official Roblox Docs/Workspace/Camera/Free camera mode#Custom post-processing|cinematic post-processing]] — run on the [[30 Official Roblox Docs/Input/Input Action System|Input Action System]] (IAS) and are available only when your experience is opted into the upgraded IAS player scripts.

To opt in, set [[30 Official Roblox Docs/API Reference/Classes/Workspace#PlayerScriptsUseInputActionSystem|Workspace.PlayerScriptsUseInputActionSystem]] to [[30 Official Roblox Docs/API Reference/Enums/RolloutState|Enabled]] to allow free camera controls to run on IAS so inputs sink cleanly alongside your default gameplay actions.

## Camera controls

In freecam mode, the camera can move and rotate to your desired positioning independent of the character and scene. The following controls are available to control the camera:

| Action | Keyboard &amp; Mouse | Gamepad |
| --- | --- | --- |
| Move forward / left / back / right | <kbd>W</kbd> <kbd>A</kbd> <kbd>S</kbd> <kbd>D</kbd> | Left thumbstick |
| Change elevation (up / down) | <kbd>E</kbd> / <kbd>Q</kbd> | <kbd>R2</kbd> / <kbd>L2</kbd> |
| Rotate / pan the view | Hold the right mouse button and drag, or pan on a trackpad | Right thumbstick |
| Zoom (field of view) | Mouse scroll wheel, or trackpad pinch | <kbd>X</kbd> / <kbd>Y</kbd> |
| Roll (tilt left / right) | <kbd>Z</kbd> / <kbd>C</kbd> — double-tap either key to reset roll | <kbd>L1</kbd> / <kbd>R1</kbd> — double-tap to reset roll |
| Move slower for precise framing | Hold <kbd>Shift</kbd> while moving | — |
| Open the configuration menu | <kbd>↑</kbd> (up arrow) | D-pad Up |

### Movement

Use <kbd>W</kbd> <kbd>A</kbd> <kbd>S</kbd> <kbd>D</kbd> (or the left thumbstick) to fly the camera through your scene.

[Video: Freecam-Movement.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-Movement.mp4)

### Elevation

Use <kbd>E</kbd> and <kbd>Q</kbd> (or <kbd>R2</kbd> / <kbd>L2</kbd>) to raise and lower the camera vertically.

[Video: Freecam-Elevation.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-Elevation.mp4)

### Rotation

Hold the right mouse button and drag (or use the right thumbstick) to rotate and pan the view toward your subject.

[Video: Freecam-Rotation.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-Rotation.mp4)

### Field of view

Scroll the mouse wheel (or press <kbd>X</kbd> / <kbd>Y</kbd> on a gamepad) to zoom the field of view. Narrowing the field of view produces a tighter, more telephoto framing on distant subjects.

[Video: Freecam-FOV.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-FOV.mp4)

### Roll

Use <kbd>Z</kbd> and <kbd>C</kbd> (or <kbd>L1</kbd> / <kbd>R1</kbd>) to roll the camera for a Dutch-angle effect. Double-tap either roll control to snap the camera back to the default level.

[Video: Freecam-Roll.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-Roll.mp4)

## Configuration menu

Press <kbd>↑</kbd> (or D-pad Up) to open the on-screen **config menu**, which exposes deeper adjustments for fine-tuning your shot.

Navigate the menu with the following controls:

- <kbd>↑</kbd> <kbd>↓</kbd> move the selection through the list.
- <kbd>→</kbd> enters a group or selects an item to edit.
- <kbd>←</kbd> goes back to the previous level, or closes the menu from the top level.
- When editing an item, <kbd>←</kbd> <kbd>→</kbd> adjust the value and <kbd>↑</kbd> <kbd>↓</kbd> exit editing.

On a gamepad, use the D-pad in the corresponding directions.

[Video: Freecam-Menu.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-Menu.mp4)

### Movement, rotation, roll, and field of view

Each of these motion controls exposes two independent settings in the config menu:

- **Speed** controls how fast the value changes. Increase it to cover ground, zoom, tilt, or pan more quickly; decrease it for fine, precise adjustments.
- **Stiffness** controls how the camera settles into an input change. Higher stiffness is snappy and follows your input tightly with little smoothing; lower stiffness adds damping so the camera eases in and out gradually for smoother, more cinematic motion.

**High speed** — the camera rotates quickly:

[Video: Freecam-Speed-Fast.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-Speed-Fast.mp4)

**Low speed** — the camera rotates slowly for precise framing:

[Video: Freecam-Speed-Slow.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-Speed-Slow.mp4)

**High stiffness** — the camera follows input tightly and stops sharply:

[Video: Freecam-Stiffness-Snappy.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-Stiffness-Snappy.mp4)

**Low stiffness** — the camera eases in and out for smoother, more cinematic motion:

[Video: Freecam-Stiffness-Smooth.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-Stiffness-Smooth.mp4)

### UI visibility

Control which on-screen interface stays visible so you can capture a clean shot or keep key information on screen.

- **Screen GUIs** — toggle the experience's on-screen UI overlays. Set to **On** to keep them visible, or **Off** to hide them for an unobstructed view.
- **Leaderboard** — toggle the player leaderboard. Set to **On** to keep it on screen, or **Off** to hide it.

[Video: Freecam-ScreenGuis.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-ScreenGuis.mp4)

[Video: Freecam-Leaderboard.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-Leaderboard.mp4)

### Player Lock

Player Lock keeps the camera trained on a specific player's character as they move, so you can follow the action without manually tracking.

- **Enable** — turn Player Lock on or off. When on, the camera follows the chosen target; when off, the camera moves freely.
- **Target** — cycle through the players in the server to choose who the camera locks onto.

[Video: Freecam-PlayerLock-Enable.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-PlayerLock-Enable.mp4)

[Video: Freecam-PlayerLock-Cycle.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-PlayerLock-Cycle.mp4)

### Custom post-processing

Layer cinematic [[30 Official Roblox Docs/Environment/Post-processing effects|post-processing effects]] onto your shot. **Enable** disables all existing post-processing effects in favor of custom freecam ones, and each effect below can then be toggled and fine-tuned on its own:

- [[30 Official Roblox Docs/Environment/Post-processing effects#Depth-of-field|Depth of Field]] blurs parts of the scene that aren't in focus — great for drawing the eye to a subject or softening a distant background.
- [[30 Official Roblox Docs/Environment/Post-processing effects#Bloom|Bloom]] exaggerates bright lights so light-colored areas glow, simulating a camera pointed at a strong light source.
- [[30 Official Roblox Docs/Environment/Post-processing effects#Blur|Blur]] applies a Gaussian blur across the entire view for soft, dreamy, or fully out-of-focus looks.
- [[30 Official Roblox Docs/Environment/Post-processing effects#Color correction|Color Correction]] adjusts brightness, contrast, saturation, and tint to set the mood or grade the overall color of your shot.
- [[30 Official Roblox Docs/Environment/Post-processing effects#Sun rays|Sun Rays]] casts a halo of light with rays around the sun, shaped by objects between the camera and the sun for realistic light and shadow.
- [[30 Official Roblox Docs/Environment/Post-processing effects#Color grading|Color Grading]] changes how rendered colors map to the screen — switch between the vivid modern look and a less-saturated retro tone.

[Video: Freecam-PostProcessing-DepthOfField.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-PostProcessing-DepthOfField.mp4)

[Video: Freecam-PostProcessing-ColorCorrection.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-PostProcessing-ColorCorrection.mp4)

## GUI visibility shortcuts

Separate from the config menu's [[30 Official Roblox Docs/Workspace/Camera/Free camera mode#UI visibility|UI visibility]] toggles, Roblox provides engine-level keyboard shortcuts that hide categories of on-screen UI, useful for capturing a clean shot without any interface. They work in the **live client** and in a Studio **playtest**, and are available to the same audience as free camera — the experience owner or a user with edit permission (and always in Studio). Press the same shortcut again to restore.

These controls are currently available for keyboard only. Hold <kbd>Ctrl</kbd> (or <kbd>⌘</kbd> on macOS) and <kbd>Left Shift</kbd>, then press:

| Shortcut | Hides / shows |
| --- | --- |
| <kbd>Ctrl</kbd><kbd>Left Shift</kbd><kbd>G</kbd> | The Roblox-provided **Core UI**, such as the top bar and menus. |
| <kbd>Ctrl</kbd><kbd>Left Shift</kbd><kbd>C</kbd> | Developer-created [[30 Official Roblox Docs/API Reference/Classes/ScreenGui\|ScreenGuis]] (on-screen 2D UIs). |
| <kbd>Ctrl</kbd><kbd>Left Shift</kbd><kbd>B</kbd> | Developer-created [[30 Official Roblox Docs/API Reference/Classes/BillboardGui\|BillboardGuis]] (world-space 3D billboards). |
| <kbd>Ctrl</kbd><kbd>Left Shift</kbd><kbd>N</kbd> | Player nameplates (names and health bars). |

**<kbd>Ctrl</kbd><kbd>Left Shift</kbd><kbd>G</kbd>** — toggle the Roblox Core UI:

[Video: Freecam-CtrlShiftG.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-CtrlShiftG.mp4)

**<kbd>Ctrl</kbd><kbd>Left Shift</kbd><kbd>C</kbd>** — toggle the experience's on-screen GUIs:

[Video: Freecam-CtrlShiftC.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-CtrlShiftC.mp4)

**<kbd>Ctrl</kbd><kbd>Left Shift</kbd><kbd>B</kbd>** — toggle developer-created BillboardGuis:

[Video: Freecam-CtrlShiftB.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-CtrlShiftB.mp4)

**<kbd>Ctrl</kbd><kbd>Left Shift</kbd><kbd>N</kbd>** — toggle player nameplates:

[Video: Freecam-CtrlShiftN.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/workspace/free-camera/Freecam-CtrlShiftN.mp4)

---
*Source: [Free camera mode](https://create.roblox.com/docs/workspace/camera/free-camera) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
