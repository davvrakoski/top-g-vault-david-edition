---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
source_note: "inbox/blender-one-shot-model-scripts"
title: "Blender One-Shot Model Scripts (Copy-Paste)"
tags: [roblox, blender, scripting, models, one-shot]
verified: 2026-10-25
author: "TDOD"
cssclasses: [tg-a10]
---

# Blender One-Shot Model Scripts (Copy-Paste)

> [!topg] Made by TDOD
> Each script builds a **finished, game-ready model** in one click and exports an **FBX to your Desktop**: open Blender (4.x or 5.x) > **Scripting** tab > **New** > paste > **Run Script** (Alt+P). Every script below was run and checked in Blender 5.2. Use the copy button on each code block.

**Import into Roblox Studio:** Home > Import 3D > pick the FBX. Sizes are real metres (a 1 m crate is about 3.6 studs); scale in Studio if you want it bigger.
**Change it:** the CAPS settings at the top of each script (size, seed, letter, counts) change the model without touching the rest.

| Script | What you get | Faces (approx) |
|---|---|---|
| Fantasy Sword | blade, gold guard + pommel, leather grip, glowing gem | 300 |
| Loot Crate | plank crate with metal corner brackets | 1,700 |
| Low-Poly Tree | tapered trunk + 4 foliage blobs (change SEED) | 330 |
| Rock Set | 5 unique flat-shaded rocks, origins at their bases | 400 |
| Stylized House | walls, gable roof, door, 4 glowing windows, chimney, porch | 120 |
| Gold Coin | coin with ridged rim + raised letter both sides | 2,100 |

## Fantasy Sword

```python
# TOP G VAULT one-shot model: FANTASY SWORD (by TDOD). Blender 4.x/5.x: Scripting tab > New > paste > Run Script.
# Builds a game-ready sword (~1.1 m, origin at the grip), 3 materials, exports an FBX to your Desktop for Roblox / Unity / Unreal.
import bpy, bmesh, math, os
NAME = "TopG_Sword"
OUT = os.environ.get("TOPG_OUT") or os.path.join(os.path.expanduser("~"), "Desktop", NAME + ".fbx")

bpy.ops.object.select_all(action="SELECT"); bpy.ops.object.delete()

def mat(name, rgb, rough=0.5, metal=0.0, emit=0.0):
    m = bpy.data.materials.get(name) or bpy.data.materials.new(name)
    m.use_nodes = True; b = m.node_tree.nodes["Principled BSDF"]
    b.inputs["Base Color"].default_value = (*rgb, 1); b.inputs["Roughness"].default_value = rough; b.inputs["Metallic"].default_value = metal
    if emit: b.inputs["Emission Color"].default_value = (*rgb, 1); b.inputs["Emission Strength"].default_value = emit
    return m

def obj_from_bm(name, bm, material):
    me = bpy.data.meshes.new(name); bm.to_mesh(me); bm.free()
    ob = bpy.data.objects.new(name, me); bpy.context.collection.objects.link(ob); me.materials.append(material); return ob

STEEL = mat("Steel", (0.78, 0.8, 0.85), 0.25, 1.0)
GOLD = mat("Gold", (1.0, 0.72, 0.18), 0.3, 1.0)
GRIP = mat("Leather", (0.12, 0.06, 0.03), 0.8)
GEM = mat("Gem", (0.1, 0.45, 1.0), 0.1, 0.0, 3.0)

# blade: diamond cross-section, tapers to a point
bm = bmesh.new()
L, W, T = 0.82, 0.055, 0.012
rings = []
for i, (z, w) in enumerate([(0.0, W), (L * 0.75, W * 0.9), (L, 0.0)]):
    rings.append([bm.verts.new((x * w, y * T, z + 0.12)) for x, y in [(1, 0), (0, 1), (-1, 0), (0, -1)]] if w > 0 else [bm.verts.new((0, 0, z + 0.12))])
for a, b2 in zip(rings, rings[1:]):
    for k in range(4):
        if len(b2) == 1: bm.faces.new((a[k], a[(k + 1) % 4], b2[0]))
        else: bm.faces.new((a[k], a[(k + 1) % 4], b2[(k + 1) % 4], b2[k]))
bm.faces.new(list(reversed(rings[0])))
bmesh.ops.recalc_face_normals(bm, faces=bm.faces)
blade = obj_from_bm("Blade", bm, STEEL)

# guard, grip, pommel, gem
bpy.ops.mesh.primitive_cube_add(size=1, location=(0, 0, 0.11)); guard = bpy.context.object
guard.scale = (0.26, 0.05, 0.035); guard.data.materials.append(GOLD)
bev = guard.modifiers.new("Bevel", "BEVEL"); bev.width = 0.01; bev.segments = 3
bpy.ops.mesh.primitive_cylinder_add(vertices=16, radius=0.018, depth=0.2, location=(0, 0, 0.0)); grip = bpy.context.object
grip.data.materials.append(GRIP)
bpy.ops.mesh.primitive_uv_sphere_add(segments=16, ring_count=10, radius=0.032, location=(0, 0, -0.11)); pommel = bpy.context.object
pommel.data.materials.append(GOLD)
bpy.ops.mesh.primitive_ico_sphere_add(subdivisions=1, radius=0.02, location=(0, -0.04, 0.11)); gem = bpy.context.object
gem.data.materials.append(GEM)

parts = [blade, guard, grip, pommel, gem]
for o in parts:
    bpy.context.view_layer.objects.active = o
    for md in o.modifiers: bpy.ops.object.modifier_apply(modifier=md.name)
bpy.ops.object.select_all(action="DESELECT")
for o in parts: o.select_set(True)
bpy.context.view_layer.objects.active = blade
bpy.ops.object.join(); sword = bpy.context.object; sword.name = NAME
bpy.ops.object.transform_apply(location=False, rotation=True, scale=True)
bpy.ops.object.shade_flat()
bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, apply_scale_options="FBX_SCALE_ALL", object_types={"MESH"}, mesh_smooth_type="FACE")
print("TOPG DONE", NAME, len(sword.data.polygons), "faces ->", OUT)
```

