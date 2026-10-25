---
area: "01 Start Here"
cluster: "Start Here"
title: "Using AI Assistants Safely for Roblox Code"
tags: [roblox, community-knowledge, start-here, ai, assistant, safety, workflow]
cssclasses: [tg-a01]
verified: 2026-10-25
license: "summary in our own words; sources linked"
sources:
  - https://create.roblox.com/docs/assistant/overview
  - https://create.roblox.com/docs/assistant/guide
  - https://create.roblox.com/docs/ai/accelerated-workflows
  - https://create.roblox.com/docs/ai-data-sharing
  - https://create.roblox.com/docs/generative-AI
  - https://devforum.roblox.com/t/psa-dont-use-instance-new-with-parent-argument/30296
---
# Using AI Assistants Safely for Roblox Code

Roblox Studio ships its own **Assistant** that can write scripts and change your place directly, and many beginners also use outside chatbots or coding agents. Used well, AI is a patient tutor that explains errors and drafts boilerplate. Used badly, it fills your game with code you do not understand, outdated APIs, client-trusting exploits, and occasionally a deleted folder. These are the habits that keep you learning and keep your place safe. Roblox's own position is simple: AI speeds up creation, but **you are responsible** for what ends up in your game.

## Rule 1: protect the place before AI touches it

- Assistant in Studio can insert, modify and delete instances. Before any big request, **publish or save a version** so you can roll back (see [[Saving and Version History - Never Lose a Place]]).
- For multi-step requests, use Assistant's **Planning Mode** (choose **Plan** in the input dropdown or type `/plan`). It writes a plan you can read and edit, and nothing runs until you click **Build**.
- Try big changes in a **copy** of the place first. Undo (Ctrl+Z) does not always cover everything a long agent session did.
- Outside agents connected through an MCP server can do the same, from outside Studio. Only connect tools you trust; see [[Claude and the Roblox Studio MCP Server - Responsible Setup]].

## Rule 2: understand every line you keep

A good beginner loop:

1. Ask for **one small feature** ("a server script that gives 10 coins when a player touches a part named Coin, with a debounce").
2. Read the result. For every line you cannot explain, ask "explain line 7".
3. Run it in Studio (Play, then **Server & Clients** with 2 players to test multiplayer).
4. Change one thing yourself (the amount, the cooldown) to prove you know where it lives.

If you just paste code you cannot read, you will not be able to fix it the first time it breaks, and you stop learning to script.

## Rule 3: check the APIs it uses

AI models are trained on years of old tutorials. Common problems to look for:

| AI writes | Prefer | Why |
| --- | --- | --- |
| `wait(1)`, `spawn(f)`, `delay(t, f)` | `task.wait`, `task.spawn`, `task.delay` | Old globals are deprecated |
| `model:SetPrimaryPartCFrame(cf)` | `model:PivotTo(cf)` | Deprecated |
| `Instance.new("Part", workspace)` | Set properties, then `Parent` last | Wastes CPU and bandwidth (zeuxcg DevForum PSA) |
| A method you have never seen | Search it in the API reference | Models sometimes invent methods that do not exist |
| Legacy chat (`game.Chat`, `Chatted` filters) | `TextChatService` | Current chat system |

Any method you cannot find on the class page (or its parent classes) does not exist. See [[Starter - Reading the API Reference - Inheritance, Members and Tags]]. Studio's Assistant has a docs-search skill for exactly this; ask it to "check the docs" when unsure.

## Rule 4: security is your job, not the AI's

AI often writes code that **works in a solo test but is exploitable**. Check every generated feature for:

- **Rewards decided on the client.** A LocalScript that sets coins, or a RemoteEvent like `GiveCoins:FireServer(500)`. The server must decide amounts.
- **Remotes with no checks.** Every `OnServerEvent` should check the player is allowed, close enough, and not spamming. See [[First RemoteEvent - Button on the Client, Reward on the Server]].
- **Secrets in scripts.** Never paste API keys, webhook URLs or passwords into a script or into a chat with an AI. Use Secrets Store; see [[Secrets Store and HttpService - Keeping API Keys Out of Your Place]].
- **`loadstring`, `require(someAssetId)`, or HTTP calls you did not ask for.** Remove them and ask why they were added.

## Rule 5: watch what you share

- Do not paste other people's private code, personal information about players, or your account credentials into any AI tool.
- Roblox lets you control whether your assets contribute to its AI training on the Creator Hub data-sharing settings. Read that page and pick a setting on purpose.
- Outside chatbots have their own terms. Treat anything you paste as possibly stored.

## Rule 6: AI in the game is a different topic

Using AI to *build* your game adds no special rules. Putting AI *in front of players* (chatting NPCs, generated items) does: disclosure, moderation and maturity rules apply. Read [[Policy - Generative AI in Games - Disclosure and Maturity Rules]] first.

## A prompt template that works

> I am a beginner. Write a **server Script** for Roblox using **TextChatService / task library / current APIs**. Feature: ... . Put it in ... . Validate everything on the server. Explain each section in one line. Do not use deprecated functions.

## Related
[[00 START HERE - Top G Vault]] · [[AI Code Review Prompt]] · [[Roblox Assistant Skills and Planning Mode - Team Setup]] · [[Plugin and Free Model Safety Checklist]] · [[Assistant for Studio]]
