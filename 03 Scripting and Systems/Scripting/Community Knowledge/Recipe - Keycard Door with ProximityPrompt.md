---
area: "03 Scripting and Systems"
cluster: "Scripting"
title: "Recipe - Keycard Door with ProximityPrompt"
tags: [roblox, community-knowledge, scripting, recipe, luau, door, keycard, proximityprompt, tweenservice, tools]
cssclasses: [tg-a03]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/proximity-prompts
  - https://create.roblox.com/docs/reference/engine/classes/ProximityPrompt
  - https://create.roblox.com/docs/reference/engine/classes/TweenService
  - https://create.roblox.com/docs/players/tools
---
# Recipe - Keycard Door with ProximityPrompt

A door that only opens for players carrying the right keycard (a Tool with a `CardColor` attribute), plus a pickup that hands out the card. It is the core loop of escape rooms, facility horror games and heists. The basic open/close door is already in [[First Interaction with ProximityPrompt]]; this recipe adds the server-side item check, multiple card colours from one script, auto-close, and a card giver.

> **Code status:** original example, **not run in Studio**. API names checked against `30 Official Roblox Docs/API Reference` (2026-10-25).

## Where it goes
| Item | Type | Location |
|---|---|---|
| `KeycardDoors` | Script | `ServerScriptService` |
| `RedKeycard`, `BlueKeycard` ... | Tool (with a `Handle` part) | `ServerStorage > Keycards` |
| door models | Model tagged `KeycardDoor`, child part `Door` (Anchored) | `Workspace` |
| card givers | Part tagged `KeycardGiver` | `Workspace` |

Attributes:
- each keycard Tool: `CardColor` (string, e.g. `"Red"`);
- each door model: `RequiredCard` (string), optional `OpenTime` (number, seconds);
- each giver part: `CardColor` (string) and the giver looks for `ServerStorage.Keycards[CardColor .. "Keycard"]`.

## The code
```lua
-- ServerScriptService/KeycardDoors (Script)
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local ServerStorage = game:GetService("ServerStorage")

local MAX_USE_DISTANCE = 14 -- server-side sanity check

local function carriesCard(player: Player, color: string): boolean
	local containers = { player.Character, player:FindFirstChildOfClass("Backpack") }
	for _, container in containers do
		if container then
			for _, item in container:GetChildren() do
				if item:IsA("Tool") and item:GetAttribute("CardColor") == color then
					return true
				end
			end
		end
	end
	return false
end

local function closeEnough(player: Player, part: BasePart): boolean
	local character = player.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")
	return root ~= nil and (root.Position - part.Position).Magnitude <= MAX_USE_DISTANCE
end

local function setupDoor(model: Instance)
	local door = model:FindFirstChild("Door")
	if not door or not door:IsA("BasePart") then
		warn("KeycardDoor without a Door part:", model:GetFullName())
		return
	end
	local required = model:GetAttribute("RequiredCard") or "Red"
	local openTime = model:GetAttribute("OpenTime") or 3

	local prompt = door:FindFirstChildOfClass("ProximityPrompt") or Instance.new("ProximityPrompt")
	prompt.ActionText = "Swipe card"
	prompt.ObjectText = required .. " security door"
	prompt.HoldDuration = 0.3
	prompt.MaxActivationDistance = 8
	prompt.Parent = door

	local closedCFrame = door.CFrame
	local openCFrame = closedCFrame * CFrame.new(0, door.Size.Y - 0.2, 0) -- slide up into the frame
	local info = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local busy = false

	prompt.Triggered:Connect(function(player)
		if busy or not closeEnough(player, door) then return end
		if not carriesCard(player, required) then
			-- NOTE: prompt text is shared by everyone; for a private message use a toast
			prompt.ActionText = "Needs " .. required .. " card"
			task.delay(1.5, function() prompt.ActionText = "Swipe card" end)
			return
		end
		busy = true
		prompt.Enabled = false
		TweenService:Create(door, info, { CFrame = openCFrame }):Play()
		task.wait(openTime)
		local closing = TweenService:Create(door, info, { CFrame = closedCFrame })
		closing:Play()
		closing.Completed:Wait()
		busy = false
		prompt.Enabled = true
	end)
end

local function setupGiver(part: Instance)
	if not part:IsA("BasePart") then return end
	local color = part:GetAttribute("CardColor") or "Red"
	local template = ServerStorage:WaitForChild("Keycards"):FindFirstChild(color .. "Keycard")
	if not template then
		warn("No keycard template for", color)
		return
	end
	local prompt = Instance.new("ProximityPrompt")
	prompt.ActionText = "Take " .. color .. " card"
	prompt.Parent = part
	prompt.Triggered:Connect(function(player)
		if carriesCard(player, color) or not closeEnough(player, part) then return end
		local backpack = player:FindFirstChildOfClass("Backpack")
		if backpack then
			template:Clone().Parent = backpack
		end
	end)
end

for _, m in CollectionService:GetTagged("KeycardDoor") do task.spawn(setupDoor, m) end
CollectionService:GetInstanceAddedSignal("KeycardDoor"):Connect(setupDoor)
for _, p in CollectionService:GetTagged("KeycardGiver") do task.spawn(setupGiver, p) end
CollectionService:GetInstanceAddedSignal("KeycardGiver"):Connect(setupGiver)
```

## How to test
1. Make a Tool `RedKeycard` with a small `Handle` part and attribute `CardColor = "Red"`; put it in `ServerStorage > Keycards`.
2. Build a door model tagged `KeycardDoor` (attribute `RequiredCard = "Red"`), and a giver part tagged `KeycardGiver` (`CardColor = "Red"`).
3. Play: the door prompt says "Needs Red card" when you try without it. Take the card, try again: the door slides up, waits 3 s, closes.
4. Spam the prompt while it is moving: nothing happens (`busy`).
5. Two-player test: player B without a card can walk through while the door is open. That is intended; for per-player gates see [[Gating Map Areas - Per-Player Barriers with Collision Groups and Local Parts]].

## Common mistakes
- **Checking the card in a LocalScript.** The client can say it has anything. The check must be on the server, reading the server's view of the Backpack and Character.
- **Only checking the Backpack.** An equipped tool lives in the **Character**, not the Backpack.
- **Card stays after death.** Tools in the Backpack are lost on respawn unless you also put a copy in `player.StarterGear`. Decide which you want; horror games usually want the loss.
- **Moving an unanchored door with TweenService.** Tween anchored parts; for physics doors use a HingeConstraint servo instead.
- Shared prompt text leaks to every player. Use [[Recipe - Notification Toasts from the Server]] for private "you need a card" messages.

## Related
[[Scripting - Hub]] · [[First Interaction with ProximityPrompt]] · [[Custom ProximityPrompt UI]] · [[Tool Security - Equip Checks, Server Cooldowns and Dropped Tools]]
