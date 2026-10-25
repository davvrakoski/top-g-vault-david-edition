---
title: "Beta test games"
description: "Learn common methods of beta testing on Roblox, recommended for success metrics, and options for community feedback."
area: "30 Official Roblox Docs"
cluster: "Education"
source: "https://create.roblox.com/docs/education/developer/beta-testing-experiences"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Learn common methods of beta testing on Roblox, recommended for success metrics, and options for community feedback.*

Developers on the Roblox platform have a strong culture of conducting beta tests in order to get feedback from the community and to begin collecting analytics about their user base. There are several ways to collect user feedback, starting with closed betas and then moving to open betas after the initial feedback has been addressed.

## Testing options

There are different methods for beta testing a game depending on the project's current playability and testing goals. While the table below provides a quick summary, each of the following methods will be discussed in-depth.

| Method | Ideal for |
| --- | --- |
| **Closed access** | Ideal for studios interested in testing specific features or unpolished builds to get initial player reactions. Can often follow up with, or prepare for an open access beta. |
| **Open paid access** | Similar to open access beta but testers are users paying to play. This often results in a smaller volume of users, but more motivated in providing feedback. |
| **Limited time test** | Provides benefits of an open access beta but requires less of the commitment and investment needed to run an open access beta. Games can be playable but have minimal, or focused content. |
| **Open access beta** | For games that are relatively polished and playable, but may lack content. Best for studios interested in testing at scale to gain the largest amount of user data and impressions. |

In general, a developer is recommended to launch a beta program whenever the game meets the following criteria:

- A playable game where the user can go through the entire game loop, even if there's only one area, or content is limited.
- The game is performant on all target platforms, such as mobile or desktop.
- Resources are dedicated to supporting a community or accepting feedback.

> [!info]
> If your studio is unclear on which option is best, Roblox Education recommends closed access testing. This method tends to be the safest, but also provides enough data to address bugs and gameplay issues.

### Closed access beta

Closed access programs are best for studios interested in testing games that may be unpolished or not fully ready for a large audience. In this program, users from a trusted group are granted access to the Roblox group where the game is published from. Trusted members can often be from pre-existing communities or friends and family.

To launch the closed access beta, users are given invites to, or request to join, a Roblox group. Once in, they are granted a role that permits them to access a game published by that group. Note that the group and whitelisting must be managed and set up by the developer.

| Benefits | Considerations |
| --- | --- |
| • Users tend to be more engaged and active, often submitting tickets for requests, finding issues, and providing feedback.<br>• Minimal impact on search and discovery and marketing as the game is generally "hidden". | • Because user scale is smaller, developers may not understand trends in their userbase.<br>• Studios will need to source testers, such as friends and family, or members of a Discord community. |

### Open paid access

Similar to open access betas, these games should be playable, mostly bug free, but can be missing content. Here, users pay an upfront Robux fee to access the game (see [[30 Official Roblox Docs/Production/Monetization/Paid access in Robux|Paid access in Robux]]). This limits the amount of users, often providing a more motivated testing audience before opening it to a wider audience.

| Benefits | Considerations |
| --- | --- |
| • Offers the ability to interact with the Roblox population like an open beta, but at a smaller and more manageable scale.<br>• Ability to interact with the general Roblox population. | • Because these are motivated users, data collected here may not reflect performance with a general Roblox audience.<br>• Some minor financial costs in on-Roblox advertising is recommended to build a user base. |

### Limited time test

Running an open beta takes time and energy away from development as developers must respond to feedback and interact with their community. A lower-impact alternative is the limited time test. In this method, developers plan for an open access beta test during a specific time frame, such as a key weekend or week. A game is opened and closed based off the time. Similar to the open access beta, the game should be playable, generally bug-free, but can lack content.

