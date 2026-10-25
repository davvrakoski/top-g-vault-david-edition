---
area: "06 Characters and Animation"
cluster: "Characters Customization"
title: "Team Uniforms and Skin Tones by Script - Shirt, Pants and BodyColors"
tags: [roblox, community-knowledge, characters, clothing, teams, bodycolors]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/avatar/classic-clothing
  - https://create.roblox.com/docs/reference/engine/classes/Shirt
  - https://create.roblox.com/docs/reference/engine/classes/Clothing
  - https://create.roblox.com/docs/reference/engine/classes/BodyColors
  - https://create.roblox.com/docs/reference/engine/classes/HumanoidDescription
---
# Team Uniforms and Skin Tones by Script - Shirt, Pants and BodyColors

Police vs criminals, red vs blue, prisoners in orange: team games usually need to force a uniform while still letting players keep their face and body. Classic `Shirt` and `Pants` images are still the cheapest way to do it: one texture each, no extra geometry, and they work on R6 and R15. The hard part is dealing with the player's own layered clothing and body colours on top.

## Two ways to apply a uniform

| Method | How | Good for |
| --- | --- | --- |
| **Edit the instances** | Find or create `Shirt` / `Pants` in the character, set `ShirtTemplate` / `PantsTemplate` | Fast swaps mid-round, no rebuild |
| **Edit a HumanoidDescription** | Get `GetAppliedDescription()`, set `.Shirt` / `.Pants` asset IDs, apply with `ApplyDescriptionAsync` | Clean rebuild, also strips/keeps accessories in one pass |

The instance method:

```lua
local function setUniform(character: Model, shirtId: number, pantsId: number)
	local shirt = character:FindFirstChildOfClass("Shirt") or Instance.new("Shirt")
	shirt.ShirtTemplate = "rbxassetid://" .. shirtId
	shirt.Parent = character
	local pants = character:FindFirstChildOfClass("Pants") or Instance.new("Pants")
	pants.PantsTemplate = "rbxassetid://" .. pantsId
	pants.Parent = character
end
```

Note: `ShirtTemplate` wants the **image** ID behind the clothing item, not the catalog clothing ID. When you upload a shirt, Roblox creates both; using the wrong one shows nothing. The description method takes the catalog clothing asset ID instead.

## One uniform, many teams: tint it

`Clothing.Color3` (on `Shirt` and `Pants`) multiplies the template. Paint the uniform in light greys, then tint per team: `shirt.Color3 = team.TeamColor.Color`. One upload covers every team.

## Layered clothing hides classic clothing

A player wearing a 3D jacket will cover your classic uniform. For a strict uniform:

1. Get the applied description.
2. Read `HumanoidDescription:GetAccessories(true)`, drop entries where `IsLayered` is true (keep hair and hats if you like), and write the rest back with `SetAccessories(list, true)`. Passing `true` means rigid items in the list are kept too; any entry without an `Order` is treated as rigid.
3. Set `Shirt`, `Pants`, then `ApplyDescriptionAsync`.

## Skin tones and BodyColors

- Each R15/R6 character has a `BodyColors` instance with `HeadColor3`, `TorsoColor3`, `LeftArmColor3`, `RightArmColor3`, `LeftLegColor3`, `RightLegColor3`.
- For a zombie or alien team, set all six to the team colour. For a "keep your skin" uniform, do not touch it.
- Through a description, use the matching `HeadColor`, `TorsoColor` etc. properties so the colour survives the next rebuild.

## Template facts

- The official shirt/pants template (download from the Classic clothing page) maps regions of 128×128 (front/back), 64×128 (sides), 128×64 (top/bottom) and 64×64 (limb ends).
- Paint a seam-safe margin; details that cross joints (shoes, belts) bend oddly at the hips and knees.
- Test on a **Block** rig first (Avatar tab > Character), then on a few real avatars including tall Rthro bodies, where classic clothing stretches.

## Pitfalls

- **Uniform lost on respawn:** apply on every `CharacterAdded`, after `CharacterAppearanceLoaded` if you rely on the player's description being finished.
- **Client-side swaps** are visible only to that player; always apply on the server.
- **Upload moderation:** clothing images go through moderation like any image; avoid text and logos you do not own.

## Related
[[Characters Customization - Hub]] · [[HumanoidDescription Recipes - Async APIs and Safe Apply Order]] · [[Avatar Settings vs Scripts - Who Controls the Player Avatar]] · [[Accessories by Script - AddAccessory, Attachment Names and Game Gear]]
