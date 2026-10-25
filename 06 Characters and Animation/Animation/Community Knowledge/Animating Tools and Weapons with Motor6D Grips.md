---
area: "06 Characters and Animation"
cluster: "Animation"
title: "Animating Tools and Weapons with Motor6D Grips"
tags: [roblox, community-knowledge, animation, tools, weapons, motor6d]
cssclasses: [tg-a06]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/reference/engine/classes/Tool
  - https://create.roblox.com/docs/reference/engine/classes/Motor6D
  - https://devforum.roblox.com/t/how-to-animate-tool-parts-guns-knifes-etc/359484
  - https://devforum.roblox.com/t/how-to-animate-tools/591525
  - https://devforum.roblox.com/t/how-to-create-tools-and-animate-them-tutorial/1381513
---
# Animating Tools and Weapons with Motor6D Grips

A default `Tool` is attached to the hand by a `Weld` named `RightGrip`, built from the tool's `Grip` CFrame. A weld cannot be animated, so swords cannot flip in the hand, guns cannot tilt during reloads and magazines cannot drop out. The well-known DevForum fix (Headstackk's 2019 tutorial, updated 2022) replaces that weld with a `Motor6D`, which the `Animator` can drive like any other joint.

## Setup in four steps

1. **Weld the weapon's parts** to one root part (commonly named `BodyAttach` or `Handle`). Moving pieces (magazine, slide, bolt) get their own `Motor6D` from that root instead of a weld.
2. **Disable the default grip.** Either set `Tool.RequiresHandle = false` and have no part named `Handle`, or delete the `RightGrip` weld when the tool is equipped.
3. **Create a `Motor6D` on equip**: `Part0 = RightHand` (R15) or `Right Arm` (R6), `Part1 = BodyAttach`. Name it consistently, e.g. `ToolGrip`.
4. **Animate in the editor** with a dummy that has the same `Motor6D` and the weapon attached. The joint now appears as a track you can key.

```lua
-- Server script inside the Tool
local tool = script.Parent
tool.Equipped:Connect(function()
	local character = tool.Parent
	local hand = character:FindFirstChild("RightHand") or character:FindFirstChild("Right Arm")
	local grip = Instance.new("Motor6D")
	grip.Name = "ToolGrip"
	grip.Part0 = hand
	grip.Part1 = tool.BodyAttach
	grip.Parent = hand
end)
tool.Unequipped:Connect(function()
	-- the tool is already back in the Backpack here; remove any grip still pointing at it
	for _, joint in tool.BodyAttach:GetJoints() do
		if joint.Name == "ToolGrip" then joint:Destroy() end
	end
end)
```

Why create it on equip: a `Motor6D` whose parts are in different parents breaks when the tool moves back to the Backpack, and a frequent forum report ("my Motor6D disappears after a few seconds") is a grip that was built once and never rebuilt.

## The name must match

Animations target joints **by name and by the parts' names**. If the editor rig used `ToolGrip` from `RightHand` to `BodyAttach`, the live character must have exactly that. Rename the weapon root in one gun and the animation silently stops moving it.

## Where to create the grip

- **Server:** everyone sees the same attachment; slight delay on equip. Best default.
- **Client:** instant, but other players only see it if the server also has one. Some frameworks build it on both and let the server's replicate.

## Multiple weapons, one animation set

Keep the same root name and the same grip offset for every weapon in a class (all rifles hold at the same point). Then one "rifle reload" set works across the class, and you only author per-weapon clips for special parts like a unique bolt.

## Pitfalls

- **Weapon offset jumps on equip:** the editor dummy had a different `C0`/`C1`. Copy the exact `C0`/`C1` from the editor rig into the script.
- **Two-handed holds:** add an `IKControl` from the left arm to a grip attachment on the weapon instead of keying the left hand everywhere.
- **Massless parts:** set weapon parts `Massless = true` so a heavy gun does not tilt the character.
- **Hitboxes:** do not use the animated blade's `Touched`; cast from attachments on the blade during the active window.

## Related
[[Animation - Hub]] · [[First-Person Viewmodels - Arms Rig, Camera Binding and Sway]] · [[IKControl Recipes - Foot Planting, Aiming and Look-At]] · [[Tactical Character and Equipment Pipeline]]
