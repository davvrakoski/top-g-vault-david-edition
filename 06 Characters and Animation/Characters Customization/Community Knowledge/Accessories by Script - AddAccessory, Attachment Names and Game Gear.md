---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "Accessories by Script - AddAccessory, Attachment Names and Game Gear"
tags: [roblox, community-knowledge, characters, accessories, attachments, equipment]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Humanoid
  - https://create.roblox.com/docs/reference/engine/classes/Accessory
  - https://create.roblox.com/docs/reference/engine/enums/AccessoryType
  - https://create.roblox.com/docs/avatar/rigid-accessories/specifications
  - https://create.roblox.com/docs/avatar/character-bodies/specifications
---
# Accessories by Script - AddAccessory, Attachment Names and Game Gear

Helmets, backpacks, armour plates, quest hats and team badges are the bread and butter of character customization, and most of them should be plain `Accessory` instances added from the server. Using the accessory system (instead of welding random parts) means the item scales with the avatar, follows animations, survives `HumanoidDescription` changes predictably and can be removed in one call.

## How AddAccessory finds its spot

`Humanoid:AddAccessory(accessory)` looks inside the accessory's `Handle` for an `Attachment`, then searches the character for an `Attachment` **with the same name**. When found, the handle is welded so the two attachments line up. If no match exists, the accessory is parented to the character but not attached (it falls or floats). The name is the whole contract.

## R15 attachment names to use

| Body area | Attachment name (on the character) |
| --- | --- |
| Top of head | `HatAttachment` |
| Hair | `HairAttachment` |
| Face, front | `FaceFrontAttachment` |
| Face, centre (glasses) | `FaceCenterAttachment` |
| Neck | `NeckAttachment` |
| Chest, front | `BodyFrontAttachment` |
| Back (backpacks, capes) | `BodyBackAttachment` |
| Collars / shoulders | `LeftCollarAttachment`, `RightCollarAttachment`, `LeftShoulderAttachment`, `RightShoulderAttachment` |
| Waist | `WaistFrontAttachment`, `WaistCenterAttachment`, `WaistBackAttachment` |

Names come from the avatar body and rigid accessory specifications. Check your rig in the Explorer: custom StarterCharacters often miss some of them, and then accessories silently fail.

## Building gear for your game

1. Model the item, import as a MeshPart, rename it `Handle`.
2. Put it in an `Accessory`; set `AccessoryType` (Hat, Back, Front, Waist, Shoulder...).
3. Add an `Attachment` to the Handle named after the target (e.g. `BodyBackAttachment`), and move it until the item sits right on a default R15 dummy.
4. Set the handle `CanCollide = false`, `CanQuery = false`, `CanTouch = false`, `Massless = true`.
5. Store in `ServerStorage`, clone and add on the server:

```lua
local function giveGear(character: Model, gearName: string)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local template = ServerStorage.Gear:FindFirstChild(gearName)
	if humanoid and template then
		local item = template:Clone()
		item:SetAttribute("GameGear", true) -- so you can remove only your items later
		humanoid:AddAccessory(item)
	end
end
```

## Removing items

- `Humanoid:RemoveAccessories()` removes **all** accessories, including the player's own avatar items.
- To remove only game gear, loop `Humanoid:GetAccessories()` and destroy items with your `GameGear` attribute.

## Interaction with HumanoidDescription

`ApplyDescriptionAsync` rebuilds the avatar from the description; accessories you added by script that are not in the description may be removed. Re-apply game gear after any description change (listen to `Humanoid.ApplyDescriptionFinished`).

## Hiding avatar items under gear

A full helmet over a big hairstyle clips badly. Common fixes:

- Set `Transparency = 1` (or destroy) on accessories with `AccessoryType` Hair or Hat while the helmet is worn.
- Or force a game-wide look by applying a description without hats.

## Pitfalls

- **Created on the client:** client-side `AddAccessory` may not weld as expected; the docs suggest `BuildRigFromAttachments()` in that case. Prefer the server.
- **Scaling:** accessories scale with body scale values on R15; test on tall and small avatars.
- **Heavy handles:** forgetting `Massless` makes characters lean or slide.
- **Physics cost:** each accessory is another part; crowd NPCs should wear few.

## Related
[[Characters Customization - Hub]] · [[Tactical Character and Equipment Pipeline]] · [[HumanoidDescription Recipes - Async APIs and Safe Apply Order]] · [[StarterCharacter Setup Checklist]]
