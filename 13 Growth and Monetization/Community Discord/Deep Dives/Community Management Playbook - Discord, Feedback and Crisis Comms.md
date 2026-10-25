---
area: "13 Growth and Monetization"
cluster: "Community Discord"
tags: [deep-dive, roblox, community, discord, feedback, moderation, crisis-comms]
verified: 2026-10-25
cssclasses: [tg-a13]
---

# Community Management Playbook - Discord, Feedback and Crisis Comms

## Why this matters
Your community is your fastest bug-report pipeline, your best playtesters and your loudest marketing, and on Roblox a large part of it is under 16. That changes what you're allowed to link, where, and how you must moderate.
This playbook covers the Roblox-side rules (social links, in-game references, feedback tools), a Discord structure that scales from 50 to 50,000 members, a feedback-to-roadmap pipeline, and ready-made crisis messages for outages, data loss and exploits.

---

## 1. Roblox rules you can't ignore (Creator Docs › Social media links)

| Rule | Detail |
|---|---|
| Who can add social links | You must **verify your age as 16+** (facial age estimation or government ID). For groups/communities, at least one collaborator verified 16+ |
| Who can see them | **Only users verified as 16+.** Under-16 and unverified users can't see social links |
| Where links may appear | **Only on the game's main details page** (also Creator Store asset pages and profiles). **You can't share social media links directly within a game** |
| Allowed in-game text | "Check out our social media links on our game's page", "Join us in our Community Server. Links on our game's page" |
| Not allowed in-game | "Join our Discord discord.gg/invitecode", "Follow for merch on X.com/abc", "Send bug reports to abc@xyz.com" |
| Link types | Facebook, Twitter, YouTube, Twitch, **Discord**, Guilded, Roblox community; each type once; up to **three** links |
| Where to configure | Creator Dashboard › game › **Engagement › Social Links** |
| Group gotcha | If every 16+-verified collaborator leaves a group, its social links are **deleted after 90 days** |

**Consequence:** many of your players can't see the Discord link at all. Build community features **on Roblox first** (your Roblox Community/group, Experience Events, update announcements, in-game feedback), and treat Discord as the space for your older, most engaged players. Discord's own Terms set a minimum age (13 in most countries); enforce it.

Also relevant:
- Subscriptions may not gate paid benefits behind extra tasks such as social posts, and you may not direct users to purchase on another platform.
- Discovery reduces exposure for metadata that leads with giveaways or monetary rewards. Keep "giveaway" campaigns out of titles, thumbnails and descriptions.

---

## 2. On-platform community tools

| Tool | Use it for |
|---|---|
| **Roblox Community (group)** | Announcements (group shout), roles for testers, group-owned games, featured events on the group page |
| **Experience Events** | "Notify Me" audiences for launches; shareable event pages |
| **Update announcements** | ≤ 60 characters, once every 3 days, to opted-in followers |
| **Feedback dashboard** (Audience › Feedback) | Upvote/downvote ratio and filtered comments by device and platform; CSV export |
| **In-game feedback prompt** | `SocialService:PromptFeedbackSubmissionAsync()`, a Roblox dialog where players rate and comment; results land in Audience › Feedback |

```lua
-- LocalScript: ask for feedback at a good moment (after a completed run, not mid-fight)
local SocialService = game:GetService("SocialService")

local function askForFeedback()
	task.spawn(function()
		local ok, err = pcall(SocialService.PromptFeedbackSubmissionAsync, SocialService)
		if not ok then warn("Feedback prompt failed:", err) end
	end)
end
```

Documented behaviour: it yields until the player submits or dismisses (so `task.spawn` it); players can submit **once per day per experience**; it **doesn't work in Studio** (test in the published game); ineligible players see an "unavailable" message. A **Player Support** ticket flow (`FeedbackType = Enum.FeedbackType.PlayerSupport`, with categories Bug Report, Data Restore Request, Purchasing Issue and Other) is in **alpha for select experiences** only.

---

## 3. Discord structure that scales

| Category | Channels | Notes |
|---|---|---|
| **Start** | `#rules`, `#announcements` (read-only), `#roles` | Rules acceptance before posting |
| **Game** | `#patch-notes`, `#events`, `#sneak-peeks` | Mirror Roblox announcements |
| **Feedback** | `#bug-reports` (forum, template-required), `#suggestions` (forum, upvotes) | Tags: platform, area, status |
| **Community** | `#general`, `#media`, `#trading` (only if your game has trading) | Slow mode on busy channels |
| **Testers** | `#tester-chat`, `#build-notes` (role-gated) | Under NDA-style rules; private test servers |
| **Staff** | `#mod-log`, `#escalations`, `#staff-chat` | Never public |

Safety setup:
- Use Discord's verification level, AutoMod keyword and link filters, and **block external invite links and personal-info patterns** (phone numbers, addresses).
- **Never** ask members for Roblox passwords, cookies, emails or real names. Pin a warning that staff will never DM first asking for account details (scams target Roblox players).
- Staff code of conduct: no private DMs with minors for support. Use public channels or a ticket bot with logs.
- Trading channels attract scams. Require middleman rules or don't offer trading in Discord at all.
- Keep a **ban/appeal log**; consistent enforcement prevents most drama.

