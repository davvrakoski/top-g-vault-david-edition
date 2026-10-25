---
area: "01 Start Here"
cluster: "Start Here"
title: "First Tags and Attributes - One Script for Every Kill Brick"
tags: [roblox, community-knowledge, start-here, collectionservice, attributes, tags]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/CollectionService
  - https://create.roblox.com/docs/reference/engine/classes/Instance
  - https://create.roblox.com/docs/scripting/attributes
---
# First Tags and Attributes - One Script for Every Kill Brick

Every beginner obby ends up with 80 kill bricks, each carrying its own copy of the same Script. Then you want to change the damage, and you edit 80 scripts (or miss three). **Tags** and **attributes** fix this: you mark parts with a label like `KillBrick`, store per-part settings like `Damage = 25` on the part itself, and write **one** server Script that handles them all. This is the same idea pro games call tag-driven design, at beginner size. Next step up: [[CollectionService Tag-Driven Architecture]].

## Two tools, two jobs

| Tool | What it is | Set it in Studio | Read it in code |
| --- | --- | --- | --- |
| **Tag** | A text label on an instance ("this is a KillBrick") | Properties window > **Tags** section > **+** | `CollectionService:GetTagged("KillBrick")`, `part:HasTag("KillBrick")` |
| **Attribute** | A named value on an instance (`Damage = 25`) | Properties window > **Attributes** > **+ Add Attribute** | `part:GetAttribute("Damage")` |

Both are saved with the place and replicate from server to clients.

## Step by step

1. Build your bricks. Select all of them (Ctrl-click in the Explorer, or use the Explorer search).
2. With all selected, scroll the Properties window to **Tags**, click **+**, type `KillBrick`. Every selected part gets the tag.
3. On a few special bricks, add an attribute: **+ Add Attribute**, name `Damage`, type **Number**, value `25`. Bricks without it will use a default.
4. Delete any old per-brick Scripts.
5. Add one **Script** in `ServerScriptService`:

```lua
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")

local TAG = "KillBrick"
local DEFAULT_DAMAGE = 100 -- instant kill unless the part says otherwise

local function setup(part: BasePart)
	part.Touched:Connect(function(hit)
		local humanoid = hit.Parent and hit.Parent:FindFirstChildOfClass("Humanoid")
		if not humanoid then return end
		if not Players:GetPlayerFromCharacter(hit.Parent) then return end
		local damage = part:GetAttribute("Damage") or DEFAULT_DAMAGE
		humanoid:TakeDamage(damage)
	end)
end

-- parts that already exist
for _, part in CollectionService:GetTagged(TAG) do
	setup(part)
end
-- parts added later (cloned, streamed in, loaded maps)
CollectionService:GetInstanceAddedSignal(TAG):Connect(setup)
```

Now changing `DEFAULT_DAMAGE` changes every brick, and a designer can tune any single brick by editing one attribute, no code needed.

## Why both loops matter

`GetTagged` returns only the parts that exist **right now**. Parts that appear later (a new map loaded from ServerStorage, a cloned obstacle) are caught by `GetInstanceAddedSignal`. Beginners who use only the first line find that their second map's lava "doesn't work".

## Attributes can change live

Attributes are great as switches. A brick with `Active = false` can be skipped:

```lua
if part:GetAttribute("Active") == false then return end
```

and you can react when one changes:

```lua
part:GetAttributeChangedSignal("Active"):Connect(function()
	part.Transparency = if part:GetAttribute("Active") == false then 0.7 else 0
end)
```

Turn a whole section of lava off for a round by setting the attribute from your round script.

## More things to tag

- `Coin` pickups, `Checkpoint` pads, `JumpPad` with a `Power` attribute, `Door` with a `KeyColor` attribute, `Spinner` with a `Speed` attribute.
- One Script per tag, in `ServerScriptService`, named after the tag. Your Explorer stays readable.
- Tags also work on Models: tag the model, read attributes from the model, find parts inside it.

## Pitfalls

- **Typos are silent.** `"Killbrick"` and `"KillBrick"` are different tags. Keep tag names in a constant (or in a shared config module).
- **Tagging the wrong thing.** If you tag a Model but the script expects a BasePart, `.Touched` will error. Check with `part:IsA("BasePart")`.
- **Client-added tags stay on that client.** Add gameplay tags in Studio or from server scripts.
- **Attribute types matter.** A number attribute set as text ("25") comes back as a string. Pick the right type when adding it.
- **Clean up:** if tagged parts get destroyed and re-created often, also listen to `GetInstanceRemovedSignal` and disconnect what you connected.

## Related
[[00 START HERE - Top G Vault]] · [[CollectionService Tag-Driven Architecture]] · [[First Obby in 30 Minutes]] · [[Properties and attributes]] · [[Starter - First ModuleScript and Code Organization]]
