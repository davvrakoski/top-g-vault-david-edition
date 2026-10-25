---
title: "Create player tools"
description: "The process for creating and customizing Tools that players can equip and use."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/use-case-tutorials/scripting/intermediate-scripting/create-player-tools"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*The process for creating and customizing Tools that players can equip and use.*

Tools are a simple way to manage items that the player can hold in their hand and use in-game. They can range from weapons such as swords to food items.

In this tutorial, you'll learn how to create a tool in the shape of a laser blaster that will play sound effects when equipped or activated.

*(image in the full Top G Vault)*

## Create the tool

The [[30 Official Roblox Docs/API Reference/Classes/Tool|Tool]] object is the basis of any tool in Roblox, so you'll need to create one. It's easier to change how tools look by adding objects such as Parts and MeshParts to the tool in the workspace where they are visible.

1. Insert a **Tool** into the workspace and name it **Blaster**.

   *(image in the full Top G Vault)*

2. Insert a [[30 Official Roblox Docs/API Reference/Classes/MeshPart|MeshPart]] into the tool.

   *(image in the full Top G Vault)*

3. Set the **MeshId** property to `rbxassetid://92656610`.
4. Set the **TextureId** property to `rbxassetid://92658105`.

   *(image in the full Top G Vault)*
   *(image in the full Top G Vault)*

5. The tool needs a part named **Handle** for the player to hold. Change the name of the MeshPart to **Handle**.

   *(image in the full Top G Vault)*

> [!warning]
> If you don't include a part named **Handle** in the tool, it will drop to the ground when a player tries to equip it.

## Store the tool

Tools can be kept in the 3D world as **collectable tools** or given to all players as **starter tools**.

### Collectable tool

The blaster is currently a child of **Workspace** so it will be collectable. A player can pick up the tool by touching it, causing it to become a child of the character model; the tool will then be equipped and placed in their hotbar.

[Video: video-collection.mp4](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/tutorials/creating-player-tools/video-collection.mp4)

During gameplay, unequipped tools are stored within the player's hierarchy in the Backpack and then moved to their character model when equipped. Any tool that becomes a child of a character will be automatically equipped.

*(image in the full Top G Vault)*

*Tripmine Unequipped*

*(image in the full Top G Vault)*

*Tripmine Equipped*

### Starter tool

Storing a tool in [[30 Official Roblox Docs/API Reference/Classes/StarterPack|StarterPack]] will place it in a player's [[30 Official Roblox Docs/API Reference/Classes/Backpack|Backpack]] when they join or respawn.

1. Move the **Blaster** to **StarterPack** in the **Explorer**.

   *(image in the full Top G Vault)*

2. Play the game to test the tool. Click on the hotbar at the bottom of the screen or press **1** on the keyboard to equip the tool.

## Tool properties

### Position / orientation

A tool's position and orientation can be changed using the **grip** properties. **GripPos** changes the position of the grip, whereas **GripForward**, **GripRight** and **GripUp** affect the rotation.

Currently the player is holding the center of the blaster instead of the grip.

1. Set the **GripPos** property of the tool to **0, -0.4, 1.1**.

   *(image in the full Top G Vault)*

2. [[30 Official Roblox Docs/Studio/Studio testing modes#Playtesting|Initiate a playtest]] to test the tool. Notice how the tool is now being gripped in a different position.

   *(image in the full Top G Vault)*

   *Before*

   *(image in the full Top G Vault)*

   *After*

### Hotbar icon

By default, the tool **name** will be displayed on the hotbar icon. It's good practice to change the icon to be an image of the tool. Set the **TextureId** property of the tool to `rbxassetid://92628145`.

*(image in the full Top G Vault)*

*Before*

*(image in the full Top G Vault)*

*After*

### Tooltip

A **tooltip** is a small text description that appears when the mouse hovers over a tool in the hotbar. They typically include the name of the tool and/or a brief description of its function. Change the **ToolTip** property to **Blaster**.

*(image in the full Top G Vault)*

## Use scripts with tools

A tool has three key events you can connect to: [[30 Official Roblox Docs/API Reference/Classes/Tool#Equipped|Equipped]], [[30 Official Roblox Docs/API Reference/Classes/Tool#Unequipped|Unequipped]] and [[30 Official Roblox Docs/API Reference/Classes/Tool#Activated|Activated]].

| Event | Description |
| --- | --- |
| **[[30 Official Roblox Docs/API Reference/Classes/Tool#Equipped\|Equipped]]** | Fired when a tool is equipped by the player, for example  when a tool is selected in the hotbar. |
| **[[30 Official Roblox Docs/API Reference/Classes/Tool#Unequipped\|Unequipped]]** | Fired when a tool is unequipped by the player, for example when a tool is deselected in the hotbar. |
| **[[30 Official Roblox Docs/API Reference/Classes/Tool#Activated\|Activated]]** | Fired when a tool is activated by the player, for example when a player left-clicks. |

These methods only work in [[30 Official Roblox Docs/API Reference/Classes/LocalScript|LocalScripts]] because only the player's device knows when input happens, such as a mouse button being clicked or a screen being touched.

## Add the sounds

To see these events in action, you can play a sound when they fire. First, you'll need to create Sound objects to use for this.

1. Insert two [[30 Official Roblox Docs/API Reference/Classes/Sound|Sound]] objects into the **Handle**.

2. Rename one sound **Equip** and set its SoundId property to `rbxassetid://282906960`.

3. Rename the other sound **Activate** and set its SoundId property to `rbxassetid://130113322`.

   *(image in the full Top G Vault)*

## Add the code

The example code below plays the **Equip** sound when the tool is equipped and the **Fire** sound when activated.

1. Insert a **LocalScript** into the tool and name it **ToolController**.

   *(image in the full Top G Vault)*

2. Insert the following lines of code into the script.

   ```lua
   local tool = script.Parent

   local function toolEquipped()
   	tool.Handle.Equip:Play()
   end

   local function toolActivated()
   	tool.Handle.Activate:Play()
   end

   tool.Equipped:Connect(toolEquipped)
   tool.Activated:Connect(toolActivated)
   ```

3. Test the blaster sound effects by equipping and clicking to activate the tool.

Now you know how to create and script a basic tool, try creating other simple tools such as a flashlight or speaker.

---
*Source: [Create player tools](https://create.roblox.com/docs/tutorials/use-case-tutorials/scripting/intermediate-scripting/create-player-tools) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
