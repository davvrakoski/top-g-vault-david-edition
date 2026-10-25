---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Environmental Storytelling - What Happened Here"
tags: [roblox, community-knowledge, story, level-design, horror, narrative]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://gdcvault.com/play/1012647/What-Happened-Here-Environmental
  - https://niemanstoryboard.org/2011/01/14/harvey-smith-on-environmental-storytelling-and-embedding-narrative/
  - https://gamedev.net/blogs/entry/2110758-gdc-2010-day-5
  - https://create.roblox.com/docs/resources/beyond-the-dark
---
# Environmental Storytelling - What Happened Here

Roblox players skip text. Many are young, many play on phones, and most cutscenes get skipped. Story that lives **in the space itself** (a barricaded door, a trail of dropped items, a half-eaten meal) is read in a glance and works in every language. The best-known framework is the GDC 2010 talk *What Happened Here? Environmental Storytelling* by Harvey Smith (Arkane) and Matthias Worch (LucasArts).

## The core idea

The player is an **interpreter**. You place clues; they assemble the event. Coverage of the talk compares it to Scott McCloud's point about comics: the strongest content sits in the gap between panels, which the reader fills in. A scene the player decodes feels like their discovery, and that sticks better than a dialogue box.

The talk also covers **systemic** storytelling: the game's own systems react and leave marks (bullet holes, scorch marks, moved props), so players write story through play.

## A clue recipe you can build in Studio

For each "story beat" room, place three layers:

1. **The anchor** - one obvious focal object lit or framed to be seen first (a broken window with light pouring in).
2. **Supporting evidence** - 3-5 props that explain cause and sequence (glass on the inside floor = something came in; muddy footprints to a closet).
3. **The question** - one detail that does not fit and pulls the player onward (the closet is locked from the inside).

Rules of thumb:

- **Cause -> effect direction must be readable.** Debris falls away from impact; footprints point where they went.
- **Contrast draws the eye.** Use light, color and the only clean object in a dirty room. (See the map-area notes on guiding with light.)
- **Keep text optional.** A note or sign can confirm the reading but should not be required to understand it.
- **Repeat motifs.** A symbol seen three times in different rooms becomes the "villain" without a single line.

## Roblox-specific tips

- **Streaming:** with `StreamingEnabled`, small clue props far from the player may not be streamed yet. Group a story scene in a `Model` with `ModelStreamingMode = Atomic` so the whole scene appears together.
- **Multiplayer:** five players see the scene at once and one will spoil it in chat. Design scenes that reward looking closer (small extra details) so a spoiled headline still leaves something to find.
- **Systemic marks:** decals for damage, persistent ragdolls or dropped tools are cheap ways to let players' own fights become set dressing. Cap counts for performance.
- **Horror:** environmental beats are your pacing tool. A quiet "what happened" room before a chase sets dread; the official *Beyond the Dark* showcase is a useful reference for atmosphere.

## Checklist for one story room

- [ ] One-sentence event written down ("the cook fled when the freezer door opened").
- [ ] Anchor visible from the doorway.
- [ ] Evidence shows order of events.
- [ ] One open question leads to the next room.
- [ ] Playtested: a tester who skipped all text can tell you roughly what happened.

## Related
[[Story Quests Cinematics - Hub]] - [[Cinematic and Cutscene Direction]] - [[Horror Starter Architecture]] - [[Horror Map Design - Pacing, Loops and Readable Darkness]]
