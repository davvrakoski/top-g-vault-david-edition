---
area: "13 Growth and Monetization"
cluster: "Community Discord"
title: "Marketing - Livestreaming Dev and Playtests - Setup and What Never to Show"
tags: [roblox, community-knowledge, marketing, livestream, security, playtest]
cssclasses: [tg-a13]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/cloud/auth/api-keys
  - https://www.ftc.gov/business-guidance/resources/ftcs-endorsement-guides-what-people-are-asking
  - https://create.roblox.com/docs/workspace/camera/free-camera
  - https://obsproject.com/kb/standard-recording-output-guide
  - https://newsletter.gamediscover.co/p/game-trailers-breaking-down-a-key
---
# Marketing - Livestreaming Dev and Playtests - Setup and What Never to Show

Live streams are where a creator-dev's audience becomes a community. Viewers watch the game take shape, suggest features, and join playtests on the spot. GameDiscoverCo even notes developers streaming gameplay to their store pages as easy-to-watch footage. Streams also carry a risk recorded video doesn't: whatever is on your screen goes out **live and unedited**, including API keys, webhook URLs, private server links and DMs. This note covers stream formats, a safe Studio setup and a pre-stream checklist.

## 1. Stream formats that work
| Format | Length | Notes |
|---|---|---|
| **Build stream** (Studio) | 1-3 h | narrate decisions; take polls ("which boss attack next?") |
| **Community playtest** | 60-90 min | viewers join a private server; you play together; collect bugs live |
| **Update launch party** | 30-60 min | live as the update drops; give out codes on stream (also post them on-platform) |
| **Dev Q&A** | 30-45 min | after a big update; answer roadmap questions carefully |

Clip highlights afterwards (Replay Buffer, chapter markers) into Shorts and TikToks. One stream can supply a week of short content.

## 2. What never goes on screen
- **Open Cloud API keys.** Roblox's docs say the key "is equivalent to a password" and should never be shared outside your team. Keep keys in Roblox **secrets** or your secrets manager, never in a visible script or `.env` file you might open on stream.
- **Discord webhook URLs**, bot tokens and any `HttpService` endpoint with a secret in it.
- **Private server link codes and access codes** for your internal test servers. Viewers will join and spread them. Create a stream-only private server and **regenerate its link** afterwards.
- **Creator Dashboard** revenue, DevEx and payout pages, unless you mean to show them. Account and billing emails.
- **DMs and notifications** (Discord, Windows, email pop-ups). Use Focus Assist or Do Not Disturb.
- **Unreleased content** you don't want leaked. Decide before going live what's on and off the record.

## 3. Safe OBS setup for Studio streams
- Capture the **Studio window**, not the full display, so pop-ups on other windows stay off stream.
- Build a **"BRB / privacy" scene** with a hotkey, and switch to it before you open the Dashboard, a password manager or any settings page.
- Use **stream delay** (OBS Advanced settings) for community playtests if griefers or doxxers show up.
- Keep separate audio tracks for mic and game (see the OBS note) so you can mute game audio for copyrighted content and still keep the VOD.

## 4. Playtest flow with viewers
1. Post a playtest server link **only in chat at the start**, or better, via Discord roles for verified members (Bloxlink), so random raiders can't flood in.
2. Use **freecam** (Left Shift + P; owners and editors) to spectate and capture B-roll while players test.
3. Keep a bug form or a Discord forum open. A mod logs bugs from chat into it.
4. End with "what we changed because of you". That's the reason viewers come back.

## 5. Disclosure and audience rules on stream
- If a stream is **sponsored** (another studio or brand), the FTC says livestreams need the disclosure **repeated periodically**, not just once.
- Kid-heavy audience: no adult jokes, moderate chat with keyword filters, and never ask viewers for personal info. If a channel or stream is set as made for kids on YouTube, features are limited. See [[Marketing - Marketing to Kids and Teens - CARU, Made for Kids and Age Rules]].

## Pre-stream checklist
- [ ] Notifications off; only the Studio window captured
- [ ] No scripts or files with keys or webhooks open; secrets stored outside scripts
- [ ] Privacy scene hotkey tested
- [ ] Stream-only private server; link regenerated after the stream
- [ ] Mod in chat; filters on
- [ ] Replay Buffer on for highlight clips

## Related
[[Community Discord - Hub]] · [[Marketing - OBS Settings for Recording Roblox Gameplay]] · [[Discord Webhooks from Roblox - Why They Break and Safer Logging]] · [[Linking Discord to Roblox - Bloxlink Verification and Rank Binds]]
