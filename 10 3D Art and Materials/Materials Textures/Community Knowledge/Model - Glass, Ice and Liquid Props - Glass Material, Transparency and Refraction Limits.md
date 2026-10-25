---
area: "10 3D Art and Materials"
cluster: "Materials Textures"
title: "Glass, Ice and Liquid Props - Glass Material, Transparency and Refraction Limits"
tags: [roblox, community-knowledge, materials, glass, transparency, liquids]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/parts/materials
  - https://devforum.roblox.com/t/introducing-new-material-glass/64231/1
  - https://create.roblox.com/docs/reference/engine/classes/SurfaceAppearance
  - https://create.roblox.com/docs/reference/engine/classes/MeshPart
---
# Glass, Ice and Liquid Props - Glass Material, Transparency and Refraction Limits

Windows, bottles, potion flasks, fish tanks, ice blocks and crystal pickups all need "see-through" surfaces, and they are some of the most common art bugs in Roblox: windows that turn invisible, potions whose liquid disappears behind the glass, and frame-rate drops from stacked transparency. Roblox gives you three tools: the built-in **Glass** material, plain `Transparency` on any material, and `SurfaceAppearance` with an alpha channel. They behave differently, and one of them refracts. (Large water bodies are covered in [[Water, Shorelines and Foam — Practical Roblox Approach]].)

## Glass material facts

- `Material = Glass` on a Part or MeshPart uses `Transparency` in two ranges, per the original Roblox announcement: at 0 it is opaque, from 0 to 0.5 it becomes less opaque, and from 0.5 to 1 it fades until invisible.
- On higher graphics quality levels Glass **refracts** (bends and distorts what is behind it). The materials reference states that refraction is **not supported on mobile** due to computational cost, so design windows that still look fine without the distortion.
- The announcement also noted that **non-opaque objects are not visible through Glass** (a performance choice at the time). This is why a transparent liquid inside a Glass bottle can vanish. Treat this as a known limit and test it in your build (status may have changed; unverified for 2026).
- Community posts describe distortion tricks at extreme transparency values that depend on max graphics settings; do not rely on them for gameplay readability (unverified).

## Choosing the right approach

| Prop | Best approach | Why |
|---|---|---|
| House and shop windows | Glass material, Transparency about 0.5-0.8, tinted Color | Cheap, reflects sky, refracts on desktop |
| Bottles, flasks with liquid | Liquid as an **opaque** or Neon inner mesh; outer shell SmoothPlastic or Glass with high transparency | Avoids "liquid disappears behind glass" |
| Ice block / crystal pickup | Glass or Ice material, slightly emissive or Neon core inside | Reads at distance; core sells the glow |
| Stained glass | MeshPart with `SurfaceAppearance` colour map + alpha, `AlphaMode = Transparency` | Per-pixel colour that Glass alone cannot do |
| Car windows | Separate MeshPart, Glass or transparent dark SmoothPlastic | Must be its own part to get its own material |

## Modeling tips

- **Glass is its own MeshPart.** One material per MeshPart, so split window panes, bottle shells and visors in Blender ([[One Material per MeshPart - Splitting vs Atlasing Multi-Material Models]]).
- **Give glass thickness only when it matters.** A single plane is fine for windows; bottles look better with an outer shell and a slightly smaller inner liquid mesh.
- **Liquid surface:** model the liquid's top as a flat cap slightly below the bottle neck; tilt nothing (liquid stays level).
- **Rim highlights:** a thin, lighter edge in the colour map or a bevel on the bottle lip helps glass read without relying on reflections.
- `DoubleSided` is for card meshes (leaves, hair, cloth); for closed glass shells keep it off so you do not double the transparent layers.

## Performance

- Every transparent surface adds overdraw; windows seen through windows (two shop fronts aligned) multiply the cost ([[Perf - Transparency Overdraw - Glass, Foliage Cards and DoubleSided Meshes]]).
- Keep big glass panes few and large, not many small ones.
- Turn `CastShadow` off on clear glass if the shadow looks wrong for your scene.

## Pitfalls

- Glass with Transparency 1: invisible, but still collides; use Transparency below 1 for visible glass.
- Glass on a whole merged building mesh: the walls become glass too. Split it.
- Expecting refraction on phones: it is not supported there.
- Potions whose transparent liquid vanishes inside Glass: make the liquid opaque or Neon.

## Related
[[Materials Textures - Hub]] - [[Perf - Transparency Overdraw - Glass, Foliage Cards and DoubleSided Meshes]] - [[SurfaceAppearance AlphaMode and TintMask - Recolorable Assets]] - [[Water, Shorelines and Foam — Practical Roblox Approach]]
