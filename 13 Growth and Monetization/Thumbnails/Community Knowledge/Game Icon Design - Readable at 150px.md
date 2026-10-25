---
area: "13 Growth and Monetization"
cluster: "Thumbnails"
title: "Game Icon Design - Readable at 150px"
tags: [roblox, community-knowledge, icons, thumbnails, discovery, art]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/publishing/experience-icons
  - https://developer.android.com/google-play/resources/icon-design-specifications
  - https://create.roblox.com/docs/production/publishing/thumbnails
---
# Game Icon Design - Readable at 150px

On Roblox's Home and search, your **icon** is often the only image a player sees before deciding to tap. Roblox asks for a square image of at least **512x512** and warns that icons scale down to sizes like **150x150**, so details must survive shrinking. You can show only one icon per locale. Mobile app stores solved the same problem years ago; their icon rules (for example Google Play's icon spec) transfer well.

## The five rules

1. **One subject.** A single character face, item or symbol. Roblox's own examples flag "ambiguous graphics" as confusing; small corner symbols vanish at 150 px.
2. **Big and centered.** Keep the subject in the middle ~70% of the canvas. Google Play's spec similarly tells designers not to force art to the edges and to use a keyline grid, and Play masks corners. Roblox's app also shows icons with rounded corners in many views (observed, not stated in the docs: unverified), so corners are unsafe for important detail.
3. **Simple background.** A flat or gradient color that contrasts the subject. Google's guidance warns photos and busy scenes lose detail at small sizes.
4. **Color sets the mood.** Roblox's examples: bright high-saturation for fantasy, muted low-saturation for somber, heavy contrast for horror. Pick a dominant color you can own across icon, thumbnails and UI.
5. **Little or no text.** If you use text, one short word in a heavy font; it must be readable at 150 px. Avoid claims like "FREE".

## Workflow

1. Make 3-5 concepts in a 512x512 (or 1024 for headroom, exported to 512) canvas.
2. **Shrink test:** view each at 150 px and at ~64 px side by side with screenshots of the Home page's neighbors. If you can't tell what it is in one second, discard it.
3. **Squint test:** blur the image; the subject's silhouette should still read.
4. **Grayscale test:** value contrast alone should separate subject from background.
5. Check against your thumbnails: icon and first thumbnail should look like the same game.

## Making the art

- Render a posed character or key item in Blender or Studio with strong rim light (separates from background).
- Exaggerate expressions and scale the subject up; icons are caricatures.
- Export PNG, sRGB, no transparency surprises (transparent areas show the platform background).

## Testing

Roblox has built-in thumbnail personalization but no built-in icon A/B tool (see the icon testing deep dive). Change the icon at most occasionally, note the date, and compare Home impressions-to-plays rate in Analytics for comparable weeks. Don't change icon and thumbnails at the same time if you want to know which helped.

## Pitfalls

- Using the auto-generated default icon at launch.
- Character cropped so tightly that the face is cut by rounded corners.
- Icons that copy a hit game's look: confusing for players and an IP risk.

## Related
[[Thumbnails - Hub]] - [[Thumbnail Personalization and Icon Testing Workflow]] - [[Thumbnail and Icon A - B Test Playbook]] - [[Thumbnail and Icon CTR Anecdotes - What Changed the Numbers]]
