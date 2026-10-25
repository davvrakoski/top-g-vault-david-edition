---
area: "10 3D Art and Materials"
cluster: "3D Modeling Blender"
source_note: "25_Legendary_Production_Layer/25_Art_Content_Pipeline"
title: "Art Content Pipeline"
tags: ["roblox", "legendary", "production", "cluster/3d-modeling-blender"]
verified: 2026-10-25
cssclasses: [tg-a10]
---

# Art Content Pipeline

## Mission
A repeatable asset pipeline from reference and blockout through Blender/AI tools, PBR, rigging, import, LOD and QA.

## Architecture / ownership
- art brief.
- scale/silhouette target.
- topology/UV/material standard.
- naming/collection convention.
- collision strategy.
- rig contract.
- import preset.
- LOD/quality tier.

## Recommended build order
1. Block out in Studio first for gameplay scale.
2. author hero detail only where visible.
3. use PBR maps intentionally.
4. clean AI-generated geometry before rigging.
5. test deformation.
6. test actual Roblox lighting and camera distance.

## Production rule
Build the smallest vertical slice that proves the system before adding content volume. Keep authoritative state, presentation state, and configuration separate. If another system needs information, expose a narrow API or event rather than letting it mutate internal tables.

## Failure modes to design out
- **Beautiful render but wrong gameplay scale**.
- **4K textures on tiny props**.
- **Hidden duplicate geometry**.
- **Bad normals**.
- **Unlicensed reference copied directly**.
- **One unique material per tiny prop**.

## Performance and scale pass
- Identify what runs per-frame, per-player, per-NPC, per-instance, per-transaction, and only-on-change. The multiplicative category is usually the risk.
- Add distance, visibility, sleep, batching, caching, pooling, streaming, or lower-frequency updates only where they preserve correctness.
- Keep cosmetic work on clients when the server only needs the gameplay result.
- Profile the worst realistic scenario, not an empty test place.

## Security and data pass
- Treat client payloads as requests, not truth.
- Validate types, ranges, ownership, state, permissions, rate, and duplicate/replay behavior when relevant.
- For persistent or paid outcomes, design the operation so retrying it does not duplicate rewards.

## Test gates
- [ ] wireframe inspection.
- [ ] UV seam check.
- [ ] extreme pose.
- [ ] mobile memory test.
- [ ] LOD silhouette comparison.
- [ ] collision traversal.
- [ ] A failure path produces a useful log instead of silently corrupting state.
- [ ] A new developer can identify the owner module and expected data flow.

## AI handoff prompt
```text
Inspect the existing project before implementing this system. Map the current owners of state, remotes, saved data, UI and presentation. Do not replace working architecture blindly. Propose the smallest compatible design, list files/dependencies, identify security/performance risks, then implement one testable vertical slice. Report tests actually run and update RESUME_NOTE.md.
```

## Knowledge graph connections

**Primary cluster:** [[3D Modeling Blender - Hub|3D Modeling Blender]]

**Related:** [[Legendary Production Hub]]
