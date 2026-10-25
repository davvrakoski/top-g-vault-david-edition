---
title: "Social Interactions"
description: "The Social Interactions module lets avatars better express themselves and their natural movements."
area: "30 Official Roblox Docs"
cluster: "Resources"
source: "https://create.roblox.com/docs/resources/modules/social-interactions"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The Social Interactions module lets avatars better express themselves and their natural movements.*

Your avatar is your identity in any space you enter. The **SocialInteractions** [[30 Official Roblox Docs/Resources/Modules/Developer modules|developer module]] lets each user better express themselves and their natural movements, adding a touch of realism to the game.

This module includes the following features:

| | |
| --- | --- |
| **Body Orientation** | Makes the head of everyone's avatar face where their corresponding user's camera is pointing, through a mix of neck and waist rotation. This provides a subtle cue as to who or what someone else is interacting with. |
| **Chat Animations** | Adds some liveliness to the in-game chat by making avatars occasionally play animations, depending on the content of the messages they send. The list of "trigger words" that activate each animation is configurable. |

[Video: Showcase.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/developer-modules/social-interactions/Showcase.mp4)

> [!warning]
> The body orientation feature uses [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] adjustment of the **Neck** and **Waist** joints on the character, meaning that custom rigs must include [[30 Official Roblox Docs/API Reference/Classes/Motor6D|Motor6D]] objects of the same name for the module to work properly.

## Module Usage

### Installation

To use the **SocialInteractions** module in a game:

1. From Studio's **Window** menu or **Home** tab toolbar, open the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) and select the **Creator Store** tab.

   *(image in the full Top G Vault)*

1. Make sure the **Models** sorting is selected, then click the **See All** button for **Categories**.

   *(image in the full Top G Vault)*

1. Locate and click the **Packages** tile.

