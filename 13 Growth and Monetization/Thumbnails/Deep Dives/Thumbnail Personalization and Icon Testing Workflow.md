---
area: "13 Growth and Monetization"
cluster: "Thumbnails"
tags: [deep-dive, roblox, thumbnails, icons, ab-testing, play-through-rate, personalization]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Thumbnail Personalization and Icon Testing Workflow

## Why this matters
Play-through rate (PTR) is one of the "most important" Home recommendation signals, and your thumbnail and icon are most of what a player sees before deciding. Roblox has a built-in tool for this, **thumbnail personalization**, that serves different thumbnails to different player groups and learns which converts best for each.
Most creators either never turn it on or misuse it (one "winner", clickbait that raises clicks and bounce). This workflow covers production, upload, measurement and policy.

> [!note] Results vary
> Roblox reports that during testing, games using thumbnail personalization averaged **+8.5%** qualified play-through rate, with some at +50%. That is Roblox's test result, not a prediction for your game.

---

## 1. Specs and limits (Creator Docs › Thumbnails, Icons)

| Item | Spec |
|---|---|
| Thumbnail image | **16:9**, ideally **1920×1080**; `.jpg`, `.gif`, `.png`, `.tga`, `.bmp`. Displayed stretched to 16:9 regardless of upload ratio |
| Personalization uploads | Keep images **under 3 MB** and at most 1920×1080 |
| Detail page media | Up to **10** images or videos |
| Video thumbnails | **3 uploads per month** quota (rejected videos still count); not supported on **Xbox, PlayStation or VR** |
| Safe zone | Avoid essential text or elements at the **bottom**; metadata such as player count can cover it |
| Icon | Square, at least **512×512**; shown as small as about **150×150**, so preview it small. **One icon per locale**; must pass moderation |
| Where to edit | Creator Dashboard › your game › **Configurations › Places** › place › **Thumbnails** (*Home Page* and *Experience Detail Page* tabs) and **Icon** on the start place |

Discovery prerequisites: **a custom thumbnail is required** to get RFY impressions at all, and mismatched metadata or "giveaway" framing reduces exposure (see [[Home Recommendations - What Roblox Documents About Discovery]]).

---

## 2. How thumbnail personalization works

- Starts only with **2 or more active** Home Page thumbnails (you can activate **2–5**).
- It shows each thumbnail to random user groups, measures **qualified play-through rate** per group, gives more impressions to each group's winner, and keeps minimal traffic on the others to keep exploring.
- **Keep multiple thumbnails active.** The docs warn against picking a single winner, because the best thumbnail changes as audiences and trends change.
- Docs recommendation: **test several new thumbnails with each major update**, then **don't change thumbnails until the next update**.

Performance table (Home Page tab, populates after a few hours): **Impressions**, **Qualified Plays**, **Average Playtime** (minutes per qualified play), **Qualified Play-Through Rate** (qualified plays ÷ impressions) and **Winning Segment**. There are also charts of impressions and QPTR by thumbnail over time.

**Read QPTR together with average playtime.** A thumbnail with high QPTR but short playtime is attracting players the game doesn't satisfy, which is what [[Thumbnail clicks but players leave]] diagnoses.

---

## 3. The production workflow (per major update)

### Step 1: Brief with hypotheses, not just "make it pop"
Write 3–5 hypotheses, each a single variable:

| # | Hypothesis | Variable |
|---|---|---|
| A | Showing the new boss sells the update | Subject |
| B | A character reacting in close-up beats a wide scene | Framing |
| C | Night lighting stands out on Home | Lighting/value |
| D | Two players co-operating attracts friend groups | Social cue |
| E | Bright saturated palette beats realistic | Colour |

### Step 2: Capture real gameplay
- Use **free camera** during a solo playtest: **Left Shift + P** toggles it (see Creator Docs › Free camera mode for controls and post-processing options).
- Build a capture place (copy of the game) with posed rigs, staged lighting and no UI. Keep it **true to the game**. The video policy forbids artificial visuals, and mismatched metadata reduces exposure.
- Render at 1920×1080 or higher, then compose.

### Step 3: Compose for Home tile sizes
- One focal subject, readable at phone tile size; check it at about 25% scale.
- Strong value contrast (light subject on darker background or the reverse).
- Minimal text, and never at the bottom edge. Avoid claims ("FREE", "50% OFF"); they are banned in video thumbnails and risky everywhere because of the giveaway-metadata rule.
- Consistent character/mascot across thumbnails and the icon, which builds recognition.

