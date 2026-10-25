---
area: "12 UI Audio and Camera"
cluster: "UI UX"
title: "Platform - Touch Target Sizes and Mobile-First HUD Layout"
tags: [roblox, community-knowledge, ui, platform, mobile, hud, touch]
cssclasses: [tg-a12]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/game-design/design-for-roblox
  - https://create.roblox.com/docs/production/publishing/adaptive-design
  - https://create.roblox.com/docs/performance-optimization/test-on-hardware
  - https://developer.android.com/guide/topics/ui/accessibility/apps
  - https://www.w3.org/WAI/WCAG22/Understanding/target-size-minimum.html
---
# Platform - Touch Target Sizes and Mobile-First HUD Layout

Roblox's own design guide says the majority of users play on mobile, so UI should be designed around mobile first and then extended with gamepad and keyboard shortcuts. "Mobile first" is concrete: decide what fits on a phone, make it big enough for a thumb, and only then add the extras desktop can afford. The vault's safe-area note covers notches and reserved corners; this note covers sizes and the HUD plan.

## How big is "big enough"?
Roblox does not publish a minimum touch target. External standards:

| Source | Minimum |
|---|---|
| Android accessibility guidance | **48 x 48 dp** per touch target ("larger is even better"); precise pointers can be smaller |
| Apple Human Interface Guidelines | **44 x 44 pt** (widely cited; the HIG page did not render in our fetch, so treat as unverified wording) |
| WCAG 2.2 SC 2.5.8 (AA) | 24 x 24 CSS px, or spaced so a 24 px circle around each does not overlap another |

Use 48 as the floor for primary controls in Roblox offset units on phones (Roblox phone UI units appear to be device-independent, so they line up roughly with dp/pt; inferred from the GuiService `GetInsetArea` example, unverified), 44 for secondary, and never below the WCAG 24 even for tiny close buttons. Enforce with `UISizeConstraint.MinSize = Vector2.new(48, 48)` so `UIScale` or Scale sizing can never shrink them below the floor.

Visual size can be smaller than the hit area: put a transparent `TextButton`/`ImageButton` at 56 units around a 32-unit icon.

## Spacing
- 8 to 12 units between adjacent targets so a thumb does not hit two.
- Destructive buttons (sell, delete) never next to the main action; add a confirm.

## The mobile-first HUD plan
Work out the phone layout first, in this order:

1. **Reserved:** Roblox top bar (top-left menu/chat, top-right), the movement stick area (bottom-left), the jump button (bottom-right). Leave them alone.
2. **Primary actions** (1 to 3): an arc around the jump button for the right thumb. Most-used closest.
3. **Always-on status** (health, currency, timer): top centre or top right under the top bar. Read-only, so small text is fine there, but keep it legible.
4. **Menu entry points:** one row of 3 to 5 icon buttons on the left edge middle or top, or one "menu" button that opens a sheet. The adaptive guidelines recommend collapsing less important buttons into a menu on small screens.
5. **Context actions** appear only when relevant (ProximityPrompt, "reload" when empty), not permanently.
6. **Notifications** top centre, short, auto-dismiss, never covering the action arc.

Then extend upward:
- **Tablet:** same plan, but keep buttons hugging edges; centred floating buttons are far from thumbs on big screens.
- **Desktop:** reveal secondary buttons the phone collapsed, add key hints, hover tooltips.
- **Console/TV:** remove touch buttons, show glyph hints, enlarge everything, rely on shortcuts.

## Genre cheat sheet (vault recommendations)

| Genre | Phone action arc | Notes |
|---|---|---|
| Simulator / clicker | One huge tap button or tap-anywhere | Auto-collect toggles reduce taps |
| Obby | None beyond jump | Keep the screen clean; checkpoints top centre |
| Combat | Attack, ability 1, ability 2, dodge | Cooldowns shown on the buttons themselves |
| Shooter | Fire (both sides optional), aim, reload | Offer "auto-fire when aiming at target" option |
| Tycoon | Build/menu buttons on left edge | Most actions via world prompts |
| Driving | Gas/brake pedals right, steering left or tilt | See vehicle input notes |

## Validate
The hardware testing guide's checks: targets tappable on varied screens, gestures not conflicting with controls, sticks and buttons in comfortable reach. Watch a real person play on a real phone; note every mis-tap.

## Related
[[UI UX - Hub]] · [[Safe Areas, Thumb Zones and Console UI Navigation]] · [[Mobile Action Buttons - Input Action System and ContextActionService]] · [[Cross-Platform UI System]]
