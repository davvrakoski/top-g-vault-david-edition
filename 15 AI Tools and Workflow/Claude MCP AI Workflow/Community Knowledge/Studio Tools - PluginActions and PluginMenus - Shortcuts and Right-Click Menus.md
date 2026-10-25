---
area: "15 AI Tools and Workflow"
cluster: "Claude MCP AI Workflow"
title: "Studio Tools - PluginActions and PluginMenus - Shortcuts and Right-Click Menus"
tags: [roblox, community-knowledge, studio, plugins, shortcuts, menus]
cssclasses: [tg-a15]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/PluginAction
  - https://create.roblox.com/docs/reference/engine/classes/PluginMenu
  - https://create.roblox.com/docs/reference/engine/classes/Plugin#CreatePluginAction
  - https://create.roblox.com/docs/reference/engine/classes/Plugin#CreatePluginMenu
---
# Studio Tools - PluginActions and PluginMenus - Shortcuts and Right-Click Menus

Builders work with one hand on the mouse and one on the keyboard. A plugin that can only be used by clicking a toolbar button breaks that flow. **PluginActions** let users bind your commands to their own keyboard shortcuts in Studio's shortcut settings. **PluginMenus** give you native right-click style menus at the cursor. Together they make a plugin feel built in.

## PluginAction: a command with no button

```lua
-- CreatePluginAction(actionId, text, statusTip, iconName, allowBinding = true)
local dropToFloor = plugin:CreatePluginAction(
	"TopG_DropToFloor",
	"Drop Selection to Floor",
	"Moves each selected part straight down until it rests on something",
	"",
	true
)
dropToFloor.Triggered:Connect(function()
	-- do the work inside a ChangeHistoryService recording
end)
```

- Once created, the action appears in Studio's **File > Customize Shortcuts** window under your plugin, where the user picks a key. Plugins **cannot** assign a default key themselves; the user does (as far as the API shows).
- `allowBinding = false` hides the action from the shortcut list. Use this for actions that only make sense inside a menu.
- `actionId` must be unique and **stable**. Changing it loses the user's key binding.
- Properties: `ActionId`, `Text`, `StatusTip`, `AllowBinding`. Event: `Triggered`.

Good candidates: "drop to floor", "random rotate Y", "replace selection with prefab", "toggle my panel". Write the action name as a verb phrase, so it is easy to find in the shortcut search.

## PluginMenu: a context menu at the mouse

```lua
local menu = plugin:CreatePluginMenu("TopG_PropMenu", "Props", "")
menu:AddNewAction("swap", "Swap with next prop", "")
menu:AddNewAction("rot", "Random rotation", "")
menu:AddSeparator()

local sub = plugin:CreatePluginMenu("TopG_PropMenu_Mat", "Material", "")
sub:AddNewAction("wood", "Wood", "")
sub:AddNewAction("metal", "Metal", "")
menu:AddMenu(sub)

local picked = menu:ShowAsync() -- yields until a choice or close
if picked then
	print("Chosen:", picked.ActionId) -- check the ID format printed here once
end
```

Members:

- `AddAction(action)`: add an existing PluginAction (it keeps its key binding).
- `AddNewAction(id, text, icon)`: make a temporary action that is **hidden from the shortcut list**.
- `AddMenu(menu)`: nest a submenu. The submenu's `Title` and `Icon` are its label.
- `AddSeparator()`, `Clear()`.
- `ShowAsync()`: shows the menu at the mouse and **yields** until the user chooses (returns the PluginAction) or closes it (returns `nil`). The chosen action's `Triggered` also fires.

The ID of an action made with `AddNewAction` may be returned with a plugin prefix added. Print it once and match it with `string.find` rather than exact equality (unverified, but cheap insurance).

## When to show a menu

- Right-click on a row in your own dock panel (`MouseButton2Click` on a `TextButton`).
- After a viewport click in your activated tool (see [[Studio Tools - Viewport Tools with plugin GetMouse and Activate]]), for "what should I place here?".
- Never pop a menu up without the user doing something first.

## Pitfalls

- Create actions and menus **once** at start-up, not on every click. Each `CreatePluginAction` with the same ID while the plugin is already running may error or duplicate.
- `ShowAsync` yields. Don't call it inside a function that must return immediately, like a ChangeHistoryService recording that is already open.
- Keep the shortcut list clean. Ten bindable actions is helpful; fifty is noise.

## Related

[[Claude MCP AI Workflow - Hub]] · [[Studio Keyboard Shortcuts Cheat Sheet]] · [[Studio Tools - Your First Plugin - Toolbar Button, PluginDebugService and Save and Reload]] · [[Studio Tools - Undo-Safe Plugins with ChangeHistoryService Recordings]]
