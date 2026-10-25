---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "ViewportFrame Cost - Item Previews Without Frame Drops"
tags: [roblox, community-knowledge, performance, ui, viewportframe, rendering]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/ui/viewport-frames
  - https://create.roblox.com/docs/reference/engine/classes/ViewportFrame
  - https://create.roblox.com/docs/reference/engine/classes/WorldModel
---
# ViewportFrame Cost - Item Previews Without Frame Drops

ViewportFrames render 3D objects inside 2D UI: spinning pets in a shop, weapon icons in an inventory, a character preview on the customise screen, a minimap. Each one is a small extra 3D render inside your UI, with its own camera and its own set of meshes and textures held in memory. An inventory grid with 60 live ViewportFrames, each holding a full-detail model and rotating every frame, is a classic "the menu lags more than the game" bug. This note is how to keep them cheap.

## How a ViewportFrame works (official)

- You parent models into the ViewportFrame and assign its `CurrentCamera` to a Camera you create.
- Lighting is simplified: `Ambient`, `LightColor` and `LightDirection` on the frame, plus an optional `Sky` child used only as a reflection cubemap. Scene lights do not apply.
- To animate the view, the docs say to **update the camera, not the objects**. Moving the camera around a still model is the intended cheap path.
- For physics or animated rigs inside the frame, the models must be inside a `WorldModel` child of the ViewportFrame.

## Cost rules

1. **Static icons should be images.** If the preview never rotates, render it once and use an ImageLabel with a pre-made icon (exported from Studio or Blender). Zero 3D cost at runtime.
2. **Only animate what is visible.** In a ScrollingFrame, only spin the selected or hovered item. Others stay still.
3. **Use low-detail copies.** Inventory icons are 80-150 pixels wide; a 40k-triangle model with 1024 px SurfaceAppearance maps is wasted there. Keep a simplified "Icon" model per item (low-poly mesh, small textures) and clone that into the frame instead of the full model.
4. **Create on open, destroy on close.** Build the grid when the menu opens and `Destroy()` the contents when it closes; do not keep 60 ViewportFrames alive behind a hidden menu.
5. **Avoid WorldModel unless needed.** A WorldModel enables physics and animation inside the frame. A rotating static model does not need it.
6. **Limit live count.** A handful of live previews on screen is fine. Dozens at once is where phones start dropping frames (exact limits are not published; profile on your lowest device).

## Pattern: camera orbit on one preview

```lua
local RunService = game:GetService("RunService")

local function orbitPreview(vpf: ViewportFrame, model: Model)
    local cam = Instance.new("Camera")
    vpf.CurrentCamera = cam
    cam.Parent = vpf
    model.Parent = vpf

    local cf, size = model:GetBoundingBox()
    local dist = size.Magnitude * 0.9
    local angle = 0
    return RunService.PreRender:Connect(function(dt)
        angle += dt * 0.8
        local offset = CFrame.Angles(0, angle, 0) * Vector3.new(0, size.Y * 0.2, dist)
        cam.CFrame = CFrame.lookAt(cf.Position + offset, cf.Position)
    end)
end

-- Only the hovered slot gets a live orbit; disconnect on leave
```

Keep the returned connection and disconnect it when the slot loses hover or the menu closes.

## Pattern: grid of still previews

For a grid, set each camera once (no per-frame loop). Place the camera at a fixed three-quarter angle using the bounding box, then never touch it again. This turns the grid into a mostly static UI; only the selected slot needs a live loop.

## Checklist

- [ ] Static icons are ImageLabels, not ViewportFrames.
- [ ] At most one or two previews update per frame.
- [ ] Preview models are simplified copies.
- [ ] Menu close destroys previews and disconnects loops.
- [ ] No WorldModel unless the preview is animated or simulated.

## Related
[[Performance - Hub]] - [[UI Performance - Gradients, Big Lists and Per-Frame Updates]] - [[Texture Memory and Triangle Budgets for Roblox Scenes]] - [[Level of Detail on Roblox - RenderFidelity, SLIM and Hand-Made LODs]]
