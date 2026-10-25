---
title: "Console development guidelines"
description: "Explains design requirements to follow for publishing an experience to consoles."
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/publishing/console-guidelines"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains design requirements to follow for publishing an experience to consoles.*

With 200M+ Xbox and PlayStation players, consoles present a major opportunity for you to attract more players. Compared to regular devices, designing for controllers and the 10-foot UI experience of consoles has some special guidelines that you can follow to help your game succeed on consoles.

> [!info]
> Games designed for consoles always need to provide [[30 Official Roblox Docs/Production/Promotion/Content maturity and compliance|content maturity information]] to ensure smooth releases and minimize the risk of being removed from consoles.

## Build for the 10ft experience

When on consoles, players are typically sitting 8–10 feet away from the screen.

*(image in the full Top G Vault)*

Implement your UI using relative sizes and relative positions to measure everything as percentages of a frame. Incorporate a scale factor to all UI sizes by:

- Developing for lower resolutions first.
- Using relative positions and [[30 Official Roblox Docs/API Reference/Classes/UISizeConstraint|UISizeConstraint]] to scale the UI.
- Creating designs that take into consideration large screen sizes, based on [[30 Official Roblox Docs/API Reference/Classes/GuiService#ViewportDisplaySize|GuiService.ViewportDisplaySize]], where [[30 Official Roblox Docs/API Reference/Enums/DisplaySize|Large]] represents most TVs or larger.
- Implementing [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrame]] to reduce clutter on screen as the UI scales up.

Note that some TVs will not show content fully to the edges of the screen due to historical and technical limitations, so you should put UI elements in TV‑safe areas to ensure important game elements are always visible.

*(image in the full Top G Vault)*

*The blue area represents the TV-unsafe zone*

## Design for controllers

Console games receive commands from players through input controllers, which require special designs for smooth interactions.

*(image in the full Top G Vault)*

Apply the following concepts to simplify the UI design for consoles:

- **Accessible navigation control** — Baseline navigation, including the four directions, select, and back, controls how players get around and interact with your content on consoles. Make sure players can reach all UI elements using these basic navigation controls, so they can easily access every interactive part of your game.

- **Default controller navigation** — Roblox provides both directional selection and virtual cursor as out‑of‑the‑box solutions, but if you have specific UI layouts, it's recommended that you think about bespoke controller navigation.

- **Minimal controller input complexity** — Unlike tappable or clickable input methods, console players navigate by pressing one button at a time, so an action that takes one move on other devices might take extra moves with a controller. Make sure that key actions in your game only take a few moves to access.

- **No chat window** — Regardless of how you customize the chat system, [[30 Official Roblox Docs/Chat/Customize the chat window#Chat window configuration|disable the chat window]] for console games.

> [!info]
> As controllers aren't just for consoles and VR but also are available on devices such as desktop and mobile, minimizing the number of moves needed can enhance the UI for all devices and input types in addition to PlayStation and Xbox.

### Add supplemental control

Unlike mobiles and desktops, navigation is always sequential on consoles, so players can't jump between far away elements as quickly as on other devices. To enhance the speed of navigation, consider adding additional buttons and shortcuts for essential in-game actions.

### Accommodate dynamic button icons

As your game expands to more platforms, be sure to show button icons that match different devices.

> [!success]
> If you're showing bindings from the [[30 Official Roblox Docs/Input/Input Action System|Input Action System]], use [[30 Official Roblox Docs/API Reference/Classes/InputActionLabel|InputActionLabel]] for a no-code way to keep button icons in sync across devices. See [[30 Official Roblox Docs/Input/Input Action System#Displaying bindings|displaying bindings]] for details.

For other input hints, [[30 Official Roblox Docs/API Reference/Classes/UserInputService|UserInputService]] has two methods available that can achieve this:

- [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetStringForKeyCode|UserInputService:GetStringForKeyCode()]] can convert the US query key codes to console keyboard layouts. It's helpful for showing your custom assets as button icons to match the look and feel of your game.

- [[30 Official Roblox Docs/API Reference/Classes/UserInputService#GetImageForKeyCode|UserInputService:GetImageForKeyCode()]] returns Roblox default icons for the requested [[30 Official Roblox Docs/API Reference/Enums/KeyCode|Enum.KeyCode]] as easy drop-in replacements.

  | Key Code | Xbox Image | PlayStation Image | String |
  | --- | --- | --- | --- |
  | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonA]] | *(image in the full Top G Vault)* | *(image in the full Top G Vault)* | `ButtonA` |
  | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.ButtonX]] | *(image in the full Top G Vault)* | *(image in the full Top G Vault)* | `ButtonX` |
  | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.One]] | n/a | n/a | `1` |
  | [[30 Official Roblox Docs/API Reference/Enums/KeyCode\|Enum.KeyCode.Five]] | n/a | n/a | `5` |

## Provide haptic feedback

One unique advantage of controllers is the capability of providing haptic feedback by physically vibrating the controller to engage players' sense of touch. You can use [[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffects]] to enhance player immersion and provide useful feedback.

*(image in the full Top G Vault)*

Examples that can be more immersive with haptic feedback include:

- Physically dramatic events, such as explosions or collisions.
- Events that require player attention, such as a doorbell ring or a new customer entering the shop.
- UI action notifications, such as scrolling to the end of a list or clicking on a disabled button.

[[30 Official Roblox Docs/API Reference/Classes/HapticEffect|HapticEffects]] also allow you to control the position and radius of vibrations for different purposes and to maintain the consistency with which actions trigger feedback. Design haptics carefully and avoid overuse, as players might find constant vibrations unpleasant and annoying.

## Adapt progressive disclosure

Progressive disclosure defers advanced or rarely used features to a secondary screen. It's one of the best ways to declutter your UI and make it easy to use. For the console UX, it's common and faster to have the player go in and out of screens rather than fitting everything onto one screen like designing for desktops.

*(image in the full Top G Vault)*

## Provide audio feedback

Unlike desktop or mobile interfaces, on which interactions are typically silent or rely on subtle haptic feedback, you can add sound effects to improve console interactions. When players navigate through the UI using a controller, consider incorporating sound effects to confirm selections or signal menu traversal, which can elevate the overall game.

---
*Source: [Console development guidelines](https://create.roblox.com/docs/production/publishing/console-guidelines) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
