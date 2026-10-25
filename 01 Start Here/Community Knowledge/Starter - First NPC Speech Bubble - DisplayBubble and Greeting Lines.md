---
area: "01 Start Here"
cluster: "Start Here"
title: "First NPC Speech Bubble - DisplayBubble and Greeting Lines"
tags: [roblox, community-knowledge, start-here, npc, chat, textchatservice, dialogue]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/chat/bubble-chat
  - https://create.roblox.com/docs/reference/engine/classes/TextChatService
  - https://create.roblox.com/docs/reference/engine/classes/BubbleChatConfiguration
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
---
# First NPC Speech Bubble - DisplayBubble and Greeting Lines

An NPC that says "Welcome, traveler!" in a chat bubble when you walk up is one of the cheapest ways to give a game personality, explain a mechanic, or point players to the next goal. Roblox already draws chat bubbles for players; `TextChatService:DisplayBubble()` lets you show the same bubble above any part, including an NPC's head. This note builds a shopkeeper that greets you, picks a random line, and does not spam.

## Before you start

- Your game uses **TextChatService** (the default for new places).
- In the Explorer: **TextChatService > BubbleChatConfiguration**, make sure **Enabled** is ticked. The API reference lists its default as `false`, so check it rather than assume.
- You have an NPC model with a `Head` part (a Rig Builder rig works; see [[Starter - First Patrol NPC - Waypoints with MoveTo and MoveToFinished]]).

## The key rule: bubbles are drawn on the client

`DisplayBubble` only works in a **LocalScript** (or a Script with `RunContext` set to `Client`). It shows the bubble on **that player's** screen only. That is perfect for "the NPC talks to you". If everyone should see it, the server tells all clients (shown further down).

## Step by step: greet on prompt

1. Inside the NPC's `HumanoidRootPart` (or its Head), insert a **ProximityPrompt**. Set `ActionText` = "Talk", `ObjectText` = "Shopkeeper", `MaxActivationDistance` = 10.
2. Add a **LocalScript** in `StarterPlayerScripts`:

```lua
local TextChatService = game:GetService("TextChatService")

local npc = workspace:WaitForChild("Shopkeeper")
local head = npc:WaitForChild("Head")
local prompt = npc:WaitForChild("HumanoidRootPart"):WaitForChild("ProximityPrompt")

local LINES = {
	"Welcome! Swords are half price today.",
	"Need a torch? The caves are dark.",
	"Come back when you have 100 coins.",
}
local COOLDOWN = 4
local lastTalk = 0

prompt.Triggered:Connect(function()
	if os.clock() - lastTalk < COOLDOWN then return end
	lastTalk = os.clock()
	local line = LINES[math.random(1, #LINES)]
	TextChatService:DisplayBubble(head, line)
end)
```

3. Play, walk up, press **E** (or tap the prompt on mobile). A bubble appears over the head and fades after a while.

## Greet automatically when a player comes close

Instead of a prompt, check distance on the client every half second (same LocalScript, reusing `TextChatService` and `head` from above):

```lua
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local greeted = false

while true do
	task.wait(0.5)
	local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if root then
		local near = (root.Position - head.Position).Magnitude < 12
		if near and not greeted then
			TextChatService:DisplayBubble(head, "Hey! Over here!")
		end
		greeted = near
	end
end
```

`greeted` makes it say hello once each time you arrive, not every half second.

## When everyone should see the line

For a boss taunt or a round announcement from an NPC, let the server decide and broadcast:

```lua
-- Script (server)
local say = game.ReplicatedStorage.Remotes.NpcSay
say:FireAllClients(workspace.Boss.Head, "You cannot escape!")
```

```lua
-- LocalScript (client)
game.ReplicatedStorage.Remotes.NpcSay.OnClientEvent:Connect(function(part, text)
	game:GetService("TextChatService"):DisplayBubble(part, text)
end)
```

## Style the bubbles

`BubbleChatConfiguration` changes every bubble: `BackgroundColor3`, `TextColor3`, `TextSize`, `FontFace`, `BubbleDuration` (seconds before fade, default 30) and `MaxDistance`. To style NPC bubbles differently from player bubbles, use the `TextChatService.OnBubbleAdded` callback described in the official bubble chat guide.

## Pitfalls

- **Nothing appears:** bubble chat disabled, script is a server Script, or the part you passed is not in the world yet (use `WaitForChild`).
- **Wall of text:** keep lines under about 80 characters; players read bubbles at a glance. Longer talks belong in a dialogue box; see [[NPC Conversation UX - Prompts, Typewriter Text and Skipping]].
- **Player-written text:** lines you typed yourself are fine, but if a line includes something a player wrote (a pet name, a message), filter it first.
- **Generated lines from AI** come with disclosure and maturity rules; read [[Policy - Generative AI in Games - Disclosure and Maturity Rules]] before trying `TextGenerator`.

## Related
[[00 START HERE - Top G Vault]] · [[First Interaction with ProximityPrompt]] · [[NPC Conversation UX - Prompts, Typewriter Text and Skipping]] · [[Customize bubble chat]] · [[Story - Contextual Barks - Rule-Based NPC Lines That React to the World]]