## Loot Crate

```python
# TOP G VAULT one-shot model: LOOT CRATE (by TDOD). Blender 4.x/5.x: Scripting tab > New > paste > Run Script.
# Wooden plank crate with metal corner brackets (~1 m cube, origin bottom centre), exports an FBX to your Desktop.
import bpy, os
NAME = "TopG_Crate"
OUT = os.environ.get("TOPG_OUT") or os.path.join(os.path.expanduser("~"), "Desktop", NAME + ".fbx")
S = 1.0          # crate size (m)
PLANKS = 4       # planks per side

bpy.ops.object.select_all(action="SELECT"); bpy.ops.object.delete()

def mat(name, rgb, rough=0.6, metal=0.0):
    m = bpy.data.materials.get(name) or bpy.data.materials.new(name)
    m.use_nodes = True; b = m.node_tree.nodes["Principled BSDF"]
    b.inputs["Base Color"].default_value = (*rgb, 1); b.inputs["Roughness"].default_value = rough; b.inputs["Metallic"].default_value = metal
    return m

WOOD = mat("Wood", (0.42, 0.24, 0.1), 0.75)
WOOD_DARK = mat("WoodDark", (0.25, 0.13, 0.05), 0.8)
METAL = mat("Metal", (0.35, 0.36, 0.4), 0.35, 1.0)
parts = []

def box(loc, dims, m, bevel=0.01):
    bpy.ops.mesh.primitive_cube_add(size=1, location=loc); o = bpy.context.object
    o.scale = dims; o.data.materials.append(m)
    if bevel:
        b = o.modifiers.new("Bevel", "BEVEL"); b.width = bevel; b.segments = 2; b.limit_method = "ANGLE"
    parts.append(o); return o

# inner core (dark gaps between planks)
box((0, 0, S / 2), (S * 0.96, S * 0.96, S * 0.96), WOOD_DARK, 0)
# planks on the 4 sides + top
pw = S / PLANKS
for i in range(PLANKS):
    off = -S / 2 + pw * (i + 0.5)
    box((off, -S / 2, S / 2), (pw * 0.92, 0.04, S * 0.98), WOOD)
    box((off, S / 2, S / 2), (pw * 0.92, 0.04, S * 0.98), WOOD)
    box((-S / 2, off, S / 2), (0.04, pw * 0.92, S * 0.98), WOOD)
    box((S / 2, off, S / 2), (0.04, pw * 0.92, S * 0.98), WOOD)
    box((off, 0, S), (pw * 0.92, S * 0.98, 0.04), WOOD)
# metal corner brackets (8 corners) + edge bands
for x in (-1, 1):
    for y in (-1, 1):
        for z in (0, 1):
            box((x * S / 2, y * S / 2, z * S), (0.16, 0.16, 0.16), METAL, 0.015)
        box((x * S / 2, y * S / 2, S / 2), (0.07, 0.07, S * 0.98), METAL, 0.01)

for o in parts:
    bpy.context.view_layer.objects.active = o
    for md in list(o.modifiers): bpy.ops.object.modifier_apply(modifier=md.name)
bpy.ops.object.select_all(action="DESELECT")
for o in parts: o.select_set(True)
bpy.context.view_layer.objects.active = parts[0]
bpy.ops.object.join(); crate = bpy.context.object; crate.name = NAME
bpy.ops.object.transform_apply(location=False, rotation=True, scale=True)
bpy.ops.object.shade_flat()
bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, apply_scale_options="FBX_SCALE_ALL", object_types={"MESH"}, mesh_smooth_type="FACE")
print("TOPG DONE", NAME, len(crate.data.polygons), "faces ->", OUT)
```

