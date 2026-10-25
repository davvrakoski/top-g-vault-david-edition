---
title: "Stream in immersion"
description: "Explains the use of instance streaming The Mystery of Duvall Drive."
area: "30 Official Roblox Docs"
cluster: "Resources"
source: "https://create.roblox.com/docs/resources/the-mystery-of-duvall-drive/stream-in-immersion"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Explains the use of instance streaming The Mystery of Duvall Drive.*

Roblox Studio is a powerful engine that can create games on a wide variety of platforms, but even some high-end phones may struggle to load all of our content at once. To address this, we used [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming|streaming]] to achieve the highest level of quality possible on a wide spectrum of devices. Streaming allowed us to author all our content in one place and dynamically load smaller portions of the content visible to the user.

*(image in the full Top G Vault)*

*Streaming enabled on the workspace itself, with default settings*

## Technical considerations

When enabling streaming in your game, there are a few things to consider to ensure that your game runs well and that you maximize the benefits of the streaming feature:

1. **Are there scripts or elements that are reliant on another piece of content?** If so, one or more of your dependencies may not be loaded at certain times.
2. **Are there scripts that scan the workspace when the game starts?** Client scripts should not rely on finding all instances they require at the time a game starts and this is not a recommended practice.
3. **Does your game suffer visually if some content doesn't display at the correct time?** There are various techniques and tricks to create a [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Stream in immersion#Streaming-friendly level design|streaming-friendly environment]] and ways to use [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Stream in immersion#Play with perspective|perspective]] to your advantage.

When creating The Mystery of Duvall Drive, we encountered all three of these problems and were able to work around them by using a combination of careful script design and cleverly applied set dressing and world layout. When working with streaming on your own game, remember you can tune your streaming min/max distance to what suits your game and adjust a variety of [[30 Official Roblox Docs/Workspace/Streaming/Instance streaming#Streaming properties|highly customizable options]].

*(image in the full Top G Vault)*

*Streaming with a max distance of 64 stud units.*

*(image in the full Top G Vault)*

*Streaming with a max distance of 1024 stud units.*

## Streaming-friendly level design

To create an immersive environment, players have to be consistently surrounded by the world we built for them. When using instance streaming, we had to make sure that players wouldn't see unexpected content, such as seeing the "end of the world" if there weren't any visual assets loaded in their instance streaming range.

Since distant trees behind the house and other blocking geometry like hills and mountains would be out of range, we had to find a solution to keep players from seeing the horizon and breaking their immersion. To address this, we added nearby blocking geometry along all areas of the player's path and designed the path that would wind to effectively hide the lack of content in the distance. We placed blocking geometry in a way that ensures the player would be surrounded by streamable visual assets at any point on the path. This aligned well with our original design to create a windy driveway and is a prime example of thoughtful level design that incorporates aesthetic and technical applications.

*(image in the full Top G Vault)*

*The player starts surrounded by nearby trees and bushes to help hide the fact distant content hasn't loaded yet. The winding path keeps much of the content hidden until players are close enough to load the asset.*

## Play with perspective

There are some cases where content that a player would expect to see from far away is too far from the camera, such as our [[30 Official Roblox Docs/Resources/The Mystery of Duvall Drive/Develop a moving world#Create the storm|storm in the sky]]. We wanted players to see this large phenomenon, but it would break the immersion if the sky storm didn't exist when the player was too far away to load the asset. It would also be jarring to see a large asset suddenly load in when the player got close enough to an object that they should've seen further away. We tried to minimize this by playing with perspective and making sure the models in the sky were large enough to be within the bounds of the player's streaming distance.

*(image in the full Top G Vault)*

Another solution was to increase the vertical height of the trees surrounding the player when they weren't close enough to the storm. This solved the situation where the player is too far away to load the asset but would still expect to see it in their line of vision. Big trees are common in our Pacific Northwest setting, and this adjustment helped solve the problem with minimal concessions to our aesthetic and design.

*(image in the full Top G Vault)*

*Treelines help to obscure some of the content not loading in yet.*

---
*Source: [Stream in immersion](https://create.roblox.com/docs/resources/the-mystery-of-duvall-drive/stream-in-immersion) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
