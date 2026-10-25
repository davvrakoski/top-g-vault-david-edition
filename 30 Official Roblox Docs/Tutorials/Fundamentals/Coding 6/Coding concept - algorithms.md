---
title: "Coding concept - algorithms"
description: "Algorithms in computer science are a series of steps used to determine an outcome. This is used for computer science AP CSP lessons."
area: "30 Official Roblox Docs"
cluster: "Tutorials"
source: "https://create.roblox.com/docs/tutorials/fundamentals/coding-6/coding-concept-algorithms"
license: "CC-BY-4.0 (Roblox Corporation)"
tags: [official-docs, roblox]
cssclasses: [tg-a30]
---

*Algorithms in computer science are a series of steps used to determine an outcome. This is used for computer science AP CSP lessons.*

An **algorithm** uses a series of steps to determine an outcome. Steps can be a set of directions, comparisons, or even a mathematical formula.

Your daily life is full of algorithms that you use without thinking about it. They help you make decisions, create things, and solve problems.

**Real life examples:**

- Checking if you have enough money to buy a snack.
- Getting dressed in the morning.
- Drawing stick figures.

**Coding examples:**

- Checking if a skill level is high enough to use an item.
- Sorting a list of items into alphabetical order.
- A player standing on lava loses 5 health every second. If they reach 0, they respawn.

> [!success]
> For an offline activity, try using this combination of art and computer science to create an algorithm that makes stick figures.
>
> - Have everyone draw a stick figure.
> - Have everyone write down the steps they took.
> - Pair up students and have one student direct the second student using the directions they wrote down previously.

## Create algorithms in code

In real life, we don't usually think about the algorithms we use everyday. Computers however, need algorithms to be coded step-by-step and use at least one of three methods to solve a problem or produce an outcome.

| Methodology | Example |
| --- | --- |
| **Selection** - Uses conditional statements such as if/then to determine an output. | `    if time == 0 then`<br>`    	stopLightColor = red`<br>`    end` |
| **Sequencing** - A set of precise steps. | `    local function createBridge()`<br>`      create new block`<br>`      size block`<br>`      set color`<br>`      rotate`<br>`      set location`<br>`      parent to workspace`<br>`    end` |
| **Iteration** - Repeats parts of the code as necessary, such as in for loops or multiplication. | `    for countDown = 10, 1, -1 do`<br>`    	time -= 1`<br>`    	task.wait(1)`<br>`    end` |

## Combine algorithms

Much like larger problems can be broken into smaller problems, some algorithms can be broken down into a series of smaller algorithms.

*(image in the full Top G Vault)*

Think of your real-life morning time algorithm to get dressed. If that's your main algorithm, it might use one algorithm for picking out your clothes, and a second algorithm for putting clothes on.

```lua title="Getting Dressed Pseudocode"
-- First algorithm for picking clothes
local function pickClothes()
    pick top clothing
    pick bottom clothing
    pick Socks
    pick Shoes
end

-- Second algorithm for putting clothes on

local function putOnClothes()
    put on top clothing
    put on bottom clothing
    put on socks
    put on shoes
end

-- Main algorithm, calls pickClothes()and putOnClothes()
local function getDressed()
    pickClothes()
    putOnClothes()
end
```

> [!success]
> For an optional challenge, try and figure out what are additional algorithms `pickClothes()` might use?
>
> - Check the weather.
> - Check if clothes are clean.
> - Check if clothes match.

## Summary

**Algorithms** are predefined steps that provide an outcome. In daily life, algorithms solve problems like getting dressed, going to work, or making a cake. In code, algorithms solve problems like managing websites, handling traffic congestion, or running game mechanics. To complete their goal, algorithms will often call on other algorithms.

Algorithms use three different ways to come to a conclusion; **selection**, **iteration**, and **sequencing**. Selection uses conditionals such as if/then statements. Iteration repeats parts of the code as necessary. Sequencing uses a series of steps to produce a result.

---
*Source: [Coding concept - algorithms](https://create.roblox.com/docs/tutorials/fundamentals/coding-6/coding-concept-algorithms) (Roblox Creator Docs). © Roblox Corporation, licensed CC BY 4.0; code samples MIT. Converted for Obsidian; changes: formatting only.*