## Low-Poly Tree

```python
# TOP G VAULT one-shot model: STYLIZED LOW-POLY TREE (by TDOD). Blender 4.x/5.x: Scripting tab > New > paste > Run Script.
# Tapered trunk + 4 lumpy foliage blobs, flat-shaded, origin at the root (~4 m tall). Change SEED for a different tree.
import bpy, bmesh, random, math, os
NAME = "TopG_Tree"
OUT = os.environ.get("TOPG_OUT") or os.path.join(os.path.expanduser("~"), "Desktop", NAME + ".fbx")
SEED = 7
HEIGHT = 2.4     # trunk height (m)
random.seed(SEED)

bpy.ops.object.select_all(action="SELECT"); bpy.ops.object.delete()

def mat(name, rgb, rough=0.8):
    m = bpy.data.materials.get(name) or bpy.data.materials.new(name)
    m.use_nodes = True; b = m.node_tree.nodes["Principled BSDF"]
    b.inputs["Base Color"].default_value = (*rgb, 1); b.inputs["Roughness"].default_value = rough
    return m

BARK = mat("Bark", (0.28, 0.16, 0.08))
LEAF = mat("Leaves", (0.18, 0.55, 0.16))
LEAF2 = mat("LeavesLight", (0.35, 0.7, 0.2))
parts = []

# trunk: tapered 7-sided cylinder with a slight lean
bpy.ops.mesh.primitive_cone_add(vertices=7, radius1=0.22, radius2=0.12, depth=HEIGHT, location=(0, 0, HEIGHT / 2))
trunk = bpy.context.object; trunk.rotation_euler = (math.radians(random.uniform(-4, 4)), math.radians(random.uniform(-4, 4)), 0)
trunk.data.materials.append(BARK); parts.append(trunk)

# foliage: displaced icospheres
blobs = [(0, 0, HEIGHT + 0.5, 1.15)] + [(random.uniform(-0.7, 0.7), random.uniform(-0.7, 0.7), HEIGHT + random.uniform(-0.1, 0.9), random.uniform(0.6, 0.85)) for _ in range(3)]
for i, (x, y, z, r) in enumerate(blobs):
    bpy.ops.mesh.primitive_ico_sphere_add(subdivisions=2, radius=r, location=(x, y, z))
    o = bpy.context.object; o.data.materials.append(LEAF if i % 2 == 0 else LEAF2)
    bm = bmesh.new(); bm.from_mesh(o.data)
    for v in bm.verts: v.co *= random.uniform(0.85, 1.12)
    bm.to_mesh(o.data); bm.free(); parts.append(o)

bpy.ops.object.select_all(action="DESELECT")
for o in parts: o.select_set(True)
bpy.context.view_layer.objects.active = trunk
bpy.ops.object.join(); tree = bpy.context.object; tree.name = NAME
bpy.ops.object.transform_apply(location=False, rotation=True, scale=True)
bpy.ops.object.shade_flat()
bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, apply_scale_options="FBX_SCALE_ALL", object_types={"MESH"}, mesh_smooth_type="FACE")
print("TOPG DONE", NAME, len(tree.data.polygons), "faces ->", OUT)
```

