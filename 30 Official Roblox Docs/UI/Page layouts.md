---
title: "Page layouts"
description: "Explore how page layouts organize interface content into distinct pages."
area: "30 Official Roblox Docs"
cluster: "UI"
source: "https://create.roblox.com/docs/ui/page-layouts"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explore how page layouts organize interface content into distinct pages.*

When you parent a [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout|UIPageLayout]] to a UI container, every sibling [[30 Official Roblox Docs/API Reference/Classes/GuiObject|GuiObject]] becomes a unique page that you can transition to through scripting. This layout is useful when you want to create user interfaces such as tabbed modals, tutorials, or character customization screens.

*(image in the full Top G Vault)*

After you create multiple pages within the [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout|UIPageLayout]], you need to use scripting to transition from page to page. For example, the following code, pasted into a client‑side sibling [[30 Official Roblox Docs/API Reference/Classes/Script|Script]] of the layout, transitions forward and then backward between the pages every two seconds.

```lua
local frame = script.Parent

local pageLayout = frame:FindFirstChildWhichIsA("UIPageLayout")

task.wait(2)
pageLayout:Next()

task.wait(2)
pageLayout:Next()

task.wait(2)
pageLayout:Previous()

task.wait(2)
pageLayout:Previous()
```

If you want to view pages while editing in Studio, you can use the [[30 Official Roblox Docs/Studio/Studio interface#Command Bar|Command Bar]] to navigate from one page to another, letting you review where you need to make changes without having to play your game each time.

1. In the [[30 Official Roblox Docs/Studio/Explorer window|Explorer]] window hierarchy, select the [[30 Official Roblox Docs/API Reference/Classes/UIPageLayout|UIPageLayout]] object.

   *(image in the full Top G Vault)*

2. Open the [[30 Official Roblox Docs/Studio/Studio interface#Command Bar|Command Bar]].
3. Input any of the following commands and press <kbd>Enter</kbd>.

   | Action | Command |
   | --- | --- |
   | **Next Page** | `game:GetService("Selection"):Get()[1]:Next()` |
   | **Previous Page** | `game:GetService("Selection"):Get()[1]:Previous()` |
   | **First Page** | `game:GetService("Selection"):Get()[1]:JumpToIndex(0)` |

---
*Source: [Page layouts](https://create.roblox.com/docs/ui/page-layouts) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
