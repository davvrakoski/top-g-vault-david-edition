---
area: "05 Performance and Optimization"
cluster: "Performance"
title: "Transparency Overdraw - Glass, Foliage Cards and DoubleSided Meshes"
tags: [roblox, community-knowledge, performance, rendering, transparency, gpu]
cssclasses: [tg-a05]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/performance-optimization/design
  - https://create.roblox.com/docs/performance-optimization/improve
  - https://create.roblox.com/docs/tutorials/curriculums/environmental-art/optimize-your-experience
  - https://create.roblox.com/docs/reference/engine/classes/MeshPart
---
# Transparency Overdraw - Glass, Foliage Cards and DoubleSided Meshes

Opaque surfaces are cheap for the GPU: the nearest one wins and everything behind it is skipped. Semi-transparent surfaces break that shortcut. Every layer of glass, smoke, leaf card or window between the camera and the background has to be shaded and blended, so the same screen pixel is painted many times. Roblox's environmental-art curriculum calls this **high transparency overdraw** and uses a planter of layered leaves as the example: hundreds of thousands of extra pixels from one view. On phones, which are usually fill-rate limited, this is one of the quickest ways to lose frames without adding a single triangle.

## Official rules

- **Use Transparency 0 or 1.** The "Design for performance" guide says to avoid values in between where you can. A fully transparent part (1) is not drawn; a 0.5 part is drawn and blended.
- **Avoid stacked transparent layers.** Review places where the camera looks through several transparent things in a row: hedges, rows of glass panels, layered smoke, fog cards.
- The "Improve performance" guide lists high transparency overdraw as a rendering problem and points to the same fix: delete or reduce layered transparencies.

## Common offenders and fixes

| Offender | Why it hurts | Fix |
|---|---|---|
| Hedges built from many leaf-card meshes | Many overlapping alpha layers | Fewer, larger cards; solid inner core mesh; leaves only on the outer shell |
| Shop fronts with glass in front of glass | Two or more blended layers per pixel | One glass layer; interior wall behind it opaque |
| Transparency 0.9 "invisible" hitboxes | Still rendered and blended | Transparency 1 (still collides and queries) |
| Smoke and dust ParticleEmitters, large particles | Each particle is a transparent quad | Fewer, smaller particles; lower Rate on low tiers (see [[VFX Performance, LOD and Pooling]]) |
| Beams stacked for god rays | Wide transparent ribbons | One beam, or fewer segments |
| Water + glass + fog cards in one view | Layers multiply | Remove the least visible layer |

## DoubleSided meshes

`MeshPart.DoubleSided` renders both faces of every polygon. The API reference describes it as useful for "card" meshes such as leaves, hair or cloth. Costs to keep in mind:
- Backfaces are no longer culled, so the GPU shades roughly twice the faces for that mesh.
- Combined with alpha (SurfaceAppearance `AlphaMode` Transparency) it doubles the overdrawn layers too.

Rules of thumb:
1. Only enable DoubleSided on thin cards that must be seen from both sides.
2. For closed meshes (crates, rocks, bodies), keep it off and fix inverted normals in Blender instead.
3. For hair and leaves seen mostly from one side, consider modeling a backface instead of DoubleSided, then compare in the MicroProfiler.

## SurfaceAppearance AlphaMode

`SurfaceAppearance.AlphaMode` has four values: `Overlay`, `Transparency`, `TintMask` and `Opaque`. Only `Transparency` uses the ColorMap alpha to make the surface see-through, so that is the mode that adds overdraw. `Opaque` ignores the alpha channel entirely. If an asset was exported with an alpha channel it does not need (common with texture packs), set `Opaque` or `Overlay` rather than `Transparency`. Details in [[SurfaceAppearance AlphaMode and TintMask - Recolorable Assets]]. The relative GPU cost of each mode is not published (unverified), so profile on a phone.

## How to find overdraw

1. Stand where the frame rate drops and look at the scene: count how many transparent layers your eye passes through.
2. Temporarily set suspects to Transparency 0 or 1 with a command-bar script and compare FPS.
3. In the MicroProfiler on device, large GPU wait time with low triangle counts often points to fill rate (see [[Mobile Performance Deep Dive]]).

```lua
-- Command bar: list parts with partial transparency in a folder
for _, d in workspace.Map:GetDescendants() do
    if d:IsA("BasePart") and d.Transparency > 0 and d.Transparency < 1 then
        print(d:GetFullName(), d.Transparency)
    end
end
```

## Related
[[Performance - Hub]] - [[Mobile Performance Deep Dive]] - [[VFX Performance, LOD and Pooling]] - [[Draw Calls and Mesh Instancing - Official Rules vs Forum Lore]]
