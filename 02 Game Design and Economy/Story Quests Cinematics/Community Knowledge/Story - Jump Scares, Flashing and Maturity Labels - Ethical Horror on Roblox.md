---
area: "02 Game Design and Economy"
cluster: "Story Quests Cinematics"
title: "Jump Scares, Flashing and Maturity Labels - Ethical Horror on Roblox"
tags: [roblox, community-knowledge, story, horror, accessibility, maturity, photosensitivity]
cssclasses: [tg-a02]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/promotion/content-maturity
  - https://gameaccessibilityguidelines.com/avoid-flickering-images-and-repetitive-patterns/
  - https://www.w3.org/WAI/WCAG21/Understanding/three-flashes.html
  - https://www.gamedeveloper.com/design/the-time-and-place-for-jump-scares-according-to-horror-devs
---
# Jump Scares, Flashing and Maturity Labels - Ethical Horror on Roblox

Roblox horror is played by a very young audience on every kind of screen, often with headphones. A scare that is fun for a teen on a PC can be harmful when it is a strobing red flash on a phone held close to the face, or a sting 15 dB louder than the rest of the game. "Ethical horror" here means three practical things: **scare people, do not hurt them**; **label honestly** so the right ages find the game; and **give players control** over the parts that cause real harm (flashing, loudness, intensity). None of this makes a game less scary. Dread comes from build-up, which these rules do not touch.

## 1. Label the fear honestly

The Roblox content maturity questionnaire asks whether the game has scary elements that may trigger fear, then asks for **intensity** (Mild or Moderate) and **frequency** (Occasional or Repeated). The official examples for **Mild** fear include heavy breathing, a pounding heart, screaming, creepy NPCs, **jump scares**, ominous music and suspense. **Moderate** fear examples are realistic gore on faces and bodies (exposed tissue, bleeding eyes with realistic blood). The resulting label decides who can see the game: Minimal and Mild reach Roblox Kids (5-8) and Select (9-15); Moderate reaches Select and 16+. Full walkthrough: [[Maturity Questionnaire Walkthrough - Common Genre Answers]].

Design consequence: **most chase-and-hide horror fits Mild** if the monster design avoids realistic wounds. Decide the target label *before* the art pass, because one gory monster texture moves the whole game up a tier.

## 2. Flashing and patterns (photosensitivity)

The Game Accessibility Guidelines list these common seizure triggers:

- more than **3 flashes in any one second** covering 25% or more of the screen;
- any flashing sequence longer than **5 seconds**;
- moving repeated high-contrast patterns over 25% of the screen (static ones over 40%);
- sudden large brightness changes and **changes to or from saturated red** count as flashes.

WCAG 2.3.1 uses the same three-flash rule. Horror games break these all the time with strobing lights and red alarm flashes.

Safer equivalents:

| Instead of | Use |
|---|---|
| Strobe light at 8 Hz | Irregular flicker at 1-2 changes per second, small area |
| Full-screen white flash on a scare | Quick vignette or slight exposure dip (`ColorCorrectionEffect.Brightness` -0.1 over 0.15 s) |
| Red full-screen pulse on damage | Edge-only red tint, or desaturation |
| Lightning every few seconds | One flash, then darkness for 20+ s |

Add a setting named after what it does, such as **"Screen flash effects: On / Reduced / Off"**. The guidelines specifically say never to call a setting "epilepsy safe", because no setting can guarantee that.

```lua
-- client: one place every flash goes through
local function flash(intensity)
	local mode = player:GetAttribute("FlashMode") or "On"
	if mode == "Off" then return end
	if mode == "Reduced" then intensity *= 0.3 end
	local cc = game.Lighting.ScareCC -- a ColorCorrectionEffect
	cc.Brightness = intensity
	TweenService:Create(cc, TweenInfo.new(0.4), {Brightness = 0}):Play()
end
```

## 3. Loudness

- Keep jump-scare stings at or below the loudest normal game sound. Make them *feel* loud by **dropping everything else** first (a ducking dip), not by raising the sting.
- Route all scare audio through one `SoundGroup` (or an `AudioFader` in the Audio API) with its own volume slider labelled "Scare sounds".
- Avoid sudden very low-frequency rumbles with no warning; they read as a fault on phone speakers and as pain on headphones.

## 4. Intensity options that keep the game intact

- **Scare intensity: Full / Reduced.** Reduced swaps jump-scare faces for a shadow and a sound. The scare still happens, so the story still works.
- **Hide gore** if any exists.
- **Captions for scare sounds** ("[scraping behind you]") help deaf players and also people playing muted ([[Subtitles and Captions - Readable Defaults for Roblox]]).
- Save these settings with the player's other settings so they apply from the first scare of the next session.

## 5. Things to avoid

- Scares in the **first 30 seconds** before players have chosen settings or know it is a horror game. Put a short content note on the loading screen instead.
- Fake system messages ("Your account has been hacked") as scares. They frighten young players outside the game and can break platform rules on misleading UI (unverified for specific enforcement; avoid anyway).
- Scares that punish players for leaving (a sting on the exit button).

## Checklist

- [ ] Target label chosen; monster art reviewed against it.
- [ ] No effect flashes more than 3 times a second over a big area.
- [ ] Flash and scare-volume settings exist and persist.
- [ ] Scare stings never exceed normal peak loudness.
- [ ] Every scare sound has a caption.

## Related
[[Story Quests Cinematics - Hub]] · [[Policy - What Gets Games Taken Down - Pre-Launch Compliance Audit]] · [[Roblox Kids and Select - Reaching Players Under 16 in 2026]] · [[Horror Starter Architecture]]
