---
title: "Studio plugins"
description: "Explains how to create, publish, and monetize extensions to Studio that add custom functionality."
area: "30 Official Roblox Docs"
cluster: "Studio"
source: "https://create.roblox.com/docs/studio/plugins"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains how to create, publish, and monetize extensions to Studio that add custom functionality.*

A **plugin** is an extension that adds additional features or functionality to Studio. You can [[30 Official Roblox Docs/Production/Creator Store#Find assets|install]] community-made plugins from the Creator Store, or you can [[30 Official Roblox Docs/Studio/Studio plugins#Create new plugins|create]] and [[30 Official Roblox Docs/Studio/Studio plugins#Upload plugins|publish]] your own to the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) to use across your games.

If you choose to also distribute your plugins to the Creator Store, you can either offer them for free or sell them for **United States Dollars**. Roblox offers a market-leading revenue share for these sales, as only taxes and payment processing fees are deducted. For more information on selling plugins, see [[30 Official Roblox Docs/Production/Creator Store#Distribute and sell assets|Creator Store - Distribute and sell assets]].

## Create new plugins

You can create your own plugins to improve your workflow in Studio. The following code sample is a plugin called **AddEmptyScript** that inserts an empty [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] as the child of an [[30 Official Roblox Docs/API Reference/Classes/Instance|Instance]] or in [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]]. The following sections explain the major parts to creating this plugin.

To begin, you should enable **Plugin Debugging Enabled** in the **Studio** section of Studio's settings. This will expose the [[30 Official Roblox Docs/API Reference/Classes/PluginDebugService|PluginDebugService]] in Studio which provides real-time debugging for your plugin's code and makes it easier to reload and save your plugin.

```lua title="AddEmptyScript Plugin"
local ServerScriptService = game:GetService("ServerScriptService")
local Selection = game:GetService("Selection")

-- Create a new toolbar section and Plugins menu folder titled "Custom"
local toolbar = plugin:CreateToolbar("Custom")

-- Add a toolbar button labeled "Empty Script"
local newScriptButton = toolbar:CreateButton("Empty Script", "Create an empty script", "rbxassetid://14978048121")

-- Make button clickable even if 3D viewport is hidden
newScriptButton.ClickableWhenViewportHidden = true

local function onPluginButtonClicked()
	local selectedObjects = Selection:Get()
	local parent = selectedObjects[1] or ServerScriptService
	local newScript = Instance.new("Script")
	newScript.Source = ""
	newScript.Parent = parent
end

newScriptButton.Click:Connect(onPluginButtonClicked)
```

### Save plugin script

To create a plugin, first create a [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] and save it locally.

1. Insert a new [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] inside [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]] and rename it to `AddEmptyScript`.

   *(image in the full Top G Vault)*

2. Copy and paste the **AddEmptyScript Plugin** code above into the new script.
3. With the new script selected in the **Explorer** window, select **Save as Local Plugin** from Studio's **Plugins** menu.
4. In the popup window, click **Save** to insert the plugin script into your local **Plugins** folder of the Studio installation.
5. The plugin should appear in [[30 Official Roblox Docs/API Reference/Classes/PluginDebugService|PluginDebugService]] and start running.
6. **IMPORTANT** Delete the original script in [[30 Official Roblox Docs/API Reference/Classes/ServerStorage|ServerStorage]] and work from the `AddEmptyScript` plugin inside [[30 Official Roblox Docs/API Reference/Classes/PluginDebugService|PluginDebugService]], otherwise you may end up applying changes to the wrong script.

   *(image in the full Top G Vault)*

> [!info]
> To update a specific plugin within [[30 Official Roblox Docs/API Reference/Classes/PluginDebugService|PluginDebugService]], right‑click it and select **Save and Reload Plugin** from the context menu. If you simply want to reload the plugin, for example to step through a section of code using a breakpoint without saving the plugin, right‑click it and select **Reload Plugin**.
>
> At the broadest level, you can also update **all** plugins by right-clicking [[30 Official Roblox Docs/API Reference/Classes/PluginDebugService|PluginDebugService]] and selecting **Save and Reload All Plugins in Debugger** (shortcut <kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>L</kbd> or <kbd>⌘</kbd><kbd>Shift</kbd><kbd>L</kbd>).

### Add toolbar button

To add a button for your plugin to the **Plugins** tab of the Studio toolbar, use the [[30 Official Roblox Docs/API Reference/Classes/Plugin#CreateToolbar|Plugin:CreateToolbar()]] and [[30 Official Roblox Docs/API Reference/Classes/PluginToolbar#CreateButton|PluginToolbar:CreateButton()]] methods. In the code for `AddEmptyScript`, line 5 creates a new section in the toolbar and **Plugins** menu folder titled **Custom**, while line 8 creates a button labeled **Empty Script**.

*(image in the full Top G Vault)*

### Execute code on click

To make the plugin execute code when a user clicks the toolbar button, connect a function to the button's [[30 Official Roblox Docs/API Reference/Classes/PluginToolbarButton#Click|PluginToolbarButton.Click]] event. In the code for `AddEmptyScript`, the connecting function is `onPluginButtonClicked()`.

### Check user selection

To modify a plugin's behavior based on what the user has selected, use the [[30 Official Roblox Docs/API Reference/Classes/Selection|Selection]] service. The `onPluginButtonClicked()` function checks if the user has anything selected and creates the new script as its child instead of inside [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]]. If the user doesn't have anything selected, it creates the new script in [[30 Official Roblox Docs/API Reference/Classes/ServerScriptService|ServerScriptService]].

*(image in the full Top G Vault)*

### Support undo and redo

Use [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService|ChangeHistoryService]] to allow users to undo and redo changes made by a plugin within a game. In your script, set the plugin to call [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#TryBeginRecording|TryBeginRecording()]] and store the identifier assigned to the API call before making changes. Then set the plugin to call [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService#FinishRecording|FinishRecording()]] after making changes, so it captures any changes made during the recording session for undo and redo.

The following code sample creates an example plugin that can apply the neon material to selected parts. It uses [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService|ChangeHistoryService]] to record and manage the changes made by the plugin:

```lua title="Example Material Plugin with Recordings for Undo and Redo"
local ChangeHistoryService = game:GetService("ChangeHistoryService")
local Selection = game:GetService("Selection")

-- Create an example plugin
local toolbar = plugin:CreateToolbar("Example Plugin")
local button = toolbar:CreateButton("Neon it up", "", "")

-- Connect a function to the click event
button.Click:Connect(function()
	-- Try to begin a recording with a specific identifier
	local recording = ChangeHistoryService:TryBeginRecording("Set selection to neon")

	-- Check if recording was successfully initiated
	if not recording then
		-- This indicates that your plugin began a previous recording and never completed it
		-- You may only have one recording per plugin active at a time
		return
	end

	-- Iterate through the selected instances
	for _, instance in Selection:Get() do
		-- Check if the instance is a BasePart
		if instance:IsA("BasePart") then
			instance.Material = Enum.Material.Neon -- Set the material of the part to Neon
		end
	end

	-- Finish the recording, committing the changes to the history
	ChangeHistoryService:FinishRecording(recording, Enum.FinishRecordingOperation.Commit)
end)
```

> [!warning]
> Note the following caveats with [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService|ChangeHistoryService]] recordings:
> * If you're using the [[30 Official Roblox Docs/Studio/Studio interface#Command Bar|Multi-line Command Bar]], don't run any code in the command bar that will always be running while you have a place open, since the command bar uses [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService|ChangeHistoryService]] recordings to allow for undo/redo with commands that make changes to the [[30 Official Roblox Docs/API Reference/Classes/DataModel|DataModel]].
> * Reloading a plugin won't cancel its ongoing [[30 Official Roblox Docs/API Reference/Classes/ChangeHistoryService|ChangeHistoryService]] recordings, so make use of [[30 Official Roblox Docs/Scripting/Properties and attributes#Create attributes|attributes]] to store the last recording identifier so it can be canceled by the plugin when it reloads.

## Upload plugins

After you finish creating a plugin, you can upload it to your inventory so that it is accessible across all of your projects.

To upload a plugin:

1. In the **Explorer** window, select a plugin script.
1. Navigate to Studio's **Plugins** menu, then select **Publish as Plugin**.
1. **OPTIONAL** In the upper-left corner of the asset configuration window, click the default puzzle piece image to upload a 512×512 image thumbnail for your plugin.
1. Fill in the following fields:

   - **Name** — A title for your plugin.
   - **Description** — A description that describes what a potential user can expect the plugin to do.
   - **Creator** — The creator or group that you want to attribute as the creator of the plugin.

1. Click the **Submit** button. Your plugin is now available to you in the [Toolbox](https://github.com/Roblox/creator-docs/raw/main/content/en-us/assets/toolbox.md) under the **Inventory** and **Creations** tabs.

## Distribute and sell plugins

You can publicly distribute and sell your own plugins on the Creator Store for others to use within their own game development. This monetization method lets you earn 100% of net proceeds on transactions, bypassing platform fees and DevEx rates. For more information on this process, including how to set up a seller account to set prices and receive payouts, see [[30 Official Roblox Docs/Production/Creator Store#Distribute and sell assets|Creator Store - Distribute and sell assets]].

---
*Source: [Studio plugins](https://create.roblox.com/docs/studio/plugins) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
