---
title: "Adventure game part 2"
description: "The second part of a Roblox Developer education series. Teach students to create an adventure game in Roblox."
area: "30 Official Roblox Docs"
cluster: "Education"
source: "https://create.roblox.com/docs/education/lesson-plans/roblox-developer/roblox-developer-4"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The second part of a Roblox Developer education series. Teach students to create an adventure game in Roblox.*

**Lesson description**: Students continue developing the adventure game. They'll create scripts for using tools, selling items, and upgrading their spaces.

| | |
| --- | --- |
| **Lesson objectives** | • Apply knowledge of if/then statements to create collectible items.<br>• Demonstrate knowledge of functions to create functions that allow players to sell items and upgrade their spaces variable. |
| **Prep** | • Download the [starter tool](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/adventure-game-series/starterTool.rbxm) and load it on every student's desktop. |

### Overview

| Duration | Activity | Description |
| --- | --- | --- |
| 5 min | Introduction | Introduce the session. |
| 50 min | Guided Tutorial: Scripting Game Mechanics | Have students create scripts for tools, selling items, and upgrading spaces. |
| 5 min | Wrap-up | Reflect on project and recap concepts learned. |

### Lesson plan

#### Introduction

1. Explain that students will be adding the core gameplay mechanics of the adventure game today: using a tool to collect items, selling items, and upgrading their spaces to collect more items.
2. Point out that this session will be heavy on guided tutorials. The next session will be more free-form, so students can work on their own or catch up.

#### Guided tutorial - Script game mechanics

1. Make sure all students have access to the [starter tool](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/education/adventure-game-series/starterTool.rbxm).
2. Lead students through the following tutorials:
   - [[30 Official Roblox Docs/Education/Adventure Game Series/Collect items|Collecting Items]]
   - [[30 Official Roblox Docs/Education/Adventure Game Series/Sell items|Selling Items]]
   - [[30 Official Roblox Docs/Education/Adventure Game Series/Buy upgrades|Buying Upgrades]]

#### Wrap-up

1. Recap what students have created.
2. Optional - Ask students what feature they're excited to work on or add tomorrow as they finish their games.

### Appendix

#### Troubleshooting and classroom tips

**General troubleshooting**

- While students code, leave up example scripts for students to reference. The Tool script is especially helpful as it has nested if statements.
- Check that students are indenting their code to look like the code samples. This makes code more readable and reduces the possibility of errors.

**Scripting tips**

- Remind students to always add a comma between multiple parameters in a function, like in `sellItems(playerItems, playerGold)`.
- In the Upgrade script, the order of functions matters. Make sure that the function `giveUpgrade()` is above `clickDetector.MouseClick`.

**Facilitation tips**

- To keep students on track, set a strict time limit for playtesting, like one minute.
- Encourage students to remember a specific goal whenever playtesting, such as check if a tool harvests an item as intended. This helps them stay focused.

#### Customize the lesson

**Expand the lesson**

- More than one item can be added to harvest, just remember that each item needs a BoolValue with `CanHarvest` set to true.
- Surface GUI's, like the Upgrade Sign, can be customized. Encourage students to explore properties of TextLabels, like color and font in the properties of that TextLabel and SurfaceGui.

---
*Source: [Adventure game part 2](https://create.roblox.com/docs/education/lesson-plans/roblox-developer/roblox-developer-4) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
