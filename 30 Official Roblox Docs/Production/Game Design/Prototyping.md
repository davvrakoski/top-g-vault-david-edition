---
title: "Prototyping"
description: "Prototyping"
area: "30 Official Roblox Docs"
cluster: "Production"
source: "https://create.roblox.com/docs/production/game-design/prototyping"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Prototyping*

![](https://www.youtube.com/watch?v=wN4-AERPU9g)

**Prototyping** is an experimental design process where teams iterate and explore preliminary ideas for games before finalizing and working on them as features. The two common prototyping techniques when it comes to Roblox development are [[30 Official Roblox Docs/Production/Game Design/Prototyping#Paper prototyping|paper]] and [[30 Official Roblox Docs/Production/Game Design/Prototyping#Studio prototyping|studio]] prototyping. The primary benefits of prototyping are:

- **Time efficiency:** The value of prototyping is the speed in which you can iterate and explore solutions to potential problems. Prototyping ensures that you detect design flaws, oversights, and unexpected technical requirements in the early stages of pre-production, instead of months into development. The time and energy required to prototype in the early stages of creating a game is less than the time and energy required to fix costly oversights in the later stages.
- **Finding the fun:** Prototyping ensures that the game being designed is actually fun to play. Ideas for games can be abstract, but prototyping forces you to confirm that your vision can be brought to life in the way you imagine.

## Paper prototyping

![](https://www.youtube.com/watch?v=IJSih2t_jso)

**Paper prototyping** is the act of designing a game using physical objects to simulate gameplay and player interaction. Examples include:

- Paper
- Board game pieces
- Dice
- Legos
- Office supplies

*(image in the full Top G Vault)*

*Examples of paper prototyping tools.*

The benefits of paper prototyping are:

- **Iteration speed:** It takes minutes to begin paper prototyping, opposed to days or weeks to create a virtual environment. As a result iteration speed is greatly increased, allowing you to rapidly explore potential solutions and ideas by simply drawing, erasing, or printing more paper.
- **Broader system context:** The abstraction of paper prototyping enables you to interact with more systems in your game without getting weighed down by practical implementation. This freedom to explore system interaction ideas allows you to think of solutions from a design perspective, that you can then test once the prototyping stage is over. Even if it proves to be out of scope or difficult to implement, the initial idea gleamed from the broader system context provided by paper prototyping enables you to discover new creative solutions you might not otherwise have considered.
- **UI/UX Design:** The ease of drawing on paper makes paper prototyping one of the best mediums for exploring optimal UI and UX designs for your game.

    *(image in the full Top G Vault)*

    *Using paper prototyping to explore UI/UX design.*

Despite its benefits, prototyping on paper has drawbacks due to the difference in medium. The detriments of paper prototyping are:

- **Not reusable:** None of the prototyping done with paper prototyping can be used literally in the end result. Everything must be recreated virtually.
- **Simulation limitations:** Simulating unique mechanics and interactions are limited or impossible to create on paper or using physical assets.
- **False positives:** Some activities might prove more fun and engaging using paper and physical assets than doing them on a phone, computer, or console.

## Studio prototyping

![](https://www.youtube.com/watch?v=Q4Cec876KLU)

_Studio prototyping_ is the act of using Roblox Studio to design and iterate the early stages of a game. The benefits of starting directly in Studio for prototyping includes:

- **Rapid Playtesting:** Creating directly in Studio enables you to have a quick playable version of the system in your game that you can easily share with others for feedback.
- **Reusable work:** Creating in directly in Studio allows you to build off your work. Unlike paper prototyping, you don't have to start over when the prototyping period concludes, and can continue working from where you left off.
- **Early technical issues detection:** The abstraction of paper prototyping can result in unrealistic ideas that are impossible to technically implement. Prototyping in Studio forces you to determine if your idea is something you can practically create with the resources available to you.

    *(image in the full Top G Vault)*

    *An early obby prototype made in Roblox Studio.*

Despite its benefits, the limitations of Studio prototyping include:

- **Smaller testing scope:** Due to the time required to script, debug, and replace assets involved in a prototype, the scope to test potential gameplay interactions and systems is limited.
- **Increased iteration time** Due to the increased cost of creating different virtual environments, more time is required to iterate multiple systems in a game.

    *(image in the full Top G Vault)*

    *A more complex prototype made in Roblox Studio.*

## Best practices

The difference between working on a feature and prototyping is scope. Prototyping should be fast and quick, hitting certain aspects of the feature being tested but not the entire feature itself.

When prototyping, have several playtest sessions with your team to confirm your findings. Share your prototype with friends, family, and social media to garner feedback and fresh perspectives. Iterate on your game until you're happy with it.

When prototyping, take extra care to explore the following parts of your game:

- **Core loop:** The core loop is the central gameplay through which an entire game is built. To learn more about core loop design, see [[30 Official Roblox Docs/Production/Game Design/Core loops|Core loops]].
- **UI/UX:** Ensure that your menu interaction input controls are intuitive and well designed. To learn more about UI/UX design, see [[30 Official Roblox Docs/Production/Game Design/UI and UX design|UI and UX]].
- **Game rules:** Get into the details of how your game will function. As an example, if you know that your game will feature a respawn mechanic, explore how long the respawn timer could be, where the player will physically respawn in game, and if there are any factors that could change the rate at which a player can rejoin the fun.
- **Edge cases:** Explore how a player might push the limits of what your game can do. Design solutions and stop gaps to either prevent or encourage this behavior.

---
*Source: [Prototyping](https://create.roblox.com/docs/production/game-design/prototyping) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
