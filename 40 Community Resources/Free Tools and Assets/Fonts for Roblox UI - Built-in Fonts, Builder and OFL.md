---
area: "40 Community Resources"
cluster: "Free Tools and Assets"
source_note: "community/free-tools/fonts-for-roblox-ui"
title: "Fonts for Roblox UI - Built-in Fonts, Builder and OFL"
tags: [roblox, community, ui, fonts, license, "cluster/free-tools-and-assets"]
verified: 2026-10-25
license: "mixed - see table"
sources:
  - https://devforum.roblox.com/t/new-font-ui-live/1967004
  - https://create.roblox.com/docs/production/creator-store
  - https://create.roblox.com/docs/resources/builder-font-license
  - https://developers.google.com/fonts/faq
  - https://openfontlicense.org/ofl-faq/
cssclasses: [tg-a40]
---

# Fonts for Roblox UI - Built-in Fonts, Builder and OFL

"How do I add my own font?" is one of the most repeated beginner questions. The short answer: **pick from Roblox's font library**, or **render the text to an image**.

## Your three options
| Option | How | License question |
|---|---|---|
| **Studio font picker** | Set `FontFace` on TextLabel / TextButton / TextBox; the picker shows families with weights and bold/italic toggles | Provided by Roblox for use on Roblox; nothing to track |
| **Creator Store fonts** | Creator Store > 2D Assets includes fonts that aren't in Studio's default list; click **Install** to add one to your font library | Use inside Roblox; don't re-host |
| **Text as an image** | Design a logo/title in Krita, Photopea, etc. with any font whose license allows it, export PNG, show it in an ImageLabel | Check the font's license allows use in images/products (OFL does) |

We found **no official way to upload your own .ttf/.otf** to Roblox on 2026-10-25. Blog posts that claim local font files "just work" in Studio are unverified; don't plan a UI around it.

## Font licenses you will meet
| Font / family | License | Use in a Roblox game | Bundle-safe? |
|---|---|---|---|
| **Builder** (Builder Sans, Extended, Mono) by Roblox | Roblox custom license: only for making and publishing Roblox UGC and digital promotions of it; no other use or distribution | Yes, on Roblox and in promo art for your game | **No** - see [[Builder font license]] |
| **Google Fonts** (most families) | SIL Open Font License 1.1 (a few are Apache-2.0) | Yes, incl. commercial, logos and images (Google's FAQ) | Font files: **No** for this vault (OFL forbids selling fonts on their own and needs the license file); text images you make: yes |
| Random "free font" sites | Often personal-use only | Check every font | Usually **No** |

## OFL in plain words (from the OFL FAQ)
- You **may** embed OFL fonts in a commercial game or app and sell the game.
- You **may not** sell the font file by itself.
- If you **modify** an OFL font, you must rename it when it has a Reserved Font Name.

## Readability tips
- Use 1-2 families per game: one display font for titles, one clean font for body text.
- Test on phone at the smallest size you use; thin weights vanish on small screens.
- If you use `TextScaled`, add a `UITextSizeConstraint` (MinTextSize / MaxTextSize) so text never gets tiny or huge; see [[UI Design System and Tokens]].

<!-- TDOD_GRAPH_START -->
## Knowledge Graph Connections

**Primary cluster:** [[Free Tools and Assets - Hub]]

**Related notes:** [[Builder font license]] · [[Text & image labels]] · [[Rich text markup]] · [[Free UI Kits and Mockup Files]]

<!-- TDOD_GRAPH_END -->
