---
title: "In-game tools"
description: "Create in-game tools for your players."
area: "30 Official Roblox Docs"
cluster: "Players"
source: "https://create.roblox.com/docs/players/tools"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Create in-game tools for your players.*

In-game [[30 Official Roblox Docs/API Reference/Classes/Tool|Tools]] are interactive tools that players can equip in sessions, such as weapons, magic wands, flashlights, keys, and more. You can design tools and include them in a player's inventory or place them around the world as pickups.

## Create an in-game tool

The [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] object is the basis of any tool in Roblox, so you'll need to create one. It's easier to preview how a tool looks by designing it in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], and later you can make it an [[30 Official Roblox Docs/Players/In-game tools#Player inventory|inventory]] item or an [[30 Official Roblox Docs/Players/In-game tools#Earned/purchased tool|earned/purchased]] item.

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy, hover over [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]], click the **⊕** button, and insert a [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]].

   *(image in the full Top G Vault)*

2. With the new [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] selected, access the [[30 Official Roblox Docs/Studio/Properties window|Properties]] window and customize how the tool will appear in the player's inventory:

   - [[30 Official Roblox Docs/API Reference/Classes/BackpackItem#TextureId|TextureId]] — Specifies the image asset ID for the tool in a player's inventory.
   - [[30 Official Roblox Docs/API Reference/Classes/Tool#ToolTip|ToolTip]] — The on-hover tooltip name for the tool in a player's inventory.

   *(image in the full Top G Vault)*

3. Decide whether the tool will be a [[30 Official Roblox Docs/Players/In-game tools#Physical tool|physical tool in the 3D environment]] (most common) or a [[30 Official Roblox Docs/Players/In-game tools#Non-physical tool|non‑physical]] tool that simply occupies a player's inventory and responds to their input.

### Physical tool

After creating the [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] instance for a physical tool, you'll need to [[30 Official Roblox Docs/Players/In-game tools#Add parts/meshes|add parts/meshes]] to compose its appearance in the 3D world. You'll also need to include a [[30 Official Roblox Docs/Players/In-game tools#Set the handle|handle]] which player characters [[30 Official Roblox Docs/Players/In-game tools#Adjust the grip position/orientation|grip]].

#### Add parts/meshes

In-game tools can consist of one or more [[30 Official Roblox Docs/API Reference/Classes/Part|Parts]] and/or [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshParts]]. If you construct the tool of multiple pieces, remember to connect them all together using [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraints]] or other [[30 Official Roblox Docs/Physics/Mechanical constraints|mechanical constraints]] so that the tool stays intact as a unit while the player carries it around.

*(image in the full Top G Vault)*

> [!warning]
> When constructing tools, make sure that no parts are [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]]. If you anchor the tool in 3D space, player characters will get stuck in place when they pick up or equip the tool.
>
> If you want to place collectible tools as pickups around the 3D world and anchor them in specific places, such as floating slightly above the ground, you can anchor them but you'll need to add a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] to each tool which unanchors its parts upon collection. See [[30 Official Roblox Docs/Players/In-game tools#Collectible tool|collectible tools]] for details.

#### Set the handle

To enable players to carry tools around, one part of the tool needs to be named `Handle`. This is where the tool will attach to the character model's `RightHand` [[30 Official Roblox Docs/Avatar/Character Bodies/Character body specifications#Body parts|body part]] (R15) or

`Right Arm`

 part (R6).

If the tool is composed of just one [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]], simply name that part `Handle`. Otherwise, you can include a separate part named `Handle` as a **direct child** of the parent [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] and then attach it to another part with a [[30 Official Roblox Docs/API Reference/Classes/WeldConstraint|WeldConstraint]] or [[30 Official Roblox Docs/Physics/Mechanical constraints|mechanical constraint]].

The following example shows a tool with three instances: the `Handle` mesh, a [[30 Official Roblox Docs/API Reference/Classes/RopeConstraint|RopeConstraint]], and a lantern mesh which hangs from the rope.

*(image in the full Top G Vault)*

> [!warning]
> Make sure to include only **one** part named `Handle`. If you include multiple parts named `Handle`, one will be randomly chosen as the attachment point for the character's hand, potentially causing issues such as the character holding a sword's blade instead of its hilt.

#### Adjust the grip position/orientation

The tool's [[30 Official Roblox Docs/API Reference/Classes/Tool#Grip|Grip]] property is a [[30 Official Roblox Docs/API Reference/Datatypes/CFrame|CFrame]] which specifies how the tool is positioned and oriented relative to the character holding it.

*(image in the full Top G Vault)*

Since the ideal grip position/orientation is different for every tool, you'll need to experiment with the values until your tool's grip looks correct. The following example shows possible incorrect and correct [[30 Official Roblox Docs/API Reference/Classes/Tool#Grip|Grip]] settings for the hanging lantern:

*(image in the full Top G Vault)*

*Lantern dragging on ground with [[30 Official Roblox Docs/API Reference/Classes/Tool#Grip|Grip.Position]] of `(0, -2, 0)` and [[30 Official Roblox Docs/API Reference/Classes/Tool#Grip|Grip.Orientation]] of `(-90, 0, 0)`*

*(image in the full Top G Vault)*

*Lantern in front of character with [[30 Official Roblox Docs/API Reference/Classes/Tool#Grip|Grip.Position]] of `(0, -1.5, 0)` and [[30 Official Roblox Docs/API Reference/Classes/Tool#Grip|Grip.Orientation]] of `(25, 0, 0)`*

### Non-physical tool

A non-physical [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] simply occupies a player's [[30 Official Roblox Docs/Players/In-game tools#Player inventory|inventory]] and responds to their input. For example, a roleplaying game might feature a series of magical spells that players can "cast" through their inventory.

*(image in the full Top G Vault)*

Non-physical tools don't require any 3D composition and do not utilize a `Handle` part, so you should **disable** the tool's [[30 Official Roblox Docs/API Reference/Classes/Tool#RequiresHandle|RequiresHandle]] property:

*(image in the full Top G Vault)*

## Add tools to a game

Once you finish [[30 Official Roblox Docs/Players/In-game tools#Create an in-game tool|creating]] your in-game tool, you'll need to place it in the correct area of the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] hierarchy. Where you place the tool in the hierarchy depends on its intended usage.

### Player inventory

If you want all players to start out with a tool in their inventory, put it inside the [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]] container. When any player spawns, the system copies the tool to their [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]]. From there, the player can equip the tool by clicking its inventory icon or by pressing the associated hotkey such as <kbd>1</kbd> or <kbd>2</kbd>.

*(image in the full Top G Vault)*

Note that tools are copied to the player's inventory ([[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]]) in the order they were added to [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]]. For a more controlled ordering, you can add a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] to [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]] which temporarily moves the tools to [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]] then re‑parents them to [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] in the order specified in the `order` table.

```lua title="Reorder Inventory"
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local order = {"WaterSpell", "FireSpell", "AirSpell", "EarthSpell"}
local backpack = script.Parent

for _, item in backpack:GetChildren() do
	if item:IsA("Tool") then
		item.Parent = ReplicatedStorage
	end
end

-- Re-parent tools to backpack in the specified order
for i = 1, #order do
	local tool = ReplicatedStorage:FindFirstChild(order[i])
	if tool then
		tool.Parent = backpack
	end
end
```

> [!info]
> As noted above, tools placed in [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]] clone to **all** players. To more specifically control which tools clone to which players, see [[30 Official Roblox Docs/API Reference/Classes/StarterGear|StarterGear]].

### Collectible tool

If you want to allow players to collect physical tools as they explore the 3D world, place the tools in the [[30 Official Roblox Docs/API Reference/Classes/Workspace|Workspace]] just like normal 3D objects. Collected tools will be automatically equipped and added to the player's inventory (you do not need to add extra collision detection for characters to grab the tool).

As noted in the [[30 Official Roblox Docs/Players/In-game tools#Add parts/meshes|add parts/meshes]] section, tool parts should not typically be [[30 Official Roblox Docs/API Reference/Classes/BasePart#Anchored|Anchored]], since player characters will get stuck in place when they pick up or equip an anchored tool. However, if you want to anchor a collectible tool to a specific place in the 3D world, such as floating slightly above the ground, you can add the following [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] to the tool to unanchor its parts upon collection.

```lua title="Unanchor Tool on Equip/Collect"
local tool = script.Parent

tool.Equipped:Connect(function()
	for _, part in tool:GetDescendants() do
		if part:IsA("BasePart") and part.Anchored then
			part.Anchored = false
		end
	end
end)
```

### Earned/purchased tool

If you want to set tools as awards for when players accomplish tasks, or offer tools for sale in an in‑game store, put those tools inside [[30 Official Roblox Docs/API Reference/Classes/ReplicatedStorage|ReplicatedStorage]]. From there, you can [[30 Official Roblox Docs/API Reference/Classes/Instance#Clone|Clone()]] a tool to the player's [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] at the proper time.

*(image in the full Top G Vault)*

```lua title="Clone Tool to Player's Inventory"
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Create a clone of the tool
local tool = ReplicatedStorage:FindFirstChild("WaterSpell")
if tool then
	local clone = tool:Clone()
	clone.Parent = backpack  -- Adds clone to the player's backpack
end
```

## Implement tool effects

After [[30 Official Roblox Docs/Players/In-game tools#Add tools to a game|adding tools to your game]], you can implement scripts to enable players to use their tools and perform the desired actions. The following tool‑specific events indicate the state of the tool and the player's input with it.

- [[30 Official Roblox Docs/API Reference/Classes/Tool#Equipped|Equipped()]] — Fires when the player selects the tool from their backpack.
- [[30 Official Roblox Docs/API Reference/Classes/Tool#Unequipped|Unequipped()]] — Fires when the player switches tools or drops the tool.
- [[30 Official Roblox Docs/API Reference/Classes/Tool#Activated|Activated()]] — Fires when the player starts activating the tool (clicks, taps, or presses the back‑right trigger on a gamepad).
- [[30 Official Roblox Docs/API Reference/Classes/Tool#Deactivated|Deactivated()]] — Fires when the player stops the activation input (releases the button or touch).

```lua title="Tool Events Template"
local tool = script.Parent

local function onEquip()
	print(tool.Name, "tool equipped")
end
local function onUnequip()
	print(tool.Name, "tool unequipped")
end
local function onActivate()
	print(tool.Name, "tool activated")
end
local function onDeactivate()
	print(tool.Name, "tool deactivated")
end

tool.Equipped:Connect(onEquip)
tool.Unequipped:Connect(onUnequip)
tool.Activated:Connect(onActivate)
tool.Deactivated:Connect(onDeactivate)
```

Tool events only fire in client‑side [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] because only the player's device knows when [[30 Official Roblox Docs/Input/Input|input]] happens. As a result, most tools require both a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] and a server‑side [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] where each handles certain aspects of the tool's behavior and a [[30 Official Roblox Docs/API Reference/Classes/RemoteEvent|RemoteEvent]] passes information from the client to the server (see [[30 Official Roblox Docs/Scripting/Events/Remote events and callbacks|remote events and callbacks]] for more information).

As follows are example tools and their behaviors managed by either a [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScript]] or a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]]:

| Tool | [[30 Official Roblox Docs/API Reference/Classes/LocalScript\|LocalScript]] | [[30 Official Roblox Docs/API Reference/Classes/Script\|Script]] |
| --- | --- | --- |
| **Creator's Wand** | Detects where the player activates the tool ([[30 Official Roblox Docs/API Reference/Classes/Tool#Activated\|Activated()]]). | Creates a new part at the location within the 3D world where the player touched or clicked. |
| **Invisibility Cloak** | Detects when the player equips the tool ([[30 Official Roblox Docs/API Reference/Classes/Tool#Equipped\|Equipped()]]) or unequips the tool ([[30 Official Roblox Docs/API Reference/Classes/Tool#Unequipped\|Unequipped()]]). | Makes the player invisible to all other players while the cloak is equipped and restores the player to full visibility when the cloak is unequipped. |
| **Mega‑Bow** | Detects how long the player activates the tool (time between [[30 Official Roblox Docs/API Reference/Classes/Tool#Activated\|Activated()]] and [[30 Official Roblox Docs/API Reference/Classes/Tool#Deactivated\|Deactivated()]]). | Shoots a magical arrow with greater or lesser power, depending on the detected activation time. |

---
*Source: [In-game tools](https://create.roblox.com/docs/players/tools) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
