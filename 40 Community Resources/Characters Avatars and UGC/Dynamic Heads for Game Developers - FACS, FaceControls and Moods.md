---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/dynamic-heads-for-devs"
title: "Dynamic Heads for Game Developers - FACS, FaceControls and Moods"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", dynamic-heads, facial-animation, luau]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/avatar/dynamic-heads
  - https://create.roblox.com/docs/avatar/dynamic-heads/specifications
  - https://create.roblox.com/docs/reference/engine/classes/FaceControls
  - https://create.roblox.com/docs/reference/engine/classes/AvatarEditorService
  - https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription
  - https://devforum.roblox.com/t/allowing-to-control-facial-animations-outside-of-studio/4732600
---
# Dynamic Heads for Game Developers - FACS, FaceControls and Moods

Dynamic heads are rigged heads with facial animation. Most avatars now wear one. This note is what a **game** developer (not an item creator) needs: how faces animate in your game and what you can control.

## The four layers of a dynamic head

1. **Mesh and textures** (a skinned MeshPart named Head).
2. **Facial animation data**: an internal face rig mapped to FACS poses. In Studio this shows up as a `FaceControls` instance under the head.
3. **Outer cage** (a `WrapTarget`) so face accessories like beards deform with expressions.
4. **Attachments** for hats and hair.

The face bones and the FACS-to-joint mapping are hidden from scripts; you only touch them through `FaceControls`.

## FaceControls in practice

- About 50 FACS properties (`JawDrop`, `LeftEyeClosed`, `Pucker`, `TongueOut`, and so on), each a float from 0 to 1.
- Combinations make expressions; values over time make facial animation.
- The Animation Editor can key FACS values as tracks, so facial animation is authored like body animation and played with `Animator`.
- The API reference marks these properties **NotReplicated** and not saved. A server script changing them will not show on clients. Drive faces from a LocalScript or by playing facial animations, which replicate as animation tracks.
- `HumanoidDescription.MoodAnimation` sets the persistent mood (resting expression) when a description is applied.

A July 2026 DevForum feature request by Ionely_traveler says developers still cannot drive NPC faces as freely as body joints and end up uploading many separate facial animations. Plan NPC dialogue faces around animations.

## Original example: client-side blink for NPCs

```lua
-- LocalScript. Makes every NPC with a dynamic head in a folder blink.
local npcFolder = workspace:WaitForChild("NPCs")

local function blink(face: FaceControls)
	for t = 0, 1, 0.25 do
		face.LeftEyeClosed = t
		face.RightEyeClosed = t
		task.wait(0.02)
	end
	for t = 1, 0, -0.25 do
		face.LeftEyeClosed = t
		face.RightEyeClosed = t
		task.wait(0.02)
	end
end

while true do
	for _, npc in npcFolder:GetChildren() do
		local head = npc:FindFirstChild("Head")
		local face = head and head:FindFirstChildOfClass("FaceControls")
		if face and math.random() < 0.3 then
			task.spawn(blink, face)
		end
	end
	task.wait(1.5)
end
```

If an NPC is also playing a facial animation, the animation can overwrite these writes. Test which wins in your setup.

## Classic heads in old outfits

`AvatarEditorService:ConformToAvatarRulesAsync()` remaps classic face and classic head assets to their matching dynamic head IDs (with the right head shape) before saving an avatar. Use it in in-game editors so saved looks follow current platform rules.

## For item creators: the minimum bar

- At least these **17 FACS poses**: LeftEyeClosed, RightEyeClosed, EyesLookDown, JawDrop, Pucker, LeftLipCornerPuller, RightLipCornerPuller, ChinRaiser, ChinRaiserUpperLip, LeftCheekRaiser, RightCheekRaiser, LeftInnerBrowRaiser, RightInnerBrowRaiser, LeftLipCornerDown, RightLipCornerDown, LeftLowerLipDepressor, RightLowerLipDepressor.
- Validation tests 5 actions: left blink, right blink, mouth open, happy, sad. The cage's eye and mouth landmarks must actually move.
- Head triangle budget: 4,000.
- Avatar Setup can generate the face rig, FACS poses and cage for you (see [[Avatar Setup Tool - Auto Rig, Cage and Skin Notes]]).

## Credits

- Roblox Creator Docs: *Dynamic heads*, *Dynamic head specifications*, FaceControls, AvatarEditorService and HumanoidDescription references (CC BY 4.0). Code is original.
- DevForum feature request by Ionely_traveler (July 2026).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Dynamic heads]] · [[FaceControls]] · [[Dynamic head specifications]] · [[Animate heads]] · [[NPC Appearance Pipeline - From HumanoidDescription to Spawned Rig]]

<!-- TDOD_GRAPH_END -->
