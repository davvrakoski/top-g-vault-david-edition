---
title: "Customize bubble chat"
description: "The text chat system allows users to communicate and socialize with each other."
area: "30 Official Roblox Docs"
cluster: "Chat"
source: "https://create.roblox.com/docs/chat/bubble-chat"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The text chat system allows users to communicate and socialize with each other.*

With [[30 Official Roblox Docs/Chat/Text chat overview|TextChatService]], you can use bubble chat to display customizable speech chat bubbles above user avatars and NPCs. Bubble chat can make your game more visually immersive and help users easily identify messages and their speakers in a contextually relevant manner. This feature is especially useful for games where users need to focus on the content in the meantime communicating with others in a less obtrusive way.

[Video: Player-Conversation-Bubbles.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/players/in-experience-text-chat/Player-Conversation-Bubbles.mp4)

## Enable bubble chat

To enable bubble chat in your game:

1. In the **Explorer** window, select [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]] under [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]].

   *(image in the full Top G Vault)*

2. In the **Properties** window, check the [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#Enabled|BubbleChatConfiguration.Enabled]] checkbox.

   *(image in the full Top G Vault)*

## Bubble customization

After enabling bubble chat, you can customize the appearance and behavior of your chat bubbles to match your game's theme. Use the **Properties** window of [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]] for [[30 Official Roblox Docs/Chat/Customize bubble chat#Basic customization|basic]] changes like text color and spacing, or implement [[30 Official Roblox Docs/Chat/Customize bubble chat#Advanced customization|advanced]] customization for bubble background images and other visual adjustments.

*(image in the full Top G Vault)*

Alternatively, add a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] in [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]] with all your customization settings. This allows the engine to apply your customizations during runtime, overriding the settings in Studio. It's useful for adding special effects to chat bubbles when users trigger certain events or conditions.

### Basic customization

The following table shows common bubble chat customization properties. For a full list of customization properties, see [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]].

#### Appearance

| Property | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#BackgroundColor3\|BackgroundColor3]] | Background color of bubbles in [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. | `[250, 250, 250]` |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] of the bubble text. | [[30 Official Roblox Docs/API Reference/Enums/Font\|BuilderSansMedium]] |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#TextColor3\|TextColor3]] | Color of bubble text in [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. | `[57, 59, 61]` |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#TextSize\|TextSize]] | Size of bubble text. | `16` |

#### Behavior

| Property | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#Enabled\|Enabled]] | Indicating whether bubble chat is enabled in the game. | `true` (checked) |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#AdorneeName\|AdorneeName]] | String name of the body part or [[30 Official Roblox Docs/API Reference/Classes/Attachment\|Attachment]] that bubbles attach to; if multiple instances of the same name exist, the system attaches to the first instance found. | `HumanoidRootPart` |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#BubbleDuration\|BubbleDuration]] | Time before a bubble fades out, in seconds. | `30` |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#BubblesSpacing\|BubblesSpacing]] | Vertical space between stacked bubbles, in pixels. | `6` |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#LocalPlayerStudsOffset\|LocalPlayerStudsOffset]] | If adorned to the local player, the offset of bubbles in studs from their adornee, relative to the camera orientation ([[30 Official Roblox Docs/API Reference/Datatypes/Vector3\|Vector3]]). | `(0, 0, 0)` |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#MaxDistance\|MaxDistance]] | Maximum distance from the camera that bubbles are shown. | `100` |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#MinimizeDistance\|MinimizeDistance]] | Distance from the camera when bubbles turn into a single bubble with an ellipsis (**⋯**) to indicate chatter. | `40` |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#VerticalStudsOffset\|VerticalStudsOffset]] | Extra space between bubbles and their adornee, in studs. | `0` |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#MaxBubbles\|MaxBubbles]] | Maximum number of bubbles displayed before older bubbles disappear. | `3` |

### Advanced customization

For advanced customization of your bubble, add UI objects representing certain aspects of the bubble appearance as children under [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]], including:

- [[30 Official Roblox Docs/API Reference/Classes/ImageLabel|ImageLabel]] for background image settings.
- [[30 Official Roblox Docs/API Reference/Classes/UIGradient|UIGradient]] for background gradient settings.
- [[30 Official Roblox Docs/API Reference/Classes/UICorner|UICorner]] for the corner shape of bubbles.
- [[30 Official Roblox Docs/API Reference/Classes/UIPadding|UIPadding]] for the padding space between the text and bubble edges, relative to the parent's normal size.

After adding these objects, you can modify properties of these objects applicable to chat bubbles for advanced bubble customization. The following example [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] adds a background image and sharp corners to bubbles:

```lua title="Advanced Bubble Customization"
local TextChatService = game:GetService("TextChatService")

local bubbleChatConfiguration = TextChatService.BubbleChatConfiguration
bubbleChatConfiguration.TailVisible = false
bubbleChatConfiguration.TextColor3 = Color3.fromRGB(220, 50, 50)
bubbleChatConfiguration.FontFace = Font.fromEnum(Enum.Font.LuckiestGuy)

local bubbleUICorner = bubbleChatConfiguration:FindFirstChildOfClass("UICorner")
if not bubbleUICorner then
	bubbleUICorner = Instance.new("UICorner")
	bubbleUICorner.Parent = bubbleChatConfiguration
end
bubbleUICorner.CornerRadius = UDim.new(0, 0)

local bubbleUIPadding = bubbleChatConfiguration:FindFirstChildOfClass("UIPadding")
if not bubbleUIPadding then
	bubbleUIPadding = Instance.new("UIPadding")
	bubbleUIPadding.Parent = bubbleChatConfiguration
end
bubbleUIPadding.PaddingTop = UDim.new(0, 20)
bubbleUIPadding.PaddingRight = UDim.new(0, 10)
bubbleUIPadding.PaddingBottom = UDim.new(0, 15)
bubbleUIPadding.PaddingLeft = UDim.new(0, 10)

local bubbleImageLabel = bubbleChatConfiguration:FindFirstChildOfClass("ImageLabel")
if not bubbleImageLabel then
	bubbleImageLabel = Instance.new("ImageLabel")
	bubbleImageLabel.Parent = bubbleChatConfiguration
end
bubbleImageLabel.Image = "rbxassetid://109157529833093"
bubbleImageLabel.ScaleType = Enum.ScaleType.Slice
bubbleImageLabel.SliceCenter = Rect.new(40, 40, 320, 120)
bubbleImageLabel.SliceScale = 0.5
```

*(image in the full Top G Vault)*

The following tables outline the available [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] and [[30 Official Roblox Docs/UI/UI appearance modifiers|appearance modifier]] children along with their valid customization properties:

#### ImageLabel

