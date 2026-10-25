---
title: "Attributes and signals"
description: "Attributes and signals define the player and server data used in matchmaking, including both Roblox-provided signals and custom signals you can create."
area: "30 Official Roblox Docs"
cluster: "Matchmaking"
source: "https://create.roblox.com/docs/matchmaking/attributes-and-signals"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Attributes and signals define the player and server data used in matchmaking, including both Roblox-provided signals and custom signals you can create.*

## Existing attributes

The default Roblox matchmaking configuration uses signals based on existing attributes like player location, age group, and latency.

To use data for matchmaking that Roblox doesn't automatically include in its default configuration, you need to create [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Custom attributes|custom attributes]] and [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Custom signals|custom signals]].

| **Attribute** | **Type** | **Description** |
| --- | --- | --- |
| **Estimated Player Latency** | Numerical | The estimated latency of a player in a server. |
| **Has Friends** | Categorical | Whether a server has a friend or another player of the same IP address as the joining player. |
| **Is Voice Chat Enabled** | Categorical | Whether a player has voice chat enabled. |
| **Player Age** | Numerical | The player’s age. |
| **Player Device Type** | Categorical | The player’s device type. Can be a mobile device, a computer, a tablet, a console, or a VR device. |
| **Player Language** | Categorical | The player’s language. |
| **Player Play History** | Numerical | The log-10 number of minutes a player has played in a universe in the past 28 days. |
| **Server Occupancy** | Numerical | The number of players in a server. |
| **Player Text Chat Group** | Categorical | The player's text chat group where they can text chat together. |

## Existing signals

The following are Roblox-defined signals derived based on Roblox attributes:

| **Signal** | **Description** |
| --- | --- |
| [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Age\|Age]] | The difference between the average age of players in the server and the joining player’s age, with a maximum relevant difference of 25. |
| [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Device Type\|Device Type]] | The ratio of players in the server with the same device type as the joining player. |
| [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Friends\|Friends]] | The number of people in the server who are friends with the joining player or who share an IP address with the joining player. 1 if there is a preferred player, 0 otherwise. |
| [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Latency\|Latency]] | The joining player's delta ping for a server, which is the estimated ping above the lowest ping the player could achieve on their best reachable datacenter, with a max relevant value of 100. |
| [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Language\|Language]] | The ratio of players in the server with the same language as the joining player |
| [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Occupancy\|Occupancy]] | The ratio of players in the server compared to the capacity of the server. |
| [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Play History\|Play History]] | The difference between the average play history in the server and the joining player’s play history, with a maximum relevant difference of 4.6. |
| [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Voice Chat\|Voice Chat]] | The ratio of players in the server with voice chat enabled. |
| [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Text Chat\|Text Chat]] | The ratio of players in the server who can text chat with the joining player together. |

### Age

A numerical signal that compares the average ages of players on a server to the joining player's age. This signal has a max relevant difference of 25. The signal score is inversely related to the age difference, meaning lower age differences have higher scores.

\$\text = 1 - \min(25, \text) / 25\$

where

\$\text = |\text - \text|\$

### Device Type

A categorical signal that measures the ratio of players on the server with the same device type as the joining player. Device types include: Computer, mobile device, tablet, console, and VR device.

\$\text = \text / \text\$

### Friends

A preferred player is a player who is either friends with the joining player or who shares the same IP address as the joining player. The Friends signal is a categorical signal with a score of 1 when there is a preferred player in the server and a score of 0 when there are no preferred players on the server.

\$\text = \text \  \ 1 : 0\$

The Friends signal can also be considered a numerical signal with a maximum relevant value of 1.

\$\text = \min(\text, 1) / 1\$

### Language

A categorical signal that measures the ratio of players on the server who share the same language setting as the joining player.

\$\text = \text / \text\$

### Latency

A numerical signal that measures the joining player's delta ping in milliseconds if they were to play on a server, which is the estimated ping above the lowest ping the player could achieve on their best reachable datacenter. This signal has a max relevant value of 100 milliseconds. The signal score is inversely related to the delta ping, meaning lower delta ping values have higher scores.

\$\text = 1 - \min(100, \text) / 100\$

### Occupancy

A numerical signal that measures the ratio of players on the server to the capacity of the server.