## Rock Set

```python
# TOP G VAULT one-shot model: ROCK SET (by TDOD). Blender 4.x/5.x: Scripting tab > New > paste > Run Script.
# 5 unique low-poly rocks in a row (separate objects, origins at their bases), exported together. Change SEED / COUNT.
import bpy, bmesh, random, os
from mathutils import Vector, noise
NAME = "TopG_Rocks"
OUT = os.environ.get("TOPG_OUT") or os.path.join(os.path.expanduser("~"), "Desktop", NAME + ".fbx")
SEED, COUNT = 3, 5
random.seed(SEED)

bpy.ops.object.select_all(action="SELECT"); bpy.ops.object.delete()

m = bpy.data.materials.new("Rock"); m.use_nodes = True
b = m.node_tree.nodes["Principled BSDF"]; b.inputs["Base Color"].default_value = (0.32, 0.31, 0.3, 1); b.inputs["Roughness"].default_value = 0.9

rocks = []
for i in range(COUNT):
    size = random.uniform(0.4, 1.2)
    bpy.ops.mesh.primitive_ico_sphere_add(subdivisions=2, radius=size, location=(i * 2.6, 0, 0))
    o = bpy.context.object; o.name = f"{NAME}_{i + 1}"; o.data.materials.append(m)
    bm = bmesh.new(); bm.from_mesh(o.data)
    off = Vector((random.random() * 50, random.random() * 50, random.random() * 50))
    for v in bm.verts:
        n = noise.noise(v.co * 1.4 + off)
        v.co *= 1 + 0.35 * n
        v.co.z *= random.uniform(0.55, 0.75)          # squash: rocks sit wide, not round
    bmesh.ops.planar_faces(bm, faces=bm.faces, iterations=2, factor=0.5) if hasattr(bmesh.ops, "planar_faces") else None
    bm.to_mesh(o.data); bm.free()
    # flat bottom + origin at the base
    zmin = min(v.co.z for v in o.data.vertices)
    for v in o.data.vertices:
        if v.co.z < zmin + size * 0.15: v.co.z = zmin + size * 0.15
    bpy.context.view_layer.objects.active = o
    bpy.ops.object.shade_flat()
    o.location.z -= zmin + size * 0.15
    rocks.append(o)

bpy.ops.object.select_all(action="DESELECT")
for o in rocks: o.select_set(True)
bpy.ops.object.transform_apply(location=False, rotation=True, scale=True)
bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, apply_scale_options="FBX_SCALE_ALL", object_types={"MESH"}, mesh_smooth_type="FACE")
print("TOPG DONE", NAME, len(rocks), "rocks,", sum(len(o.data.polygons) for o in rocks), "faces ->", OUT)
```

## Stylized House

