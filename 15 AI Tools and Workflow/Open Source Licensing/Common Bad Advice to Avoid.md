---
area: "15 AI Tools and Workflow"
cluster: "Open Source Licensing"
source_note: "12_Resources_Principles_Roadmap/49_COMMON_BAD_ADVICE_TO_AVOID"
title: "COMMON BAD ADVICE TO AVOID"
tags: [roblox, tdod-vault, reference, "cluster/open-source-licensing"]
status: verified-baseline
cssclasses: [tg-a15]
---

# COMMON BAD ADVICE TO AVOID

=================================================

BAD:
"Put everything in one Script."
GOOD:
Separate systems by responsibility.

BAD:
"Use RenderStepped for everything."
GOOD:
Use frame callbacks only when frame-level work is required.

BAD:
"Fire RemoteEvent every frame."
GOOD:
Send state changes / lower-frequency data.

BAD:
"Preload the whole game."
GOOD:
Preload essential startup assets.

BAD:
"High poly = professional."
GOOD:
Appropriate geometry + materials + silhouette + animation = professional.

BAD:
"4K every texture."
GOOD:
Use resolution appropriate to screen size and reuse.

BAD:
"AI generated = game ready."
GOOD:
AI output needs inspection, cleanup, licensing/policy checks, optimization, and testing.

BAD:
"More particles = better VFX."
GOOD:
Timing, motion, shape, contrast, sound, and readability matter more.

BAD:
"Client anti-cheat protects the game."
GOOD:
Server authority and validation are the foundation.

BAD:
"Clone RDR2 graphics."
GOOD:
Study principles and adapt them to Roblox constraints/style.

BAD:
"One huge chat should remember everything."
GOOD:
Keep durable project knowledge in files and use focused sessions.

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Open Source Licensing - Hub]]

**Related notes:** [[IP, Licensing and Asset Due Diligence]] · [[Open-source and Learning Resources]] · [[Research Sources]] · [[Verified Official Sources — October 2026]]

<!-- TDOD_GRAPH_END -->