\$\text = \text / \text\$

### Play History

The Play History attribute value is the log-10 number of minutes a player has played in a universe in the past 28 days. This numerical signal compares the average log-10 Play History value of players in the server to the joining player's Play History value. This signal has a max relevant difference of 4.6. The signal score is inversely related to the play history difference, meaning lower play history differences have higher scores.

\$\text = 1 - \min(4.6, \text / 4.6)\$, where

\$\text = |\text - \text|\$

### Voice Chat

A player can have voice chat enabled or disabled. The Voice Chat signal is a categorical signal that measures the ratio of players with the same voice chat setting as the joining player to the number of players in the server.

If a place has voice chat disabled, the Voice Chat signal's weight is 0.

\$\text = \text / \text\$

### Text Chat

A categorical signal that measures the ratio of players on the server who can text chat with the joining player together in common.

\$\text = \text / \text\$

## Custom attributes

Custom attributes give custom signals access to player and server data. For more information about creating your own custom attributes, see [[30 Official Roblox Docs/Matchmaking/Customize your matchmaking configuration#Create a custom attribute|Create a custom attribute]]. For more information about existing Roblox attributes, see [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Existing attributes|Existing attributes]].

| **Attribute** | **Characteristics** |
| --- | --- |
| **Player** | Persistent <br><br> Custom player data that persists in data stores, like a player's level or score inside the game <br><br> Managed using the [[30 Official Roblox Docs/API Reference/Classes/DataStore\|DataStore]] APIs |
| **Server** | Not persistent and only last as long as the server is active <br><br> Server-specific data like the server level or game mode <br><br> Managed using the [[30 Official Roblox Docs/API Reference/Classes/MatchmakingService\|MatchmakingService]] API |

```lua title="Player attribute example"
local DataStoreService = game:GetService("DataStoreService")

local eloStore = DataStoreService:GetDataStore("PlayerElo")

function onMatchEnded(players: {Player}, winners: {Player}, losers: {Player})
	for _, player in players do
		local updatedElo = CalculateUpdatedElo(player, winners, losers)
		local success, errorMessage = pcall(function()
			eloStore:SetAsync(player.UserId, updatedElo)
		end)
	end
end
```

```lua title="Server attribute example"
local MatchmakingService = game:GetService("MatchmakingService")
local RunService = game:GetService("RunService")

if RunService:IsStudio() then
	-- Sets up initial attributes and schema for testing
	MatchmakingService:InitializeServerAttributesForStudio({
		Level = "Advanced",
		Elo = 123.456,
		TrainingMode = true
	})
end

-- Retrieves the Level attribute
local currentLevel, errorMessage = MatchmakingService:GetServerAttribute("Level")
if errorMessage then
	warn(errorMessage)
else
	print("Current level: " .. currentLevel)
end

-- Updates the Level attribute value to Advanced
local success, errorMessage = MatchmakingService:SetServerAttribute("Level", "Advanced")
if not success then
	warn("Failed to update server attribute [Level] to [Advanced] due to error: " .. errorMessage)
else
	print("Successfully set [Level] to [Advanced]")
end
```

## Custom signals

Custom signals are created and defined by you and can be numerical or categorical:

- Numerical signals are numbers. They compare the difference between the joining player's attribute and the server's aggregated value, with larger differences lowering or increasing the score. For example, the closer the skill level of a player is to the average skill level of the server, the higher the numerical signal's score is. This score is then multiplied by the signal's weight.
- Categorical signals are strings or booleans. They're based on how common the joining player's attribute is when compared to the other players in the server. For example, if a high percentage of the players inside a server have the same preferred language as the joining player, the score increases. This score is then also multiplied by the signal's weight.

For more information about creating your own custom signals, see [[30 Official Roblox Docs/Matchmaking/Customize your matchmaking configuration#Create a custom signal|Create a custom signal]]. For more information about existing Roblox signals, see [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Existing signals|Existing signals]].

### Player numerical

##### Joining player

Minimizes the difference between the server's average player attribute and the joining player's attribute. Differences beyond 1000 return a signal score of 0.

```lua title="Joining player formula for player numerical signal"
local diff = math.abs(server_{aggregation_function}_{attribute_name} - joining_player_{attribute_name})
local score = 1 - math.min(diff / max_relevant_difference, 1)
return score
```

```lua title="Joining player example for player numerical signal"
local server_average_Elo = 2000
local joining_player_Elo = 1000
local max_relevant_difference = 1500

local diff = math.abs(server_average_Elo - joining_player_Elo)
local score = 1 - math.min(diff / max_relevant_difference, 1)
return score
```

##### Constant value

Minimizes the difference between the server's average player attribute and a constant value of 500. Differences beyond 1000 return a signal score of 0.

```lua title="Constant value formula for player numerical signal"
local diff = math.abs(server_sum_{attribute_name} + joining_player_{attribute_name} - constant_value)
local score = 1 - math.min(diff / max_relevant_difference, 1)
return score
```

```lua title="Constant value example for player numerical signal"
local server_sum_PowerLevel = 4500
local joining_player_PowerLevel = 9901
local max_relevant_difference = 1500
local constant_value = 5000

local diff = math.abs(server_sum_PowerLevel + joining_player_PowerLevel - constant_value)
local score = 1 - math.min(diff / max_relevant_difference, 1)
```

### Player categorical

##### Clustering

Maximizes the ratio of players in the server who have the same attribute as the joining player's attribute.

```lua title="Clustering formula for player categorical signal"
local score = num_players_same_{attribute_name} / occupancy
return score
```

```lua title="Clustering example for player categorical signal"
local num_players_same_Guild = 15
local occupancy = 19

local score = num_players_same_Guild / occupancy
return score
```

##### Diversifying

Maximizes the ratio of players in the server who have a different attribute than the joining player's attribute.

```lua title="Diversifying formula for player categorical signal"
local score = num_players_same_{attribute_name} / occupancy
return 1 - score
```

```lua title="Diversifying example for player categorical signal"
local num_players_same_RpgClass = 15
local occupancy = 19

local score = num_players_same_RpgClass / occupancy
return score
```

### Server numerical

##### Joining player

Minimizes the difference between the server's attribute and the joining player's attribute. Differences beyond 1000 return a signal score of 0.

```lua title="Joining player formula for server numerical signal"
local diff = math.abs(server_{attribute_name} - joining_player_{attribute_name})
local score = 1 - math.min(diff / max_relevant_difference, 1)
return score
```

```lua title="Joining player example for player numerical signal"
local server_Level = 4500
local joining_player_Level = 9000
local max_relevant_difference = 1500

local diff = math.abs(server_Level - joining_player_Level)
local score = 1 - math.min(diff / max_relevant_difference, 1)
```

##### Constant value

Minimizes the difference between the server's attribute value and a constant value. Differences beyond this constant value return a signal score of 0.

```lua title="Constant value formula for server numerical signal"
local diff = math.abs(server_{attribute_name} - constant_value)
local score = math.min(diff / max_relevant_difference, 1)
return score
```

```lua title="Constant value example for server numerical signal"
local server_GameTime = 500
local max_relevant_difference = 1000
local constant_value = 1000

local diff = math.abs(server_GameTime - constant_value)
local score = math.min(diff / max_relevant_difference, 1)
```

### Server categorical

##### Compare to joining player

The score is 1 when the server's attribute value (for example, Game Mode) is equal to the player's attribute value (for example, Preferred Game Mode). Otherwise, the signal score is 0.

```lua title="Joining player formula for server categorical signal"
if server_{attribute_name} == joining_player_{attribute_name} then
	return 1
else
	return 0
end
```

```lua title="Joining player example for server categorical signal"
local server_GameMode = "Survival"
local joining_player_GameMode = "Survival"

if server_GameMode == joining_player_GameMode then
	return 1
else
	return 0
end
```

##### Compare to constant value

The score is 1 when the server's attribute value is equal to a constant value of true. Otherwise, the signal score is 0.

```lua title="Constant value formula for server categorical signal"
if server_{attribute_name} == constant_value then
	return 1
else
	return 0
end
```

```lua title="Constant value example for server categorical signal"
local server_GameNotStarted = true

if server_GameNotStarted == true then
	return 1
else
	return 0
end
```

---
*Source: [Attributes and signals](https://create.roblox.com/docs/matchmaking/attributes-and-signals) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
