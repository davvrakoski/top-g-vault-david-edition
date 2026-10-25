---
area: "14 Testing and QA"
cluster: "Testing"
title: "StreamingEnabled QA Pass - Forcing Stream-Out and Catching Nil Bugs"
tags: [roblox, community-knowledge, testing, streaming, streamingenabled, qa-pass]
cssclasses: [tg-a14]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/workspace/streaming
  - https://create.roblox.com/docs/reference/engine/enums/StreamOutBehavior
  - https://create.roblox.com/docs/reference/engine/enums/ModelStreamingMode
  - https://create.roblox.com/docs/reference/engine/enums/StreamingIntegrityMode
---
# StreamingEnabled QA Pass - Forcing Stream-Out and Catching Nil Bugs

Instance streaming is on by default for new places, and it makes a whole class of bugs **intermittent**: a LocalScript works when the tester stands near the shop and errors when they spawn across the map. Developers on high-end PCs rarely see stream-out at all, because content usually only streams out under memory pressure or when far outside the target radius. This pass makes streaming behaviour visible and forces the bad cases on purpose, so they show up in QA instead of in the Error Report. The coding side is in [[StreamingEnabled Gotchas and Streaming-Safe Client Code]].

## Make streaming visible

- **Streaming debug view**: in a Studio playtest press Shift+Ctrl+F3 (Shift+Cmd+F3 on Mac; Shift+F3 in a live game) to open Network Stats, then press Shift+1 repeatedly until the fourth panel, **Streaming**. Regions are coloured: red inside `StreamingMinRadius`, yellow between min and target, blue at `StreamingTargetRadius`, green beyond it.
- Temporarily raise `StarterPlayer.CameraMaxZoomDistance` (Roblox suggests about 1000) so the tester can zoom out and *see* what is loaded.
- Add the current radii and `Player.GameplayPaused` to your QA overlay.

## Make stream-out happen (test copy only)

The streaming properties on `Workspace` are not scriptable, so make a **QA copy** of the place (never ship these values):

| Property | QA value | Effect |
| --- | --- | --- |
| `StreamingTargetRadius` | Your planned minimum, or lower (for example 256) | Content farther away is not sent |
| `StreamingMinRadius` | Small (for example 64) | Less guaranteed content near the player |
| `StreamOutBehavior` | `Opportunistic` | Streams out content well outside the target radius, not only when memory is low |

Then keep `StreamingIntegrityMode` as you will ship it (Roblox recommends `PauseOutsideLoadedArea`) so you also test the pause UI.

## The route

Run with the QA copy, Output open, once on PC and once on a low-memory phone.

1. **Spawn far**: join at every spawn point, including team and checkpoint spawns. Any `nil` errors in Output from LocalScripts?
2. **Walk away and back**: from each interactable (shop, door, NPC, quest giver), walk out past the target radius, wait, return. Prompts, highlights and UI must come back.
3. **Fast travel**: server teleports within the map (`PivotTo` on the server), vehicles at top speed, falling from height. Watch for gameplay pause screens and for the server calling `RequestStreamAroundAsync` before moving the player.
4. **Remotes with instances**: anything the server sends that references a part (a target, a door) while the client does not have it streamed: does the client handle `nil`?
5. **Persistent things**: models set to `Persistent` (sent once after join, never streamed out) or `PersistentPerPlayer` must be present before `Workspace.PersistentLoaded`-dependent code runs. Check the HUD on a slow join.
6. **Atomic models**: a model set to `Atomic` should arrive whole: no car missing its wheels, no door missing its frame.
7. **Spectate and cutscenes**: camera looks at content far from the character. Does the cutscene show empty space?
8. **Rejoin mid-round** and **respawn** in a distant area.

## Static checks to pair with the route

Search LocalScripts for `workspace.` dot paths, `WaitForChild(` without a timeout on things that can stream out, and `:GetChildren()` used to count world objects (counts change as things stream). Each hit is either safe or gets a bug.

## Pass criteria

- Zero client errors in Output across the route on both devices.
- Every interactable recovers after walk-away-and-back.
- No fast-travel case leaves the player paused for more than a couple of seconds on a normal connection.
- Bugs record the spawn used, the radii values and the device.

## Related

[[Testing - Hub]] · [[StreamingEnabled Gotchas and Streaming-Safe Client Code]] · [[Streaming causes nil - missing instances]] · [[Low-End Device and Console Hardware Test Pass]]
