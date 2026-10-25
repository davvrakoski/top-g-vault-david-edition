---
title: "Matchmaking"
description: "Match players to servers inside your game."
area: "30 Official Roblox Docs"
cluster: "Matchmaking"
source: "https://create.roblox.com/docs/matchmaking"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Match players to servers inside your game.*

Matchmaking is the process of matching players to servers based on player characteristics like age, language, skill level, and other gameplay preferences.

![](https://www.youtube.com/watch?v=fUMlnldI53A)

## How matchmaking works

When a player tries to join your game, the matchmaking service finds all eligible servers that the player can join, scores these servers using signals, and matches the player to the server with the highest score.

The matchmaking flow works like this:

1. A player requests to join a place.
2. Matchmaking finds eligible servers that the player can join, filtering out servers that are full, private, reserved, or about to be shut down.
3. Matchmaking scores all eligible servers to determine the most compatible server for the player.
4. Matchmaking matches the player to the server with the highest score.
5. The player joins the winning server.

  *Roblox default matchmaking*

  *(image in the full Top G Vault)*

  *Custom matchmaking*

  *(image in the full Top G Vault)*

## Scoring

The matchmaking scoring algorithm uses the weighted sum (WS) of signal values to assign scores to servers.

For more information on scoring, see [[30 Official Roblox Docs/Matchmaking/Server scoring|Server scoring]].

## Attributes

Attributes are properties used in matchmaking scoring. An attribute can be a number, like a player's age and skill level rating, or a string, like a player's language.

Attributes can be numerical or categorical:

- **Numerical attributes** compare the difference between the joining player's attribute and the server's aggregated value, with larger differences lowering or increasing the score. For example, the closer the skill level of a player is to the average skill level of the server, the higher the numerical signal's score is. This score is then multiplied by the signal's weight.
- **Categorical attributes** are based on how common the joining player's attribute is when compared to the other players in the server. For example, if a high percentage of the players inside a server have the same preferred language as the joining player, the score increases. This score is then also multiplied by the signal's weight.

For a list of all existing attributes, see [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Existing attributes|Existing attributes]]. For more information about custom attributes, see [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Custom attributes|Custom attributes]].

## Signals

Signals used in server scoring can either be the default ones already provided by Roblox, or custom ones you create yourself.

Roblox signals use existing attributes that Roblox already has access to, like player location, age group, and latency. Custom signals, however, need to use custom attributes to access data from your data stores. In order to create a custom signal, you must first create a custom attribute.

For a list of all existing Roblox signals, see [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Existing signals|Existing signals]]. For more information about custom signals, see [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Custom signals|Custom signals]].

## Custom matchmaking

When a player joins your game, matchmaking assigns a score to each running server based on the weighted sum of the server's signal values. You can customize this process by adjusting the weight of each of your signals to change how much each signal matters in the scoring of servers. Increasing the weight of the latency signal, for example, means the matchmaking algorithm prioritizes servers with lower ping for smoother gameplay.

After adjusting signal weights, you can preview the impact of these new weights on matchmaking server selection by evaluating them on mock servers.

For more information about how to customize matchmaking and simulate the results, see [[30 Official Roblox Docs/Matchmaking/Customize your matchmaking configuration|Customize your matchmaking configuration]].

## Analytics

Matchmaking analytics helps you track the success of your matchmaking configurations and find opportunities to optimize them.

For more information about matchmaking analytics, see [[30 Official Roblox Docs/Matchmaking/Matchmaking analytics|Analytics]].

---
*Source: [Matchmaking](https://create.roblox.com/docs/matchmaking) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
