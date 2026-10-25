---
area: "13 Growth and Monetization"
cluster: "Community Discord"
title: "Marketing - Pre-Launch Hype on Roblox - Events, Notify Me and Community Joins"
tags: [roblox, community-knowledge, marketing, launch, events, notifications]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/production/promotion/experience-events
  - https://create.roblox.com/docs/production/promotion/experience-notifications
  - https://create.roblox.com/docs/production/analytics/acquisition
  - https://create.roblox.com/docs/projects/groups
---
# Marketing - Pre-Launch Hype on Roblox - Events, Notify Me and Community Joins

Steam games collect wishlists for months before launch. Roblox has no wishlist button, but it has things that work similarly: **event RSVPs ("Notify Me")**, **experience follows and notifications**, **favorites**, and **community (group) membership**. Each one turns someone who saw your TikTok today into a person Roblox will notify on launch day. Pre-launch marketing should push viewers into these, not just give them a link to remember.

## 1. Your "wishlist" options

| Mechanism | What the player does | What you get on launch day |
|---|---|---|
| **Event + Notify Me** | taps Notify Me on an upcoming event | inbox notification when it starts, plus optional **push** to their device |
| **Community join** | joins your Roblox community | announcements, and members are reachable for playtests |
| **Favorite / follow** | favorites the game, opts into notifications | update announcements reach opted-in followers; favorites feed the "Home other" source |
| **Discord / socials** | joins off-platform | your own announcement ping (16+ visibility for Social Links) |

## 2. Run a launch event (Creator Docs facts)
- Dashboard > game > **Engagement > Events & Updates > Create Event or Update**. Group games need the **Universe Events Manager** permission. You can have **max 10** ongoing or upcoming events.
- Set **private** while preparing, then **public** when you're ready to promote. A public event shows immediately on the game's detail page.
- Each event has an **event details page with a share link**. Put that link in your TikTok bio and YouTube description for the final 1-2 weeks.
- Upload a **unique event thumbnail** (the docs say it lifts engagement compared with reusing the game thumbnail).
- Optional **event place**: joiners from event surfaces spawn there, which is good for a launch-party lobby.
- Group owners can **Feature Event** on the community's About section.
- **Trending Events in Experiences** chart: event active, started within 7 days, **≥ 1,000 RSVPs**, public. Every RSVP you drive from social media counts toward that bar.
- **Off-Platform Featuring**: submit **≥ 7 days before** start for possible App Store, Google Play or Roblox-channel features.
- Event joins carry the event ID in `GameJoinContext.EventId` (via `Player:GetJoinData()`), so you can give a launch-party badge to people who came through the event.

(Unverified: whether an experience that isn't public yet can host a public event. Plan a public teaser or lobby place if needed.)

## 3. A pre-launch ladder (6 weeks)
| Week | Off-platform | On-platform target |
|---|---|---|
| -6 | "I'm making a game" series starts | community created; join link on the game page |
| -4 | first gameplay teasers; creator outreach | closed playtest for community members |
| -3 | trailer v1; Discord opens | event created (private) |
| -2 | **event goes public**; every post: "tap Notify Me" | RSVP count posted publicly as a milestone |
| -1 | countdown Shorts; creator early access | Today's Picks nomination; final RSVP push |
| 0 | launch post + live stream | event live; notifications fire |

## 4. After launch: updates and notifications
- **Update announcements**: up to **60 characters**, at most **once every 3 days**, sent to opted-in followers. Stats: views, **visit rate**, **unfollow rate**. Avoid vague text ("bug fixes"). See [[Marketing - Update Logs and Patch Notes That Get Read]].
- **Experience notifications** (Luau API) reach opted-in users **13+**. They must be personalised and actionable, not generic ads. False urgency and bait-and-switch are banned, and you may **not** require players to turn notifications on to progress.

## Pitfalls
- Driving social traffic to a dead "coming soon" page with nothing to tap. Always give one action: Notify Me or Join.
- Burning the event too early. RSVPs are most valuable when the event starts within a few weeks.
- A launch spike with no server or feature readiness. See [[Soft Launch Playbook - Private Test to Public in Four Stages]].

## Related
[[Community Discord - Hub]] · [[Roblox Communities as Your On-Platform Hub - Roles, Announcements and Forums]] · [[Global Live Moments - Scheduled Cross-Server Events]] · [[Marketing - Launch Day Checklist - Off-Platform]]