### Step 4: Upload and activate
Home Page tab › **Edit active thumbnails** › upload (<3 MB) or activate existing › **Save changes** › **Start** in the "Start new thumbnail personalization?" dialog. Add alt text on detail-page images for accessibility.

### Step 5: Wait, then read
- Give it at least a full weekly cycle before judging; Home traffic has weekly seasonality (peaks usually on Saturday).
- Retire thumbnails that are clearly worst on **both** QPTR and average playtime; keep 2–5 active.
- Log results in your vault: thumbnail ID, hypothesis, QPTR, average playtime, dates, update version.

### Step 6: Video (optional, detail page and Home)
An **authentic gameplay video** appears first on the detail page and can also appear on Home. Allowed: varied camera angles of real gameplay, minor colour correction, logo overlay, curated highlight sequences, in-game UI text, music from Roblox's licensed catalog. **Not allowed:** misrepresented gameplay or theme, artificially enhanced graphics, real-world footage, **voice-over, narration, voice chat, or music with lyrics**, ad or claim text ("50% off", "Free UGC!"). Rejections count against the monthly quota of 3.

---

## 4. Icons: test carefully, because there's no built-in icon A/B

As of this date I found **no documented icon personalization or icon A/B tool**; only thumbnails have personalization. To test icons:
1. Change **one** icon at a time, at the start of a week, and avoid overlapping with a thumbnail refresh or update.
2. Compare Home Recommendations **PTR** for 7 days before and after, against the same weekdays.
3. Treat small differences as noise (seasonality and competition move PTR too).
4. Revert if PTR and bounce both get worse.

Icon design rules from the docs: square, 512×512 template, express theme/tone/genre, unique and relevant imagery, colour and contrast that read at 150×150.

**Sponsored campaigns as a test bed:** Ads Manager campaigns accept up to **10 thumbnails** rotated evenly, with reporting per campaign. Running a small campaign before an update can pre-screen thumbnail concepts. Remember that ad-acquired players don't feed RFY signals and that ad audiences can behave differently from organic ones.

---

## 5. Thumbnail brief template

```
Update: v1.8 "Frozen Caverns"     Date: 2026-11-07
Goal: raise QPTR without lowering avg playtime
Variants (activate 4):
  A  New ice boss, close-up, cold palette           (Subject)
  B  Two players sliding on ice together            (Social)
  C  Night cave, glowing crystals, high contrast    (Lighting)
  D  Current best thumbnail (control, kept active)  (Baseline)
Rules: real in-game assets only, no bottom text, no claims, 1920×1080, <3 MB
Review: 2026-11-14 and 2026-11-21 (QPTR + avg playtime per thumbnail)
```

---

## Common mistakes
- Only one active thumbnail, so personalization never starts.
- Turning personalization on, then deleting everything except "the winner".
- Changing thumbnails every few days, so the system never learns.
- Text or key art at the bottom edge (covered by metadata).
- Over-edited art that doesn't match gameplay (bounce, and a mismatch flag for exposure).
- Claim text and giveaway framing.
- Judging only by impressions or clicks instead of QPTR + playtime.
- Uploading 4K PNGs above 3 MB for personalization.
- Videos with voice-over or lyrics (rejected, and they still use quota).

## Checklist
- [ ] Custom 16:9 thumbnails at 1920×1080, <3 MB, nothing essential at the bottom
- [ ] 3–5 single-variable hypotheses per major update
- [ ] Captured from real gameplay (freecam), consistent with the icon and mascot
- [ ] 2–5 thumbnails active; personalization started
- [ ] Review after full weekly cycles using QPTR and average playtime
- [ ] Thumbnail log updated in the vault
- [ ] Icon changes tested one at a time, week over week
- [ ] Videos follow the authenticity policy; quota tracked

---

**Sources checked (2026-10-25):** Creator Docs: Publishing › Thumbnails (images, videos, free camera mode, Home page personalization, best practices); Publishing › Icons; Discovery (best practices, issues that limit exposure); Promotion › Ads Manager (creatives).

**Related:** [[Thumbnails - Hub]] · [[Thumbnail and Icon A - B Test Playbook]] · [[Advanced Thumbnail Production Pipeline]] · [[Thumbnail clicks but players leave]] · [[Thumbnails, Icons and 'eye Candy']] · [[Thumbnail A - B Test Interpretation]]
