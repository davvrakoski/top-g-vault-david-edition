---
area: "14 Testing and QA"
cluster: "Testing"
source_note: "11_Prompts_Debugging_Release_Community/43_DEBUGGING_PLAYBOOK"
title: "DEBUGGING PLAYBOOK"
tags: [roblox, tdod-vault, reference, "cluster/testing"]
status: verified-baseline
cssclasses: [tg-a14]
---

# DEBUGGING PLAYBOOK

=================================================

WHEN SOMETHING BREAKS:

STEP 1: REPRODUCE
Write exact steps.

STEP 2: REDUCE
Remove unrelated systems until minimal failing case is known.

STEP 3: OBSERVE
Logs.
State values.
Object existence.
Remote calls.
Timing.
Positions.
Animation state.

STEP 4: CLASSIFY
Logic?
State?
Replication?
Timing?
Physics?
Streaming?
Asset?
Permission?
Data?
UI?
Performance?

STEP 5: TRACE
Who writes the bad value?
Who reads it?
What event fires first?

STEP 6: FIX ROOT CAUSE
Do not add random waits unless timing truly requires them.

STEP 7: REGRESSION TEST
Test normal case + edge cases.

VISUAL BUGS:
- normals
- z-fighting
- texture UV
- transparency
- material order
- lighting
- mesh scale
- attachment orientation
- streamed object absent
- camera clipping

ANIMATION BUGS:
- wrong rig
- wrong priority
- track never stops
- marker wrong
- speed mismatch
- root motion assumption
- Motor6D overridden
- state conflict

NETWORK BUGS:
- server/client disagree
- client assumes object exists
- remote arrives before local state
- repeated remote
- ownership changes

=================================================

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Testing - Hub]]

**Related notes:** [[Pre-Release Gate]] · [[Testing and QA]] · [[Thumbnail A - B Test Interpretation]] · [[Full Test Matrix]]

<!-- TDOD_GRAPH_END -->
