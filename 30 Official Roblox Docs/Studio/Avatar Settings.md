---
title: "Avatar Settings"
description: "The Avatar Settings window contains all Studio-level settings and customization options for a game."
area: "30 Official Roblox Docs"
cluster: "Studio"
source: "https://create.roblox.com/docs/studio/avatar-settings"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Avatar Settings window contains all Studio-level settings and customization options for a game.*

The **Avatar Settings** window, accessible from Studio's **File** menu or the **Avatar** tab, allows you to control the look and behavior of user avatars across your entire game.

*(image in the full Top G Vault)*

*(image in the full Top G Vault)*

> [!warning]
> **Avatar Settings** modifies underlying game defaults that are not visible outside of the settings interface or accessible with scripts. This can lead to difficult-to-debug behaviors, especially when working across teams or on a universe with multiple place files. Test your changes by using the window's preview and by playtesting in Studio so that you fully understand the impact on player avatars before publishing changes to your live game.

The top bar of the **Avatar Settings** window provides easy access to quickly set the avatar type, assign a preset, and enable preview.

| Setting | Description |
| --- | --- |
| **Preset** | Displays which settings preset is enabled and allows you to toggle between them (for descriptions of each setting, see [[30 Official Roblox Docs/Studio/Avatar Settings#General\|General]]). If the preset displays `--`, this indicates that the current settings are customized and do not match a preset. |
| **Preview** | Toggles a preview lineup of avatars based off the avatar settings applied and creates an `AvatarPreview` folder under [[30 Official Roblox Docs/API Reference/Classes/Workspace\|Workspace]] ⟩ [[30 Official Roblox Docs/API Reference/Classes/Camera\|Camera]] with four representative avatar types. You can add or remove avatars to the lineup by dragging them into or out of the folder. The folder is removed during Studio runtime playtesting and it is not saved to your place file. |
| **⋯** | Sets the default avatar type to either **R6**, **R15**, or **R15 & R6**. |

## General

The **General** tab offers simple presets tailored to the needs of most games. In many cases, one of these presets will fit your game's avatar use-cases and additional configuration is not necessary. However, advanced developers can further customize avatar behavior using the more detailed settings available in the other tabs.

| Setting | Description |
| --- | --- |
| **Player Choice** | Loads player avatars without any modifications. |
| **Consistent Gameplay** | Sets all avatars to the same height with the same box collider for consistent collision behavior. |

## Body

The **Body** tab contains settings for body proportions, parts, scale.

| Setting | Description |
| --- | --- |
| **Scale** | • **Player Choice** (default): Does not modify avatar character scale.<br>• **Custom Scale**: Allows you to scale avatars to an absolute height in studs, but maintain their proportions. You can set a **Minimum** and **Maximum** range.<br> For reference, classic style avatars are around 5 studs tall. More humanoid style proportions are around 6 to 6.5 studs. |
| **Appearance** | • **Player Choice** (default): Does not modify avatar character appearance.<br>• **Custom Parts**: Lets you override a user's default body part to a custom ID. |
| **Build** | • **Player Choice** (default): Does not modify avatar character proportions.<br>• **Custom Build**: Provides customization options that limits the user's avatar body type, height, width, head size, and proportions. |

## Clothing

The **Clothing** tab contains controls for layered and classic clothing.

| Setting | Description |
| --- | --- |
| **Clothing Scale** | • **Player Choice** (default): Keep user's avatar clothing.<br>• **Custom Limit**: Remove any clothing that exceeds the limit bounds of the avatar. |
| **Custom Clothing** | • **Player Choice** (default): Keep user's avatar clothing.<br>• **Custom Clothing**: Lets you override a user's layered accessory equip slot or classic clothing type to a custom ID. If you check the box to override, but leave the **Asset ID** field blank, it will remove all player clothing in that equip slot. |

## Accessories

The **Accessories** tab contains settings related to accessories in your game.

| Setting | Description |
| --- | --- |
| **Accessory Scale** | • **Player Choice** (default): Does not change the scale of user's equipped accessories.<br>• **Custom Limit**: Allows you to **Scale** accessories, or **Remove** accessories that exceed limit bounds. |
| **Custom Accessories** | • **Player Choice** (default): Keep user's avatar accessories.<br>• **Custom Accessories**: Lets you override a user's accessory types to a custom ID. If you check the box to override, but leave the Asset ID field blank, it will remove all player accessories of that category. |
| **Accessory Behaviors** | Controls to enable/disable accessory behaviors like **VFX**, **Sound**, and **Emissives**. |

## Movement

The **Movement** tab contains collision and animation settings, as well as ability configurations for the [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library|Character Controller Library]].

| Setting | Description |
| --- | --- |
| **Collision** | • **Default**: Use the [[30 Official Roblox Docs/API Reference/Enums/R15CollisionType\|OuterBox]] method which calculates collisions based off the bounding boxes of avatar parts.<br>• **Single Collider**: Use a single consistently sized box for collisions.<br>• **Legacy**: Use the [[30 Official Roblox Docs/API Reference/Enums/R15CollisionType\|InnerBox]] collision method (for backwards compatibility only). |
| **Animation Packs** | • **Player Choice** (default): Keep user's platform animation style, including style packs<br>• **Standard R15**: All avatars will use the standard R15 platform animations.<br>• **Standard R6**: All avatars will use the standard R6 platform animations. |
| **Animation Clips** | • **Player Choice** (default): Keep user's platform animations.<br>• **Custom Clips**: Lets you override and preview any default animation type with a custom ID. These overrides are applied **on top of your selection of Animation Pack**. |
| **Abilities** | • **Legacy Humanoid** (default): Use legacy character abilities built on rigid [[30 Official Roblox Docs/API Reference/Classes/Humanoid\|Humanoid]] state machines.<br>• **Character Controller Library**: Enables the [[30 Official Roblox Docs/Characters/Character Controller Library/Character Controller Library\|Character Controller Library]] and lets you toggle on/off default character abilities at runtime. |

---
*Source: [Avatar Settings](https://create.roblox.com/docs/studio/avatar-settings) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
