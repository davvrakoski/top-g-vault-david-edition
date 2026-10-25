---
title: "Custom text chat UI"
description: "Example of how to create a simple frontend UI powered with TextChatService."
area: "30 Official Roblox Docs"
cluster: "Chat"
source: "https://create.roblox.com/docs/chat/examples/simple-custom-frontend-ui"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Example of how to create a simple frontend UI powered with TextChatService.*

> [!warning]
> When [[30 Official Roblox Docs/Chat/Platform-integrated chat|platform-integrated chat]] is enabled, custom UIs can no longer render player message text themselves. Use [[30 Official Roblox Docs/API Reference/Classes/TextChannelWindow|TextChannelWindow]] instead of reading [[30 Official Roblox Docs/API Reference/Classes/TextChatMessage#Text|Text]] or listening to [[30 Official Roblox Docs/API Reference/Classes/TextChatService#MessageReceived|MessageReceived]] for display.

This example shows how to use the [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] class to design your own frontend. It reuses the default text channels from [[30 Official Roblox Docs/API Reference/Classes/TextChatService#CreateDefaultTextChannels|CreateDefaultTextChannels]] and is very simple compared to the default UI.

1. Disable the default UI that comes with the [[30 Official Roblox Docs/API Reference/Classes/TextChatService|TextChatService]] by setting the [[30 Official Roblox Docs/API Reference/Classes/ChatWindowConfiguration#Enabled|ChatWindowConfiguration.Enabled]] and [[30 Official Roblox Docs/API Reference/Classes/ChatInputBarConfiguration#Enabled|ChatInputBarConfiguration.Enabled]] properties to `false` in Studio's **Properties** window.
2. Create a replacement for the chat input bar. This is the text box that emits messages when the user presses <kbd>Enter</kbd>.

   1. Create a [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] and parent it to [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]].
   2. Create a [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] and parent it to the new [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]], then [[30 Official Roblox Docs/UI/Position and size UI objects#Position|reposition]] and [[30 Official Roblox Docs/UI/Position and size UI objects#Size|resize]] it as desired.
   3. Create a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] and parent it to the new [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]].
   4. Add the following code to the [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]:

			```lua title="Client"
			local TextChatService = game:GetService("TextChatService")

			-- RBXGeneral is the default public channel
			local RBXGeneral = TextChatService:FindFirstChild("TextChannels"):WaitForChild("RBXGeneral")

			local textBox = script.Parent
			textBox.FocusLost:Connect(function(enterPressed)
				local text = textBox.Text
				if enterPressed and #text > 0 then
					local success, response = pcall(function()
						return RBXGeneral:SendAsync(textBox.Text)
					end)

					if not success then
						RBXGeneral:DisplaySystemMessage("Failed to send message")
					end

					-- Users expect the input box to be cleared after sending a message
					textBox.Text = ""
				end
			end)
			```

3. Create a replacement for the chat window. This is the [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrame]] that displays messages as they are received from [[30 Official Roblox Docs/API Reference/Classes/TextChatService#MessageReceived|TextChatService.MessageReceived]]. This step also creates a [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] to automatically layout the messages.

   1. Create another new [[30 Official Roblox Docs/API Reference/Classes/ScreenGui|ScreenGui]] and parent it to [[30 Official Roblox Docs/API Reference/Classes/StarterGui|StarterGui]].
   2. Create a [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrame]] and parent it to the `ScreenGui`, then [[30 Official Roblox Docs/UI/Position and size UI objects#Position|reposition]] and [[30 Official Roblox Docs/UI/Position and size UI objects#Size|resize]] it as desired.
   3. Create a [[30 Official Roblox Docs/API Reference/Classes/UIListLayout|UIListLayout]] and parent it to the [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrame]].
   4. Create a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] and parent it to the [[30 Official Roblox Docs/API Reference/Classes/ScrollingFrame|ScrollingFrame]].
   5. Add the following code to the [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]]:

		```lua title="Client"
		local TextChatService = game:GetService("TextChatService")

		-- Function to create a new text label for each message received
		local function addMessageGui(textChatMessage: TextChatMessage)
			local isOutgoingMessage = textChatMessage.Status == Enum.TextChatMessageStatus.Sending

			local parent = script.Parent

			local originalLabel = parent:FindFirstChild(textChatMessage.MessageId)
			if originalLabel then
				originalLabel.Text = textChatMessage.Text
				originalLabel.BackgroundTransparency = if isOutgoingMessage then 0.5 else 0
			else
				local textLabel = Instance.new("TextLabel")
				textLabel.BorderSizePixel = 0
				textLabel.Font = Enum.Font.BuilderSans
				textLabel.TextSize = 18
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.BackgroundTransparency = if isOutgoingMessage then 0.5 else 0
				textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				textLabel.Name = textChatMessage.MessageId
				textLabel.AutomaticSize = Enum.AutomaticSize.XY
				textLabel.Text = textChatMessage.Text
				textLabel.Parent = parent
			end
		end

		-- Start listening for incoming messages
		TextChatService.MessageReceived:Connect(addMessageGui)
		```

		> [!warning]
		> When using the [[30 Official Roblox Docs/API Reference/Classes/TextChatService#MessageReceived|TextChatService.MessageReceived]] event, it's important to check if the message already exists in the chat window. This event is called once when sending and once when the message is received from the server.

4. Test your game by sending messages in the chat input bar. You should see the messages appear in the chat window. You can then expand on this example by adding features such as focusing the [[30 Official Roblox Docs/API Reference/Classes/TextBox|TextBox]] when a key is pressed or adding [[30 Official Roblox Docs/Chat/Examples/Assign chat tags|chat tags]].

---
*Source: [Custom text chat UI](https://create.roblox.com/docs/chat/examples/simple-custom-frontend-ui) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