```python
# TOP G VAULT one-shot model: STYLIZED HOUSE (by TDOD). Blender 4.x/5.x: Scripting tab > New > paste > Run Script.
# Walls, gable roof with overhang, door, 4 windows with frames, chimney, porch step. ~6 x 5 m, origin bottom centre.
import bpy, bmesh, os
NAME = "TopG_House"
OUT = os.environ.get("TOPG_OUT") or os.path.join(os.path.expanduser("~"), "Desktop", NAME + ".fbx")
W, D, H = 6.0, 5.0, 3.0      # width, depth, wall height (m)
ROOF_H = 2.0

bpy.ops.object.select_all(action="SELECT"); bpy.ops.object.delete()

def mat(name, rgb, rough=0.7, metal=0.0, emit=0.0):
    m = bpy.data.materials.get(name) or bpy.data.materials.new(name)
    m.use_nodes = True; b = m.node_tree.nodes["Principled BSDF"]
    b.inputs["Base Color"].default_value = (*rgb, 1); b.inputs["Roughness"].default_value = rough; b.inputs["Metallic"].default_value = metal
    if emit: b.inputs["Emission Color"].default_value = (*rgb, 1); b.inputs["Emission Strength"].default_value = emit
    return m

WALL = mat("Walls", (0.85, 0.78, 0.65))
ROOF = mat("Roof", (0.55, 0.12, 0.08))
TRIM = mat("Trim", (0.95, 0.95, 0.92))
DOOR = mat("Door", (0.3, 0.17, 0.08))
GLASS = mat("WindowGlow", (1.0, 0.8, 0.45), 0.2, 0, 1.5)
STONE = mat("Stone", (0.4, 0.4, 0.42), 0.9)
parts = []

def box(loc, dims, m):
    bpy.ops.mesh.primitive_cube_add(size=1, location=loc); o = bpy.context.object
    o.scale = dims; o.data.materials.append(m); parts.append(o); return o

# walls (one block) + floor slab + porch step
box((0, 0, H / 2), (W, D, H), WALL)
box((0, 0, 0.1), (W + 0.3, D + 0.3, 0.2), STONE)
box((0, -D / 2 - 0.45, 0.1), (1.6, 0.9, 0.2), STONE)

# gable roof: a triangular prism with overhang
bm = bmesh.new(); ov = 0.4
pts = [(-W / 2 - ov, H - 0.05), (W / 2 + ov, H - 0.05), (0, H + ROOF_H)]
front = [bm.verts.new((x, -D / 2 - ov, z)) for x, z in pts]
back = [bm.verts.new((x, D / 2 + ov, z)) for x, z in pts]
bm.faces.new(front); bm.faces.new(list(reversed(back)))
for i in range(3):
    j = (i + 1) % 3
    bm.faces.new((front[i], back[i], back[j], front[j]))
bmesh.ops.recalc_face_normals(bm, faces=bm.faces)
me = bpy.data.meshes.new("Roof"); bm.to_mesh(me); bm.free()
roof = bpy.data.objects.new("Roof", me); bpy.context.collection.objects.link(roof); me.materials.append(ROOF)
sol = roof.modifiers.new("Thick", "SOLIDIFY"); sol.thickness = 0.15; parts.append(roof)

# door (front, -Y) with frame
box((0, -D / 2 - 0.03, 1.05), (1.0, 0.08, 2.1), DOOR)
box((0, -D / 2 - 0.05, 2.15), (1.2, 0.1, 0.12), TRIM)
# windows: 2 front, 2 side, glowing glass + white frame
for x, y, rot in [(-1.9, -D / 2, False), (1.9, -D / 2, False), (W / 2, -0.8, True), (W / 2, 1.2, True)]:
    if rot:
        box((x + 0.03, y, 1.7), (0.08, 1.0, 1.0), GLASS); box((x + 0.05, y, 1.7), (0.06, 1.2, 0.1), TRIM); box((x + 0.05, y, 1.7), (0.06, 0.1, 1.2), TRIM)
    else:
        box((x, y - 0.03, 1.7), (1.0, 0.08, 1.0), GLASS); box((x, y - 0.05, 1.7), (1.2, 0.06, 0.1), TRIM); box((x, y - 0.05, 1.7), (0.1, 0.06, 1.2), TRIM)
# chimney
box((W * 0.25, D * 0.15, H + ROOF_H * 0.7), (0.6, 0.6, 1.6), STONE)

for o in parts:
    bpy.context.view_layer.objects.active = o
    for md in list(o.modifiers): bpy.ops.object.modifier_apply(modifier=md.name)
bpy.ops.object.select_all(action="DESELECT")
for o in parts: o.select_set(True)
bpy.context.view_layer.objects.active = parts[0]
bpy.ops.object.join(); house = bpy.context.object; house.name = NAME
bpy.ops.object.transform_apply(location=False, rotation=True, scale=True)
bpy.ops.object.shade_flat()
bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, apply_scale_options="FBX_SCALE_ALL", object_types={"MESH"}, mesh_smooth_type="FACE")
print("TOPG DONE", NAME, len(house.data.polygons), "faces ->", OUT)
```

## Gold Coin

