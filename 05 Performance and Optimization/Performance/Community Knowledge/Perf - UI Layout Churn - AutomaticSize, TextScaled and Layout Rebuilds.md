---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "UI Layout Churn - AutomaticSize, TextScaled and Layout Rebuilds"
tags: [roblox, community-knowledge, performance, ui, layout]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/TextLabel
  - https://create.roblox.com/docs/reference/engine/classes/GuiObject
  - https://create.roblox.com/docs/ui/size-modifiers
  - https://create.roblox.com/docs/reference/engine/classes/UIListLayout
---
# UI Layout Churn - AutomaticSize, TextScaled and Layout Rebuilds

Roblox UI is retained: you set properties and the engine works out where everything goes. That layout work is cheap when the UI is still and expensive when it keeps changing. Layout objects (UIListLayout, UIGridLayout, flex settings), `AutomaticSize`, `TextScaled` and size constraints all depend on their children and parents, so one changed label can force a whole column to be measured again. A HUD that rewrites a timer label inside an auto-sized, list-laid-out panel every frame is paying for a full relayout every frame. The existing UI performance note covers gradients and big lists; this note is about the layout system itself.

## What triggers relayout

Rough model (the exact engine internals are not documented, so treat this as practical guidance):
- **Adding, removing or reordering children** of a frame with a UIListLayout or UIGridLayout re-sorts and repositions all siblings.
- **Changing Size, Position or Visible** of a child inside a layout updates its siblings.
- **Changing Text** on a label with `AutomaticSize` or `TextScaled` re-measures the text, then resizes the label, then its parents if they are auto-sized too.
- **Changing AbsoluteSize upstream** (screen rotate, window resize, a parent auto-sizing) cascades down.

## Official guidance on text sizing

The TextLabel reference recommends avoiding `TextScaled` and using `AutomaticSize` with a fixed `TextSize` instead, and it specifically recommends **not using both on the same label**: AutomaticSize decides the available space and TextScaled then scales into it, which fights itself. Practical reading:
- Static titles: fixed TextSize, no TextScaled.
- Text that must fit a box on many screen sizes: TextScaled + `UITextSizeConstraint` with a MaxTextSize, and no AutomaticSize on that label.
- Variable-length content (chat, descriptions): AutomaticSize on the label or its container, fixed TextSize.

## Rules that save frames

1. **Throttle text updates.** Update a countdown label when the displayed value changes (once a second), not every Heartbeat. Compare before writing:
   ```lua
   local last = ""
   local function setTimer(label: TextLabel, seconds: number)
       local s = string.format("%d:%02d", seconds // 60, seconds % 60)
       if s ~= last then
           last = s
           label.Text = s
       end
   end
   ```
2. **Animate with UIScale or a wrapper.** Tweening `Size` of a child inside a UIListLayout repositions every sibling each frame. Put the animated element inside a fixed-size wrapper frame, or animate a `UIScale`, so the layout sees a constant size.
3. **Build lists detached.** Create all rows under an unparented container, then parent once. Each child insert into a live layout triggers a re-sort.
4. **Avoid deep auto-size chains.** A label inside an auto-sized frame inside an auto-sized frame inside a list means one text change can resize four levels. Fix sizes where the design allows.
5. **Hide whole panels, not pieces.** Set `Visible = false` (or `ScreenGui.Enabled = false`) on the closed panel; do not keep updating labels inside a hidden menu.
6. **Fixed-width numbers.** Use a monospaced font face or fixed label width for counters, so a value going from 99 to 100 does not resize its parent.

## Quick diagnosis

- Open the MicroProfiler and look for UI layout or text-related labels growing when a specific panel is open (see [[MicroProfiler Reading Guide]]).
- Toggle the panel's `Visible` and watch the frame time.
- Search your client code for `.Text =` inside RenderStepped/PreRender/Heartbeat handlers.

## Related
[[Performance - Hub]] - [[UI Performance - Gradients, Big Lists and Per-Frame Updates]] - [[Responsive UI Layouts - UIListLayout, UIGridLayout and Flex]] - [[MicroProfiler Reading Guide]]
