---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Notification Toasts from the Server"
tags: [roblox, community-knowledge, scripting, recipe, luau, ui, notifications, toasts, remoteevent, tweenservice]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/scripting/events/remote
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
  - https://create.roblox.com/docs/ui/list-flex-layouts
  - https://create.roblox.com/docs/ui/animation
---
# Recipe - Notification Toasts from the Server

Small pop-ups at the bottom of the screen: "Not enough coins", "Quest complete +50 XP", "You need a Red keycard". Almost every other recipe needs a way for the **server** to tell **one player** something privately. Changing shared text (a prompt's `ActionText`, a sign) leaks the message to everyone; chat system lines get noisy. A toast module gives every server system one line to call: `Notify.send(player, "text", "error")`.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `Notify` | ModuleScript | `ServerScriptService` |
| `Toasts` | LocalScript | `StarterPlayer > StarterPlayerScripts` |
| `NotifyEvent` | RemoteEvent | `ReplicatedStorage` (created by the module) |

## Server module
```lua
-- ServerScriptService/Notify (ModuleScript)
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local event = Instance.new("RemoteEvent")
event.Name = "NotifyEvent"
event.Parent = ReplicatedStorage

local Notify = {}
local MAX_LEN = 120

local function clean(text: string): string
	return string.sub(tostring(text), 1, MAX_LEN)
end

-- kind: "info" | "success" | "error"
function Notify.send(player: Player, text: string, kind: string?)
	event:FireClient(player, clean(text), kind or "info")
end

function Notify.all(text: string, kind: string?)
	event:FireAllClients(clean(text), kind or "info")
end

return Notify
```

## Client toasts
```lua
-- StarterPlayerScripts/Toasts (LocalScript)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local event = ReplicatedStorage:WaitForChild("NotifyEvent") :: RemoteEvent
local MAX_VISIBLE = 3
local SHOW_TIME = 3
local COLORS = {
	info = Color3.fromRGB(40, 110, 200),
	success = Color3.fromRGB(40, 160, 90),
	error = Color3.fromRGB(190, 60, 55),
}

local gui = Instance.new("ScreenGui")
gui.Name = "Toasts"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50 -- above most HUDs
gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local holder = Instance.new("Frame")
holder.AnchorPoint = Vector2.new(0.5, 1)
holder.Position = UDim2.new(0.5, 0, 1, -140)
holder.Size = UDim2.fromOffset(360, 160)
holder.BackgroundTransparency = 1
holder.Parent = gui

local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Padding = UDim.new(0, 6)
layout.Parent = holder

local order = 0
local recent: {[string]: number} = {}

local function dismiss(toast: Frame)
	if toast:GetAttribute("Closing") then return end
	toast:SetAttribute("Closing", true)
	local label = toast:FindFirstChildOfClass("TextLabel")
	local info = TweenInfo.new(0.25)
	TweenService:Create(toast, info, { BackgroundTransparency = 1 }):Play()
	if label then TweenService:Create(label, info, { TextTransparency = 1 }):Play() end
	task.delay(0.3, function() toast:Destroy() end)
end

event.OnClientEvent:Connect(function(text: string, kind: string)
	-- drop exact duplicates within 1 s (spam-clicking a locked door)
	local now = os.clock()
	if recent[text] and now - recent[text] < 1 then return end
	recent[text] = now

	order += 1
	local toast = Instance.new("Frame")
	toast.LayoutOrder = order
	toast.Size = UDim2.fromOffset(340, 40)
	toast.BackgroundColor3 = COLORS[kind] or COLORS.info
	toast.BackgroundTransparency = 1
	local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 8); corner.Parent = toast

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -16, 1, 0)
	label.Position = UDim2.fromOffset(8, 0)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1, 1, 1)
	label.TextTransparency = 1
	label.TextScaled = true
	label.Text = text -- plain text: RichText is off, so tags show literally
	label.Parent = toast
	toast.Parent = holder

	local info = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	TweenService:Create(toast, info, { BackgroundTransparency = 0.1 }):Play()
	TweenService:Create(label, info, { TextTransparency = 0 }):Play()

	-- keep at most MAX_VISIBLE: close the oldest
	local live = {}
	for _, child in holder:GetChildren() do
		if child:IsA("Frame") and not child:GetAttribute("Closing") then table.insert(live, child) end
	end
	table.sort(live, function(a, b) return a.LayoutOrder < b.LayoutOrder end)
	for i = 1, #live - MAX_VISIBLE do dismiss(live[i]) end

	task.delay(SHOW_TIME, function()
		if toast.Parent then dismiss(toast) end
	end)
end)
```

## Using it from other recipes
```lua
local Notify = require(game:GetService("ServerScriptService"):WaitForChild("Notify"))
Notify.send(player, "You need a Red keycard", "error")   -- keycard door
Notify.send(player, `Crafted Torch`, "success")          -- crafting table
Notify.all("Double coins for 10 minutes!", "info")       -- live event
```

## How to test
1. In the server command bar: `require(game.ServerScriptService.Notify).send(game.Players:GetPlayers()[1], "Hello", "success")`: a green toast fades in and out after 3 s.
2. Send five in a row: only three are visible; the oldest close first.
3. Send the same text 10 times in a loop: one toast (duplicate filter).
4. Send `"<b>hi</b>"`: shows the tags as text, proving no rich-text injection.
5. Phone emulator: the toast sits above the thumb area and does not cover the jump button; move `Position` if your HUD differs.

## Common mistakes
- **Using shared instance text** (prompt text, `Hint`, a SurfaceGui) for private messages.
- **Passing player-typed text** into `Notify.all`. Filter it first (see [[Text Filtering in Practice - Pet Names, Signs and Offline Authors]]).
- **Turning on `RichText`** for server strings that contain names: a name with `<` breaks the label. Keep plain text, or escape.
- **`StarterGui:SetCore("SendNotification")`** from old tutorials: it is a CoreGui call with limited styling and is not something to drive from the server; a custom toast is clearer and themeable.

## Related
[[Scripting - Hub]] · [[TweenService UI Animation Recipes]] · [[UI and Feedback Sound Design - Clicks, Rewards and Errors]] · [[Recipe - Keycard Door with ProximityPrompt]]
