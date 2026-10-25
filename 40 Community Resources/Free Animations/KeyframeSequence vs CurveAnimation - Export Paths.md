---
area: "40 Community Resources"
cluster: "Free Animations"
source_note: "community/free-animations/keyframesequence-vs-curveanimation"
title: "KeyframeSequence vs CurveAnimation - Export Paths"
tags: [roblox, community, animation, free-assets, "cluster/free-animations"]
verified: 2026-10-25
license: "original summary + original Luau"
sources:
  - https://create.roblox.com/docs/animation/editor
  - https://create.roblox.com/docs/avatar/emotes/import
  - https://create.roblox.com/docs/reference/engine/classes/KeyframeSequence
  - https://create.roblox.com/docs/reference/engine/classes/CurveAnimation
  - https://nilo.io/articles/export-moon-animator-animation-roblox
cssclasses: [tg-a40]
---

# KeyframeSequence vs CurveAnimation - Export Paths

> Every free animation (mocap, Mixamo, Moon, Blender) ends up as one of two **local** objects before it becomes an animation **ID**. Knowing which one you have explains most "I exported but it does nothing" posts.

## The two local formats

Object | Made by | Holds | Needed for
---|---|---|---
**KeyframeSequence** | Classic Animation Editor keyframes, Moon Animator export, Den_S Blender add-on | Poses at keyframes + easing per pose | Normal gameplay animations
**CurveAnimation** | Animation Editor's **Curve Editor** (converts on request), FBX imports | Per-channel float/rotation curves | **Emotes** (docs: emote data must be a CurveAnimation); smooth mocap with dense keys

Neither plays by itself in a live game. You must **publish** to get an asset ID and point an `Animation.AnimationId` at it.

## Where local saves live
- Animation Editor saves go to **ServerStorage > AnimSaves**. The docs warn this data does not replicate; to read a KeyframeSequence from the client (e.g. a preview tool), move it to ReplicatedStorage.
- Moon Animator 2 also uses the rig's AnimSaves (older builds: ServerStorage > MoonAnimatorSaves).

## Paths to an ID
1. **Animation Editor:** `...` > Publish to Roblox > copy the ID.
2. **Loose KeyframeSequence** (Moon, plugins): right-click > Save to Roblox.
3. **Emote for the Marketplace:** convert to CurveAnimation in the Curve Editor, publish, then Save to Roblox as an Avatar Item > Emote (the docs list an upload fee) - see [[Import emotes]].
4. **Replacing default animations:** rename the final keyframe to **End** (case-sensitive) before export, per the Animation Editor docs.

## Previewing a local sequence without uploading (Studio only, original Luau)
`KeyframeSequenceProvider:RegisterKeyframeSequence` gives a temporary ID that works **only in Studio** - handy for testing many free clips before you spend time uploading them.

```lua
-- Command bar / Studio plugin use only: preview a KeyframeSequence on a selected rig.
local KeyframeSequenceProvider = game:GetService("KeyframeSequenceProvider")
local Selection = game:GetService("Selection")

local rig = Selection:Get()[1]
local animator = rig and rig:FindFirstChildWhichIsA("Animator", true)
assert(animator, "Select a rig that has an Animator")

local animSaves = game:GetService("ServerStorage"):FindFirstChild("AnimSaves")
local sequence = animSaves and animSaves:FindFirstChildOfClass("KeyframeSequence")
assert(sequence, "No KeyframeSequence found in ServerStorage.AnimSaves")

local animation = Instance.new("Animation")
animation.AnimationId = KeyframeSequenceProvider:RegisterKeyframeSequence(sequence)
local track = animator:LoadAnimation(animation)
track:Play()
```

Temporary IDs never work in a published game - publish before shipping.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Animations - Hub]]

**Related notes:** [[KeyframeSequence]] · [[CurveAnimation]] · [[Curve Editor]] · [[Animation Editor]] · [[Animation Markers for Hit Frames, Footsteps and Sync]]

<!-- TDOD_GRAPH_END -->