| Property | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#Image\|Image]] | Asset ID of the bubble background image. |  |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageColor3\|ImageColor3]] | Color tint of the bubble background image in [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. | `[255, 255, 255]` |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageRectOffset\|ImageRectOffset]] | Offset of the image area to be displayed from the top-left in pixels. | `(0, 0)` |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ImageRectSize\|ImageRectSize]] | Size of the image area to be displayed in pixels. To display the entire image, set either dimension to `0`. | `(0, 0)` |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ScaleType\|ScaleType]] | The scale type for rendering the image when its size is different from the absolute size of the bubble. | [[30 Official Roblox Docs/API Reference/Enums/ScaleType\|Stretch]] |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#SliceCenter\|SliceCenter]] | Slice boundaries of the image if the image is a 9-sliced image. Only applicable when you set [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ScaleType\|ScaleType]] as [[30 Official Roblox Docs/API Reference/Enums/ScaleType\|Slice]]. | `(0, 0, 0, 0)` |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#SliceScale\|SliceScale]] | Scale ratio of slice edges if the image is a 9-sliced image. Only applicable when you set [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ScaleType\|ScaleType]] as [[30 Official Roblox Docs/API Reference/Enums/ScaleType\|Slice]]. | `1` |
| [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#TileSize\|TileSize]] | Tiling size of the image. Only applicable when you set [[30 Official Roblox Docs/API Reference/Classes/ImageLabel#ScaleType\|ScaleType]] as [[30 Official Roblox Docs/API Reference/Enums/ScaleType\|Tile]]. | `(1, 0, 1, 0)` |

#### UIGradient

| Property | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Enabled\|Enabled]] | Indicating whether the bubble background gradient is enabled. | `false` (unchecked) |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Color\|Color]] | Color of the background gradient. | `[250, 250, 250]` |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Offset\|Offset]] | Scalar translation of the gradient from the center of the bubble. | `(0, 0)` |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Rotation\|Rotation]] | Clockwise rotation, in degrees, of the gradient starts from left to right. | `0` |
| [[30 Official Roblox Docs/API Reference/Classes/UIGradient#Transparency\|Transparency]] | Transparency of the background gradient. | `(1, 0)` |

#### UICorner

| Property | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UICorner#CornerRadius\|CornerRadius]] | Radius of the bubble corner shape in pixels. | `(0, 12)` |

#### UIPadding

| Property | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingBottom\|PaddingBottom]] | Padding on the bottom. | `Datatype.UDim.new(0,8)` |
| [[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingLeft\|PaddingLeft]] | Padding on the left. | `Datatype.UDim.new(0,8)` |
| [[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingRight\|PaddingRight]] | Padding on the right. | `Datatype.UDim.new(0,8)` |
| [[30 Official Roblox Docs/API Reference/Classes/UIPadding#PaddingTop\|PaddingTop]] | Padding on the top. | `Datatype.UDim.new(0,8)` |

## Per-bubble customization

You can individually style and modify chat bubble behaviors based on specific conditions in order to override your general settings. For example, you can use chat bubbles to differentiate NPCs and users, highlight critical health status, and apply special effects to messages with pre-defined keywords.

To set per-bubble customization, add a client-side [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] using [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties|BubbleChatMessageProperties]], which overrides matching properties of [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration|BubbleChatConfiguration]], and the [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnBubbleAdded|TextChatService.OnBubbleAdded]] callback to specify how to customize each bubble. The callback supplies you with the [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage|TextChatMessage]] property as well as the adornee, so you can apply the customization based on attributes associated with users, the chat text content, user character properties, and any special conditions you want to define.

The following basic customization properties are available for per-bubble customization:

