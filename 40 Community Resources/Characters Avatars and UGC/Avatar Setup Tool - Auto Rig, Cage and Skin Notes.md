---
area: "40 Community Resources"
cluster: "Characters Avatars and UGC"
source_note: "community/characters-ugc/avatar-setup-tool-notes"
title: "Avatar Setup Tool - Auto Rig, Cage and Skin Notes"
tags: [roblox, community, "cluster/characters-avatars-and-ugc", avatar-setup, ugc, studio-tools]
cssclasses: [tg-a40]
verified: 2026-10-25
sources:
  - https://create.roblox.com/docs/avatar-setup
  - https://devforum.roblox.com/t/avatar-auto-setup-beta-release/2960683
  - https://devforum.roblox.com/t/avatar-auto-setup-alpha/2880686
  - https://about.roblox.com/newsroom/2024/03/roblox-introduces-ai-powered-avatar-and-texturing-technologies-to-accelerate-3d-creation
---
# Avatar Setup Tool - Auto Rig, Cage and Skin Notes

**Avatar Setup** (Avatar tab in Studio) turns a plain character mesh into a full avatar: it can rig, skin, generate the face rig and FACS poses, cage, split into 15 parts and add attachments. It started as "Avatar Auto Setup", announced at GDC in March 2024, went to open beta (with Marketplace publishing) in October 2024, and the docs now treat it as the standard path.

## Quick workflow

1. Import your `.fbx`, `.obj` or `.gltf` with **Upload To Roblox** off.
2. Select the model (or specific meshes), then Avatar tab, **Avatar Setup**.
3. Configure, optionally open the gear icon for special settings, click **Set Up**.
4. Use **Check Body** and **Check Face** to try clothing, accessories, animations and makeup; add test items from the project or by asset ID; reorder layered items.
5. Fix small issues with the **Attachment Tool** and **Cage Brush**. Big cage edits still need a trip back to Blender.
6. Test in experience, then publish from the same window if you meet Marketplace requirements.

Imported models go to moderation; the docs mention an appeal path that can take a few minutes.

## Community notes from the beta thread

From replies on the Roblox staff announcement (credits below):

- A single full-body mesh was enough for some users; the tool partitions it.
- Classic accessories sometimes landed in odd spots or looked small; users asked for in-tool attachment adjustment (the Attachment Tool now covers part of this).
- Requests for finger rigging (important for FPS games), a static classic-head option, and 2D clothing support.
- Users noted uploaded models cannot be deleted, so keep "Upload To Roblox" off while iterating.
- The staff post said the model was trained on Roblox-created avatars and could produce geometry artifacts. Always inspect the result.

## When to use it vs manual Blender work

| Use Avatar Setup | Do it in Blender |
| --- | --- |
| Fast UGC body or head drafts | Hero characters with custom deformation |
| Getting a valid face rig without FACS experience | Precise facial expressions for a brand |
| Generating standard cages | Advanced R15 hands and spine |
| Learning what a valid avatar looks like | Anything the tool keeps getting wrong |

Hybrid is common: run Avatar Setup, inspect the output, then fix weights or cages in Blender and re-import.

## Credits

- Roblox Creator Docs, *Avatar Setup* (CC BY 4.0).
- DevForum *Avatar Auto Setup [Beta Release]* (Roblox staff, update by HaloArbiter_101) with community replies by Devlalal, IdontPlayz343, KaranBlox, AshCr4ft and Playfullgamer_YT; *Avatar Auto Setup [Alpha]*.
- Roblox Newsroom, March 2024 AI tools announcement.

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Characters Avatars and UGC - Hub]]

**Related notes:** [[Avatar Setup]] · [[Avatar Body from Blender - Part Names, Attachments and FBX Export]] · [[Dynamic Heads for Game Developers - FACS, FaceControls and Moods]] · [[UGC Validation Failures - Triage by Error Type]] · [[Built-in Studio Tools That Replace Old Plugins]]

<!-- TDOD_GRAPH_END -->
