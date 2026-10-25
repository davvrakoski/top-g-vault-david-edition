---
area: "06 Characters and Animation"
cluster: "Animation"
tags: [deep-dive, roblox, animation, fbx, import, retargeting, kenney]
cssclasses: [tg-a06]
---

# Importing FBX Animations and Retargeting - Kenney Rig Walkthrough

> **Why this matters:** Most teams lose days on "the model imported but the animation does nothing", wrong scale, sideways characters and animations that only play in Studio.
> This is the end-to-end path from an FBX on disk to a published animation ID playing in a live server, using the CC0 Kenney animated characters bundled in this vault as the worked example.

---

## 1. What is in the bundled Kenney packs

The vault ships three Kenney animated character packs (CC0, commercial use allowed):

- `20 FBX Asset Library/Kenney/Animated Characters Protagonists/`
- `20 FBX Asset Library/Kenney/Animated Characters Survivors/`
- `20 FBX Asset Library/Kenney/Animated Characters Retro/`

Each has `Model/characterMedium.fbx` (the skinned character) and `Animations/idle.fbx`, `jump.fbx`, `run.fbx`. Catalog pages: [[Kenney - Animated Characters Protagonists]], [[Kenney - Animated Characters Survivors]], [[Kenney - Animated Characters Retro]].

Inspecting the FBX files shows a **Mixamo-style bone naming without the `mixamorig:` prefix**:

| Group | Bones found in the file |
|---|---|
| Root / pelvis | `Root`, `Hips` |
| Spine / head | `Spine` (a single spine bone), `Neck`, `Head` |
| Arms (per side) | `LeftShoulder`, `LeftArm`, `LeftForeArm`, `LeftHand` |
| Fingers (per side) | `LeftHandIndex1-3`, `LeftHandThumb1-2` |
| Legs (per side) | `LeftUpLeg`, `LeftLeg`, `LeftFoot` |
| Control bones | `HipsCtrl`, `LeftFootCtrl`, `LeftFootIK`, `LeftFootRollCtrl` (and right-side twins) |

The control bones are rig helpers from the authoring tool, not deforming bones. They matter in step 5.

Because the model and the three animations share the **same skeleton names**, the Kenney clips import onto the Kenney model with no retargeting. To play **R15 animations** (catalog emotes, your R15 library) on a Kenney character, use Adaptive Animation (section 6).

## 2. Units and scale (do this first)

The Roblox physics units page defines **1 stud = 28 cm**, so metres to studs is ×3.57. Kenney models are authored in metres, which is why the catalog suggests scaling by ×3.57 for real-world size. Two choices:

- **Real-world scale:** scale ×3.57. A ~1.8 m character becomes ~6.4 studs. Doors, cars and props from other kits must follow the same rule.
- **Roblox scale:** match the ~5-stud-tall classic R15 avatar so your NPCs stand next to players naturally. Most games choose this.

Pick one rule for the whole project. Scale the **model** after import (`Model:ScaleTo()` or the Scale tool). Animation translation is applied relative to the rig, so scaling the model scales the motion with it, but always verify that the hips do not float or sink after scaling.

## 3. Import the character

1. **Home tab > Import 3D** (the 3D Importer), select `characterMedium.fbx`.
2. In the preview, check orientation. The character should face the importer's front. If it faces sideways, fix it in Blender (rotate, apply rotation) and re-export rather than rotating in Studio, because animation data is relative to the bind orientation.
3. **Rig General > Rig Type:** choose **Custom** for a creature-style rig you will animate directly; choose Custom as well if you plan to run Adaptive Animation (section 6).
4. Import. You get a `Model` containing a skinned `MeshPart` and its bones.
5. Make sure there is an animation host: an `AnimationController` with a child `Animator` (or a `Humanoid` with an `Animator` if you want engine walking). Add them if the importer did not.
6. Textures: Kenney kits share colour textures; set the `MeshPart.TextureID` (or a `SurfaceAppearance`) from the pack's texture. Note that `SurfaceAppearance` maps can only be set in Studio or by plugins, not by game scripts.

Quick sanity script for the command bar, run with the imported model selected:

```lua
local Selection = game:GetService("Selection")
local model = Selection:Get()[1]
local bones, meshes = 0, 0
for _, d in model:GetDescendants() do
	if d:IsA("Bone") then bones += 1 end
	if d:IsA("MeshPart") then
		meshes += 1
		print(d.Name, "skinned:", d.HasSkinnedMesh, "size:", d.Size)
	end
end
print("bones:", bones, "meshparts:", meshes)
local host = model:FindFirstChildWhichIsA("AnimationController") or model:FindFirstChildWhichIsA("Humanoid", true)
print("animation host:", host and host.ClassName or "MISSING", "animator:", host and host:FindFirstChildOfClass("Animator") ~= nil)
```

If `skinned` is `false`, the mesh lost its skin weights in export; fix it in Blender (the armature modifier must be present, and the mesh parented to the armature).

## 4. Import an animation clip onto the rig

The documented path in the Animation Editor:

1. **Avatar tab > Clip Editor** (the Animation Editor), click your imported rig, name the clip, **Create**.
2. In the editor's **⋯** menu: **Import > From FBX Animation**, choose `Animations/run.fbx`.
3. Keyframes load into the timeline. Press play and watch it.
4. Set **Looping** on for `idle` and `run`, off for `jump`.
5. Set **Priority** (see the ladder in [[Animator Priorities, Weights and Blending Done Right]]): `idle` = Idle, `run` = Movement, `jump` = Action or Movement.
6. Add **Animation Events** now if you need them (footsteps on the run). See [[Animation Markers for Hit Frames, Footsteps and Sync]].
7. **⋯ > Publish to Roblox.** Publish under the **same creator that owns the experience** (your user, or the group). Copy the asset ID.

The ownership rule is the number one "works in Studio, not live" bug: an animation asset that the experience owner cannot use will not play in live servers.

## 5. When the clip imports but nothing moves

Work down this list:

1. **Bone names do not match.** The importer binds by name. Compare the bones under the model with the FBX. A `mixamorig:` prefix on one side and none on the other is the classic Mixamo case; rename in Blender before export.
2. **Motion lives on control bones.** If the source rig drove the legs through IK controls (like `LeftFootIK` and `HipsCtrl` in the Kenney files) and the deforming bones were not baked, the imported clip has keys only on helpers. Fix in Blender: select the armature, **Pose > Animation > Bake Action** with **Visual Keying** and **Clear Constraints** enabled, then delete or disconnect the control bones and re-export. Only deforming bones need keys.
3. **Root motion.** If the clip moves `Root`/`Hips` forward through space, the character slides away from its collider and snaps back on loop. Roblox moves characters with physics, not root motion. Remove forward translation on the root (keep vertical bob) so the clip runs in place.
4. **Wrong scale of translation.** Hips sink into the floor or fly upward: the FBX was exported with a different unit scale than the model. Export both with the same settings (in Blender, apply scale and use **FBX Unit Scale** for **Apply Scalings**, as the Roblox Blender export page recommends for characters).
5. **Animator missing or not the one you think.** Use the sanity script above.

## 6. Retargeting: playing R15 animations on a custom humanoid

Roblox's **Adaptive Animation** system is the official retargeting path for custom humanoid rigs:

1. Import the character with **Rig Type = Custom** (section 3).
2. **Avatar tab > Adaptive Animation**. In the **Remap Rig** panel, click **Create**. Studio generates a `HumanoidRigDescription` and a `DigitsRigDescription` per hand.
3. Select the `HumanoidRigDescription`. Use the visual picker to map at least the **15 standard joints**. For the Kenney rig a sensible mapping is:

| Roblox standard part | Kenney bone |
|---|---|
| LowerTorso | `Hips` |
| UpperTorso | `Spine` |
| Head | `Head` (or `Neck` if the picker asks for the neck joint) |
| LeftUpperArm / LowerArm / Hand | `LeftArm` / `LeftForeArm` / `LeftHand` |
| RightUpperArm / LowerArm / Hand | `RightArm` / `RightForeArm` / `RightHand` |
| LeftUpperLeg / LowerLeg / Foot | `LeftUpLeg` / `LeftLeg` / `LeftFoot` |
| RightUpperLeg / LowerLeg / Foot | `RightUpLeg` / `RightLeg` / `RightFoot` |
| Optional clavicles | `LeftShoulder` / `RightShoulder` |

