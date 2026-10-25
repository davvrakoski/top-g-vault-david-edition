---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
title: "Modeling Hand-Held Tools and Weapons - Handle, Grip Point and Scale"
tags: [roblox, community-knowledge, 3d-art, blender, tools, weapons]
cssclasses: [tg-a10]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Tool
  - https://create.roblox.com/docs/studio/pivot-tools
  - https://create.roblox.com/docs/art/modeling/specifications
  - https://create.roblox.com/docs/tutorials/curriculums/core/building/greybox-a-playable-area
---
# Modeling Hand-Held Tools and Weapons - Handle, Grip Point and Scale

A sword, torch or gun that floats beside the hand, points backwards or looks toy-sized is almost always a modeling-side mistake, not a scripting one. The Roblox `Tool` system attaches whatever part is named `Handle` to the character's right hand, then offsets it by `Tool.Grip`. If you build the mesh so that its origin already sits where the palm closes, the grip offset stays near identity and every weapon in your game lines up the same way. This note covers the art side; the animation side is in [[Animating Tools and Weapons with Motor6D Grips]].

## How Roblox holds a tool (what the mesh must respect)

- A `Tool` is equipped from the `Backpack` into the character. By default it needs a `BasePart` named **`Handle`** (unless `Tool.RequiresHandle` is false).
- The engine welds the hand to the `Handle` and applies `Tool.Grip` (a CFrame; also exposed as `GripPos`, `GripForward`, `GripRight`, `GripUp`).
- So the **Handle's own CFrame** is the reference point. For a MeshPart that is the mesh's pivot as imported, so set it in Blender.

## Blender setup

1. **Units:** a stud is about 28 cm. Work in metres with a unit scale that matches your import settings (see [[FBX Import Settings, Scale and Collision Fidelity]]) and keep one reference object: a 5-stud-tall R15 dummy exported from Studio, or a simple 1.4 m capsule.
2. **Origin at the grip:** put the object origin in the centre of where the fist wraps the handle, not at the bounding-box centre. In Blender: snap the 3D cursor to the grip loop, then *Object > Set Origin > Origin to 3D Cursor*.
3. **Orientation:** pick one house convention and never break it, for example "blade/barrel points along -Z (Roblox forward), up is +Y". Apply rotation and scale (*Ctrl+A*) before export so the pivot axes are clean.
4. **Separate the Handle from the rest:** for multi-part weapons (gun body, magazine, slide), export the grip area as the `Handle` MeshPart and the moving pieces as separate meshes with their own origins at their hinge or slide point. They get welded or Motor6D-joined to the Handle in Studio.

## Scale cheat sheet (game-readable, not real-world)

Roblox avatars have big hands and short arms compared to real people, so real-world weapon sizes read small. Common practice is to scale hand-held props up roughly 10-30% from real size and judge in the game camera, not the Blender viewport. Our house checks (not engine rules):

| Item | Readable length |
|---|---|
| Knife | 1.2-1.6 studs |
| One-hand sword | 3.5-4.5 studs |
| Pistol | 1.2-1.6 studs |
| Rifle | 3.5-4.5 studs |
| Torch / flashlight | 1.5-2 studs |

## Triangle and texture budget

- Individual meshes cannot exceed 20,000 triangles (Roblox spec), but a held item is on screen constantly for one player and tiny for everyone else. A first-person viewmodel can justify 3-8k tris; a third-person-only tool is usually fine at 500-2,500.
- One material per MeshPart: a 512 or 1024 SurfaceAppearance set is plenty for most tools.

## Test in Studio

1. Import, rename the grip mesh to `Handle`, put it in a `Tool`, drop it in `StarterPack`.
2. Play test and look from the third-person camera. If it is offset, fix the **origin in Blender** first; only use `Tool.Grip` for small per-tool tweaks.
3. Check that the hand does not clip through the guard: widen the grip section rather than nudging the grip.

## Pitfalls

- Origin left at world zero, so the tool hangs metres from the hand.
- Unapplied rotation: the mesh looks right in Blender but the pivot axes are tilted, so `Grip` math gets confusing.
- Collision on detailed blades: set `CanCollide` off on the visual parts and use simple hitboxes for combat.
- Scaling the Model in Studio after setting grips: grips are offsets and do not scale with you.

## Related
[[3D Modeling Blender - Hub]] - [[Animating Tools and Weapons with Motor6D Grips]] - [[FBX Import Settings, Scale and Collision Fidelity]] - [[Parts, Unions or MeshParts - Choosing the Geometry Type]]