1. Locate the **Social Interactions** module and click it, or drag-and-drop it into the 3D view.

   *(image in the full Top G Vault)*

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window, move the entire **SocialInteractions** model into [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. Upon running the game the module will begin running.

### Configuration

Simply inserting the **SocialInteractions** module will enable both the **body orientation** and **chat animations** features inside your place. To adjust the default behavior:

1. In **StarterPlayerScripts**, create a new [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] and rename it to **ConfigureSocialInteractions**.

   *(image in the full Top G Vault)*

1. Paste the following code into the new script, using the [[30 Official Roblox Docs/Resources/Modules/Social Interactions#configure|configure]] function to customize the module's behavior.

   ```lua title="LocalScript" highlight="6-9"
   local ReplicatedStorage = game:GetService("ReplicatedStorage")

   local SocialInteractions = require(ReplicatedStorage.SocialInteractions)

   -- Make waist rotation more pronounced and disable the chat animations feature
   SocialInteractions.configure({
   	waistOrientationWeight = 0.75,
   	useChatAnimations = false,
   })
   ```

### Chat Animation Trigger Words

The list of "trigger words" that activate each chat animation is configurable and Luau string patterns are utilized to increase recognizable words. For example, one combination used by the **Wave** animation is `he+y+o*`, meaning that `hey`, `heyyy`, `heyo`, `heyyyyo`, `heeeeyyyyo`, and other variations qualify to trigger the animation.

Also note that trigger words are **case-insensitive**, so typing `hey` is the same as `HEY`, `Hey`, and other variations.

| Animation | Animation ID | Word Patterns |
| --- | --- | --- |
| Wave | `3344650532` | `hell+o+` `h+i+o*` `wa+[sz]+u+p+` `y+o+` `greetings*` `salutations*` `goo+d+%smorning+` `he+y+o*` `howdy+` `what's*%s*up+` |
| Applaud | `5911729486` | `ya+y+` `h[ou]+r+a+y+` `woo+t*` `woo+h+oo+` `bravo+` `congratulations+` `congrats+` `gg` `pog+` `poggers+` |
| Agree | `4841397952` | `ye+s*` `ye+a+h*` `y[eu]+p+` `o+k+` `o+k+a+y+` |
| Disagree | `4841401869` | `no+` `no+pe+` `yi+ke+s+` |
| Shrug | `3334392772` | `not+%s+sure+` `idk+` `don't%s+know+` `i%s+don't%s+know+` `who+%s+knows+` |
| Laugh | `3337966527` | `lo+l+` `rof+l+` `ha[ha]*` `he[he]+` |
| Sleep | `4686925579` | `zzz+` `yawn+` |

The list of trigger words that activate each animation is configurable, and additional animations can be added via the [[30 Official Roblox Docs/Resources/Modules/Social Interactions#setTriggerWordsForChatAnimation|setTriggerWordsForChatAnimation]] function. For example, the following [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] links the [Tilt](https://www.roblox.com/catalog/3360692915/Tilt) animation with the string pattern of `cra+zy` to support trigger words like `crazy` and `craaaaaazy`. It also registers an additional string pattern of `coo+l` for the [Applaud](https://www.roblox.com/catalog/5915779043/Applaud) animation to support words like `cool` and `coooool`.

```lua title="LocalScript" highlight="6, 9"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SocialInteractions = require(ReplicatedStorage.SocialInteractions)

-- Register string pattern for the "Tilt" animation
SocialInteractions.setTriggerWordsForChatAnimation("rbxassetid://3334538554", {"cra+zy"})

-- Register additional string pattern for the "Applaud" animation
SocialInteractions.setTriggerWordsForChatAnimation("rbxassetid://5911729486", {"coo+l"})
```

## API Reference

### Functions

#### configure

*configure(config: [[30 Official Roblox Docs/API Reference/Libraries/table|table]])*

Overrides default configuration options through the following keys/values in the `config` table. This function can only be called from a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

| Key | Description | Default |
| --- | --- | --- |
| `useBodyOrientation` | Toggles the **body orientation** feature. | true |
| `waistOrientationWeight` | Body orientation uses a mix of waist and neck rotation; this parameter determines which of the two is prevalent. A value of 1 places complete emphasis on the waist while 0 places complete emphasis on the neck. | 0.5 |
| `useChatAnimations` | Toggles the **chat animations** feature. | true |
| `useDefaultTriggerWordsForChatEmotes` | Chat animations comes with a default list of [[30 Official Roblox Docs/Resources/Modules/Social Interactions#Chat Animation Trigger Words\|trigger words]]. Set this parameter to `false` if you'd like to turn them off and provide your own. | true |

```lua title="LocalScript" highlight="6-9"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SocialInteractions = require(ReplicatedStorage.SocialInteractions)

-- Make waist rotation more pronounced and disable the chat animations feature
SocialInteractions.configure({
	waistOrientationWeight = 0.75,
	useChatAnimations = false,
})
```

#### setTriggerWordsForChatAnimation

*setTriggerWordsForChatAnimation(animationId: [[30 Official Roblox Docs/API Reference/Libraries/string|string]], triggerWords: [[30 Official Roblox Docs/API Reference/Libraries/table|table]])*

Registers a new animation in the chat animation feature. Typing any word that matches a string pattern included in the `triggerWords` table will activate the animation whose ID is passed as the first parameter.

Note that trigger words are **case-insensitive** to players, so a pattern of `woah` will accept chat phrases of `woah`, `WOAH`, `Woah`, and other variations.

```lua title="LocalScript" highlight="6-9"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SocialInteractions = require(ReplicatedStorage.SocialInteractions)

-- Register new string pattern for a custom animation
SocialInteractions.setTriggerWordsForChatAnimation(
	"rbxassetid://3334538554",
	{"cra+zy", "woah+"}
)
```

### Events

#### onChatAnimationPlayed

Fires when a chat animation plays. The connected function receives the animation ID and the word that triggered the animation as its arguments. This event can only be connected in a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]].

| Parameters |  |
| --- | --- |
| animationId: [[30 Official Roblox Docs/API Reference/Libraries/string\|string]] | Animation ID that played. |
| triggerWord: [[30 Official Roblox Docs/API Reference/Libraries/string\|string]] | Chat word that triggered the animation. |

```lua title="LocalScript" highlight="5-7"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SocialInteractions = require(ReplicatedStorage.SocialInteractions)

SocialInteractions.onChatAnimationPlayed:Connect(function(animationId, triggerWord)
	print(animationId, triggerWord)
end)
```

---
*Source: [Social Interactions](https://create.roblox.com/docs/resources/modules/social-interactions) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
