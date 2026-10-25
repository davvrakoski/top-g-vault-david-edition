---
title: "Customize your matchmaking configuration"
description: "Use custom matchmaking to match players based on attributes like their skill level, their age and language, and their gameplay preferences."
area: "30 Official Roblox Docs"
cluster: "Matchmaking"
source: "https://create.roblox.com/docs/matchmaking/customize-matchmaking"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Use custom matchmaking to match players based on attributes like their skill level, their age and language, and their gameplay preferences.*

With a custom matchmaking configuration, you can build competitive, cooperative, and unique games by matching players to servers based on characteristics like skill level, latency, and gameplay preferences.

By default, Roblox provides you with a matchmaking configuration that uses predefined Roblox signals. To customize matchmaking, you can create new matchmaking configurations by [[30 Official Roblox Docs/Matchmaking/Customize your matchmaking configuration#Custom configuration with Roblox signals|adjusting the weights of existing Roblox signals]], [[30 Official Roblox Docs/Matchmaking/Customize your matchmaking configuration#Custom configuration with custom signals|creating new custom signals]], or both. You can then preview your configuration by [[30 Official Roblox Docs/Matchmaking/Customize your matchmaking configuration#Preview and test server scores|previewing server scores with mock servers]].

## Custom configuration with Roblox signals

You can adjust the weights of existing Roblox signals to customize your game's matchmaking. For more information about Roblox signals and how their formulas are calculated, see [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Existing signals|Existing signals]].

To create a custom matchmaking configuration using only Roblox signals:

1. Select a game on the [Creator Dashboard](https://create.roblox.com/dashboard/creations).
2. In the left-hand navigation, navigate to **Configurations** > **Custom matchmaking**.
3. Select the **Configuration** tab and click **Create Configuration**.
4. In the **Create a Custom Matchmaking Configuration** page, enter a name for your configuration.
5. Change the weights of the Roblox signals you want to update.
6. Click **Save Configuration**.
7. Select the places you want to apply this configuration to.
8. Click **Save Configuration** again.

The new matchmaking configuration shows up in the **Configurations** list of the **Configuration** tab.

*(image in the full Top G Vault)*

## Custom configuration with custom signals

To create a custom matchmaking configuration using custom signals:

1. Select a game on the [Creator Dashboard](https://create.roblox.com/dashboard/creations).
2. In the left-hand navigation, navigate to **Configurations** > **Custom matchmaking**.
3. Select the **Configuration** tab and click **Create Configuration**.
4. In the **Create a Custom Matchmaking Configuration** page, enter a name for your configuration.
5. Click **Add Custom Signal** and [[30 Official Roblox Docs/Matchmaking/Customize your matchmaking configuration#Create a custom signal|create a custom signal]].
6. Change the weights of the signals you want to update.
7. Click **Save Configuration**.
8. Select the places you want to apply this configuration to.
9. Click **Save Configuration** again.

The new matchmaking configuration shows up in the **Configurations** list of the **Configuration** tab.

### Create a custom signal

> [!info]
> You can create a total of 2 custom signals per game.

> [!info]
> Custom signals use custom attributes to access player and server data. In order to create a custom signal, you must first create a [[30 Official Roblox Docs/Matchmaking/Customize your matchmaking configuration#Create a custom attribute|custom attribute]].

Custom signals can be player numerical, server numerical, player categorical, or server categorical. For more information about custom signals and how their formulas are calculated, see [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Custom signals|Custom signals]].

To create a custom signal:

1. In the **Create a Custom Matchmaking Configuration** page, click **Add Custom Signal**.
2. Under **Signal Details**, enter a signal name and description.
3. Under **Signal Configuration**:

    - For a **player numerical attribute**:
        1. Choose the [[30 Official Roblox Docs/Matchmaking/Customize your matchmaking configuration#Create a custom attribute|attribute]] you want to reference.
        2. Select how you want to aggregate the attribute in each server.
            - **Average**: The average of all players' attribute values in the server. Minimizes the difference between the server's average player attribute and the joining player's attribute.
            - **Median**: The median of all players' attribute values in the server. Minimizes the difference between the server's median player attribute and the joining player's attribute.
            - **Sum**: The sum of all players' attribute values in the server, including the joining player's. Minimizes the difference between the total attribute value of the players in the server, including the joining player, and a constant value.
        3. Adjust the values under the aggregation.

    - For a **server numerical attribute**:
        1. Choose the [[30 Official Roblox Docs/Matchmaking/Customize your matchmaking configuration#Create a custom attribute|attribute]] you want to reference.
        2. Adjust the values under the attribute.

    - For a **player categorical attribute**:
        1. Choose the [[30 Official Roblox Docs/Matchmaking/Customize your matchmaking configuration#Create a custom attribute|attribute]] you want to reference.
        2. Select how you want to distribute the attribute value across servers:
            - **Cluster**: Groups players with the same attribute value. Maximizes the ratio of players in the server who have the same attribute value as the joining player.
            - **Diversify**: Groups players with different attribute values. Maximizes the ratio of players in the server who have a different attribute value from the joining player.

    - For a **server categorical attribute**:
        1. Choose the [[30 Official Roblox Docs/Matchmaking/Customize your matchmaking configuration#Create a custom attribute|attribute]] you want to reference.
        2. Adjust the values under the attribute.

4. **OPTIONAL** Expand **Preview and Test Signal** to preview the signal score. You can adjust the **Test Signal** values to optimize the preview result.

   *(image in the full Top G Vault)*

5. Click **Create Signal**.

The new custom signal shows up in the **Configuration** list of the **Create a Custom Matchmaking Configuration** page.

### Create a custom attribute

> [!info]
> You can create a total of 5 server attributes and 5 player attributes per game.

Attributes are properties associated with players and servers, like skill level and game mode preferences. If you want to create and use custom signals, you must first create custom attributes. You can create player or server attributes.

For more information about the difference between player and server attributes, see [[30 Official Roblox Docs/Matchmaking/Attributes and signals#Custom attributes|Custom attributes]].

##### Player attributes

To create a player attribute:

1. In the **Custom Matchmaking** page, select the **Attributes** tab and click **Create Attribute**.
2. In the **Create Attribute** page, select **Player Attribute** and enter a unique name for it.
3. Choose a **Data Type** and a **Default Value** for the attribute.
4. Under **Data Store Settings**, select the data store that the attribute data lives in.
5. Enter a **Data Store Key Template** to store the player attribute values. At runtime, the `{UserId}` is replaced by the player's actual user ID.
6. Enter a **Data Store Value Path** so that matchmaking can locate the player attribute value inside a JSON object in the data store you selected.
7. Enter a **Data Store Scope** to specify the scope. If you don't enter a scope, it defaults to global.
8. Click **Save Changes** to save your player attribute.

*(image in the full Top G Vault)*

The new attribute shows up in the **Player Attributes** list of the **Attributes** tab.

##### Server attributes

To create a server attribute:

1. In the **Custom Matchmaking** page, select the **Attributes** tab and click **Create Attribute**.
2. In the **Create Attribute** page, select **Server Attribute** and enter a unique name for it.
3. Choose a **Data Type** and a **Default Value** for the attribute.
4. Click **Save Changes** to save your server attribute.

*(image in the full Top G Vault)*

The new attribute shows up in the **Server Attributes** list of the **Attributes** tab.

## Preview and test server scores

> [!warning]
> Preview server scores are just examples and don't reflect actual game servers.

Preview and test server scoring to see how your configured signal weights impact server selection. You can experiment with different weight combinations to optimize your matchmaking configuration.

When you create a preview, the preview mocks server scores and identifies which mock server has the highest total score and is the best match for the player.

To preview and test, click **Preview and Test** in the **Create a Custom Matchmaking Configuration** page. The preview shows you three mock servers with different scores and highlights the winning server. To see details about the formulas used for scoring, hover over each signal score result for each mock server.

*(image in the full Top G Vault)*

For more information about scoring and weights, see [[30 Official Roblox Docs/Matchmaking/Server scoring|Scoring]].

## Apply a configuration to places

You can apply a matchmaking configuration to as many places as you want inside your game.

To apply a configuration to places:

1. In the **Custom Matchmaking** page, click **Add to Place**.
2. Select a configuration and the place or places you want to apply it to.
3. Click **Save Configuration**.

The places you selected show up in the **Applied Places** list of the **Configuration** tab. You can also add a configuration to places during the creation of that matchmaking configuration.

---
*Source: [Customize your matchmaking configuration](https://create.roblox.com/docs/matchmaking/customize-matchmaking) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
