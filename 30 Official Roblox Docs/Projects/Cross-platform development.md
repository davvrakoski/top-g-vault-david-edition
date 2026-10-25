---
title: "Cross-platform development"
description: "Consolidated overview of cross-platform recommendations to help you design a Roblox game that's accessible and enjoyable on all platforms."
area: "30 Official Roblox Docs"
cluster: "Projects"
source: "https://create.roblox.com/docs/projects/cross-platform"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Consolidated overview of cross-platform recommendations to help you design a Roblox game that's accessible and enjoyable on all platforms.*

Roblox is inherently **cross‑platform**, as players can discover and join games on their phone or tablet, then later continue where they left off on their PC or console. To support an expanding suite of platforms, you should build user interfaces that seamlessly adapt to the input type (touch, gamepad, mouse/keyboard), screen size, and device orientation. This guide, the [[30 Official Roblox Docs/Production/Publishing/Adaptive design guidelines|adaptive design]] guide, and the linked resources can help you design a true cross‑platform game that's compatible, accessible, and enjoyable on **all** platforms.

> [!info]
> To explore a pre-made game that showcases the following cross‑platform design concepts, check out the [Interactivity Showcase](https://www.roblox.com/games/132115384567250/).

## Input

A carefully designed game should support all primary input types, including mouse and keyboard, touch, and gamepads.

### Cross-platform actions

> [!success]
> Support all primary input types (mouse/keyboard, touch, and gamepads) using the [[30 Official Roblox Docs/Input/Input Action System|Input Action System]].

To simplify cross‑platform inputs, Roblox provides the [[30 Official Roblox Docs/Input/Input Action System|Input Action System]] to define **actions** such as "jump," "sprint," or "shoot" and set up **bindings** for multiple hardware inputs to drive those actions. You do not need to think about all the technical aspects of hardware inputs and when to listen for specific input triggers; you simply define which inputs perform which actions.

*(image in the full Top G Vault)*

### Input type detection

> [!success]
> Ensure that UI elements respond and adapt to the player's **primary** input type as detailed in [[30 Official Roblox Docs/Input/Input#Input type detection|input type detection]]. Also consider [[30 Official Roblox Docs/Projects/Cross-platform development#Assistive hints|assistive hints]] to help players understand specific input changes.

In cross-platform development, it's important that you determine and respond to the primary input type a player is using, normally to ensure that [[30 Official Roblox Docs/UI/User interface#UI objects|UI elements]] like on‑screen buttons and menus work elegantly and support interaction across devices.

For example, a touch‑enabled device assumes touch is the **default** input and that touch buttons may appear for actions, but a player may choose to connect a bluetooth gamepad. In this case, touch remains a valid input, but you can assume the player wants to switch to the connected gamepad as the **primary** input type and possibly use touch as a backup input for on‑screen UI.

If you're using the [[30 Official Roblox Docs/Input/Input Action System|Input Action System]], the [[30 Official Roblox Docs/API Reference/Classes/InputAction#PreferredBinding|PreferredBinding]] property complements primary input detection: just as [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] reports the player's current primary input type, [[30 Official Roblox Docs/API Reference/Classes/InputAction#PreferredBinding|PreferredBinding]] reports the specific [[30 Official Roblox Docs/API Reference/Classes/InputBinding|InputBinding]] that matches the player's current device. Both update automatically as the player switches devices, so you can drive device‑aware UI without writing device‑switch logic yourself.

### Assistive hints

Based on the [[30 Official Roblox Docs/Projects/Cross-platform development#Input type detection|primary input type]], it's recommended that you include **assistive UI hints** whenever possible. For example, when selecting tools to equip, display input‑specific hints such as <kbd>1</kbd>–<kbd>5</kbd> when the player is using a keyboard, or gamepad trigger hints when the player is using a gamepad.

> [!success]
> For no-code assistive hints that automatically update when the player switches devices, use [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel|InputActionLabel]] and point it at any [[30 Official Roblox Docs/API Reference/Classes/InputAction|InputAction]] to display the correct input per platform. See [[30 Official Roblox Docs/Input/Input Action System#Displaying bindings|displaying bindings]] for full details.

For more granular control, or if you need to customize hint display beyond what [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel|InputActionLabel]] offers, you can use the [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] methods below to manually gather platform‑specific images and strings:

#### Keyboard Input

*(image in the full Top G Vault)*

#### Gamepad Input

*(image in the full Top G Vault)*

The [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetImageForKeyCode|GetImageForKeyCode()]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetStringForKeyCode|GetStringForKeyCode()]] methods are helpful in gathering a platform‑specific image or string to use in a UI hint, such as the following examples:

| Key Code | Xbox Image | PlayStation Image | String |
| --- | --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonA]] | *(image in the full Top G Vault)* | *(image in the full Top G Vault)* | `ButtonA` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonX]] | *(image in the full Top G Vault)* | *(image in the full Top G Vault)* | `ButtonX` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.One]] | n/a | n/a | `1` |
| [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Five]] | n/a | n/a | `5` |