To launch the limited time test, we advise developers to advertise the event. Developers can use [[30 Official Roblox Docs/Production/Promotion/Experience notifications|experience notifications]], group, and [[30 Official Roblox Docs/Production/Promotion/Promotion#Social media|social media]] to communicate when the game will be temporarily opened.

| Benefits | Considerations |
| --- | --- |
| • Developers can acquire short term data, such as D1 retention, playtime, session lengths over a weekend, rather than having to run a month long beta program. | • For a successful limited time test, it's recommended to prepare with marketing and advertising. Options include boosting an event on your social media or community spaces (e.g. Discord). Additionally, developers can spend money (~ \$100-250 USD) to buy ad space on Roblox to generate traffic. |

### Open access beta

If developers are confident their game is playable by the general public, but may be lacking content, polish, and quality of life features, an open access beta is feasible. To launch an open beta, set the game to public, which allows any Roblox user to play. If you enable **Exclude from Recommendations**, the game doesn't show up under **Recommended For You**.

Some recommendations for running an open access beta are below.

- Encourage users to join a Roblox group connected to the game, or social community such as Discord. This provides users an avenue to leave feedback.
- Inform users that the game is in a beta state. This can be done by adding the tag _Beta_ to the game title and using in-game pop-ups to set expectations as to the occasional bug or unfinished feature.

*(image in the full Top G Vault)*

*Example game page showing a beta*

| Benefits | Considerations |
| --- | --- |
| • Larger user base allows developers to collect analytics regarding common devices, retention, and demographics.<br>• Developers can see trends in gameplay and use it to adjust for launch. For instance, in the beta you may notice many 18 + users playing, when the educational content is best suited for ages 12-15. | • If the game is too incomplete, has too many bugs, or simply isn't appealing to users, the overall rating is likely to drop. This may impact search and discovery results.<br>• Open access betas have the highest planning needs. It's recommended to have people on staff to address community feedback. |

## Get community feedback

Regardless of how a beta is implemented, some means for recording user feedback should always be implemented. Two methods for obtaining direct user feedback are in-game feedback forms and Discord.

### In-game feedback

Feedback systems can be built directly into the game with UI pop-ups at key moments. Two examples can be seen in the game [Stranger Things](https://www.roblox.com/games/5853107391/Stranger-Things-Starcourt-Mall)
and [Alo Sanctuary](https://www.roblox.com/games/8523408215/Alo-Sanctuary).

*(image in the full Top G Vault)*

> [!info]
> Additionally, some community-developed tools have been created to make feedback forms easier (see [Form Embedder](https://devforum.roblox.com/t/form-embedder-an-impossibly-simple-way-to-add-a-google-form-to-your-experience/2183701)). Note though that community developed tools are not officially supported by Roblox.

| Benefits | Considerations |
| --- | --- |
| • Easy to obtain a large amount of data that can be quantified from the general audience.<br>• These systems can also be ideal for asking questions to see if users understand the intended learning objectives of the game. | • Leading questions or poor survey design can make data gathering inaccurate. Survey design is very important.<br>• Someone will need to clean data before it's used. More users lead to a higher volume of spam.<br>• One way communication makes it difficult to followup with users, or get context and reproduction steps. |

### Discord communities

Many developers choose to create Discord communities for their games. To setup communities, we recommend that you investigate large games on Roblox, such as Adopt Me. Seeing how other communities are structured can inform your own decisions, such as what channels users will expect to see, and how users may engage with your community.

| Benefits | Considerations |
| --- | --- |
| • Two-way communication - you can start a live conversation about an issue or feedback and get additional details.<br>• People will naturally talk amongst themselves. Developers can observe what people are talking about unprompted. | • Feedback may be biased. For instance, fans or dedicated users may be more likely to be on Discord than users who did not enjoy the game.<br>• Data is often qualitative and not quantitative. Unless surveys are provided in Discord, studios may not notice specific trends due to lack of data. |

### Think-aloud feedback

A think-aloud is a method of studying the mental processes people use in a task. Participants communicate their thoughts during gameplay, often in stream of conscious, as a way of understanding different goals, such as the clarify of an educational objective. For developers interested in doing a think-aloud, it's recommended they find participants in their target age demographic, either through family and friends, or a social community.

| Benefits | Considerations |
| --- | --- |
| • Arguably one of the best feedback mechanisms for understanding if a game is meeting educational objectives. A think aloud can identify gaps of knowledge that might be hard to discover through other methods. | • High effort task. Doing a think-aloud often requires setting up a script as to not bias the participant, in addition to the actual time in interviewing someone. |

## Analytics

Analytics gathered during a beta program are often used to gauge if a launch game is on track to meeting its goals. For instance, many common Roblox games have specific goals for retention, monetization, and session time.

### Track analytics

Roblox provides a variety of built-in analytics using the [[30 Official Roblox Docs/Production/Analytics/Analytics dashboard|Analytics Dashboard]].

| | |
| --- | --- |
| **Roblox Provided Analytics** | • **Demographics** - commonly used devices, ages<br>• **Retention and engagement** - Metrics such as D1, D7 retention, average session time, drop-off, etc. |
| **Common custom analytics** | • **Progress** - If users are getting it past the tutorial, are users exploring different areas of the world, etc.<br>• **User behavior** - What users click, interact, or engage with in the world. |

### Measure success

Measuring success is often determined by the analytics important during a beta. To help determine what analytics are important during a beta, consider these questions.

- How much content is in the game and what level of retention and engagement should be aimed for? For instance, a one-time guided classroom game will focus more on average session length than retention.
- What is the intended target age for users? What was the age range of users during the beta, and was there any discrepancy?

For all games, consult its [[30 Official Roblox Docs/Production/Analytics/Analytics|analytics]] to determine:

- Onboarding and tutorial completion.
- Metrics related to educational learning objectives. These differ between games.
- Player drop off points. For instance, if users are not exploring specific areas, or using game features.

> [!info]
> One universal metric for success is a game's likes, which often influences a user's decision to play. Developers should strive for an at least 80% like ratio after the close of a beta program.

## Frequently asked questions

**How long should a game spend in beta before launching?**

Every game is different, but a general time frame would be 7 to 30 days. This is specifically based off getting enough data to determine D1 and D30 retention metrics.

**Do developers engage live in-game with users during a beta?**

This is optional, but many developers enjoy entering their game to converse with users. There is also a culture in Roblox to reward this. For instance, some games reward badges for meeting a developer.

**When should we start building a community?**

It's recommend to build a community **before** beta testing. This community can be started on networks such as Discord or Twitter. As long as you have content, such as screenshots, videos, or even livestreams, you can start a community without a playable game. Starting a community can help find sourcing testers for the beta much easier.

---
*Source: [Beta test games](https://create.roblox.com/docs/education/developer/beta-testing-experiences) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
