---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/layered-clothing-custom-rigs"
title: "Layered Clothing on Custom and Non-R15 Rigs"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", layered-clothing, custom-character, luau]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/characters/appearance
  - https://create.roblox.com/docs/art/modeling/cage-meshes
  - https://create.roblox.com/docs/reference/engine/classes/WrapLayer
  - https://devforum.roblox.com/t/block-cage-layered-clothing/2933016
---
# Layered Clothing on Custom and Non-R15 Rigs

You can use the cage system for your own game characters (creatures, blocky rigs, mechs) and even for props and buildings. You just cannot sell those custom-caged items on the Marketplace.

## Requirements (from *Character appearance*)

1. The **target** model (the body) has a `WrapTarget` on each MeshPart that clothing should wrap around.
2. The **layer** model (the clothing) has a `WrapLayer` on its MeshPart.
3. The target's **outer cage** and the layer's **inner and outer cages** have matching UV layouts: the same UV on both means the same point.
4. If the target is **not R15 or has no Humanoid**, add a `Weld` from the clothing MeshPart to the part it belongs on. R15 rigs with a Humanoid get this weld automatically.
5. Custom cage UV maps cannot be uploaded to the Marketplace. In-game use is fine.

## When this is worth it

- A game with one creature body type and many skins or armor sets that should stack.
- Blocky or stylized rigs where player catalog clothing would never fit anyway (a DevForum thread, topic 2933016, asks exactly this for block rigs).
- Swappable clothing on NPCs that you author yourself.

If your custom rig is close to R15, consider keeping standard R15 cages instead so catalog clothing still works.

## Workflow

1. Build the custom body and its outer cage in Blender. Give the cage a clean UV layout; this layout becomes your "standard".
2. For each garment, duplicate the body's cage as the garment's inner cage (same UVs), then duplicate again and push out to make the outer cage.
3. Import body and garments; check that WrapTarget and WrapLayer were created.
4. For non-Humanoid rigs, weld garments in a script at equip time.

## Original equip helper for a non-Humanoid rig

```lua
-- Clones a clothing MeshPart (with its WrapLayer) onto a custom rig part.
local function equipLayer(rigPart: BasePart, clothingTemplate: MeshPart, order: number)
	local clothing = clothingTemplate:Clone()
	local wrap = clothing:FindFirstChildOfClass("WrapLayer")
	if wrap then
		wrap.Order = order
	end
	clothing.CFrame = rigPart.CFrame
	clothing.Anchored = false
	clothing.CanCollide = false
	clothing.Massless = true

	local weld = Instance.new("Weld")
	weld.Part0 = clothing
	weld.Part1 = rigPart
	weld.C0 = CFrame.new()
	weld.C1 = CFrame.new()
	weld.Parent = clothing

	clothing.Parent = rigPart.Parent
	return clothing
end
```

The weld follows the doc's guidance (Part0 is the accessory, Part1 the parent part). Test deformation in a playtest; the wrap solves after the clothing is parented into the same model as the target.

## Credits

- Roblox Creator Docs: *Character appearance* (layered accessories on non-R15 section), *Cage meshes*, WrapLayer reference (CC BY 4.0). Code is original.
- DevForum topic 2933016 (block-rig layered clothing question).

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Layered Clothing Explained - Cages, WrapLayer and WrapTarget]] · [[R6 vs R15 vs Custom Rigs - Choosing a Character Rig]] · [[Cage meshes]] · [[Character Materials, Rigging and Layering]]

<!-- TDOD_GRAPH_END -->