```python
# TOP G VAULT one-shot model: GOLD COIN with raised G (by TDOD). Blender 4.x/5.x: Scripting tab > New > paste > Run Script.
# Bevelled coin with a ridged rim and a raised letter on both faces (change LETTER). ~0.3 m wide, origin at the centre.
import bpy, math, os
NAME = "TopG_Coin"
OUT = os.environ.get("TOPG_OUT") or os.path.join(os.path.expanduser("~"), "Desktop", NAME + ".fbx")
LETTER = "G"
R, T = 0.15, 0.03            # radius, thickness (m)

bpy.ops.object.select_all(action="SELECT"); bpy.ops.object.delete()

gold = bpy.data.materials.new("Gold"); gold.use_nodes = True
b = gold.node_tree.nodes["Principled BSDF"]
b.inputs["Base Color"].default_value = (1.0, 0.7, 0.15, 1); b.inputs["Metallic"].default_value = 1.0; b.inputs["Roughness"].default_value = 0.25
parts = []

# body
bpy.ops.mesh.primitive_cylinder_add(vertices=64, radius=R, depth=T, location=(0, 0, 0)); body = bpy.context.object
body.data.materials.append(gold)
bev = body.modifiers.new("Bevel", "BEVEL"); bev.width = 0.004; bev.segments = 3; bev.limit_method = "ANGLE"
parts.append(body)
# ridged rim: a torus on each face edge
for z in (T / 2, -T / 2):
    bpy.ops.mesh.primitive_torus_add(major_radius=R - 0.012, minor_radius=0.006, major_segments=64, minor_segments=8, location=(0, 0, z))
    t = bpy.context.object; t.data.materials.append(gold); parts.append(t)
# raised letter on both faces
for z, flip in ((T / 2, False), (-T / 2, True)):
    bpy.ops.object.text_add(location=(0, 0, z))
    tx = bpy.context.object; tx.data.body = LETTER; tx.data.align_x = "CENTER"; tx.data.align_y = "CENTER"
    tx.data.size = R * 1.25; tx.data.extrude = 0.004
    if flip: tx.rotation_euler = (math.pi, 0, 0)
    bpy.ops.object.convert(target="MESH"); tx = bpy.context.object
    tx.data.materials.clear(); tx.data.materials.append(gold); parts.append(tx)

for o in parts:
    bpy.context.view_layer.objects.active = o
    for md in list(o.modifiers): bpy.ops.object.modifier_apply(modifier=md.name)
bpy.ops.object.select_all(action="DESELECT")
for o in parts: o.select_set(True)
bpy.context.view_layer.objects.active = body
bpy.ops.object.join(); coin = bpy.context.object; coin.name = NAME
bpy.ops.object.transform_apply(location=False, rotation=True, scale=True)
bpy.ops.object.shade_smooth()
try: bpy.ops.object.shade_auto_smooth(angle=math.radians(35))      # Blender 4.1+
except Exception: pass
bpy.ops.export_scene.fbx(filepath=OUT, use_selection=True, apply_scale_options="FBX_SCALE_ALL", object_types={"MESH"}, mesh_smooth_type="FACE")
print("TOPG DONE", NAME, len(coin.data.polygons), "faces ->", OUT)
```

## One-shot prompt: make ANY model as a Blender script

Paste this into Claude / ChatGPT, replace the first line, then paste the script it returns into Blender the same way.

```text
Write ONE complete Blender 4.x/5.x Python script (bpy + bmesh only, no add-ons, no external files) that builds: <WHAT YOU WANT, e.g. "a low-poly sci-fi crate with glowing panels">.
Rules:
- Start by deleting everything in the scene. End by joining all parts into ONE object named after the model, applying all modifiers and transforms, and exporting an FBX to ~/Desktop/<Name>.fbx (use_selection=True, apply_scale_options="FBX_SCALE_ALL", object_types={"MESH"}).
- Real-world size in metres; origin at the bottom centre (or the grip/handle for tools and weapons).
- Game-ready: under 5,000 triangles, no holes, normals facing out, flat or auto-smooth shading.
- Materials: Principled BSDF with Base Color / Roughness / Metallic set (Emission for glowing parts), clearly named.
- Put every tweakable number (size, colours, counts, random SEED) in CAPS variables at the top.
- No placeholders, no "TODO", nothing I have to edit to make it run. Print "DONE <name> <face count>" at the end.
```

## Fixing errors fast
- **Error about "Emission Color"** (old Blender 3.x): change `"Emission Color"` to `"Emission"`.
- **Nothing exported:** OneDrive Desktops can differ; set `OUT =` to any folder path.
- **Too small / big in Roblox:** scale it in Studio, or change the size variable at the top and run again.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[3D Modeling Blender - Hub]]

**Related notes:** [[Blender Game-Ready Audit]] · [[One-Shot Game Build Prompt (OP)]]

<!-- TDOD_GRAPH_END -->