### Bug report template (pin in the forum)
```
Platform: (PC / Mac / iOS / Android / Xbox / PlayStation / Quest)
Server ID or time (UTC) if known:
What happened:
What you expected:
Steps to reproduce:
Video/screenshot:
```
The **server version** and **time** let you match reports to the Error Report and crash analytics.

---

## 4. Feedback to roadmap pipeline

```
Collect  →  Tag  →  Deduplicate  →  Score  →  Decide  →  Close the loop
```

| Step | How |
|---|---|
| Collect | Discord forums, Audience › Feedback CSV, in-game prompt, social comments |
| Tag | Area (economy, combat, UI), platform, type (bug, balance, content, QoL) |
| Deduplicate | Merge into one card per issue; count mentions |
| Score | `Impact (1–5) × Reach (players affected) ÷ Effort (1–5)`; bugs that lose data or purchases skip the queue |
| Decide | Weekly 30-min triage alongside metrics (a loud request with no metric support is a candidate for an experiment, not a guaranteed build) |
| Close the loop | Patch notes credit community reports ("Fixed: pets vanishing after rebirth, thanks to everyone who reported it") |

Cross-check with data. If Discord says "zone 3 is too hard", look at funnel drop-off at zone 3 and deaths by zone before changing it (see [[Analytics Custom Events, Funnels and Dashboards Setup]]). The vault's [[Community Findings — Useful, Not Specifications]] note covers how to read community advice critically.

---

## 5. Crisis comms templates

**Principles:** acknowledge fast, say what you know, say what players should do, give the next update time, **don't promise what you can't guarantee** (dates, full restores, compensation amounts).

### Outage / can't join
> We're aware some players can't join [Game] right now. We're investigating and will update here by **[time UTC]**. Your progress is saved; please don't spam rejoin while we work on it.

### Data loss reports
> Some players are reporting missing [items/progress] after today's update. We've **paused** [the affected feature] while we investigate. Please submit the form in #bug-reports with your username and what's missing. We'll share what we can and can't restore once we understand the cause.
(Then actually pause the feature with a Config kill switch; see [[Experiments and Configs - In-Game A-B Testing]].)

### Exploit / duplication glitch
> We know about an exploit affecting [system]. A fix is in progress. Items gained through the exploit may be removed. Please don't use or trade them.
(Don't describe how the exploit works.)

### Unpopular change
> We hear you on [change]. Here's why we made it: [one or two honest sentences]. We're watching [metric/feedback] for the next [N days] and will share what we decide by **[date]**.

### After the incident
Post a short summary: what happened, what was fixed, what's changing so it doesn't repeat, and any compensation **after** it is implemented. See [[Release Rollback and Incident Response]] for the technical side.

---

## 6. Weekly community ops rhythm

| Day | Task |
|---|---|
| Mon | Feedback triage (30 min) with metrics; update roadmap card statuses |
| Tue | Sneak peek post for the week's drop |
| Thu | Patch notes + Roblox update announcement (≤60 chars) |
| Fri | Watch release; staff on call in `#escalations` |
| Monthly | Mod team retro; review ban log; refresh rules; Q&A or dev stream |

---

## Common mistakes
- Putting Discord invite links or URLs in game UI, signs or chat (not allowed in-game).
- Assuming every player can see the game page social links (only 16+ verified users can).
- Running support through private DMs with minors.
- Promising compensation or dates before you know the cause.
- Letting the loudest Discord voices override funnel and retention data.
- No bug-report template, so reports can't be reproduced.
- Giveaway-led titles or thumbnails to grow the server (reduced discovery exposure).
- Losing group social links because the only 16+-verified collaborator left.

## Checklist
- [ ] Social links configured by a 16+-verified collaborator; a second verified admin in the group
- [ ] In-game references use the allowed phrasing only ("links on our game's page")
- [ ] In-game feedback prompt placed at a calm moment; tested in the published game
- [ ] Discord: rules gate, AutoMod, link and personal-info filters, staff code of conduct
- [ ] Bug forum with required template; weekly triage scheduled
- [ ] Crisis templates saved where all staff can reach them
- [ ] Config kill switches exist for risky systems
- [ ] Patch notes close the loop on community reports

---

**Sources checked (2026-10-25):** Creator Docs: Promotion › Social media links; Analytics › Feedback; Analytics › Acquisition (community tips); Monetization › Subscriptions (guidelines); Discovery (issues that limit exposure); Promotion › Experience events and updates; Engine API: SocialService.PromptFeedbackSubmissionAsync. Discord platform features and age rules are Discord's, not Roblox's; check Discord's current documentation.

**Related:** [[Community Discord - Hub]] · [[Discord Community Operations]] · [[Community Feedback and Discord Operations]] · [[Discord - Community Setup]] · [[Text Chat, Moderation and Player Safety]] · [[Reddit - Community Lessons]]
