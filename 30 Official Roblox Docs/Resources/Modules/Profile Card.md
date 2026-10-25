---
title: "Profile Card"
description: "The Profile Card module lets players see more information about other players in a game."
area: "30 Official Roblox Docs"
cluster: "Resources"
source: "https://create.roblox.com/docs/resources/modules/profile-card"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Profile Card module lets players see more information about other players in a game.*

It can be interesting to learn about other players. The **ProfileCard** [[30 Official Roblox Docs/Resources/Modules/Developer modules|developer module]] is a great way to see more information about others within a game, from badges achieved to the player's favorite games.

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/developer-modules/profile-card/Showcase.mp4)

## Module usage

### Installation

To use the **ProfileCard** module in a game:

1. From Studio's **Window** menu or **Home** tab toolbar, open the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) and select the **Creator Store** tab.

   *(image in the full Top G Vault)*

1. Make sure the **Models** sorting is selected, then click the **See All** button for **Categories**.

   *(image in the full Top G Vault)*

1. Locate and click the **Packages** tile.

1. Locate the **Profile Card** module and click it, or drag-and-drop it into the 3D view.

   *(image in the full Top G Vault)*

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, move the entire **ProfileCard** model into [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. Upon running the game the module will begin running.

### Views

Profile cards have different views depending on whether you're viewing your own card or another player's card.

#### Your Card

When you first spawn into the game, an icon appears over your character. Clicking the icon opens the profile card view. Once the card is closed, the icon disappears, but you can reopen the card at any time by clicking your character.

*(image in the full Top G Vault)*

When viewing your own card, it appears as it would to another player, except placeholder text will appear for any blank inputs. Additionally, the status string is subject to **text filtering**, as any free text input should be.

*(image in the full Top G Vault)*

*Card without custom status*

*(image in the full Top G Vault)*

*Card with custom status*

*(image in the full Top G Vault)*

*Entering a custom status*

*(image in the full Top G Vault)*

*Attempt to enter invalid status*

#### Other Player's Card

Icons do not appear over other characters, but clicking on a character will open their profile card. The button in the upper-right corner of the card lets you quickly request that player as a friend.

Note that players under the age of 13 will only see the status message if it's appropriate for their age group.

*(image in the full Top G Vault)*

*Card with custom status*

*(image in the full Top G Vault)*

*Card without custom status*

## API reference

### Functions

#### configure

*configure(config: [[30 Official Roblox Docs/API Reference/Libraries/table|table]])*

Overrides default configuration options through the following keys/values in the `config` table. This function should be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] within **StarterPlayerScripts**.

| Key | Description | Default |
| --- | --- | --- |
| `alwaysOnTop` | If `true`, shows locator icons on top of everything, preventing them from being blocked by 3D world objects. | true |
| `showPersonalIndicator` | If `true`, shows the personal indicator when a player first joins the game. | true |
| `showBlur` | If `true`, shows the blurry screen background when a player enters edit mode. | true |
| `maxClickDistance` | Maximum distance from the camera viewpoint a card will appear when a character is clicked, measured in studs. | 100 |
| `backgroundColor` | Background color for the card ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). | [228, 255, 255] |
| `backgroundTransparency` | Transparency of the card's `backgroundColor`. | 0.2 |
| `isScaled` | If `true`, automatically scales the size of the text to fill the height of the space. | false |
| `isTruncated` | If `true`, automatically hides the ends of strings that would otherwise be too long for proper viewing. | true |
| `hasRoundedCorners` | If `true`, the card's corners will be rounded. | false |
| `cornerRadiusValue` | Value of the [[30 Official Roblox Docs/API Reference/Classes/UICorner\|UICorner]] corner radius, if `hasRoundedCorners` is `true`. | 20 |
| `hasBorder` | If `true`, shows a border for the card. | false |
| `borderColor` | Color of the card's border ([[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]). Only applies if `hasBorder` is `true`. | [228, 255, 255] |
| `borderThickness` | Thickness of the card's border, if `hasBorder` is `true`. | 3 |
| `borderTransparency` | Transparency of the card's border, if `hasBorder` is `true`. | 0 |
| `borderLineJoinMode` | Corner style of the card's border ([[30 Official Roblox Docs/API Reference/Enums/LineJoinMode\|Enum.LineJoinMode]]). Only applies if `hasBorder` is `true`. | [[30 Official Roblox Docs/API Reference/Enums/LineJoinMode\|Round]] |
| `headerFontSize` | Font size for the card's header. | 18 |
| `headerFontType` | Font type for the card's header ([[30 Official Roblox Docs/API Reference/Enums/Font\|Enum.Font]]). | [[30 Official Roblox Docs/API Reference/Enums/Font\|GothamBlack]] |
| `textFontSize` | Font size for the card's body text. | 15 |
| `textFontType` | Font type for the card's body text ([[30 Official Roblox Docs/API Reference/Enums/Font\|Enum.Font]]). | [[30 Official Roblox Docs/API Reference/Enums/Font\|GothamMedium]] |

```lua title="LocalScript" highlight="5-10"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ProfileCard = require(ReplicatedStorage.ProfileCard)

ProfileCard.configure({
	alwaysOnTop = true,
	maxClickDistance = 50,
	backgroundColor = Color3.fromRGB(0, 0, 0),
	backgroundTransparency = 0.4
})
```

---
*Source: [Profile Card](https://create.roblox.com/docs/resources/modules/profile-card) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