## User interface

A well-designed user interface is essential for players on all platforms to interact with your game.

### Position and size

> [!success]
> Ensure that all UI elements are visible on all screen sizes and orientations.

> [!success]
> Ensure that all buttons/controls are interactable and that they are not blocked or obscured by [[30 Official Roblox Docs/UI/Position and size UI objects#Cross-platform factors|device cutouts or Roblox UI elements]].

All UI elements should be [[30 Official Roblox Docs/UI/Position and size UI objects#Position|positioned]] and [[30 Official Roblox Docs/UI/Position and size UI objects#Size|sized]] appropriately to ensure visibility and interactivity across multiple screen sizes. Positioning UI elements by [[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] is a common approach since it's based on a **percentage** of the screen's **X** and **Y** bounds, not a pixel value (pixels can vary arbitrarily by both number and density across devices). You can also utilize the element's [[30 Official Roblox Docs/API Reference/Classes/GuiObject#AnchorPoint|AnchorPoint]] to set its positional origin. For example, the UI container holding the gem/coin counters in the following image is positioned at an **X** scale of `1` (right) and **Y** scale of `0` (top) with an upper‑right anchor point.

*(image in the full Top G Vault)*

[[30 Official Roblox Docs/API Reference/Datatypes/UDim#Scale|Scale]] is also recommended for **sizing** UI elements, such as making a UI container span 75% width on every screen. However, 75% would render to a huge size on 4K TVs for console players, so it's recommended that you explore [[30 Official Roblox Docs/Projects/Cross-platform development#Screen size adaptation|screen size adaptation]] as a way to adapt UI layouts across different viewports.

### Screen size adaptation

> [!success]
> Adapt UI to various display sizes by checking and listening for changes to the viewport display size.

With a multitude of possible screen sizes accessible to the Roblox platform, attempting to predict screen size by pixels often leads to misinterpretation. To assist in determining a player's screen size to adapt the size/position of UI elements, Roblox provides the read‑only [[30 Official Roblox Docs/API Reference/Classes/GuiService#ViewportDisplaySize|ViewportDisplaySize]] property which represents the internally‑categorized rendering size of the viewport.

| [[30 Official Roblox Docs/API Reference/Classes/GuiService#ViewportDisplaySize\|ViewportDisplaySize]] | Summary |
| --- | --- |
| [[30 Official Roblox Docs/API Reference/Enums/DisplaySize\|Small]] | Most tablet/mobile/handheld devices |
| [[30 Official Roblox Docs/API Reference/Enums/DisplaySize\|Medium]] | Most laptops and monitors |
| [[30 Official Roblox Docs/API Reference/Enums/DisplaySize\|Large]] | Most TVs or larger |

For more native customization, you can use the UI [[30 Official Roblox Docs/UI/Styling/Style Editor|Style Editor]] to configure [[30 Official Roblox Docs/UI/Styling/Style Editor#Style queries|Style Queries]] for both [[30 Official Roblox Docs/API Reference/Classes/GuiService#ViewportDisplaySize|ViewportDisplaySize]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#PreferredInput|PreferredInput]] values. Using intrinsic selectors like `@ViewportDisplaySizeSmall` or `@PreferredInputTouch` allows your UI to automatically swap tokens for text sizes, container dimensions, and other measurements as the player's device environment or primary input method changes.

### Layout containers

> [!success]
> Use layouts to organize individual UI components and ensure that containers adjust responsively to the children elements within them.

For easier UI organization, you should use **layout components** to organize children. When using layout [[30 Official Roblox Docs/UI/Frames|containers]], make sure that the children are legible, [[30 Official Roblox Docs/Projects/Cross-platform development#Accessibility|accessible]], and non‑cluttered. A common layout component is [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]], which positions sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObjects]] into rows or columns and adjusts accordingly whenever you add or remove a sibling object.

You should also consider the distribution and relative positioning of elements within layout containers for the best user experience. Integrating [[30 Official Roblox Docs/UI/List and flex layouts#Flex layouts|flex]] into a list layout is a powerful way to [[30 Official Roblox Docs/UI/List and flex layouts#Equal fill or distribution|equally fill/distribute]] or [[30 Official Roblox Docs/UI/List and flex layouts#Alignment|align/stretch]] items across their line, or [[30 Official Roblox Docs/UI/List and flex layouts#Flex individual items|flex specific items]] across a variable space.

*(image in the full Top G Vault)*

### Accessibility

> [!success]
> Ensure that all text is legible on all screens. Also make sure all UI has [[30 Official Roblox Docs/Production/Publishing/Accessibility guidelines#Color contrast|sufficient contrast]] and that [[30 Official Roblox Docs/Production/Publishing/Accessibility guidelines#Color non-reliance|nothing relies solely on color]] to distinguish an action or outcome.

Even with UI elements [[30 Official Roblox Docs/Projects/Cross-platform development#Position and size|properly sized]] across all device screen sizes, the overall game should meet [[30 Official Roblox Docs/Production/Publishing/Accessibility guidelines|accessibility standards]] for players with impaired vision or color blindness. Text size can factor heavily into the legibility of text‑based UI, so you should include a [[30 Official Roblox Docs/UI/Size modifiers and constraints#Text size|text size constraint]] to ensure text doesn't become illegible (too small) or visually too large on larger screens like 4K TVs.

For more tips on accessibility, see [[30 Official Roblox Docs/Production/Publishing/Accessibility guidelines|accessibility guidelines]].

## Final tips & tricks

As you work toward a full cross‑platform game, consider the following tips and tricks:

- Device emulation is essential to designing an optimal game on Roblox. Utilize the built‑in [[30 Official Roblox Docs/Studio/Studio testing modes|Device Emulator]] and [[30 Official Roblox Docs/Studio/Studio testing modes|Controller Emulator]] to emulate various devices and gamepads directly in Studio.
- Roblox's [[30 Official Roblox Docs/UI/Styling/UI styling|UI styling]] pipeline, similar to CSS, lets you declare and globally apply overrides to UI instance properties. Along with the integrated [[30 Official Roblox Docs/UI/Styling/Style Editor|Style Editor]], you can set up a complete and easy‑to‑modify user interface.
- Once your game is effectively cross-platform, explore native features like haptic feedback on [[30 Official Roblox Docs/Input/Mobile input#Haptic feedback|mobile]] and [[30 Official Roblox Docs/Input/Gamepad input#Haptic feedback|gamepads]], touch gestures such as [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchSwipe|TouchSwipe]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#TouchPinch|TouchPinch]], or accelerometer and gyroscope functionality on [[30 Official Roblox Docs/API Reference/Classes/UserInputService#AccelerometerEnabled|AccelerometerEnabled]] and [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GyroscopeEnabled|GyroscopeEnabled]] devices.

---
*Source: [Cross-platform development](https://create.roblox.com/docs/projects/cross-platform) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
