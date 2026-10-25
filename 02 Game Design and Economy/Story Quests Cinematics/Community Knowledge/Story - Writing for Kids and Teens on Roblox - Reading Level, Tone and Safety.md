---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Writing for Kids and Teens on Roblox - Reading Level, Tone and Safety"
tags: [roblox, community-knowledge, story, writing, audience, accessibility, text-filtering]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://gameaccessibilityguidelines.com/use-simple-clear-language/
  - https://about.roblox.com/community-standards
  - https://create.roblox.com/docs/production/promotion/content-maturity
  - https://create.roblox.com/docs/ui/text-filtering
  - https://www.gamedeveloper.com/design/narrative-tips-for-mobile-games
---
# Writing for Kids and Teens on Roblox - Reading Level, Tone and Safety

A large share of Roblox players are children and young teens, many play on phones, and many read the game in a second language through auto-translation. Writing that works for adult PC players (long dialogue, clever wordplay, slow reveals) often fails here: it is skipped, misread, or translated into nonsense. Writing for this audience is not "writing down". It is writing **short, concrete and visual**, staying inside platform rules, and never relying on text alone for something the player must know.

## Reading level: short and plain

The Game Accessibility Guidelines list **"use simple clear language"** as a basic guideline and note that about **14% of adults in the US and UK have a reading age below 11**. Young players are below that by definition. Their example: "Click below to save your character" instead of "If you click below your chosen character preferences will be saved". They also warn against oversimplifying: text should still be well written.

Practical targets (house rules, not platform rules):

- **Dialogue lines: 6-15 words.** One idea per line.
- **Objectives: verb + object** ("Find the red key"). Under 6 words.
- **Notes and lore: 40-80 words** ([[Story - Lore Drip - Notes, Tapes and Collectibles That Players Read]]).
- Common words over rare ones: "scared" not "apprehensive", "broken" not "dilapidated".
- No idioms or puns in critical text; they do not survive translation.
- Repeat important facts in different words. A 2015 Game Developer piece on Christy Marx's mobile narrative work recommends exactly this because players take in story in small pieces.

## Show it, then say it

- Every critical instruction also has a **visual or audio** form: a glowing door, an arrow, a sound from the right room.
- Character mood shows in **animation and face** before the text arrives.
- Keep story beats readable with **sound off** (captions on by default, see [[Subtitles and Captions - Readable Defaults for Roblox]]).

## Tone that lands with 9-15 year olds

- **Characters with one clear want** ("get my brother back"), shown early.
- **Humour** breaks tension and makes horror bearable; a comic-relief NPC is common in Roblox horror for a reason.
- **Agency over lectures.** Let players choose, then show consequences; avoid moralising text.
- **Scary is fine; cruel is not.** Threat, chases and creepy design fit a Mild fear label; graphic suffering and realistic wounds push the label up ([[Story - Jump Scares, Flashing and Maturity Labels - Ethical Horror on Roblox]]).

## Platform rules to write inside

Roblox's Community Standards (about.roblox.com) prohibit, among other things:

- recreating **real-world sensitive events** (tragedies, attacks), mocking victims or glorifying perpetrators;
- content that **depicts, glorifies or promotes suicide or self-harm**;
- **discrimination** against protected groups;
- **romantic or sexual** content in general (the maturity system only allows limited romantic themes at the Restricted label; check the current standards before writing any).

For story writers this means: no school-shooting or real-disaster plots, no suicide as a plot device, no romance arcs in all-ages games, and villains whose evil is not tied to a real group.

## Player-written text in stories

If players can name a character, write a sign, or type a reply that others see, the text must go through `TextService:FilterStringAsync()` and the right result method. The text filtering docs use `GetNonChatStringForBroadcastAsync()` for text shown to everyone (a sign) and point out that stored text (a pet name in a DataStore) must be filtered when shown again. Prefer **pick-from-list** names and replies in story games; it avoids filtering entirely and translates.

## Localization from day one

- Every line is a **key** in a `LocalizationTable`, never a hard-coded string ([[Translator API in Luau - FormatByKey, Parameters and Fallbacks]]).
- Leave **30-40% extra space** in text boxes; many languages run longer than English.
- Avoid text baked into textures (signs, posters) for anything important.

## Review checklist for a chapter script

- [ ] Every critical instruction has a non-text form.
- [ ] No dialogue line over ~15 words.
- [ ] No idioms in objectives or hints.
- [ ] Nothing based on a real tragedy, self-harm or a real group.
- [ ] Player-entered text is filtered or replaced by choices.
- [ ] Read aloud by someone in the target age range. If they stumble, rewrite.

## Related
[[Story Quests Cinematics - Hub]] · [[Dialogue Trees as Data - Nodes, Conditions and Effects]] · [[Roblox Kids and Select - Reaching Players Under 16 in 2026]] · [[NPC Conversation UX - Prompts, Typewriter Text and Skipping]]