4. **T-pose mode > Enforce T-pose**, then fix any limb that is not straight (symmetry toggle helps).
5. Pick a test animation from the Adaptive Animation toolbar dropdown and play it. If arms twist or legs cross, remap or re-pose.
6. Save. Per the docs, the character can now play back any R15 animation and any animation published from a character with a `HumanoidRigDescription`.

Limits to expect with a one-spine-bone rig like Kenney's: R15 clips that bend `UpperTorso` relative to `LowerTorso` will look stiffer, because there is only one spine joint to carry the motion. Fingers only map if the digits description finds matching bones (Kenney has index and thumb only).

`Workspace.Retargeting` (`AnimatorRetargetingMode`: `Default`, `Disabled`, `Enabled`) controls whether animation retargeting is active for character animations. Leave it at `Default` unless you are debugging a retargeting problem.

## 7. Playing the published clips at runtime

```lua
--!strict
-- Server Script inside an NPC model built from the Kenney character.
local model = script.Parent
local controller = model:FindFirstChildOfClass("AnimationController") :: AnimationController
local animator = controller:FindFirstChildOfClass("Animator") :: Animator

local IDS = {
	idle = "rbxassetid://0", -- your published IDs
	run  = "rbxassetid://0",
	jump = "rbxassetid://0",
}

local tracks: { [string]: AnimationTrack } = {}
for name, id in IDS do
	local a = Instance.new("Animation")
	a.AnimationId = id
	tracks[name] = animator:LoadAnimation(a)
end
tracks.idle.Priority = Enum.AnimationPriority.Idle
tracks.run.Priority = Enum.AnimationPriority.Movement
tracks.jump.Priority = Enum.AnimationPriority.Action

tracks.idle:Play(0.2)

-- Example: your movement code sets a "Moving" attribute; animation follows it.
model:GetAttributeChangedSignal("Moving"):Connect(function()
	if model:GetAttribute("Moving") then
		tracks.run:Play(0.15)
	else
		tracks.run:Stop(0.2)
	end
end)
```

Tracks loaded and played on the server replicate to clients for NPCs. For many NPCs, play animations on clients instead, driven by attributes (see [[NPC Crowds, Animation LOD and Server Budgets]]).

## 8. Blender export settings that avoid 90% of problems

Not official Roblox numbers, but a configuration widely used for Roblox skinned characters:

- Apply all transforms on mesh and armature (Ctrl+A > All Transforms) before export.
- FBX export: **Selected Objects**, object types **Armature + Mesh**, **Apply Scalings: FBX Unit Scale** (the Roblox Blender configuration page names this setting), **Forward/Up** matching your test import (commonly -Z forward, Y up), **Add Leaf Bones** off, **Bake Animation** on for clips with **NLA strips** and **All Actions** off when exporting one clip per file.
- One clip per FBX file keeps imports predictable.
- Keep deforming bones only in animation exports.

## Common mistakes

- Publishing animations to a personal account for a group-owned game.
- Rotating the imported model in Studio to fix a sideways character, which breaks animation orientation.
- Leaving root motion in a run cycle.
- Expecting the Kenney `LeftFootIK` control bones to do anything in Roblox; they are authoring helpers.
- Mixing real-world scale props with Roblox-scale characters.
- Forgetting the `Animator` under the `AnimationController`.
- Retargeting with a rig that is in an A-pose without running Enforce T-pose.
- Re-importing the model after making animations, renaming bones in the process.

## Checklist

- [ ] Project scale rule chosen (real-world ×3.57 or Roblox-avatar scale).
- [ ] Character imports skinned, facing forward, with an Animator host.
- [ ] Idle/run/jump imported via Clip Editor > Import > From FBX Animation.
- [ ] Looping and priority set per clip; events added where needed.
- [ ] Clips published under the experience owner.
- [ ] Root motion removed from locomotion clips.
- [ ] Adaptive Animation set up if the rig must play R15 clips.
- [ ] Clips verified in a live test server, not only in Studio.

---

**Related:** [[Animation - Hub]] · [[FBX Asset Library - Hub]] · [[Character Materials, Rigging and Layering]] · [[Meshes, Topology and Blender]] · [[Tripo → Blender → Roblox Production Pipeline]] · [[Character Animation Framework]]