| Property | Description | Default |
| --- | --- | --- |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#BackgroundColor3\|BackgroundColor3]] | Background color of bubbles in [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. | `(250, 250, 250)` |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#BackgroundTransparency\|BackgroundTransparency]] | Background transparency of bubbles. | `0.1` |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#FontFace\|FontFace]] | [[30 Official Roblox Docs/API Reference/Datatypes/Font\|Font]] of the bubble text. | [[30 Official Roblox Docs/API Reference/Enums/Font\|BuilderSansMedium]] |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#TextColor3\|TextColor3]] | Color of bubble text in [[30 Official Roblox Docs/API Reference/Datatypes/Color3\|Color3]]. | `[57, 59, 61]` |
| [[30 Official Roblox Docs/API Reference/Classes/BubbleChatConfiguration#TextSize\|TextSize]] | Size of bubble text. | `16` |

The following example adds special appearance to VIP users' chat bubbles by checking if a chat message sender has the `IsVIP` attribute:

```lua title="VIP Bubbles"
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

-- Event handler for when a new chat bubble is added to the game
TextChatService.OnBubbleAdded = function(message: TextChatMessage, adornee: Instance)
	-- Check if the chat message has a TextSource (sender) associated with it
	if message.TextSource then
		-- Create a new BubbleChatMessageProperties instance to customize the chat bubble
		local bubbleProperties = Instance.new("BubbleChatMessageProperties")

		-- Get the user who sent the chat message based on their UserId
		local player = Players:GetPlayerByUserId(message.TextSource.UserId)

		if player:GetAttribute("IsVIP") then
			-- If the player is a VIP, customize the chat bubble properties
			bubbleProperties.TextColor3 = Color3.fromHex("#F5CD30")
			bubbleProperties.BackgroundColor3 = Color3.fromRGB(25, 27, 29)
			bubbleProperties.FontFace = Font.fromEnum(Enum.Font.PermanentMarker)
		end
		return bubbleProperties
	end
end
```

[Video: VIP-Bubble.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/players/in-experience-text-chat/VIP-Bubble.mp4)

All advanced customization options are available for per-bubble customization. Similar to advanced customization for general bubbles, add instances that you want to customize as children of [[30 Official Roblox Docs/API Reference/Classes/BubbleChatMessageProperties|BubbleChatMessageProperties]]. The following example adds a special gradient effect along with other properties to chat bubbles of users with low health status by checking the [[30 Official Roblox Docs/API Reference/Classes/Humanoid#Health|Humanoid.Health]] property of chat message senders' characters:

```lua title="Low Health Bubbles"
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

-- Event handler for when a new chat bubble is added to the game
TextChatService.OnBubbleAdded = function(message: TextChatMessage, adornee: Instance)
	-- Check if the chat message has a TextSource (sender) associated with it
	if message.TextSource then
		-- Get the user who sent the chat message by using their UserId
		local player = Players:GetPlayerByUserId(message.TextSource.UserId)

		-- Find the humanoid in the user's character
		local humanoid = player.Character:FindFirstChildWhichIsA("Humanoid")

		if humanoid and humanoid.Health < 25 then
			-- Create a new BubbleChatMessageProperties instance to customize the chat bubble
			local bubbleProperties :BubbleChatMessageProperties = Instance.new("BubbleChatMessageProperties")

			-- Customize the chat bubble properties for low health condition
			bubbleProperties.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
			bubbleProperties.TextColor3 = Color3.fromRGB(234, 51, 96)
			bubbleProperties.TextSize = 20
			bubbleProperties.FontFace = Font.fromEnum(Enum.Font.DenkOne)

			-- Add a UIGradient as a child to customize the gradient
			local uiGradient : UIGradient = Instance.new("UIGradient")
			uiGradient.Color = ColorSequence.new(Color3.fromRGB(110, 4, 0), Color3.fromRGB(0, 0, 0))
			uiGradient.Rotation = 90
			uiGradient.Parent = bubbleProperties

			return bubbleProperties
		end
	end
end
```

[Video: Low-Health-Bubble.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/players/in-experience-text-chat/Low-Health-Bubble.mp4)

## Manually display bubbles

You might want to display a chat bubble when players haven't sent a message, such as with NPCs. Use the [[30 Official Roblox Docs/API Reference/Classes/TextChatService#DisplayBubble|TextChatService:DisplayBubble]] method to manually display a chat bubble.

Customization of these bubbles is the same as the customization of the bubbles that are automatically displayed when Players send messages through TextChannels using the [[30 Official Roblox Docs/Chat/Customize bubble chat#Per-bubble customization|TextChatService.OnBubbleAdded callback]].

> [!success]
> To generate speech or other text using an LLM, see the [[30 Official Roblox Docs/API Reference/Classes/TextGenerator|TextGenerator]] class.

### NPC bubbles

Display chat bubbles for non-player characters (NPCs) by calling `Class.TextChatService:DisplayBubble(character, message)`, with the NPC character and the message as parameters. These bubbles are customizable using the [[30 Official Roblox Docs/API Reference/Classes/TextChatService#OnBubbleAdded|TextChatService.OnBubbleAdded]] callback just like any other chat bubble.

[[30 Official Roblox Docs/API Reference/Classes/TextChatService#DisplayBubble|TextChatService:DisplayBubble()]] only works on client-side scripts, so be sure to use a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] with [[30 Official Roblox Docs/API Reference/Classes/BaseScript#RunContext|RunContext]] set to [[30 Official Roblox Docs/API Reference/Enums/RunContext|Enum.RunContext.Client]], or a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] in an [[30 Official Roblox Docs/Projects/Data model#Client|appropriate container]], such as [[30 Official Roblox Docs/API Reference/Classes/StarterPlayerScripts|StarterPlayerScripts]]. If you attach a [[30 Official Roblox Docs/API Reference/Classes/ProximityPrompt|ProximityPrompt]] to an NPC, a script for displaying a chat bubble might look like this:

```lua
local TextChatService = game:GetService("TextChatService")
local Workspace = game:GetService("Workspace")

local prompt = Workspace.SomeNPC.ProximityPrompt
local head = prompt.Parent:WaitForChild("Head")

prompt.Triggered:Connect(function()
	TextChatService:DisplayBubble(head, "Hello world!")
end)
```

---
*Source: [Customize bubble chat](https://create.roblox.com/docs/chat/bubble-chat) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
