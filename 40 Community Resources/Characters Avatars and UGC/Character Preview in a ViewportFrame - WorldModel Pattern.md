---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/viewport-character-preview"
title: "Character Preview in a ViewportFrame - WorldModel Pattern"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", ui, viewportframe, luau]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/reference/engine/classes/WorldModel
  - https://create.roblox.com/docs/reference/engine/classes/ViewportFrame
  - https://devforum.roblox.com/t/players-character-in-viewport/1861069
  - https://devforum.roblox.com/t/avatar-catalog-try-on-engine-wishlist-aes-commerce-outfits-thumbnails-ownership/4739855
---
# Character Preview in a ViewportFrame - WorldModel Pattern

Every customization screen needs a spinning, animated preview of the character. The building blocks:

- A `ViewportFrame` renders its children with its own `Camera` (set `CurrentCamera`).
- A `WorldModel` inside the ViewportFrame lets parts be **animated** and raycast; without it, a rig in a viewport stays frozen. Parts are not physically simulated there.
- The docs advise creating WorldModels only while they are shown and deleting unused ones.

## Getting a rig into the viewport

| Source | How |
| --- | --- |
| The player's own current look | Clone the character on the client. Characters are not archivable by default, so set `character.Archivable = true` before `Clone()`. |
| A try-on outfit | Have the server build it (`CreateHumanoidModelFromDescriptionAsync`) and hand it to that client, or re-dress one preview rig on the server and replicate it to that player only. Test which is faster in your game. |
| A static mannequin | A rig saved in ReplicatedStorage; cheapest. |

A DevForum thread (topic 1861069) is a good warning: a server script applied descriptions to a shared NPC, so every player saw the last joiner's avatar. Previews are per player; keep them on that player's client.

## Original client example

```lua
-- LocalScript under a ScreenGui that has a ViewportFrame named "Preview"
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local viewport = script.Parent:WaitForChild("Preview") :: ViewportFrame

local worldModel = Instance.new("WorldModel")
worldModel.Parent = viewport

local camera = Instance.new("Camera")
camera.FieldOfView = 30
camera.Parent = viewport
viewport.CurrentCamera = camera

local function showRig(rig: Model)
	worldModel:ClearAllChildren()
	rig:PivotTo(CFrame.new())
	rig.Parent = worldModel

	local humanoid = rig:FindFirstChildOfClass("Humanoid")
	local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
	if animator then
		local idle = Instance.new("Animation")
		idle.AnimationId = "rbxassetid://0" -- your idle animation ID
		animator:LoadAnimation(idle):Play()
	end
end

local function cloneOwnCharacter(): Model?
	local character = player.Character
	if not character then return nil end
	character.Archivable = true
	local copy = character:Clone()
	character.Archivable = false
	for _, item in copy:GetDescendants() do
		if item:IsA("BaseScript") then item:Destroy() end
	end
	return copy
end

local angle = 0
RunService.RenderStepped:Connect(function(dt)
	if not viewport.Visible then return end
	angle += dt * 0.6
	local offset = CFrame.Angles(0, angle, 0) * CFrame.new(0, 1.5, 9)
	camera.CFrame = CFrame.lookAt(offset.Position, Vector3.new(0, 1, 0))
end)

local rig = cloneOwnCharacter()
if rig then showRig(rig) end
```

## Tips

- Reuse one rig and re-dress it; rebuilding on every click is the cold-start cost the 2026 try-on wishlist complains about.
- Frame the camera from the rig's bounding box (`rig:GetBoundingBox()`) so tall Rthro and short Classic bodies both fit.
- Destroy the WorldModel when the menu closes.
- Viewports have no lighting from Workspace; set `viewport.Ambient` and `LightColor` for a good look.

## Credits

- Roblox Creator Docs: WorldModel and ViewportFrame references (CC BY 4.0). Code is original.
- DevForum topic 1861069 (shared preview NPC problem) and the 2026 try-on wishlist by stuckinthismood.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Character Customization UI Patterns - Slots, Outfits and Buy Flow]] · [[AvatarEditorService In-Game Editor - Build Order]] · [[Catalog and Try-On Games - Limits Developers Hit in 2026]] · [[Character Customization Blueprint]]

<!-- TDOD_GRAPH_END -->
